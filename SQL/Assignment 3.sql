SELECT p.productCode, p.productName, ((avg(od.priceEach) - p.buyPrice)/p.buyPrice) as margin
FROM products p INNER JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY od.productCode
order by margin DESC;

SELECT 
    productCode, productName, productLine
FROM
    products p
WHERE
    productLine IN (SELECT 
            p.productLine AS total
        FROM
            products p
                INNER JOIN
            orderdetails od ON p.productCode = od.productCode
        GROUP BY p.productLine
        HAVING SUM(od.quantityOrdered) > 10000)
ORDER BY MSRP DESC;

select ifnull(salesRepEmployeeNumber, 1800)
from customers;

insert into employees values (1800, 'Dave', 'Ruddy', 'x98', 'druddy@classicmodelcars.com', 7, 1102, 'Sales Rep');

update customers 
set salesRepEmployeeNumber = 1800
where salesRepEmployeeNumber is null;


select * 
from employees
where employeeNumber in
(
select reportsTo
from employees)
;

select *
from employees e_1 
where exists (select reportsTo from employees e_2
			  where e_1.employeeNumber = e_2.reportsTo
			  group by reportsTo
              having count(*) > 0);
              
              
select *
from employees e1 join employees e2 on e1.employeeNumber = e2.reportsTo
group by e1.employeeNumber;




select a.actor_id, a.first_name, a.last_name, a.last_update, count(distinct fa.film_id) as num
from actor a inner join film_actor fa on a.actor_id = fa.actor_id
group by a.actor_id order by num desc;


select c.customer_id, c.first_name, c.last_name, count(distinct r.rental_id) as num
from customer c inner join rental r on c.customer_id = r.customer_id 
group by r.customer_id order by num asc;


select customer.*,
		count(distinct rental_id)
from customer inner join rental
on customer.customer_id = rental.customer_id
where active = 1
group by customer.customer_id
order by count(distinct rental_id) asc;

