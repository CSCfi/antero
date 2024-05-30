USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_virta_otp_ope_henkilotiedot_2023]    Script Date: 30.5.2024 10:32:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_otp_ope_henkilotiedot_2023]') AND type in (N'U'))
DROP TABLE [sa].[sa_virta_otp_ope_henkilotiedot_2023]
GO

/****** Object:  Table [sa].[sa_virta_otp_ope_henkilotiedot_2023]    Script Date: 30.5.2024 10:32:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_virta_otp_ope_henkilotiedot_2023](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[henkilo] [int] NULL,
	[kk] [nvarchar](8) NOT NULL,
	[opiskelijaavain] [nvarchar](100) NOT NULL,
	[oppijanumero] [nvarchar](200) NULL,
	[organisaatiokoodi] [varchar](10) NULL,
	[sukupuoli] [smallint] NULL,
	[syntymaaika] [varchar](10) NULL,
	[loadtime] [datetime2](4) NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NULL,
 CONSTRAINT [PK_sa_virta_otp_ope_henkilotiedot_2023] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_virta_otp_ope_henkilotiedot_2023] ADD  CONSTRAINT [DF_sa_virta_otp_ope_henkilotiedot_2023_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_virta_otp_ope_henkilotiedot_2023] ADD  CONSTRAINT [DF_sa_virta_otp_ope_henkilotiedot_2023_username]  DEFAULT (suser_name()) FOR [username]
GO

INSERT INTO [sa].[sa_virta_otp_ope_henkilotiedot_2023]
SELECT
	[henkilo]
    ,[kk]
    ,[opiskelijaavain]
    ,[oppijanumero]
    ,[organisaatiokoodi]
    ,[sukupuoli]
    ,[syntymaaika]
    ,[loadtime]
    ,[source]
    ,[username]
FROM [sa].[sa_virta_otp_ope_henkilotiedot]

GO 

USE [ANTERO]

