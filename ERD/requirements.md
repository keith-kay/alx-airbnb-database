##erd diagram
![erd](https://github.com/user-attachments/assets/0abe4c8b-f7e0-4257-9096-d2ab03bd79cf)

## 📦 Entities and Their Attributes

### 1. **User**
- `user_id`: UUID, Primary Key, Indexed
- `first_name`: VARCHAR, NOT NULL
- `last_name`: VARCHAR, NOT NULL
- `email`: VARCHAR, UNIQUE, NOT NULL
- `password_hash`: VARCHAR, NOT NULL
- `phone_number`: VARCHAR, NULL
- `role`: ENUM (guest, host, admin), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 2. **Property**
- `property_id`: UUID, Primary Key, Indexed
- `host_id`: UUID, Foreign Key → `User(user_id)`
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `location`: VARCHAR, NOT NULL
- `pricepernight`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### 3. **Booking**
- `booking_id`: UUID, Primary Key, Indexed
- `property_id`: UUID, Foreign Key → `Property(property_id)`
- `user_id`: UUID, Foreign Key → `User(user_id)`
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM (pending, confirmed, canceled), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 4. **Payment**
- `payment_id`: UUID, Primary Key, Indexed
- `booking_id`: UUID, Foreign Key → `Booking(booking_id)`
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `payment_method`: ENUM (credit_card, paypal, stripe), NOT NULL

### 5. **Review**
- `review_id`: UUID, Primary Key, Indexed
- `property_id`: UUID, Foreign Key → `Property(property_id)`
- `user_id`: UUID, Foreign Key → `User(user_id)`
- `rating`: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 6. **Message**
- `message_id`: UUID, Primary Key, Indexed
- `sender_id`: UUID, Foreign Key → `User(user_id)`
- `recipient_id`: UUID, Foreign Key → `User(user_id)`
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## 🔗 Entity Relationships

- **User ↔ Booking**
  - A User can have many Bookings (`1:N`)
  - Each Booking is made by one User

- **User ↔ Property**
  - A User (host) can list many Properties (`1:N`)
  - Each Property is hosted by one User

- **Property ↔ Booking**
  - A Property can be booked many times (`1:N`)
  - Each Booking refers to one Property

- **Booking ↔ Payment**
  - One Payment is linked to one Booking (`1:1`)

- **Property ↔ Review**
  - A Property can have many Reviews (`1:N`)
  - Each Review belongs to one Property

- **User ↔ Review**
  - A User can write many Reviews (`1:N`)
  - Each Review is written by one User

- **User ↔ Message**
  - One User can send and receive many Messages (`1:N`)
  - Each Message has a sender and a recipient (both Users)
