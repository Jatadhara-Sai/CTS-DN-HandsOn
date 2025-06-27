-- Drop and create function
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION CalculateMonthlyInstallment'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create the function
CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
    loanAmount IN NUMBER,
    annualRate IN NUMBER,
    durationYears IN NUMBER
) RETURN NUMBER
IS
    monthlyRate NUMBER := annualRate / 12 / 100;
    months NUMBER := durationYears * 12;
    installment NUMBER;
BEGIN
    IF monthlyRate = 0 THEN
        installment := loanAmount / months;
    ELSE
        installment := loanAmount * monthlyRate / (1 - POWER(1 + monthlyRate, -months));
    END IF;
    RETURN ROUND(installment, 2);
END;
/

-- Test it
SET SERVEROUTPUT ON;
DECLARE
    emi NUMBER;
BEGIN
    emi := CalculateMonthlyInstallment(100000, 8.5, 5);
    DBMS_OUTPUT.PUT_LINE('Monthly EMI: ' || emi); -- Expected around 2050–2100
END;
/
