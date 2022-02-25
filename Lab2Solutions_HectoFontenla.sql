
#In the table actor, which are the actors whose last names are not repeated?
#GROUP BY last_name
-- [ 1,1,1,3,4,4,5].unique() -> [1,3,4,5]
SELECT distinct(last_name), first_name from actor
ORDER BY last_name;


-- Paso 1: Determino cuantas veces aparece cada apellido
select last_name, count(last_name) as num from actor
group by last_name
order by last_name;

-- Añado un filtro para mostrar solo los apellidos que aparecen una vez
select last_name, count(last_name) as num from actor
group by last_name
having num = 1
order by last_name;

-- Cojo solo la primera columna de la tabla anterior
select first_name, last_name from actor 
where last_name in (
select last_name from (select last_name, count(last_name) as num from actor
group by last_name
having num = 1
order by last_name) as s1);

-- 
select last_name from 
(select last_name, count(last_name) as num from actor
group by last_name
having num = 1
order by last_name) as s1;


SELECT first_name, last_name from actor
where last_name not in distinct last_name ;

#Which last names appear more than once? 
#We would use the same logic as in the previous question but this time we want to include
#the last names of the actors where the last name was present more than once

#Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, count(rental_id) from rental
GROUP BY staff_id;

#Using the film table, find out how many films were released each year.
SELECT count(title), release_year FROM film
GROUP by release_year;

#Using the film table, find out for each rating how many films were there.
SELECT count(title), rating FROM film
GROUP by rating;

#What is the mean length of the film for each rating type. 
#Round off the average lengths to two decimal places
SELECT rating, ROUND(AVG(length),2) FROM film
GROUP by rating;

#Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, AVG(ROUND(length, 2)) as avg_time FROM film
GROUP BY rating
HAVING avg_time > 120;

#Rank films by length (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, and the rank.

SELECT title, length FROM film
WHERE length IS NOT NULL OR length <> 0
GROUP BY film_id
ORDER BY length DESC;
