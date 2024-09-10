CREATE DATABASE IF NOT EXISTS student_information;

USE student_information;

CREATE TABLE Student(
    personId int PRIMARY KEY UNIQUE,
    lastName varchar(90),
    firstName varchar(90)
);

CREATE TABLE Address(
    addressId int PRIMARY KEY UNIQUE,
    personId int UNIQUE,
    city varchar(90),
    stateName varchar(90),
    FOREIGN KEY (personId)REFERENCES Student(personId)
)

INSERT INTO Student (personId, lastName, firstName)
VALUES 
(1, 'Doe', 'John'),
(2, 'Smith', 'Jane'),
(3, 'Johnson', 'Mark'),
(4, 'Brown', 'Lucy'),
(5, 'Williams', 'Michael'),
(6, 'Davis', 'Laura'),
(7, 'Martinez', 'Carlos'),
(8, 'Garcia', 'Maria'),
(9, 'Miller', 'James'),
(10, 'Wilson', 'Emily');

-- Insert 10 records into the Address table
-- Note that not every person in the Student table has an address
INSERT INTO Address (addressId, personId, city, stateName)
VALUES 
(1, 1, 'New York', 'New York'),
(2, 3, 'Los Angeles', 'California'),
(3, 5, 'Chicago', 'Illinois'),
(4, 6, 'Houston', 'Texas'),
(5, 7, 'Phoenix', 'Arizona'),
(6, 8, 'Philadelphia', 'Pennsylvania'),
(7, 10, 'San Antonio', 'Texas'),
(8, 2, 'San Diego', 'California'),
(9, 4, 'Dallas', 'Texas'),
(10, 9, 'San Jose', 'California');