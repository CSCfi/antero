USE [ANTERO]
GO
/****** Object:  Table [dw].[f_virta_otp_lukuvuosimaksuvelvolliset]    Script Date: 13.11.2018 14:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_lukuvuosimaksuvelvolliset]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_virta_otp_lukuvuosimaksuvelvolliset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_ika_id] [int] NOT NULL,
	[d_maatjavaltiot_kansalaisuus_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NOT NULL,
	[d_organisaatioluokitus_jarjestaja_id] [int] NOT NULL,
	[lkm] [int] NOT NULL,
	[loadtime] [datetime2](7) NOT NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_virta_otp_lukuvuosimaksuvelvolliset__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_virta_otp_lukuvuosimaksuvelvolliset] ADD  CONSTRAINT [DF__f_virta_otp_lukuvuosimaksuvelvolliset__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_virta_otp_lukuvuosimaksuvelvolliset__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_virta_otp_lukuvuosimaksuvelvolliset] ADD  CONSTRAINT [DF__f_virta_otp_lukuvuosimaksuvelvolliset__username]  DEFAULT (suser_sname()) FOR [username]
END
