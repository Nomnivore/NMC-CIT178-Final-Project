/* Final Project Procedures */

USE PCRepair;
GO
-- Stored Procedures 

/*

CREATE PROC spPcPaidInvoices
AS
SELECT * FROM Billing
WHERE AmountDue-AmountPaid-Credits=0;

GO
EXEC spPcPaidInvoices;


CREATE PROC spPcFindCustByName
	@Name varchar(64) = '%'
AS
BEGIN
	SELECT * FROM Customers
	WHERE FirstName + ' ' + LastName LIKE @Name;
END

GO
EXEC spPcFindCustByName 'Adel%';
GO
EXEC spPcFindCustByName '%Cat%';


CREATE PROC spPcSalesForEmp
	@EmployeeID int,
	@SalesAmnt money OUTPUT,
	@NumItems int OUTPUT
AS
BEGIN
	SELECT @SalesAmnt = SUM(sd.Cost), @NumItems = COUNT(sd.Cost)
	FROM ServiceDetail sd
	JOIN ServiceOrders so ON sd.ServiceOrderID = so.ServiceOrderID
	WHERE EmployeeID=@EmployeeID
END

GO
DECLARE @SalesAmnt money
DECLARE @NumItems int
EXEC spPcSalesForEmp 3, @SalesAmnt OUTPUT, @NumItems OUTPUT;
SELECT @SalesAmnt AS TotalSales, @NumItems AS TotalItemCount;


CREATE PROC spPcOrdersForCust
	@Name varchar(64) = '%'
AS
BEGIN
	DECLARE @CustomerID int = (
		SELECT TOP(1) CustomerID FROM Customers
		WHERE FirstName + ' ' + LastName LIKE @Name
		);
	SELECT * FROM ServiceOrders
	WHERE CustomerID = @CustomerID;
	RETURN @CustomerID;
END

GO
DECLARE @CustID int
EXEC @CustID = spPcOrdersForCust '%MacGiffin';
SELECT @CustID AS CustomerId;


-- User Defined Functions

CREATE FUNCTION spPcGetPartPrice
	(@PartID int)
	RETURNS money
BEGIN
	RETURN (
		SELECT ItemPrice FROM Parts
		WHERE ItemID = @PartID
	)
END

GO
SELECT * FROM Parts
WHERE ItemPrice < dbo.spPcGetPartPrice(1);



CREATE FUNCTION spPcShowPendingOrdersByJob
	(@JobTitle varchar(50) = '%')
	RETURNS table
RETURN (
	SELECT ServiceOrderID, DropoffDate, CustomerID, so.EmployeeID, JobTitle
	FROM ServiceOrders so
	JOIN Employees e ON so.EmployeeID=e.EmployeeID
	WHERE JobTitle LIKE @JobTitle
);

GO
SELECT * FROM dbo.spPcShowPendingOrdersByJob('%Tech%')


-- Final Project Triggers

CREATE TABLE BillingLogs(
	LogId int IDENTITY,
	BillingId int,
	Status varchar(32)
)

CREATE TRIGGER Billing_INSERT ON Billing
	AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @BillingID int;
	SELECT @BillingID = INSERTED.BillingID
	FROM INSERTED

	INSERT INTO BillingLogs
	VALUES(@BillingID, 'Inserted')
END

INSERT INTO Billing(CustomerID, AmountDue, AmountPaid, Credits)
VALUES (42, 300, 150, 150);
INSERT INTO Billing(CustomerID, AmountDue, AmountPaid, Credits)
VALUES (43, 99999, 100, 0);

SELECT * FROM BillingLogs;

CREATE TRIGGER Billing_DELETE ON Billing
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @BillingID int;
	SELECT @BillingID = DELETED.BillingID
	FROM DELETED

	INSERT INTO BillingLogs
	VALUES(@BillingID, 'Deleted')
END

DELETE FROM Billing WHERE CustomerID = 43;

SELECT * FROM BillingLogs;


CREATE TRIGGER Billing_UPDATE ON Billing
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @BillingID int
	DECLARE @Action varchar(50)
	SELECT @BillingID = INSERTED.BillingID
	FROM INSERTED

	IF UPDATE(CustomerID)
		SET @Action = 'Updated ID'

	IF UPDATE(AmountDue)
		SET @Action = 'Updated Due'

	IF UPDATE(AmountPaid)
		SET @Action = 'Updated Paid'

	IF UPDATE([Date])
		SET @Action = 'Updated Date'

	IF UPDATE(Credits)
		SET @Action = 'Updated Credits'

	INSERT INTO BillingLogs
	VALUES(@BillingID, @Action)
END


UPDATE Billing SET [Date] = CAST(GETDATE() AS Date) WHERE CustomerID = 42;
*/
