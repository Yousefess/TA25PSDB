# **ORDER BY and DISTINCT Clause in PostgreSQL**

In this topic, students will learn:
✅ How to **sort query results** using `ORDER BY`

✅ How to **remove duplicate values** using `DISTINCT`

✅ Practical **GIS and land surveying examples**

---

## **1. ORDER BY Clause in PostgreSQL**

The `ORDER BY` clause **sorts query results** in ascending or descending order.

### **Basic Syntax:**

```sql
SELECT column_name
FROM table_name
ORDER BY column_name [ASC | DESC];
```

📌 **By default, sorting is in ascending (`ASC`) order.**

---

### **Example 1: Sort Survey Data by Elevation**

```sql
SELECT region, elevation, survey_date
FROM land_survey
ORDER BY elevation ASC;
```

✅ **Lowest elevations** appear **first**.

| region         | elevation | survey_date |
|---------------|----------|-------------|
| Coastal Area  | 5        | 2024-02-15  |
| Valley Zone   | 200      | 2024-02-12  |
| Mountain Zone | 2800     | 2024-02-21  |

---

### **Example 2: Sort by Elevation in Descending Order**

```sql
SELECT region, elevation, survey_date
FROM land_survey
ORDER BY elevation DESC;
```

✅ **Highest elevations** appear **first**.

---

### **Example 3: Sort by Multiple Columns**

```sql
SELECT region, elevation, survey_date
FROM land_survey
ORDER BY region ASC, elevation DESC;
```

✅ **Sorts by `region` alphabetically, then by highest elevation.**

---

## **2. DISTINCT Clause in PostgreSQL**

The `DISTINCT` clause **removes duplicate values** from query results.

### **Basic Syntax:**

```sql
SELECT DISTINCT column_name
FROM table_name;
```

---

### **Example 4: Get Unique Survey Regions**

```sql
SELECT DISTINCT region
FROM land_survey;
```

✅ Returns **only unique regions** from the table.

| region         |
|---------------|
| Mountain Zone |
| Coastal Area  |
| Valley Zone   |

---

### **Example 5: Get Unique Combinations of Region and Survey Date**

```sql
SELECT DISTINCT region, survey_date
FROM land_survey;
```

✅ Returns **unique pairs** of `region` and `survey_date`.

---

## **3. Combining ORDER BY and DISTINCT**

🚀 PostgreSQL first **removes duplicates** with `DISTINCT`, then **sorts results** with `ORDER BY`.

### **Example 6: Get Unique Regions, Sorted Alphabetically**

```sql
SELECT DISTINCT region
FROM land_survey
ORDER BY region ASC;
```

---

### **Example 7: Get Unique Surveyors, Sorted by Name**

```sql
SELECT DISTINCT surveyor_name
FROM land_survey
ORDER BY surveyor_name ASC;
```

✅ **Removes duplicate surveyor names, then sorts alphabetically.**

---
