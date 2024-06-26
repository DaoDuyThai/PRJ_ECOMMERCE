-- Check if the database exists and drop it if it does
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'PRJ_ECOMMERCE')
BEGIN
    USE master;
    ALTER DATABASE PRJ_ECOMMERCE SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PRJ_ECOMMERCE;
END
GO

-- Create the database PRJ_ECOMMERCE
CREATE DATABASE PRJ_ECOMMERCE;
GO

-- Use the PRJ_ECOMMERCE database
USE PRJ_ECOMMERCE;
GO

-- Create the Accounts table
CREATE TABLE Accounts (
  id INT IDENTITY(1,1) PRIMARY KEY,
  email NVARCHAR(255) NOT NULL UNIQUE,
  [password] NVARCHAR(255) NOT NULL,
  [fullname] NVARCHAR(255) NOT NULL,
  avatar_url NVARCHAR(255),
  [role] NVARCHAR(50) NOT NULL,
  date_created DATETIME DEFAULT GETDATE()
);
GO

-- Create the Categories table
CREATE TABLE Categories (
  id INT IDENTITY(1,1) PRIMARY KEY,
  [name] NVARCHAR(255) NOT NULL,
  [description] NVARCHAR(MAX)
);
GO

-- Create the Products table with foreign key to Categories table
CREATE TABLE Products (
  id INT IDENTITY(1,1) PRIMARY KEY,
  [name] NVARCHAR(255) NOT NULL,
  [description] NVARCHAR(MAX),
  image_url NVARCHAR(255),
  price BIGINT NOT NULL,
  category_id INT NOT NULL,
  date_created DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (category_id) REFERENCES Categories(id)
);
GO

-- Create the Orders table with foreign key to Accounts table
CREATE TABLE Orders (
  id INT IDENTITY(1,1) PRIMARY KEY,
  account_id INT NOT NULL,
  total_price BIGINT NOT NULL,
  delivery_address NVARCHAR(255) NOT NULL,
  [status] NVARCHAR(50) NOT NULL,
  note NVARCHAR(MAX),
  date_created DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (account_id) REFERENCES Accounts(id)
);
GO

-- Create the Order_details table with foreign keys to Products and Orders table
CREATE TABLE Order_details (
  id INT IDENTITY(1,1) PRIMARY KEY,
  product_id INT NOT NULL,
  order_id INT NOT NULL,
  quantity INT NOT NULL,
  price BIGINT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES Products(id),
  FOREIGN KEY (order_id) REFERENCES Orders(id)
);
GO
