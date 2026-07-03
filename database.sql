-- ============================================
-- database.sql
-- ระบบจัดการข้อมูลจำลองของโรงอาหาร ATC
-- ============================================

-- ============================================
-- 1. DDL : สร้างตาราง
-- ============================================

-- ตาราง users เก็บข้อมูล ID, Name, Wallet Balance
CREATE TABLE users (
    ID INTEGER PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Wallet_Balance DECIMAL(10, 2) NOT NULL DEFAULT 0.00
);

-- ตาราง orders เก็บข้อมูล Queue ID, Menu, Total Price, Status
CREATE TABLE orders (
    Queue_ID INTEGER PRIMARY KEY,
    Menu VARCHAR(100) NOT NULL,
    Total_Price DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'Pending'
);

-- ============================================
-- 2. DML : เพิ่ม / แก้ไข ข้อมูล
-- ============================================

INSERT INTO users (ID, Name, Wallet_Balance) VALUES (1, 'Somchai Jaidee', 500.00);
INSERT INTO users (ID, Name, Wallet_Balance) VALUES (2, 'Suda Meesuk', 300.00);
INSERT INTO users (ID, Name, Wallet_Balance) VALUES (3, 'Anan Rakthai', 150.00);

INSERT INTO orders (Queue_ID, Menu, Total_Price, Status) VALUES (101, 'Pad Krapow Moo Saap', 45.00, 'Pending');
INSERT INTO orders (Queue_ID, Menu, Total_Price, Status) VALUES (102, 'Tom Yum Kung', 60.00, 'Pending');
INSERT INTO orders (Queue_ID, Menu, Total_Price, Status) VALUES (103, 'Khao Man Kai', 40.00, 'Pending');
INSERT INTO orders (Queue_ID, Menu, Total_Price, Status) VALUES (104, 'Som Tum', 35.00, 'Ready');

UPDATE orders
SET Status = 'Ready'
WHERE Queue_ID = 101;

-- ============================================
-- 3. Data Query : ค้นหาและแสดงข้อมูล
-- ============================================

SELECT Queue_ID, Menu, Total_Price, Status
FROM orders
WHERE Status = 'Pending';