CREATE DATABASE IF NOT EXISTS university;

USE university;

CREATE TABLE IF NOT EXISTS department(
    dept_name       VARCHAR(255) NOT NULL UNIQUE PRIMARY KEY,
    building        VARCHAR(255) NOT NULL,
    budget          INT NOT NULL
);

CREATE TABLE IF NOT EXISTS course(
    course_id       VARCHAR(255) NOT NULL UNIQUE PRIMARY KEY,
    title           VARCHAR(255) NOT NULL,
    credits         TINYINT UNSIGNED NOT NULL,
    dept_name       VARCHAR(255) NOT NULL,
    FOREIGN KEY(dept_name) REFERENCES department(dept_name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS prereq(
    course_id       VARCHAR(255) NOT NULL,
    prereq_id       VARCHAR(255) NOT NULL,
    FOREIGN KEY(course_id) REFERENCES course(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(prereq_id) REFERENCES course(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(course_id, prereq_id)
);

CREATE TABLE IF NOT EXISTS student(
    ID              BIGINT UNSIGNED NOT NULL UNIQUE PRIMARY KEY,
    name            VARCHAR(255) NOT NULL,
    tot_cred        SMALLINT UNSIGNED NOT NULL,
    dept_name       VARCHAR(255) NOT NULL,
    FOREIGN KEY(dept_name) REFERENCES department(dept_name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS instructor(
    ID              BIGINT UNSIGNED NOT NULL UNIQUE PRIMARY KEY,
    name            VARCHAR(255) NOT NULL,
    salary          INT UNSIGNED NOT NULL,
    dept_name       VARCHAR(255) NOT NULL,
    FOREIGN KEY(dept_name) REFERENCES department(dept_name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS advisor(
    s_id            BIGINT UNSIGNED NOT NULL,
    i_id            BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY(s_id) REFERENCES student(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(i_id) REFERENCES instructor(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(s_id, i_id)
);

CREATE TABLE IF NOT EXISTS classroom(
    building        VARCHAR(255) NOT NULL,
    room_number     INT UNSIGNED NOT NULL,
    capacity        INT UNSIGNED NOT NULL,
    PRIMARY KEY(building, room_number)
);

CREATE TABLE IF NOT EXISTS time_slot(
    time_slot_id    VARCHAR(255) NOT NULL,
    day             DATE NOT NULL,
    start_time      TIME NOT NULL,
    end_time        TIME NOT NULL,
    PRIMARY KEY(time_slot_id, day, start_time)
);

CREATE TABLE IF NOT EXISTS section(
    course_id       VARCHAR(255) NOT NULL,
    sec_id          BIGINT UNSIGNED NOT NULL,
    semester        VARCHAR(255) NOT NULL,
    year            INT UNSIGNED NOT NULL,
    building        VARCHAR(255) NOT NULL,
    room_number     INT UNSIGNED NOT NULL,
    time_slot_id    VARCHAR(255) NOT NULL,
    FOREIGN KEY(building, room_number) REFERENCES classroom(building, room_number) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(course_id, sec_id, semester, year)
);

DROP TRIGGER IF EXISTS check_time_slot_before_insert;

DELIMITER $$
CREATE TRIGGER check_time_slot_before_insert
BEFORE INSERT ON section
FOR EACH ROW
BEGIN
    DECLARE slot_count INT;
    SELECT COUNT(*) INTO slot_count FROM time_slot WHERE time_slot_id = NEW.time_slot_id;
    IF slot_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid time_slot_id: does not exist in time_slot table';
    END IF;
END$$
DELIMITER ;

CREATE TABLE IF NOT EXISTS takes(
    ID              BIGINT UNSIGNED NOT NULL,
    course_id       VARCHAR(255) NOT NULL,
    sec_id          BIGINT UNSIGNED NOT NULL,
    semester        VARCHAR(255) NOT NULL,
    year            INT UNSIGNED NOT NULL,
    grade           VARCHAR(255) NOT NULL,
    FOREIGN KEY(ID) REFERENCES student(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(ID, course_id, sec_id, semester, year)
);

CREATE TABLE IF NOT EXISTS teaches(
    ID              BIGINT UNSIGNED NOT NULL,
    course_id       VARCHAR(255) NOT NULL,
    sec_id          BIGINT UNSIGNED NOT NULL,
    semester        VARCHAR(255) NOT NULL,
    year            INT UNSIGNED NOT NULL,
    FOREIGN KEY(ID) REFERENCES instructor(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(ID, course_id, sec_id, semester, year)
);
