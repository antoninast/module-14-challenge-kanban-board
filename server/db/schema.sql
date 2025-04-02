-- DROP DATABASE
DROP DATABASE IF EXISTS kanban_db;

-- CREATE DATABASE
CREATE DATABASE kanban_db;

-- Create a table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) UNIQUE NOT NULL
);

-- Insert some sample data
INSERT INTO users (username, password) VALUES ('JollyGuru', 'password');
INSERT INTO users (username, password) VALUES ('SunnyScribe', 'password1');
INSERT INTO users (username, password) VALUES ('RadiantComet', 'password2');


CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    assignedUserId INTEGER,
    FOREIGN KEY (assignedUserId)
    REFERENCES users(id)
);


INSERT INTO tickets (name, status, description, assignedUserId)
VALUES ('Design landing page', 'In Progress', 'Create wireframes and mockups for the landing page.', 1);

INSERT INTO tickets (name, status, description, assignedUserId)
VALUES ('Set up project repository', 'Done', 'Create a new repository on GitHub and initialize it with a README file.', 2);

INSERT INTO tickets (name, status, description, assignedUserId)
VALUES ('Implement authentication', 'Todo', 'Set up user authentication using JWT tokens.', 1);

INSERT INTO tickets (name, status, description, assignedUserId)
VALUES ('Test the API', 'Todo', 'Test the API using Insomnia.', 1);

INSERT INTO tickets (name, status, description, assignedUserId)
VALUES ('Deploy to production', 'Done', 'Deploy the application to Render.', 2);
