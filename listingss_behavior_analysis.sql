# Top Listings
SELECT *
FROM reviews
WHERE rating >= 4;

-- Partnership with Hotels
SELECT *
FROM listings 
WHERE 
	property_type = 'hotel' AND
    is_active = 1;
    
