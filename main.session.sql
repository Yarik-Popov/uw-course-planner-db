
--@block
CREATE TABLE Student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    start_term VARCHAR(4) NOT NULL,
    major VARCHAR(255) NOT NULL
);

--@block
CREATE TABLE Term (
    id INT PRIMARY KEY AUTO_INCREMENT,
    term_id VARCHAR(2) NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id)
);

--@block
CREATE TABLE Course (
    id INT PRIMARY KEY AUTO_INCREMENT,
    term_id INT NOT NULL,
    grade INT,
    course_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (term_id) REFERENCES Term(id)
);

--@block
INSERT INTO student(username, start_term, major) 
VALUES
    ('yepopov@uwaterloo.ca', '022F', 'CS'),
    ('jsmith@uwaterloo.ca', '002W', 'Physics'),
    ('b123abc@uwaterloo.ca', '999S', 'Math and BBA');


--@block
INSERT INTO term (term_id, student_id) 
VALUES
    ('1A', 1),
    ('1B', 1),
    ('W1', 2);

--@block
INSERT INTO Course (term_id, grade, course_id) 
VALUES
    (2, -1, 'Math136'),
    (1, 100, 'Math137P'),
    (3, 69, 'CS341');

--@block
SELECT * FROM student;

--@block
SELECT * FROM term;

--@block
SELECT * FROM course;
