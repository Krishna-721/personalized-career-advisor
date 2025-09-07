from vertexai.preview.generative_models import GenerativeModel
from backend.models.models import match_user_to_all_careers
import json

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

    Write the career advice in STRICT bullet points only, very short and concise.
    Format EXACTLY like this:

    - Summary: one short line
    - Fit %: {recommendations[0]['fit_percent']}%
    - Key Points: 2-3 bullet points, max 6 words each
    - Alternate Path: one short line
    - Future Demand: one short line about demand & regions
    - Tone: motivational, encouraging
    
    Do not write long paragraphs. Keep it point-wise, simple, and short.
    """

    try:
        # Use Gemini Flash
        model = GenerativeModel("gemini-2.5-pro")
        response = model.generate_content(prompt)


        return {
            "user_id": user_id,
            "advice": response.text
        }


    except Exception as e:
        # Fallback if AI not available
        return {"user_id": user_id, "advice": f"Error: {str(e)}"}

def generate_test_advice():
    try:
        vertexai.init(project="lithe-cursor-468713-r3", location="asia-south1")
        model = GenerativeModel("gemini-2.5-pro")
        response = model.generate_content("Say hello! This is a test response from Gemini inside Flask.")
        return {"status": "success", "message": response.text}
    except Exception as e:
        return {"status": "error", "message": str(e)}