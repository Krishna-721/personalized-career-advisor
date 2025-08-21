from flask import Blueprint, jsonify
from backend.services.ai_advisor import generate_test_advice

test_bp = Blueprint('test', __name__)

@test_bp.route('/test-gemini', methods=['GET'])
def test_gemini():
    return jsonify(generate_test_advice())
