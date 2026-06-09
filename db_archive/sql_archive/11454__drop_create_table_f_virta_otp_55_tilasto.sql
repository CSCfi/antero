USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_55_tilasto]    Script Date: 9.12.2025 8.22.14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_55_tilasto]') AND type in (N'U'))
DROP TABLE [dw].[f_virta_otp_55_tilasto]
GO

/****** Object:  Table [dw].[f_virta_otp_55_tilasto]    Script Date: 9.12.2025 8.22.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_kieli_koulutus_id] [int] NULL,
	[d_alueluokitus_koulutuksen_kunta_id] [int] NULL,
	[d_virta_rahoituslahde_id] [int] NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_virta_otp_55_tilasto] ADD  CONSTRAINT [DF__f_virta_otp_55_tilasto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_virta_otp_55_tilasto] ADD  CONSTRAINT [DF__f_virta_otp_55_tilasto__username]  DEFAULT (suser_sname()) FOR [username]
GO


