USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_henkilosto]    Script Date: 16.11.2023 13:36:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














ALTER   PROCEDURE [dw].[p_lataa_f_varda_henkilosto]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2022

TRUNCATE TABLE dw.f_varda_henkilosto

WHILE @alkuVuosi <= YEAR(getdate())

BEGIN
	-- Faktataulun lataus

	INSERT INTO dw.f_varda_henkilosto (
		tilastovuosi
		,[tyontekija_id]
		,henkilo_id
		,taydennyskoulutus_id
		,koulutuspaivat
		,[toimipaikka_oid]
		,[vakajarjestaja_id]
		,d_ikaryhma_id
		,d_varda_tehtavanimike_id
		,d_kelpoisuus_id
		,d_varda_tyosuhde_id
		,d_varda_tyoaika_id
		,d_varda_toimintamuoto_id
		,f_varda_kielipainotus_id
		,d_varda_kielikoodisto
		,d_varda_yritysmuoto_id
		,d_alueluokitus_toimipaikka_id
		,d_alueluokitus_vakajarjestaja_id
		,d_organisaatioluokitus_id
		,d_sukupuoli
		,d_varda_toimipaikkaluokitus_id
		,d_varda_maaraaikaisuuden_kesto_id
		,source
	)

	SELECT
		@alkuVuosi as tilastovuosi,
		s2.id as tyontekija_id,
		s2.henkilo_id as henkilo_id,
		s6.id as taydennyskoulutus_id,
		s6.koulutuspaivia as koulutuspaivat,
		s7.organisaatio_oid as toimipaikka_oid,
		s8.id as vajarjestaja_id,
		coalesce(d.id,'-1') as d_ikaryhma_id,
		coalesce(d2.id,'-1') as d_varda_tehtavanimike_id,
		coalesce(d3.id,'-1') as d_kelpoisuus_id,
		coalesce(d4.id,'-1') as d_varda_tyosuhde_id,
		coalesce(d5.id,'-1') as d_varda_tyoaika_id,
		coalesce(d6.id,'-1') as d_varda_toimintamuoto_id,
		coalesce(f.id,'-1') as f_varda_kielipainotus_id,
		coalesce(d7.id,'-1') as d_varda_kielikoodisto,
		coalesce(d8.id,'-1') as d_varda_yritysmuoto_id,
		coalesce(d9.id,'-1') as d_alueluokitus_toimipaikka_id,
		coalesce(d9b.id,'-1') as d_alueluokitus_vakajarjestaja_id,
		coalesce(d10.id,'-1') as d_organisaatioluokitus_id,
		coalesce(d11.id,'-1') as d_sukupuoli_id,
		coalesce(oa.id,'-1') as d_varda_toimipaikkaluokitus_id,
		coalesce(d12.id,'-1') as d_varda_maaraaikaisuuden_kesto_id,
		'p_lataa_f_varda_henkilosto' as source
	
	FROM varda_sa.sa.sa_varda_palvelussuhde s
/*LEFT*/ JOIN [Varda_SA].[sa].[sa_varda_tyontekija] s2 on s.tyontekija_id = s2.id
--	LEFT JOIN [Varda_SA].[sa].[sa_varda_henkilo2022] s3 on s2.henkilo_id = s3.id
/*LEFT*/ JOIN [Varda_SA].[sa].[sa_varda_tyoskentelypaikka] s4 on s.id = s4.palvelussuhde_id
	LEFT JOIN [Varda_SA].[sa].[sa_varda_taydennyskoulutustyontekijat] s5 on s2.id = s5.tyontekija_id
	LEFT JOIN [Varda_SA].[sa].[sa_varda_taydennyskoulutus] s6 on s5.taydennyskoulutus_id = s6.id and YEAR(s6.suoritus_pvm) = @alkuVuosi
	LEFT JOIN [Varda_SA].[sa].[sa_varda_toimipaikka] s7 on s4.toimipaikka_id = s7.toimipaikka_id
