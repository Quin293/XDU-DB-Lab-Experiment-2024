USE university;

REPLACE INTO department (dept_name, building, budget) VALUES
('Comp. Sci.', 'Taylor', 100000),
('Finance', 'Packard', 120000),
('Music', 'Watson', 80000),
('Physics', 'Painter', 150000),
('History', 'Painter', 60000),
('Biology', 'Watson', 92000),
('Elec. Eng.', 'Taylor', 85000);

REPLACE INTO instructor (ID, name, dept_name, salary) VALUES
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(12121, 'Wu', 'Finance', 90000),
(15151, 'Mozart', 'Music', 40000),
(22222, 'Einstein', 'Physics', 95000),
(32343, 'El Said', 'History', 60000),
(33456, 'Gold', 'Physics', 87000),
(45565, 'Katz', 'Comp. Sci.', 75000),
(58583, 'Califieri', 'History', 62000),
(76543, 'Singh', 'Finance', 80000),
(76766, 'Crick', 'Biology', 72000),
(83821, 'Brandt', 'Comp. Sci.', 92000),
(98345, 'Kim', 'Elec. Eng.', 80000);

REPLACE INTO course (course_id, title, dept_name, credits) VALUES
('BIO-101', 'Intro. to Biology', 'Biology', 4),
('BIO-301', 'Genetics', 'Biology', 4),
('BIO-399', 'Computational Biology', 'Biology', 3),
('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4),
('CS-190', 'Game Design', 'Comp. Sci.', 4),
('CS-315', 'Robotics', 'Comp. Sci.', 3),
('CS-319', 'Image Processing', 'Comp. Sci.', 3),
('CS-347', 'Database System Concepts', 'Comp. Sci.', 3),
('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3),
('FIN-201', 'Investment Banking', 'Finance', 3),
('HIS-351', 'World History', 'History', 3),
('MU-199', 'Music Video Production', 'Music', 3),
('PHY-101', 'Physical Principles', 'Physics', 4);

REPLACE INTO prereq (course_id, prereq_id) VALUES
('BIO-301', 'BIO-101'),
('BIO-399', 'BIO-101'),
('CS-190', 'CS-101'),
('CS-315', 'CS-101'),
('CS-319', 'CS-101'),
('CS-347', 'CS-101'),
('EE-181', 'PHY-101');

REPLACE INTO time_slot (time_slot_id, day, start_time, end_time) VALUES
('A', '2009-06-01', '09:00:00', '10:30:00'),
('B', '2009-06-01', '10:40:00', '12:10:00'),
('C', '2009-12-15', '13:00:00', '14:30:00'),
('D', '2010-01-20', '14:40:00', '16:10:00'),
('E', '2009-04-10', '16:20:00', '17:50:00'),
('F', '2010-03-10', '08:00:00', '09:30:00'),
('H', '2009-09-01', '11:00:00', '12:30:00');

REPLACE INTO classroom (building, room_number, capacity) VALUES
('Painter', 514, 50),
('Packard', 101, 100),
('Taylor', 3128, 70),
('Watson', 120, 60),
('Watson', 100, 80);

REPLACE INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES
('BIO-101', 1, 'Summer', 2017, 'Painter', '514', 'B'),
('BIO-301', 1, 'Summer', 2018, 'Painter', '514', 'A'),
('CS-101', 1, 'Fall', 2017, 'Packard', '101', 'H'),
('CS-101', 1, 'Spring', 2018, 'Packard', '101', 'F'),
('CS-190', 1, 'Spring', 2017, 'Taylor', '3128', 'E'),
('CS-190', 2, 'Spring', 2017, 'Taylor', '3128', 'A'),
('CS-315', 1, 'Spring', 2018, 'Watson', '120', 'D'),
('CS-319', 1, 'Spring', 2018, 'Watson', '100', 'B'),
('CS-319', 2, 'Spring', 2018, 'Taylor', '3128', 'C'),
('CS-347', 1, 'Fall', 2017, 'Taylor', '3128', 'A'),
('EE-181', 1, 'Spring', 2017, 'Taylor', '3128', 'B'),
('FIN-201', 1, 'Spring', 2018, 'Packard', '101', 'C'),
('HIS-351', 1, 'Spring', 2018, 'Painter', '514', 'D'),
('MU-199', 1, 'Spring', 2018, 'Packard', '101', 'B'),
('PHY-101', 1, 'Fall', 2017, 'Watson', '100', 'C');

INSERT INTO teaches (ID, course_id, sec_id, semester, year) VALUES
(10101, 'CS-101', 1, 'Fall', 2017),
(10101, 'CS-315', 1, 'Spring', 2018),
(10101, 'CS-347', 1, 'Fall', 2017),
(12121, 'FIN-201', 1, 'Spring', 2018),
(15151, 'MU-199', 1, 'Spring', 2018),
(22222, 'PHY-101', 1, 'Fall', 2017),
(32343, 'HIS-351', 1, 'Spring', 2018),
(45565, 'CS-101', 1, 'Spring', 2018),
(45565, 'CS-319', 1, 'Spring', 2018),
(76766, 'BIO-101', 1, 'Summer', 2017),
(76766, 'BIO-301', 1, 'Summer', 2018),
(83821, 'CS-190', 1, 'Spring', 2017),
(83821, 'CS-190', 2, 'Spring', 2017),
(83821, 'CS-319', 2, 'Spring', 2018),
(98345, 'EE-181', 1, 'Spring', 2017);

REPLACE INTO student (ID, name, dept_name, tot_cred) VALUES
(00128, 'Zhang', 'Comp. Sci.', 102),
(12345, 'Shankar', 'Comp. Sci.', 32),
(19991, 'Brandt', 'History', 80),
(23121, 'Chavez', 'Finance', 110),
(44553, 'Peltier', 'Physics', 56),
(45678, 'Levy', 'Physics', 46),
(54321, 'Williams', 'Comp. Sci.', 54),
(55739, 'Sanchez', 'Music', 38),
(70557, 'Snow', 'Physics', 0),
(76543, 'Brown', 'Comp. Sci.', 58);

INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES
(00128, 'CS-101', 1, 'Fall', 2017, 'A'),
(00128, 'CS-315', 1, 'Spring', 2018, 'B'),
(12345, 'CS-190', 1, 'Spring', 2017, 'B'),
(12345, 'CS-319', 1, 'Spring', 2018, 'A'),
(19991, 'HIS-351', 1, 'Spring', 2018, 'A'),
(23121, 'FIN-201', 1, 'Spring', 2018, 'B'),
(44553, 'PHY-101', 1, 'Fall', 2017, 'C'),
(45678, 'BIO-101', 1, 'Summer', 2017, 'B'),
(54321, 'CS-101', 1, 'Spring', 2018, 'A'),
(54321, 'CS-347', 1, 'Fall', 2017, 'A'),
(55739, 'MU-199', 1, 'Spring', 2018, 'B'),
(70557, 'PHY-101', 1, 'Fall', 2017, 'C'),
(76543, 'CS-190', 2, 'Spring', 2017, 'B'),
(76543, 'CS-319', 2, 'Spring', 2018, 'A');