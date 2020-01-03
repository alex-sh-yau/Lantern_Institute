/*
Change this sql file to your name (save as)
You have 75 mins to do this exam (until 8:30 pm)
It is closed book exam, no book, no power point, no etc.
No connection to the internet please.
Whenever you are done, raise your hand. then we will connect to the internet and email your sql file to me:
amirsina.e@gmail.com
Technical questions are not answered.

###############################################################################
1- Which one is INCORRECT? (2.5 marks)
    a. SQL is a procedural language
    b. MySQL is an example of relational database management systems (RDBMS)
	c. SQL is focused on 'what' rather than 'how'
    d. Data modeler is a person who designs databases

ANSWER: d

###############################################################################
2- Which one is NOT an example of DML command (data manupulation language)? (2.5 marks)
	a. SELECT command
	b. UPDATE command
	c. CREATE command
	d. INSERT command

ANSWER: c

###############################################################################
3- Choose the query that searches for the names having 's' as the second letter in table_1. (2.5 marks)
	a. SELECT name FROM table_1 WHERE name LIKE '%s%'
	b. SELECT name FROM table_1 WHERE name LIKE '_s%'
	c. SELECT name FROM table_1 WHERE name LIKE '_s_'
	d. SELECT name FROM table_1 WHERE name LIKE '%s_'

ANSWER: b

###############################################################################
4- Which one is CORRECT? (2.5 marks)
	a. Primary key is a unique column that can be NULL in a table
	b. Unique key is same as primary key
	c. Foreign key is a column that has unique values and used to connect tables
	d. Nono of the above

ANSWER: d


*/
###############################################################################
############## REMAINING QUESTIONS ARE ABOUT SAKILA DATABASE ##################

#5- Write a query that returns distinct first name of inactive customers with address_id between 290 and 545.
#(10 marks)

select c.first_name, c.address_id, c.active
from customer c inner join address a on c.address_id = a.address_id
where a.address_id >= 290 and a.address_id <= 545 and c.active = 0;


###############################################################################
#6- Write a query that returns the top 10 longest movies, which are not among these ratings: PG, G, NC-17
#(12 marks)

select film_id, title, release_year, length, rating
from film where rating != 'PG' and rating != 'G' and rating != 'NC-17'
order by length desc limit 10;


###############################################################################
#7- Considering payments before 2005-08-01, find out customer ids that have total payments more than $100.
#(15 marks)

select customer_id, sum(amount) as total
from payment
where payment_date < '2005-08-01'
group by customer_id
having total > 100;


###############################################################################
/*8- The management is looking for a list of movies that are:
	Either from store id 1 and has been rented more than 17 times,
    OR from store id 2 and has been rented more than 18 times.
	Provide this list of movies (film id, title, and number of rents) in a single query.
    (20 marks)
*/


select f.film_id, f.title, count(i.film_id) as number_of_rents, r.staff_id as store_id
from rental r inner join inventory i on r.inventory_id = i.inventory_id
inner join film f on i.film_id = f.film_id 
where r.staff_id = 1
group by i.film_id
having number_of_rents > 17

union all

select f.film_id, f.title, count(i.film_id) as number_of_rents, r.staff_id as store_id
from rental r inner join inventory i on r.inventory_id = i.inventory_id
inner join film f on i.film_id = f.film_id 
where r.staff_id = 2
group by i.film_id
having number_of_rents > 18;


###############################################################################
/*9- The management office would like to give a cash bonus to the customers who has purchased more than $200 so far.
However, he wants to make sure that the data is up-to-date.
Write a query for those customers, and return their customer id, and last update of their payments and payments' amount.
(20 marks)
*/

select customer_id, amount, payment_date
from payment
where customer_id in 
(
select customer_id
from payment
group by customer_id
having sum(amount) > 200
)
order by payment_date desc
limit 2;


###############################################################################
/*10- The database administrator recently realised that all mising information on rental id columns in payment table is about rental id 16050.
So we need to do some modifications in database (13 marks in total):

a- Write a query that returns two columns: payment_id, and rental_id filling null values with 16050 (3 marks).

b- Insert a new row to rental table with information below: (5 marks)
(16050, '2005-06-18', 323, 562, '2005-06-25', 1, '2019-12-05')

c- Update and fill the missing values of rental_id column in payment table with correct value 
(Be careful, first do part b and then c to avoid getting an error).
(5 marks)
*/

select payment_id, ifnull(rental_id, 16050) from payment;

insert into rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values (16050, '2005-06-18', 323, 562, '2005-06-25', 1, '2019-12-05');

update payment
set rental_id = 16050
where rental_id is NULL;



