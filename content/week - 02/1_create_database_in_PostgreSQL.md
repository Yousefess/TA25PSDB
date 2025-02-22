# **📌 Creating a Database in PostgreSQL**

## **🧐 What is a Database?**

A **database** is a structured collection of data. In **surveying and GIS applications**, databases store:
🔹 **Land parcel records** (ownership, area, location)
🔹 **Surveying measurements** (coordinates, elevation)
🔹 **Infrastructure data** (roads, utilities, zoning)

---

## **1️⃣ Creating a Database Using SQL (`psql` CLI Method)**

### **📌 Basic Syntax:**

```sql
CREATE DATABASE <database_name>;
```

📌 **Example:**
Let’s create a **surveying database** to store land parcel information:

```sql
CREATE DATABASE land_survey;
```

✅ **Now, PostgreSQL has an empty database ready to store GIS-related data.**

---

### **🎯 Example: City Infrastructure Database**

Let’s say we are working on a **city’s infrastructure data**, storing **surveyed roads and property records**:

```sql
CREATE DATABASE city_infrastructure
WITH OWNER city_admin
ENCODING 'UTF8'
LC_COLLATE 'en_US.UTF-8'
LC_CTYPE 'en_US.UTF-8';
```

📌 **Explanation:**

- **Owner:** `city_admin` (responsible for database access)
- **Encoding:** `UTF8` (supports all characters)
- **Collation & Ctype:** Controls how text data is stored and sorted

---

## **2️⃣ Creating a Database Using pgAdmin (GUI Method)**

📌 **Steps to Create a Database in pgAdmin**:

- Open **pgAdmin** and connect to your PostgreSQL server.
- In the left panel, **right-click on `Databases` → Select `Create` → `Database...`**
- Enter the **Database Name** (e.g., `survey_project`).
- Set an **Owner** (e.g., `survey_manager`).
- Click **Save** to create the database.

---

## **3️⃣ Listing, Selecting & Deleting Databases**

### **🔍 Show All Databases**

To list all databases in PostgreSQL:

```sql
\l
```

OR

```sql
SELECT datname FROM pg_database;
```

### **🔄 Switching to a Database**

To use a specific database, run:

```sql
\c city_infrastructure;
```

✅ Now, all queries will run within **`city_infrastructure`**.

---

### **🗑️ Deleting a Database (`DROP DATABASE`)**

To **permanently delete** a database:

```sql
DROP DATABASE land_survey;
```

⚠️ **Warning:** This **cannot be undone!**

---

## **📌 Exercises**

### **💡 Practical Task:**

**Scenario:** You are working on a **surveying project** to map different land use zones.

1️⃣ Create a database called **"urban_survey"**

2️⃣ Assign it to an owner called **"gis_specialist"**

3️⃣ Verify the database exists using `\l`

4️⃣ Switch to the database using `\c urban_survey`

5️⃣ Drop the database **"urban_survey"** (⚠️ be careful!)

---
