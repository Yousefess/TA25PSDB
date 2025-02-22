# **📌 Copy Table in PostgreSQL**

In this section, your students will learn how to **copy a table** in PostgreSQL using different methods.

✅ **Key Learning Points:**
1️⃣ Copy a table **structure only** (without data).
2️⃣ Copy a table **with data**.
3️⃣ Copy a table **with modifications**.
4️⃣ Copy a table using the **CREATE TABLE AS** statement.

---

## **1️⃣ Copy Table Structure Only (Without Data)**

This method copies only the **table structure** (column names, data types, constraints) but **not the data**.

### **📌 Example: Copying a Land Survey Table Structure**

Imagine we have a table **`survey_points`** storing GPS data for land surveying.

```sql
CREATE TABLE survey_points (
    id              SERIAL PRIMARY KEY,
    location_name   VARCHAR(100),
    latitude        NUMERIC(9,6),
    longitude       NUMERIC(9,6),
    elevation       FLOAT,
    survey_date     DATE
);
```

Now, to **copy the structure only** (without copying data):

```sql
CREATE TABLE survey_points_backup (LIKE survey_points);
```

🔹 **What happens?**

- This creates a **new empty table** `survey_points_backup`
- It **inherits** all columns and data types from `survey_points`
- **Does not copy** constraints like `PRIMARY KEY` or indexes (unless specified).

📌 **To also copy indexes, constraints, and sequences:**

```sql
CREATE TABLE survey_points_backup (LIKE survey_points INCLUDING ALL);
```

---

## **2️⃣ Copy Table Structure & Data**

To copy both **structure and data**, use:

```sql
CREATE TABLE survey_points_copy AS
SELECT * FROM survey_points;
```

🔹 **What happens?**

- Creates a new table `survey_points_copy`
- Copies **all existing rows** from `survey_points`

📌 **Example in GIS Context:**

```sql
CREATE TABLE gps_points_copy AS
SELECT * FROM gps_points WHERE elevation > 500; -- Copying only high-elevation points
```

---

## **3️⃣ Copy Table and Modify Structure**

Sometimes, you may want to **copy a table but modify its structure** (e.g., add/remove columns).

### **📌 Example: Copy Table & Add a Column**

```sql
CREATE TABLE survey_points_extended AS
SELECT *, 'Unknown'::VARCHAR(50) AS surveyor_name FROM survey_points;
```

🔹 **What happens?**

- Copies **all columns** from `survey_points`
- **Adds** a new column `surveyor_name` with a default value `'Unknown'`

---

## **4️⃣ Copy Table Using INSERT INTO**

You can also create a new table first, then **copy data manually**.

```sql
CREATE TABLE survey_backup (LIKE survey_points INCLUDING ALL);

INSERT INTO survey_backup
SELECT * FROM survey_points;
```

🔹 **What happens?**

1. The first query **creates an empty table** with the same structure.
2. The second query **copies the data** from `survey_points`.

---

# **📌 Summary Table**

| Method | Copies Structure? | Copies Data? | Copies Constraints? |
|--------|-----------------|--------------|------------------|
| `CREATE TABLE new_table (LIKE old_table);` | ✅ Yes | ❌ No | ❌ No |
| `CREATE TABLE new_table (LIKE old_table INCLUDING ALL);` | ✅ Yes | ❌ No | ✅ Yes |
| `CREATE TABLE new_table AS SELECT * FROM old_table;` | ✅ Yes | ✅ Yes | ❌ No |
| `INSERT INTO new_table SELECT * FROM old_table;` | ✅ Yes (if manually created) | ✅ Yes | ✅ Yes |

---

# **💡 Exercise**

Ask students to **copy a GIS-related table** and make modifications.

1️⃣ **Copy** the `land_parcels` table but **add a new column `land_use_type`**.
2️⃣ **Copy only** the data of parcels larger than 10 acres.
3️⃣ **Copy the `gps_points` table**, keeping only points **above 500m elevation**.

```sql
CREATE TABLE land_parcels_copy AS
SELECT *, 'Agricultural'::VARCHAR(50) AS land_use_type
FROM land_parcels;
```

---
