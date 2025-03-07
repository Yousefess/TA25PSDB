# **HAVING Clause in PostgreSQL**

In this topic, students will learn:
✅ The purpose of `HAVING` in filtering grouped data

✅ The difference between `HAVING` and `WHERE`

✅ Practical examples using GIS and land surveying datasets

---

## **1. What is the HAVING Clause?**

The `HAVING` clause **filters grouped data** after applying aggregate functions.

📌 **Why not use WHERE?**

- `WHERE` filters **individual rows** before aggregation.
- `HAVING` filters **groups of rows** after aggregation.

### **Basic Syntax:**

```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;
```

---

## **2. Difference Between WHERE and HAVING**

| Clause  | When It Filters  | Works With Aggregates? |
|---------|----------------|------------------------|
| `WHERE` | Before grouping | ❌ No                  |
| `HAVING` | After grouping | ✅ Yes                 |

### **Example: WHERE vs. HAVING**

🚧 **Scenario:** Find the number of surveys per region where elevation is greater than **500 meters**.

✅ **Using WHERE (Filters Before Grouping)**

```sql
SELECT region, COUNT(*) AS survey_count
FROM land_survey
WHERE elevation > 500
GROUP BY region;
```

🔹 Filters **individual rows** before aggregation.

✅ **Using HAVING (Filters After Grouping)**

```sql
SELECT region, COUNT(*) AS survey_count
FROM land_survey
GROUP BY region
HAVING COUNT(*) > 100;
```

🔹 Filters **grouped results** after counting surveys.

---

## **3. Examples of HAVING Clause in PostgreSQL**

### **Example 1: Find Regions with More Than 100 Surveys**

```sql
SELECT region, COUNT(*) AS survey_count
FROM land_survey
GROUP BY region
HAVING COUNT(*) > 100;
```

✅ Returns only **regions** where total surveys **exceed 100**.

| region         | survey_count |
|---------------|--------------|
| Mountain Zone | 250          |
| Coastal Area  | 320          |

---

### **Example 2: Find Surveyors with an Average Elevation Above 2000 Meters**

```sql
SELECT surveyor_name, AVG(elevation) AS avg_elevation
FROM land_survey
GROUP BY surveyor_name
HAVING AVG(elevation) > 2000;
```

✅ Returns **only surveyors** whose **average elevation** is above 2000 meters.

| surveyor_name | avg_elevation |
|--------------|--------------|
| Alice        | 2750         |
| Bob          | 2900         |

---

### **Example 3: Find Survey Dates Where Total Elevation is Greater Than 500,000 Meters**

```sql
SELECT survey_date, SUM(elevation) AS total_elevation
FROM land_survey
GROUP BY survey_date
HAVING SUM(elevation) > 500000;
```

✅ Filters **only dates** where the total sum of elevations **exceeds 500,000 meters**.

---

### **Example 4: Find Regions Where Maximum Elevation is Greater Than 3000 Meters**

```sql
SELECT region, MAX(elevation) AS max_elevation
FROM land_survey
GROUP BY region
HAVING MAX(elevation) > 3000;
```

✅ Only **regions** with **peaks above 3000 meters** will be shown.

---

## **4. Using HAVING with Multiple Conditions**

🚀 You can combine conditions using **AND / OR**.

### **Example 5: Find Regions Where Surveys > 100 and Avg Elevation > 1500**

```sql
SELECT region, COUNT(*) AS survey_count, AVG(elevation) AS avg_elevation
FROM land_survey
GROUP BY region
HAVING COUNT(*) > 100 AND AVG(elevation) > 1500;
```

✅ Ensures both conditions **must be true**.

---
