USE [ANTERO]
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'dbo.sharepoint_reports_tabular')
      AND type = 'U'
)
BEGIN
    CREATE TABLE [dbo].[sharepoint_reports_tabular](
        [report] NVARCHAR(1000) NOT NULL,
        [tabular] NVARCHAR(200) NOT NULL,
        [pending_refresh] INT NOT NULL CONSTRAINT DF_sharepoint_reports_tabular_pending_refresh DEFAULT (0),
        [last_refresh] DATETIME NULL,
        [status_of_last_fi_refresh] VARCHAR(50) NULL,
        [status_of_last_sv_refresh] VARCHAR(50) NULL,
        [status_of_last_en_refresh] VARCHAR(50) NULL,
        [number_of_consecutive_failures] INT NULL,
        [loadtime] DATETIME NOT NULL CONSTRAINT DF_sharepoint_reports_tabular_loadtime DEFAULT (GETDATE()),
        [username] VARCHAR(30) NOT NULL CONSTRAINT DF_sharepoint_reports_tabular_username DEFAULT (SUSER_SNAME())
    ) ON [PRIMARY]
END
GO
