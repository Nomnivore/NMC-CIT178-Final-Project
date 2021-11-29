/* Kyle Warner
Aggregate Queries


USE PCRepair;
SELECT so.EmployeeID, e.LastName, COUNT(so.ServiceOrderID) AS 'Total Orders'
FROM ServiceOrders AS so
JOIN Employees AS e ON so.EmployeeID = e.EmployeeID
GROUP BY so.EmployeeID, e.LastName;


USE PCRepair;
SELECT COUNT(*) AS NumInvoices, SUM(AmountDue - Credits) AS IncomeEarned, AVG(AmountDue - Credits) AS AvgBill
FROM Billing
WHERE AmountDue - AmountPaid - Credits = 0;

USE PCRepair;
SELECT MAX(DATEDIFF(day, DropoffDate, PickupDate)) AS LongestOrderTimeDays,
MIN(DATEDIFF(day, DropoffDate, PickupDate)) AS ShortestOrderTimeDays,
AVG(DATEDIFF(day, DropoffDate, PickupDate)) AS AverageOrderTimeDays
FROM ServiceOrders
WHERE DATEDIFF(day, DropoffDate, PickupDate) IS NOT NULL;

USE PCRepair;
SELECT ServiceOrderID, COUNT(*) AS NumItems, AVG(Cost) AS AvgPricePerItem
FROM ServiceDetail
GROUP BY ServiceOrderID;
*/