# Domain Analysis – E-Commerce System

## 1. Overview

This system represents an online store that allows customers to browse products, place orders, make payments, track shipping, and leave reviews.

The domain consists of entities related to product management, customer management, order processing, payment handling, shipping logistics, and customer feedback.

---

## 2. Core Entities

### 2.1 Product

Represents an item available for sale.

**Attributes:**

- Id
- Name
- Description
- Price
- StockQuantity
- CreatedAt

**Notes:**

- A product can appear in many orders
- A product can have multiple reviews

---

### 2.2 Customer

Represents a registered user of the system.

**Attributes:**

- Id
- FullName
- Email
- PasswordHash
- Phone
- CreatedAt

**Notes:**

- A customer can have multiple addresses
- A customer can place multiple orders
- A customer can write multiple reviews

---

### 2.3 Address

Represents a shipping address for a customer.

**Attributes:**

- Id
- CustomerId
- AddressLine
- City
- Country

**Notes:**

- A customer can have multiple addresses

---

### 2.4 Order

Represents a purchase made by a customer.

**Attributes:**

- Id
- CustomerId
- OrderDate
- Status
- TotalAmount

**Order Status Values:**

- Pending
- Processing
- Shipped
- Delivered
- Cancelled
- Refunded

**Notes:**

- An order belongs to one customer
- An order contains multiple order items
- An order has one or more payments
- An order has one shipping record

---

### 2.5 OrderItem

Represents a product within an order.

**Attributes:**

- Id
- OrderId
- ProductId
- Quantity
- Price

**Notes:**

- Resolves many-to-many relationship between Orders and Products
- Stores price at time of purchase (important for history)

---

### 2.6 Payment

Represents a payment transaction.

**Attributes:**

- Id
- OrderId
- TransactionId
- Amount
- PaymentMethod
- CreatedAt

**Notes:**

- A payment is linked to an order
- An order may have multiple payments (e.g., retries, partial payments)

---

### 2.7 Shipping

Represents shipping and logistics for an order.

**Attributes:**

- Id
- OrderId
- Carrier
- TrackingNumber
- Status
- EstimatedDelivery
- ActualDelivery

**Shipping Status Values:**

- Processing
- Out for Delivery
- Delivered
- Return to Sender
- On Hold
- Delayed
- Lost

**Notes:**

- Each order has one shipping record
- Shipping status evolves independently of order status

---

### 2.8 Review

Represents customer feedback on a product.

**Attributes:**

- Id
- ProductId
- CustomerId
- Rating
- ReviewText
- CreatedAt

**Constraints:**

- Rating must be between 1 and 5

**Notes:**

- A customer can review multiple products
- A product can have multiple reviews

---

## 3. Relationships

- Customer → Orders (1:N)
- Customer → Addresses (1:N)
- Customer → Reviews (1:N)
- Product → OrderItems (1:N)
- Product → Reviews (1:N)
- Order → OrderItems (1:N)
- Order → Payments (1:N)
- Order → Shipping (1:1)
- OrderItem → Product (N:1)

---

## 4. Derived / Implicit Entities

These were not explicitly mentioned but are required:

### OrderItem

- Needed to support multiple products per order

### Address

- Needed to support multiple shipping addresses

---

## 5. Domain Rules

- A product must have a valid price and stock quantity
- A customer email must be unique
- An order must have at least one order item
- Payment must be linked to an order
- Shipping must be linked to an order
- Review rating must be between 1 and 5

---

## 6. Domain Boundaries

The system includes:

- Product catalog
- Customer accounts
- Order processing
- Payment tracking
- Shipping tracking
- Reviews

External systems:

- Payment gateways
- Shipping providers

---