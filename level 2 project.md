LEVEL 2 – FILTERING AND SORTING (MES / PHARMA ORIENTED)

---

Overview
Level 2 focuses on filtering and narrowing down MES data.
These SQL concepts are heavily used during:

* MES support troubleshooting
* Quality investigations
* Audit preparation
* Production and WIP analysis

---

1. IN operator

Purpose
The IN operator is used to filter records when multiple values need to be checked in a single condition.
It simplifies queries that would otherwise require multiple OR conditions.

Syntax

```sql
SELECT column_name
FROM table_name
WHERE column_name IN (value1, value2, value3);
```

MES example
Find containers that are either Active or on Hold.

```sql
SELECT ContainerNo, Status
FROM Containers
WHERE Status IN ('Active', 'Hold');
```

MES use case
Used when production or quality teams want to view multiple container statuses in one query.

---

2. BETWEEN

Purpose
The BETWEEN operator filters data within a specific range.
It is commonly used for quantities, dates, and batch ranges.

Syntax

```sql
SELECT column_name
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

MES example
Find containers with quantity between 50 and 200.

```sql
SELECT ContainerNo, CurrentQty
FROM Containers
WHERE CurrentQty BETWEEN 50 AND 200;
```

MES use case
Used during production reviews to identify batches with abnormal or boundary quantities.

---

3. LIKE and Wildcards

Purpose
The LIKE operator is used for pattern matching in text data.
Wildcards help match partial values.

Wildcards

* % matches any number of characters
* _ matches a single character

Syntax

```sql
SELECT column_name
FROM table_name
WHERE column_name LIKE 'pattern';
```

MES example
Find all work orders starting with WO-C.

```sql
SELECT WorkOrderNo, ProductName
FROM WorkOrders
WHERE WorkOrderNo LIKE 'WO-C%';
```

MES use case
Used when searching production orders, batches, or containers with known prefixes.

---

4. Comparison operators

Purpose
Comparison operators are used to compare values in conditions.

Common operators
= Equal to
!= or <> Not equal to

> Greater than
> < Less than
> = Greater than or equal to
> <= Less than or equal to

MES example
Find containers with quantity greater than 100.

```sql
SELECT ContainerNo, CurrentQty
FROM Containers
WHERE CurrentQty > 100;
```

MES use case
Used in quality checks to identify high-volume or risk-prone batches.

---

5. IS NULL and IS NOT NULL

Purpose
These operators are used to check missing or incomplete data.
They are critical in regulated environments like pharma.

Syntax

```sql
WHERE column_name IS NULL
WHERE column_name IS NOT NULL
```

MES example
Find incomplete batches.

```sql
SELECT ContainerNo
FROM Containers
WHERE CompletionDate IS NULL;
```

Find completed batches.

```sql
SELECT ContainerNo, CompletionDate
FROM Containers
WHERE CompletionDate IS NOT NULL;
```

MES use case
Used during audits and batch release checks to ensure records are complete.

