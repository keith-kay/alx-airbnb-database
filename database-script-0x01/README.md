# Task: SQL Schema Definition for a Relational Database

## Objective

The goal of this task is to design and implement the SQL schema for a property booking platform. This includes defining all necessary tables, establishing relationships through foreign keys, enforcing data integrity with constraints, and optimizing access through indexing.

---

## Task Breakdown

### 1. **Entity Identification**

Key entities identified based on the system requirements include:
- `User`
- `Property`
- `Booking`
- `Payment`
- `Review`
- `Message`

Each entity represents a distinct object in the system and is defined with relevant attributes such as unique IDs, timestamps, and status fields.

---

### 2. **Schema Design**

Using SQL `CREATE TABLE` statements:
- Each entity is defined with a primary key.
- Data types are carefully selected for each attribute (e.g., `UUID`, `VARCHAR`, `ENUM`, `DECIMAL`, `TIMESTAMP`).
- Constraints such as `NOT NULL`, `UNIQUE`, `CHECK`, and `FOREIGN KEY` are applied to maintain data integrity.

---

### 3. **Relationships and Constraints**

Relationships were implemented using foreign keys:
- A `User` can own multiple `Properties`.
- A `User` can book a `Property`.
- Each `Booking` is linked to a `Payment`.
- `Users` can leave `Reviews` for `Properties`.
- The `Message` entity supports communication between users through self-referencing foreign keys.

---

### 4. **Indexing Strategy**

To enhance query performance:
- Primary keys are indexed automatically.
- Additional indexes are added on frequently queried fields such as `email`, `property_id`, and `booking_id`.

---

## Summary

The completed SQL schema reflects a well-structured relational database design that:
- Captures all business rules and relationships.
- Maintains data integrity through constraints.
- Supports efficient queries via indexing.
- Is scalable and maintainable for future enhancements.

