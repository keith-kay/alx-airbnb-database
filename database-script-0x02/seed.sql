INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('uuid-user-1', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '1234567890', 'guest', NOW()),
('uuid-user-2', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '0987654321', 'host', NOW()),
('uuid-user-3', 'Carol', 'Williams', 'carol@example.com', 'hashed_pw3', NULL, 'admin', NOW());

INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('uuid-prop-1', 'uuid-user-2', 'Cozy Apartment', 'A small, modern apartment in the city center.', 'New York, NY', 120.00, NOW(), NOW()),
('uuid-prop-2', 'uuid-user-2', 'Beach House', 'Spacious home with ocean view.', 'Miami, FL', 250.00, NOW(), NOW());

INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('uuid-book-1', 'uuid-prop-1', 'uuid-user-1', '2025-06-01', '2025-06-05', 480.00, 'confirmed', NOW()),
('uuid-book-2', 'uuid-prop-2', 'uuid-user-1', '2025-07-10', '2025-07-12', 500.00, 'pending', NOW());

INSERT INTO Payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('uuid-pay-1', 'uuid-book-1', 480.00, NOW(), 'credit_card');

INSERT INTO Reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
('uuid-rev-1', 'uuid-prop-1', 'uuid-user-1', 5, 'Excellent stay! Very clean and well-located.', NOW());

INSERT INTO Messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('uuid-msg-1', 'uuid-user-1', 'uuid-user-2', 'Hi, is the apartment available for next weekend?', NOW()),
('uuid-msg-2', 'uuid-user-2', 'uuid-user-1', 'Yes, it’s available. Would you like to proceed with the booking?', NOW());
