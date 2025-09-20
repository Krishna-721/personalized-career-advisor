**🎓 AI-Powered Career Advisor
**
An AI-driven career guidance prototype that matches user skills with career paths and generates personalized career advice using Google Vertex AI.

This project was built as part of the GenAI Exchange Hackathon.

🚀 **Features**

User Authentication – Sign up, login, and manage profiles.

Skills Management – Add, update, and remove skills with levels (Beginner, Intermediate, Expert).

Career Matching – Match user skills with required skills for careers and calculate a fit percentage.

AI-Powered Career Advice – Generate short, structured, motivational career guidance using Google Vertex AI.

REST API – Backend endpoints for users, skills, careers, and recommendations.

**🛠️ Tech Stack
**
Backend: Flask (Python)

Database: MySQL

AI Integration: Google Vertex AI (Gemini Model)

Frontend: React (Work in progress)

**📂 Project Structure
**
backend/
├── app.py # Flask app entry
├── config.py # DB config
├── models/ # Database queries & logic
├── routes/ # API blueprints
├── services/ # AI advisor integration
frontend/
├── src/pages/ # React pages (Login, Signup, Dashboard, Skills, Careers, Advice)
├── src/services/ # API services

⚙️ **Setup Instructions**
1. Clone Repo

git clone https://github.com/your-username/career-advisor.git

cd career-advisor

2. Setup Backend

cd backend
pip install -r requirements.txt

Create a .env file or edit config.py with your MySQL credentials:
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=yourpassword
DB_NAME=career_advisor

Run backend:
flask run

_**👉 Backend will run on: http://127.0.0.1:5000**_

**3. Setup Database
**
Run the following SQL in MySQL:

CREATE DATABASE career_advisor;

-- Users
CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100) UNIQUE,
password VARCHAR(255)
);

-- Skills
CREATE TABLE skills (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100)
);

-- User Skills
CREATE TABLE user_skills (
user_id INT,
skill_id INT,
level INT,
PRIMARY KEY (user_id, skill_id)
);

-- Careers
CREATE TABLE careers (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100)
);

-- Career Skills
CREATE TABLE career_skills (
career_id INT,
skill_id INT,
req_level INT
);

**4. API Endpoints
**
_**User & Auth
**_
POST /auth/signup → Register new user

POST /auth/login → Login user

**_Skills_**

GET /profile/skills → Get all skills

GET /profile/users/<user_id>/skills → Get user’s skills

POST /profile/users/<user_id>/skills → Add/Update skill

DELETE /profile/users/<user_id>/skills/<skill_id> → Remove skill

**_Careers & Recommendations
_**
GET /recommendations/careers → List all careers

GET /recommendations/careers/<career_id>/skills → Skills needed for a career

GET /recommendations/users/<user_id>/careers → Match user with all careers

GET /recommendations/users/<user_id>/career-advice → AI-powered advice

_**Example API Flow
**_
Signup/Login → Create a user.

Add Skills → POST skills for the user.

Match Careers → GET /recommendations/users/<id>/careers.

Get AI Advice → GET /recommendations/users/<id>/career-advice.

_**Demo Video
**_

**Status**

✅ Backend completed and tested via Postman.

⚡ Frontend in progress (React).

🔜 Deployment planned with Google Cloud / Vercel.
