CREATE DATABASE Management;
USE Management;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT, Name VARCHAR(50), Gender VARCHAR(1), Age INT, Grade VARCHAR(10), MathScore INT, 
	ScienceScore INT, EnglishScore INT);
    INSERT INTO Student (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES ('Arjun', 'M', 16, 'A', 92, 88, 90);
    INSERT INTO Student (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES ('Swetha', 'F', 15, 'B', 76, 82, 78);
    INSERT INTO Student (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES ('Sagar', 'M', 17, 'C', 65, 70, 68);
    INSERT INTO Student (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES ('Krithika', 'F', 16, 'A', 91, 94, 89);
  INSERT INTO Student (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES ('Shreya', 'F', 17, 'C', 60, 65, 70);
  INSERT INTO Student (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES ('Mohith', 'M', 15, 'B', 80, 75, 85);
  INSERT INTO Student (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES ('Karan', 'M', 16, 'B', 78, 81, 79);
  INSERT INTO Student (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES ('Darshini', 'F', 15, 'A', 93, 90, 92);
  INSERT INTO Student (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES ('Rohith', 'M', 17, 'A', 84, 79, 83);
  INSERT INTO Student (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES ('Kamali', 'F', 16, 'C', 67, 72, 69);
  SELECT * FROM Student;
  SELECT AVG(MathScore) AS AvgMathScore, AVG(ScienceScore) AS AvgScienceScore, AVG(EnglishScore) AS AvgEnglishScore FROM Student;
  SELECT StudentID, Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore, (MathScore + ScienceScore + EnglishScore)
 AS TotalScore FROM Student WHERE (MathScore + ScienceScore + EnglishScore) = (SELECT MAX(MathScore + ScienceScore + EnglishScore) FROM Student);
 SELECT Grade, COUNT(*) AS NumberOfStudent FROM Student GROUP BY Grade;
 SELECT Gender, AVG(MathScore) AS AvgMathScore, AVG(ScienceScore) AS AvgScienceScore, AVG(EnglishScore) AS AvgEnglishScore FROM Student GROUP BY Gender;
 SELECT StudentID, Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore FROM Student WHERE MathScore > 80;
 UPDATE Student SET Grade = 'B' WHERE StudentID = 9;
 SELECT * FROM Student;
 CREATE TABLE Courses (courseid INT PRIMARY KEY AUTO_INCREMENT, coursename VARCHAR(100), coursedescription TEXT);
 CREATE TABLE Enrolments (enrolmentid INT PRIMARY KEY AUTO_INCREMENT, studentid INT, courseid INT, enrolmentdate 
DATE, FOREIGN KEY (studentid)REFERENCES Student(StudentID), FOREIGN KEY (courseid) REFERENCES Courses(courseid));
INSERT INTO Courses (coursename, coursedescription) VALUES('Data Science', 'Intro to data science');
INSERT INTO Courses (coursename, coursedescription) VALUES('Web Development', 'Front-end and back-end basics');
INSERT INTO Courses (coursename, coursedescription) VALUES('SQL Basics', 'Intro to databases');
INSERT INTO Enrolments (studentid, courseid, enrolmentdate) VALUES(1, 1, '2024-06-01');
INSERT INTO Enrolments (studentid, courseid, enrolmentdate) VALUES(1, 2, '2024-06-02');
INSERT INTO Enrolments (studentid, courseid, enrolmentdate) VALUES(2, 1, '2024-06-03');
INSERT INTO Enrolments (studentid, courseid, enrolmentdate) VALUES(3, 3, '2024-06-04');
select * from courses;
select * from enrolments;
SELECT s.Name AS StudentName, c.CourseName FROM Student s INNER JOIN Enrolments e ON s.StudentID = e.StudentID INNER JOIN Courses c ON e.CourseID = c.CourseID;
SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS NumberOfStudents FROM Courses c LEFT JOIN Enrolments e ON c.CourseID = e.CourseID GROUP BY c.CourseID, c.CourseName;
SELECT s.Name, COUNT(e.CourseID) AS NumberOfCourses FROM Enrolments e JOIN Student s ON e.StudentID = s.StudentID GROUP BY s.StudentID, s.Name HAVING COUNT(e.CourseID) > 1;
SELECT c.CourseID, c.CourseName FROM Courses c LEFT JOIN Enrolments e ON c.CourseID = e.CourseID WHERE e.EnrolmentID IS NULL;
SELECT Name, (MathScore + ScienceScore + EnglishScore) AS TotalScore FROM Student ORDER BY    TotalScore DESC LIMIT 5;
SELECT AVG(MathScore) AS AverageMathScore FROM Student WHERE MathScore > 70;
SELECT AVG(MathScore + ScienceScore + EnglishScore) AS AverageTotalScore  FROM Student WHERE (MathScore + ScienceScore + EnglishScore) 
BETWEEN 200 AND 250;
SELECT MAX(MathScore) AS SecondHighestMathScore FROM Student WHERE MathScore < (SELECT MAX(MathScore) FROM Student);
SELECT StudentID,Name,(MathScore + ScienceScore + EnglishScore) AS TotalScore,RANK() OVER (ORDER BY (MathScore + ScienceScore + EnglishScore)
 DESC) AS StudentRank FROM Student;
 SELECT StudentID,Name,MathScore,SUM(MathScore) OVER (ORDER BY StudentID) AS RunningTotalMathScore FROM Student;
  SELECT StudentID, Name, MathScore, ScienceScore, EnglishScore,(MathScore + ScienceScore + EnglishScore) AS TotalScore,
ROUND(AVG(MathScore + ScienceScore + EnglishScore) OVER (), 2) AS OverallAverageScore FROM Student;
SELECT StudentID,Name,MathScore,DENSE_RANK() OVER (ORDER BY MathScore DESC) AS MathRank FROM Student;
SELECT StudentID, Name, Grade,COUNT(*) OVER (PARTITION BY Grade) AS StudentsInSameGrade FROM Student;
SELECT StudentID,Name,(MathScore + ScienceScore + EnglishScore) AS TotalScore,ROUND(((MathScore + ScienceScore + EnglishScore) / 3.0), 2)
 AS Percentage,PERCENT_RANK() OVER (ORDER BY (MathScore + ScienceScore + EnglishScore)) AS PercentileRank FROM Student;
 SELECT StudentID,Name,(MathScore + ScienceScore + EnglishScore) AS TotalScore,CASE WHEN (MathScore + ScienceScore + EnglishScore) 
 >= 270 THEN 'A'WHEN (MathScore + ScienceScore + EnglishScore) >= 240 THEN 'B' WHEN (MathScore + ScienceScore + EnglishScore)
 >= 210 THEN 'C' ELSE 'D (Fail)' END AS  AssignedGrade FROM Student ;
SELECT StudentID,Name,MathScore,CASE WHEN MathScore >= 40 THEN 'Pass' ELSE 'Fail' END AS MathStatus,ScienceScore, CASE 
  WHEN ScienceScore >= 40 THEN 'Pass' ELSE 'Fail' END AS ScienceStatus, EnglishScore, CASE WHEN EnglishScore >= 40 THEN 'Pass' ELSE
 'Fail' END AS EnglishStatus FROM Student;
 ALTER TABLE Student
ADD COLUMN LastUpdated DATE;
ALTER TABLE Student
ADD COLUMN Status VARCHAR(10) DEFAULT 'Active';
UPDATE Student
SET LastUpdated = '2024-01-01'
WHERE StudentID IN (1, 3);
UPDATE Student
SET LastUpdated = CURRENT_DATE
WHERE StudentID NOT IN (1, 3);
SET SQL_SAFE_UPDATES = 0;
UPDATE Student
SET Status = 'Active';
SELECT * FROM Student;
UPDATE Student SET Status = 'Inactive' WHERE (MathScore + ScienceScore + EnglishScore) < 200;
SELECT * FROM Student;
DELETE FROM Student
WHERE Status = 'Inactive';
SELECT * FROM Student;
DELETE FROM enrolments
WHERE StudentID IN (
  SELECT StudentID FROM Student
  WHERE LastUpdated < '2025-01-01'
);
DELETE FROM Student
WHERE LastUpdated < '2025-01-01';
SELECT * FROM Student;
SET SQL_SAFE_UPDATES = 1;
USE Management;

DROP TABLE IF EXISTS Enrolments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Student;
SHOW TABLES;
SELECT * FROM Student;
SELECT * FROM Enrolments;
SELECT * FROM Courses;
DROP DATABASE IF EXISTS Management;
SHOW DATABASES;
