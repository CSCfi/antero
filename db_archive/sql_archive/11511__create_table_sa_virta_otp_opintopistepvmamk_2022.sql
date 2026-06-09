USE [ANTERO]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_otp_opintopistepvmamk_2022]') AND type in (N'U'))
BEGIN
	CREATE TABLE [sa].[sa_virta_otp_opintopistepvmamk_2022](
		[tilastovuosi] [int] NULL,
		[kuukausi] [int] NULL,
		[op_perustutkinto_opiskelijat_lkm] [int] NULL,
		[op_tki_opinnayte_lkm] [int] NULL,
		[op_tki_harjoittelu_lkm] [int] NULL,
		[op_tki_muu_lkm] [int] NULL,
		[op_vieraskielinen_opetus_lkm] [int] NULL,
		[op_ulkomailta_hyvaksiluetut_lkm] [int] NULL,
		[op_ulkomainen_harjoittelu_lkm] [int] NULL,
		[op_avoin_amk_opetus_lkm] [int] NULL,
		[op_saapuvat_vaihto_opiskelijat_lkm] [int] NULL,
		[op_korkeakoulujen_yhteistyo_lkm] [int] NULL,
		[op_erilliset_opinto_oikeudet_lkm] [int] NULL,
		[op_maahanmuuttajien_valmentava_lkm] [int] NULL,
		[op_erikoistumiskoulutus_lkm] [int] NULL,
		[op_kv_suomi_vieraana_lkm] [int] NULL,
		[op_kv_ruotsi_vieraana_lkm] [int] NULL,
		[op_muun_kuin_korkeakoulun_yhteistyo_lkm] [int] NULL,
		[koulutustyyppi] [nvarchar](20) NULL,
		[ohjauksenala] [nvarchar](20) NULL,
		[oppilaitostunnus] [nvarchar](20) NULL,
		[tietojen_ajankohta] [nvarchar](10) NULL,
		[loadtime] [datetime] NOT NULL,
		[username] [nvarchar](128) NULL,
		[source] [varchar](40) NOT NULL
	) ON [PRIMARY]
END