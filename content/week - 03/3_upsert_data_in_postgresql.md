# **Upsert Data in PostgreSQL**

**Upsert** (Update + Insert) in PostgreSQL allows inserting new rows into a table while updating existing ones if a conflict occurs. This is useful when handling duplicate records efficiently.

---

## **1️⃣ Using INSERT ... ON CONFLICT (Upsert)**

PostgreSQL provides the `ON CONFLICT` clause to handle duplicate key violations.

### **Syntax:**

```sql
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...)
ON CONFLICT (conflict_column)
DO UPDATE SET column1 = EXCLUDED.column1, column2 = EXCLUDED.column2;
```

- `conflict_column`: The column that causes a conflict (usually a **PRIMARY KEY** or **UNIQUE** constraint).
- `EXCLUDED.column1`: Refers to the values that were attempted to be inserted.

---

### **2️⃣ Example: Upserting Survey Data**

Assume we have a **land_survey** table:

```sql
CREATE TABLE land_survey (
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL,
    elevation INT NOT NULL,
    survey_date DATE NOT NULL,
    UNIQUE(region, survey_date) -- Prevents duplicate surveys for the same region on the same date
);
```

Now, let's insert data and update if a conflict occurs:

```sql
INSERT INTO land_survey (region, elevation, survey_date)
VALUES ('Coastal Area', 120, '2024-02-21')
ON CONFLICT (region, survey_date)
DO UPDATE SET elevation = EXCLUDED.elevation;
```

- If a survey for `'Coastal Area'` on `'2024-02-21'` **does not exist**, a new row is inserted.
- If it **already exists**, the `elevation` is updated.

---

### **3️⃣ Upserting Multiple Columns**

If we want to update multiple columns:

```sql
INSERT INTO land_survey (region, elevation, survey_date)
VALUES ('Mountain Zone', 2800, '2024-02-21')
ON CONFLICT (region, survey_date)
DO UPDATE SET
    elevation = EXCLUDED.elevation,
    survey_date = EXCLUDED.survey_date;
```

---

### **4️⃣ Using DO NOTHING (Ignore Conflict)**

If we want to **ignore** conflicts instead of updating:

```sql
INSERT INTO land_survey (region, elevation, survey_date)
VALUES ('Desert Area', 500, '2024-02-21')
ON CONFLICT (region, survey_date)
DO NOTHING;
```

- This prevents duplicate errors **without updating** existing records.

---

### **5️⃣ Using RETURNING with Upsert**

We can retrieve updated or inserted records:

```sql
INSERT INTO land_survey (region, elevation, survey_date)
VALUES ('Forest Zone', 600, '2024-02-21')
ON CONFLICT (region, survey_date)
DO UPDATE SET elevation = EXCLUDED.elevation
RETURNING *;
```

---
