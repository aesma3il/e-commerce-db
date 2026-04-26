-- ============================================
-- 2. PRIMARY KEYS
-- ============================================

ALTER TABLE [User] ADD CONSTRAINT PK_User PRIMARY KEY (ID);
ALTER TABLE Customer ADD CONSTRAINT PK_Customer PRIMARY KEY (ID);
ALTER TABLE Product ADD CONSTRAINT PK_Product PRIMARY KEY (ID);
ALTER TABLE Images ADD CONSTRAINT PK_Images PRIMARY KEY (ID);
ALTER TABLE Review ADD CONSTRAINT PK_Review PRIMARY KEY (ID);
ALTER TABLE [Order] ADD CONSTRAINT PK_Order PRIMARY KEY (OrderID);
ALTER TABLE OrderItems ADD CONSTRAINT PK_OrderItems PRIMARY KEY (OrderItemID);
ALTER TABLE Payment ADD CONSTRAINT PK_Payment PRIMARY KEY (PaymentID);
ALTER TABLE Shipping ADD CONSTRAINT PK_Shipping PRIMARY KEY (ShipID);

-- ============================================
-- 3. FOREIGN KEYS (Relationships)
-- ============================================

-- Customer to User relationship (inheritance)
ALTER TABLE Customer ADD CONSTRAINT FK_Customer_User 
FOREIGN KEY (ID) REFERENCES [User](ID) ON DELETE CASCADE;

-- Images to Product (Product 1 -- * Images)
ALTER TABLE Images ADD CONSTRAINT FK_Images_Product 
FOREIGN KEY (ProductID) REFERENCES Product(ID) ON DELETE CASCADE;

-- Review to Product (Product 1 -- * Review)
ALTER TABLE Review ADD CONSTRAINT FK_Review_Product 
FOREIGN KEY (ProductID) REFERENCES Product(ID) ON DELETE CASCADE;

-- Review to Customer (Customer 1 -- * Review)
ALTER TABLE Review ADD CONSTRAINT FK_Review_Customer 
FOREIGN KEY (CustomerID) REFERENCES Customer(ID) ON DELETE CASCADE;

-- Order to Customer (Customer 1 -- * Order)
ALTER TABLE [Order] ADD CONSTRAINT FK_Order_Customer 
FOREIGN KEY (CustomerID) REFERENCES Customer(ID) ON DELETE CASCADE;

-- OrderItems to Order (Order 1 -- * OrderItems)
ALTER TABLE OrderItems ADD CONSTRAINT FK_OrderItems_Order 
FOREIGN KEY (OrderID) REFERENCES [Order](OrderID) ON DELETE CASCADE;

-- OrderItems to Product (Product 1 -- * OrderItems)
ALTER TABLE OrderItems ADD CONSTRAINT FK_OrderItems_Product 
FOREIGN KEY (ProductID) REFERENCES Product(ID) ON DELETE CASCADE;

-- Payment to Customer (Customer 1 -- * Payment)
ALTER TABLE Payment ADD CONSTRAINT FK_Payment_Customer 
FOREIGN KEY (CustomerID) REFERENCES Customer(ID) ON DELETE CASCADE;

-- Payment to Order (Order 1 -- 1 Payment)
ALTER TABLE Payment ADD CONSTRAINT FK_Payment_Order 
FOREIGN KEY (OrderID) REFERENCES [Order](OrderID) ON DELETE CASCADE;

-- Shipping to Order (Order 1 -- 1 Shipping)
ALTER TABLE Shipping ADD CONSTRAINT FK_Shipping_Order 
FOREIGN KEY (OrderID) REFERENCES [Order](OrderID) ON DELETE CASCADE;

-- ============================================
-- 4. UNIQUE CONSTRAINTS
-- ============================================

ALTER TABLE [User] ADD CONSTRAINT UQ_User_Username UNIQUE (Username);
ALTER TABLE Customer ADD CONSTRAINT UQ_Customer_Email UNIQUE (Email);
ALTER TABLE Shipping ADD CONSTRAINT UQ_Shipping_OrderID UNIQUE (OrderID);
ALTER TABLE Payment ADD CONSTRAINT UQ_Payment_OrderID UNIQUE (OrderID);

-- ============================================
-- 5. CHECK CONSTRAINTS
-- ============================================

ALTER TABLE Product ADD CONSTRAINT CK_Product_Price CHECK (Price >= 0);
ALTER TABLE Product ADD CONSTRAINT CK_Product_Qty CHECK (Qty >= 0);
ALTER TABLE Review ADD CONSTRAINT CK_Review_Score CHECK (Score BETWEEN 1 AND 5);
ALTER TABLE OrderItems ADD CONSTRAINT CK_OrderItems_Qty CHECK (Qty > 0);
ALTER TABLE OrderItems ADD CONSTRAINT CK_OrderItems_Price CHECK (Price >= 0);
ALTER TABLE Payment ADD CONSTRAINT CK_Payment_Amount CHECK (Amount > 0);
ALTER TABLE [Order] ADD CONSTRAINT CK_Order_TotalLine CHECK (TotalLine >= 0);

-- ============================================
-- 6. DEFAULT CONSTRAINTS
-- ============================================

ALTER TABLE [Order] ADD CONSTRAINT DF_Order_OrderDate DEFAULT GETDATE() FOR OrderDate;
ALTER TABLE [Order] ADD CONSTRAINT DF_Order_OrderStatus DEFAULT 'Pending' FOR OrderStatus;
ALTER TABLE [Order] ADD CONSTRAINT DF_Order_TotalLine DEFAULT 0 FOR TotalLine;
ALTER TABLE Payment ADD CONSTRAINT DF_Payment_Timestamp DEFAULT GETDATE() FOR [Timestamp];
ALTER TABLE Product ADD CONSTRAINT DF_Product_Qty DEFAULT 0 FOR Qty;
ALTER TABLE [User] ADD CONSTRAINT DF_User_IsActive DEFAULT 1 FOR IsActive;
ALTER TABLE Shipping ADD CONSTRAINT DF_Shipping_ShippingStatus DEFAULT 'Processing' FOR ShippingStatus;
