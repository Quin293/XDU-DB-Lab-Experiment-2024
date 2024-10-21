USE university;

-- 查询所有教授的姓名和他们的系名
SELECT name, dept_name 
FROM instructor;

-- 查询授课老师的姓名和他们所教的课程名称
SELECT instructor.name, course.title
FROM teaches 
JOIN instructor ON teaches.ID = instructor.ID
JOIN course ON teaches.course_id = course.course_id;

-- 查询2009年秋季（Fall）的所有课程及其所在的教室
SELECT course.title, section.building, section.room_number
FROM section
JOIN course ON section.course_id = course.course_id
WHERE section.semester = 'Fall' AND section.year = 2009;

-- 查询每个系的平均预算
SELECT dept_name, AVG(budget) AS avg_budget
FROM department
GROUP BY dept_name;

-- 查询所有选修了"CS-101"课程的学生姓名及他们的成绩
SELECT student.name, takes.grade
FROM takes 
JOIN student ON takes.ID = student.ID
WHERE takes.course_id = 'CS-101';

-- 查询物理系（Physics）中工资高于80,000的教授姓名及工资
SELECT name, salary
FROM instructor
WHERE dept_name = 'Physics' AND salary > 80000;

-- 查询选修课程最多的学生姓名
SELECT student.name, COUNT(takes.course_id) AS course_count
FROM takes
JOIN student ON takes.ID = student.ID
GROUP BY student.name
ORDER BY course_count DESC
LIMIT 1;

-- 查询每个系的平均工资
SELECT dept_name, AVG(salary) AS avg_salary
FROM instructor
GROUP BY dept_name;

-- 查询所有课程的先修课程（Prerequisites），如果没有先修课程，则返回NULL
SELECT course.title, prereq.prereq_id
FROM course
LEFT JOIN prereq ON course.course_id = prereq.course_id;

-- 查询教授过至少两门课程的教授姓名
SELECT instructor.name, COUNT(teaches.course_id) AS course_count
FROM teaches
JOIN instructor ON teaches.ID = instructor.ID
GROUP BY instructor.name
HAVING COUNT(teaches.course_id) >= 2;