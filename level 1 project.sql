CREATE TABLE workorders (
WOID INT PRIMARY KEY,
WONo VARCHAR(50),
productname VARCHAR(50),
batchNo VARCHAR(50),
plannedqty INT,
status VARCHAR(20)
);

CREATE TABLE containers (
containerID INT PRIMARY KEY,
containerNO VARCHAR(50),
WOID INT,
currentoperation VARCHAR(50),
currentqty INT,
status VARCHAR(50),
completiondate DATE );
   
CREATE TABLE datacollection (
DCID INT PRIMARY KEY,
containerNO VARCHAR(50),
parameterName VARCHAR(50),
parameterValue VARCHAR(50),
collectedBy VARCHAR(50),
collectedOn TIMESTAMP
);

INSERT INTO workorders VALUES
(1, 'WO-C001', 'COVID Test Kit', 'BATCH-101', 1000, 'Released'),
(2, 'WO-C002', 'TB Test Kit', 'BATCH-102', 800, 'Released');

UPDATE workorders
SET productname = 'IVD KIT'
WHERE productname IN ('COVID Test Kit', 'TB Test Kit');

SELECT * FROM workorders

INSERT INTO Containers VALUES
(101, 'LOT-001', 1, 'Assembly', 100, 'Active', '2025-12-09'),
(102, 'LOT-002', 1, 'Testing', 100, 'Active', '2025-12-10'),
(103, 'LOT-003', 2, 'Packaging', 200, 'Hold', '2025-12-11'),
(104, 'LOT-004', 2, 'Completed', 200, 'Completed', '2025-12-11');

UPDATE Containers
SET CompletionDate = '2025-12-11'
WHERE CompletionDate = '2025-01-05';

SELECT * FROM containers

INSERT INTO datacollection VALUES
(1, 'LOT-001', 'Temperature', '25', 'OperatorA', CURRENT_TIMESTAMP),
(2, 'LOT-001', 'Pressure', '5', 'OperatorA', CURRENT_TIMESTAMP),
(3, 'LOT-002', 'Temperature', '40', 'OperatorB', CURRENT_TIMESTAMP);

SELECT * FROM datacollection

-- daily production review

SELECT ContainerNo, CurrentOperation, CurrentQty
FROM Containers
WHERE Status = 'Active';

--Identify incomplete batches 
--Audit & quality checks

SELECT ContainerNo
FROM Containers
WHERE CompletionDate IS NULL;

--List unique operations used in manufacturing
--Process review

SELECT DISTINCT CurrentOperation
FROM Containers;


--Check data collection done for a batch
--eDHR verification

SELECT ParameterName, ParameterValue, CollectedBy
FROM DataCollection
WHERE ContainerNo = 'LOT-001';

--Find high-risk temperature values
--Quality investigation

SELECT ContainerNo, ParameterValue
FROM DataCollection
WHERE ParameterName = 'Temperature'
AND ParameterValue > '37';


--Get latest completed batches
--Management reporting


SELECT ContainerNo, CompletionDate
FROM Containers
WHERE Status = 'Completed'
ORDER BY CompletionDate DESC
LIMIT 2;





