CREATE DATABASE DHINESH19;
USE DHINESH19;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(20),
    DepartmentID INT
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(30)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Student VALUES
(1001, 'Arun', 101),
(1002, 'Divya', 102),
(1003, 'Karthik', 101);

INSERT INTO Course VALUES
(201, 'Database Systems'),
(202, 'Data Structures'),
(203, 'Mathematics');

INSERT INTO Enrollment VALUES
(1, 1001, 201),
(2, 1001, 202),
(3, 1002, 203),
(4, 1003, 201);

CREATE VIEW StudentDetails AS
SELECT
    Student.StudentID,
    Student.StudentName,
    Student.DepartmentID,
    Course.CourseID,
    Course.CourseName,
    Enrollment.EnrollmentID
FROM Student
JOIN Enrollment
ON Student.StudentID = Enrollment.StudentID
JOIN Course
ON Enrollment.CourseID = Course.CourseID;

SELECT * FROM StudentDetails;
