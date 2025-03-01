# **Set Default Value of a Column in PostgreSQL**

In this topic, students will learn:
✅ How to set a default value when creating a table
✅ How to change the default value of an existing column
✅ How to remove a default value
✅ Practical GIS-related examples

---

## **1. Setting a Default Value When Creating a Table**

You can define a default value when creating a table using the `DEFAULT` keyword.

### **Example: Default Survey Date**

```sql
CREATE TABLE land_survey (
    id SERIAL PRIMARY KEY,
    region VARCHAR(50) NOT NULL,
    elevation INT CHECK (elevation >= 0),
    survey_date DATE DEFAULT CURRENT_DATE -- Default to today's date
);
```

- If a user **does not specify a survey date**, PostgreSQL will **automatically** insert the **current date**.

### **Insert Data Without Specifying survey_date**

```sql
INSERT INTO land_survey (region, elevation)
VALUES ('Coastal Area', 150);
```

📌 **Result:** The `survey_date` column will automatically have today's date.

---

## **2. Changing the Default Value of an Existing Column**

You can **modify an existing column** to set a new default value using `ALTER TABLE ... ALTER COLUMN ... SET DEFAULT`.

### **Example: Change Default Elevation**

```sql
ALTER TABLE land_survey
ALTER COLUMN elevation SET DEFAULT 100;
```

- Now, if `elevation` is not specified, it will default to `100`.

### **Testing the New Default**

```sql
INSERT INTO land_survey (region)
VALUES ('Forest Zone');
```

📌 **Result:** `elevation = 100` automatically.

---

## **3. Removing a Default Value**

To **remove** a default value, use `DROP DEFAULT`.

```sql
ALTER TABLE land_survey
ALTER COLUMN elevation DROP DEFAULT;
```

- Now, `elevation` will be **NULL** unless explicitly provided.

---

## **4. Default Values for Other Data Types**

### **Boolean Default**

```sql
CREATE TABLE survey_status (
    id SERIAL PRIMARY KEY,
    is_verified BOOLEAN DEFAULT FALSE
);
```

- If a value is not provided, `is_verified` will **default to FALSE**.

### **Text Default**

```sql
ALTER TABLE land_survey
ALTER COLUMN region SET DEFAULT 'Unknown';
```

### **Numeric Default**

```sql
ALTER TABLE land_survey
ALTER COLUMN elevation SET DEFAULT 50;
```

---
