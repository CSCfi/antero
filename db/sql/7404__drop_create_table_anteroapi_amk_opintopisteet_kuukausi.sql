USE [AnteroAPI]
GO

/****** Object:  Table [api].[amk_opintopisteet_kuukausi]    Script Date: 22.2.2023 7:42:07 ******/
DROP TABLE [api].[amk_opintopisteet_kuukausi]
GO

/****** Object:  Table [api].[amk_opintopisteet_kuukausi]    Script Date: 22.2.2023 7:42:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[amk_opintopisteet_kuukausi](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[ammattikorkeakoulu] [varchar](100) NULL,
	[koodit_ammattikorkeakoulu] [varchar](5) NULL,
	[okm_ohjauksen_ala] [varchar](100) NULL,
	[koodit_okm_ohjauksen_ala] [int] NULL,
	[koulutustyyppi] [varchar](55) NULL,
	[op_perustutkinto_opiskelijat_lkm] [int] NULL,
	[op_avoin_amk_opetus_lkm] [int] NULL,
	[op_erikoistumiskoulutus_lkm] [int] NULL,
	[op_erilliset_opinto_oikeudet_lkm] [int] NULL,
	[op_korkeakoulujen_yhteistyo_lkm] [int] NULL,
	[op_maahanmuuttajien_valmentava_lkm] [int] NULL,
	[op_saapuvat_vaihto_opiskelijat_lkm] [int] NULL,
	[op_tki_opinnayte_lkm] [int] NULL,
	[op_tki_harjoittelu_lkm] [int] NULL,
	[op_tki_muu_lkm] [int] NULL,
	[op_ulkomainen_harjoittelu_lkm] [int] NULL,
	[op_ulkomailta_hyvaksiluetut_lkm] [int] NULL,
	[op_vieraskielinen_opetus_lkm] [int] NULL,
	[op_kv_suomi_vieraana_lkm] [int] NULL,
	[op_kv_ruotsi_vieraana_lkm] [int] NULL,
	[op_muun_kuin_korkeakoulun_yhteistyo_lkm] [int] NULL,
	[tietojen_ajankohta] [varchar](20) NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]