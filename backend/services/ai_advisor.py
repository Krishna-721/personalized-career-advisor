from vertexai.preview.generative_models import GenerativeModel
from backend.models.models import match_user_to_all_careers

import os
import vertexai
from google.oauth2 import service_account

# Path to your key file inside project
KEY_PATH = os.path.join(os.path.dirname(__file__), "..", "vertex-key.json")

# Load credentials
credentials = service_account.Credentials.from_service_account_file(KEY_PATH)

# Initialize Vertex AI with credentials
vertexai.init(
    project="lithe-cursor-468713-r3",   # <-- your project ID
    location="asia-south1",             # or "asia-south1" if you prefer Mumbai region
    credentials=credentials
)


def generate_career_advice(user_id):
    """
    Generate personalized career advice for a user
    using Gemini (Google Cloud Vertex AI).
    Falls back to a mock response if Vertex AI is not set up.
    """

    # Get structured recommendations (fit % for each career)
    recommendations = match_user_to_all_careers(user_id)

    # Build a readable string from recommendations
    rec_text = "\n".join(
        [f"- {r['career_name']} ({r['fit_percent']}% fit)" for r in recommendations]
    )

    # Prompt for Gemini
    prompt = f"""
    A student has the following career match results:
    {rec_text}

    Based on this, provide a personalized career guidance note.
    - Suggest which career looks most promising
    - Highlight missing skills and how to improve them
    - Keep the tone supportive and professional
    """

    try:
        # Initialize Vertex AI
        vertexai.init(project="your-gcp-project-id", location="us-central1")

        # Use Gemini Flash
        model = GenerativeModel("gemini-1.5-pro")


        response = model.generate_content(prompt)
        return {
            "user_id": user_id,
            "advice": response.text
        }

    except Exception as e:
        # Fallback if AI not available
        return {
            "user_id": user_id,
            "advice": "AI not available. Based on your skills, focus on improving your weakest areas to unlock better career options."
        }

def generate_test_advice():
    try:
        vertexai.init(project="lithe-cursor-468713-r3", location="asia-south1")
        model = GenerativeModel("gemini-1.5-pro")
        response = model.generate_content("Say hello! This is a test response from Gemini inside Flask.")
        return {"status": "success", "message": response.text}
    except Exception as e:
        return {"status": "error", "message": str(e)}