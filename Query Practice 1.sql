CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '21-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '21-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '21-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '21-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '21-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '21-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '21-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '21-04-11 09.00.00', 'Admin');

select * from Worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '23-02-20'),
		(002, 3000, '23-06-11'),
		(003, 4000, '23-02-20'),
		(001, 4500, '23-02-20'),
		(002, 3500, '23-06-11');
        
select * from Bonus;

create table Title(
WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE );

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2023-02-20 00:00:00'),
 (002, 'Executive', '2023-06-11 00:00:00'),
 (008, 'Executive', '2023-06-11 00:00:00'),
 (005, 'Manager', '2023-06-11 00:00:00'),
 (004, 'Asst. Manager', '2023-06-11 00:00:00'),
 (007, 'Executive', '2023-06-11 00:00:00'),
 (006, 'Lead', '2023-06-11 00:00:00'),
 (003, 'Lead', '2023-06-11 00:00:00');
 
 select * FROM Title;
 -- Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
 Select FIRST_NAME AS WORKER_NAME from Worker;
 
 -- Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
 
Select upper(FIRST_NAME) from Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.

Select  distinct DEPARTMENT from Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table and count them..

Select  DEPARTMENT,count( DEPARTMENT) from Worker group by DEPARTMENT;

-- Q-4. Write an SQL query to print the first Four characters of  FIRST_NAME from the Worker table
Select substring(FIRST_NAME,1,4) from Worker;

 -- Q-5. Write an SQL query to find the position of the alphabet (‘m’) 
 --      in the first name column ‘Amitabh’ from the Worker table.
 Select INSTR(FIRST_NAME, BINARY'A') from Worker where FIRST_NAME = 'Amitabh'; (-- binary use to defne case senitivity) 
 
 -- Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
 
 select replace(FIRST_NAME,'a','A') from Worker;

 select replace(FIRST_NAME,'N','n') from Worker;
 
 -- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
 
 select salary from Worker where salary between 100000 and 500000;
 
--  Q-20. Write an SQL query to print details of the Workers who joined in Feb 2021.

Select * from Worker where year(JOINING_DATE) = 2021 and month(JOINING_DATE) = 2;
        

-- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.

select * from Worker where FIRST_NAME in ("Vipul","Satish");

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”

select * from Worker where DEPARTMENT like "Admin%";

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

select * from Worker where FIRST_NAME like "%a%";

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select * from Worker where FIRST_NAME like "%a";

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from Worker where FIRST_NAME like "%h" and length(FIRST_NAME)="6";
Select * from Worker where FIRST_NAME like '_____h';

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

select count(*) from Worker where department = 'Admin';

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘HR’.

select count(*) from Worker where department = 'HR';

-- Q-23. Write an SQL query to fetch the number of workers for each department in descending order

select department, count(WORKER_ID) NUMBER_OF_WORKERS
from Worker group by department order by NUMBER_OF_WORKERS desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.



