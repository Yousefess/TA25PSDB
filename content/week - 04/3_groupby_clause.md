# **GROUP BY Clause in PostgreSQL**

In this topic, students will learn:
✅ How to use `GROUP BY` to aggregate data

✅ Common aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)

✅ Using `HAVING` to filter grouped data

✅ Real-world GIS and surveying examples

---

## **1. Introduction to GROUP BY Clause**

The `GROUP BY` clause is used **to group rows** that have the **same values** in specified columns. It is often used with aggregate functions to **summarize data**.

### **Basic Syntax:**

```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name;
```

📌 The `GROUP BY` clause **must appear after** `WHERE` and **before** `ORDER BY`.

---

## **2. Common Aggregate Functions Used with GROUP BY**

| Function  | Description  |
|-----------|--------------|
| `COUNT()` | Counts the number of rows |
| `SUM()`   | Sums values in a column |
| `AVG()`   | Calculates the average value |
| `MIN()`   | Returns the smallest value |
| `MAX()`   | Returns the largest value |

---

## **3. GROUP BY Examples**

### **Example 1: Count Surveys in Each Region**

```sql
SELECT region, COUNT(*) AS total_surveys
FROM land_survey
GROUP BY region;
```

✅ Returns the **number of surveys** in each region.

| region         | total_surveys |
|---------------|--------------|
| Mountain Zone | 250          |
| Wetland       | 180          |
| Coastal Area  | 320          |

---

### **Example 2: Average Elevation Per Region**

```sql
SELECT region, AVG(elevation) AS avg_elevation
FROM land_survey
GROUP BY region;
```

✅ Calculates the **average elevation** for each region.

| region         | avg_elevation |
|---------------|--------------|
| Mountain Zone | 2750         |
| Wetland       | 350          |
| Coastal Area  | 120          |

---

### **Example 3: Find Maximum Elevation Per Surveyor**

```sql
SELECT surveyor_name, MAX(elevation) AS max_elevation
FROM land_survey
GROUP BY surveyor_name;
```

✅ Returns the **highest elevation** recorded by each surveyor.

| surveyor_name | max_elevation |
|--------------|--------------|
| Alice        | 2900         |
| Bob          | 2750         |
| Charlie      | 3050         |

---

## **4. Using GROUP BY with Multiple Columns**

You can group by **more than one column**.

### **Example 4: Count Surveys by Region and Year**

```sql
SELECT region, EXTRACT(YEAR FROM survey_date) AS survey_year, COUNT(*) AS total_surveys
FROM land_survey
GROUP BY region, survey_year;
```

✅ Groups surveys by **region and year**.

| region         | survey_year | total_surveys |
|---------------|------------|--------------|
| Mountain Zone | 2023       | 120          |
| Mountain Zone | 2024       | 130          |
| Wetland       | 2023       | 80           |
| Wetland       | 2024       | 100          |

---

## **5. Filtering Grouped Data with HAVING**

- The `HAVING` clause **filters groups** after aggregation.
- It works **like `WHERE` but for grouped results**.

### **Example 5: Find Regions with More Than 200 Surveys**

```sql
SELECT region, COUNT(*) AS total_surveys
FROM land_survey
GROUP BY region
HAVING COUNT(*) > 200;
```

✅ Displays **only regions** with **more than 200 surveys**.

| region         | total_surveys |
|---------------|--------------|
| Mountain Zone | 250          |
| Coastal Area  | 320          |

---

### **Example 6: Find Surveyors with an Average Elevation Above 2000 Meters**

```sql
SELECT surveyor_name, AVG(elevation) AS avg_elevation
FROM land_survey
GROUP BY surveyor_name
HAVING AVG(elevation) > 2000;
```

✅ Returns only **surveyors** whose **average elevation** is above 2000 meters.

---
