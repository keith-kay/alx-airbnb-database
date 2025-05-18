# SQL Joins Practice



## Tasks

### 0. Write Complex Queries with Joins

# 0.1. 
Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.

# 0.2.
Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.

# 0.3.
Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

### 1.  Practice Subqueries

# 1.1.
Write a query to find all properties where the average rating is greater than 4.0 using a subquery.

# 1.2.
Write a correlated subquery to find users who have made more than 3 bookings.

### 2. Apply Aggregations and Window Functions

# 2.1.
Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

# 2.2. 
Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

### 3. Implement Indexes for Optimization

# 3.1.
Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).

# 3.2.
Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql

# 3.3.
Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.





