from flask import Blueprint, jsonify
from backend.models.models import get_all_users, get_user_skills

users_bp = Blueprint('users', __name__)  # Users Blueprint

@users_bp.route('/users', methods=['GET'])
def list_users():
    return jsonify(get_all_users())

@users_bp.route('/users/<int:user_id>/skills/<int:skill_id>', methods=['GET'])
def user_skills(user_id,skill_id):
    return jsonify(get_user_skills(user_id,skill_id))
