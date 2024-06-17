-- 1. Find how much amount spent by each customer on artists? Write a query to return
-- customer name, artist name and total spent
select distinct customer.first_name ,artist.name, invoice.total from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on track.track_id = invoice_line.track_id
join album on track.album_id = album.album_id
join artist on artist.artist_id = album.artist_id;


-- 2. We want to find out the most popular music Genre for each country. We determine the
-- most popular genre as the genre with the highest amount of purchases. Write a query
-- that returns each country along with the top Genre. For countries where the maximum
-- number of purchases is shared return all Genres

	
-- 3. Write a query that determines the customer that has spent the most on music for each
-- country. Write a query that returns the country along with the top customer and how
-- much they spent. For countries where the top amount spent is shared, provide all
-- customers who spent this amount