USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_opettajakelpoisuudet_varanto_jaadytys]    Script Date: 15.10.2024 13:23:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_opettajakelpoisuudet_varanto_jaadytys] AS

DECLARE @alkuVuosi as int
DECLARE @loppuVuosi as int
SET @alkuVuosi = 2016
SET @loppuVuosi = YEAR(GETDATE())
TRUNCATE TABLE [ANTERO].[dw].[f_virta_otp_opettajakelpoisuudet_varanto_jaadytys]

WHILE @alkuVuosi <= @loppuVuosi
BEGIN

	INSERT INTO [ANTERO].[dw].[f_virta_otp_opettajakelpoisuudet_varanto_jaadytys] 
	SELECT
		KelpoisuusID,
		henkilo,
		d_kelpoisuus_id,
		d_sukupuoli_id,
		d_ika_tilastovuonna_id,
		d_organisaatioluokitus_kelpoisuus_id,
		d_kytkin_yli_asetuksen_id,
		d_kytkin_yksi_org_id,
		d_kytkin_paatelty_tutkinnosta_id,
		d_koulutusluokitus_korkein_tutkinto_id,
		suoritustapa,
		@alkuVuosi as tilastovuosi,
		vuosi as kelpoisuuden_vuosi,
		vuosi_korkein_tutkinto as korkeimman_tutkinnon_vuosi,
		CASE WHEN f.rnk = 1 THEN 1 ELSE 0 END as priorisoitu_kelpoisuus,
		'ETL: p_lataa_f_virta_otp_opettajakelpoisuudet_varanto' as 'source',
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT f.*, rnk = row_number() over (partition by f.henkilo order by pri.sija) FROM (
		SELECT DISTINCT
			[KelpoisuusID],
			f.henkilo,
			[d_kelpoisuus_id],
			d_sukupuoli_id = MAX(d_sukupuoli_id) over (partition by f.henkilo),
			d1.id as d_ika_tilastovuonna_id,
			[d_organisaatioluokitus_kelpoisuus_id],
			[d_kytkin_yli_asetuksen_id],
			[d_kytkin_yksi_org_id],
			[d_kytkin_paatelty_tutkinnosta_id],
			[suoritustapa],
			[Vuosi],
			f.vuosi_korkein_tutkinto,
			f.d_koulutusluokitus_korkein_tutkinto_id,
			d2.koodi as kelpoisuus_koodi
		FROM [ANTERO].[dw].[f_virta_otp_opettajakelpoisuudet] f
		LEFT JOIN ANTERO.sa.sa_virta_otp_ope_henkilotiedot h on h.henkilo = f.henkilo
		LEFT JOIN ANTERO.dw.d_ika d1 on d1.ika_avain = @alkuVuosi - YEAR(h.syntymaaika)
		LEFT JOIN ANTERO.dw.d_opettajapatevyys d2 on d2.id = f.d_kelpoisuus_id
		WHERE Vuosi <= @alkuVuosi) f
		LEFT JOIN ANTERO.sa.virta_opettajakelpoisuus_priorisointi pri on pri.koodi = f.kelpoisuus_koodi
	) f

	SET @alkuVuosi = @alkuVuosi + 1

END

GO

USE [ANTERO]