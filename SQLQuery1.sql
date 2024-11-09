
INSERT INTO Faculty (ID,FirstName,LastName,Email)
VALUES (7, 'Esraa' ,' Mohsen' , 'es585@gmail.com');

UPDATE Faculty 
SET Email = 'ahM887@gamil.com'
WHERE ID = 1;

SELECT FirstName AS fname ,LastName AS lname FROM Faculty
WHERE  ID=5;

/*DELETE FROM Faculty 
WHERE ID=6;

DELETE FROM Faculty;
*/

SELECT * FROM Faculty;

SELECT FirstName F ,LastName L  FROM Faculty
WHERE  ID=5;

SELECT ID FROM Faculty 
ORDER BY ID  DESC;

SELECT *
FROM Student
INNER JOIN Department ON Student.ID = Department.ID;

SELECT *
FROM Student
LEFT JOIN Department ON Student.ID = Department.ID;

SELECT *
FROM Student
RIGHT JOIN Department ON   Student.ID = Department.ID;

SELECT *
FROM Student 
FULL JOIN Department ON Student.ID = Department.ID;

SELECT Student.FirstName, Student.LastName, Courses.[Name]
FROM Student
INNER JOIN Courses ON Student.ID = Courses.ID;

SELECT EnrollmentDate,StudentID ,CourseID 
FROM Enrollment
ORDER BY
(CASE
WHEN EnrollmentDate IS NULL THEN StudentID 
ELSE CourseID 
END);

SELECT 
    s1.FirstName AS StudentName,
    s1.LastName AS StudentLastName,
    s2.FirstName AS LeaderName,
    s2.LastName AS LeaderLastName
FROM 
    Student s1
LEFT JOIN 
    Student s2 ON s1.LeaderID = s2.ID;





--LAB 2 IN MODULE 2

--Exercise 1: Executing Basic SELECT Statements
SELECT * FROM Courses ;

SELECT FirstName +' ' + LastName AS 'FullName' From Student ;

SELECT ID , Name , CreditHour FROM Courses;

SELECT * FROM Faculty ORDER BY ID DESC;

SELECT FirstName AS Fname ,LastName AS Lname FROM Faculty;


--Exercise 2: Executing Queries That Filter Data Using Predicates
SELECT * FROM Enrollment WHERE ID=5;

SELECT FirstName FROM Student WHERE FirstName ='Sama';

SELECT * FROM Faculty WHERE FirstName='Sama' ORDER BY ID DESC ;

SELECT EnrollmentDate FROM Enrollment WHERE ID>6;

SELECT * FROM Faculty WHERE ID<5 AND FirstName='Ahmed';

SELECT FirstName + ' ' + LastName AS FUllName 
FROM Faculty WHERE ID<5 OR FirstName='Sama';

SELECT * FROM Department WHERE NOT ID =2;

SELECT * FROM Student
WHERE ID BETWEEN 18 AND 25;


--Exercise 3: Executing Queries That Sort Data Using ORDER BY
SELECT * FROM Student
WHERE ID <= 2 AND Phone =12452
ORDER BY FirstName ASC;

SELECT * FROM Faculty ORDER BY FirstName;

SELECT * FROM Student
ORDER BY DepartmentID, LastName;

SELECT EnrollmentDate
FROM Enrollment
ORDER BY  ID DESC;






--LAB 3 IN MODULE 3

--Exercise 1: Writing Simple SELECT Statements
--Exercise 2: Eliminating Duplicates Using DISTINCT

SELECT DISTINCT ID
FROM Student;

SELECT DISTINCT Name, ID
FROM Courses;

SELECT DISTINCT ID 
FROM Student
ORDER BY ID;


--Exercise 3: Using Table and Column Aliases
SELECT CONCAT(Name, ' ', CreditHour) AS InfoAboutCourse
FROM Courses;

SELECT s.FirstName, s.LastName
FROM Student s;

--Exercise 4: Using a Simple CASE Expression

SELECT * ,
      CASE 
          WHEN [LeaderID] IS NOT NULL THEN 'Has Leader'
          ELSE 'No Leader'
      END AS LeaderStatus
FROM [University].[dbo].[Student];






