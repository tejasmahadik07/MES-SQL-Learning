CREATE TABLE WorkOrders (
    WorkOrderNo VARCHAR(50),
    ProductName VARCHAR(50),
    BatchNo VARCHAR(50),
    Status VARCHAR(20)
);

INSERT INTO WorkOrders VALUES
('WO-C1001', 'COVID Test Kit', 'BATCH-101', 'Released'),
('WO-C1002', 'COVID Test Kit', 'BATCH-102', 'Released'),
('WO-T2001', 'TB Test Kit', 'BATCH-201', 'Released'),
('WO-T2002', 'TB Test Kit', 'BATCH-202', 'Closed');


CREATE TABLE Container (
    ContainerNo VARCHAR(50),
    WorkOrderNo VARCHAR(50),
    CurrentOperation VARCHAR(50),
    CurrentQty INT,
    Status VARCHAR(20),
    CompletionDate DATE
);


INSERT INTO Containers VALUES
('LOT-001', 'WO-C1001', 'Assembly', 80, 'Active', NULL),
('LOT-002', 'WO-C1001', 'Testing', 120, 'Active', NULL),
('LOT-003', 'WO-C1002', 'Packaging', 250, 'Hold', NULL),
('LOT-004', 'WO-T2001', 'Assembly', 60, 'Active', NULL),
('LOT-005', 'WO-T2001', 'Completed', 100, 'Completed', '2025-01-10'),
('LOT-006', 'WO-T2002', 'Completed', 200, 'Completed', '2025-01-08');


--USE CASE 1: FIND ACTIVE AND HOLD CONTAINERS
--Daily production review

SELECT ContainerNo, Status
FROM Containers
WHERE Status IN ('Active', 'Hold');

--USE CASE 2: IDENTIFY CONTAINERS WITH MEDIUM QUANTITY RANGE
--Quality monitoring

SELECT ContainerNo, CurrentQty
FROM Containers
WHERE CurrentQty BETWEEN 50 AND 150;


--USE CASE 3: SEARCH WORK ORDERS BY NAMING PATTERN
--MES troubleshooting

SELECT WorkOrderNo, ProductName
FROM WorkOrders
WHERE WorkOrderNo LIKE 'WO-C%';
--any value that starts with WO-C


--USE CASE 4: IDENTIFY HIGH-RISK HIGH-QUANTITY CONTAINERS
--Quality investigation

SELECT ContainerNo, CurrentQty
FROM Containers
WHERE CurrentQty > 200;


--USE CASE 5: FIND INCOMPLETE BATCHES
--Audit and compliance

SELECT ContainerNo
FROM Containers
WHERE CompletionDate IS NULL;


--USE CASE 6: FIND COMPLETED BATCHES
--Production reporting

SELECT ContainerNo, CompletionDate
FROM Containers
WHERE CompletionDate IS NOT NULL;




