# SQL-with-Zepto-Sample-Datasets

## 📌 Project Overview
This project focuses on analyzing an e-commerce inventory dataset from **Zepto**—one of India's fastest-growing quick-commerce startups. The main objective is to explore the product dataset, perform essential data quality checks, handle data cleaning workflows, analyze product availability and pricing, and generate actionable business insights using structural SQL queries.

The project systematically covers:
* Data exploration & schema understanding
* Data quality assurance (Null handling & duplicates)
* E-commerce data cleaning workflows
* Product and category profiling
* Markdown and discount analysis
* Stock & inventory health checking
* Categorized revenue estimation
* Price-per-unit (weight) value metrics

---

## 🛠️ Technologies Used
* **SQL** (Structured Query Language)
* **MySQL** / Relational Database Management System
* **Zepto Product Dataset** (Scraped multi-category inventory data)

---

## 📂 Database Structure
The project creates and updates a localized database named `zepto`. The main table utilized across all exploratory and business queries is `zepto_v2`.

### Table Columns & Schema

| Column | Data Type | Description |
| :--- | :--- | :--- |
| `category` | VARCHAR(120) | Broad product category grouping |
| `name` | VARCHAR(150) | Complete commercial name of the product |
| `mrp` | NUMERIC(8,2) | Maximum Retail Price (Base price before discount) |
| `discountPercent` | NUMERIC(8,2) | Percentage reduction applied to the product |
| `availableQuantity` | INTEGER | Active physical stock units currently on hand |
| `discountedSellingPrice` | INTEGER | Final selling price after discount deduction |
| `weightInGms` | NUMERIC(8,2) | Total product mass measured in grams |
| `outOfStock` | BOOLEAN | Flag indicator (`TRUE`/`FALSE`) for stockouts |
| `quantity` | INTEGER | Product unit grouping size configurations |

---

## 🎯 Project Objectives & Core Analytics
The pipeline executes the following 11 core data milestones:

1. **Dataset Exploration:** Initial structural deep-dives to profile data layout.
2. **Missing Value Audits:** Checking critical entity columns for structural `NULL` values.
3. **Category Identification:** Isolating unique product categories occupying the system.
4. **Stock Health Analysis:** Mapping availability metrics and running stockout analysis.
5. **Duplicate Auditing:** Identifying duplicate product names across identical stock units.
6. **Data Value Cleaning:** Rectifying invalid, negative, or broken pricing attributes.
7. **Discount Performance Profiling:** Sorting and optimizing categories by discount spread.
8. **Revenue Estimation Mapping:** Projecting maximum store revenue metrics aggregated by category.
9. **Low-Yield Product Identification:** Flagging expensive assets offering minimal discount values.
10. **Unit-Value Metrics:** Analyzing price-per-gram ratios to evaluate item cost efficiency.
11. **Tiered Quantity Classification:** Segmenting catalog inventory into low, mid, and high volume tiers.

---

## 📁 File Structure
```text
Zepto-SQL-Analysis/
├── Zepto.sql        # Comprehensive SQL script containing schema setup and analysis queries
├── zepto_v2.csv     # Raw/Scraped input product dataset 
└── README.md        # Documentation and project overview manual
```

---

## 📌 Conclusion
This portfolio project demonstrates how practical SQL operations transform raw, unorganized e-commerce inventory rows into strategic business indicators. Through analytical workflows (data exploration, conditional value cleaning, stock checking, discount optimization, and revenue calculations), it provides a clear template for evaluating instant-delivery quick-commerce metrics.

### Key SQL Concepts Demonstrated:
* **DQL Frameworks:** `SELECT`, `WHERE`, `ORDER BY`, `DISTINCT`
* **Aggregation & Grouping:** `GROUP BY`, `HAVING`, `COUNT()`, `SUM()`, `AVG()`
* **Conditional Logic Evaluators:** `CASE WHEN ... THEN ... ELSE` statements
* **Data Cleaning & Mutation:** Target structural mutations using safe `UPDATE` logic
