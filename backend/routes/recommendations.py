from flask import Blueprint, jsonify
from backend.models.models import get_all_careers, get_career_skills

recommendations_bp = Blueprint('recommendations', __name__)  # Recommendations Blueprint

@recommendations_bp.route('/careers', methods=['GET'])
def list_careers():
    return jsonify(get_all_careers())

@recommendations_bp.route('/careers/<int:career_id>/skills', methods=['GET'])
def list_career_skills(career_id):
    return jsonify(get_career_skills(career_id))
