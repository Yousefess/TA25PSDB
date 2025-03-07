# **PostgreSQL Operators: `IS NULL`, `IS NOT NULL`, `BETWEEN`, `LIKE`, `ILIKE`**

In this topic, students will learn:
✅ How to check for **NULL values** using `IS NULL` and `IS NOT NULL`

✅ How to filter values **in a range** using `BETWEEN`

✅ How to search for **patterns in text** using `LIKE` and `ILIKE`

✅ Practical **GIS and land surveying examples**

---

## **1. `IS NULL` and `IS NOT NULL` Operators**

📌 In PostgreSQL, `NULL` represents **missing or unknown data**.

### **Syntax:**

```sql
SELECT column_name FROM table_name WHERE column_name IS NULL;
SELECT column_name FROM table_name WHERE column_name IS NOT NULL;
```

### **Example 1: Find Surveys with Missing Elevation Data**

```sql
SELECT region, elevation, survey_date
FROM land_survey
WHERE elevation IS NULL;
```

✅ Returns rows where `elevation` is missing.

### **Example 2: Find Surveys with Recorded Elevation**

```sql
SELECT region, elevation, survey_date
FROM land_survey
WHERE elevation IS NOT NULL;
```

✅ Returns rows where `elevation` has a value.

---

## **2. `BETWEEN` Operator**

📌 The `BETWEEN` operator **filters values within a range** (inclusive).

### **Syntax:**

```sql
SELECT column_name FROM table_name WHERE column_name BETWEEN low AND high;
```

### **Example 3: Find Surveys with Elevation Between 500 and 2000 Meters**

```sql
SELECT region, elevation, survey_date
FROM land_survey
WHERE elevation BETWEEN 500 AND 2000;
```

✅ Returns all elevations **from 500 to 2000**, including 500 and 2000.

### **Example 4: Find Surveys Conducted Between Two Dates**

```sql
SELECT region, survey_date
FROM land_survey
WHERE survey_date BETWEEN '2024-01-01' AND '2024-02-28';
```

✅ Returns surveys conducted **between January and February 2024**.

---

## **3. `LIKE` and `ILIKE` Operators**

📌 `LIKE` is used for **pattern matching** in text.
📌 `ILIKE` is **case-insensitive LIKE** (not available in all databases, but supported in PostgreSQL).

### **Pattern Matching Wildcards:**

| Symbol | Meaning |
|--------|---------|
| `%` | Matches **any number of characters** (including none) |
| `_` | Matches **exactly one character** |

### **Syntax:**

```sql
SELECT column_name FROM table_name WHERE column_name LIKE 'pattern';
SELECT column_name FROM table_name WHERE column_name ILIKE 'pattern';
```

### **Example 5: Find Survey Regions That Start with 'M'**

```sql
SELECT region
FROM land_survey
WHERE region LIKE 'M%';
```

✅ Matches **"Mountain Zone", "Midland"**, etc.

### **Example 6: Find Survey Regions That Contain 'coast' (Case-Insensitive)**

```sql
SELECT region
FROM land_survey
WHERE region ILIKE '%coast%';
```

✅ Matches **"Coastal Area", "EastCoast", "westCOAST"**, etc.

### **Example 7: Find Surveyors with a 3-Letter Name Ending in 'n'**

```sql
SELECT surveyor_name
FROM land_survey
WHERE surveyor_name LIKE '__n';
```

✅ Matches **"Dan", "Jon"**, etc.

---
