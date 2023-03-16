--Week 5 - Wednesday Questions


1. List all customers who live in Texas (use JOINs)

SELECT c.first_name, c.last_name, a.district 
FROM address a
JOIN customer c
ON c.address_id = a.address_id 
WHERE district = 'Texas'
;

--first_name|last_name|district|
------------+---------+--------+
--Jennifer  |Davis    |Texas   |
--Kim       |Cruz     |Texas   |
--Richard   |Mccrary  |Texas   |
--Bryan     |Hardison |Texas   |
--Ian       |Still    |Texas   |


2. List all payments of more than $7.00 with the customer’s first and last name

SELECT c.first_name, c.last_name, p.amount
FROM payment p
JOIN customer c
ON c.customer_id = p.customer_id
GROUP BY c.last_name, p.amount, c.first_name 
HAVING amount > 7
ORDER BY amount 
;

--first_name |last_name   |amount|
-------------+------------+------+
--Gail       |Knight      |  7.98|
--Heather    |Morris      |  7.98|
--Justin     |Ngo         |  7.98|
--Cathy      |Spencer     |  7.98|
--Margie     |Wade        |  7.98|
--Rafael     |Abney       |  7.99|
--Diana      |Alexander   |  7.99|
--Gordon     |Allard      |  7.99|
3. Show all customer names who have made over $175 in payments (use
subqueries)

SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

--customer_id|store_id|first_name|last_name|email                            |address_id|activebool|create_date|last_update            |active|
-------------+--------+----------+---------+---------------------------------+----------+----------+-----------+-----------------------+------+
--        137|       2|Rhonda    |Kennedy  |rhonda.kennedy@sakilacustomer.org|       141|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        144|       1|Clara     |Shaw     |clara.shaw@sakilacustomer.org    |       148|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        148|       1|Eleanor   |Hunt     |eleanor.hunt@sakilacustomer.org  |       152|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        178|       2|Marion    |Snyder   |marion.snyder@sakilacustomer.org |       182|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        459|       1|Tommy     |Collazo  |tommy.collazo@sakilacustomer.org |       464|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        526|       2|Karl      |Seal     |karl.seal@sakilacustomer.org     |       532|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|

4. List all customers that live in Argentina (use the city table)

SELECT c.first_name, c.last_name, a,district, city.city, country.country 
FROM customer c
JOIN address a
ON c.address_id = a.address_id 
JOIN city 
ON a.city_id  = city.city_id 
JOIN country 
ON city.country_id = country.country_id
WHERE country.country = 'Argentina'
;

first_name|last_name|a                                                                                                |district    |city                |country  |
----------+---------+-------------------------------------------------------------------------------------------------+------------+--------------------+---------+
--Willie    |Markham  |(364,1623 Kingstown Drive,,Buenos Aires,20,91299,296394569728,'2006-02-15 09:45:30')             |Buenos Aires|Almirante Brown     |Argentina|
--Jordan    |Archuleta|(566,1229 Varanasi (Benares) Manor,,Buenos Aires,43,40195,817740355461,'2006-02-15 09:45:30')    |Buenos Aires|Avellaneda          |Argentina|
--Jason     |Morrissey|(327,1427 A Corua (La Corua) Place,,Buenos Aires,45,85799,972574862516,'2006-02-15 09:45:30')    |Buenos Aires|Baha Blanca         |Argentina|
--Kimberly  |Lee      |(28,96 Tafuna Way,,Crdoba,128,99865,934730187245,'2006-02-15 09:45:30')                          |Crdoba      |Crdoba              |Argentina|
--Micheal   |Forman   |(450,203 Tambaram Street,,Buenos Aires,161,73942,411549550611,'2006-02-15 09:45:30')             |Buenos Aires|Escobar             |Argentina|
--Darryl    |Ashcraft |(536,166 Jinchang Street,,Buenos Aires,165,86760,717566026669,'2006-02-15 09:45:30')             |Buenos Aires|Ezeiza              |Argentina|
--Julia     |Flores   |(93,1926 El Alto Avenue,,Buenos Aires,289,75543,846225459260,'2006-02-15 09:45:30')              |Buenos Aires|La Plata            |Argentina|
--Florence  |Woods    |(111,1532 Dzerzinsk Way,,Buenos Aires,334,9599,330838016880,'2006-02-15 09:45:30')               |Buenos Aires|Merlo               |Argentina|
--Perry     |Swafford |(591,773 Dallas Manor,,Buenos Aires,424,12664,914466027044,'2006-02-15 09:45:30')                |Buenos Aires|Quilmes             |Argentina|
--Lydia     |Burke    |(247,1483 Pathankot Street,,Tucumn,454,37288,686015532180,'2006-02-15 09:45:30')                 |Tucumn      |San Miguel de Tucumn|Argentina|
--Eric      |Robert   |(336,430 Kumbakonam Drive,,Santa F,457,28814,105470691550,'2006-02-15 09:45:30')                 |Santa F     |Santa F             |Argentina|
--Leonard   |Schofield|(410,88 Nagaon Manor,,Buenos Aires,524,86868,779461480495,'2006-02-15 09:45:30')                 |Buenos Aires|Tandil              |Argentina|
--Willie    |Howell   |(223,1244 Allappuzha (Alleppey) Place,,Buenos Aires,567,20657,991802825778,'2006-02-15 09:45:30')|Buenos Aires|Vicente Lpez        |Argentina|


