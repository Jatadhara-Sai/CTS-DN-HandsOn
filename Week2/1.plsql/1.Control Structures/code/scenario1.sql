SET SERVEROUTPUT ON;

BEGIN
    FOR rec IN (SELECT c.CustomerID
                FROM Customers c
                WHERE c.Age > 60) LOOP

        UPDATE Loans
        SET InterestRate = InterestRate - 1
        WHERE CustomerID = rec.CustomerID;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('1% discount applied to eligible customers.');
END;
/
