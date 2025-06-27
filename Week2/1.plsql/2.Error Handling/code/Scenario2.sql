-- Drop existing tables and procedure
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Employees CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE ErrorLog CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE UpdateSalary'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create tables
CREATE TABLE Employees (
    EmpID NUMBER PRIMARY KEY,
    EmpName VARCHAR2(100),
    Salary NUMBER
);

CREATE TABLE ErrorLog (
    LogID NUMBER GENERATED ALWAYS AS IDENTITY,
    ErrorMessage VARCHAR2(400),
    ErrorTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO Employees VALUES (101, 'John', 30000);
INSERT INTO Employees VALUES (102, 'Jane', 35000);
COMMIT;

-- Create procedure
CREATE OR REPLACE PROCEDURE UpdateSalary (
    empId IN NUMBER,
    percentage IN NUMBER
) AS
    errMsg VARCHAR2(400);
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * percentage / 100)
    WHERE EmpID = empId;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Employee ID not found');
    END IF;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        errMsg := 'Error during salary update: ' || SQLERRM;
        INSERT INTO ErrorLog(ErrorMessage) VALUES (errMsg);
        COMMIT;
END;
/

-- Test
BEGIN
    UpdateSalary(101, 10);
    UpdateSalary(999, 5);
END;
/

-- View results
SELECT * FROM Employees;
SELECT * FROM ErrorLog;
