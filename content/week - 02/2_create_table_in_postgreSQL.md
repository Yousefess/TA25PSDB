# **📌 Creating Tables in PostgreSQL**

## **🧐 What is a Table in PostgreSQL?**

A **table** is a structured way of storing data inside a database. It consists of **columns** (fields) and **rows** (records).

💡 **In GIS & Surveying, tables store:**
✔️ **Surveyed land parcels** (boundaries, ownership)
✔️ **Topographic features** (elevation, coordinates)
✔️ **Infrastructure data** (roads, buildings, utilities)

---

## **1️⃣ Creating a Table Using `CREATE TABLE` Statement**

### **📌 Basic Syntax**

```sql
CREATE TABLE table_name (
    column_name1 DATA_TYPE CONSTRAINT,
    column_name2 DATA_TYPE CONSTRAINT,
    ...
);
```

📌 **Example: Land Parcels Table**

```sql
CREATE TABLE land_parcels (
    parcel_id       SERIAL PRIMARY KEY,
    owner_name      VARCHAR(100) NOT NULL,
    area            FLOAT CHECK (area > 0),
    land_use        VARCHAR(50) DEFAULT 'Residential',
    registered_on   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### **🔍 Explanation**

- **`parcel_id SERIAL PRIMARY KEY`** → Unique ID for each land parcel
- **`owner_name VARCHAR(100) NOT NULL`** → Name of the landowner (required)
- **`area FLOAT CHECK (area > 0)`** → Ensures area values are always positive
- **`land_use VARCHAR(50) DEFAULT 'Residential'`** → Default land use category
- **`registered_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP`** → Auto-fills the registration time

---

## **2️⃣ Creating a Table Using `CREATE TABLE AS` Statement**

This method is used to create a new table based on an existing one.

### **📌 Basic Syntax**

```sql
CREATE TABLE new_table AS
SELECT column1, column2, ...
FROM existing_table
WHERE condition;
```

📌 **Example: Extracting Residential Land Parcels**

```sql
CREATE TABLE residential_parcels AS
SELECT parcel_id, owner_name, area
FROM land_parcels
WHERE land_use = 'Residential';
```

✅ **Use Case:** Quickly extract a subset of land records for analysis.

---

## **3️⃣ Creating a Temporary Table (`TEMP` or `TEMPORARY`)**

A **temporary table** only exists during a database session and disappears after the session ends.

### **📌 Basic Syntax**

```sql
CREATE TEMP TABLE table_name (
    column1 DATA_TYPE,
    column2 DATA_TYPE
);
```

📌 **Example: Storing Temporary Survey Data**

```sql
CREATE TEMP TABLE temp_survey_points (
    point_id SERIAL PRIMARY KEY,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    elevation FLOAT
);
```

✅ **Use Case:** Temporary tables are great for storing **GPS survey points** before final data cleaning.

---

## **📌 Exercises**

### **💡 Practical Task:**

1️⃣ **Create a table `survey_stations`** with:

- `station_id` (Primary Key, auto-increment)
- `station_name` (Required)
- `latitude`, `longitude` (Required, check that values are within valid ranges)
- `elevation` (Optional)
- `survey_date` (Default to the current timestamp)

2️⃣ **Extract a new table `high_altitude_stations`** for stations **above 1000m elevation**

3️⃣ **Create a temporary table `temp_readings`** to store **sensor data** for a single session

---

## **📌 Summary**

✅ **`CREATE TABLE`** → Define tables with constraints
✅ **`CREATE TABLE AS`** → Copy data from another table
✅ **`CREATE TEMP TABLE`** → Store session-based temporary data

---
