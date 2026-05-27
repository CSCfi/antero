USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_virta_otp_ope_tutkinnot_2025]    Script Date: 21.5.2026 14.02.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_otp_ope_patevyydet_2025]') AND type in (N'U'))

CREATE TABLE [sa].[sa_virta_otp_ope_patevyydet_2025](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[henkilo] [int] NULL,
	[kk] [nvarchar](8) NOT NULL,
	[laajuus] [int] NULL,
	[laji] [int] NULL,
	[opintosuoritusavain] [nvarchar](100) NOT NULL,
	[opiskelijaavain] [nvarchar](100) NOT NULL,
	[organisaatiokoodi] [varchar](10) NULL,
	[paivamaara] [varchar](10) NULL,
	[patevyyskoodi] [nvarchar](20) NOT NULL,
	[patevyysnimi] [nvarchar](200) NOT NULL,
	[vuosi] [int] NOT NULL,
	[loadtime] [datetime2](4) NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NULL
) ON [PRIMARY]