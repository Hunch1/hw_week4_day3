-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT address_id, first_name, last_name
FROM customer
WHERE address_id IN(
    SELECT address_id 
    FROM address
    INNER JOIN city
    on address.city_id=city.city_id
    INNER JOIN country
    on city.country_id=country.country_id
    WHERE country = 'Texas'

);

-- first looked in the city table to find someone in texas noone and then tried country for anything matching texas.
-- found zero matches

-- no one found 

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id 
    FROM payment
    GROUP BY customer_id
    HAVING Sum(amount) > 6.99
);

-- got Mary Smith and Peter Menard with payments above 6.99

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id 
    FROM payment
    GROUP BY customer_id
    HAVING Sum(amount) > 175
);
-- Got mary smith and petere menard again 

-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT address_id, first_name, last_name
FROM customer
WHERE address_id IN(
    SELECT address_id 
    FROM address
    INNER JOIN city
    on address.city_id=city.city_id
    INNER JOIN country
    on city.country_id=country.country_id
    WHERE country = 'Nepal'

);

-- found one customer kevin schuler in Nepal

-- 5. Which staff member had the most
-- transactions?
SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id
ORDER BY COUNT(payment_id) DESC;
 
-- staff memeber with id 2 has the sold the most, didn't ask for names so just used the table 
-- with the info


-- 6. How many movies of each rating are
-- there?
SELECT title, COUNT(rating)
FROM film
GROUP BY title
ORDER BY COUNT(rating) DESC;
 
-- found 1001 movies but had a hard time grouping them by rating

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id 
    FROM payment
    GROUP BY customer_id
    HAVING COUNT(DISTINCT amount) > 6.99
);
-- found 499 customers who have a made at least a single payment over 6.99

-- 8. How many free rentals did our stores give away?
SELECT COUNT(amount)
FROM payment
WHERE amount <= 0

-- looked for matching amounts that were less than or equal to 0 and i got 14564 zero or negative rentals, damn