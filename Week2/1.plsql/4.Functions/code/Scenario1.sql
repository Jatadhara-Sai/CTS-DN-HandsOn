-- Drop and create function
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION CalculateAge'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create the function
CREATE OR REPLACE FUNCTION CalculateAge (
    dob IN DATE
) RETURN NUMBER
IS
    years NUMBER;
BEGIN
    years := FLOOR(MONTHS_BETWEEN(SYSDATE, dob) / 12);
    RETURN years;
END;
/

-- Test it
SET SERVEROUTPUT ON;
DECLARE
    age NUMBER;
BEGIN
    age := CalculateAge(DATE '2000-06-15');
    DBMS_OUTPUT.PUT_LINE('Age: ' || age);  -- Expected: around 25
END;
/