/*LEFT*/ JOIN [Varda_SA].[sa].[sa_varda_organisaatio] s8 on s2.vakajarjestaja_id = s8.id
	
	LEFT JOIN dw.d_ika d on d.ika_avain = DATEDIFF(YEAR, s2.syntyma_pvm, CAST(CONCAT(@alkuVuosi, '-01-01') as date))
	LEFT JOIN dw.d_varda_tehtavanimike d2 on d2.koodi = s4.tehtavanimike_koodi
	LEFT JOIN dw.d_kytkin d3 on d3.kytkin_koodi = replace(replace(s4.kelpoisuus_kytkin, 'f', 0), 't', 1)
	LEFT JOIN dw.d_varda_tyosuhde d4 on d4.koodi = s.tyosuhde_koodi
	LEFT JOIN dw.d_varda_tyoaika d5 on d5.koodi = s.tyoaika_koodi
	LEFT JOIN dw.d_varda_toimintamuoto d6 on d6.koodi = s7.toimintamuoto_koodi
	LEFT JOIN dw.f_varda_kielipainotus f on f.tilastovuosi = @alkuVuosi and f.toimipaikka_id = s7.toimipaikka_id
	LEFT JOIN dw.d_varda_kielikoodistoopetushallinto d7 on d7.id = f.d_varda_kielikoodistoopetushallinto_id
	LEFT JOIN dw.d_varda_yritysluokitus d8 on d8.koodi = s8.yritysmuoto
	LEFT JOIN dw.d_alueluokitus d9 on d9.kunta_koodi = s7.kunta_koodi
	LEFT JOIN dw.d_alueluokitus d9b on d9b.kunta_koodi = s8.kunta_koodi
	LEFT JOIN dw.d_organisaatioluokitus d10 on d10.organisaatio_oid = s7.organisaatio_oid
	LEFT JOIN dw.d_sukupuoli d11 on d11.sukupuoli_koodi = s2.sukupuoli_koodi
	LEFT JOIN dw.d_varda_maaraaikaisuuden_kesto_luokitus d12 on d12.koodi = 
		case 
			when s.tyosuhde_koodi <> '2' then '-1'
			else DATEDIFF(DAY, s.alkamis_pvm, coalesce(s.paattymis_pvm, '2022-12-31'))
		end
	OUTER APPLY (
		SELECT d0.id FROM (
			SELECT 
				s0.id, 
				COUNT(DISTINCT s02.organisaatio_oid) as lkm FROM varda_sa.sa.sa_varda_organisaatio s0
			INNER JOIN varda_sa.sa.sa_varda_toimipaikka s02 on s02.vakajarjestaja_id = s0.id
			WHERE s02.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and s02.paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date)
			GROUP BY s0.id) lkm
		LEFT JOIN [dw].[d_varda_toimipaikkaluokitus] d0 on d0.koodi = lkm.lkm
		WHERE lkm.id = s8.id
	) oa

	WHERE s.alkamis_pvm <= CAST(CONCAT(@alkuVuosi, '-12-31') as date) 
	and (s.paattymis_pvm >= CAST(CONCAT(@alkuVuosi, '-12-31') as date) 
	or s.paattymis_pvm is NULL)

	AND s8.alkamis_pvm <= CAST(CONCAT(@alkuVuosi, '-12-31') as date)
	AND (s8.paattymis_pvm >= CAST(CONCAT(@alkuVuosi, '-01-01') as date) OR s8.paattymis_pvm IS NULL) 
	AND (
		s7.toimipaikka_id IS NULL 
		OR (
			s7.alkamis_pvm <= CAST(CONCAT(@alkuVuosi, '-12-31') as date)
			AND (s7.paattymis_pvm >= CAST(CONCAT(@alkuVuosi, '-01-01') as date) OR s7.paattymis_pvm IS NULL)
			)
		) 

	AND NOT EXISTS 
	(
	SELECT id FROM Varda_sa.sa.sa_varda_pidemmatpoissaolot 
	WHERE palvelussuhde_id = s.id 
	AND s.tyosuhde_koodi = '1' 
	AND alkamis_pvm <= '2022-12-31' AND paattymis_pvm >= '2022-12-31'
	)	

SET @alkuVuosi =  @alkuVuosi + 1

END































GO


