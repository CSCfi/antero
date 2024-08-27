USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_vakajarjestajat_toimipaikat]    Script Date: 19.8.2024 12:39:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE OR ALTER  PROCEDURE [dw].[p_lataa_f_varda_vakajarjestajat_toimipaikat]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2022 --2020

TRUNCATE TABLE ANTERO.dw.f_varda_vakajarjestajat_toimipaikat

WHILE @alkuVuosi <= YEAR(getdate())

BEGIN
	-- Faktataulun lataus

	INSERT INTO ANTERO.dw.f_varda_vakajarjestajat_toimipaikat ( 
		tilastovuosi,
		[toimipaikka_id],
		[vakajarjestaja_oid],
		vakajarjestaja_id,
        d_alueluokitus_vakajarjestaja_kunta_id,
        [toimipaikka_oid],
        [d_alueluokitus_toimipaikka_kunta_id],
        [d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id],
        [d_varda_toimipaikka_toimintamuoto_id],
		[d_varda_yritysluokitus_id],
		d_varda_toimipaikkaluokitus_id,
		d_varda_varhaiskasvatuspaikkaluokitus_id,
		d_organisaatioluokitus_vakajarjestaja_id,
        [varhaiskasvatuspaikat],
		d_yritysmuoto_id,
        [alkamis_pvm],
        [paattymis_pvm],
        [source]
	)

	SELECT 
		CASE
			WHEN s2.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and coalesce(s2.paattymis_pvm, '9999-12-31') >= cast(concat(@alkuVuosi, '-12-31') as date) THEN @alkuVuosi
			ELSE NULL 
		END as tilastovuosi,
	    s2.toimipaikka_id as toimipaikka_id,
		s.organisaatio_oid as vakajarjestaja_oid,
		s.id as vakajarjestaja_id,
        coalesce(d1.id, '-1') as d_alueluokitus_vakajarjestaja_kotikunta_id,
        s2.organisaatio_oid as toimipaikka_oid,
        coalesce(d2.id, '-1') as d_alueluokitus_toimipaikka_kunta_id,
        coalesce(d3.id, '-1') as d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id,
        coalesce(d4.id, '-1') as d_varda_toimipaikka_toimintamuoto_id,
        coalesce(d5.id, '-1') as d_varda_yritysluokitus_id,
		coalesce(oa.id, '-1') as d_varda_toimipaikkaluokitus_id,
		coalesce(d7.id, '-1') as d_varda_varhaiskasvatuspaikkaluokitus_id,
		coalesce(d6.id, '-1') as d_organisaatioluokitus_vakajarjestaja_id,
		s2.varhaiskasvatuspaikat,
		   --pitää miettiä, mitä dimensiota käytetään ja tehdä tarvittaessa lataus, jossa myös ryhmittely. JS 12.5.2022
		   /*Case WHEN yritysmuoto = 'OSAKEYHTIO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Osakeyhtiö')
				 WHEN yritysmuoto = 'KOMMANDIITTIYHTIO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Kommandiittiyhtiö')
				 WHEN yritysmuoto = 'SAATIO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Säätiö')
				 WHEN yritysmuoto = 'PAIKALLISYHTEISO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Paikallisyhteisö')
				 WHEN yritysmuoto = 'YKSITYINEN_ELINKEINONHARJOITTAJA' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Yksityinen elinkeinonharjoittaja')
				 WHEN yritysmuoto = 'ORTODOKSINEN_KIRKKO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Ortodoksinen kirkko')
				 WHEN yritysmuoto = 'OSUUSKUNTA' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Osuuskunta')
				 WHEN yritysmuoto = 'USKONNOLLINEN_YHDYSKUNTA' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Uskonnollinen yhdyskunta')
				 WHEN yritysmuoto = 'MUU_YHDISTYS' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Muu yhdistys')
				 WHEN yritysmuoto = 'EI_YRITYSMUOTOA' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Ei yritysmuotoa')
				 WHEN yritysmuoto = 'KUNTA' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Kunta')
				 WHEN yritysmuoto = 'AVOIN_YHTIO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Avoin yhtiö')
				 WHEN yritysmuoto = 'EV_LUT_KIRKKO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Ev.lut.kirkko')
				 WHEN yritysmuoto = 'AATTEELLINEN_YHDISTYS' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Aatteellinen yhdistys')
				 ELSE*/ 
				 --end 
		-1 as d_yritysmuoto_id,
		s2.alkamis_pvm,
        s2.paattymis_pvm as paattymis_pvm,
        'p_lataa_f_varda_vakajarjestajat_toimipaikat' as source

	FROM varda_sa.sa.sa_varda_organisaatio s
	INNER JOIN varda_sa.sa.sa_varda_toimipaikka s2 on s2.vakajarjestaja_id = s.id
	LEFT JOIN dw.d_alueluokitus d1 on d1.kunta_koodi = s.kunta_koodi
	LEFT JOIN dw.d_alueluokitus d2 on d2.kunta_koodi = s2.kunta_koodi
	LEFT JOIN dw.d_varda_kasvatusopillinenjarjestelma d3 on d3.koodi = s2.kasvatusopillinen_jarjestelma_koodi
	LEFT JOIN dw.d_varda_toimintamuoto d4 on d4.koodi = s2.toimintamuoto_koodi
	INNER JOIN dw.d_varda_yritysluokitus d5 on d5.koodi = s.yritysmuoto --ei haluta mm. kuolinpesiä mukaan. AK 30.8.2022
	LEFT JOIN dw.d_organisaatioluokitus d6 on d6.organisaatio_oid = s.organisaatio_oid
	LEFT JOIN dw.d_varda_varhaiskasvatuspaikkaluokitus d7 on d7.koodi = s2.varhaiskasvatuspaikat
	OUTER APPLY (
		SELECT d0.id FROM (
			SELECT 
				s0.id, 
				COUNT(DISTINCT s02.organisaatio_oid) as lkm FROM varda_sa.sa.sa_varda_organisaatio s0
			INNER JOIN varda_sa.sa.sa_varda_toimipaikka s02 on s02.vakajarjestaja_id = s0.id
			WHERE s02.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and coalesce(s02.paattymis_pvm, '9999-12-31') >= cast(concat(@alkuVuosi, '-12-31') as date)
			GROUP BY s0.id) lkm
		LEFT JOIN [dw].[d_varda_toimipaikkaluokitus] d0 on d0.koodi = lkm.lkm
		WHERE lkm.id = s.id
	) oa

	WHERE s2.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and coalesce(s2.paattymis_pvm, '9999-12-31') >= cast(concat(@alkuVuosi, '-12-31') as date)	

	AND s2.action <> 'DELETED'

SET @alkuVuosi =  @alkuVuosi + 1

END




GO


