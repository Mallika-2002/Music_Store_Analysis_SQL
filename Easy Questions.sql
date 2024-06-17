-- 1. Who is the senior most employee based on job title?
select * from employee
	order by levels desc limit 1;

-- 2. Which countries have the most Invoices?
select count(*) as invoice_of_country, billing_country from invoice
	group by billing_country
	order by invoice_of_country desc;

-- 3. What are top 3 values of total invoice?
with cte as (select count(*) as invoice_of_country, billing_country from invoice
	group by billing_country
	order by invoice_of_country desc)
select * from cte limit 3;

-- 4. Which city has the best customers? We would like to throw a promotional Music
-- Festival in the city we made the most money. Write a query that returns one city that
-- has the highest sum of invoice totals. Return both the city name & sum of all invoice
-- totals
select * from invoice;
select sum(total) as invoice_total, billing_city from invoice 
group by billing_city order by invoice_total desc limit 1;

-- 5. Who is the best customer? The customer who has spent the most money will be
-- declared the best customer. Write a query that returns the person who has spent the
-- most money
select c.first_name, c.last_name,c.customer_id , sum(i.total) as total from customer c join invoice i on c.customer_id = i.customer_id
	group by c.customer_id order by total desc limit 1;