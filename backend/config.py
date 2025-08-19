import mysql.connector

# Connects to the database through the provided details
def get_connection():
    return mysql.connector.connect(
        host='localhost',
        user='root',
        password='Krishna721',
        database='career_advisor'
    )