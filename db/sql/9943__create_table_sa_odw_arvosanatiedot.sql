USE KOSKI_SA
GO

SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_odw_arvosanatiedot]' )
    AND type in (N'U'))
  DROP TABLE [sa].[sa_odw_arvosanatiedot];


CREATE TABLE sa.sa_odw_arvosanatiedot
(
  	[id] [int] IDENTITY(1,1) NOT NULL,
  HenkiloOid VARCHAR(100) NULL
  , Valmistumispaivamaara DATETIME2 NULL
  , Aine VARCHAR(100) NULL
  , Arvosana VARCHAR(20)
  , Yksilollistaminen VARCHAR(15)
  , luokkataso VARCHAR(15)
  , pohjakoulutusVARCHAR(50)
  ,[loadtime] [datetime] NOT NULL
	,[source] [varchar](100) NOT NULL
	,[username] [varchar](30) NOT NULL
  ,CONSTRAINT [PK_sa_odw_arvosanatiedot] PRIMARY KEY CLUSTERED
(
 [id] ASC
)) ON [PRIMARY];
GO

ALTER TABLE [sa].[sa_odw_arvosanatiedot] ADD  CONSTRAINT [DF__sa_odw_arvosanatiedot__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_odw_arvosanatiedot] ADD  CONSTRAINT [DF__sa_odw_arvosanatiedot__username]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO
