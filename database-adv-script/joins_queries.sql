-- Question 1: Retrieve all bookings along with the user details for each booking using Inner Join
SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.booking_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;

-- Question 2: Get the list of all properties along with their respective bookings using Left Join
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id
ORDER BY 
    properties.name ASC,
    reviews.rating DESC;


-- Question 3: Retrieve all users and their bookings, including users without bookings using Full Outer Join
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.booking_date
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.id = bookings.user_id;

