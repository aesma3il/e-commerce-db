# E-Commerce Database System

## Overview

This project represents a complete database design for an online store system.  
It focuses on building a scalable, normalized, and production-ready relational database.

The system supports product management, customer accounts, order processing, payments, shipping, and product reviews.

---

## Objectives

- Design a real-world relational database
- Apply normalization principles
- Handle real business scenarios (orders, payments, shipping)
- Demonstrate database engineering best practices
- Build a strong portfolio project

---

## Features

- Product catalog management
- Customer management
- Order processing system
- Payment tracking
- Shipping and logistics tracking
- Reviews and ratings system
- Structured and normalized schema
- Use case-driven design

---


## Domain Summary

### Core Entities

- Product
- Customer
- Address
- Order
- OrderItem
- Payment
- Shipping
- Review
- Image

---

## Key Relationships

- Customer → Orders (1:N)
- Customer → Addresses (1:N)
- Customer → Reviews (1:N)
- Product → OrderItems (1:N)
- Product → Reviews (1:N)
- Order → OrderItems (1:N)
- Order → Payments (1:N)
- Order → Shipping (1:1)

---

## Design Highlights

- OrderItems table resolves the many-to-many relationship between Orders and Products  
- Price is stored in OrderItems to preserve historical data  
- Shipping is separated to manage its own lifecycle  
- Payments are separated to support multiple transactions and retries  
- Normalized structure reduces redundancy and improves consistency  

---

## Use Cases Covered

- Create, update, delete, and search products
- Manage customer accounts
- Place and manage orders
- Process payments
- Track shipping
- Add and manage product reviews

---

## Technologies

- SQL (Relational Database Design)
- ERD Modeling
- Database Normalization
- Constraints (Primary Key, Foreign Key, CHECK, UNIQUE)

---

## How to Use

1. Create a database in your SQL environment  
2. Run schema scripts from database/schema/  
3. Apply migrations if needed  
4. Insert sample data from database/seed/  
5. Execute queries and procedures  

---

## Future Improvements

- Add indexing strategy optimization  
- Implement stored procedures for checkout workflow  
- Add triggers for business rules  
- Introduce auditing and logging  
- Add soft delete support  

---

## Author

Abdullah Esmail

---

## Notes

This project demonstrates database engineering thinking, including analysis, design, and implementation.