/* ------------------------------------------------------------ 
Student Attendance SQL Analysis 
Author: Teresa Swallow 

Project Overview: 
This project demonstrates beginner SQL skills by analyzing a clean, synthetic student attendance dataset using PostgreSQL and pgAdmin 4. 

Files Included in GitHub: 
- Students.csv 
- Attendance.csv 
- attendance_analysis.sql 
- attendance_query_results.xlsx 
- pgAdmin4_question4_example.png (screenshot)
- README.md 

Setup: 
1. Created a PostgreSQL database using pgAdmin 4. 
2. Imported students.csv and attendance.csv into database tables. 
3. Queried the data to answer common attendance reporting questions. ------------------------------------------------------------ */

------------------------------------------------------------ 
-- Question 1 
-- How many attendance records exist? 
------------------------------------------------------------

SELECT COUNT(*) AS "Total_Attendance_Records"
FROM "Attendance";

------------------------------------------------------------ 
-- Question 2 
-- How many absences occurred? 
------------------------------------------------------------

SELECT COUNT(*) AS "Total_Absences"
FROM "Attendance"
WHERE "Status" = 'Absent';

------------------------------------------------------------ 
-- Question 3 
-- Which grade levels have the most absences? 
------------------------------------------------------------

SELECT "Grade", COUNT(*) AS "Total_Absences"
FROM "Students" AS s
LEFT JOIN "Attendance" AS a
ON s."Student_ID" = a."Student_ID"
WHERE "Status" = 'Absent'
GROUP BY "Grade"
ORDER BY "Total_Absences" DESC;

------------------------------------------------------------ 
-- Question 4 
-- Which schools have the highest attendance? 
-- (Present and Tardy records are counted as attendance.) 
------------------------------------------------------------

SELECT "School", COUNT(*) AS "Total_Attendance (Includes Tardies)"
FROM "Students" AS s
LEFT JOIN "Attendance" AS a
ON s."Student_ID" = a."Student_ID"
WHERE "Status" = 'Present' OR "Status" = 'Tardy'
GROUP BY "School"
ORDER BY "Total_Attendance (Includes Tardies)" DESC;

------------------------------------------------------------ 
-- Question 5 
-- How many attendance records exist for each attendance status? 
------------------------------------------------------------

SELECT "Status", COUNT(*) AS "Total_Count_of_Records"
FROM "Attendance"
GROUP BY "Status"
ORDER BY "Total_Count_of_Records" DESC;

