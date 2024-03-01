USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit]    Script Date: 1.3.2024 14:19:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit]') AND type in (N'U'))
DROP TABLE [dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit]
GO

/****** Object:  Table [dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit]    Script Date: 1.3.2024 14:19:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit](
	[tilastovuosi] [varchar](4) NULL,
	[sukupuoli_koodi] [varchar](2) NULL,
	[sukupuoli_id] [int] NULL,
	[aidinkieli_versio1_koodi] [varchar](2) NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[ika_avain] [varchar](10) NULL,
	[ika_id] [int] NULL,
	[tyopaikan_sijaintimaakunta_avain] [varchar](6) NULL,
	[tyopaikan_sijaintimaakunta_id] [int] NULL,
	[tyopaikan_sijaintimaakunta_historia_id] [int] NULL,
	[mitenna_ammattiryhma2_koodi] [varchar](50) NULL,
	[oef_ammattiryhma2_koodi] [varchar](50) NULL,
	[mitenna_ammatti_id] [int] NULL,
	[oef_ammatti_id] [int] NULL,
	[paaasiallinen_toiminta_siirtyman_paassa_koodi] [varchar](2) NULL,
	[paaasiallinen_toiminta_siirtyman_paassa_id] [int] NULL,
	[tyopaikan_sijainti_v_tilastovuonna_avain] [varchar](2) NULL,
	[tyopaikan_sijainti_v_tilastovuonna_id] [int] NULL,
	[mitenna_ammattiryhma2_siirtyman_paassa_koodi] [varchar](50) NULL,
	[oef_ammattiryhma2_siirtyman_paassa_koodi] [varchar](50) NULL,
	[mitenna_ammatti_siirtyman_paassa_id] [int] NULL,
	[oef_ammatti_siirtyman_paassa_id] [int] NULL,
	[paaasiallinen_toimintar9_id] [int] NULL,
	[paaasiallinen_toimintar9_siirtyman_paassa_id] [int] NULL,
	[aidinkieli_versio5_id] [int] NULL,
	[toimiala_id] [int] NULL,
	[oef_toimiala_id] [int] NULL,
	[toimiala_siirtyman_paassa_id] [int] NULL,
	[koulutusaste_vanha_id] [int] NULL,
	[koulutusaste_vanha_siirtyman_paassa_id] [int] NULL,
	[koulutusaste_uusi_id] [int] NULL,
	[koulutusaste_uusi_siirtyman_paassa_id] [int] NULL,
	[opintoala_id] [int] NULL,
	[opintoala_siirtyman_paassa_id] [int] NULL,
	[koulutusala_taso2_id] [int] NULL,
	[koulutusala_taso2_siirtyman_paassa_id] [int] NULL,
	[koulutuslaji_id] [int] NULL,
	[koulutuslaji_siirtyman_paassa_id] [int] NULL,
	[opettajankelpoisuus_id] [int] NULL,
	[opettajankelpoisuus_siirtyman_paassa_id] [int] NULL,
	[tyopaikan_sijaintimaakunta_sama_kylla_ei_id] [int] NULL,
	[opintoala_erikoistumiskoulutus_siirtyman_paassa_id] [int] NULL,
	[koulutusala_taso1_erikoistumiskoulutus_amk_siirtyman_paassa_id] [int] NULL,
	[koulutusala_taso1_erikoistumiskoulutus_yo_siirtyman_paassa_id] [int] NULL,
	[lkm] [int] NULL,
	[suhteellinen_ajankohta_avain] [varchar](10) NOT NULL,
	[suhteellinen_ajankohta_id] [int] NULL,
	[perusjoukko_tyolliset_avain] [varchar](4) NULL,
	[perusjoukko_tyolliset_id] [int] NULL,
	[siirtyman_tarkastelusuunta_avain] [int] NOT NULL,
	[siirtyman_tarkastelusuunta_id] [int] NULL,
	[lahde] [varchar](50) NULL
) ON [PRIMARY]
GO

USE [ANTERO]