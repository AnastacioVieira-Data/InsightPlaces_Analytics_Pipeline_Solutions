-- Deleting listings 10000 and 1001 and their related records

-- Step 1: Investigating table relationships (finding the "children')

SELECT
TABLE_SCHEMA AS 'Database',
TABLE_NAME AS 'Child_Table',
COLUMN_NAME AS 'Foreign_Key_Column',
REFERENCED_TABLE_NAME AS 'Parent_Table'
FROM
INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
REFERENCED_TABLE_NAME = 'listings';

-- Step 2: Checking records in all tables before deletion

SELECT * FROM reviews WHERE listing_id IN ('10000', '1001');
SELECT * FROM bookings WHERE listing_id IN ('10000', '1001');
SELECT * FROM listings WHERE listing_id IN ('10000', '1001');

-- Step 3: Executing deletion in the correct order

-- 1. Deleting from children tables (The 'children': reviews and bookings)
DELETE FROM reviews
WHERE listing_id IN ('1000' '1001');

DELETE FROM bookings
WHERE listing_id IN ('1000' '1001');

-- 2. Deleting from parent table (the 'parent': listings)
DELETE FROM listings
WHERE listing_id IN ('1000' '1001');

-- Step 4: Final check: Searching for the deleted records.
SELECT *
FROM listings 
WHERE  listing_id IN ('1000' '1001');

