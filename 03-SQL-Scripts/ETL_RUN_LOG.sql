
CREATE TABLE dbo.ETL_Run_Log
(
    RunLogID BIGINT IDENTITY(1,1) PRIMARY KEY,
    PipelineName VARCHAR(200),
    PipelineRunID VARCHAR(100),
    TriggerName VARCHAR(200),
    TriggerType VARCHAR(50),
    TriggerTime DATETIME2 NULL,
    RunRequestedBy VARCHAR(256),
    StartTime DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    EndTime DATETIME2 NULL,
    RunStatus VARCHAR(30) NOT NULL,
    RowsCopied BIGINT NULL,
    ErrorMessage NVARCHAR(MAX) NULL
);

