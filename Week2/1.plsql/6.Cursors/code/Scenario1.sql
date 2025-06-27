-- Drop tables if they already exist
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Transactions CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Customers CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create Customers table
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100)
);

-- Create Transactions table with identity column
CREATE TABLE Transactions (
    TransID NUMBER GENERATED ALWAYS AS IDENTITY,
    CustomerID NUMBER,
    Amount NUMBER,
    Type VARCHAR2(10),  -- 'Deposit' or 'Withdrawal'
    TransDate DATE
);

-- Insert sample customers
INSERT INTO Customers VALUES (1, 'Asha');
INSERT INTO Customers VALUES (2, 'Vikram');

-- Insert current month transactions for Asha
INSERT INTO Transactions (CustomerID, Amount, Type, TransDate)
VALUES (1, 1000, 'Deposit', SYSDATE);

INSERT INTO Transactions (CustomerID, Amount, Type, TransDate)
VALUES (1, 500, 'Withdrawal', SYSDATE - 1);

-- Insert last month transaction for Vikram (will not show in output)
INSERT INTO Transactions (CustomerID, Amount, Type, TransDate)
VALUES (2, 2000, 'Deposit', ADD_MONTHS(SYSDATE, -1));

-- Insert current month transaction for Vikram
INSERT INTO Transactions (CustomerID, Amount, Type, TransDate)
VALUES (2, 1000, 'Deposit', SYSDATE);

COMMIT;

-- PL/SQL block using explicit cursor
SET SERVEROUTPUT ON;
DECLARE
    CURSOR txn_cursor IS
        SELECT c.CustomerName, t.Amount, t.Type, t.TransDate
        FROM Customers c
        JOIN Transactions t ON c.CustomerID = t.CustomerID
        WHERE TRUNC(t.TransDate, 'MM') = TRUNC(SYSDATE, 'MM');

    v_name     Customers.CustomerName%TYPE;
    v_amount   Transactions.Amount%TYPE;
    v_type     Transactions.Type%TYPE;
    v_date     Transactions.TransDate%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Monthly Statements ---');
    OPEN txn_cursor;
    LOOP
        FETCH txn_cursor INTO v_name, v_amount, v_type, v_date;
        EXIT WHEN txn_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_name || ' - ' || v_type || ': Rs.' || v_amount || ' on ' || TO_CHAR(v_date, 'DD-Mon'));
    END LOOP;
    CLOSE txn_cursor;
END;
/
