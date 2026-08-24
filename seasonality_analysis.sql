# Analyzing booking demand by year and monthe to identify seasonality

SELECT 
	YEAR(start_date) AS booking_year,
    MONTH(start_date) AS booking_month,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY booking_year, booking_month
ORDER BY total_bookings DESC;


