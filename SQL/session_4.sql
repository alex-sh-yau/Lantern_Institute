##Find out the salary of people hired after 2000-01-01
##THe first method is computationally more expensive, but faster with smaller data sets
select emp_no, salary from salaries 
where emp_no in
(select  emp_no from employees
where hire_date> "2000-01-01" );

select e.emp_no, first_name, last_name, s.salary from employees e
join salaries s
on e.emp_no=s.emp_no
where e.hire_date> "2000-01-01";

select emp_no, salary from salaries 
where exists
(select emp_no from employees 
where hire_date > "2000-01-01"
and employees.emp_no = salaries.emp_no);


SELECT 
    o.customerNumber,
    od.orderNumber,
    p.productCode,
    p.productName,
    p.buyPrice,
    od.quantityOrdered,
    o.orderDate,
    o.shippedDate
FROM
    products p
        JOIN
    orderdetails od ON p.productCode = od.productCode
        JOIN
    orders o ON od.orderNumber = o.orderNumber
WHERE
    o.customerNumber IN (SELECT 
            customerNumber
        FROM
            customers
        WHERE
            customerNumber IN (SELECT 
                    customerNumber
                FROM
                    orders
                GROUP BY customerNumber
                HAVING COUNT(DISTINCT orderNumber) > 3 UNION SELECT 
                    customerNumber
                FROM
                    payments
                GROUP BY customerNumber
                HAVING SUM(amount) > 100000))
ORDER BY customerNumber;








##IF NULL(name,"unknown") -> will replace Null values of column name with "unknown"

SELECT 
    *,
    IFNULL(comments, 'no comment') AS comment_or_not,
    DATEDIFF(shippedDate, orderDate) AS days_to_ship,
    CASE
        WHEN DATEDIFF(shippedDate, orderDate) <= 3 THEN 'express shipping'
        WHEN DATEDIFF(shippedDate, orderDate) > 15 THEN 'delayed shipping'
        WHEN
            DATEDIFF(shippedDate, orderDate) <= 15
                AND DATEDIFF(shippedDate, orderDate) > 3
        THEN
            'regular shipping'
        ELSE 'unknown'
    END AS shipping_class
FROM
    orders
ORDER BY customerNumber;


SELECT count(emp_no) as Female_Employees,
    CASE
        WHEN hire_date <= '1995-01-01' THEN 'before 1995'
        WHEN hire_date > '1995-01-01' THEN 'after 1995'
        ELSE 'unknown'
    END AS hired
FROM
    employees
WHERE gender = 'F'
GROUP BY hired;



##Inser your name into employees table

insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
values ("500000","1990-01-01", "Sasha", "Hajy", "M", "2000-01-01");

select * from employees
order by emp_no desc;

insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
values ("500000","1990-01-01", "Sasha", "Hajy", "M", "2000-01-01");

select * from employees where emp_no between 499994 and 499999;


 
 INSERT INTO employees(SELECT emp_no+500000,birth_date, first_name, last_name, gender,hire_date
FROM employees WHERE emp_no BETWEEN 499994 AND 499999);
 
 select * from employees
 order by emp_no desc;
 
 update employees
 set last_name ="Hajy Hasani"
 where emp_no=500000;
  
