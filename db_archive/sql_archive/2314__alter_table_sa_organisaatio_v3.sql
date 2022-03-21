USE [ANTERO]
GO
ALTER TABLE [sa].[sa_organisaatio_v3] ALTER COLUMN [loadtime] [datetime] NULL;
ALTER TABLE [sa].[sa_organisaatio_v3] ALTER COLUMN [source] [nvarchar](200) NULL;
ALTER TABLE [sa].[sa_organisaatio_v3] ALTER COLUMN [username] [varchar](30)  NULL;
GO
