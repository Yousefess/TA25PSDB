# **📌 PostgreSQL Data Types**

## **1️⃣ Numeric Data Types**

PostgreSQL provides several numeric data types for handling **integers**, **decimals**, and **auto-incrementing** values.

### **🔹 INT (Integer)**

- Used for **whole numbers** (positive or negative).
- **Storage Size:** 4 bytes
- **Range:** -2,147,483,648 to 2,147,483,647
- Example: **Storing surveyor IDs or land parcel numbers.**

```sql
CREATE TABLE surveyors (
    id          INT PRIMARY KEY,
    name        VARCHAR(50),
    experience  INT CHECK (experience >= 0) -- years of experience
);
```

---

### **🔹 NUMERIC(P, S) (Exact Precision)**

- Used for **high-precision decimal numbers** (e.g., measurements, currency).
- **P (Precision):** Total number of digits.
- **S (Scale):** Digits after the decimal point.
- Example: **Storing exact latitude and longitude values of a survey point.**

```sql
CREATE TABLE land_parcels (
    parcel_id       SERIAL PRIMARY KEY,
    area            NUMERIC(10, 2), -- Up to 10 digits, 2 decimal places (e.g., 12345.67 acres)
    boundary_length NUMERIC(8, 3) -- More precision for measurement (e.g., 123.456 meters)
);
```

---

### **🔹 SERIAL (Auto-Incrementing Integer)**

- Automatically generates unique IDs.
- **Storage Size:** 4 bytes
- **Usage:** Best for **primary keys**.

```sql
CREATE TABLE project_sites (
    site_id             SERIAL PRIMARY KEY,
    project_name        VARCHAR(100),
    allocated_budget    NUMERIC(12, 2)
);
```

📌 **Tip:** SERIAL **implicitly creates a sequence** to auto-increment the values.

---

## **2️⃣ String Data Types**

Used for **storing text and character-based information**.

### **🔹 CHAR(N) (Fixed-Length)**

- Stores **fixed-length** strings (always N characters).
- **Example:** If `CHAR(5)` is defined, 'SURV' will be stored as 'SURV ' (with spaces).
- **Use Case:** Storing **country codes or short survey project codes**.

```sql
CREATE TABLE survey_regions (
    region_code CHAR(3) PRIMARY KEY, -- Example: "USA", "UK ", "CAN"
    name        VARCHAR(50)
);
```

---

### **🔹 VARCHAR(N) (Variable-Length)**

- Stores **variable-length** text (up to N characters).
- **More flexible than CHAR** because it doesn’t add extra spaces.
- Example: **Storing city names or location descriptions**.

```sql
CREATE TABLE geolocation_points (
    point_id        SERIAL PRIMARY KEY,
    location_name   VARCHAR(100), -- Example: "Downtown Survey Station"
    description     TEXT -- More detailed description
);
```

📌 **Tip:** Use **VARCHAR(N)** when you have a known max length and **TEXT** for unlimited text.

---

### **🔹 TEXT (Unlimited-Length)**

- Stores **unlimited** text data.
- **Use Case:** **Detailed land survey reports, notes, or project descriptions**.

```sql
CREATE TABLE project_reports (
    report_id   SERIAL PRIMARY KEY,
    title       VARCHAR(255),
    details     TEXT
);
```

---

## **3️⃣ Time Data Types**

Used to store **dates, times, and timestamps**.

### **🔹 DATE (Stores Only Date)**

- **Format:** `'YYYY-MM-DD'`
- **Use Case:** **Storing project start dates or land registration dates.**

```sql
CREATE TABLE land_ownership (
    owner_id        SERIAL PRIMARY KEY,
    owner_name      VARCHAR(100),
    purchase_date   DATE
);
```

---

### **🔹 TIME (Stores Only Time)**

- **Format:** `'HH:MI:SS'`
- **Use Case:** **Logging the exact time of a field survey.**

```sql
CREATE TABLE survey_logs (
    log_id          SERIAL PRIMARY KEY,
    surveyor_name   VARCHAR(50),
    start_time      TIME
);
```

