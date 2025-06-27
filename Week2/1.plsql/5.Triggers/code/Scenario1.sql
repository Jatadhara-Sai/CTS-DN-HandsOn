-- Drop trigger and table if they exist
BEGIN EXECUTE IMMEDIATE 'DROP TRIGGER UpdateCustomerLastModified'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Customers CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create Customers table
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    Email VARCHAR2(100),
    LastModified DATE
);

-- Insert a sample customer
INSERT INTO Customers VALUES (1, 'Ravi', 'ravi@example.com', SYSDATE);
COMMIT;

-- Create trigger
CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
    :NEW.LastModified := SYSDATE;
END;
/

-- Test update
UPDATE Customers SET Email = 'newravi@example.com' WHERE CustomerID = 1;
COMMIT;

-- Show result
SELECT * FROM Customers;
