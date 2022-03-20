-- Nested Queries
-- 1.   Select the department name of the company which is assigned to the employee whose employee id is grater 103.

select *
from empdept ;

select *
from employee ;

select deptname from empdept 
where deptid in (select department from employee where empid>103);

-- Alternative
select ed.deptname
from empdept ed
join employee emp
on emp.department=ed.deptid
where empid>103;

-- 2.   Select the name of the employee who is working under Abhishek.

select empname
from employee
where empheadid=105;

-- Alternative
select empname
from employee
 where empheadid in 
 (select empid from employee where empname="Abhishek");
 
 -- 3.   Select the name of the employee who is department head of HR.
 
 select empname
 from employee
 where empid in 
 (select depthead from empdept where deptname="HR");
 
 -- Alternative
 select emp.empname
 from employee emp
 join empdept ed
 on emp.empid=ed.depthead
 where ed.deptname="HR";

-- 4.   Select the name of the employee head who is permanent.


select empname
from employee where empid in
 (select empheadid from employee) and empid in (select empid from empsalary where ispermanent="yes");


-- 5.   Select the name and email of the Dept Head who is not Permanent.

select *
from empdept;
select *
from empsalary;
select *
from employee;

use sqlpractice;
select empname,emaildid
from employee
where empid in 
(select empheadid from employee) and empid in (select empid from empsalary where ispermanent="No");

-- 6.   Select the employee whose department off is monday

select * 
from employee;
select * 
from empsalary;
select * from
empdept;

select *
from employee
join empdept
on employee.department=empdept.deptid
where dept_off="Monday";

-- Alternate
select *
from employee 
where department in
(select deptid from empdept where dept_off="Monday");

-- 7.   select the indian clinets details.

select *
from clienttable;
select *
from country;

select clientname
from clienttable
join country
on clienttable.cid=country.cid
where cname="India";

-- Alternative
select clientname
from clienttable where cid in
(select cid from country where cname="India");

-- 8.   select the details of all employee working in development department.

select *
from employee;
select * 
from empdept;

select *
from employee
join empdept
on employee.department=empdept.deptid
where deptname="Development";

-- Alternative
select *
from employee where department in
(select deptid from empdept where deptname="development");

create database techbeamers;
use techbeamers;

create table worker
(WORKER_ID	int,
FIRST_NAME	varchar(100),
LAST_NAME	varchar(50),
SALARY int	,
JOINING_DATE	datetime,
DEPARTMENT varchar(80)
);
select *
from worker;

create table bonus
(
WORKER_REF_ID	int,
BONUS_DATE	datetime,
BONUS_AMOUNT int
);

select * from bonus;

create table 	title(
WORKER_REF_ID	int,
WORKER_TITLE	varchar(100),
AFFECTED_FROM varchar(100)
);

select * from title;

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
        select * from worker;
        
        INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        select * from bonus;
        
        INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 select * from title;
 
 -- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
 
 select first_name as Worker_Name
 from worker;
 
 -- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(First_Name) as FirstName
from worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

select distinct department
from worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substring(first_name,1,3) from worker;
-- substring()-this is the function using that slicing of string is possible.It takes first arguement as what is require to slice,
-- 2nd arguement is start index and 3rd index is end index

-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.

use techbeamers;

select first_name
from worker where first_name="Amitabh";

select first_name
from worker 
where first_name like "A%";

-- INSTR- this function gives positional srguement of a letter in the word. It takes Binary and followed by serach letter for which we are required to
-- find position

Select INSTR(first_name ,BINARY 'a')
from worker
where first_name="Amitabh";

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

select rtrim(first_name)
from worker;

select trim(first_name)
from worker;

select ltrim(first_name)
from worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

select ltrim(department)
from worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

-- we can use 2 function together like distinct and length as mentioned below in the example
select distinct length(department)
from worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
-- Replce- Replace is the function to replace a letter
select Replace(first_name,"a","A") 
from worker;


-- Another example
select replace(first_name,"a","A")
from worker
where
first_name="Amitabh";

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. 
-- A space char should separate them.

-- concat- it is used to concat 2 columns ,words ,leeters
select concat(first_name," ",last_name) AS Complete_Name
from worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

-- By default Order by works in the ascending order.Using DESX keyword we can write it in descending order

select *
from worker
order by First_name asc;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

select *
from worker
order by first_name asc , department desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select *
from worker
where first_name="Vipul" or first_name= "Satish";
-- using in work we can combine 2 and more than 2 in one search column 
-- Alternative
select * from worker
where first_name in ("VIPUL","SATISH");

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

select *
from worker
where first_name not in ("VIPUL","SATISH");

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”
select *
from worker
where department="Admin";

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select *
from worker
where first_name like "%A%";

-- Q-16A. Write an SQL query to print details of the Workers whose FIRST_NAME starts with ‘a’.

select * from
worker where first_name like"A%";


-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select *
from worker where first_name like "%A";

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
-- underscore
select * 
from worker
where first_name like "_____%h";

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

