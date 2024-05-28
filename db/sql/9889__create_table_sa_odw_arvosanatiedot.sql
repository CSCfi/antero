USE KOSKI_SA
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_odw_arvosanatiedot]' )
    AND type in (N'U'))
  DROP TABLE [sa].[sa_odw_arvosanatiedot]
  GO

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
  ,CONSTRAINT [PK_d_perhe] PRIMARY KEY CLUSTERED
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [sa].[sa_odw_arvosanatiedot] ADD  CONSTRAINT [DF__sa_odw_arvosanatiedot__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_odw_arvosanatiedot] ADD  CONSTRAINT [DF__sa_odw_arvosanatiedot__username]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO
