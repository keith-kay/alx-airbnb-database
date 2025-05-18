-- Step 1: Rename original table
ALTER TABLE bookings RENAME TO bookings_original;

-- Step 2: Create partitioned parent table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- other columns as needed
    CONSTRAINT bookings_date_check CHECK (start_date IS NOT NULL)
) PARTITION BY RANGE (start_date);

-- Step 3: Create monthly partitions
CREATE TABLE bookings_2025_01 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE TABLE bookings_2025_02 PARTITION OF bookings
    FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

-- Add more as needed...

-- Step 4: Copy data from original table into partitioned structure
INSERT INTO bookings
SELECT * FROM bookings_original;

-- Step 5: (Optional) Drop the old table
-- DROP TABLE bookings_original;
