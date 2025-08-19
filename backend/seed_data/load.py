import json
from backend.config import get_connection

def load_data():
    conn=get_connection()
    cursor = conn.cursor()  # Create a cursor object to execute SQL queries

    with open("backend/seed_data/careers.json") as f:
        careers = json.load(f)
        for c in careers:
            cursor.execute('INSERT INTO careers (name,summary) values (%s,%s)',(c['name'],c['summary']))

    with open("backend/seed_data/skills.json") as f:
        skills = json.load(f)
        for s in skills:
            cursor.execute('INSERT INTO skills (name,description) values (%s,%s)',(s['name'],s['description'])) 

    with open("backend/seed_data/users.json") as f:
        users = json.load(f)
        for u in users:
            cursor.execute('INSERT INTO users (name,email) values (%s,%s)',(u['name'],u['email']))

    with open("backend/seed_data/users_skills.json") as f:
        user_skills = json.load(f)
        for us in user_skills:
            cursor.execute('INSERT INTO users_skills (user_id,skill_id,level) values (%s,%s,%s)',(us['user_id'],us['skill_id'],us['level']))


    with open("backend/seed_data/careers_skills.json") as f:
        career_skills = json.load(f)
        for cs in career_skills:
            cursor.execute('INSERT INTO careers_skills (career_id,skill_id,req_level) values (%s,%s,%s)',(cs['career_id'],cs['skill_id'],cs['req_level']))

    
    conn.commit()  # Commit the changes to the database
    cursor.close()
    conn.close()

if __name__ == "__main__":
    load_data()  # Call the load_data function to execute the data loading process