select
 *
 from worker
 where salary between 100000 AND 500000;
 
 -- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
 select *
 from worker 
 where joining_date like "%2014-02%";
 -- alternative
 select *
 from worker
 where year(joining_Date)=2014 and month(joining_date)=2;
 
 -- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’
 
 select department,count(first_name) as total_dept_employee
 from worker
 where department="Admin"
 group by(department)
 ;
 
 -- Alternative
 select count(*) from worker where department="Admin";
 
 -- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

use techbeamers;

select concat(first_name, " " ,last_name) As worker_name,salary
from worker
where salary >=50000 and salary <=100000;


select first_name,salary
from worker
where salary between 50000 and 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

select department,count(department) As no_of_workers_departmentwise
from worker
group by department
order by no_of_workers_departmentwise desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.

select concat(w.first_name," ",w.last_name) As Full_Name,t.worker_title
from worker w
join title t
on t.worker_ref_id=w.worker_id
where t.worker_title="Manager";

-- Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select *
from worker w
join title t
join bonus b
on w.worker_id=t.worker_ref_id=b.worker_ref_id;
select * from bonus;

-- 
select worker_title,affected_from,count(*)
from title
group by worker_title,affected_from
HAVING count(*) >1;

select *
from title;

-- Q-26. Write an SQL query to show only odd rows from a table.
select *
from worker
where MOD (worker_id,2)<>0;

-- Q-27. Write an SQL query to show only even rows from a table.
select *
from worker
where mod(worker_id,2)=0;

-- Q-28. Write an SQL query to clone a new table from another table.
-- general way to clone a table without data is in mySQL
create table
 WorkerClone_SQL like worker;
 
 
 
 
--  Q-29. Write an SQL query to fetch intersecting records of two tables.
select *
from worker;
select *
from worker w
inner join title t
ON w.worker_id=t.worker_ref_id; 

      (select * from worker)
      
      -- INTERSECT did not work
-- INTERSECT
      (select * from worker);
      
-- Q-30. Write an SQL query to show records from one table that another table does not have.
use techbeamers;

select *
from bonus;

select *
from worker w
right join bonus b
on w.worker_id=b.worker_ref_id;

-- Q-31. Write an SQL query to show the current date and time.
-- curdate()-It tells current date 
-- now() -it returns date & time both
select curdate();
select now();

-- Q-32. Write an SQL query to show the top n (say 10) records of a table.
-- limit-using limit we can limit our search
select salary 
from worker
order by salary desc limit 10;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

select * from worker
order by salary desc limit 5;

select salary from worker
order by salary desc limit 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
select salary
from worker 
order by salary desc ;

select salary
from worker w1
where 4=
(select count(distinct (w2.salary) )
from worker w2
where w2.salary>=w1.salary)
;

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select distinct w.worker_id,w.first_name,w.salary
from worker w,worker w1
where w.salary=w1.salary
and w.worker_id!=w1.worker_id;

Use techbeamers;

-- Q-36. Write an SQL query to show the second highest salary from a table.
select *
from worker
group by salary
order by salary desc limit 2;

select max(salary)
from worker
where salary not in (select max(salary) from worker);

-- Q-37. Write an SQL query to show one row twice in results from a table.
select * from worker
union all
select * from worker ;

-- Q-38. Write an SQL query to fetch intersecting records of two tables.

select * from worker w
inner join bonus b
on w.worker_id=b.worker_ref_id;

-- Q-39. Write an SQL query to fetch the first 50% records from a table. 

select * from worker
where worker_id <=(select count(worker_id)/2 from worker);

-- Q-40. Write an SQL query to fetch the departments that have less than five people in it.

select department,count(worker_id) as no_of_workers
from worker
group by department
having count(worker_id)<5;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select department,count(department) as no_of_people
from worker
group by department;

-- Q-42. Write an SQL query to show the last record from a table.
select * from 
worker 
order by worker_id desc 
limit 1;

-- Q-43. Write an SQL query to fetch the first row of a table.
select *
from worker
order by worker_id
limit 1 ;

-- Q-44. Write an SQL query to fetch the last five records from a table.
select * from 
worker
order by worker_id desc
limit 5;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

select first_name,max(salary),department
from worker
group by department;

-- Q-46. Write an SQL query to fetch three max salaries from a table.
select salary
from worker
group by salary
order by salary desc
limit 3;

select distinct salary from worker a
where 3>=(select count(distinct salary) from worker b where a.salary <=b.salary) order by salary;

-- Q-47. Write an SQL query to fetch three min salaries from a table.
select salary
from worker
group by salary
order by salary limit 3;

select distinct salary from worker a
where 3>= (select count(distinct salary) from worker b where a.salary>= b.salary ) order by a.salary desc;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

select distinct salary from worker a
where n>=(select count( distinct salary) from worker b
where a.salary <=b.salary) order by a.salary desc;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select sum(salary),department
from worker
group by department;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.

select first_name,salary
from worker
group by worker_id
order by salary desc limit 2;
 ;


select first_name salary
from worker 
where salary=(select max(salary) from worker);

