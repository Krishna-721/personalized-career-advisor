-- Drop and recreate database
DROP DATABASE IF EXISTS career_advisor;
CREATE DATABASE career_advisor;
USE career_advisor;

-- ===========================
-- Users Table
-- ===========================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- ===========================
-- Skills Table
-- ===========================
CREATE TABLE skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- ===========================
-- Careers Table
-- ===========================
CREATE TABLE careers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- ===========================
-- User ↔ Skills
-- ===========================
CREATE TABLE user_skills (
    user_id INT,
    skill_id INT,
    level INT CHECK (level BETWEEN 1 AND 5),
    PRIMARY KEY (user_id, skill_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

-- ===========================
-- Career ↔ Skills
-- ===========================
CREATE TABLE career_skills (
    career_id INT,
    skill_id INT,
    req_level INT CHECK (req_level BETWEEN 1 AND 5),
    PRIMARY KEY (career_id, skill_id),
    FOREIGN KEY (career_id) REFERENCES careers(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

-- ===========================
-- Insert Users (10 Students)
-- ===========================
INSERT INTO users (name, email) VALUES
('Aarav Mehta', 'aarav@example.com'),
('Priya Sharma', 'priya@example.com'),
('Rohan Kumar', 'rohan@example.com'),
('Sneha Patel', 'sneha@example.com'),
('Vikram Singh', 'vikram@example.com'),
('Ananya Iyer', 'ananya@example.com'),
('Kunal Verma', 'kunal@example.com'),
('Meera Nair', 'meera@example.com'),
('Arjun Gupta', 'arjun@example.com'),
('Divya Reddy', 'divya@example.com');

-- ===========================
-- Insert Skills (15)
-- ===========================
INSERT INTO skills (name) VALUES
('Python'),
('SQL'),
('Data Analysis'),
('Machine Learning'),
('Communication'),
('Problem Solving'),
('Cloud Computing'),
('Web Development'),
('UI/UX Design'),
('Digital Marketing'),
('Cybersecurity'),
('Networking'),
('Project Management'),
('Java'),
('Statistics');

-- ===========================
-- Insert Careers (7)
-- ===========================
INSERT INTO careers (name, description) VALUES
('Data Scientist', 'Analyze complex datasets to extract insights and build predictive models.'),
('Software Engineer', 'Design, develop, and maintain software applications.'),
('Cloud Engineer', 'Manage and optimize cloud infrastructure and services.'),
('UI/UX Designer', 'Design intuitive, user-friendly interfaces and experiences.'),
('Digital Marketer', 'Promote products and services using online marketing strategies.'),
('Business Analyst', 'Translate business needs into technical requirements using data.'),
('Cybersecurity Analyst', 'Protect systems and data from security threats and attacks.');

-- ===========================
-- Insert User Skills (Realistic)
-- ===========================
INSERT INTO user_skills (user_id, skill_id, level) VALUES
-- Aarav (Data Science enthusiast)
(1, 1, 4), (1, 2, 3), (1, 3, 4), (1, 4, 3), (1, 15, 4),
-- Priya (Software Engineer)
(2, 1, 3), (2, 14, 4), (2, 8, 4), (2, 6, 5),
-- Rohan (Cloud Engineer)
(3, 7, 5), (3, 2, 3), (3, 12, 4), (3, 5, 3),
-- Sneha (UI/UX Designer)
(4, 9, 5), (4, 5, 4), (4, 8, 3), (4, 13, 3),
-- Vikram (Cybersecurity)
(5, 11, 5), (5, 12, 4), (5, 2, 3), (5, 6, 4),
-- Ananya (Digital Marketing)
(6, 10, 5), (6, 5, 4), (6, 13, 3),
-- Kunal (Business Analyst)
(7, 2, 4), (7, 3, 5), (7, 5, 4), (7, 15, 4),
-- Meera (Well-rounded Student)
(8, 1, 3), (8, 2, 3), (8, 5, 4), (8, 6, 4), (8, 13, 3),
-- Arjun (Full-stack Developer)
(9, 1, 4), (9, 14, 4), (9, 8, 5), (9, 6, 4),
-- Divya (Cloud + Cybersecurity)
(10, 7, 4), (10, 11, 4), (10, 2, 3), (10, 12, 3);

-- ===========================
-- Insert Career Skills (Requirements)
-- ===========================
INSERT INTO career_skills (career_id, skill_id, req_level) VALUES
-- Data Scientist
(1, 1, 4), (1, 2, 3), (1, 3, 4), (1, 4, 3), (1, 15, 4),
-- Software Engineer
(2, 1, 3), (2, 14, 4), (2, 8, 4), (2, 6, 4),
-- Cloud Engineer
(3, 7, 4), (3, 2, 3), (3, 12, 3), (3, 5, 3),
-- UI/UX Designer
(4, 9, 5), (4, 5, 4), (4, 8, 3),
-- Digital Marketer
(5, 10, 5), (5, 5, 4), (5, 13, 3),
-- Business Analyst
(6, 2, 4), (6, 3, 5), (6, 5, 4), (6, 15, 4),
-- Cybersecurity Analyst
(7, 11, 5), (7, 12, 4), (7, 2, 3), (7, 6, 4);
