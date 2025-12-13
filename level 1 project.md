LEVEL 1 – SQL BASICS (MES / PHARMA ORIENTED)
1. What is SQL

Definition
SQL (Structured Query Language) is a standard language used to store, retrieve, and manipulate data in relational database systems such as SQL Server and Oracle.

Why SQL is used
SQL is used to:

* Read data from databases
* Filter and sort records
* Validate stored information
* Support reporting and analysis

Why SQL is important for MES
In Manufacturing Execution Systems (MES), all production-related data is stored in a database. SQL allows MES engineers to:

* Troubleshoot production issues
* Verify transaction execution
* Validate data collection
* Support audits and reporting

Example

```sql
SELECT * FROM Containers;
```

---

2. What is a Database

Definition
A database is an organized collection of structured data stored electronically, allowing efficient data storage, retrieval, and management.

Why databases are used
Databases are used to:

* Store large volumes of structured data
* Ensure data integrity and consistency
* Allow multiple users to access data simultaneously
* Maintain historical records

Relation to MES
MES uses databases to store:

* Containers (lots/batches)
* Work orders
* Transaction history
* Data collection values
* Genealogy and traceability information

---

3. Tables, Rows, and Columns

Table
A table represents a business entity in MES.

Examples:
Table Name | Description
Containers | Stores WIP and batch information
WorkOrders | Stores manufacturing order details

Row
A row represents one single record in a table.
Example: One container or one work order.

Column
A column represents an attribute of the entity.
Example: ContainerName, Status, CurrentQty.

---

4. Primary Key (PK)

Definition
A Primary Key uniquely identifies each record in a table.

Why Primary Key is important

* Ensures every record is unique
* Prevents duplicate data
* Enables reliable data referencing

Example

```sql
ContainerID INT PRIMARY KEY
```

MES context
In MES, primary keys ensure:

* Each container is uniquely tracked
* Each work order is uniquely identified
* Audit and traceability data is accurate

---

5. Foreign Key (FK)

Definition
A Foreign Key creates a relationship between two tables by referencing a Primary Key from another table.

Relationship between tables
Foreign keys define how tables are linked together in relational databases.

MES example

```sql
WorkOrderID INT FOREIGN KEY REFERENCES WorkOrders(WorkOrderID)
```

Explanation
This relationship connects containers to work orders, allowing production tracking and reporting.

---

6. SELECT statement

Purpose
The SELECT statement is used to retrieve data from database tables. It is the most frequently used SQL command in MES support and development.

Syntax

```sql
SELECT column1, column2
FROM table_name;
```

Examples
Select all columns:

```sql
SELECT * FROM Containers;
```

Select specific columns:

```sql
SELECT ContainerName, Status
FROM Containers;
```

MES use case
Used to view WIP, container status, and production data during support activities.

---

7. WHERE clause

Purpose
The WHERE clause is used to filter records based on specified conditions.

Common operators
= Equal

> Greater than
> < Less than

Example

```sql
SELECT *
FROM Containers
WHERE Status = 'Active';
```

MES use case
Filtering active production lots during daily WIP review.

---

8. ORDER BY

Purpose
ORDER BY is used to sort query results in ascending or descending order.

Sorting options
ASC Ascending
DESC Descending

Example

```sql
SELECT ContainerName
FROM Containers
ORDER BY ContainerName ASC;
```

MES use case
Sorting containers or work orders for reports and reviews.

---

9. DISTINCT

Purpose
DISTINCT removes duplicate values from query results.

Example

```sql
SELECT DISTINCT WorkOrder
FROM Containers;
```

MES use case
Used to identify unique work orders or operations configured in the system.

---

10. AND / OR / NOT

Purpose
Logical operators are used to apply multiple filtering conditions.

Example

```sql
SELECT *
FROM Containers
WHERE Status = 'Active'
AND CurrentQty > 0;
```

MES use case
Finding active containers with valid quantities during troubleshooting.

---

11. TOP / LIMIT

Purpose
Used to limit the number of records returned by a query.

SQL Server usage
SQL Server uses the TOP keyword.

Example

```sql
SELECT TOP 10 *
FROM Containers;
```

MES use case
Fetching latest records for management reporting or audits.

---

12. NULL values

What is NULL
NULL represents missing or unknown data. It is not zero and not an empty string.

Why NULL exists

* Data not yet entered
* Process not completed
* Optional fields

Checking NULL

```sql
SELECT *
FROM Containers
WHERE CompletionDate IS NULL;
```

MES use case
Identifying incomplete batches or open production records during audits.

---

13. Aliases (AS)

Purpose
Aliases are used to rename columns or tables to make output more readable.

Example

```sql
SELECT
    ContainerName AS Container,
    CurrentQty AS Quantity
FROM Containers;
```

MES use case
Improving clarity in reports and dashboards shared with production and quality teams.

# MES-SQL-Learning