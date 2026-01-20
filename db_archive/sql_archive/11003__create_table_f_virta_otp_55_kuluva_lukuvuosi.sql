USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_55_kuluva_lukuvuosi]    Script Date: 8.8.2025 12.17.48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_55_kuluva_lukuvuosi]') AND type in (N'U'))
DROP TABLE [dw].[f_virta_otp_55_kuluva_lukuvuosi]
GO

/****** Object:  Table [dw].[f_virta_otp_55_kuluva_lukuvuosi]    Script Date: 8.8.2025 12.17.48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_55_kuluva_lukuvuosi](
	[tilastovuosi] [int] NULL,
	[lukuvuosi] [nvarchar](61) NULL,
	[lo_aloituspvm] [varchar](8000) NULL,
	[oo_aloituspvm] [varchar](8000) NULL,
	[aika_aloittamisesta] [int] NULL,
	[henkilo_koodi] [varchar](400) NULL,
	[uusi_opiskelija] [int] NULL,
	[olo_syksy] [int] NULL,
	[olo_kevat] [int] NULL,
	[lasna] [int] NOT NULL,
	[suorittanut55] [int] NOT NULL,
	[opintopisteet_syksy] [int] NULL,
	[opintopisteet_kevat] [int] NULL,
	[opintopisteet_summa] [int] NULL,
	[suorittanut27] [smallint] NULL,
	[suorittanut55IlmanPankkia] [smallint] NULL,
	[suorittanut55PankinAvulla] [smallint] NULL,
	[ika] [int] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_opintopisteet_id] [bigint] NULL,
	[d_kytkin_aloittanut_kevaalla_id] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_virta_otp_55_kuluva_lukuvuosi] ADD  CONSTRAINT [DF__f_virta_otp_55_kuluva_lukuvuosi__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_virta_otp_55_kuluva_lukuvuosi] ADD  CONSTRAINT [DF__f_virta_otp_55_kuluva_lukuvuosi__username]  DEFAULT (suser_sname()) FOR [username]
GO


