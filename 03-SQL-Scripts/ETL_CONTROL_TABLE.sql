
CREATE TABLE dbo.ETL_Control_Table
(
    TableID INT IDENTITY(1,1) PRIMARY KEY,
    SourceSchema VARCHAR(100) NOT NULL,
    SourceTable VARCHAR(200) NOT NULL,
    TargetContainer VARCHAR(100) NOT NULL,
    TargetFolder VARCHAR(500) NOT NULL,
    LoadType VARCHAR(20) NOT NULL,
    WatermarkColumn VARCHAR(100) NULL,
    LastWatermarkValue VARCHAR(100) NULL,
    IsActive BIT NOT NULL DEFAULT 1
);
GO

INSERT INTO dbo.ETL_Control_Table
(
    SourceSchema, SourceTable,
    TargetContainer, TargetFolder,
    LoadType, WatermarkColumn, LastWatermarkValue
)
VALUES
('dbo', 'Customers', 'raw', 'Customers',
 'Incremental', 'ModifiedDate', '2026-10-24'),

('dbo', 'Orders', 'raw', 'Orders',
 'Incremental', 'ModifiedDate', '2026-10-24'),

('dbo', 'Products', 'raw', 'Products',
 'Full', NULL, NULL);
GO
