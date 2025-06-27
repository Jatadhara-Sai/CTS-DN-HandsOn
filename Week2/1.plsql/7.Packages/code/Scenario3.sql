-- Drop old objects
BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE AccountOperations'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Accounts'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create table
CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    Balance NUMBER
);

-- Package specification
CREATE OR REPLACE PACKAGE AccountOperations AS
    PROCEDURE OpenAccount(p_accid NUMBER, p_custid NUMBER, p_balance NUMBER);
    PROCEDURE CloseAccount(p_accid NUMBER);
    FUNCTION GetTotalBalance(p_custid NUMBER) RETURN NUMBER;
END AccountOperations;
/

-- Package body
CREATE OR REPLACE PACKAGE BODY AccountOperations AS

    PROCEDURE OpenAccount(p_accid NUMBER, p_custid NUMBER, p_balance NUMBER) IS
    BEGIN
        INSERT INTO Accounts VALUES (p_accid, p_custid, p_balance);
    END;

    PROCEDURE CloseAccount(p_accid NUMBER) IS
    BEGIN
        DELETE FROM Accounts WHERE AccountID = p_accid;
    END;

    FUNCTION GetTotalBalance(p_custid NUMBER) RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT SUM(Balance) INTO v_total FROM Accounts WHERE CustomerID = p_custid;
        RETURN NVL(v_total, 0);
    END;

END AccountOperations;
/

-- Test
BEGIN
    AccountOperations.OpenAccount(201, 1, 3000);
    AccountOperations.OpenAccount(202, 1, 2000);
    DBMS_OUTPUT.PUT_LINE('Total Balance: Rs.' || AccountOperations.GetTotalBalance(1));
    AccountOperations.CloseAccount(202);
    DBMS_OUTPUT.PUT_LINE('After Closing One: Rs.' || AccountOperations.GetTotalBalance(1));
END;
/
