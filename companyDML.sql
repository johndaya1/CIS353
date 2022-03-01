-- File: companyDML-a1.sql 
-- SQL/DML (on the COMPANY database)
/*
--
IMPORTANT SPECIFICATIONS
--
(A)
-- Download the script file PA-06-companyDB.sql and use it to create your COMPANY database in sqlplus.
-- Dowlnoad the file companyDBinstance.pdf; it is provided for your convenience when checking the results of your queries.
--
(B)
--Implement the queries below by ***editing this file*** to include
your name and your SQL code in the indicated places.   
--
(C)
After you have written the SQL code in the appropriate places:
-- Run this file (from the command line in sqlplus). It will produce the spooled file companyDML-a1.txt.
-- Upload the spooled file (companyDML-a1.txt) to BB.*/
--
*/
SPOOL companyDML-a1.txt
SET ECHO ON
-- ---------------------------------------------------------------
-- 
-- Name: Dayaseh Johnson
--
-- ------------------------------------------------------------
-- NULL AND SUBSTRINGS -------------------------------
--
/*(10A)
Find the ssn and last name of every employee who doesn't have a  supervisor, or their last name contains at least two occurences of the letter 'a'. Sort the results by ssn.
*/
SELECT Ssn, Lname
FROM EMPLOYEE
WHERE Super_ssn IS NULL OR 
      Lname LIKE '%a%'
ORDER BY Ssn;
--
-- JOINING 3 TABLES ------------------------------
-- 
/*(11A)
For every employee who works more than 30 hours on any project: Find the ssn, lname, project number, project name, and numer of hours. Sort the results by ssn.
*/
SELECT Ssn, Lname,Pnumber, Pname, Hours
FROM EMPLOYEE, PROJECT, WORKS_ON
WHERE Hours > 30.0
ORDER BY Ssn;
--
-- JOINING 3 TABLES ---------------------------
--
/*(12A)
Write a query that consists of one block only.
For every employee who works on a project that is not controlled by the department they work for: Find the employee's lname, the department they works for, the project number that they work on, and the number of the department that controls that project. Sort the results by lname.
*/
SELECT Lname, Dno, Dnum, Pno, Essn, Ssn, Pnumber
FROM EMPLOYEE, PROJECT, WORKS_ON
WHERE Essn = Ssn AND Pno = Pnumber AND Dno != Dnum
ORDER BY Lname;
--
-- JOINING 4 TABLES -------------------------
--
/*(13A)
For every employee who works for more than 20 hours on any project that is located in the same location as their department: Find the ssn, lname, project number, project location, department number, and department location. Sort the results by lname
*/
-- <<< Your SQL code replaces this whole line>>>
--
-- SELF JOIN -------------------------------------------
-- 
/*(14A)
Write a query that consists of one block only.
For every employee whose salary is less than 70% of his/her immediate supervisor's salary: Find that employee's ssn, lname, salary; and their supervisor's ssn, lname, and salary. Sort the results by ssn.  
*/
SELECT s1.Ssn, s1.Lname, s1.salary, s1.super_ssn, s2.ssn, s2.lname, s2.salary
FROM employee
WHERE s1.super_ssn = s2.ssn AND s1.salary < (0.70 * s2.salary);
--
-- USING MORE THAN ONE RANGE VARIABLE ON ONE TABLE -------------------
--
/*(15A)
For projects located in Houston: Find pairs of last names such that the two employees in the pair work on the same project. Remove duplicates. Sort the result by the lname in the left column in the result. 
*/

--
------------------------------------
--
SET ECHO OFF
SPOOL OFF


