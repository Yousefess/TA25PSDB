# **📌 ALTER Table & RENAME Table in PostgreSQL**

In PostgreSQL, you can modify an existing table structure using the `ALTER TABLE` command. This lesson covers:

✅ **Modifying Table Columns (`ADD`, `DROP`, `ALTER`)**
✅ **Renaming a Column (`RENAME COLUMN`)**
✅ **Renaming a Table (`RENAME TO`)**
✅ **Changing Data Types (`SET DATA TYPE`)**
✅ **Adding & Dropping Constraints (`ADD CONSTRAINT`, `DROP CONSTRAINT`)**

---

## **1️⃣ ALTER TABLE – Add a New Column (`ADD COLUMN`)**

The `ALTER TABLE` command allows you to **add a new column** to an existing table.

### **📌 Example: Adding a New Column to a Land Survey Table**

```sql
ALTER TABLE land_survey ADD COLUMN survey_date DATE;
```

🔹 **What happens?**

- A new column **`survey_date`** is added to the `land_survey` table.
- The column will be `NULL` for existing rows until values are inserted.

✅ **Adding a column with a default value:**

```sql
ALTER TABLE land_survey ADD COLUMN surveyor_name VARCHAR(100) DEFAULT 'Unknown';
```

---

## **2️⃣ ALTER TABLE – Drop a Column (`DROP COLUMN`)**

To **remove an existing column**, use `DROP COLUMN`.

### **📌 Example: Removing an Unused Column**

```sql
ALTER TABLE land_survey DROP COLUMN surveyor_name;
```

🔹 **What happens?**

- The column **`surveyor_name`** is permanently deleted.
- **All data in this column is lost!**

✅ **Drop multiple columns at once:**

```sql
ALTER TABLE land_survey DROP COLUMN surveyor_name, DROP COLUMN survey_date;
```

---

## **3️⃣ ALTER TABLE – Rename a Column (`RENAME COLUMN`)**

You can rename an existing column using `RENAME COLUMN`.

### **📌 Example: Renaming a Column in a GIS Table**

```sql
ALTER TABLE land_survey RENAME COLUMN latitude TO lat;
ALTER TABLE land_survey RENAME COLUMN longitude TO lon;
```

🔹 **What happens?**

- `latitude` is renamed to `lat`.
- `longitude` is renamed to `lon`.

✅ **This is useful for making column names shorter and more readable.**

---

## **4️⃣ ALTER TABLE – Change Data Type (`SET DATA TYPE`)**

Sometimes, a column’s data type needs to be changed.

### **📌 Example: Changing Data Type for Accuracy**

```sql
ALTER TABLE land_survey ALTER COLUMN lat SET DATA TYPE NUMERIC(10,6);
ALTER TABLE land_survey ALTER COLUMN lon SET DATA TYPE NUMERIC(10,6);
```

🔹 **What happens?**

- The `lat` and `lon` columns now store **latitude and longitude with higher precision**.

✅ **Converting an integer column to a float:**

```sql
ALTER TABLE land_survey ALTER COLUMN elevation SET DATA TYPE FLOAT;
```

---

## **5️⃣ ALTER TABLE – Add & Drop Constraints**

Constraints enforce rules on data. You can **add** or **remove** them using `ALTER TABLE`.

### **📌 Example: Adding a NOT NULL Constraint**

```sql
ALTER TABLE land_survey ALTER COLUMN survey_date SET NOT NULL;
```

🔹 **Now, `survey_date` cannot be NULL.**

✅ **Dropping a constraint:**

```sql
ALTER TABLE land_survey ALTER COLUMN survey_date DROP NOT NULL;
```

---

## **6️⃣ RENAME TABLE – Changing the Table Name**

You can rename a table using `RENAME TO`.

### **📌 Example: Renaming a GIS Table**

```sql
ALTER TABLE land_survey RENAME TO land_survey_records;
```

🔹 **What happens?**

- The `land_survey` table is now called `land_survey_records`.

✅ **Renaming a table should be done carefully if other tables reference it!**

---

# **💡 Summary Table**

| Command | Purpose | Example |
|------------|---------|---------|
| `ALTER TABLE table ADD COLUMN` | Add a new column | `ALTER TABLE land_survey ADD COLUMN survey_date DATE;` |
| `ALTER TABLE table DROP COLUMN` | Remove a column | `ALTER TABLE land_survey DROP COLUMN surveyor_name;` |
| `ALTER TABLE table RENAME COLUMN` | Rename a column | `ALTER TABLE land_survey RENAME COLUMN latitude TO lat;` |
| `ALTER TABLE table ALTER COLUMN SET DATA TYPE` | Change a column’s data type | `ALTER TABLE land_survey ALTER COLUMN lat SET DATA TYPE NUMERIC(10,6);` |
| `ALTER TABLE table ALTER COLUMN SET NOT NULL` | Add a NOT NULL constraint | `ALTER TABLE land_survey ALTER COLUMN survey_date SET NOT NULL;` |
| `ALTER TABLE table ALTER COLUMN DROP NOT NULL` | Remove a NOT NULL constraint | `ALTER TABLE land_survey ALTER COLUMN survey_date DROP NOT NULL;` |
| `ALTER TABLE table RENAME TO new_table_name` | Rename a table | `ALTER TABLE land_survey RENAME TO land_survey_records;` |

---

# **💡 Exercises**

✅ **Task 1:** Create a table `gis_data` with columns: `id (SERIAL PRIMARY KEY)`, `area_name (VARCHAR)`, `population (INT)`.
✅ **Task 2:** Add a new column `land_type (VARCHAR)` to `gis_data`.
✅ **Task 3:** Rename `land_type` to `land_category`.
✅ **Task 4:** Change the `population` column type to `NUMERIC(10,2)`.
✅ **Task 5:** Rename the `gis_data` table to `geospatial_data`.

---
