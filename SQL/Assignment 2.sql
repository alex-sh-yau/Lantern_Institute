SELECT sum(salary), d.dept_name
FROM
dept_emp de INNER JOIN salaries s on de.emp_no = s.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE
de.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
AND (d.dept_name = 'Finance' OR d.dept_name = 'Sales')
GROUP BY d.dept_name;



SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM dept_manager dm INNER JOIN salaries s on dm.emp_no = s.emp_no
INNER JOIN employees e on dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
ORDER BY s.salary ASC;


SELECT t.title, avg(s.salary), count(t.emp_no)
FROM titles t INNER JOIN salaries s ON t.emp_no = s.emp_no
WHERE t.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
group by t.title ORDER BY t.title;


SELECT p.productCode, p.productName, sum(od.quantityOrdered) as total
FROM products p INNER JOIN orderdetails od ON p.productCode = od.productCode
group by p.productCode ORDER BY total DESC;


SELECT c.customerNumber,
         customerName,
        phone,
        postalCode,
        addressLine1,
        COUNT(distinct orderNumber)  num_or_amt_of_purchase
FROM customers c INNER JOIN orders o
ON c.customerNumber = o.customerNumber
GROUP BY customerNumber,
         customerName,
        phone,
        postalCode,
        addressLine1,
        addressLine2
HAVING num_or_amt_of_purchase > 5
UNION ALL
SELECT c.customerNumber,
        customerName,
        phone,
        postalCode,
        addressLine1,
        SUM(amount)  num_or_amt_of_purchase
FROM customers c INNER JOIN payments p
ON c.customerNumber = p.customerNumber
GROUP BY customerNumber,
        customerName,
        phone,
        postalCode,
        addressLine1,
        addressLine2
HAVING num_or_amt_of_purchase > 150000;


SELECT o.officeCode, sum(p.amount) as total
FROM payments p INNER JOIN customers c ON p.customerNumber = c.customerNumber
INNER JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber
INNER JOIN offices o ON e.officeCode = o.officeCode
GROUP BY o.officeCode ORDER BY total DESC;


SELECT p.productCode, p.productName, ((avg(od.priceEach) - p.buyPrice)/p.buyPrice) as margin
FROM products p INNER JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY od.productCode
order by margin DESC;



SELECT 
    c.customerName,
    avg(c.creditLimit) AS credit
FROM
    customers c
        INNER JOIN
    orders o ON c.customerNumber = o.customerNumber
        INNER JOIN
    orderdetails od ON od.orderNumber = o.orderNumber
GROUP BY c.customerNumber
HAVING (credit - avg(od.priceEach)*avg(quantityOrdered)) < 40000 
UNION ALL SELECT 
    customerName, creditLimit AS credit
FROM
    customers
HAVING credit = 0;


SELECT  c.customerName,
	c.creditLimit
from 	customers c
where 	c.creditLimit = 0
union all
SELECT 	c.customerName,
	avg(c.creditLimit) LIMITT
FROM 	customers c LEFT JOIN orders o
ON 	c.customerNumber = o.customerNumber
LEFT JOIN orderdetails od
ON 	o.orderNumber = od.orderNumber
GROUP By c.customerNumber
HAVING (LIMITT - avg(od.priceEach)*avg(quantityOrdered)) < 40000;
