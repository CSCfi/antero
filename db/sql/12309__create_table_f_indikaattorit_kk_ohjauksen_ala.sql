USE [ANTERO]
GO

/****** Object:  Table [dw].[f_indikaattorit_kk_ohjauksen_ala]    Script Date: 15.10.2026 13.08.08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dw.f_indikaattorit_kk_ohjauksen_ala', N'U') IS NULL
BEGIN
	CREATE TABLE [dw].[f_indikaattorit_kk_ohjauksen_ala](
		[tilastovuosi] [int] NOT NULL,
		[organisaatio_koodi] [varchar](10) NOT NULL,
		[okmohjauksenala_koodi] [int] NOT NULL,
		[vastaanottanut_paikan] [int] NULL,
		[ensisijainen_kohde] [int] NULL,
		[sama_maakunta] [int] NULL,
		[uusimaa] [int] NULL,
		[aidosti_ensikertainen] [int] NULL,
		[avoin_vayla] [int] NULL,
		[alle_23_vuotta] [int] NULL,
		[ika_vahintaan_30] [int] NULL,
		[kv_opiskelija] [int] NULL,
		[tilauskoulutus] [int] NULL,
		[valmistunut_tavoiteajassa] [int] NULL,
		[aiempi_tutkinto] [int] NULL,
		[tyollinen] [int] NULL,
		[ulkomaalainen] [int] NULL,
		[uraporras] [int] NULL,
		[yli_55_op_suorittaneet] [int] NULL,
		[opiskelijat_55_op] [int] NULL,
		[avop_ka_yli_4] [int] NULL,
		[avop_vastanneet] [int] NULL,
		[opetus_tki_henkilokunta_htv] [float] NULL,
		[opetushenkilokunta_htv] [float] NULL,
		[tohtorintutkinto_opetus_tki_henkilokunta_htv] [float] NULL,
		[opetus_tutkimus_henkilokunta_htv] [float] NULL,
		[horizon_projekti] [varchar](300) NULL,
		[avoimet_julkaisut] [float] NULL,
		[kv_yhteisjulkaisut] [float] NULL,
		[jufo_1_3_julkaisut] [float] NULL,
		[julkaisut] [float] NULL,
		[yhteisjulkaisut_yritysten_kanssa] [int] NULL,
		[yhteisjulkaisut] [int] NULL,
		[kandipalaute_ka_yli_3] [int] NULL,
		[kandipalaute_vastanneet] [int] NULL,
		[amk_tutkinnot] [int] NULL,
		[ylemmat_amk_tutkinnot] [int] NULL,
		[alemmat_kk_tutkinnot] [int] NULL,
		[ylemmat_kk_tutkinnot] [int] NULL,
		[tohtorintutkinnot] [int] NULL,
		[amk_opiskelijat] [int] NULL,
		[alempi_kk_opiskelijat] [int] NULL,
		[ylempi_kk_opiskelijat] [int] NULL,
		[tohtoriopiskelijat] [int] NULL,
		[aloittaneet_amk] [int] NULL,
		[aloittaneet_alempi_kk] [int] NULL,
		[ulkopuolinen_rahoitus] [float] NULL,
		[rakennerahastot] [float] NULL,
		[taydentava_rahoitus] [float] NULL,
		[liikevaihto] [float] NULL,
		[yritysten_tk_rahoitus] [float] NULL,
		[tutkimusmenot] [float] NULL,
		[top_10] [float] NULL,
		[julkaisut_top_10] [float] NULL,
		[yliopisto_vaihdossa_olleet] [int] NULL,
		[amk_vaihdossa_olleet] [int] NULL,
		[master_oid] [varchar](200) NULL,
		[vaihdossa_olleet_avain] [varchar](200) NULL,
		[tarkenne] [varchar](100) NOT NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](50) NULL,
		[source] [varchar](100) NULL
	) ON [PRIMARY] 
END