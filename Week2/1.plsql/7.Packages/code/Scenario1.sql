-- Drop old objects
BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE CustomerManagement'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Customers'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create table
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    Balance NUMBER
);

-- Create package spec
CREATE OR REPLACE PACKAGE CustomerManagement AS
    PROCEDURE AddCustomer(p_id NUMBER, p_name VARCHAR2, p_balance NUMBER);
    PROCEDURE UpdateCustomer(p_id NUMBER, p_name VARCHAR2);
    FUNCTION GetBalance(p_id NUMBER) RETURN NUMBER;
END CustomerManagement;
/

-- Create package body
CREATE OR REPLACE PACKAGE BODY CustomerManagement AS

    PROCEDURE AddCustomer(p_id NUMBER, p_name VARCHAR2, p_balance NUMBER) IS
    BEGIN
        INSERT INTO Customers VALUES (p_id, p_name, p_balance);
    END;

    PROCEDURE UpdateCustomer(p_id NUMBER, p_name VARCHAR2) IS
    BEGIN
        UPDATE Customers SET CustomerName = p_name WHERE CustomerID = p_id;
    END;

    FUNCTION GetBalance(p_id NUMBER) RETURN NUMBER IS
        v_balance NUMBER;
    BEGIN
        SELECT Balance INTO v_balance FROM Customers WHERE CustomerID = p_id;
        RETURN v_balance;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN RETURN NULL;
    END;

END CustomerManagement;
/

-- Test
BEGIN
    CustomerManagement.AddCustomer(1, 'Asha', 3000);
    CustomerManagement.UpdateCustomer(1, 'Asha R');
    DBMS_OUTPUT.PUT_LINE('Balance: Rs.' || CustomerManagement.GetBalance(1));
END;
/
