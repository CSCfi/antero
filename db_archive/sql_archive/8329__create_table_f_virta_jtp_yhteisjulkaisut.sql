USE [ANTERO]
GO

DROP TABLE IF EXISTS [dw].[f_virta_jtp_yhteisjulkaisut]
GO


CREATE TABLE [dw].[f_virta_jtp_yhteisjulkaisut](
	[tilastovuosi] [int] NULL,
	[julkaisunTunnus] [varchar](50) NULL,
	[yhteisjulkaisuId] [varchar](50) NULL,
	[d_virtajtpsektori_id] [int] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_organisaatioluokitus_yhteistyo_id] [bigint] NULL,
	[d_julkaisufoorumitaso_id] [bigint] NULL,
	[d_julkaisutyyppi_id] [int] NULL,
	[d_julkaisun_kansainvalisyys_id] [bigint] NULL,
	[d_kansainvalinen_yhteisjulkaisu_id] [bigint] NULL,
	[d_tieteenala_id] [int] NULL,
	[d_ohjauksenala_id] [int] NULL,
	[d_koulutusala_1995_id] [int] NULL,
	[d_koulutusala_2002_id] [int] NULL,
	[d_kytkin_yj_shp_id] [int] NULL,
	[d_kytkin_yj_tutk_id] [int] NULL,
	[d_kytkin_yj_muu_tutk_id] [int] NULL,
	[d_kytkin_yj_yr_id] [int] NULL,
	[d_kytkin_rinnakkaistallennettu_id] [int] NULL,
	[d_avoinsaatavuus_id] [int] NULL,
	[lukumaara] [decimal](6, 5) NULL,
	[d_julkaisufoorumitaso_vanha_id] [bigint] NULL,
	[d_julkaisufoorumitaso_uusi_id] [bigint] NULL,
	[YO_HTV_opetusTKI] [decimal](10, 4) NULL,
	[YO_IV_HTV] [decimal](10, 4) NULL,
	[Ammattikorkeakoulu_HTV_opetustki] [decimal](10, 4) NULL,
	[aineisto] [varchar](31) NOT NULL,
	[loadtime] [date] NULL,
	[username] [varchar](50) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
GO

USE [ANTERO]