-- ============================================
-- 7. INDEXES
-- ============================================

-- Product indexes
CREATE INDEX IX_Product_Name ON Product(Name);
CREATE INDEX IX_Product_Price ON Product(Price);
CREATE INDEX IX_Product_Qty ON Product(Qty);

-- Customer indexes
CREATE INDEX IX_Customer_Name ON Customer(Name);
CREATE INDEX IX_Customer_Email ON Customer(Email);
CREATE INDEX IX_Customer_Phone ON Customer(Phone);

-- Order indexes
CREATE INDEX IX_Order_CustomerID ON [Order](CustomerID);
CREATE INDEX IX_Order_OrderDate ON [Order](OrderDate);
CREATE INDEX IX_Order_OrderStatus ON [Order](OrderStatus);

-- OrderItems indexes
CREATE INDEX IX_OrderItems_OrderID ON OrderItems(OrderID);
CREATE INDEX IX_OrderItems_ProductID ON OrderItems(ProductID);

-- Review indexes
CREATE INDEX IX_Review_ProductID ON Review(ProductID);
CREATE INDEX IX_Review_CustomerID ON Review(CustomerID);
CREATE INDEX IX_Review_Score ON Review(Score);

-- Images indexes
CREATE INDEX IX_Images_ProductID ON Images(ProductID);

-- Payment indexes
CREATE INDEX IX_Payment_CustomerID ON Payment(CustomerID);
CREATE INDEX IX_Payment_OrderID ON Payment(OrderID);
CREATE INDEX IX_Payment_Timestamp ON Payment([Timestamp]);

-- Shipping indexes
CREATE INDEX IX_Shipping_OrderID ON Shipping(OrderID);
CREATE INDEX IX_Shipping_TrackingNumber ON Shipping(TrackingNumber);
CREATE INDEX IX_Shipping_ShippingStatus ON Shipping(ShippingStatus);

-- User indexes
CREATE INDEX IX_User_Username ON [User](Username);
CREATE INDEX IX_User_IsActive ON [User](IsActive);

-- Composite indexes for performance
CREATE INDEX IX_OrderItems_Order_Product ON OrderItems(OrderID, ProductID);
CREATE INDEX IX_Review_Product_Customer ON Review(ProductID, CustomerID);

-- Full-text indexes (for search functionality)
CREATE FULLTEXT CATALOG ftCatalog AS DEFAULT;
CREATE FULLTEXT INDEX ON Product(Name, Description, Details) 
KEY INDEX PK_Product WITH STOPLIST = SYSTEM;
