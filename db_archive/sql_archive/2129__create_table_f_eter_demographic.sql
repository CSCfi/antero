USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_eter_demographic')
BEGIN
	DROP TABLE [dw].[f_eter_demographic];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_eter_demographic')
BEGIN
CREATE TABLE [dw].[f_eter_demographic](

[id] [nvarchar](100) NOT NULL
,[Demographic_event_past-reference_year] [bigint] NULL
,[Affected_institutions_past] [nvarchar](100) NULL
,[Demographic_events_reference-following_year] [nvarchar](100) NULL
,[Affected_institutions_following_year] [nvarchar](100) NULL
,[Short_event_description] [nvarchar](300) NULL
,[username] [varchar](100) NULL
,[Source] [varchar](100) NULL
,[Loadtime] [datetime] NULL
 CONSTRAINT [PK__f_eter_demographic] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
USE [ANTERO]