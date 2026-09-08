 /*
=============================================================
Database Creation and Table Setup Script
=============================================================
Script Purpose:
    This script creates a new SQL Server database named 'CoderHr'. 
    If the database already exists, it is dropped to ensure a clean setup. 
    The script then creates two tables: 'customers'and 'orders' 
    with their respective schemas, and populates them with sample data.
    
WARNING:
    Running this script will drop the entire 'CoderHr' database if it exists, 
    permanently deleting all data within it. Proceed with caution and ensure you 
    have proper backups before executing this script.
*/

USE master;
GO

-- Drop and recreate the 'CoderHr' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'CoderHr')
BEGIN
    ALTER DATABASE CoderHr SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE CoderHr;
END;
GO

-- Create the 'CoderHr' database
CREATE DATABASE CoderHr;
GO

USE CoderHr;
GO

-- ======================================================
-- Table: customers
-- ======================================================
DROP TABLE IF EXISTS customers;
GO

CREATE TABLE customers (
    id INT NOT NULL,
    first_name  VARCHAR(50) NOT NULL,
    country     VARCHAR(50),
    score       INT,
    CONSTRAINT PK_customers PRIMARY KEY (id)
);
GO

-- Insert customers data
INSERT INTO customers (id, first_name, country, score) VALUES
    (1, 'Leo',     'Germany', 350),
    (2, ' Freddy',     'USA',     900),
    (3, 'Ben',   'UK',      750),
    (4, 'Martin', 'Germany', 500),
    (5, 'Pari',   'India',     0);
GO

-- ======================================================
-- Table: orders
-- ======================================================
DROP TABLE IF EXISTS orders;
GO

CREATE TABLE orders (
    order_id    INT NOT NULL,
    customer_id INT NOT NULL,
    order_date  DATE,
    sales    INT,
    CONSTRAINT PK_orders PRIMARY KEY (order_id)
);
GO

-- Insert orders data
INSERT INTO orders (order_id, customer_id, order_date, sales) VALUES
    (101, 1, '2026-01-11', 35),
    (102, 2, '2026-04-05', 15),
    (103, 3, '2026-06-18', 20),
    (104, 6, '2026-08-31', 10);
GO
