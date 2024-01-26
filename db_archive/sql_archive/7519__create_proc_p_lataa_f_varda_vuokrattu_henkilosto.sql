USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_vuokrattu_henkilosto]    Script Date: 30.3.2023 13:59:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO























CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_varda_vuokrattu_henkilosto]
AS


TRUNCATE TABLE dw.f_varda_vuokrattu_henkilosto

-- Faktataulun lataus

INSERT INTO dw.f_varda_vuokrattu_henkilosto (
	tilastovuosi
	,d_kalenteri_id
	,[tyontekijamaara_id]
	,[tyontekijamaara]
	,[tuntimaara]
	,[vakajarjestaja_id]
--	,d_varda_toimintamuoto_id
--	,f_varda_kielipainotus_id
--	,d_varda_kielikoodisto
	,d_varda_yritysmuoto_id
	,d_alueluokitus_id
	,d_organisaatioluokitus_id
	,d_varda_toimipaikkaluokitus_id
	,source
)

SELECT
	YEAR(s.kuukausi) as tilastovuosi,
	coalesce(d11.id, '-1') as d_kalenteri_id,
	s.id as tyontekijamaara_id,
	s.tyontekijamaara as tyontekijamaara,
	s.tuntimaara as tuntimaara,
	s2.id as vakajarjestaja_id,
--	coalesce(d6.id,'-1') as d_varda_toimintamuoto_id,
--	coalesce(f.id,'-1') as f_varda_kielipainotus_id,
--	coalesce(d7.id,'-1') as d_varda_kielikoodisto,
	coalesce(d8.id,'-1') as d_varda_yritysmuoto_id,
	coalesce(d9.id,'-1') as d_alueluokitus_id,
	coalesce(d10.id,'-1') as d_organisaatioluokitus_id,
	coalesce(oa.id,'-1') as d_varda_toimipaikkaluokitus_id,
	'p_lataa_f_varda_vuokrattu_henkilosto' as source

FROM varda_sa.sa.sa_varda_henkilo_tilapainenhenkilosto2022 s
LEFT JOIN [Varda_SA].[sa].[sa_varda_henkilo_organisaatio2022] s2 on s.vakajarjestaja_id = s2.id
--LEFT JOIN [Varda_SA].[sa].[sa_varda_henkilo_toimipaikka2022] s3 on s.vakajarjestaja_id = s3.vakajarjestaja_id 

--LEFT JOIN dw.d_varda_toimintamuoto d6 on d6.koodi = s3.toimintamuoto_koodi
--LEFT JOIN dw.f_varda_kielipainotus f on f.tilastovuosi = YEAR(s.kuukausi) and f.toimipaikka_id = s3.id --
--LEFT JOIN dw.d_varda_kielikoodistoopetushallinto d7 on d7.id = f.d_varda_kielikoodistoopetushallinto_id
LEFT JOIN dw.d_varda_yritysluokitus d8 on d8.koodi = s2.yritysmuoto
LEFT JOIN dw.d_alueluokitus d9 on d9.kunta_koodi = s2.kunta_koodi
LEFT JOIN dw.d_organisaatioluokitus d10 on d10.organisaatio_oid = s2.organisaatio_oid
LEFT JOIN dw.d_kalenteri d11 on d11.kalenteri_avain = CAST(s.kuukausi as date)
OUTER APPLY (
	SELECT d0.id FROM (
		SELECT 
			s0.id, 
			COUNT(DISTINCT s02.organisaatio_oid) as lkm FROM varda_sa.sa.sa_varda_henkilo_organisaatio2022 s0
		INNER JOIN varda_sa.sa.sa_varda_henkilo_toimipaikka2022 s02 on s02.vakajarjestaja_id = s0.id
		WHERE s02.alkamis_pvm <= s.kuukausi and s02.paattymis_pvm >= s.kuukausi or s02.paattymis_pvm is NULL
		GROUP BY s0.id) lkm
	LEFT JOIN [dw].[d_varda_toimipaikkaluokitus] d0 on d0.koodi = lkm.lkm
	WHERE lkm.id = s2.id
) oa 



		




























GO


