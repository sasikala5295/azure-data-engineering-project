# Azure Data Factory – ADLS Gen2 Architecture

## 1. Project Overview

This project demonstrates an end-to-end data ingestion solution using Azure Data Factory (ADF) to extract data from on-premises SQL Server and load it into Azure Data Lake Storage Gen2 (ADLS Gen2).

The solution uses metadata-driven pipeline orchestration, incremental loading, watermark management, stored procedures, and ETL execution logging.

## 2. Architecture Diagram

![Azure Data Factory to ADLS Gen2 Architecture](Architecture_Diagram.png)

## 3. Architecture Components

| Component | Purpose |
|---|---|
| On-Premises SQL Server | Source database containing business tables |
| Self-Hosted Integration Runtime (SHIR) | Establishes connectivity between on-premises SQL Server and Azure Data Factory |
| Azure Data Factory | Orchestrates and manages data ingestion pipelines |
| Master Pipeline | Initiates execution and reads active tables from the control table |
| Child Pipeline | Executes table-level ingestion using reusable activities |
| Azure SQL Database | Stores ETL control metadata and execution logs |
| Control Table | Maintains source table details, load type and watermark information |
| Stored Procedures | Manage pipeline-level and table-level execution logs |
| ADLS Gen2 | Stores ingested data in the Raw/Bronze layer |
| GitHub | Maintains project code and version control |

## 4. Data Processing Workflow

1. Master pipeline starts the ETL execution.
2. Stored procedure creates a pipeline-level execution log.
3. Lookup activity retrieves active tables from the ETL control table.
4. ForEach activity iterates through the configured source tables.
5. Child pipeline receives table details and watermark parameters.
6. Copy Activity extracts data from SQL Server using SHIR.
7. Data is loaded into the ADLS Gen2 Raw container.
8. Table-level execution status is recorded in SQL logging tables.
9. Watermark is updated after successful processing.

## 5. Key Features

- Metadata-driven pipeline execution.
- Reusable master and child pipelines.
- Full and incremental data loading.
- Watermark-based data extraction.
- Parameterized datasets and pipelines.
- Pipeline-level and table-level logging.
- Source-to-target validation.
- Error handling and monitoring.
- GitHub integration and version control.

## 6. Technologies Used

Azure Data Factory | ADLS Gen2 | Azure SQL Database | SQL Server | SHIR | SQL | GitHub

## 7. Repository Navigation
