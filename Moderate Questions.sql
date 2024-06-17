-- Moderate Questions
-- 1. Write query to return the email, first name, last name, & Genre of all Rock Music
-- listeners. Return your list ordered alphabetically by email starting with A
Select distinct first_name, last_name , email from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (select track_id from track join genre on 
	track.genre_id = genre.genre_id
	where genre.name like 'Rock')
order by email;

-- 2. Let's invite the artists who have written the most rock music in our dataset. Write a
-- query that returns the Artist name and total track count of the top 10 rock bands
select artist.artist_id, artist.name , count(artist.artist_id) as number_of_songs 
from track
join album on track.album_id = album.album_id 
join artist on album.artist_id = artist.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10;


-- 3. Return all the track names that have a song length longer than the average song length.
-- Return the Name and Milliseconds for each track. Order by the song length with the
-- longest songs listed first
select * from track;
select track.name, track.milliseconds from track where track.milliseconds > (select avg(track.milliseconds) from track)
order by track.milliseconds desc;



