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

ANSWER:

###############################################################################
2- Which one is NOT an example of DML command (data manupulation language)? (2.5 marks)
	a. SELECT command
	b. UPDATE command
	c. CREATE command
	d. INSERT command

ANSWER:

###############################################################################
3- Choose the query that searches for the names having 's' as the second letter in table_1. (2.5 marks)
	a. SELECT name FROM table_1 WHERE name LIKE '%s%'
	b. SELECT name FROM table_1 WHERE name LIKE '_s%'
	c. SELECT name FROM table_1 WHERE name LIKE '_s_'
	d. SELECT name FROM table_1 WHERE name LIKE '%s_'

ANSWER:

###############################################################################
4- Which one is CORRECT? (2.5 marks)
	a. Primary key is a unique column that can be NULL in a table
	b. Unique key is same as primary key
	c. Foreign key is a column that has unique values and used to connect tables
	d. Nono of the above

ANSWER:


*/
###############################################################################
############## REMAINING QUESTIONS ARE ABOUT SAKILA DATABASE ##################

#5- Write a query that returns distinct first name of inactive customers with address_id between 290 and 545.
#(10 marks)






###############################################################################
#6- Write a query that returns the top 10 longest movies, which are not among these ratings: PG, G, NC-17
#(12 marks)







###############################################################################
#7- Considering payments before 2005-08-01, find out customer ids that have total payments more than $100.
#(15 marks)







###############################################################################
/*8- The management is looking for a list of movies that are:
	Either from store id 1 and has been rented more than 17 times,
    OR from store id 2 and has been rented more than 18 times.
	Provide this list of movies (film id, title, and number of rents) in a single query.
    (20 marks)
*/










###############################################################################
/*9- The management office would like to give a cash bonus to the customers who has purchased more than $200 so far.
However, he wants to make sure that the data is up-to-date.
Write a query for those customers, and return their customer id, and last update of their payments and payments' amount.
(20 marks)
*/








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







