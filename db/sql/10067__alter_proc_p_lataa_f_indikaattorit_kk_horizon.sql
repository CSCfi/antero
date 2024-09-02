USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_horizon]    Script Date: 2.9.2024 13:25:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_horizon] as

WITH x AS (SELECT n FROM (VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) v(n))

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_horizon' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.vuosi as tilastovuosi,
			o.organisaatio_koodi,
			coalesce(h.arvo,0) as  arvo,
			'erc_rahoitus' as indikaattori
		FROM (
		SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) as vuosi
		FROM x ones, x tens, x hundreds, x thousands
		) f
		OUTER APPLY (
			SELECT DISTINCT		
				f.organisaatio_koodi 
			FROM ANTERO.dw.f_indikaattorit_kk f
			LEFT JOIN ANTERO.dw.d_organisaatioluokitus d on d.organisaatio_koodi = f.organisaatio_koodi
			WHERE d.oppilaitostyyppi_koodi = '42' AND 1 = 1
		) o
		OUTER APPLY (
			SELECT COUNT(DISTINCT h.project_id) as arvo
			FROM (
				SELECT
						CAST(CASE WHEN startDate like '%/%' THEN right(startDate, 4) ELSE left(startDate,4) END as int) as alkuvuosi,
						CAST(CASE WHEN endDate like '%/%' THEN right(endDate, 4) ELSE left(endDate,4) END as int) as loppuvuosi,
						CASE
							WHEN [name] = 'AALTO KORKEAKOULUSAATIO SR' THEN '10076'
							WHEN [name] = 'HELSINGIN YLIOPISTO' THEN '01901'
							WHEN [name] = 'ITA-SUOMEN YLIOPISTO' THEN '10088'
							WHEN [name] = 'JYVASKYLAN YLIOPISTO' THEN '01906'
							WHEN [name] = 'LAPIN YLIOPISTO' THEN '01918'
							WHEN [name] = 'LAPPEENRANNAN-LAHDEN TEKNILLINEN YLIOPISTO LUT' THEN  '01914'
							WHEN [name] = 'OULUN YLIOPISTO' THEN '01904'
							WHEN [name] = 'SVENSKA HANDELSHOGSKOLAN' THEN '01910'
							WHEN [name] = 'TAIDEYLIOPISTO' THEN '10103'
							WHEN [name] = 'TAMPEREEN KORKEAKOULUSAATIO SR' THEN '10122'
							WHEN [name] = 'TURUN YLIOPISTO' THEN '10089'
							WHEN [name] = 'VAASAN YLIOPISTO' THEN '01913'
							WHEN [name] = 'ABO AKADEMI' THEN '01903'
						END as organisaatio_koodi,
						project_id
					FROM [dw].[f_horizon] f
					left join [dw].[d_horizon_organisaatiotyyppikoodit] d1 on d1.id = f.d_horizon_organisaatiotyyppi_id
					left join [dw].[d_horizon_maakoodit] d2 on d2.id = f.d_horizon_maa_id
					left join [dw].[d_horizon_projektit] d3 on d3.id = f.d_horizon_projekti_id
					left join [dw].[d_horizon_ohjelma] d6 on d6.id = f.d_horizon_ohjelma_id
					WHERE d3.frameworkProgramme <> 'FP6' and 
					d1.Organisaatiotyyppi = 'Higher or Secondary Education Establishments' AND [role] = 'coordinator'
					AND d2.maa = 'Finland' and d6.[Ohjelman lyhenne] = 'European Research Council (ERC)'
				) h
				WHERE f.vuosi between h.alkuvuosi and h.loppuvuosi and h.organisaatio_koodi = o.organisaatio_koodi
		) h 
		WHERE vuosi BETWEEN 2018 and YEAR(GETDATE())
	) f
	OUTER APPLY (
		SELECT
			COUNT(DISTINCT project_id) as arvo_sektori
		FROM [dw].[f_horizon] fb
		left join [dw].[d_horizon_organisaatiotyyppikoodit] d1b on d1b.id = fb.d_horizon_organisaatiotyyppi_id
		left join [dw].[d_horizon_maakoodit] d2b on d2b.id = fb.d_horizon_maa_id
		left join [dw].[d_horizon_projektit] d3b on d3b.id = fb.d_horizon_projekti_id
		left join [dw].[d_horizon_ohjelma] d6b on d6b.id = fb.d_horizon_ohjelma_id
		WHERE d3b.frameworkProgramme <> 'FP6' and 
		d1b.Organisaatiotyyppi = 'Higher or Secondary Education Establishments' AND [role] = 'coordinator'
		AND d2b.maa = 'Finland' and d6b.[Ohjelman lyhenne] = 'European Research Council (ERC)' and
		f.tilastovuosi between CAST(CASE WHEN startDate like '%/%' THEN right(startDate, 4) ELSE left(startDate,4) END as int) and CAST(CASE WHEN endDate like '%/%' THEN right(endDate, 4) ELSE left(endDate,4) END as int)
	) s
	WHERE f.organisaatio_koodi is not null
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED AND (target.arvo <> src.arvo OR target.arvo_sektori <> src.arvo_sektori) THEN
	UPDATE SET
		target.[arvo] = src.arvo,
		target.[arvo_sektori] = src.arvo_sektori,
		target.[source] = src.source,
		target.loadtime = GETDATE(),
		target.username = SUSER_NAME()
WHEN NOT MATCHED THEN
	INSERT (
		tilastovuosi,
		organisaatio_koodi,
		arvo,
		arvo_sektori,
		indikaattori,
		source,
		loadtime,
		username
	)
	VALUES (
		src.tilastovuosi,src. organisaatio_koodi, src.arvo, src.arvo_sektori, src.indikaattori, src.source,
		src.loadtime,
		src.username
	);
	
IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_horizon') = cast(getdate() as date)
BEGIN
EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]
END

GO

USE [ANTERO]
