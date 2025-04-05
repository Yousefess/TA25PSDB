# 🧩 **Joins in PostgreSQL**

Joins allow you to **combine rows** from two or more tables based on a **related column** (usually a foreign key).

We’ll cover:

- ✅ INNER JOIN

- ✅ LEFT OUTER JOIN

- ✅ RIGHT OUTER JOIN

- ✅ FULL OUTER JOIN

- ✅ GIS-related examples using land surveying tables (without PostGIS)

---

## 🗂️ Example Tables

```sql
-- Table 1: land_survey
CREATE TABLE land_survey (
    survey_id SERIAL PRIMARY KEY,
    region TEXT,
    elevation NUMERIC,
    survey_date DATE
);

-- Table 2: surveyor
CREATE TABLE surveyor (
    surveyor_id SERIAL PRIMARY KEY,
    name TEXT,
    region TEXT  -- Region they are responsible for
);
```

---

## 🔹 1. INNER JOIN

Returns rows when **there is a match in both tables**.

### 💡 Example: Find regions surveyed and the surveyor assigned

```sql
SELECT ls.region, ls.elevation, s.name AS surveyor_name
FROM land_survey ls
INNER JOIN surveyor s
ON ls.region = s.region;
```

✅ Only shows rows where the region exists in **both tables**.

---

## 🔸 2. LEFT OUTER JOIN

Returns **all rows from the left table**, and matched rows from the right. Unmatched right rows return NULL.

### 💡 Example: List all surveys and their surveyors (even if no match in surveyor table)

```sql
SELECT ls.region, ls.elevation, s.name AS surveyor_name
FROM land_survey ls
LEFT JOIN surveyor s
ON ls.region = s.region;
```

✅ Useful when some **surveys were done by unknown or unassigned surveyors**.

---

## 🔸 3. RIGHT OUTER JOIN

Returns **all rows from the right table**, and matched rows from the left. Unmatched left rows return NULL.

### 💡 Example: Show all surveyors and any survey results (even if no survey has been done yet)

```sql
SELECT s.name, s.region, ls.elevation
FROM land_survey ls
RIGHT JOIN surveyor s
ON ls.region = s.region;
```

✅ Useful to check **which surveyors haven't submitted survey data** yet.

---

## 🔸 4. FULL OUTER JOIN

Returns **all rows from both tables**, with NULLs where no match exists.

### 💡 Example: Show all possible survey-region matches and identify gaps

```sql
SELECT ls.region AS survey_region, s.region AS surveyor_region, ls.elevation, s.name
FROM land_survey ls
FULL OUTER JOIN surveyor s
ON ls.region = s.region;
```

✅ Ideal for **data auditing** – see which regions are missing from either table.

---

## 🎯 Summary Table

| Join Type       | Rows Returned                                     |
|------------------|----------------------------------------------------|
| INNER JOIN       | Only matching rows from both tables                |
| LEFT OUTER JOIN  | All from left + matched from right                 |
| RIGHT OUTER JOIN | All from right + matched from left                 |
| FULL OUTER JOIN  | All from both tables with NULLs for missing match  |

---
