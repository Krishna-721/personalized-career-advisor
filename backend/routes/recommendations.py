from flask import Blueprint, jsonify
from backend.models.models import get_all_careers, get_career_skills, match_user_to_career

recommendations_bp = Blueprint('recommendations', __name__)  # Recommendations Blueprint

@recommendations_bp.route('/careers', methods=['GET'])
def list_careers():
    return jsonify(get_all_careers())

@recommendations_bp.route('/careers/<int:career_id>/skills', methods=['GET'])
def list_career_skills(career_id):
    return jsonify(get_career_skills(career_id))

@recommendations_bp.route('/users/<int:user_id>/careers/<int:career_id>/match', methods=['GET'])
def match_user_career(user_id, career_id):
    return jsonify(match_user_to_career(user_id, career_id))
