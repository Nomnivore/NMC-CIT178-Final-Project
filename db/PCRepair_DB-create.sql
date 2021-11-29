CREATE DATABASE PCRepair;

GO

USE PCRepair;
CREATE TABLE Customers(
	CustomerID int IDENTITY NOT NULL,
	FirstName varchar(25) NOT NULL,
	LastName varchar(25) NOT NULL,
	EmailAddress varchar(50) NOT NULL,
	PhoneNumber varchar(12) NOT NULL,
	CONSTRAINT Pk_Customer PRIMARY KEY(CustomerID),
	CONSTRAINT Chk_Phone CHECK(
		PhoneNumber LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
	),
	CONSTRAINT Chk_Email CHECK(EmailAddress LIKE '%_@%_.%')
);
GO

CREATE TABLE Employees(
	EmployeeID int IDENTITY NOT NULL,
	FirstName varchar(25) NOT NULL,
	LastName varchar(25) NOT NULL,
	JobTitle varchar(50) NOT NULL,
	CONSTRAINT Pk_Employee PRIMARY KEY(EmployeeID)
);
GO

CREATE TABLE Managers(
	ManagerID int NOT NULL,
	EmployeeID int NOT NULL,
	CONSTRAINT Pk_Manager PRIMARY KEY(ManagerID, EmployeeID),
	CONSTRAINT Fk_Manager FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID),
	CONSTRAINT Fk_Employee FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) 
		ON DELETE CASCADE,
	CONSTRAINT Chk_NotEqual CHECK(ManagerID <> EmployeeID)
);
GO

CREATE TABLE PCServices(
	ItemID int IDENTITY NOT NULL,
	ItemName varchar(50) NOT NULL,
	TimeEstimateHours int NOT NULL,
	LaborCost money NOT NULL,
	CONSTRAINT Pk_Service PRIMARY KEY(ItemID),
	CONSTRAINT Chk_ServicePositives CHECK(TimeEstimateHours >= 0 AND LaborCost >= 0)
);
GO

CREATE TABLE Parts(
	ItemID int IDENTITY NOT NULL,
	ItemName varchar(50) NOT NULL,
	ItemPrice money NOT NULL,
	Quantity int NOT NULL,
	CONSTRAINT Pk_Part PRIMARY KEY(ItemID),
	CONSTRAINT Chk_PartsPositives CHECK(ItemPrice >= 0 AND Quantity >= 0),
);
GO

CREATE TABLE ServiceOrders(
	ServiceOrderID int IDENTITY NOT NULL,
	DropoffDate date NOT NULL,
	PickupDate date,
	CustomerID int NOT NULL,
	EmployeeID int,
	CONSTRAINT Pk_Order PRIMARY KEY(ServiceOrderID),
	CONSTRAINT Fk_OrdersCustomer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT Fk_OrdersEmployee FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
GO

CREATE TABLE ServiceDetail(
	ServiceOrderID int NOT NULL,
	DetailID int NOT NULL,
	ServiceID int,
	PartID int,
	Quantity int NOT NULL,
	Notes varchar(250),
	CONSTRAINT Pk_Detail PRIMARY KEY(ServiceOrderID, DetailID),
	CONSTRAINT Fk_ServiceOrder FOREIGN KEY (ServiceOrderID) REFERENCES ServiceOrders(ServiceOrderID),
	CONSTRAINT Fk_Service FOREIGN KEY (ServiceID) REFERENCES PCServices(ItemID),
	CONSTRAINT Fk_Part FOREIGN KEY (PartID) REFERENCES Parts(ItemID),
	CONSTRAINT Chk_Quantity CHECK(Quantity > 0)
);
GO

CREATE TABLE Billing(
	BillingID int IDENTITY NOT NULL,
	CustomerID int NOT NULL,
	AmountDue money NOT NULL,
	AmountPaid money NOT NULL DEFAULT 0,
	Date date,
	Credits money NOT NULL DEFAULT 0,
	CONSTRAINT Pk_Billing PRIMARY KEY(BillingID),
	CONSTRAINT Fk_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT Chk_Credit CHECK (Credits >= 0)
);