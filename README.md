# End-to-End Azure Data Engineering Project – ADF to ADLS Gen2

## Project Overview

This project demonstrates an end-to-end data ingestion solution using Azure Data Factory (ADF) to extract data from on-premises SQL Server and load it into Azure Data Lake Storage Gen2.

The solution uses metadata-driven pipeline orchestration, incremental loading, parameterization, stored procedures, and execution logging.

## Architecture

On-Premises SQL Server → Self-Hosted Integration Runtime → Azure Data Factory → ADLS Gen2

Azure SQL Database is used for metadata management and ETL logging.

## Technologies Used

- Azure Data Factory
- Azure Data Lake Storage Gen2
- SQL Server
- Self-Hosted Integration Runtime
- GitHub
- Azure DevOps (if implemented)

## Key Features

1. Metadata-driven ingestion using a control table.
2. Master and child pipeline orchestration.
3. Parameterized and reusable pipelines.
4. Full and incremental data loading.
5. Watermark-based incremental extraction.
6. Stored procedures for execution logging.
7. Pipeline-level and table-level monitoring.
8. Source-to-target validation.
9. Error handling and troubleshooting.
10. Git integration and version control.

## Project Workflow

1. Read active source tables from the control table.
2. Start pipeline execution logging.
3. Execute child pipelines through ForEach.
4. Extract data from SQL Server using SHIR.
5. Load data into ADLS Gen2.
6. Validate source and destination data.
7. Update watermark after successful execution.
8. Record execution status in ETL log tables.

## Repository Structure

- 01-Architecture
- 02-ADF-Pipelines
- 03-SQL-Scripts
- 04-ADLS-Gen2
- 05-Incremental-Load
- 06-Monitoring
- 07-Deployment

## Learning Outcomes

Hands-on implementation of Azure data ingestion, metadata-driven orchestration, incremental loading, SQL-based logging, and Azure Data Factory pipeline development.
