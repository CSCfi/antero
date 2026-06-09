USE [ANTERO]
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.columns
    WHERE Name = N'deploy_flag'
      AND Object_ID = Object_ID(N'dbo.sharepoint_reports_tabular')
)
BEGIN
    ALTER TABLE ANTERO.dbo.sharepoint_reports_tabular
	ADD deploy_flag datetime NULL
END

GO
