# Top 10 Owners with the most active listings

SELECT
	o.owner_name,
    COUNT(l.listing_id) AS total_active_listings
FROM listings l
JOIN owners o ON l.owner_id = o.owner_id 
WHERE l.is_active = 1
GROUP BY o.owner_name
ORDER BY total_active_listings DESC
LIMIT 10;

# Owners with the most INactive listings

SELECT
	o.owner_name,
    COUNT(l.listing_id) AS total_inactive_listings
FROM listings l
JOIN owners o ON l.owner_id = o.owner_id 
WHERE l.is_active = 0
GROUP BY o.owner_name
ORDER BY total_inactive_listings DESC
LIMIT 10;