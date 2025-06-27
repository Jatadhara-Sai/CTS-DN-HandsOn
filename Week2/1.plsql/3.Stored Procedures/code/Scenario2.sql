-- Drop existing tables and procedure
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Employees CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE UpdateEmployeeBonus'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create table
CREATE TABLE Employees (
    EmpID NUMBER PRIMARY KEY,
    EmpName VARCHAR2(100),
    Salary NUMBER,
    Department VARCHAR2(50)
);

-- Insert sample data
INSERT INTO Employees VALUES (1, 'Kiran', 30000, 'HR');
INSERT INTO Employees VALUES (2, 'Divya', 35000, 'IT');
INSERT INTO Employees VALUES (3, 'Amit', 40000, 'IT');
INSERT INTO Employees VALUES (4, 'Nita', 32000, 'Finance');
COMMIT;

-- Create procedure
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    deptName IN VARCHAR2,
    bonusPercent IN NUMBER
) AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * bonusPercent / 100)
    WHERE Department = deptName;
    COMMIT;
END;
/

-- Test it
BEGIN
    UpdateEmployeeBonus('IT', 10); -- 10% bonus to IT
END;
/

-- Show results
SELECT * FROM Employees;
