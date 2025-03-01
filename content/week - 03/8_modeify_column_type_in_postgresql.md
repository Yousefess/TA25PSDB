# **Modify Column Type in PostgreSQL**

In this topic, students will learn:
✅ How to change a column’s data type using `ALTER TABLE`
✅ How to convert existing data to match the new type
✅ Important considerations when modifying column types
✅ Practical GIS-related examples

---

## **1. Changing a Column’s Data Type**

To modify a column’s data type, use:

```sql
ALTER TABLE table_name
ALTER COLUMN column_name SET DATA TYPE new_data_type;
```

### **Example: Change Elevation from INT to FLOAT**

```sql
ALTER TABLE land_survey
ALTER COLUMN elevation SET DATA TYPE FLOAT;
```

- This allows **decimal values** for elevation instead of only integers.

---

## **2. Handling Incompatible Data Types**

If PostgreSQL **cannot automatically convert** the existing data, you need to use `USING` for explicit conversion.

### **Example: Convert survey_date (TEXT → DATE)**

```sql
ALTER TABLE land_survey
ALTER COLUMN survey_date SET DATA TYPE DATE
USING survey_date::DATE;
```

📌 This converts text-formatted dates (`'2024-02-21'`) into actual `DATE` values.

---

## **3. Modifying VARCHAR Length**

You can increase the length of a `VARCHAR` column **without issues**, but decreasing it may cause data loss.

### **Increase Length of region**

```sql
ALTER TABLE land_survey
ALTER COLUMN region SET DATA TYPE VARCHAR(100);
```

### **Reduce Length (Risk of Data Loss)**

```sql
ALTER TABLE land_survey
ALTER COLUMN region SET DATA TYPE VARCHAR(20);
```

⚠️ If a row contains more than 20 characters, **the command will fail**.

---

## **4. Changing Numeric Precision**

If you need more precise elevation values, you can switch from `INTEGER` to `NUMERIC`.

```sql
ALTER TABLE land_survey
ALTER COLUMN elevation SET DATA TYPE NUMERIC(8,2);
```

📌 Now, values like `1234.56` are stored instead of just whole numbers.

---

## **5. Changing Boolean to Integer**

### **Example: Convert is_verified (BOOLEAN → INTEGER)**

```sql
ALTER TABLE survey_status
ALTER COLUMN is_verified SET DATA TYPE INT
USING CASE
    WHEN is_verified = TRUE THEN 1
    ELSE 0
END;
```

- This replaces `TRUE/FALSE` with `1/0`.

---
