# E-Commerce System ERD – Explained

## Overview

This document explains the structure and design decisions behind the E-Commerce database schema.

The system is designed to handle:

* User and customer management
* Product catalog
* Orders and order items
* Payments and shipping
* Product reviews

---

## Core Design Principles

* Separation of concerns between entities
* Clear one-to-many and one-to-one relationships
* Scalable structure for future extensions
* Normalized database design (avoiding redundancy)

---

## Entities Breakdown

### Users

Represents system-level authentication.

**Key points:**

* Stores login credentials
* Independent from business data
* Linked to customers via a one-to-one relationship

---

### Customers

Represents actual users of the system (buyers).

**Key points:**

* Extends the `Users` table logically
* Contains personal and contact information
* One customer can place multiple orders

---

### Products

Represents items available for sale.

**Key points:**

* Stores core product data (name, price, quantity)
* Supports extended descriptions
* Linked to images and reviews

---

### ProductImages

Stores multiple images per product.

**Relationship:**

* One product → many images

---

### Reviews

Represents customer feedback on products.

**Relationship:**

* One customer → many reviews
* One product → many reviews

**Constraints:**

* Score is limited between 1 and 5

---

### Orders

Represents a purchase transaction.

**Key points:**

* Belongs to one customer
* Contains order metadata (date, status, total)

---

### OrderItems

Represents items inside an order.

**Why this table exists:**

* Resolves the many-to-many relationship between Orders and Products

**Relationship:**

* One order → many items
* One product → many order items

---

### Payments

Represents payment transactions.

**Key points:**

* Linked to both order and customer
* Stores payment details and timestamps

**Note:**

* Currently modeled as one payment per order, but can be extended to support multiple payments

---

### Shipping

Represents shipping information per order.

**Relationship:**

* One order → one shipping record

**Key points:**

* Includes carrier and tracking number
* Linked to shipping status

---

### ShippingStatus

Represents allowed shipping states.

**Examples:**

* Processing
* OutForDelivery
* Delivered
* Delayed
* Lost

**Design choice:**

* Implemented as a lookup table for consistency and control

---

## Relationships Summary

| Relationship             | Type        |
| ------------------------ | ----------- |
| Users → Customers        | One-to-One  |
| Customers → Orders       | One-to-Many |
| Products → ProductImages | One-to-Many |
| Products → Reviews       | One-to-Many |
| Customers → Reviews      | One-to-Many |
| Orders → OrderItems      | One-to-Many |
| Products → OrderItems    | One-to-Many |
| Orders → Payments        | One-to-One  |
| Orders → Shipping        | One-to-One  |

---

## Design Decisions

### 1. Separation of Users and Customers

Allows flexibility:

* Support admins or other roles in the future
* Keep authentication separate from business data

---

### 2. Use of OrderItems (Junction Table)

Solves:

* Many-to-many relationship between Orders and Products

---

### 3. Shipping as a Separate Entity

Allows:

* Tracking
* Status updates
* Future extension (multi-shipment support)

---

### 4. Lookup Table for Shipping Status

Avoids:

* Invalid or inconsistent status values

---

### 5. Calculated Fields

* `TotalLine` in OrderItems
* `TotalAmount` in Orders

These can be:

* Stored for performance
* Or calculated dynamically depending on system needs

---

## Possible Improvements

* Support multiple payments per order
* Add categories for products
* Introduce shopping cart entity
* Add audit fields (CreatedAt, UpdatedAt)
* Normalize addresses into a separate table

---

## Conclusion

This ERD represents a solid foundation for an E-Commerce system, covering core business requirements while maintaining flexibility for future growth.

It demonstrates:

* Proper normalization
* Clear relationship modeling
* Scalable architecture

---