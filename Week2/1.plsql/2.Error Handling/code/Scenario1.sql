-- Step 5: Create SafeTransferFunds Procedure
CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    fromAccount IN NUMBER,
    toAccount IN NUMBER,
    amount IN NUMBER
) AS
    fromBalance NUMBER;
    errMsg VARCHAR2(400);
BEGIN
    -- Get balance
    SELECT Balance INTO fromBalance FROM Accounts WHERE AccountID = fromAccount;

    -- Check for sufficient funds
    IF fromBalance < amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds');
    END IF;

    -- Perform the transfer
    UPDATE Accounts SET Balance = Balance - amount WHERE AccountID = fromAccount;
    UPDATE Accounts SET Balance = Balance + amount WHERE AccountID = toAccount;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        errMsg := 'Error during fund transfer: ' || SQLERRM;
        INSERT INTO ErrorLog(ErrorMessage) VALUES (errMsg);
        COMMIT;
END;
/
