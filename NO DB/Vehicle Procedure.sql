--QUERIES FOR A DATABASE THAT I CANNOT SHARE.
--May or may not build a small and completely separate project for these.

--Author: Kingsly Bude

CREATE PROCEDURE Search_By_Vehicle_Make_Year @make as VARCHAR(30), @year as int as
begin
	SELECT tblVehicle.VehicleID, tblVehicle.VehicleMake, tblVehicle.VehicleModel, tblVehicle.VehicleYear, tblClients.ClientBusinessName
	FROM tblVehicle
		INNER JOIN tblClients on tblVehicle.ClientID = tblClients.ClientID
	WHERE tblVehicle.VehicleMake = @make AND tblVehicle.VehicleYear = @year;
end;
GO;

CREATE PROCEDURE Comprehensive_Vehicle_WorkOrder_List as
begin
	SELECT tblVehicle.VehicleID, tblVehicle.VehicleMake, tblVehicle.VehicleModel, tblVehicle.VehicleYear, tblVehicle.ClientID, tblWorkOrders.OrderID
	FROM tblVehicle
		LEFT JOIN tblWorkOrders on tblWorkOrders.VehicleID = tblVehicle.VehicleID
end;
GO;

CREATE PROCEDURE Employee_Performance_Over_Time as
begin
	SELECT tblEmployees.EmployeeID,
		(tblEmployees.EmployeeFirstName + ' ' + tblEmployees.EmployeeLastName) as 'Employee Name',
		COUNT(*) as 'Total Work Orders',
		FORMAT(SUM(tblWorkOrders.LabourCost), 'c') as 'Total Labour Cost',
		FORMAT(SUM(tblWorkOrders.LabourCost * 0.40 ), 'c') as 'Gross Cost'
	FROM tblEmployees
		LEFT JOIN tblWorkOrders on tblEmployees.EmployeeID = tblWorkOrders.EmployeeID
	GROUP BY tblEmployees.EmployeeID, tblEmployees.EmployeeFirstName, tblEmployees.EmployeeLastName
end;
GO;


CREATE PROCEDURE Vehicles_Without_Work_Orders as
begin
	SELECT sub.* 
	FROM (
		SELECT tblVehicle.VehicleID,
			tblVehicle.VehicleMake,
			tblVehicle.VehicleModel,
			tblVehicle.VehicleYear,
			tblVehicle.ClientID,
			tblWorkOrders.OrderID,
			tblClients.ClientBusinessName,
			tblClients.ClientPhone
		FROM tblVehicle
			LEFT JOIN tblWorkOrders on tblWorkOrders.VehicleID = tblVehicle.VehicleID
			LEFT JOIN tblClients on tblVehicle.ClientID = tblClients.ClientID
	) sub
	WHERE OrderId IS NULL;
end;
GO;

CREATE PROCEDURE Summarized_Costs as
begin
	SELECT FORMAT(MIN(tblWorkOrders.LabourCost), 'c') as 'Lowest Labour Cost' ,
		FORMAT(MAX(tblWorkOrders.LabourCost), 'c') as 'Highest Labour Cost',
		FORMAT(MIN(tblWorkOrders.PartsCost), 'c') as 'Lowest Parts Cost',
		FORMAT(MAX(tblWorkOrders.PartsCost), 'c') as 'Highst Parts Cost',
		FORMAT(AVG(tblWorkOrders.LabourCost), 'c') as 'Average Labour Costs',
		FORMAT(AVG(tblWorkOrders.PartsCost), 'c') as 'Averag Parts Costs',
		FORMAT(SUM(tblWorkOrders.LabourCost), 'c') as 'Total Labour Costs',
		FORMAT(SUM(tblWorkOrders.PartsCost), 'c') as 'Total Parts Costs',
		FORMAT(SUM(tblWorkOrders.LabourCost + tblWorkOrders.PartsCost), 'c') as 'Total Costs'
	FROM tblWorkOrders()
end;
GO;

CREATE PROCEDURE Generate_Invoice as
begin
	SELECT tblWorkOrders.OrderID,
		FORMAT((tblWorkOrders.LabourCost + tblWorkOrders.PartsCost), 'c') as 'Sub Total',
		FORMAT(((tblWorkOrders.LabourCost + tblWorkOrders.PartsCost) * 0.13), 'c') as 'Tax',
		FORMAT(((tblWorkOrders.LabourCost + tblWorkOrders.PartsCost) * 1.13), 'c')  as 'Total'
	FROM tblWorkOrders
end;
GO;

CREATE PROCEDURE SIX_MONTH_CHECK as
begin
	SELECT tblWorkOrders.*, tblVehicle.*
	FROM tblWorkOrders
		INNER JOIN tblVehicle on tblWorkOrders.VehicleID = tblVehicle.VehicleID
	WHERE DATEDIFF(MONTH, tblWorkOrders.IssueDate, GETUTCDATE()) >= 6
end;
GO;