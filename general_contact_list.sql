# Creating General Contact List (Owners and Customers)

SELECT
	c.customer_name AS name,
    c.contact,
    'customers' AS type
FROM customers c
UNION
SELECT
	o.owner_name AS name,
    o.contact,
    'owners' AS type
FROM owners o;