select distinct gender from employees; ### unique values
select * from employees.departments;

SELECT 
    first_name, last_name, gender
FROM
    employees
WHERE
    gender = 'M' AND first_name = 'Denis';
    
### AND > OR

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND gender = 'M'
        OR gender = 'F';

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar__');
    
    
SELECT 
    *
FROM
    employees.dept_manager
WHERE
    to_date is null;
    
SELECT 
    *
FROM
    employees.salaries
WHERE
    emp_no
ORDER BY salary DESC;

select * from employees.departments where dept_name = 'Quality Management';
select * from employees.dept_manager where dept_no = 'd006' order by from_date desc;
select * from employees.employees where emp_no = '110854';

select count(distinct gender) as gender from employees;
select count(distinct first_name), gender from employees group by gender;

select sum(salary)/12 from salaries where to_date = '9999-01-01';
select * from employees where hire_date like '1995%' order by birth_date asc limit 2;

select distinct title from titles order by to_date desc;
select * from employees where gender = 'F' order by birth_date desc;

select * from employees where gender = 'F' and first_name like ('Nic%') order by birth_date;
select * from titles where emp_no = 87724;
