## Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql

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

## Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.

EXPLAIN ANALYZE
SELECT users.name, COUNT(bookings.id)
FROM users
JOIN bookings ON users.id = bookings.user_id
GROUP BY users.name;