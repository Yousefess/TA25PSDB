# **Delete Data in PostgreSQL**

When working with databases, you often need to remove records. PostgreSQL provides the **DELETE** statement to remove specific rows from a table.

---

## **1️⃣ DELETE Statement**

The **DELETE** statement is used to remove rows from a table based on a condition.

### **Syntax:**

```sql
DELETE FROM table_name WHERE condition;
```

### **Example:**

Assume we have a `land_survey` table with survey records. If we want to delete all records from **before 2022**, we can use:

```sql
DELETE FROM land_survey WHERE survey_date < '2022-01-01';
```

### **Delete a Specific Record:**

```sql
DELETE FROM land_survey WHERE id = 10;
```

### **Delete All Records:**

```sql
DELETE FROM land_survey;
```

This removes all records but keeps the table structure.

---

## **2️⃣ DELETE vs TRUNCATE**

Both **DELETE** and **TRUNCATE** remove data, but they work differently:

| Command  | Effect |
|----------|--------|
| **DELETE** | Removes specific rows based on a condition. Slower but allows rollback. |
| **TRUNCATE** | Removes all rows instantly. Cannot be rolled back (unless inside a transaction). |

### **Using TRUNCATE:**

```sql
TRUNCATE TABLE land_survey;
```

This is **faster** than DELETE when clearing all records.

---

## **3️⃣ DELETE with RETURNING**

To see which rows were deleted, use **RETURNING**:

```sql
DELETE FROM land_survey WHERE elevation > 4000 RETURNING *;
```

This deletes records where elevation is above 4000 meters and returns the deleted rows.

---

## **4️⃣ DELETE with JOIN (Deleting Related Records)**

If we have a **survey_results** table linked to `land_survey` by `survey_id`, we can delete related records using a JOIN:

```sql
DELETE FROM survey_results
USING land_survey
WHERE survey_results.survey_id = land_survey.id
AND land_survey.survey_date < '2021-01-01';
```

This deletes results linked to old surveys.

---
