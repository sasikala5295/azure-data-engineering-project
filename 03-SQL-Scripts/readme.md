# SQL Scripts – Azure Data Engineering Project

## Overview

This folder contains SQL scripts developed for the Azure Data Engineering project. These scripts support source data extraction, metadata management, incremental loading, data validation, pipeline execution logging, and analytical reporting.

## Project Architecture

SQL Server → Azure Data Factory → ADLS Gen2 → Azure Databricks → Azure Synapse Analytics

## Folder Structure

```text
sql-scripts/
│
├── README.md
│
├── 01_create_source_tables.sql
├── 02_create_control_table.sql
├── 03_create_pipeline_log.sql
├── 04_create_table_log.sql
├── 05_start_pipeline_log.sql
├── 06_start_table_log.sql
├── 07_update_watermark.sql
├── 08_data_quality_checks.sql
├── 09_incremental_load_query.sql
└── 10_synapse_analytics_queries.sql
```

## 1. Source Table Creation

**File:** `01_create_source_tables.sql`

Creates sample source tables such as:

- Customers
- Orders
- Products

These tables represent the operational data sources used for ingestion.

## 2. Control Table

**File:** `02_create_control_table.sql`

Maintains metadata required for metadata-driven pipeline execution.

Important columns:

| Column | Description |
|---|---|
| TableID | Unique table identifier |
| SourceSchema | Source schema name |
| SourceTable | Source table name |
| WatermarkColumn | Column used for incremental loading |
| LastWatermarkValue | Last successfully processed value |
| LoadType | Full or Incremental |
| IsActive | Controls pipeline execution |

## 3. Pipeline Execution Logging

**File:** `03_create_pipeline_log.sql`

Creates a pipeline log table to track:

- Pipeline name
- Pipeline run ID
- Execution start time
- Execution end time
- Run requested by
- Pipeline status
- Error message

## 4. Table-Level Logging

**File:** `04_create_table_log.sql`

Maintains execution details for individual source tables.

Tracks:

- Source table name
- Load type
- Start and end time
- Records processed
- Execution status
- Error details

## 5. Stored Procedures

**Files:**

- `05_start_pipeline_log.sql`
- `06_start_table_log.sql`
- `07_update_watermark.sql`

These stored procedures support:

- Starting pipeline execution logs.
- Recording individual table execution.
- Updating watermark values after successful processing.

## 6. Data Quality Validation

**File:** `08_data_quality_checks.sql`

Contains SQL queries for:

- Duplicate record detection.
- Null value validation.
- Source and target row-count comparison.
- Invalid business key identification.
- Data consistency checks.

Example:

```sql
SELECT
    OrderID,
    COUNT(*) AS DuplicateCount
FROM dbo.Orders
GROUP BY OrderID
HAVING COUNT(*) > 1;
```

## 7. Incremental Load Query

**File:** `09_incremental_load_query.sql`

Demonstrates watermark-based incremental extraction.

Example:

```sql
SELECT *
FROM dbo.Orders
WHERE ModifiedDate > @LastWatermarkValue;
```

The watermark is maintained in the control table and updated after successful processing.

## 8. Synapse Analytics Queries

**File:** `10_synapse_analytics_queries.sql`

Contains analytical SQL queries for accessing curated data in ADLS Gen2 using Synapse Serverless SQL Pool.

Example business use cases:

- Daily sales analysis.
- Monthly revenue calculation.
- Top-performing customers.
- Product-wise sales.
- Region-wise revenue.

Example:

```sql
SELECT
    SalesDate,
    SUM(TotalSales) AS TotalRevenue,
    SUM(TotalOrders) AS TotalOrders
FROM dbo.vw_SalesSummary
GROUP BY SalesDate
ORDER BY SalesDate;
```

## Execution Order

1. Create source tables.
2. Create control and logging tables.
3. Create stored procedures.
4. Configure ADF linked services and datasets.
5. Execute ingestion pipelines.
6. Run data quality validation queries.
7. Execute Synapse analytical queries.

## Technologies Used

- Microsoft SQL Server
- Azure Data Factory
- Azure Data Lake Storage Gen2
- Azure Databricks
- Azure Synapse Analytics
- T-SQL
- Git and GitHub

## Key Learning Outcomes

- Metadata-driven ETL development.
- Watermark-based incremental loading.
- SQL stored procedure development.
- Pipeline execution monitoring.
- Data quality validation.
- SQL-based analytical reporting.
- End-to-end Azure data engineering implementation.

## Author

Azure Data Engineering Portfolio Project

**Focus Areas:** SQL | Azure Data Factory | ADLS Gen2 | PySpark | Databricks | Synapse Analytics
