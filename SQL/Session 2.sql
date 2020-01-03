SELECT 
    emp_no,
    MAX(salary) AS max_s,
    MIN(salary) AS min_s,
    MAX(salary) - MIN(salary) AS growth
FROM
    salaries
GROUP BY emp_no
ORDER BY growth;

SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 45000;
# ordering of commands: the FROM & JOIN tables, then the WHERE statement, then GROUPBY, then the SELECT/AGG columns, then HAVING row filters, then SORT, then LIMIT

select * from departments;
select * from dept_emp;

SELECT 
    departments.dept_name,
    dept_emp.emp_no,
    dept_emp.from_date,
    dept_emp.to_date
FROM
    dept_emp
        RIGHT JOIN
    departments ON departments.dept_no = dept_emp.dept_no;
    
select * from employees e left join salaries s on e.emp_no=s.emp_no;
select e.*, s.salary from salaries s inner join employees e on s.emp_no=e.emp_no;
select * from employees e join salaries s on e.emp_no=s.emp_no join dept_emp d on e.emp_no=d.emp_no;

SELECT 
    COUNT(DISTINCT e.emp_no) AS Employee_Count,
    AVG(s.salary) AS Average_Salary,
    AVG(YEAR(CURRENT_TIMESTAMP) - YEAR(e.birth_date)) AS Average_Age,
    gender
FROM
    employees e
        INNER JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.to_date = '9999-01-01'
GROUP BY e.gender; 