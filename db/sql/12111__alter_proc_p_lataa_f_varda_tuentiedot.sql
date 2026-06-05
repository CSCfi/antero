USE [ANTERO]
GO



/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_tuentiedot]    Script Date: 5.6.2026 17.20.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



































CREATE OR ALTER    PROCEDURE [dw].[p_lataa_f_varda_tuentiedot]
AS



TRUNCATE TABLE dw.f_varda_tuentiedot



-- Faktataulun lataus

INSERT INTO dw.f_varda_tuentiedot (
	tilastovuosi
	,[tukipaatosmaara_id]
	,[tukipaatosmaara]
	,[vakajarjestaja_id]
	,d_varda_yritysmuoto_id
	,d_alueluokitus_id
	,d_organisaatioluokitus_id
	,d_kytkin_yksityinen_jarjestaja
	,d_tuentaso_id
	,d_ikaryhma_id
	,source
)

SELECT
	YEAR(s.tilastointi_pvm) as tilastovuosi,
	s.id as tukipaatosmaara_id,
	s.tukipaatosmaara as tukipaatosmaara,
	s2.id as vakajarjestaja_id,
	coalesce(d1.id,'-1') as d_varda_yritysmuoto_id,
	coalesce(d2.id,'-1') as d_alueluokitus_id,
	coalesce(d3.id,'-1') as d_organisaatioluokitus_id,
	coalesce(d4.id,'-1') as d_kytkin_yksityinen_jarjestaja,
	coalesce(d5.id,'-1') as d_tuentaso_id,
	coalesce(d6.id,'-1') as d_ikaryhma_id,
	'p_lataa_f_varda_vuokrattu_henkilosto' as source

FROM varda_sa.sa.sa_varda_tuen_tiedot s
LEFT JOIN [Varda_SA].[sa].[sa_varda_organisaatio] s2 on s.organisaatio_oid = s2.organisaatio_oid
LEFT JOIN dw.d_varda_yritysluokitus d1 on d1.koodi = s2.yritysmuoto
LEFT JOIN dw.d_alueluokitus d2 on d2.kunta_koodi = s2.kunta_koodi
LEFT JOIN dw.d_organisaatioluokitus d3 on d3.organisaatio_oid = s2.organisaatio_oid
LEFT JOIN dw.d_kytkin d4 on d4.kytkin_koodi = replace(replace(s.yksityinen_jarjestaja,'FALSE',0),'TRUE',1)
LEFT JOIN sa.sa_varda_koodistot d5 on d5.koodi = upper(s.tuentaso_koodi)
LEFT JOIN sa.sa_varda_koodistot d6 on d6.koodi = upper(s.ikaryhma_koodi)
WHERE 
-- Organisaation eli vaka-järjestäjän pitää olla voimassa vuoden viimeisenä päivänä. 
	s2.alkamis_pvm <= cast(concat(YEAR(s.tilastointi_pvm),'-12-31') as date) and (coalesce(s2.paattymis_pvm, '9999-12-31') >= cast(concat(YEAR(s.tilastointi_pvm),'-12-31') as date))