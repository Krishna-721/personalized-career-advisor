-- Drop existing tables if they exist (clean slate)
DROP TABLE IF EXISTS recommendations;
DROP TABLE IF EXISTS user_skills;
DROP TABLE IF EXISTS careers;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS users;


CREATE DATABASE career_advisor;

USE career_advisor;

-- ========================
-- USERS TABLE
-- ========================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email, password) VALUES
('Alice Johnson', 'alice@example.com', 'hashed_pw1'),
('Bob Smith', 'bob@example.com', 'hashed_pw2'),
('Charlie Brown', 'charlie@example.com', 'hashed_pw3'),
('David Wilson', 'david@example.com', 'hashed_pw4'),
('Paul Lee', 'paulee@example.com', 'hashed_pw5');

-- ========================
-- SKILLS TABLE
-- ========================
CREATE TABLE skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO skills (skill_name) VALUES
('Python'),
('Machine Learning'),
('Data Analysis'),
('Web Development'),
('Cybersecurity'),
('Cloud Computing'),
('UI/UX Design'),
('Digital Marketing'),
('Project Management'),
('Database Management');

-- ========================
-- CAREERS TABLE
-- ========================
CREATE TABLE careers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    career_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

INSERT INTO careers (career_name, description) VALUES
('Data Scientist', 'Works with large data sets to derive insights and build models.'),
('Software Engineer', 'Designs, builds, and maintains software applications.'),
('Cybersecurity Analyst', 'Protects systems and networks from cyber threats.'),
('UI/UX Designer', 'Designs user interfaces and improves user experiences.'),
('Marketing Specialist', 'Develops and executes marketing strategies.'),
('Cloud Engineer', 'Manages and deploys applications on cloud infrastructure.');

-- ========================
-- USER_SKILLS TABLE (many-to-many relation)
-- ========================
CREATE TABLE user_skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    skill_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

INSERT INTO user_skills (user_id, skill_id) VALUES
(1, 1), -- Alice knows Python
(1, 2), -- Alice knows ML
(1, 3), -- Alice knows Data Analysis
(2, 4), -- Bob knows Web Development
(2, 7), -- Bob knows UI/UX Design
(3, 5), -- Charlie knows Cybersecurity
(3, 10); -- Charlie knows DB Management

UPDATE user_skills SET user_id = 4 WHERE user_id = 1; -- David has same skills as Alice
UPDATE user_skills SET user_id = 5 WHERE user_id = 2; -- Paul has same skills as Bob

-- ========================
-- RECOMMENDATIONS TABLE
-- ========================
CREATE TABLE recommendations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    career_id INT,
    reason TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (career_id) REFERENCES careers(id) ON DELETE CASCADE
);

INSERT INTO recommendations (user_id, career_id, reason) VALUES
(1, 1, 'Alice has strong Python, ML, and Data Analysis skills -> Data Scientist.'),
(2, 2, 'Bob has Web Dev and UI/UX skills -> Software Engineer.'),
(2, 4, 'Bob has UI/UX Design skills -> UI/UX Designer.'),
(3, 3, 'Charlie has Cybersecurity knowledge -> Cybersecurity Analyst.'),
(3, 6, 'Charlie knows Databases and Cloud -> Cloud Engineer.'),
(4, 1, 'David has Python and Data Analysis skills -> Data Scientist.'),
(5, 2, 'Paul has Web Development and UI/UX skills -> Software Engineer.'),
(5, 4, 'Paul has UI/UX Design skills -> UI/UX Designer.');
-- ======================== --

