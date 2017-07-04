IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_otp_opintopiste_pvm_yo') 
BEGIN

CREATE TABLE [dw].[f_virta_otp_opintopiste_pvm_yo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[suorituspaiva] [bigint] NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_yo_id] [int] NOT NULL,
	[lukumaara_int] [int] NULL,
	[perustutk_opiskelijat_lkm] [int] NULL,
	[vierask_suoritukset_lkm] [int] NULL,
	[kansainv_vaihto_lkm] [int] NULL,
	[kk_yhteistyo_lkm] [int] NULL,
	[avoin_kk_lkm] [int] NULL,
	[erillinen_opinto_oikeus_lkm] [int] NULL,
	[ulkomailta_hyv_luet_lkm] [int] NULL,
	[erillinen_opinto_opettaja_lkm] [int] NULL,
	[ulkomaaharjoittelu_lkm] [int] NULL,
	[erikoistumiskoulutus_lkm] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](30) NOT NULL
)
;

END
