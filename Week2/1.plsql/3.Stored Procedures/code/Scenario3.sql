-- Drop existing tables and procedure
BEGIN EXECUTE IMMEDIATE 'DROP TABLE BankAccounts CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE TransferFunds'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create table
CREATE TABLE BankAccounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    Balance NUMBER
);

-- Insert sample data
INSERT INTO BankAccounts VALUES (1, 'Ravi', 10000);
INSERT INTO BankAccounts VALUES (2, 'Ravi', 4000); -- same customer, different account
COMMIT;

-- Create procedure
CREATE OR REPLACE PROCEDURE TransferFunds (
    fromAcc IN NUMBER,
    toAcc IN NUMBER,
    amount IN NUMBER
) AS
    fromBalance NUMBER;
BEGIN
    SELECT Balance INTO fromBalance FROM BankAccounts WHERE AccountID = fromAcc;

    IF fromBalance < amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance in source account.');
    END IF;

    UPDATE BankAccounts SET Balance = Balance - amount WHERE AccountID = fromAcc;
    UPDATE BankAccounts SET Balance = Balance + amount WHERE AccountID = toAcc;

    COMMIT;
END;
/

-- Test it
BEGIN
    TransferFunds(1, 2, 2500);   -- ✅ should succeed
    TransferFunds(2, 1, 10000);  -- ❌ should fail (insufficient)
END;
/

-- Show results
SELECT * FROM BankAccounts;
