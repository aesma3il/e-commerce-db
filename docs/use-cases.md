# E-Commerce System – Use Cases

## Actors

- Customer
- Admin
- System

---

# Product Management

## UC1: Create Product

**Actor:** Admin  
**Description:** Add a new product to the catalog  

**Flow:**
1. Admin enters product details
2. System validates data
3. System saves product

**Tables:** Products

---

## UC2: Update Product

**Actor:** Admin  

**Flow:**
1. Admin selects product
2. Updates fields
3. System saves changes

**Tables:** Products

---

## UC3: Delete Product

**Actor:** Admin  

**Flow:**
1. Admin selects product
2. System deletes or soft deletes product

**Tables:** Products

---

## UC4: List All Products

**Actor:** Customer / Admin  

**Flow:**
1. System retrieves all products
2. Displays list

**Tables:** Products

---

## UC5: Get Product By ID

**Actor:** Customer / Admin  

**Flow:**
1. User provides product ID
2. System retrieves product

**Tables:** Products

---

## UC6: Search Product

**Actor:** Customer  

**Flow:**
1. Customer enters keyword
2. System searches products
3. Returns matching results

**Tables:** Products

---

# Customer Management

## UC7: Create Customer

**Actor:** Customer / Admin  

**Flow:**
1. Enter customer details
2. System validates email
3. Save customer

**Tables:** Customers

---

## UC8: Update Customer

**Actor:** Customer / Admin  

**Flow:**
1. Select customer
2. Update details
3. Save changes

**Tables:** Customers

---

## UC9: Delete Customer

**Actor:** Admin  

**Flow:**
1. Select customer
2. Delete or deactivate account

**Tables:** Customers

---

## UC10: List All Customers

**Actor:** Admin  

**Flow:**
1. Retrieve all customers
2. Display list

**Tables:** Customers

---

## UC11: Get Customer By ID

**Actor:** Admin  

**Flow:**
1. Provide ID
2. Retrieve customer

**Tables:** Customers

---

# Orders

## UC12: Create Order

**Actor:** Customer  

**Flow:**
1. Select products
2. Add quantities
3. System creates order
4. System creates order items
5. Set status = Pending

**Tables:** Orders, OrderItems

---

## UC13: Get Order By ID

**Actor:** Customer / Admin  

**Flow:**
1. Provide order ID
2. Retrieve order details

**Tables:** Orders, OrderItems

---

## UC14: List Customer Orders

**Actor:** Customer  

**Flow:**
1. Retrieve all orders for customer

**Tables:** Orders

---

## UC15: Update Order Status

**Actor:** Admin / System  

**Flow:**
1. Change status (Processing, Shipped, etc.)
2. Save update

**Tables:** Orders

---

# Payments

## UC16: Create Payment

**Actor:** System  

**Flow:**
1. Receive payment details
2. Store transaction
3. Link to order

**Tables:** Payments

---

## UC17: Get Payment By Order

**Actor:** Admin  

**Flow:**
1. Retrieve payment by order ID

**Tables:** Payments

---

# Shipping

## UC18: Create Shipping Record

**Actor:** System / Admin  

**Flow:**
1. Create shipping info for order
2. Add tracking number

**Tables:** Shipping

---

## UC19: Update Shipping Status

**Actor:** Admin / System  

**Flow:**
1. Update status
2. Save changes

**Tables:** Shipping

---

## UC20: Track Order Shipping

**Actor:** Customer  

**Flow:**
1. Provide order ID
2. Retrieve shipping details

**Tables:** Shipping

---

# Reviews and Ratings

## UC21: Create Review

**Actor:** Customer  

**Flow:**
1. Select product
2. Enter rating (1–5)
3. Write review
4. Save

**Tables:** Reviews

---

## UC22: Get Product Reviews

**Actor:** Customer  

**Flow:**
1. Provide product ID
2. Retrieve all reviews

**Tables:** Reviews

---

## UC23: Update Review

**Actor:** Customer  

**Flow:**
1. Edit review
2. Save changes

**Tables:** Reviews

---

## UC24: Delete Review

**Actor:** Customer / Admin  

**Flow:**
1. Select review
2. Delete

**Tables:** Reviews