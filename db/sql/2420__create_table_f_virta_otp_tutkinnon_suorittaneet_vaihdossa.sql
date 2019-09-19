USE [ANTERO]
GO
/****** Object:  Table [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa]    Script Date: 19.9.2019 10:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_ika_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_maatjavaltiot2_kohdemaa_id] [int] NOT NULL,
	[d_liikkuvuudentyyppi_id] [int] NOT NULL,
	[d_liikkuvuudenkesto_id] [int] NOT NULL,
	[d_liikkuvuusohjelma_id] [int] NOT NULL,
	[d_organisaatioluokitus_id] [int] NOT NULL,
	[vaihtovuosi] [int] NULL,
	[opiskelijaavain] [nvarchar](50) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK__f_virta_otp_tutkinnon_suorittaneet_vaihdossa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_virta_otp_tutkinnon_suorittaneet_vaihdossa__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa] ADD  CONSTRAINT [DF__f_virta_otp_tutkinnon_suorittaneet_vaihdossa__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_virta_otp_tutkinnon_suorittaneet_vaihdossa__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa] ADD  CONSTRAINT [DF__f_virta_otp_tutkinnon_suorittaneet_vaihdossa__username]  DEFAULT (suser_sname()) FOR [username]
END
