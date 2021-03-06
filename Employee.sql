-- Student table
CREATE DATABASE rachna;
DROP DATABASE rachna;
DROP DATABASE imarticus;
USE DSP11;
CREATE TABLE student(
student_id INT PRIMARY KEY,
name VARCHAR(40),
major VARCHAR(40)
);

INSERT INTO student 
VALUES(1,"Digviajy","Python");
INSERT INTO student
VALUES(2,"Nikhil","Java");
INSERT INTO student
VALUES(3,"Priya","Tableau");
INSERT INTO student
VALUES(4,"Vipul","R");
INSERT INTO student
VALUES(5,"Dayanand","All");
-- DELETE statement
DELETE FROM student
WHERE student_id=4;
-- UPDATE statement
UPDATE student
SET major="C+="
WHERE student_id=2;

UPDATE student
SET name="Mustfa"
WHERE student_id=3;

SELECT * 
FROM student;

SELECT name="Nikhil"
FROM student;

SELECT name
FROM student
WHERE student_id=2;

SELECT name
FROM student;

SELECT name
FROM student
WHERE major="ALL";

SELECT student_id
FROM student
WHERE student_id<5;

-- EMPLOYEE
CREATE DATABASE GOPRAC;
USE GOPRAC;
CREATE TABLE employee(
emp_id INT PRIMARY KEY,
first_name VARCHAR(40),
last_name VARCHAR(20),
birth_day DATE,
sex VARCHAR(1),
super_id INT,
branch_id INT
);

ALTER TABLE employee
ADD salary INT AFTER sex;

SELECT *
FROM employee;


CREATE TABLE branch(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(40),
mgr_id INT,
mgr_start_date date,
FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) 
ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(employee_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

CREATE TABLE client (
client_id INT PRIMARY KEY,
client_name VARCHAR(40),
branch_id INT,


FOREIGN KEY(branch_id) REFERENCES branch(branch_id) 
ON DELETE SET NULL
);

CREATE TABLE works_with(
emp_id  INT,
client_id INT,
total_sales INT,
PRIMARY KEY (emp_id,client_id),
FOREIGN KEY(emp_id) REFERENCES employee(emp_id) 
ON DELETE CASCADE,
FOREIGN KEY (client_id) REFERENCES(client_id)
ON DELETE CASCADE
);

CREATE TABLE branch_supplier(
branch_id INT,
supplier_name VARCHAR(40),
supply_type VARCHAR(40),
PRIMARY KEY(branch_id,supplier_name),
FOREIGN KEY(branch_id) REFERENCES branch(branch_id)
ON DELETE CASCADE
);

-- Corporate
INSERT INTO
employee VALUES(
100,"DAVID","Wallace","1967-11-17","M",250000,NULL,NULL
);

INSERT INTO
branch VALUES(
1,"corporate",100,"2006-02-09"
);

UPDATE employee
SET branch_id=1
WHERE emp_id=100;

INSERT INTO
employee VALUES(
101,"JAN","Levinson","1961-05-11","F",110000,100,1
);

-- Scranton

INSERT INTO
employee VALUES(
102,"Michael","Scott","1964-03-15","M",75000,100,NULL
);

SELECT *
FROM employee;


INSERT INTO branch
VALUES(2,"scranton",102,"1992-04-06");

UPDATE employee
SET branch_id=2
WHERE emp_id=102;

INSERT INTO
employee VALUES(
103,"Angela","Martin","1971-06-25","F",63000,102,2);

INSERT INTO
employee VALUES(
104,"Kelly","Kapoor","1980-02-05","F",55000,102,2);

INSERT INTO
employee VALUES(
105,"Stanley","Hudson","1958-02-19","M",69000,102,2);

-- Stamford
INSERT INTO
employee VALUES(
106,"JOSH","Porter","1969-09-05","M",78000,100,NULL);

INSERT INTO
branch VALUES(
3,"stemford",106,"1998-02-13");

UPDATE employee
SET branch_id =3
WHERE emp_id =106;

INSERT INTO
employee VALUES (
107,"Andy","Bernard","1973-07-22","M",65000,106,3
);

INSERT INTO 
employee VALUES(
108,"Jim","Halpert","1978-10-01","M",71000,106,3
);

-- Branch Supplier
INSERT INTO
branch_supplier VALUES(
2,"Hammer Mill","Paper"
);

INSERT INTO
branch_supplier VALUES(
2,"Uni Ball","Writing Utensils"
);

INSERT INTO 
branch_supplier VALUES(
3,"Patriot Paper","Paper"
);

INSERT INTO
branch_supplier VALUES(
2,"JT_FORMS & Labels","Custom FOrms"
);

INSERT INTO
branch_supplier VALUES(
3,"Hammer Mill","Paper"
);


-- Client

INSERT INTO
Client VALUES (
400,"Dunmore HighSchool",2
);
