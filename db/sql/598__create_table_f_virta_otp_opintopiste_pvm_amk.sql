IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_otp_opintopiste_pvm_amk') 
BEGIN

CREATE TABLE [dw].[f_virta_otp_opintopiste_pvm_amk](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[suorituspaiva] [bigint] NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_amk_koulutustyyppi_id] [int] NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[lukumaara_int] [int] NULL,
	[perustutk_opiskelijat_lkm] [int] NULL,
	[vierask_suoritukset_lkm] [int] NULL,
	[kansainv_vaihto_lkm] [int] NULL,
	[kk_yhteistyo_lkm] [int] NULL,
	[avoin_kk_lkm] [int] NULL,
	[erillinen_opinto_oikeus_lkm] [int] NULL,
	[ulkomailta_hyv_luet_lkm] [int] NULL,
	[maahanm_val_koulutus_lkm] [int] NULL,
	[TKI_toiminnan_laajuus_lkm] [int] NULL,
	[TKI_muut_laajuus_lkm] [int] NULL,
	[TKI_harjoittelun_laajuus_lkm] [int] NULL,
	[ulkomaaharjoittelu_lkm] [int] NULL,
	[erikoistumiskoulutus_lkm] [int] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL
)

END