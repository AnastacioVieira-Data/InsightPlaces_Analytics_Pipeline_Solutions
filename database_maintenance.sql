# Adding a neu column to store the count of properties per owner

ALTER TABLE owners
ADD COLUMN total_listings INT DEFAULT 0;

SELECT * FROM owners;

-- ====================================================================================
-- Data Updating
-- Step 1: Checking if the results on the screen are exactly the once to be updated
SELECT *
FROM listings
WHERE listing_id IN ('1', '10', '100');

-- Step 2: Once validated, update listing_status for specific IDs after owner contact
UPDATE listings
SET is_active = 1
WHERE listing_id IN ('1', '10', '100');

-- Step 3: testing if update was successful
SELECT 
	listing_id,
    is_active
FROM listings
WHERE listing_id IN ('1', '10', '100');

-- ===============================================================================================
-- Updating Owner's contact email after request

-- Step 1: Checking currente contact information for owner 1009
SELECT *
FROM owners
WHERE owner_id = '1009';

-- Step 2: Once validated, update the email address
UPDATE owners
SET contact = 'daniela_120@gmail.com'
WHERE owner_id = '1009';

-- Step 3: Verifying the Update
SELECT *
FROM owners
WHERE owner_id ='1009';