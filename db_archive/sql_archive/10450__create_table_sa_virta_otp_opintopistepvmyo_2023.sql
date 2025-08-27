USE [ANTERO]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_otp_opintopistepvmyo_2023]') AND type in (N'U'))

BEGIN

	CREATE TABLE [sa].[sa_virta_otp_opintopistepvmyo_2023](
		[tilastovuosi] [int] NULL,
		[kuukausi] [int] NULL,
		[op_perustutkinto_opiskelijat_lkm] [int] NULL,
		[op_vieraskielinen_opetus_lkm] [int] NULL,
		[op_ulkomailta_hyvaksiluetut_lkm] [int] NULL,
		[op_ulkomainen_harjoittelu_lkm] [int] NULL,
		[op_avoin_yo_opetus_lkm] [int] NULL,
		[op_saapuvat_vaihto_opiskelijat_lkm] [int] NULL,
		[op_korkeakoulujen_yhteistyo_lkm] [int] NULL,
		[op_erilliset_opinto_oikeudet_lkm] [int] NULL,
		[op_erilliset_opinto_oikeudet_opettaja_lkm] [int] NULL,
		[op_erikoistumiskoulutus_lkm] [int] NULL,
		[op_kv_suomi_vieraana_lkm] [int] NULL,
		[op_kv_ruotsi_vieraana_lkm] [int] NULL,
		[op_muun_kuin_korkeakoulun_yhteistyo_lkm] [int] NULL,
		[ohjauksenala] [nvarchar](20) NULL,
		[oppilaitostunnus] [nvarchar](20) NULL,
		[tietojen_ajankohta] [nvarchar](10) NULL,
		[loadtime] [datetime] NOT NULL,
		[username] [nvarchar](128) NULL,
		[source] [varchar](39) NOT NULL
	) ON [PRIMARY]

	DECLARE @pvm date
	SET @pvm  = '2025-01-07'

	INSERT INTO ANTERO.sa.sa_virta_otp_opintopistepvmyo_2023
	SELECT
		[tilastovuosi] = sa.vuosi,
		[kuukausi] = month(convert(date, dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00')))),
		[op_perustutkinto_opiskelijat_lkm] = SUM(sa.perustutkOpiskelijat),
		[op_vieraskielinen_opetus_lkm] = SUM(sa.vieraskSuoritukset),
		[op_ulkomailta_hyvaksiluetut_lkm] = SUM(sa.ulkomailtaHyvLuet),
		[op_ulkomainen_harjoittelu_lkm] = SUM(sa.ulkomaaharjoittelu),
		[op_avoin_yo_opetus_lkm] = SUM(sa.avoinKK),
		[op_saapuvat_vaihto_opiskelijat_lkm] = SUM(sa.kansainvVaihto),
		[op_korkeakoulujen_yhteistyo_lkm] = SUM(sa.kkYhteistyo),
		[op_erilliset_opinto_oikeudet_lkm] = SUM(sa.erillinenOpintoOikeus),
		[op_erilliset_opinto_oikeudet_opettaja_lkm] = SUM(sa.erillinenOpintoOpettaja),
		[op_erikoistumiskoulutus_lkm] = SUM(sa.erikoistumiskoulutus),
		[op_kv_suomi_vieraana_lkm] = SUM(sa.kvsuomivieraana),
		[op_kv_ruotsi_vieraana_lkm] = SUM(sa.kvruotsivieraana),
		[op_muun_kuin_korkeakoulun_yhteistyo_lkm] = SUM(sa.muunkuinkorkeakoulun),
		sa.koodi as ohjauksenala,
		sa.oppilaitostunnus,
		[tietojen_ajankohta] = right('0'+cast(day(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + right('0'+cast(month(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + cast(year(dateadd(day, -1, sa.loadtime)) as nvarchar(4)),
		[loadtime] = GETDATE(),
		[username] = SUSER_NAME(),
		[source] = 'ANTERO.sa.sa_virta_otp_opintopistepvmyo'
	FROM ANTERO.sa.sa_virta_otp_opintopistepvmyo as sa
	WHERE cast(sa.loadtime as date) = @pvm AND sa.vuosi = 2023
	GROUP BY sa.vuosi,
	month(convert(date, dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00')))),
	sa.koodi,
	sa.oppilaitostunnus,
	right('0'+cast(day(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + right('0'+cast(month(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + cast(year(dateadd(day, -1, sa.loadtime)) as nvarchar(4))

END

GO

USE [ANTERO]