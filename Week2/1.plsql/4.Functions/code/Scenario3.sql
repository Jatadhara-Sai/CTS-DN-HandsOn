-- Drop objects
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION HasSufficientBalance'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE BankAccounts CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Sample table for account balance
CREATE TABLE BankAccounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    Balance NUMBER
);

-- Insert test data
INSERT INTO BankAccounts VALUES (1, 'Anil', 5000);
INSERT INTO BankAccounts VALUES (2, 'Sunita', 1200);
COMMIT;

-- Create function
CREATE OR REPLACE FUNCTION HasSufficientBalance (
    accId IN NUMBER,
    amount IN NUMBER
) RETURN BOOLEAN
IS
    accBalance NUMBER;
BEGIN
    SELECT Balance INTO accBalance FROM BankAccounts WHERE AccountID = accId;
    RETURN accBalance >= amount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;
/

-- Test function
SET SERVEROUTPUT ON;
DECLARE
    result BOOLEAN;
BEGIN
    result := HasSufficientBalance(1, 3000);
    IF result THEN
        DBMS_OUTPUT.PUT_LINE('✅ Sufficient balance.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('❌ Insufficient balance.');
    END IF;

    result := HasSufficientBalance(2, 2000);
    IF result THEN
        DBMS_OUTPUT.PUT_LINE('✅ Sufficient balance.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('❌ Insufficient balance.');
    END IF;
END;
/
