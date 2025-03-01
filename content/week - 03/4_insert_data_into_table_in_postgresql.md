# **Insert Data into Table in PostgreSQL**

In this topic, students will learn:
✅ How to insert data into a table using `INSERT INTO`.

✅ Different ways to insert data: single row, multiple rows, and from another table.

✅ Handling missing values with `DEFAULT`.

✅ Practical GIS-related examples using land survey and geospatial datasets.

---

## **1. Basic Syntax**

The `INSERT INTO` statement is used to add new rows to a table.

```sql
INSERT INTO table_name (column1, column2, column3)
VALUES (value1, value2, value3);
```

---

## **2. Insert a Single Row**

Let’s say we have a table named `land_survey` that stores survey data:

```sql
CREATE TABLE land_survey (
    id SERIAL PRIMARY KEY,
    region VARCHAR(50),
    elevation INT,
    survey_date DATE
);
```

Now, insert a record into the table:

```sql
INSERT INTO land_survey (region, elevation, survey_date)
VALUES ('Highlands', 2500, '2024-02-21');
```

---

## **3. Insert Multiple Rows**

You can insert multiple rows in a single query:

```sql
INSERT INTO land_survey (region, elevation, survey_date)
VALUES
    ('Lowlands', 150, '2024-02-20'),
    ('Coastal Area', 30, '2024-02-19'),
    ('Hilly Region', 800, '2024-02-18');
```

---

## **4. Insert Data from Another Table**

You can insert data from an existing table into another table.

### **Example**: Copying data from `survey_backup` to `land_survey`

```sql
INSERT INTO land_survey (region, elevation, survey_date)
SELECT region, elevation, survey_date FROM survey_backup;
```

This is useful for **data migration** or **duplicating tables**.

---

### **5. Insert Data with Default Values**

If a column has a default value, you can skip it in the `INSERT` statement.

### **Example**: The `id` column is a `SERIAL` type (auto-incremented), so we **don’t** need to insert it

```sql
INSERT INTO land_survey (region, elevation, survey_date)
VALUES ('Mountain Peak', 3200, DEFAULT);
```

- If `survey_date` has a default value (`CURRENT_DATE`), it will use today’s date.

---

## **6. Handling NULL Values**

If a column **allows NULL values**, you can insert a NULL.

```sql
INSERT INTO land_survey (region, elevation, survey_date)
VALUES ('Forest Zone', NULL, '2024-02-21');
```

Here, **elevation is unknown**, so it is set to `NULL`.

---

## **7. GIS-Related Example: Inserting Survey Data**

Consider a land survey dataset where we insert various geographical zones.

```sql
INSERT INTO land_survey (region, elevation, survey_date)
VALUES
    ('Desert', 120, '2024-02-15'),
    ('Wetlands', 25, '2024-02-14'),
    ('Plateau', 2000, '2024-02-13'),
    ('Riverbank', 10, '2024-02-12');
```

- This example covers **different terrain types**.
- It helps in **spatial data analysis** (e.g., elevation patterns).

---

## **8. Common Mistakes & Solutions**

❌ **Inserting values into wrong columns**
✅ Ensure column order matches values:

```sql
-- Incorrect (column order mismatch)
INSERT INTO land_survey (survey_date, region, elevation)
VALUES ('2024-02-22', 'Forest Zone', 500);

-- Correct
INSERT INTO land_survey (region, elevation, survey_date)
VALUES ('Forest Zone', 500, '2024-02-22');
```

❌ **Missing required columns**
✅ If a column has `NOT NULL`, provide a value:

```sql
-- This will cause an error if elevation is NOT NULL
INSERT INTO land_survey (region, survey_date)
VALUES ('Canyon', '2024-02-25');
```

❌ **Inserting duplicate primary key values**
✅ Use `ON CONFLICT` for upserts (covered in the previous topic).

---
