 USE StudentManagement;
CREATE TABLE Courses (courseid INT PRIMARY KEY AUTO_INCREMENT, coursename VARCHAR(100), coursedescription TEXT);
CREATE TABLE Enrolments (enrolmentid INT PRIMARY KEY AUTO_INCREMENT, studentid INT, courseid INT, enrolmentdate 
DATE, FOREIGN KEY (studentid)REFERENCES Students(StudentID), FOREIGN KEY (courseid) REFERENCES Courses(courseid));
INSERT INTO Courses (coursename, coursedescription) VALUES('Data Science', 'Intro to data science');
INSERT INTO Courses (coursename, coursedescription) VALUES('Web Development', 'Front-end and back-end basics');
INSERT INTO Courses (coursename, coursedescription) VALUES('SQL Basics', 'Intro to databases');
INSERT INTO Enrolments (studentid, courseid, enrolmentdate) VALUES(1, 1, '2024-06-01');
INSERT INTO Enrolments (studentid, courseid, enrolmentdate) VALUES(1, 2, '2024-06-02');
INSERT INTO Enrolments (studentid, courseid, enrolmentdate) VALUES(2, 1, '2024-06-03');
INSERT INTO Enrolments (studentid, courseid, enrolmentdate) VALUES(3, 3, '2024-06-04');
select * from courses;
select * from enrolments;
SELECT s.Name AS StudentName, c.CourseName FROM Students s INNER JOIN Enrolments e ON s.StudentID = e.StudentID INNER JOIN Courses c ON e.CourseID = c.CourseID;
SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS NumberOfStudents FROM Courses c LEFT JOIN Enrolments e ON c.CourseID = e.CourseID GROUP BY c.CourseID, c.CourseName;
SELECT s.Name, COUNT(e.CourseID) AS NumberOfCourses FROM Enrolments e JOIN Students s ON e.StudentID = s.StudentID GROUP BY s.StudentID, s.Name HAVING COUNT(e.CourseID) > 1;
SELECT c.CourseID, c.CourseName FROM Courses c LEFT JOIN Enrolments e ON c.CourseID = e.CourseID WHERE e.EnrolmentID IS NULL;
