-- Step 1: Analyze initial query performance
EXPLAIN
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

-- Step 2: Refactor query for performance improvement

-- Example: Add filtering on booking status to reduce the dataset
-- (Use appropriate WHERE clause depending on your use case)
EXPLAIN
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
    payments ON bookings.id = payments.booking_id
WHERE 
    bookings.status = 'confirmed'
    AND payments.status = 'successful';

-- Notes:
-- 1. Ensure indexes exist on bookings.user_id, bookings.property_id, payments.booking_id for faster joins.
-- 2. Add an index on bookings.status if filtering by status is frequent.
-- 3. Use EXPLAIN ANALYZE for detailed execution time and row counts.
