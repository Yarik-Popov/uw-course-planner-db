
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
    (2, 50, 'Bus101');

--@block
SELECT * FROM student;

--@block
SELECT * FROM term;

--@block
SELECT * FROM course;

--@block This makes sure no course can appear twice in a given term
ALTER TABLE course ADD UNIQUE (term_id, course_id);

--@block This makes sure that no student has the same term id twice
ALTER TABLE Term ADD UNIQUE (term_id, student_id);

--@block Queries all the related information for a given student
SELECT * FROM student 
INNER JOIN term ON student.id = term.student_id 
INNER JOIN course ON term.id = course.term_id
WHERE student.id = 1
ORDER BY student.id, term.id, course.id;

--@block
SELECT * 
    FROM student
    INNER JOIN term 
    ON student.id = term.student_id;

--@block
ALTER TABLE Term RENAME COLUMN term_id TO term_name;

--@block Find the average overall grade for a given student
SELECT AVG(course.grade) FROM student 
INNER JOIN term ON student.id = term.student_id 
INNER JOIN course ON term.id = course.term_id
WHERE student.id = 1 AND course.grade != -1;