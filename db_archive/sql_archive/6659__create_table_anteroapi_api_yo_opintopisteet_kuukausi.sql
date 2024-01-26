USE [AnteroAPI]
GO

/****** Object:  Table [dw].[api_yo_opintopisteet_kuukausi]    Script Date: 22.11.2022 12:36:32 ******/
DROP TABLE IF EXISTS [dw].[api_yo_opintopisteet_kuukausi]
GO

/****** Object:  Table [dw].[api_yo_opintopisteet_kuukausi]    Script Date: 22.11.2022 12:36:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_yo_opintopisteet_kuukausi](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[yliopisto] [varchar](100) NULL,
	[koodit_yliopisto] [varchar](5) NULL,
	[okm_ohjauksen_ala] [varchar](100) NULL,
	[koodit_okm_ohjauksen_ala] [int] NULL,
	[op_perustutkinto_opiskelijat_lkm] [int] NULL,
	[op_avoin_yo_opetus_lkm] [int] NULL,
	[op_erikoistumiskoulutus_lkm] [int] NULL,
	[op_erilliset_opinto_oikeudet_lkm] [int] NULL,
	[op_erilliset_opinto_oikeudet_opettaja_lkm] [int] NULL,
	[op_korkeakoulujen_yhteistyo_lkm] [int] NULL,
	[op_saapuvat_vaihto_opiskelijat_lkm] [int] NULL,
	[op_ulkomainen_harjoittelu_lkm] [int] NULL,
	[op_ulkomailta_hyvaksiluetut_lkm] [int] NULL,
	[op_vieraskielinen_opetus_lkm] [int] NULL,
	[tietojen_ajankohta] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [ANTERO]