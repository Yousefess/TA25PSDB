# **WHERE Clause in PostgreSQL**

In this topic, students will learn:
✅ How to use the `WHERE` clause to filter data

✅ Comparison operators (`=`, `!=`, `<`, `>`, `<=`, `>=`)

✅ Logical operators (`AND`, `OR`, `NOT`)

✅ Pattern matching with `LIKE` and `ILIKE`

✅ Filtering NULL values using `IS NULL` and `IS NOT NULL`

✅ Real-world GIS and surveying examples

---

## **1. Introduction to WHERE Clause**

The `WHERE` clause filters rows based on conditions.

### **Basic Syntax:**

```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```

📌 The `WHERE` clause appears **after** `FROM` and **before** `ORDER BY` or `LIMIT`.

### **Example: Get Land Surveys Above 1000 Meters**

```sql
SELECT region, elevation
FROM land_survey
WHERE elevation > 1000;
```

✅ Returns only rows where `elevation` is greater than 1000 meters.

---

## **2. Using Comparison Operators**

The `WHERE` clause supports various operators:

| Operator  | Meaning  |
|-----------|----------|
| `=`       | Equal to |
| `!=` or `<>` | Not equal to |
| `<`       | Less than |
| `>`       | Greater than |
| `<=`      | Less than or equal to |
| `>=`      | Greater than or equal to |

### **Example: Find Surveys from 'Desert Zone'**

```sql
SELECT * FROM land_survey
WHERE region = 'Desert Zone';
```

✅ Filters records where `region` is **exactly** 'Desert Zone'.

### **Example: Find Surveys with Elevation NOT 500 Meters**

```sql
SELECT * FROM land_survey
WHERE elevation != 500;
```

✅ Retrieves all surveys **except** those with an elevation of 500 meters.

---

## **3. Using AND, OR, and NOT Operators**

- `AND` → Both conditions must be true
- `OR` → At least one condition must be true
- `NOT` → Negates a condition

### **Example: Find Mountain Surveys with Elevation Above 2000 Meters**

```sql
SELECT * FROM land_survey
WHERE region = 'Mountain Zone' AND elevation > 2000;
```

✅ Filters records where **both conditions** are met.

### **Example: Find Surveys in 'Coastal' or 'Wetland' Regions**

```sql
SELECT * FROM land_survey
WHERE region = 'Coastal' OR region = 'Wetland';
```

✅ Retrieves surveys in **either** 'Coastal' **or** 'Wetland' regions.

### **Example: Find Surveys NOT in 'Urban Zone'**

```sql
SELECT * FROM land_survey
WHERE NOT region = 'Urban Zone';
```

✅ Returns all surveys **except** those in 'Urban Zone'.

---

## **4. Pattern Matching with LIKE and ILIKE**

- `LIKE` → Case-sensitive matching
- `ILIKE` → Case-insensitive matching
- `%` → Matches any number of characters
- `_` → Matches a single character

### **Example: Find Regions Starting with 'M'**

```sql
SELECT * FROM land_survey
WHERE region LIKE 'M%';
```

✅ Retrieves regions like **'Mountain Zone'**, **'Marshland'**, etc.

### **Example: Find Regions Ending in 'land'**

```sql
SELECT * FROM land_survey
WHERE region LIKE '%land';
```

✅ Matches **'Wetland'**, **'Highland'**, etc.

### **Example: Find Regions Containing 'Coast' (Case-Insensitive)**

```sql
SELECT * FROM land_survey
WHERE region ILIKE '%coast%';
```

✅ Matches **'Coastal Area'**, **'South Coast'**, etc.

---

## **5. Filtering NULL Values**

- `IS NULL` → Finds rows where a column is **NULL**
- `IS NOT NULL` → Finds rows where a column is **NOT NULL**

### **Example: Find Surveys Without Elevation Data**

```sql
SELECT * FROM land_survey
WHERE elevation IS NULL;
```

✅ Retrieves records where **elevation is missing**.

### **Example: Find Surveys with Available Elevation Data**

```sql
SELECT * FROM land_survey
WHERE elevation IS NOT NULL;
```

✅ Returns only rows where **elevation is recorded**.

---

## **6. Combining Multiple Filters**

You can mix `WHERE`, `AND`, `OR`, `LIKE`, and `NULL` filters.

### **Example: Find Recent Mountain Surveys With Elevation Above 2500 Meters**

```sql
SELECT * FROM land_survey
WHERE region = 'Mountain Zone'
AND elevation > 2500
AND survey_date >= '2023-01-01';
```

✅ Retrieves **Mountain Zone surveys** with elevation **above 2500m** conducted **after Jan 1, 2023**.

---
