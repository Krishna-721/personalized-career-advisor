from backend.config import get_connection

def get_all_careers():
    # Fetch all careers from the database
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM careers')  #this fetches all careers
    careers=cursor.fetchall()
    cursor.close()
    conn.close()
    return careers

def get_all_skills():
    # Fetch all skills from the database
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM skills')  #this fetches all skills
    skills=cursor.fetchall()
    cursor.close()
    conn.close()
    return skills

def get_all_users():
    # Fetch all users from the database
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM users')  #this fetches all users
    users=cursor.fetchall()
    cursor.close()
    conn.close()
    return users

def get_user_skills(user_id):
    # Fetch skills for a specific user
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('''
        SELECT s.name, us.level
        FROM users_skills us
        JOIN skills s ON us.skill_id = s.id
        WHERE us.user_id = %s;
    ''', (user_id,))
    user_skills = cursor.fetchall()
    cursor.close()
    conn.close()
    return user_skills

def get_career_skills(career_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('''
        SELECT s.name, cs.req_level
        FROM careers_skills cs
        JOIN skills s ON cs.skill_id = s.id
        WHERE cs.career_id = %s;
    ''', (career_id,))
    career_skills = cursor.fetchall()
    cursor.close()
    conn.close()
    return career_skills