---

### **🔹 TIMESTAMP (Stores Date & Time)**

- **Format:** `'YYYY-MM-DD HH:MI:SS'`
- **Use Case:** **Tracking changes to survey data over time.**

```sql
CREATE TABLE land_modifications (
    modification_id     SERIAL PRIMARY KEY,
    modified_by         VARCHAR(50),
    modified_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

📌 **Tip:** Use `DEFAULT CURRENT_TIMESTAMP` to **auto-record the current date and time**.

---

## **4️⃣ Other Data Types**

### **🔹 BOOLEAN (True/False)**

- **Stores:** `TRUE`, `FALSE`, or `NULL`.
- **Use Case:** **Tracking whether a land parcel has been officially registered.**

```sql
CREATE TABLE parcels (
    parcel_id       SERIAL PRIMARY KEY,
    is_registered   BOOLEAN DEFAULT FALSE
);
```

---

### **🔹 ENUM (Custom Categorical Values)**

- Used for **predefined lists** (e.g., survey types).
- **Use Case:** Storing different **survey methods (GPS, Total Station, LiDAR).**

```sql
CREATE TYPE survey_method AS ENUM ('GPS', 'Total Station', 'LiDAR');

CREATE TABLE surveys (
    survey_id   SERIAL PRIMARY KEY,
    method      survey_method
);
```

---

### **🔹 FLOAT (Approximate Precision Decimal)**

- Stores **floating-point** numbers with less precision than `NUMERIC`.
- **Use Case:** **Storing GPS elevation data** where ultra-precision isn’t required.

```sql
CREATE TABLE gps_points (
    point_id    SERIAL PRIMARY KEY,
    latitude    FLOAT,
    longitude   FLOAT,
    elevation   FLOAT
);
```

📌 **Tip:** Use `NUMERIC` for **high precision** and `FLOAT` for **speed**.

---

# **📌 PRIMARY KEY & FOREIGN KEY**

## **🗝 PRIMARY KEY (Ensuring Unique Records)**

- **Uniquely identifies each row** in a table.
- **Automatically indexed** for fast lookups.
- **Cannot be NULL.**

### **Example: Primary Key in Surveying**

```sql
CREATE TABLE land_plots (
    plot_id     SERIAL PRIMARY KEY, -- Unique plot identifier
    owner_name  VARCHAR(100)
);
```

---

## **🔗 FOREIGN KEY (Referencing Other Tables)**

- **Creates relationships** between tables.
- Ensures **referential integrity** (i.e., a value in one table must exist in another).

### **Example: Foreign Key Linking Land Plots to Owners**

```sql
CREATE TABLE owners (
    owner_id    SERIAL PRIMARY KEY,
    name        VARCHAR(100)
);

CREATE TABLE land_plots (
    plot_id     SERIAL PRIMARY KEY,
    owner_id    INT REFERENCES owners(owner_id) ON DELETE CASCADE
);
```

📌 **Explanation:**

- `owner_id` in `land_plots` **must match an `owner_id` in `owners`**.
- `ON DELETE CASCADE` means **if an owner is deleted, their plots are also deleted**.

---

# **📌 Summary**

| Data Type | Description | Example Use Case |
| :-----------: | :------------: | :------------------: |
| **INT** | Whole numbers | Storing land parcel numbers |
| **NUMERIC(P, S)** | Exact decimal numbers | Storing survey area in acres |
| **SERIAL** | Auto-incrementing ID | Unique project IDs |
| **CHAR(N)** | Fixed-length text | Country codes (e.g., 'USA') |
| **VARCHAR(N)** | Variable-length text | Location names |
| **TEXT** | Unlimited-length text | Detailed survey notes |
| **DATE** | Only date | Land registration date |
| **TIME** | Only time | Survey start time |
| **TIMESTAMP** | Date and time | Data modification history |
| **BOOLEAN** | True/False values | Is the land registered? |
| **ENUM** | Custom categories | Survey method (GPS, LiDAR) |
| **FLOAT** | Approximate decimals | Storing elevation data |

---
