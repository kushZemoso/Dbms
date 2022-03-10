        
select count(distinct title) from film where special_features like '%Deleted Scenes%' and film.film_id in 
(select fc.film_id 
	from category c, film_category fc
		where c.name = 'Documentary' and c.category_id = fc.category_id);