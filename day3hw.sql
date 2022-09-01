--1. List all customers who live in Texas (use JOINs)
--Kim Cruz, Jennifer Davis, Bryan Hardison, Ian Still, Richard McCrary

SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas'

--2. Get all payments above $6.99 with the Customer's Full Name
--It works and produces 4404 customers.

SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name, amount
HAVING sum(amount) > 6.99

--3. Show all customers names who have made payments over $175(use subqueries)
--not sure if im suppose to type all 20 names but if you run the query it works

SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name, amount
HAVING sum(amount) > 175

--4. List all customers that live in Nepal (use the city table)
--says none so i may have done it wrong

SELECT first_name, last_name, city
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON city.city_id = address.city_id
WHERE city = 'nepal'

--5. Which staff member had the most transactions?
--staff id 2

SELECT first_name, last_name, staff_id
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id  --this didn't work
GROUP BY staff_id
ORDER BY sum(amount) DESC

SELECT staff_id
FROM payment
GROUP BY staff_id  --this worked
ORDER BY sum(amount) DESC

--6. How many movies of each rating are there?
-- G = 179, PG = 194, PG-13 = 223, R = 195, NC-17 209
SELECT film_id, rating
from film
WHERE rating = 'G'

SELECT film_id, rating
from film
WHERE rating = 'PG'

SELECT film_id, rating
from film
WHERE rating = 'PG-13' --I'm sure there's an easier way to do this but i couldn't seem to figure it out.

SELECT film_id, rating
from film
WHERE rating = 'R'

SELECT film_id, rating
from film
WHERE rating = 'NC-17'

--7. Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name, amount
HAVING sum(amount) > 6.99

--8. How many free rentals did our stores give away?
SELECT *
FROM payment
WHERE amount = 0