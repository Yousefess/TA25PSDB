# **CAST Operator in PostgreSQL**

In this topic, students will learn:
✅ How to **convert** one data type to another using `CAST`

✅ The **syntax** and shorthand (`::`) for casting

✅ Practical **GIS and land surveying examples**

---

## **1. What is the CAST Operator?**

📌 The `CAST` operator is used to **convert a value from one data type to another** in PostgreSQL.

### **Syntax:**

```sql
SELECT CAST(value AS target_data_type);
```

or using the **shorthand syntax**:

```sql
SELECT value::target_data_type;
```

---

## **2. Numeric Type Conversion**

### **Example 1: Convert a Decimal to an Integer**

```sql
SELECT CAST(15.75 AS INTEGER);  -- Output: 15
```

or using shorthand:

```sql
SELECT 15.75::INTEGER;
```

✅ The decimal part is removed (not rounded).

### **Example 2: Convert an Integer to a Numeric Type**

```sql
SELECT CAST(100 AS NUMERIC(5,2));  -- Output: 100.00
```

or:

```sql
SELECT 100::NUMERIC(5,2);
```

✅ Adds **two decimal places**.

---

## **3. String to Numeric Conversion**

📌 Converting a **string to a number** is useful when importing data from **CSV or JSON**.

### **Example 3: Convert a String to an Integer**

```sql
SELECT CAST('500' AS INTEGER);  -- Output: 500
```

or:

```sql
SELECT '500'::INTEGER;
```

✅ Only works if the string **contains a valid number**.

### **Example 4: Convert Elevation (Stored as Text) to Numeric**

```sql
SELECT region, CAST(elevation AS NUMERIC)
FROM land_survey;
```

✅ Converts **elevation stored as text** into a numeric type.

---

## **4. Date and Time Conversion**

📌 `CAST` is useful when working with **dates and timestamps** stored as text.

### **Example 5: Convert a String to a Date**

```sql
SELECT CAST('2024-03-07' AS DATE);  -- Output: 2024-03-07
```

or:

```sql
SELECT '2024-03-07'::DATE;
```

### **Example 6: Convert a String to a Timestamp**

```sql
SELECT CAST('2024-03-07 14:30:00' AS TIMESTAMP);
```

✅ Converts a text-based timestamp into a proper **TIMESTAMP** type.

---

## **5. Boolean Conversion**

### **Example 7: Convert a String to Boolean**

```sql
SELECT CAST('true' AS BOOLEAN);  -- Output: true
```

or:

```sql
SELECT 'false'::BOOLEAN;
```

📌 PostgreSQL accepts **'true', 'false', '1', '0', 'yes', 'no'** as valid boolean values.

---

## **6. Using CAST in Table Queries**

📌 Suppose we have a **land survey** table where `elevation` is stored as text:

```sql
CREATE TABLE land_survey (
    region TEXT,
    elevation TEXT,  -- Stored incorrectly as text
    survey_date DATE
);
```

To convert **elevation** to a numeric type in a query:

```sql
SELECT region, CAST(elevation AS NUMERIC) AS elevation_numeric, survey_date
FROM land_survey;
```

✅ Allows mathematical operations on `elevation`.

---
