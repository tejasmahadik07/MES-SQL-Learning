CREATE TABLE WorkOrders (
    WorkOrderNo VARCHAR(50),
    ProductName VARCHAR(50),
    BatchNo VARCHAR(50),
    Status VARCHAR(20)
);

CREATE TABLE Containers (
    ContainerNo VARCHAR(50),
    WorkOrderNo VARCHAR(50),
    CurrentOperation VARCHAR(50),
    CurrentQty INT,
    Status VARCHAR(20),
    CompletionDate DATE
);

CREATE TABLE DataCollection (
    ContainerNo VARCHAR(50),
    ParameterName VARCHAR(50),
    ParameterValue VARCHAR(50),
    CollectedBy VARCHAR(50),
    CollectedOn TIMESTAMP
);

CREATE TABLE EquipmentUsage (
    ContainerNo VARCHAR(50),
    EquipmentID VARCHAR(50),
    OperationName VARCHAR(50),
    UsedOn TIMESTAMP
);

CREATE TABLE NonConformance (
    ContainerNo VARCHAR(50),
    NCRCode VARCHAR(50),
    Description VARCHAR(100),
    Status VARCHAR(20)
);

INSERT INTO WorkOrders VALUES
('WO-C1001','COVID Test Kit','BATCH-101','Released'),
('WO-C1002','COVID Test Kit','BATCH-102','Released');

INSERT INTO Containers VALUES
('LOT-001','WO-C1001','Assembly',100,'Active',NULL),
('LOT-002','WO-C1001','Testing',120,'Active',NULL),
('LOT-003','WO-C1002','Packaging',200,'Hold',NULL),
('LOT-004','WO-C1002','Completed',200,'Completed','2025-01-12');

INSERT INTO DataCollection VALUES
('LOT-001','Temperature','25','OperatorA',CURRENT_TIMESTAMP),
('LOT-001','Pressure','5','OperatorA',CURRENT_TIMESTAMP),
('LOT-002','Temperature','42','OperatorB',CURRENT_TIMESTAMP);

INSERT INTO EquipmentUsage VALUES
('LOT-001','EQP-01','Assembly',CURRENT_TIMESTAMP),
('LOT-002','EQP-02','Testing',CURRENT_TIMESTAMP),
('LOT-003','EQP-03','Packaging',CURRENT_TIMESTAMP);

INSERT INTO NonConformance VALUES
('LOT-002','NCR-101','High Temperature','Open'),
('LOT-003','NCR-102','Packaging Delay','Closed');


SELECT * FROM Containers;
SELECT * FROM DataCollection;

--USE CASE 1
--Complete WIP Overview with Work Order & Equipment (Production review)

SELECT
    c.ContainerNo,
    c.CurrentOperation,
    c.Status,
    w.WorkOrderNo,
    w.ProductName,
    e.EquipmentID
FROM Containers c
INNER JOIN WorkOrders w
    ON c.WorkOrderNo = w.WorkOrderNo
LEFT JOIN EquipmentUsage e
    ON c.ContainerNo = e.ContainerNo
WHERE c.Status = 'Active';


--USE CASE 2
--eDHR Completeness Check (Audit Critical)


SELECT
    c.ContainerNo,
    c.CurrentOperation,
    d.ParameterName
FROM Containers c
LEFT JOIN DataCollection d
    ON c.ContainerNo = d.ContainerNo
WHERE d.ParameterName IS NULL;


--USE CASE 3
--Quality Investigation View (NCR + Parameters)

SELECT
    c.ContainerNo,
    w.ProductName,
    n.NCRCode,
    n.Description,
    d.ParameterName,
    d.ParameterValue
FROM Containers c
INNER JOIN WorkOrders w
    ON c.WorkOrderNo = w.WorkOrderNo
LEFT JOIN NonConformance n
    ON c.ContainerNo = n.ContainerNo
LEFT JOIN DataCollection d
    ON c.ContainerNo = d.ContainerNo
WHERE n.Status = 'Open';


--USE CASE 4
--Audit-Ready eDHR View (End-to-End)


SELECT
    w.WorkOrderNo,
    w.BatchNo,
    c.ContainerNo,
    c.CurrentOperation,
    e.EquipmentID,
    d.ParameterName,
    d.ParameterValue,
    n.NCRCode
FROM WorkOrders w
INNER JOIN Containers c
    ON w.WorkOrderNo = c.WorkOrderNo
LEFT JOIN EquipmentUsage e
    ON c.ContainerNo = e.ContainerNo
LEFT JOIN DataCollection d
    ON c.ContainerNo = d.ContainerNo
LEFT JOIN NonConformance n
    ON c.ContainerNo = n.ContainerNo;

