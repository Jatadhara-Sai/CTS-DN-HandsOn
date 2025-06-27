DECLARE
    v_count NUMBER := 0;
BEGIN
    FOR rec IN (
        SELECT l.LoanID, l.DueDate, c.Name
        FROM Loans l
        JOIN Customers c ON l.CustomerID = c.CustomerID
        WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Reminder: Loan ' || rec.LoanID ||
                             ' is due on ' || TO_CHAR(rec.DueDate, 'DD-MON-YYYY') ||
                             ' for customer ' || rec.Name);
        v_count := v_count + 1;
    END LOOP;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No loans due in the next 30 days.');
    END IF;
END;
/
