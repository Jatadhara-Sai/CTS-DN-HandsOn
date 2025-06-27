-- Drop and recreate Loans table
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Loans CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    Principal NUMBER,
    InterestRate NUMBER  -- Annual %
);

-- Sample loan data
INSERT INTO Loans VALUES (1, 'Asha', 100000, 9.5);
INSERT INTO Loans VALUES (2, 'Kumar', 50000, 10.0);
INSERT INTO Loans VALUES (3, 'Meena', 200000, 8.5);
COMMIT;

-- Update interest rates using cursor
SET SERVEROUTPUT ON;
DECLARE
    CURSOR loan_cursor IS
        SELECT LoanID, CustomerName, InterestRate FROM Loans;

    v_id   Loans.LoanID%TYPE;
    v_name Loans.CustomerName%TYPE;
    v_rate Loans.InterestRate%TYPE;
BEGIN
    OPEN loan_cursor;
    LOOP
        FETCH loan_cursor INTO v_id, v_name, v_rate;
        EXIT WHEN loan_cursor%NOTFOUND;

        IF v_rate > 9 THEN
            UPDATE Loans SET InterestRate = v_rate - 0.5 WHERE LoanID = v_id;
            DBMS_OUTPUT.PUT_LINE('Loan of ' || v_name || ': Interest reduced to ' || (v_rate - 0.5) || '%');
        ELSE
            UPDATE Loans SET InterestRate = v_rate + 0.25 WHERE LoanID = v_id;
            DBMS_OUTPUT.PUT_LINE('Loan of ' || v_name || ': Interest increased to ' || (v_rate + 0.25) || '%');
        END IF;
    END LOOP;
    CLOSE loan_cursor;
    COMMIT;
END;
/

-- Show updated loan table
SELECT * FROM Loans;
