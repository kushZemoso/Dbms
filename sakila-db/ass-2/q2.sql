        
select fc.film_id, count(all fc.film_id) 
	from category c, film_category fc, inventory i, rental r, staff s
		where c.name = 'Sci-fi'
		and c.category_id = fc.category_id 
        and fc.film_id = i.film_id
        and i.inventory_id = r.inventory_id
        and r.staff_id = s.staff_id
        and s.first_name = 'Jon' and s.last_name ='Stephens'
        Group by fc.film_id;