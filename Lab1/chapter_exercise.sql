USE university;

SELECT ID, name 
FROM instructor 
WHERE dept_name = 'Physics';

SELECT ID, name 
FROM instructor
WHERE dept_name IN (SELECT dept_name FROM department WHERE building = 'Watson');

SELECT DISTINCT student.ID, student.name
FROM student
JOIN takes ON student.ID = takes.ID
JOIN course ON takes.course_id = course.course_id
WHERE course.dept_name = 'Comp. Sci.';

SELECT DISTINCT student.ID, student.name
FROM student
JOIN takes ON student.ID = takes.ID
WHERE takes.year = 2018;

SELECT student.ID, student.name
FROM student
WHERE student.ID NOT IN (SELECT takes.ID FROM takes WHERE takes.year = 2018);