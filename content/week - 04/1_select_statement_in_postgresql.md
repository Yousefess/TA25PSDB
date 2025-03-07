# **SELECT Statement in PostgreSQL**

In this topic, students will learn:
✅ How to retrieve data using `SELECT`

✅ Filtering with `WHERE`

✅ Sorting results with `ORDER BY`

✅ Limiting results with `LIMIT`

✅ Using `DISTINCT` to remove duplicates

✅ Real-world GIS and surveying examples

---

## **1. Basic SELECT Statement**

The `SELECT` statement is used to retrieve data from a table.

### **Syntax:**

```sql
SELECT column1, column2 FROM table_name;
```

📌 Use `*` to select **all** columns.

### **Example: Retrieve All Land Survey Data**

```sql
SELECT * FROM land_survey;
```

🔹 Returns all records and columns from the `land_survey` table.

---

## **2. Selecting Specific Columns**

To fetch only required columns:

### **Example: Select `region` and `elevation`**

```sql
SELECT region, elevation FROM land_survey;
```

✅ This improves performance by avoiding unnecessary data retrieval.

---

## **3. Filtering Data Using WHERE**

The `WHERE` clause retrieves **specific** rows based on a condition.

### **Example: Get Surveys with Elevation Above 1000 Meters**

```sql
SELECT region, elevation
FROM land_survey
WHERE elevation > 1000;
```

📌 **Comparison Operators:** `=`, `!=`, `<`, `>`, `<=`, `>=`

### **Example: Find Surveys Conducted in 'Mountain Zone'**

```sql
SELECT * FROM land_survey
WHERE region = 'Mountain Zone';
```

### **Using Multiple Conditions**

Use `AND` / `OR` to combine conditions.

```sql
SELECT * FROM land_survey
WHERE region = 'Mountain Zone' AND elevation > 2000;
```

✅ Returns surveys in **Mountain Zone** with **elevation > 2000**.

---

## **4. Sorting Results Using ORDER BY**

Use `ORDER BY` to **sort results** in **ascending (ASC)** or **descending (DESC)** order.

### **Example: Sort Surveys by Elevation (Descending)**

```sql
SELECT region, elevation
FROM land_survey
ORDER BY elevation DESC;
```

📌 Default sorting is **ascending (ASC)**.

---

## **5. Limiting Results with LIMIT**

The `LIMIT` clause restricts the number of rows returned.

### **Example: Get the Top 5 Surveys**

```sql
SELECT * FROM land_survey
ORDER BY survey_date DESC
LIMIT 5;
```

✅ Retrieves **only the 5 most recent surveys**.

---

## **6. Removing Duplicates with DISTINCT**

The `DISTINCT` keyword removes duplicate values.

### **Example: Get Unique Survey Regions**

```sql
SELECT DISTINCT region FROM land_survey;
```

📌 If multiple surveys exist for the same region, **only one** is returned per region.

---

## **7. Combining Conditions: WHERE + ORDER BY + LIMIT**

We can **combine clauses** for advanced queries.

### **Example: Get the 3 Highest Elevation Surveys in 'Mountain Zone'**

```sql
SELECT region, elevation
FROM land_survey
WHERE region = 'Mountain Zone'
ORDER BY elevation DESC
LIMIT 3;
```

✅ Retrieves **only 3 results**, sorted by highest elevation.

---
