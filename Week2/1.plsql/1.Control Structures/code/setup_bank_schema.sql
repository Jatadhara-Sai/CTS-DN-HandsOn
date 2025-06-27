-- setup_bank_schema.sql

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Age NUMBER,
    Balance NUMBER(10,2),
    IsVIP VARCHAR2(5)
);

-- Create Loans Table
CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER(5,2),
    DueDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert Sample Data
INSERT INTO Customers VALUES (1, 'Ravi', 65, 12000, NULL);
INSERT INTO Customers VALUES (2, 'Priya', 45, 8000, NULL);
INSERT INTO Customers VALUES (3, 'Amit', 70, 15000, NULL);

INSERT INTO Loans VALUES (101, 1, 8.5, SYSDATE + 10); -- Ravi
INSERT INTO Loans VALUES (102, 2, 9.0, SYSDATE + 40); -- Priya
INSERT INTO Loans VALUES (103, 3, 10.0, SYSDATE + 5); -- Amit

COMMIT;
