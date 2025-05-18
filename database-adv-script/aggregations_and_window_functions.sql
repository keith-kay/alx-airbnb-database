--Using COUNT and GROUP BY to get total bookings by each user:
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    COUNT(bookings.id) AS total_bookings
FROM 
    users
LEFT JOIN 
    bookings ON users.id = bookings.user_id
GROUP BY 
    users.id, users.name;

--Using RANK() window function to rank properties based on number of bookings:
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_number
FROM 
    bookings
GROUP BY 
    property_id;

