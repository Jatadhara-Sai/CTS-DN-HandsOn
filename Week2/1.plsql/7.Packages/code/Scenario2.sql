-- Drop old objects
BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE EmployeeManagement'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Employees'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Create table
CREATE TABLE Employees (
    EmpID NUMBER PRIMARY KEY,
    EmpName VARCHAR2(100),
    Department VARCHAR2(50),
    MonthlySalary NUMBER
);

-- Package specification
CREATE OR REPLACE PACKAGE EmployeeManagement AS
    PROCEDURE HireEmployee(p_id NUMBER, p_name VARCHAR2, p_dept VARCHAR2, p_salary NUMBER);
    PROCEDURE UpdateEmployee(p_id NUMBER, p_salary NUMBER);
    FUNCTION GetAnnualSalary(p_id NUMBER) RETURN NUMBER;
END EmployeeManagement;
/

-- Package body
CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS

    PROCEDURE HireEmployee(p_id NUMBER, p_name VARCHAR2, p_dept VARCHAR2, p_salary NUMBER) IS
    BEGIN
        INSERT INTO Employees VALUES (p_id, p_name, p_dept, p_salary);
    END;

    PROCEDURE UpdateEmployee(p_id NUMBER, p_salary NUMBER) IS
    BEGIN
        UPDATE Employees SET MonthlySalary = p_salary WHERE EmpID = p_id;
    END;

    FUNCTION GetAnnualSalary(p_id NUMBER) RETURN NUMBER IS
        v_salary NUMBER;
    BEGIN
        SELECT MonthlySalary * 12 INTO v_salary FROM Employees WHERE EmpID = p_id;
        RETURN v_salary;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN RETURN NULL;
    END;

END EmployeeManagement;
/

-- Test
BEGIN
    EmployeeManagement.HireEmployee(101, 'Ravi', 'IT', 40000);
    EmployeeManagement.UpdateEmployee(101, 45000);
    DBMS_OUTPUT.PUT_LINE('Annual Salary: Rs.' || EmployeeManagement.GetAnnualSalary(101));
END;
/
