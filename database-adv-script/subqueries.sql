--Task 1: Write a SQL query to find all properties that have an average rating greater than 4.0 from the reviews table using subquery.
SELECT 
    id, name
FROM 
    properties
WHERE 
    id IN (
        SELECT 
            property_id
        FROM 
            reviews
        GROUP BY 
            property_id
        HAVING 
            AVG(rating) > 4.0
    );

--Task 2: Write a SQL query to Find users who have made more than 3 bookings:
SELECT 
    id, name, email
FROM 
    users u
WHERE 
    (
        SELECT 
            COUNT(*) 
        FROM 
            bookings b
        WHERE 
            b.user_id = u.id
    ) > 3;



