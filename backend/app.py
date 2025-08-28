from flask import Flask
from backend.routes.profile import profile_bp
from backend.routes.recommendations import recommendations_bp
from backend.routes.users import users_bp
from backend.routes.test_gemini import test_bp
from flask_cors import CORS


app = Flask(__name__) # Initialize the flask app
CORS(app)

# Registering the blueprints
app.register_blueprint(profile_bp)
app.register_blueprint(recommendations_bp)
app.register_blueprint(users_bp)
app.register_blueprint(test_bp)

if __name__ == "__main__":
    app.run(debug=True) # Run the app in debug mode