5. Show all the film categories with their count in descending ORDER

SELECT category.category_id, category.name, COUNT(*) AS num_movies_in_cat
FROM category
JOIN film_category 
ON category.category_id = film_category.category_id
GROUP BY category.category_id, category.name
ORDER BY num_movies_in_cat DESC;

--category_id|name       |num_movies_in_cat|
-------------+-----------+-----------------+
--         15|Sports     |               74|
--          9|Foreign    |               73|
--          8|Family     |               69|
--          6|Documentary|               68|
--          2|Animation  |               66|
--          1|Action     |               64|
--         13|New        |               63|
--          7|Drama      |               62|
6. What film had the most actors in it (show film info)?


SELECT film.film_id, film.title, max(num_actors) as num_actors
FROM film
JOIN (
    SELECT film_id, COUNT(*) AS num_actors
    FROM film_actor
    GROUP BY film_id
) AS actor_counts ON film.film_id = actor_counts.film_id
GROUP BY film.film_id, film.title
ORDER BY num_actors DESC
LIMIT 1;

film_id|title           |num_actors|
-------+----------------+----------+
    508|Lambs Cincinatti|        15|

7. Which actor has been in the least movies?

SELECT actor.actor_id, actor.first_name, actor.last_name, COUNT(film_actor.film_id) AS num_movies
FROM actor
LEFT JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY num_movies ASC
LIMIT 1;

actor_id|first_name|last_name|num_movies|
--------+----------+---------+----------+
     148|Emily     |Dee      |        14|
8. Which country has the most cities?

SELECT co.country_id, co.country, COUNT(*) AS num_cities
FROM country co
JOIN city ci
ON co.country_id = ci.country_id
GROUP BY co.country_id, co.country
ORDER BY num_cities DESC
LIMIT 3;
--
--country_id|country      |num_cities|
------------+-------------+----------+
--        44|India        |        60|
--        23|China        |        53|
--       103|United States|        35|
       
9. List the actors who have been in between 20 and 25 films.

SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS count
FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id
JOIN film f
ON fa.film_id = f.film_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING count(*) BETWEEN 20 AND 25 
ORDER BY actor_id  ASC 
;

--actor_id|first_name |last_name  |count|
----------+-----------+-----------+-----+
--       2|Nick       |Wahlberg   |   25|
--       3|Ed         |Chase      |   22|
--       4|Jennifer   |Davis      |   22|
--       6|Bette      |Nicholson  |   20|
--       8|Matthew    |Johansson  |   20|
--       9|Joe        |Swank      |   25|
--      10|Christian  |Gable      |   22|
--      11|Zero       |Cage       |   25|
--.......
