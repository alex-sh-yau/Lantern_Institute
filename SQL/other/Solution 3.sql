#1.
select * from products  p
where p.productLine IN (select pl.productLine from productlines pl inner join products p
						ON p.productLine = pl.productLine
                        inner join orderdetails
                        ON orderdetails.productCode = p.productCode
                        GROUP BY pl.productLine
                        HAVING sum(quantityOrdered) > 10000)
order by msrp desc;
                        

#2
#i
select ifnull(salesRepEmployeeNumber, 1800)
from customers;
#ii
insert into employees values (1800, 'Dave' , 'Ruddy' , 'x98', 'druddy@classicmodelcars.com', 7, 1102, 'Sales Rep');
#iii
update customers 
set salesRepEmployeeNumber = 1800
where salesRepEmployeeNumber is null;

#3
#i
select *
from employees
where employees.employeeNumber in (select reportsTo from employees
									group by reportsTo
                                    having count(*) > 0);
#ii
#you need to define two different alies for you tables
select *
from employees e_1 
where exists (select reportsTo from employees e_2
			  where e_1.employeeNumber = e_2.reportsTo
			  group by reportsTo
              having count(*) > 0);
              
#iii
select e_1.*
from employees e_1 inner join employees e_2
ON e_1.employeeNumber = e_2.reportsTo
group by e_1.employeeNumber;

#4
select actor.*,
		count(distinct film.film_id)
from actor inner join film_actor
on actor.actor_id = film_actor.actor_id
inner join film
ON film_actor.film_id = film.film_id
group by film_actor.actor_id
order by count(distinct film.film_id) asc;

#5
select customer.*,
		count(distinct rental_id)
from customer inner join rental
on customer.customer_id = rental.customer_id
where active = 1
group by customer.customer_id
order by count(distinct rental_id) asc;