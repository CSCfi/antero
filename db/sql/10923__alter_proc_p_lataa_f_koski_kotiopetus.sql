USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_kotiopetus]    Script Date: 30.7.2025 8.01.24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   PROCEDURE [dw].[p_lataa_f_koski_kotiopetus] AS


DECLARE @alkuPvm as date

SET @alkuPvm = '2018-01-01'

TRUNCATE TABLE ANTERO.dw.f_koski_kotiopetus

WHILE @alkuPvm < DATEADD(MONTH, -1, GETDATE()) 

BEGIN

	INSERT INTO ANTERO.dw.f_koski_kotiopetus
	SELECT 
		YEAR(@alkuPvm) as tilastovuosi, 
		0 AS tilastopaiva_20_9,
		oo.master_oid, 
		ooa.opiskeluoikeus_oid,
		coalesce(d1.id, -1) as d_alueluokitus_opetuksen_jarjestajan_kunta_id,
		coalesce(d2.id, -1) as d_kieli_aidinkieli_id,
		coalesce(d3.id, -1) as d_sukupuoli_id,
		coalesce(d4.id, -1) as d_maatjavaltiot2_kansalaisuus_id,
		coalesce(d5.id, -1) as d_ika_id,
		d6.id as d_kalenteri_id,
		GETDATE() as loadtime,
		SUSER_NAME() as username,
		'ETL: p_lataa_f_koski_kotiopetus' as source
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_koski_henkilo_master h on h.master_oid = oo.master_oid
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d0 on d0.organisaatio_oid = oo.koulutustoimija_oid
	LEFT JOIN ANTERO.dw.d_alueluokitus d1 on d1.kunta_koodi = d0.kunta_koodi
	LEFT JOIN ANTERO.dw.d_kieli d2 on d2.kieli_koodi = h.aidinkieli
	LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.sukupuoli_koodi = h.sukupuoli
	LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d4 on d4.maatjavaltiot2_koodi = LEFT(h.kansalaisuus,3)
	LEFT JOIN ANTERO.dw.d_ika d5 on d5.ika_avain = YEAR(@alkuPvm) - YEAR(h.syntymaaika)
	LEFT JOIN ANTERO.dw.d_kalenteri d6 on d6.kalenteri_avain = @alkuPvm
	LEFT JOIN Koski_SA.sa.toisen_asteen_tutkinnot tat on tat.master_oid = oo.master_oid and tat.rnk = 1
	WHERE	(ooa.loppu > @alkuPvm OR ooa.loppu is null) AND 
			ooa.alku <= EOMONTH(@alkuPvm) AND ooa.kotiopetus = 1 and ooa.tila = 'lasna' AND 
			(tat.vahvistus_paiva is null or tat.vahvistus_paiva > @alkuPvm) AND
			@alkuPvm < DATEADD(year, 18, h.syntymaaika)

	IF MONTH(@alkuPvm) = 9 

	BEGIN

		INSERT INTO ANTERO.dw.f_koski_kotiopetus
		SELECT 
			YEAR(@alkuPvm) as tilastovuosi, 
			1 AS tilastopaiva_20_9,
			oo.master_oid, 
			ooa.opiskeluoikeus_oid,
			coalesce(d1.id, -1) as d_alueluokitus_opetuksen_jarjestajan_kunta_id,
			coalesce(d2.id, -1) as d_kieli_aidinkieli_id,
			coalesce(d3.id, -1) as d_sukupuoli_id,
			coalesce(d4.id, -1) as d_maatjavaltiot2_kansalaisuus_id,
			coalesce(d5.id, -1) as d_ika_id,
			d6.id as d_kalenteri_id,
			GETDATE() as loadtime,
			SUSER_NAME() as username,
			'ETL: p_lataa_f_koski_kotiopetus' as source
		FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa
		LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
		LEFT JOIN Koski_SA.sa.sa_koski_henkilo_master h on h.master_oid = oo.master_oid
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d0 on d0.organisaatio_oid = oo.koulutustoimija_oid
		LEFT JOIN ANTERO.dw.d_alueluokitus d1 on d1.kunta_koodi = d0.kunta_koodi
		LEFT JOIN ANTERO.dw.d_kieli d2 on d2.kieli_koodi = h.aidinkieli
		LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.sukupuoli_koodi = h.sukupuoli
		LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d4 on d4.maatjavaltiot2_koodi = LEFT(h.kansalaisuus,3)
		LEFT JOIN ANTERO.dw.d_ika d5 on d5.ika_avain = YEAR(@alkuPvm) - YEAR(h.syntymaaika)
		LEFT JOIN ANTERO.dw.d_kalenteri d6 on d6.kalenteri_avain = @alkuPvm
		LEFT JOIN Koski_SA.sa.toisen_asteen_tutkinnot tat on tat.master_oid = oo.master_oid and tat.rnk = 1
		WHERE	(ooa.loppu >= CAST(CONCAT(YEAR(@alkuPvm), '-09-20') as date) OR ooa.loppu is null) AND 
				ooa.alku <= CAST(CONCAT(YEAR(@alkuPvm), '-09-20') as date) AND ooa.tila = 'lasna' AND ooa.kotiopetus = 1 AND
				(tat.vahvistus_paiva is null or tat.vahvistus_paiva >  CAST(CONCAT(YEAR(@alkuPvm), '-09-20') as date)) AND
				CAST(CONCAT(YEAR(@alkuPvm), '-09-20') as date) < DATEADD(year, 18, h.syntymaaika)

	END
	
	SET @alkuPvm = DATEADD(MONTH, 1, @alkuPvm)

END

GO


