-- Drop existing tables and procedure
BEGIN EXECUTE IMMEDIATE 'DROP TABLE SavingsAccounts CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE ProcessMonthlyInterest'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create table
CREATE TABLE SavingsAccounts (
    AccountID NUMBER PRIMARY KEY,
    AccountHolder VARCHAR2(100),
    Balance NUMBER
);

-- Insert sample data
INSERT INTO SavingsAccounts VALUES (101, 'Asha', 10000);
INSERT INTO SavingsAccounts VALUES (102, 'Raju', 5000);
INSERT INTO SavingsAccounts VALUES (103, 'Meena', 2000);
COMMIT;

-- Create procedure
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
    UPDATE SavingsAccounts
    SET Balance = Balance + (Balance * 0.01);
    COMMIT;
END;
/

-- Test it
BEGIN
    ProcessMonthlyInterest;
END;
/

-- Show results
SELECT * FROM SavingsAccounts;
