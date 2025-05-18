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
    b.id AS booking_id,
    b.booking_date,
    b.status,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.payment_date,
    pay.status AS payment_status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pay ON b.id = pay.booking_id
WHERE 
    b.status = 'confirmed';  -- filter example to reduce rows processed

-- Notes:
-- 1. Ensure indexes exist on bookings.user_id, bookings.property_id, payments.booking_id for faster joins.
-- 2. Add an index on bookings.status if filtering by status is frequent.
-- 3. Use EXPLAIN ANALYZE for detailed execution time and row counts.
