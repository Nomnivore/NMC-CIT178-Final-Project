USE PCRepair;
CREATE INDEX idx_BillingCustomer ON Billing(CustomerID);
GO
CREATE INDEX idx_OrderCustomer ON ServiceOrders(CustomerID);
GO
CREATE INDEX idx_OrderEmployee ON ServiceOrders(EmployeeID);
GO
CREATE INDEX idx_DetailOrder ON ServiceDetail(ServiceOrderID);
GO
CREATE INDEX idx_DetailService ON ServiceDetail(ServiceID);
GO
CREATE INDEX idx_DetailPart ON ServiceDetail(PartID);
GO
CREATE INDEX idx_Manager ON Managers(ManagerID);
GO
CREATE INDEX idx_ManagerEmployee ON Managers(EmployeeID);