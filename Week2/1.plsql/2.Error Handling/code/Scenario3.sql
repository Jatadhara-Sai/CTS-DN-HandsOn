-- Drop existing tables and procedure
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Customers CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE ErrorLog CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE AddNewCustomer'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create Customers table
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    Email VARCHAR2(100)
);

-- Create ErrorLog table
CREATE TABLE ErrorLog (
    LogID NUMBER GENERATED ALWAYS AS IDENTITY,
    ErrorMessage VARCHAR2(400),
    ErrorTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create AddNewCustomer procedure
CREATE OR REPLACE PROCEDURE AddNewCustomer (
    id IN NUMBER,
    name IN VARCHAR2,
    email IN VARCHAR2
) AS
    errMsg VARCHAR2(400);
BEGIN
    INSERT INTO Customers (CustomerID, CustomerName, Email)
    VALUES (id, name, email);

    COMMIT;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        errMsg := 'Customer already exists with ID: ' || id;
        INSERT INTO ErrorLog(ErrorMessage) VALUES (errMsg);
        COMMIT;

    WHEN OTHERS THEN
        ROLLBACK;
        errMsg := 'Error adding customer: ' || SQLERRM;
        INSERT INTO ErrorLog(ErrorMessage) VALUES (errMsg);
        COMMIT;
END;
/

-- Test cases
BEGIN
    AddNewCustomer(1, 'Ravi', 'ravi@example.com');           -- ✅ should insert
    AddNewCustomer(1, 'Duplicate Ravi', 'ravi2@example.com');-- ❌ duplicate, should log
END;
/

-- View results
SELECT * FROM Customers;
SELECT * FROM ErrorLog;
