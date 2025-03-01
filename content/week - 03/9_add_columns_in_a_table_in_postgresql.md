# **Add Columns in a Table in PostgreSQL**

In this topic, students will learn:
✅ How to add a new column using `ALTER TABLE`
✅ How to specify a default value for the new column
✅ How to set constraints (e.g., `NOT NULL`, `UNIQUE`, etc.)
✅ Practical GIS-related examples

---

## **1. Adding a New Column**

To add a new column to an existing table, use:

```sql
ALTER TABLE table_name
ADD COLUMN column_name data_type;
```

### **Example: Add an elevation_source column**

```sql
ALTER TABLE land_survey
ADD COLUMN elevation_source VARCHAR(50);
```

📌 This creates a new column to store information about where the elevation data came from (e.g., "Satellite", "Drone", etc.).

---

## **2. Adding a Column with a Default Value**

You can add a column **and set a default value** at the same time.

### **Example: Add is_verified with a default value of FALSE**

```sql
ALTER TABLE land_survey
ADD COLUMN is_verified BOOLEAN DEFAULT FALSE;
```

📌 Now, all new rows will automatically have `FALSE` for `is_verified`.

---

## **3. Adding a Column with a NOT NULL Constraint**

If you want to ensure that a column **cannot have NULL values**, use `NOT NULL`.

### **Example: Add surveyor_name (must not be NULL)**

```sql
ALTER TABLE land_survey
ADD COLUMN surveyor_name VARCHAR(100) NOT NULL;
```

⚠️ If the table already has data, this **will fail** unless every existing row has a value for `surveyor_name`.

📌 **Solution:** First, add the column **without** `NOT NULL`, update existing rows, then modify the column:

```sql
ALTER TABLE land_survey
ADD COLUMN surveyor_name VARCHAR(100);

UPDATE land_survey
SET surveyor_name = 'Unknown'
WHERE surveyor_name IS NULL;

ALTER TABLE land_survey
ALTER COLUMN surveyor_name SET NOT NULL;
```

---

## **4. Adding a Column with a UNIQUE Constraint**

If you want to ensure that no two rows have the same value in a column, use `UNIQUE`.

### **Example: Add a unique survey_code**

```sql
ALTER TABLE land_survey
ADD COLUMN survey_code VARCHAR(20) UNIQUE;
```

📌 This ensures no two surveys have the same survey code.

---

## **5. Adding Multiple Columns at Once**

Instead of adding one column at a time, you can add multiple columns in a **single query**.

### **Example: Add multiple columns to land_survey**

```sql
ALTER TABLE land_survey
ADD COLUMN survey_method VARCHAR(50),
ADD COLUMN accuracy_level NUMERIC(5,2);
```

📌 This adds `survey_method` (e.g., "GPS", "LiDAR") and `accuracy_level` (e.g., `0.95` for 95% confidence).

---

## **6. Adding Multiple Columns to a Table**

You can add more than one column in a **single** `ALTER TABLE` statement.

### **Syntax:**

```sql
ALTER TABLE table_name
ADD COLUMN column_name1 data_type constraint,
ADD COLUMN column_name2 data_type constraint;
```

---

## **7. Example: Adding Multiple Columns to a Land Survey Table**

Let’s say we have a `land_survey` table, and we need to add:

- `survey_method` (e.g., "GPS", "LiDAR")
- `accuracy_level` (a number representing data accuracy)
- `data_source` (e.g., "Satellite", "Manual")

### **SQL Query:**

```sql
ALTER TABLE land_survey
ADD COLUMN survey_method VARCHAR(50) NOT NULL,
ADD COLUMN accuracy_level NUMERIC(5,2),
ADD COLUMN data_source VARCHAR(100) DEFAULT 'Unknown';
```

✅ `survey_method`: Ensures data collection method is always provided (`NOT NULL`).
✅ `accuracy_level`: Allows decimal values (e.g., `95.5% accuracy`).
✅ `data_source`: Defaults to "Unknown" if no value is provided.

---

## **8. Adding Columns with Constraints**

If we need to add columns **with unique values** or **foreign keys**, we can do it in the same query.

### **Example: Add survey_code (Unique) and supervisor_id (Foreign Key)**

```sql
ALTER TABLE land_survey
ADD COLUMN survey_code VARCHAR(20) UNIQUE,
ADD COLUMN supervisor_id INT REFERENCES surveyors(id);
```

✅ `survey_code` ensures each survey has a unique identifier.
✅ `supervisor_id` links to the `surveyors` table, enforcing referential integrity.

---

## **9. Handling Existing Data**

⚠️ If your table **already contains data**, PostgreSQL will not allow adding a `NOT NULL` column **without a default value**.

**Solution:**

1. Add the column **without** `NOT NULL`.
2. Update existing rows with default values.
3. Modify the column to `NOT NULL`.

### **Example: Add surveyor_name with NOT NULL**

```sql
ALTER TABLE land_survey
ADD COLUMN surveyor_name VARCHAR(100);

UPDATE land_survey
SET surveyor_name = 'Unknown'
WHERE surveyor_name IS NULL;

ALTER TABLE land_survey
ALTER COLUMN surveyor_name SET NOT NULL;
```

📌 This ensures existing records comply before enforcing `NOT NULL`.

---
