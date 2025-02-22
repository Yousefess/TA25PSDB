# **📌 Dropping Tables and Databases in PostgreSQL**

In PostgreSQL, you can delete tables and databases using the `DROP TABLE` and `DROP DATABASE` commands. This lesson covers:

✅ **Dropping a Table (`DROP TABLE`)**
✅ **Dropping a Table Only If It Exists (`DROP TABLE IF EXISTS`)**
✅ **Dropping a Database (`DROP DATABASE`)**
✅ **Dropping a Database Only If It Exists (`DROP DATABASE IF EXISTS`)**

---

## **1️⃣ `DROP TABLE` – Delete a Table Permanently**

The `DROP TABLE` command removes a table **permanently**, including all its data and structure.

### **📌 Example: Dropping a Land Survey Table**

```sql
DROP TABLE land_survey;
```

🔹 **What happens?**

- The `land_survey` table is **completely deleted** from the database.
- All **data in the table is lost permanently**.
- If the table **doesn’t exist**, PostgreSQL **throws an error**.

📌 **To avoid errors, use `IF EXISTS`:**

```sql
DROP TABLE IF EXISTS land_survey;
```

✅ **This prevents errors** if the table doesn’t exist.

---

## **2️⃣ `DROP TABLE` with `CASCADE`**

If a table has **foreign key dependencies**, PostgreSQL **won’t allow** deletion unless you use `CASCADE`.

### **📌 Example: Dropping a Table with Dependencies**

```sql
DROP TABLE land_registry CASCADE;
```

🔹 **What happens?**

- The `land_registry` table is deleted.
- Any **dependent tables or foreign key relationships** are also removed.

---

## **3️⃣ `DROP DATABASE` – Delete a Database Permanently**

The `DROP DATABASE` command **removes a database completely**.

### **📌 Example: Dropping a GIS Database**

```sql
DROP DATABASE gis_data;
```

🔹 **What happens?**

- The `gis_data` database is **completely removed**, along with all its tables and data.
- If the database **doesn’t exist**, PostgreSQL **throws an error**.

📌 **To avoid errors, use `IF EXISTS`:**

```sql
DROP DATABASE IF EXISTS gis_data;
```

✅ **This prevents errors** if the database doesn’t exist.

---

## **4️⃣ Important Considerations**

🔹 **You can’t drop a database you’re currently connected to!**
📌 **Switch to another database first:**

```sql
\c postgres
DROP DATABASE my_database;
```

✅ Now the `my_database` can be dropped.

---

# **💡 Summary Table**

| Command | Purpose | Example |
|------------|---------|---------|
| `DROP TABLE table_name` | Deletes a table | `DROP TABLE land_survey;` |
| `DROP TABLE IF EXISTS table_name` | Avoids errors if table doesn’t exist | `DROP TABLE IF EXISTS land_survey;` |
| `DROP TABLE table_name CASCADE` | Drops a table and all dependencies | `DROP TABLE land_registry CASCADE;` |
| `DROP DATABASE db_name` | Deletes a database | `DROP DATABASE gis_data;` |
| `DROP DATABASE IF EXISTS db_name` | Avoids errors if database doesn’t exist | `DROP DATABASE IF EXISTS gis_data;` |

---

# **💡 Exercises**

✅ **Task 1:** Create a database called `survey_db`.

✅ **Task 2:** Create a table `survey_points` inside `survey_db` with columns: `point_id (SERIAL PRIMARY KEY)`, `latitude (NUMERIC)`, `longitude (NUMERIC)`.

✅ **Task 3:** Drop the `survey_points` table using `IF EXISTS`.

✅ **Task 4:** Drop the `survey_db` database (make sure to switch to another database first).

---
