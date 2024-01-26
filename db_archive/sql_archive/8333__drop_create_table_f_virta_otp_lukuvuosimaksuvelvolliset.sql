USE [ANTERO]
GO

ALTER TABLE [dw].[f_virta_otp_lukuvuosimaksuvelvolliset] DROP CONSTRAINT [DF__f_virta_otp_lukuvuosimaksuvelvolliset__username]
GO

ALTER TABLE [dw].[f_virta_otp_lukuvuosimaksuvelvolliset] DROP CONSTRAINT [DF__f_virta_otp_lukuvuosimaksuvelvolliset__loadtime]
GO

/****** Object:  Table [dw].[f_virta_otp_lukuvuosimaksuvelvolliset]    Script Date: 27.11.2023 14:17:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_lukuvuosimaksuvelvolliset]') AND type in (N'U'))
DROP TABLE [dw].[f_virta_otp_lukuvuosimaksuvelvolliset]
GO

/****** Object:  Table [dw].[f_virta_otp_lukuvuosimaksuvelvolliset]    Script Date: 27.11.2023 14:17:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_lukuvuosimaksuvelvolliset](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[aloitusvuosi] [int] NULL,
	[tilastovuosi] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_ika_id] [int] NOT NULL,
	[d_maatjavaltiot_kansalaisuus_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NOT NULL,
	[d_organisaatioluokitus_jarjestaja_id] [int] NOT NULL,
	[lkm] [int] NULL,
	[tutkinnot] [int] NULL,
	[loadtime] [datetime2](4) NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NULL,
 CONSTRAINT [PK__f_virta_otp_lukuvuosimaksuvelvolliset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_virta_otp_lukuvuosimaksuvelvolliset] ADD  CONSTRAINT [DF__f_virta_otp_lukuvuosimaksuvelvolliset__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_virta_otp_lukuvuosimaksuvelvolliset] ADD  CONSTRAINT [DF__f_virta_otp_lukuvuosimaksuvelvolliset__username]  DEFAULT (suser_name()) FOR [username]
GO

USE [ANTERO]