USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_R4_23_Tyollisten_ammattisiirtymat]    Script Date: 9.12.2019 20:19:43 ******/
DROP TABLE [dbo].[f_R4_23_Tyollisten_ammattisiirtymat]
GO

/****** Object:  Table [dbo].[f_R4_23_Tyollisten_ammattisiirtymat]    Script Date: 9.12.2019 20:19:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_R4_23_Tyollisten_ammattisiirtymat](
	[tilastovuosi] [varchar](4) NULL,
	[paaasiallinen_toiminta_r9] [varchar](2) NULL,
	[aidinkieli_versio5_koodi] [varchar](1) NULL,
	[ika_avain] [varchar](8) NULL,
	[toimiala2008_avain] [varchar](2) NULL,
	[mitenna_ammattiryhma2_koodi] [varchar](17) NULL,
	[koulutusaste2002_koodi] [varchar](2) NULL,
	[koulutusaste_taso2_avain] [varchar](9) NULL,
	[opintoala_avain] [varchar](9) NULL,
	[koulutusala_taso2_avain] [varchar](14) NULL,
	[koulutuslaji_koodi] [varchar](1) NULL,
	[opettajankelpoisuus_kytkin_koodi] [varchar](1) NULL,
	[tyopaikan_sijaintimaakunta_kytkin_koodi] [varchar](1) NULL,
	[paaasiallinen_toiminta_r9_siirtyman_paassa_koodi] [varchar](2) NULL,
	[toimiala2008_siirtyman_paassa_avain] [varchar](2) NULL,
	[mitenna_ammattiryhma2_siirtyman_paassa_koodi] [varchar](17) NULL,
	[koulutusaste2002_siirtyman_paassa_koodi] [varchar](2) NULL,
	[koulutusaste_taso2_siirtyman_paassa_avain] [varchar](9) NULL,
	[opintoala_siirtyman_paassa_avain] [varchar](9) NULL,
	[koulutusala_taso2_siirtyman_paassa_avain] [varchar](14) NULL,
	[koulutuslaji_siirtyman_paassa_koodi] [varchar](1) NULL,
	[opettajankelpoisuus_kytkin_siirtyman_paassa_koodi] [varchar](1) NULL,
	[opintoala_erikoistumiskoulutus_siirtyman_paassa] [varchar](9) NULL,
	[koulutusala_taso1_erikoistumiskoulutus_amk_siirtyman_paassa] [varchar](12) NULL,
	[koulutusala_taso1_erikoistumiskoulutus_yo_siirtyman_paassa] [varchar](12) NULL,
	[suhteellinen_ajankohta_avain] [varchar](6) NOT NULL,
	[perusjoukko_tyolliset_avain] [varchar](4) NULL,
	[siirtyman_tarkastelusuunta_avain] [int] NOT NULL,
	[lkm] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]