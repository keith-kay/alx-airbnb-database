# 📊 Database Normalization to Third Normal Form (3NF)

## 🎯 Objective
Ensure the schema adheres to the principles of normalization up to the **Third Normal Form (3NF)** to eliminate data redundancy and improve data integrity.

---

## 🔍 Step-by-Step Normalization

### ✅ First Normal Form (1NF)
- All attributes are **atomic** (no repeating groups or arrays).
- Each record is **uniquely identifiable** by a primary key.

**Status**: ✅ Achieved

All tables have atomic fields. No repeating groups exist.

---

### ✅ Second Normal Form (2NF)
- Meets all requirements of 1NF.
- All **non-key attributes** are **fully functionally dependent** on the primary key (i.e., no partial dependency).

**Status**: ✅ Achieved

All tables have single-field primary keys (UUIDs), and all non-key attributes depend entirely on the primary key.

---

### ✅ Third Normal Form (3NF)
- Meets all requirements of 2NF.
- There are **no transitive dependencies** (i.e., non-key attributes do not depend on other non-key attributes).

**Status**: ✅ Achieved with Consideration

### Evaluation of Possible Issues

#### 1. `User` Table
- `role`: ENUM — directly relates to the user.
- ✅ No transitive dependencies.

#### 2. `Property` Table
- All attributes depend directly on `property_id`.
- `host_id` is a foreign key — no derived or redundant data.
- ✅ No transitive dependencies.

#### 3. `Booking` Table
- `total_price` could be derived from `pricepernight × number of nights` — however, storing it is acceptable for historical pricing.
- ✅ Functional and acceptable denormalization.

#### 4. `Payment`, `Review`, `Message`
- All attributes depend directly on their respective primary keys.
- ✅ No transitive dependencies.

---

## 📌 Final Notes

- The schema design is **already in 3NF**.
- Any minor denormalization (like `total_price`) is **intentional for performance** and historical accuracy.
- No further changes are necessary at this 
