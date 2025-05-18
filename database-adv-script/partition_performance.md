
EXPLAIN ANALYZE
SELECT * FROM bookings_original
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';


Performance Testing
Query Tested
SELECT * FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';
EXPLAIN ANALYZE Comparison
| Metric | Before Partitioning | After Partitioning |
|-------------------------------|----------------------|-------------------------|
| **Planning Time** | High | Reduced |
| **Execution Time** | Slower | Faster |
| **Scanned Rows** | Full table scan | Only 1 partition scanned |
| **Disk I/O** | Higher | Reduced |