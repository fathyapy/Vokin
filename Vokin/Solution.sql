--1. Create a table named �MsBranch� with the following description:
CREATE TABLE MsBranch (
	BranchID CHAR (5) Primary Key CHECK (BranchID LIKE 'BR[0-9][0-9][0-9]'),
	BranchName VARCHAR (100) NOT NULL,
	BranchAddress VARCHAR (100)	NOT NULL CHECK (BranchAddress LIKE '%Street%')
)

--2. Add CustomerEmail as new column on MsCustomer table with varchar data type and the length is 50. After that, add a constraint on MsCustomer table for �CustomerEmail� must ends with �@gmail.com� or �@yahoo.com�.(ALTER TABLE, ADD, ADD CONSTRAINT, LIKE)
ALTER TABLE MsCustomer
ADD CustomerEmail VARCHAR (50)

ALTER TABLE MsCustomer
ADD CONSTRAINT CheckEmail CHECK (CustomerEmail LIKE '%@gmail.com' OR CustomerEmail LIKE '%@yahoo.com')

--3. Insert these data into MsStaff table (INSERT)
INSERT INTO MsStaff (StaffID,StaffName,StaffDOB,StaffPhone,StaffGender,StaffSalary) VALUES ('ST011','Felix','1999-8-18', '+628228378387','male','10000000')

SELECT * FROM MsStaff

--4. Display ProductName (obtained from ProductName in uppercase format), and ProductPrice for every product which the price more than or equals 150000. (UPPER)
SELECT 'ProductName' = UPPER(ProductName), ProductPrice
FROM MsProduct
WHERE ProductPrice >= 150000

--5. Delete product data from MsProduct table for every product that has variant name is �hydrating�. (DELETE, LIKE)
SELECT*FROM MsProduct
BEGIN TRAN
DELETE MsProduct 
FROM MsProduct P, MsVariant V
WHERE P.VariantID = V.VariantID AND VariantName LIKE 'hydrating'
ROLLBACK

