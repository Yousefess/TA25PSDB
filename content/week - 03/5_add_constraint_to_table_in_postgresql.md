# **Add Constraints to a Table in PostgreSQL**

In this topic, students will learn:
✅ What constraints are and why they are important.
✅ How to add constraints while creating a table.
✅ How to add constraints to an existing table using `ALTER TABLE`.
✅ Practical GIS-related examples using land survey and geospatial datasets.

---

## **1. What Are Constraints?**

Constraints enforce **rules** on the data stored in a table. They help maintain **data integrity** and prevent invalid entries.

### **Common PostgreSQL Constraints:**

| Constraint     | Description |
|---------------|-------------|
| `NOT NULL`    | Ensures a column **cannot be NULL**. |
| `UNIQUE`      | Ensures **no duplicate values** in a column. |
| `PRIMARY KEY` | Uniquely identifies each row (**NOT NULL + UNIQUE**). |
| `FOREIGN KEY` | Enforces a **relationship** between tables. |
| `CHECK`       | Ensures data meets **a specific condition**. |
| `DEFAULT`     | Assigns a **default value** if none is provided. |

---

## **2. Adding Constraints When Creating a Table**

You can define constraints inside the `CREATE TABLE` statement.

#### **Example: Land Survey Table with Constraints**

```sql
CREATE TABLE land_survey (
    id SERIAL PRIMARY KEY,       -- Unique ID for each survey
    region VARCHAR(50) NOT NULL, -- Region name cannot be NULL
    elevation INT CHECK (elevation >= 0), -- Elevation cannot be negative
    survey_date DATE DEFAULT CURRENT_DATE, -- Default to today's date
    UNIQUE (region, survey_date) -- Each region can have only one survey per day
);
```

### **Explanation:**

- `PRIMARY KEY`: Ensures each row has a unique `id`.
- `NOT NULL`: The `region` column **must** have a value.
- `CHECK`: Ensures `elevation` **is not negative**.
- `DEFAULT`: Automatically fills `survey_date` with **the current date** if not provided.
- `UNIQUE`: Prevents duplicate `region` & `survey_date` pairs.

---

## **3. Adding Constraints to an Existing Table**

Use `ALTER TABLE` to add constraints **after** table creation.

### **Example: Adding Constraints to `land_survey`**

```sql
-- Add NOT NULL constraint to region
ALTER TABLE land_survey
ALTER COLUMN region SET NOT NULL;

-- Add UNIQUE constraint to region and survey_date
ALTER TABLE land_survey
ADD CONSTRAINT unique_survey UNIQUE (region, survey_date);

-- Add CHECK constraint for elevation
ALTER TABLE land_survey
ADD CONSTRAINT check_elevation CHECK (elevation >= 0);
```

---

## **4. PRIMARY KEY & FOREIGN KEY Constraints**

### **Primary Key (Unique Identifier)**

```sql
CREATE TABLE surveyors (
    surveyor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
```

- Ensures **each surveyor has a unique ID**.

### **Foreign Key (Links Two Tables)**

The `land_survey` table can reference `surveyors` using a **foreign key**.

```sql
ALTER TABLE land_survey
ADD COLUMN surveyor_id INT,
ADD CONSTRAINT fk_surveyor FOREIGN KEY (surveyor_id)
REFERENCES surveyors(surveyor_id) ON DELETE CASCADE;
```

- `FOREIGN KEY`: Links `land_survey.surveyor_id` to `surveyors.surveyor_id`.
- `ON DELETE CASCADE`: If a surveyor is deleted, their surveys are deleted too.

---

## **5. CHECK Constraint (Custom Rules)**

Use `CHECK` to enforce conditions.

```sql
ALTER TABLE land_survey
ADD CONSTRAINT check_survey_date CHECK (survey_date <= CURRENT_DATE);
```

- Prevents future dates in `survey_date`.

---

## **6. DROP Constraints**

You can remove constraints using `ALTER TABLE`.

```sql
ALTER TABLE land_survey
DROP CONSTRAINT unique_survey;
```

- This removes the **UNIQUE** constraint on `region, survey_date`.

---
