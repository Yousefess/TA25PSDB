## 🔹 1. `ALL` Operator

The `ALL` operator returns `TRUE` if **all values in a subquery** satisfy the condition.

## ✅ Example: Find surveys where elevation is higher than **all elevations** in a specific region

```sql
SELECT region, elevation
FROM land_survey
WHERE elevation > ALL (
    SELECT elevation
    FROM land_survey
    WHERE region = 'Central Plains'
);
```

📌 **Explanation:** This returns only rows where the elevation is higher than **every elevation** in 'Central Plains'.

---

## 🔹 2. `ANY` Operator

The `ANY` operator returns `TRUE` if **at least one** value in the subquery satisfies the condition.

### ✅ Example: Find surveys with elevation higher than **any** elevation recorded in 'Central Plains'

```sql
SELECT region, elevation
FROM land_survey
WHERE elevation > ANY (
    SELECT elevation
    FROM land_survey
    WHERE region = 'Central Plains'
);
```

📌 **Explanation:** This returns surveys with elevation higher than **at least one** in 'Central Plains'.

---

## 🔹 3. `UNION` Operator

Combines the result sets of **two queries** and removes duplicates.

### ✅ Example: List all distinct regions from `land_survey` and `surveyor` tables

```sql
SELECT region FROM land_survey
UNION
SELECT region FROM surveyor;
```

📌 **Explanation:** The `UNION` merges both sets of regions and removes duplicates.

---

## 🔹 4. `UNION ALL`

Same as `UNION`, but **keeps duplicates**.

```sql
SELECT region FROM land_survey
UNION ALL
SELECT region FROM surveyor;
```

📌 **Use case:** When you want to count frequency or preserve data repetition.

---

## 🔹 5. `INTERSECT` Operator

Returns **common rows** between two queries.

### ✅ Example: Find regions that exist in both tables

```sql
SELECT region FROM land_survey
INTERSECT
SELECT region FROM surveyor;
```

📌 **Explanation:** Shows regions that appear in both `land_survey` and `surveyor`.

---

## 🔹 6. `EXCEPT` Operator

Returns rows from the **first query** that are **not in the second**.

### ✅ Example: Find regions in `land_survey` not covered by any surveyor

```sql
SELECT region FROM land_survey
EXCEPT
SELECT region FROM surveyor;
```

📌 **Explanation:** Highlights regions that were surveyed but no surveyor is assigned.

---

## 🎯 Summary Table

| Operator   | Description                                              |
|------------|----------------------------------------------------------|
| `ALL`      | TRUE if all comparisons in subquery are TRUE             |
| `ANY`      | TRUE if at least one comparison in subquery is TRUE      |
| `UNION`    | Combines result sets and removes duplicates              |
| `UNION ALL`| Combines result sets and **keeps duplicates**            |
| `INTERSECT`| Returns common rows between two queries                  |
| `EXCEPT`   | Returns rows in first query not present in second query  |

---
