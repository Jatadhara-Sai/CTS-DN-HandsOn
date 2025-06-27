-- Drop and recreate Accounts table
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Accounts CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    HolderName VARCHAR2(100),
    Balance NUMBER
);

-- Insert sample accounts
INSERT INTO Accounts VALUES (101, 'Ravi', 8000);
INSERT INTO Accounts VALUES (102, 'Neha', 6000);
INSERT INTO Accounts VALUES (103, 'Pooja', 4000);
COMMIT;

-- Apply annual fee using explicit cursor
SET SERVEROUTPUT ON;
DECLARE
    CURSOR acc_cursor IS
        SELECT AccountID, HolderName, Balance FROM Accounts;

    v_accid     Accounts.AccountID%TYPE;
    v_name      Accounts.HolderName%TYPE;
    v_balance   Accounts.Balance%TYPE;
    annual_fee  CONSTANT NUMBER := 500;
BEGIN
    OPEN acc_cursor;
    LOOP
        FETCH acc_cursor INTO v_accid, v_name, v_balance;
        EXIT WHEN acc_cursor%NOTFOUND;

        -- Deduct the fee
        UPDATE Accounts SET Balance = Balance - annual_fee WHERE AccountID = v_accid;

        DBMS_OUTPUT.PUT_LINE('Annual fee of Rs.' || annual_fee || ' applied to ' || v_name || '. New Balance will be adjusted.');
    END LOOP;
    CLOSE acc_cursor;
    COMMIT;
END;
/

-- Show final account balances
SELECT * FROM Accounts;
