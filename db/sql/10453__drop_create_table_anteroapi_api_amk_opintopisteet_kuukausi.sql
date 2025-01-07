USE [AnteroAPI]
GO

/****** Object:  Table [dw].[api_amk_opintopisteet_kuukausi]    Script Date: 7.1.2025 15.02.09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[api_amk_opintopisteet_kuukausi]') AND type in (N'U'))
DROP TABLE [dw].[api_amk_opintopisteet_kuukausi]
GO

/****** Object:  Table [dw].[api_amk_opintopisteet_kuukausi]    Script Date: 7.1.2025 15.02.09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_amk_opintopisteet_kuukausi](
	[defaultorder] [bigint] IDENTITY(0,1) NOT NULL,
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
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


