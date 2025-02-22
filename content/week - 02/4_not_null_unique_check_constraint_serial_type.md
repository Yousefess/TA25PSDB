# **📌 Constraints in PostgreSQL**

Constraints in PostgreSQL ensure **data integrity** by enforcing rules on columns.

✅ **Key Constraints Covered in This Lesson:**
1️⃣ `NOT NULL` – Ensures a column cannot store NULL values.
2️⃣ `UNIQUE` – Ensures column values are unique.
3️⃣ `CHECK` – Validates data based on a condition.
4️⃣ `SERIAL` – Auto-incrementing column for unique IDs.

---

## **1️⃣ `NOT NULL` Constraint**

This constraint ensures that a column **must always have a value** and **cannot be NULL**.

### **📌 Example: Enforcing `NOT NULL` in a Land Survey Table**

```sql
CREATE TABLE land_survey (
    survey_id       SERIAL PRIMARY KEY,
    location_name   VARCHAR(100) NOT NULL,
    latitude        NUMERIC(9,6) NOT NULL,
    longitude       NUMERIC(9,6) NOT NULL,
    survey_date     DATE NOT NULL
);
```

🔹 **What happens?**

- A survey **must have** a `location_name`, `latitude`, `longitude`, and `survey_date`.
- If you try to insert data **without these values**, PostgreSQL **throws an error**.

📌 **Invalid Attempt (This Fails!):**

```sql
INSERT INTO land_survey (location_name, latitude)
VALUES ('Park A', 35.689);  -- Missing longitude & survey_date!
```

❌ **Error:** "Column `longitude` and `survey_date` cannot be NULL."

---

## **2️⃣ `UNIQUE` Constraint**

Ensures that **no duplicate values** exist in a column.

### **📌 Example: Enforcing Unique Parcel Numbers in a Land Registry**

```sql
CREATE TABLE land_registry (
    parcel_id       SERIAL PRIMARY KEY,
    parcel_number   VARCHAR(20) UNIQUE,
    owner_name      VARCHAR(100),
    area_acres      NUMERIC(5,2) CHECK (area_acres > 0)
);
```

🔹 **What happens?**

- Each `parcel_number` **must be unique**.
- If you try to insert **duplicate parcel numbers**, PostgreSQL **throws an error**.

📌 **Invalid Attempt (This Fails!):**

```sql
INSERT INTO land_registry (parcel_number, owner_name, area_acres)
VALUES ('TX-001', 'John Doe', 12.5);

INSERT INTO land_registry (parcel_number, owner_name, area_acres)
VALUES ('TX-001', 'Alice Brown', 8.3);  -- Duplicate parcel number!
```

❌ **Error:** "Duplicate key violates UNIQUE constraint."

---

## **3️⃣ `CHECK` Constraint**

The `CHECK` constraint **validates data** based on conditions.

### **📌 Example: Ensuring Valid Land Parcel Sizes**

```sql
CREATE TABLE land_parcels (
    parcel_id   SERIAL PRIMARY KEY,
    owner_name  VARCHAR(100),
    area_acres  NUMERIC(5,2) CHECK (area_acres > 0),
    land_use    VARCHAR(50) CHECK (land_use IN ('Residential', 'Agricultural', 'Commercial'))
);
```

🔹 **What happens?**

- `area_acres` **must be greater than 0**.
- `land_use` **must be one of** `'Residential'`, `'Agricultural'`, or `'Commercial'`.

📌 **Invalid Attempt (This Fails!):**

```sql
INSERT INTO land_parcels (owner_name, area_acres, land_use)
VALUES ('Alice Brown', -5, 'Industrial'); -- Negative area & invalid land use!
```

❌ **Error:** "CHECK constraint violation."

---

## **4️⃣ `SERIAL` Data Type**

The `SERIAL` type is used to **auto-generate unique numbers** for a column (commonly used for primary keys).

### **📌 Example: Using `SERIAL` for Survey IDs**

```sql
CREATE TABLE survey_data (
    survey_id       SERIAL PRIMARY KEY,
    surveyor_name   VARCHAR(100) NOT NULL,
    survey_date     DATE NOT NULL
);
```

🔹 **What happens?**

- `SERIAL` **automatically increments** the `survey_id` with each new row.

📌 **Inserting Data:**

```sql
INSERT INTO survey_data (surveyor_name, survey_date)
VALUES ('John Doe', '2024-02-20');

INSERT INTO survey_data (surveyor_name, survey_date)
VALUES ('Jane Smith', '2024-02-21');
```

📌 **Querying the Table:**

```sql
SELECT * FROM survey_data;
```

📝 **Output:**

| survey_id | surveyor_name | survey_date |
|-----------|--------------|-------------|
| 1         | John Doe     | 2024-02-20  |
| 2         | Jane Smith   | 2024-02-21  |

---

# **📌 Summary Table**

| Constraint | Purpose | Example |
|------------|---------|---------|
| `NOT NULL` | Ensures a column cannot be NULL | `location_name VARCHAR(100) NOT NULL` |
| `UNIQUE` | Ensures values in a column are unique | `parcel_number VARCHAR(20) UNIQUE` |
| `CHECK` | Validates values based on conditions | `area_acres NUMERIC(5,2) CHECK (area_acres > 0)` |
| `SERIAL` | Auto-increments unique IDs | `survey_id SERIAL PRIMARY KEY` |

---

# **💡 Exercises**

✅ **Task 1:** Create a table `land_owners`

- Columns: `owner_id (SERIAL PRIMARY KEY)`, `owner_name (NOT NULL)`, `phone_number (UNIQUE)`, `land_area (CHECK land_area > 0)`.
- Insert **3 valid** records and **1 invalid** record to trigger the `CHECK` constraint.

✅ **Task 2:** Create a `building_permits` table.

- Ensure `permit_number` is **UNIQUE** and `building_height` is greater than `2 meters`.

---
