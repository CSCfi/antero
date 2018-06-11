USE [ANTERO]
GO
/****** Object:  Table [dw].[f_virta_otp_55_tilasto]    Script Date: 11.6.2018 15:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_55_tilasto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_virta_otp_55_tilasto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vuosi] [int] NOT NULL,
	[henkilokoodi] [varchar](100) NOT NULL,
	[lasna_aloituspvm] [date] NULL,
	[opoikeus_aloituspvm] [date] NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_ika_id] [int] NOT NULL,
	[d_organisaatio_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[lasna_kevat] [int] NULL,
	[lasna_syksy] [int] NULL,
	[lasna_syksy_edellinen] [int] NULL,
	[uusi_opisk] [int] NULL,
	[uusi_opisk_kevat] [int] NULL,
	[opintopisteet_kevat] [int] NULL,
	[opintopisteet_syksy] [int] NULL,
	[suorittanut55] [int] NOT NULL,
	[suorittanut55ilmanPankkia] [int] NULL,
	[suorittanut55pankinAvulla] [int] NULL,
	[suorittanut27] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK__f_virta_otp_55_tilasto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_virta_otp_55_tilasto__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_virta_otp_55_tilasto] ADD  CONSTRAINT [DF__f_virta_otp_55_tilasto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_virta_otp_55_tilasto__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_virta_otp_55_tilasto] ADD  CONSTRAINT [DF__f_virta_otp_55_tilasto__username]  DEFAULT (suser_sname()) FOR [username]
END

