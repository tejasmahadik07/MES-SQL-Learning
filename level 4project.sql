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
    CompletionDate TIMESTAMP
);

CREATE TABLE NonConformance (
    ContainerNo VARCHAR(50),
    NCRCode VARCHAR(50),
    Status VARCHAR(20)
);


INSERT INTO WorkOrders VALUES
('WO-C1001','COVID Test Kit','BATCH-101','Released'),
('WO-C1002','COVID Test Kit','BATCH-102','Released'),
('WO-T2001','TB Test Kit','BATCH-201','Released');

INSERT INTO Containers VALUES
('LOT-001','WO-C1001','Assembly',80,'Active',NULL),
('LOT-002','WO-C1001','Testing',120,'Active',NULL),
('LOT-003','WO-C1002','Packaging',200,'Hold',NULL),
('LOT-004','WO-C1002','Completed',200,'Completed','2025-01-10'),
('LOT-005','WO-T2001','Completed',150,'Completed','2025-01-11');

INSERT INTO NonConformance VALUES
('LOT-002','NCR-101','Open'),
('LOT-002','NCR-102','Open'),
('LOT-003','NCR-103','Closed');


SELECT * FROM WorkOrders;
SELECT * FROM Containers;
SELECT * FROM NonConformance;


--production summary by workorder 

SELECT
    WorkOrderNo,
    COUNT(ContainerNo) AS TotalContainers,
    SUM(CurrentQty) AS TotalQuantity
FROM Containers
GROUP BY WorkOrderNo ;

--summary of the status of container

SELECT
    Status,
    COUNT(ContainerNo) AS ContainerCount
FROM Containers
GROUP BY Status;

--identify the current operation Going on 

SELECT
    CurrentOperation,
    COUNT(ContainerNo) AS ContainerCount
FROM Containers
GROUP BY CurrentOperation;

--take a example how much complted workorder

SELECT
    WorkOrderNo,
    SUM(CurrentQty) AS CompletedQuantity
FROM Containers
WHERE Status = 'Completed'
GROUP BY WorkOrderNo;


