/* Final Project Views */

/*

-- #1
USE PCRepair;
GO
CREATE VIEW CustomersWithOrders
AS
SELECT *
FROM Customers
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Billing)
WITH CHECK OPTION;

-- #2
USE PCRepair;
GO
CREATE VIEW QuickServices
AS
SELECT * 
FROM [PCServices]
WHERE TimeEstimateHours <= 1
WITH CHECK OPTION;

-- #3
USE PCRepair;
GO
CREATE VIEW InProgressOrders
AS
SELECT *
FROM ServiceOrders
WHERE PickupDate IS NULL;


-- #4
USE PCRepair;
GO
CREATE VIEW OutstandingBills (CustomerName, AmountOwed, [Date], EmailAddress)
AS
SELECT CONCAT(LastName, ', ', FirstName) AS CustomerName, AmountDue - AmountPaid - Credits AS AmountOwed, [Date], EmailAddress
FROM Billing
JOIN Customers ON Customers.CustomerID = Billing.CustomerID
WHERE AmountDue - AmountPaid - Credits > 0;

---- UPDATING DATA
-- Quick Services are on discount!! 50% off all new service orders (limitations apply)
UPDATE QuickServices
SET LaborCost = 25.00;
----
*/