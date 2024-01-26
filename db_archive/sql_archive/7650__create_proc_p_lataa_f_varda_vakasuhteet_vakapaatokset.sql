USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_vakasuhteet_vakapaatokset]    Script Date: 3.5.2023 12:25:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER PROCEDURE  [dw].[p_lataa_f_varda_vakasuhteet_vakapaatokset]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2022 --2020

TRUNCATE TABLE dw.f_varda_vakasuhteet_vakapaatokset

WHILE @alkuVuosi <= YEAR(getdate())

BEGIN
	-- Faktataulun lataus

	INSERT INTO dw.f_varda_vakasuhteet_vakapaatokset (
		 tilastovuosi
		,[henkilo_id]
		,lapsi_id
		,[d_alueluokitus_kotikunta]
		,[henkilo_syntyma_pvm]
		,d_ikaryhma_id
		,[d_kieli_aidinkieli]
		,[d_sukupuoli]
		,[vakajarjestaja_id]
		,d_varda_yritysluokitus_id
		,[vakapaatos_alkamis_pvm]
		,[vakapaatos_hakemus_pvm]
		,[vakapaatos_paattymis_pvm]
		,[d_jarjestamismuoto_id_vakapaatos]
		,[d_kytkin_vakapaatos_vuorohoito]
		,[d_varda_kytkin_vakapaatos_kokopaivainen_vaka]
		,[d_varda_kytkin_vakapaatos_paivittainen_vaka]
		,[d_kytkin_vakapaatos_pikakasittely]
		,[vakapaatos_tuntimaara_viikossa]
		,d_tuntimaara_asteikko_id
		,[vakasuhde_id]
		,[vakasuhde_alkamis_pvm]
		,[vakasuhde_paattymis_pvm]
		,[vakasuhde_toimipaikka_id]
		,source
 )

	SELECT
		@alkuVuosi as tilastovuosi,
        s.henkilo_id * 50 as henkilo_id,
		s2.lapsi_id,
		coalesce(d2.id, '-1') as d_alueluokitus_kotikunta,
		s.syntyma_pvm as henkilo_syntyma_pvm,
		coalesce(d11.id, '-1') d_ikaryhma_id,
		coalesce(d3.id, '-1') as d_kieli_aidinkieli,
		d1.id as d_sukupuoli,
		CASE 
			WHEN (s2.vakatoimija_id IS NULL or s2.vakatoimija_id = 0) and s2.oma_organisaatio_id is null THEN s5.vakajarjestaja_id
	  		WHEN (s2.vakatoimija_id IS NULL or s2.vakatoimija_id = 0) and s2.oma_organisaatio_id is not null THEN s2.oma_organisaatio_id
			ELSE s2.vakatoimija_id
		END as vakajarjestaja_id,
		d9.id as d_varda_yritysluokitus_id,
		s3.alkamis_pvm as vakapaatos_alkamis_pvm,
		s3.hakemus_pvm as vakapaatos_hakemus_pvm,
		s3.paattymis_pvm as vakapaatos_paattymis_pvm,
		d4.id as d_jarjestamismuoto_id_vakapaatos,
		coalesce(d5.id ,'-1') as d_kytkin_vakapaatos_vuorohoito,
		coalesce(d6.id ,'-1') as d_varda_kytkin_vakapaatos_kokopaivainen_vaka,
		coalesce(d7.id ,'-1') as d_varda_kytkin_vakapaatos_paivittainen_vaka,
		coalesce(d8.id ,'-1') as d_kytkin_vakapaatos_pikakasittely,
		cast(s3.tuntimaara_viikossa as float) as vakapaatos_tuntimaara_viikossa,
	    coalesce(d10.id, '-1') as d_tuntimaara_asteikko_id,
		s4.varhaiskasvatussuhde_id as vakasuhde_id,
		s4.alkamis_pvm as vakasuhde_alkamis_pvm,
		s4.paattymis_pvm as vakasuhde_paattymis_pvm,
		s4.toimipaikka_id as vakasuhde_toimipaikka_id,
		'p_lataa_varda_vakapaatokset_ja_suhteet' as source
	FROM varda_sa.sa.sa_varda_henkilo s
	INNER JOIN varda_sa.sa.sa_varda_lapsi s2 on s2.henkilo_id = s.henkilo_id
	INNER JOIN varda_sa.sa.sa_varda_varhaiskasvatuspaatos s3 on s3.lapsi_id = s2.lapsi_id
	INNER JOIN varda_sa.sa.sa_varda_varhaiskasvatussuhde s4 on s4.varhaiskasvatuspaatos_id = s3.varhaiskasvatuspaatos_id
	INNER JOIN varda_sa.sa.sa_varda_toimipaikka s5 on s5.toimipaikka_id = s4.toimipaikka_id
	INNER JOIN varda_sa.sa.sa_varda_vakajarjestaja s6 on s5.vakajarjestaja_id = s6.vakajarjestaja_id
	LEFT JOIN dw.d_sukupuoli d1 on d1.sukupuoli_koodi = s.sukupuoli_koodi
	LEFT JOIN dw.d_alueluokitus d2 on d2.kunta_koodi = s.kotikunta_koodi
	LEFT JOIN dw.d_varda_kielikoodistoopetushallinto d3 on d3.koodi = upper(s.aidinkieli_koodi)
	LEFT JOIN dw.d_varda_jarjestamismuoto d4 on d4.koodi = upper(s3.jarjestamismuoto_koodi)
	LEFT JOIN dw.d_kytkin d5 on d5.kytkin_koodi = replace(replace(s3.vuorohoito_kytkin,'f',0),'t',1)
	LEFT JOIN dw.d_varda_kytkin d6 on d6.kytkin_koodi = replace(replace(s3.kokopaivainen_vaka_kytkin,'f',0),'t',1) and d6.kytkin_luokka = 'vakapaatos_kokopaivainen_vaka'
	LEFT JOIN dw.d_varda_kytkin d7 on d7.kytkin_koodi = replace(replace(s3.paivittainen_vaka_kytkin,'f',0),'t',1) and d7.kytkin_luokka = 'vakapaatos_paivittainen_vaka'
	LEFT JOIN dw.d_kytkin d8 on d8.kytkin_koodi = replace(replace(s3.pikakasittely_kytkin,'f',0),'t',1)
	INNER JOIN dw.d_varda_yritysluokitus d9 on d9.koodi = s6.yritysmuoto
	OUTER APPLY (
		SELECT
			cast(max(case when jarjestys = 1 then cast(d0.koodi as int) else null end) as varchar) as max_tunti1,
			cast(max(case when jarjestys = 2 then cast(d0.koodi as int) else null end) as varchar) as max_tunti2,
			len(cast(max(case when jarjestys = 1 then cast(d0.koodi as int) else null end) as varchar)) as len_tunti1,
			len(cast(max(case when jarjestys = 2 then cast(d0.koodi as int) else null end) as varchar)) as len_tunti2
		FROM dw.d_varda_tuntimaara_asteikko d0
	)o1
	LEFT JOIN dw.d_varda_tuntimaara_asteikko d10 on d10.koodi = case when left(s3.tuntimaara_viikossa,o1.len_tunti1) = o1.max_tunti1 then cast(floor(s3.tuntimaara_viikossa) as int) when left(s3.tuntimaara_viikossa,o1.len_tunti2) = o1.max_tunti2 then cast(ceiling(s3.tuntimaara_viikossa) as int) else cast(round(s3.tuntimaara_viikossa,0) as int) end
	LEFT JOIN dw.d_ika d11 on d11.ika_avain = DATEDIFF(year,s.syntyma_pvm, cast(concat(@alkuVuosi,'-12-31') as date))
	WHERE 
	(s4.paattymis_pvm > s5.paattymis_pvm and s4.alkamis_pvm <= cast(concat(@alkuVuosi,'-12-31') as date) and s5.paattymis_pvm >= cast(concat(@alkuVuosi,'-12-31') as date))
	OR
	(s4.paattymis_pvm <= s5.paattymis_pvm and s4.alkamis_pvm <= cast(concat(@alkuVuosi,'-12-31') as date) and s4.paattymis_pvm >= cast(concat(@alkuVuosi,'-12-31') as date))
	
SET @alkuVuosi =  @alkuVuosi + 1

END






GO


