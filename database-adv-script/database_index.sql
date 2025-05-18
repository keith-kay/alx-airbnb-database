
EXPLAIN ANALYZE
SELECT
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_number
FROM
    bookings
GROUP BY
    property_id;


CREATE INDEX idx_users_id ON users(id);

-- Index on bookings.user_id to speed up joins and filtering
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id to speed up joins and aggregations
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on properties.id (commonly joined)
CREATE INDEX idx_properties_id ON properties(id);

-- Index on reviews.property_id to optimize average rating subqueries
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Optional: index on bookings.booking_date to improve ORDER BY or date filtering
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);