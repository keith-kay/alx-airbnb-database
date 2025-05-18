-- Step 1: Initial Query
SELECT 
    bookings.id AS booking_id,
    bookings.booking_date,
    bookings.status,
    users.id AS user_id,
    users.name AS user_name,
    users.email,
    properties.id AS property_id,
    properties.name AS property_name,
    properties.location,
    payments.id AS payment_id,
    payments.amount,
    payments.payment_date,
    payments.status AS payment_status
FROM 
    bookings
JOIN 
    users ON bookings.user_id = users.id
JOIN 
    properties ON bookings.property_id = properties.id
JOIN 
    payments ON bookings.id = payments.booking_id;
