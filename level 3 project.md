
LEVEL 3 – SQL JOINS (what i learned from it )

---

WHAT IS LEVEL 3 ABOUT

In MES systems, data is not stored in one place.
Information is split into different tables such as:

* Work orders (what to produce)
* Containers or lots (what is being produced)
* Data collection (process values)
* Equipment usage (which machine was used)
* Quality issues (NCRs)

To see the full picture, we must **combine data from multiple tables**.
This is done using **SQL JOINS**.

That is what Level 3 is about.

---

WHY JOINS ARE IMPORTANT IN MES

In real manufacturing:

* A work order creates containers
* Containers move through operations
* Data is collected at each step
* Machines are used
* Quality issues may happen

Each of these is stored in a separate table.

JOINS help MES engineers:

* See WIP with product details
* Check if data is missing
* Prepare audit reports
* Investigate quality problems

Without JOINS, SQL is not useful in real MES work.

---

BASIC IDEA OF A JOIN

A JOIN connects two tables using a **common column**.

Example:

* WorkOrders.WorkOrderNo
* Containers.WorkOrderNo

This tells SQL how records are related.

---

TYPES OF JOINS USED IN MES

---

INNER JOIN

What it does
Shows only records that exist in both tables.

Simple meaning
Show only valid production data.

When used in MES

* Containers that belong to a work order
* Normal production reports

Example in words
Show containers only if they have a valid work order.

---

LEFT JOIN

What it does
Shows all records from the first table, even if data is missing in the second table.

Simple meaning
Show everything, and also show what is missing.

When used in MES

* Checking missing data collection
* Audit checks
* Finding incomplete batches

Example in words
Show all containers, even if no data collection exists.

---

RIGHT JOIN

What it does
Shows all records from the second table.

Simple meaning
Less commonly used.

When used in MES

* Checking work orders without containers

Most MES engineers prefer LEFT JOIN instead.

---

HOW JOINS ARE USED IN LEVEL 3 PROJECT

In the Level 3 project:

* WorkOrders are joined with Containers to see WIP
* Containers are joined with DataCollection to check eDHR
* Containers are joined with EquipmentUsage to see machines
* Containers are joined with NCRs to see quality issues

Many joins are used together to get full information.

---

REAL-LIFE EXAMPLE

Question:
Which active containers have missing data collection?

How it is solved:

* Start with Containers
* LEFT JOIN DataCollection
* Check where data is NULL

This is a very common MES support task.

---

WHAT YOU LEARN IN LEVEL 3

After Level 3, you can:

* Combine MES tables correctly
* Answer real production questions
* Support audits and quality teams
* Write useful SQL queries, not just basic ones


