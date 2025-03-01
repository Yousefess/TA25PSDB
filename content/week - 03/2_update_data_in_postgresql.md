# **Update Data in PostgreSQL**

The **UPDATE** statement in PostgreSQL is used to modify existing records in a table. It allows updating specific rows based on a condition.

---

## **1️⃣ UPDATE Statement**

### **Syntax:**

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

### **Example:**

Suppose we have a `land_survey` table with information about different survey points. If we want to update the elevation of a specific survey point:

```sql
UPDATE land_survey
SET elevation = 3200
WHERE id = 5;
```

This changes the **elevation** of the survey point with `id = 5`.

---

## **2️⃣ Updating Multiple Columns**

We can update multiple columns at once:

```sql
UPDATE land_survey
SET elevation = 3500, survey_date = '2024-02-20'
WHERE id = 7;
```

This updates both **elevation** and **survey_date** for the record with `id = 7`.

---

## **3️⃣ Updating Multiple Rows**

If we want to update multiple rows at once:

```sql
UPDATE land_survey
SET elevation = elevation + 50
WHERE region = 'Mountain Zone';
```

This increases the **elevation** by 50 meters for all records in the **Mountain Zone**.

---

## **4️⃣ Using UPDATE with RETURNING**

PostgreSQL allows retrieving updated rows using `RETURNING`:

```sql
UPDATE land_survey
SET elevation = 2900
WHERE region = 'Valley Zone'
RETURNING *;
```

This updates the **elevation** of all records in the **Valley Zone** and returns the modified rows.

---

## **5️⃣ UPDATE with JOIN (Updating Data from Another Table)**

If we have a **survey_results** table with more accurate elevation data, we can update `land_survey` using a JOIN:

```sql
UPDATE land_survey
SET elevation = survey_results.corrected_elevation
FROM survey_results
WHERE land_survey.id = survey_results.survey_id;
```

This updates the **elevation** in `land_survey` based on the corrected values from `survey_results`.

---

## **6️⃣ Conditional Updates Using CASE**

We can use **CASE** statements to update values based on conditions:

```sql
UPDATE land_survey
SET elevation =
    CASE
        WHEN elevation < 1000 THEN elevation + 100
        WHEN elevation BETWEEN 1000 AND 3000 THEN elevation + 50
        ELSE elevation
    END;
```

This increases elevation based on different height ranges.

---
