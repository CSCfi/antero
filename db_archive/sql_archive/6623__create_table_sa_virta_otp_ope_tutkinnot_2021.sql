USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_virta_otp_ope_tutkinnot_2021]    Script Date: 8.11.2022 12:34:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_virta_otp_ope_tutkinnot_2021](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[henkilo] [int] NULL,
	[kk] [nvarchar](8) NOT NULL,
	[koulutuskoodi] [varchar](6) NULL,
	[opintosuoritusavain] [nvarchar](100) NOT NULL,
	[opiskelijaavain] [nvarchar](100) NULL,
	[organisaatiokoodi] [varchar](10) NULL,
	[suorituspaivamaara] [varchar](10) NULL,
	[vuosi] [int] NOT NULL,
	[loadtime] [datetime2](4) NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NULL,
 CONSTRAINT [PK_sa_virta_otp_ope_tutkinnot_2021] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_virta_otp_ope_tutkinnot_2021] ADD  CONSTRAINT [DF_sa_virta_otp_ope_tutkinnot_2021_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_virta_otp_ope_tutkinnot_2021] ADD  CONSTRAINT [DF_sa_virta_otp_ope_tutkinnot_2021_username]  DEFAULT (suser_name()) FOR [username]
GO

USE [ANTERO]