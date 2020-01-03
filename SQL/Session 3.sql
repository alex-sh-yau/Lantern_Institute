SELECT 
    e.first_name, e.last_name, e.emp_no, s.salary, t.title
FROM
    employees e
        INNER JOIN
    salaries s ON e.emp_no = s.emp_no
        INNER JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
        AND s.to_date = '9999-01-01'
        AND t.to_date = '9999-01-01'
ORDER BY s.salary;

SELECT 
    AVG(s.salary) AS Average_Salary, t.title AS Title, COUNT(DISTINCT e.emp_no) as Cnt_Emp
FROM
    employees e
        INNER JOIN
    salaries s ON e.emp_no = s.emp_no
        INNER JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    s.to_date = '9999-01-01'
        AND t.to_date = '9999-01-01'
GROUP BY t.title
ORDER BY Average_Salary;