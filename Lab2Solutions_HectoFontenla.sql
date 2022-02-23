#In the table actor, which are the actors whose last names are not repeated?
SELECT first_name, last_name FROM actor;
WHERE last_name is distinct;

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
SELECT rating, CONVERT(AVG(ROUND((length, TIME),2)), TIME) as avg_time FROM film
GROUP BY rating
HAVING avg_time > 120.00; 

#Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.