--LAB 4 IN MODULE 4

--Exercise 1: Writing Queries That Use Inner Joins
SELECT *
FROM Student
INNER JOIN Department ON Student.ID = Department.ID;

--Exercise 2: Writing Queries That Use Multiple-Table Inner Joins
SELECT 
    s.ID AS StudentID,
    s.FirstName,
    s.LastName,
    d.NameDepartment,
    c.Name AS CourseName,
    c.CreditHour
FROM 
    Student s
INNER JOIN 
    Department d ON s.DepartmentID = d.ID
INNER JOIN 
    Courses c ON d.ID = c.ID;  

--Exercise 3: Writing Queries That Use Self Joins
SELECT 
    s1.ID AS StudentID,
    s1.FirstName AS StudentFirstName,
    s1.LastName AS StudentLastName,
    s2.FirstName AS LeaderFirstName,
    s2.LastName AS LeaderLastName
FROM 
    Student s1
LEFT JOIN 
    Student s2 ON s1.LeaderID = s2.ID;


--Exercise 4: Writing Queries That Use Outer Joins
--LEFT
SELECT *
FROM Student
LEFT JOIN Department ON Student.ID = Department.ID;

--RIGHT
SELECT *
FROM Student
RIGHT JOIN Department ON   Student.ID = Department.ID;

--FULL
SELECT *
FROM Student 
FULL JOIN Department ON Student.ID = Department.ID;

--Exercise 5: Writing Queries That Use Cross Joins
SELECT *
FROM Student 
CROSS JOIN Department;




--Built in
SELECT COUNT(*) FROM Student;

SELECT CONCAT(FirstName, ' ', LastName) FROM Student;

SELECT UPPER(FirstName) AS UpperFirstName 
FROM Student;

--LAP 5

--EX1 Exercise 1: Write Queries that Filter Data Using a WHERE Clause
SELECT ID, FirstName, LastName, DepartmentID
FROM Student
WHERE DepartmentID = 1;  

--EX2• Exercise 2: Write Queries that Sort Data Using an ORDER BY Clause
SELECT ID, FirstName, LastName
FROM Student
ORDER BY LastName ASC;

--EX3  Exercise 3: Write Queries that Filter Data Using the TOP Option
SELECT TOP (10) ID, FirstName , LastName
FROM Student
ORDER BY ID ASC;

--EX4 • Exercise 4: Write Queries that Filter Data Using the OFFSET-FETCH Clause
SELECT ID, FirstName, LastName
FROM Student
ORDER BY ID 
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

--LAP 6

--Exercise 1: Writing Queries That Return Date and Time Data
SELECT GETDATE() AS CurrentDateTime;

--Exercise 2: Writing Queries That Use Date and Time Functions

--Exercise 3: Writing Queries That Return Character Data
SELECT FirstName, LastName
FROM Student
WHERE FirstName LIKE 'J%';

--Exercise 4: Writing Queries That Use Character Functions
SELECT FirstName, UPPER([FirstName]) AS UpperCaseFirstName
FROM Student;



--LAP 7

--Exercise 1: Inserting Records with DML
INSERT INTO Student
    ([FirstName], [LastName], [Phone], [Email], [Address], [DepartmentID])
VALUES 
    ('Ali', 'Hassan', '1234567890', 'ali@j958.com', '123 Elm St', 1);


--Exercise 2: Update and Delete Records Using DML
UPDATE Student
SET 
    [Email] = 'JDHD@JHDH.com', 
    [Phone] = '9876543210'
WHERE 
    [ID] = 1;  


DELETE FROM Student
WHERE [ID] = 1;  


--LAP 8

--Exercise 1: Writing Queries That Use Conversion Functions
SELECT 
    [ID], 
    CAST([ID] AS VARCHAR(10)) AS StudentIDString
FROM 
    Student;

--Exercise 2: Writing Queries That Use Logical Functions
SELECT ID, FirstName, LastName
FROM Student
WHERE DepartmentID = 1 AND Phone IS NOT NULL;


--Exercise 3: Writing Queries That Test for Nullability
SELECT ID, FirstName, LastName
FROM Student
WHERE Phone IS NULL;






