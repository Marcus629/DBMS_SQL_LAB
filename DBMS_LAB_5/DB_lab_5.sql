--Part A: Student–Enrollment Relationship

SELECT S.StudentID, S.Name, E.CourseID
FROM Student S
INNER JOIN Enrollment E
ON S.StudentID = E.StudentID;

SELECT S.Name, E.Semester
FROM Student S
INNER JOIN Enrollment E
ON S.StudentID = E.StudentID;

SELECT S.Name, E.Grade
FROM Student S
INNER JOIN Enrollment E
ON S.StudentID = E.StudentID;

-- Part B: Course–Faculty Relationship

SELECT C.CourseName ,C.Credits, F.Name
FROM Course C
INNER JOIN Faculty F
ON C.FacultyID = F.FacultyID;

SELECT C.CourseName , F.Name
FROM Course C
INNER JOIN Faculty F
ON C.FacultyID = F.FacultyID 
WHERE F.FacultyID = 'F02';

SELECT F.Name, F.Designation , C.CourseName
FROM Faculty F
INNER JOIN Course C
ON F.FacultyID = C.FacultyID;

-- Part C: Student–Course–Enrollment Relationship

SELECT S.Name , C.CourseName
FROM Student S
INNER JOIN Enrollment E 
ON S.StudentID = E.StudentID
INNER JOIN Course C 
ON E.CourseID = C.CourseID;

SELECT S.Name , C.CourseName, E.Semester
FROM Student S 
INNER JOIN Enrollment E
ON S.StudentID = E.StudentID
INNER JOIN Course C
ON E.CourseID = C.CourseID;

SELECT S.Name ,C.CourseName, E.Grade
FROM Student S
INNER JOIN Enrollment E
ON S.StudentID = E.StudentID
INNER JOIN Course C
ON E.CourseID = C.CourseID
WHERE Semester = '3';

SELECT C.CourseName
FROM Student S
INNER JOIN Enrollment E
ON S.StudentID = E.StudentID
INNER JOIN Course C
ON E.CourseID = C.CourseID
WHERE S.StudentID = 'S04';

-- Part D: Department-Based JOIN Queries

SELECT S.Name, D.DepartmentID, C.CourseName
FROM Student S 
INNER JOIN Department D 
ON S.DepartmentID = D.DepartmentID
INNER JOIN Course C 
ON D.DepartmentID = C.DepartmentID;

SELECT D.DepartmentID, D.DepartmentName, C.CourseName
FROM Department D
INNER JOIN Course C
ON D.DepartmentID = C.DepartmentID;

SELECT F.Name, D.DepartmentName
FROM Faculty F
INNER JOIN Department D
ON F.DepartmentID = D.DepartmentID;

--Part E: JOIN with Filtering and Sorting


SELECT S.Name ,C.CourseName
FROM Student S 
INNER JOIN Department D
ON S.DepartmentID = D.DepartmentID
INNER JOIN Course C 
ON D.DepartmentID = C.DepartmentID
WHERE S.DepartmentID = 'D01';

SELECT S.Name, C.CourseName
FROM Student S 
INNER JOIN Department D 
ON S.DepartmentID = D.DepartmentID
INNER JOIN Course C 
ON D.DepartmentID = C.CourseID
ORDER BY S.Name ASC;

SELECT F.Name, C.CourseName
FROM Faculty F 
INNER JOIN Course C 
ON F.FacultyID = C.FacultyID
ORDER BY C.Credits DESC;

-- Part F: Analytical JOIN Queries

SELECT C.CourseName, COUNT(E.StudentID) AS Total_Students
FROM Course C
INNER JOIN Enrollment E
ON C.CourseID = E.CourseID
GROUP BY C.CourseName;

SELECT F.Name, COUNT(C.CourseID) AS Total_Courses
FROM Faculty F
INNER JOIN Course C
ON F.FacultyID = C.FacultyID
GROUP BY F.Name;

SELECT S.DepartmentID, COUNT(S.StudentID) AS Total_Students
FROM Student S
GROUP BY S.DepartmentID;

SELECT C.CourseName, MAX(E.Grade) AS Max_Grade
FROM Course C
INNER JOIN Enrollment E
ON C.CourseID = E.CourseID
GROUP BY C.CourseName;








