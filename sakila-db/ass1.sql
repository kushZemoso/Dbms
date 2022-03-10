show full tables;

--    Q1 Find out the PG-13 rated comedy movies. DO NOT use the film_list table.

select title as Movie_Name from nicer_but_slower_film_list where rating ="PG-13" and category ="Comedy";

--   Q2  Find out the top 3 rented horror movies.
select * from rental;

select fl.title, COUNT(ALL fl.title) from
    film_list fl,
    inventory i,
    rental r
where
    fl.category = 'Horror'
        AND fl.FID = i.film_id
        AND i.inventory_id = r.inventory_id
GROUP BY title
ORDER BY COUNT(ALL fl.title) DESC
LIMIT 3;


--   Q3  Find out the list of customers from India who have rented sports movies.

select customer_list.name,customer_list.address,customer_list.city,customer_list.phone,film_list.title from customer_list inner join film_list ON 
customer_list.ID=film_list.FID where customer_list.country="India" and film_list.category="Sports";
        
--   Q4 Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.

SELECT * FROM customer_list cl WHERE
    cl.country = 'Canada'
        AND ID IN (SELECT 
            r.customer_id
        FROM
            actor a,
            film_actor fa,
            inventory i,
            rental r
        WHERE
            a.first_name = 'NICK'
                AND a.last_name = 'WAHLBERG'
                AND a.actor_id = fa.actor_id
                AND fa.film_id = i.film_id
                AND i.inventory_id = r.inventory_id);
            

--   Q5  Find out the number of movies in which “SEAN WILLIAMS” acted.

SELECT COUNT(DISTINCT fa.film_id) FROM actor a,film_actor fa
WHERE a.first_name = 'SEAN'
	AND a.last_name = 'WILLIAMS'
	AND fa.actor_id = a.actor_id;
        



