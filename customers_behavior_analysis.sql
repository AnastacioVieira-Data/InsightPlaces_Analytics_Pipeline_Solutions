# Average ticket per customer
SELECT
	customer_id, 
	ROUND(AVG(total_price), 2) AS average_ticket,
    COUNT(booking_id) AS number_bookings,
    SUM(total_price) AS total_price
FROM bookings
GROUP BY customer_id, total_price
ORDER BY total_price DESC;

# Average length of stay
SELECT
	customer_id,
    SUM(DATEDIFF(end_date, start_date)) AS number_of_days,
    ROUND(AVG(DATEDIFF(end_date, start_date)), 0) AS average_length_of_stay
FROM bookings
GROUP BY customer_id
ORDER BY average_length_of_stay DESC;

