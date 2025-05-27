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
  HenkiloOid VARCHAR(100)
  , Valmistumispaivamaara DATETIME2
  , Aine VARCHAR(100)
  , Arvosana VARCHAR(20)
  , Yksilollistaminen VARCHAR(15)
  , luokkataso VARCHAR(15)
  ,[loadtime] [datetime] NOT NULL
	,[source] [varchar](100) NOT NULL
	,[username] [varchar](30) NOT NULL
  ,CONSTRAINT [PK_sa_odw_arvosanatiedot] PRIMARY KEY CLUSTERED
(
 [id] ASC
)) ON [PRIMARY];
