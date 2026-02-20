
    --Part A: Basic Data Display (Using Aliases)

    SELECT 
        StudentID as Roll_No,
        Name as Student_Name,
        DateOfBirth as DOB,
        Gender as Student_Gender,
        ContactNumber as Mobile_no,
        DepartmentID as Dept_ID
    FROM Student;

    SELECT 
        StudentID AS Roll_No,
        Name AS Student_Name,
        DepartmentID AS Dept_ID
    FROM Student;

    SELECT 
        FacultyID AS Faculty_ID,
        Name AS Faculty_Name,
        Designation AS Job_Title,
        Email AS Email_Address
    FROM Faculty;

    SELECT 
        CourseID AS Course_ID,
        CourseName AS Course_Name,
        Credits AS Credit_Value,
        DepartmentID AS Dept_ID
    FROM Course;

    SELECT 
        StudentID AS Roll_No,
        CourseID AS Course_ID,
        Semester AS Semester_Number,
        Grade AS Final_Grade
    FROM Enrollment;

    --Part B: Conditional Data Display (WHERE Clause)

    SELECT *
    FROM Student
    WHERE DepartmentID = 'D01';

    SELECT *
    FROM Student
    WHERE Gender = 'F';

    SELECT *
    FROM Faculty
    WHERE Designation = 'Assistant Professor';

    SELECT *
    FROM Faculty
    WHERE DepartmentID = 'D02';

    SELECT *
    FROM Course
    WHERE Credits >= 4;

    SELECT *
    FROM Student
    WHERE DateOfBirth > TO_DATE('2003-11-14','YYYY-MM-DD');

    SELECT *
    FROM Enrollment
    WHERE Semester = 'Semester 4';


    --Part C: Sorting and Limiting Results

    SELECT *
    FROM Student
    ORDER BY Name ASC;

    SELECT *
    FROM Student 
    ORDER BY DateOfBirth DESC;

    SELECT *
    FROM Faculty
    ORDER BY Designation ASC;

    SELECT *
    FROM Course
    ORDER BY Credits DESC;

    SELECT *
    FROM Student
    ORDER BY DepartmentID ASC, Name ASC;

    SELECT *
    FROM Enrollment
    ORDER BY Semester ASC;

    --Part D: Derived / Computed Output (No Table Modification)

    SELECT 
        Name,
        FLOOR(MONTHS_BETWEEN(SYSDATE, DateOfBirth) / 12) AS Age
    FROM Student;


    SELECT 
        CourseName,
        Credits + 1 AS Updated_Credits
    FROM Course;

    SELECT 
        StudentID,
        CourseID,
        Semester,
        Grade AS Final_Grade
    FROM Enrollment;

    SELECT 
        Name,
        EXTRACT(YEAR FROM DateOfBirth) AS Birth_Year
    FROM Student;


    SELECT 
        Name,
        SUBSTR(Email, INSTR(Email, '@') + 1) AS Email_Domain
    FROM Faculty;

    COMMIT







