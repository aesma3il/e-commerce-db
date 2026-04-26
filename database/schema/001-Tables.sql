CREATE DATABASE ECommerceDB;
GO

USE ECommerceDB;
GO

-- ============================================
-- 1. TABLES CREATION
-- ============================================

-- User table (Base table for authentication)
CREATE TABLE [User] (
    ID INT IDENTITY(1,1) NOT NULL,
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1
);
GO

-- Customer table (extends User)
CREATE TABLE Customer (
    ID INT NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20) NULL,
    Address NVARCHAR(500) NULL,
    PaymentAddress NVARCHAR(500) NULL
);
GO

-- Product table
CREATE TABLE Product (
    ID INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Details NVARCHAR(MAX) NULL,
    FeaturedImage NVARCHAR(500) NULL,
    Price DECIMAL(18,2) NOT NULL,
    Qty INT NOT NULL DEFAULT 0
);
GO

-- Images table
CREATE TABLE Images (
    ID INT IDENTITY(1,1) NOT NULL,
    ImageFilePath NVARCHAR(500) NOT NULL,
    ProductID INT NOT NULL
);
GO

-- Review table
CREATE TABLE Review (
    ID INT IDENTITY(1,1) NOT NULL,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    Score INT NOT NULL,
    Text NVARCHAR(MAX) NULL
);
GO

-- Order table
CREATE TABLE [Order] (
    OrderID INT IDENTITY(1,1) NOT NULL,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    OrderStatus NVARCHAR(50) NOT NULL,
    OrderTime TIME NULL,
    TotalLine DECIMAL(18,2) NOT NULL DEFAULT 0
);
GO

-- OrderItems table
CREATE TABLE OrderItems (
    OrderItemID INT IDENTITY(1,1) NOT NULL,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    Qty INT NOT NULL,
    TotalLine DECIMAL(18,2) NOT NULL
);
GO

-- Payment table
CREATE TABLE Payment (
    PaymentID INT IDENTITY(1,1) NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    CustomerID INT NOT NULL,
    OrderID INT NOT NULL,
    Details NVARCHAR(MAX) NULL,
    [Timestamp] DATETIME NOT NULL DEFAULT GETDATE()
);
GO

-- Shipping table
CREATE TABLE Shipping (
    ShipID INT IDENTITY(1,1) NOT NULL,
    OrderID INT NOT NULL,
    Carrier NVARCHAR(100) NOT NULL,
    TrackingNumber NVARCHAR(100) NULL,
    ShippingStatus NVARCHAR(50) NOT NULL
);
GO