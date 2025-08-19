# This route handles user profile-related actions
from flask import Blueprint, jsonify
from backend.models.models import get_all_skills

profile_bp = Blueprint('profile', __name__)  # Profile Blueprint 

@profile_bp.route('/skills',methods=['GET'])
def list_skills():
    return jsonify(get_all_skills())



