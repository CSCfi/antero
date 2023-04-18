USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_ainekelpoisuudet]    Script Date: 18.4.2023 15:35:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_ainekelpoisuudet] AS

--faktataulu
DROP TABLE IF EXISTS ANTERO.dw.f_virta_otp_ainekelpoisuudet

SELECT *
INTO #temp_ope_pat
FROM (
	SELECT p.*, rnk = row_number() over (partition by p.henkilo, p.aine, p.laajuus order by paivamaara_aine)
	FROM (
		SELECT DISTINCT
			pat.henkilo, 
			pat.paivamaara as paivamaara_aine, 
			pat.organisaatiokoodi as organisaatiokoodi_aine, 
			pat.patevyyskoodi,
			case 
				when d.patevyys_koodi ='ms' then 'Musiikkipedagogiikka' 
				when d.patevyys_koodi ='gf' then 'Teatteri- ja tanssipedagogiikka' 
				when (d.patevyys_fi like 'suomen%' and d.patevyys_fi not like '%äidinkieli%') or d.patevyys_fi like '%toinen kotimainen kieli suomi%' then 'Toinen kotimainen kieli suomi'
				when (d.patevyys_fi like 'ruotsin%' and d.patevyys_fi not like '%äidinkieli%') or d.patevyys_fi like '%toinen kotimainen kieli ruotsi%' then 'Toinen kotimainen kieli ruotsi' 
				else left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) 
			end as aine,
			coalesce(nullif(ltrim(rtrim(replace(reverse(substring(reverse(d.patevyys_fi),0,charindex(',',reverse(d.patevyys_fi)))),'op.',''))),''), 'Tieto puuttuu') as laajuus
		FROM ANTERO.sa.sa_virta_otp_ope_patevyydet pat
		LEFT JOIN ANTERO.dw.d_virta_patevyydet d on d.patevyys_koodi = pat.patevyyskoodi
		WHERE d.patevyysryhma1_fi = 'opettajaaineet'
	) p
) p
WHERE rnk = 1

SELECT 
	f.henkilo,
	f.kelpoisuuden_organisaatiokoodi,
	YEAR(f.kelpoisuuden_paivamaara) as kelpoisuuden_vuosi,
	f.aine, 
	f.laajuus,
	f.sukupuoli,
	YEAR(f.kelpoisuuden_paivamaara) - YEAR(f.syntymaaika) as ika, 
	kork_tutk.koulutuskoodi as korkeimman_tutkinnon_koulutuskoodi,
	kork_tutk.organisaatiokoodi as korkeimman_tutkinnon_organisaatiokoodi,
	aine_sektori,
	rnk = row_number() over (partition by f.henkilo, aine order by year(kelpoisuuden_paivamaara), laajuus_jarjestys)
INTO #temp_ope_pat2 
FROM (
	SELECT DISTINCT
		pat.henkilo, 
		ht.sukupuoli,
		ht.syntymaaika,
		pat.paivamaara_aine, 
		pat.organisaatiokoodi_aine, 
		pat2.paivamaara as paivamaara_ped, 
		pat2.organisaatiokoodi as organisaatiokoodi_ped, 
		pat.aine,
		pat.laajuus,
		case 
			when pat.laajuus = '120' then 1
			when pat.laajuus = '60' then 2
			when pat.laajuus = 'muu laajuus' then 3
			else 4
		end as laajuus_jarjestys,
		tut.suorituspaivamaara as paivamaara_tutkinto,
		kl.koulutusluokitus_koodi,
		case 
			when pat.paivamaara_aine >= tut.suorituspaivamaara and pat.paivamaara_aine >= pat2.paivamaara then pat.paivamaara_aine
			when pat2.paivamaara >= tut.suorituspaivamaara and pat2.paivamaara >= pat.paivamaara_aine then pat2.paivamaara
			when tut.suorituspaivamaara >= pat2.paivamaara and tut.suorituspaivamaara >= pat.paivamaara_aine then tut.suorituspaivamaara
		end as kelpoisuuden_paivamaara,
		pat.organisaatiokoodi_aine as kelpoisuuden_organisaatiokoodi,
		case when pat.patevyyskoodi in ('ms','gf') then 2 else 1 end as aine_sektori
	FROM #temp_ope_pat pat
	LEFT JOIN ANTERO.dw.d_virta_patevyydet d on d.patevyys_koodi = pat.patevyyskoodi
	INNER JOIN ANTERO.sa.sa_virta_otp_ope_patevyydet pat2 on pat.henkilo = pat2.henkilo and pat2.patevyyskoodi in ('ik', 'il', 'im','ja','jb','jc', 'ix', 'oa')
	INNER JOIN ANTERO.sa.sa_virta_otp_ope_tutkinnot tut on pat.henkilo = tut.henkilo
	LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = tut.koulutuskoodi
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus ol on ol.organisaatio_koodi = pat.organisaatiokoodi_aine
	LEFT JOIN ANTERO.sa.sa_virta_otp_ope_henkilotiedot ht on ht.henkilo = pat.henkilo
	WHERE (kl.koulutusaste2002_koodi in (72,81,82) or kl.koulutusastetaso2_koodi in (72,81,82)) and pat.patevyyskoodi not in ('ms', 'gf')

	UNION ALL

	SELECT DISTINCT
		pat.henkilo, 
		ht.sukupuoli,
		ht.syntymaaika,
		pat.paivamaara_aine, 
		pat.organisaatiokoodi_aine, 
		pat2.paivamaara as paivamaara_ped, 
		pat2.organisaatiokoodi as organisaatiokoodi_ped, 
		pat.aine,
		pat.laajuus,
		case 
			when pat.laajuus = '120' then 1
			when pat.laajuus = '60' then 2
			when pat.laajuus = 'muu laajuus' then 3
			else 4
		end as laajuus_jarjestys,
		tut.suorituspaivamaara as paivamaara_tutkinto,
		kl.koulutusluokitus_koodi,
		case 
			when pat.paivamaara_aine >= tut.suorituspaivamaara and pat.paivamaara_aine >= pat2.paivamaara then pat.paivamaara_aine
			when pat2.paivamaara > pat.paivamaara_aine and pat2.paivamaara >= tut.suorituspaivamaara then pat2.paivamaara
			else  tut.suorituspaivamaara
		end as kelpoisuuden_paivamaara,
		pat.organisaatiokoodi_aine as kelpoisuuden_organisaatiokoodi,
		2 as aine_sektori 
	FROM #temp_ope_pat pat
	LEFT JOIN ANTERO.dw.d_virta_patevyydet d on d.patevyys_koodi = pat.patevyyskoodi
	INNER JOIN ANTERO.sa.sa_virta_otp_ope_patevyydet pat2 on pat.henkilo = pat2.henkilo and pat2.patevyyskoodi in ('ik', 'il', 'im','ja','jb','jc', 'oa', 'ix')
	INNER JOIN ANTERO.sa.sa_virta_otp_ope_tutkinnot tut on pat.henkilo = tut.henkilo
	LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = tut.koulutuskoodi
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus ol on ol.organisaatio_koodi = pat.organisaatiokoodi_aine
	LEFT JOIN ANTERO.sa.sa_virta_otp_ope_henkilotiedot ht on ht.henkilo = pat.henkilo
	WHERE pat.patevyyskoodi in ('ms', 'gf') and (kl.koulutusaste2002_koodi in (62,63,71,72,81,82) or kl.koulutusastetaso2_koodi in (62,63,71,72,81,82))
) f
OUTER APPLY (
	SELECT
		q.suorituspaivamaara,
		q.koulutuskoodi,
		q.organisaatiokoodi
	FROM (
		SELECT
			tut2.suorituspaivamaara,
			tut2.koulutuskoodi,
			tut2.organisaatiokoodi as organisaatiokoodi,
			rnk = row_number() over (order by kl2.koulutusastetaso2_koodi desc, tut2.suorituspaivamaara desc)
		FROM [sa].[sa_virta_otp_ope_tutkinnot] tut2
		LEFT JOIN dw.d_koulutusluokitus kl2 on kl2.koulutusluokitus_koodi=tut2.koulutuskoodi
		WHERE tut2.suorituspaivamaara <= f.kelpoisuuden_paivamaara and tut2.henkilo=f.henkilo and (kl2.koulutusaste2002_koodi in (62,63,71,72,81,82) or kl2.koulutusastetaso2_koodi in (62,63,71,72,81,82))
	) q
	WHERE rnk=1
) kork_tutk 


SELECT 
	f.kelpoisuuden_vuosi,
	f.kelpoisuuden_vuosi2,
	f.kelpoisuuden_vuosi3,
	henkilo,
	f.laajuus,
	f.laajuus2,
	f.laajuus3,
	coalesce(d.id, -1) as d_ika_id,
	coalesce(d2.id, -1) as d_sukupuoli_id,
	coalesce(d3a.id, -1) as d_organisaatioluokitus_kelpoisuus_id,
	coalesce(d3b.id, -1) as d_organisaatioluokitus_kelpoisuus2_id,
	coalesce(d3c.id, -1) as d_organisaatioluokitus_kelpoisuus3_id,
	coalesce(d4.id, -1) as d_organisaatioluokitus_korkein_tutkinto_id,
	coalesce(d5.id, -1) as d_koulutusluokitus_korkein_tutkinto_id,
	d6a.id as d_ainekelpoisuus_id,
	d6b.id as d_ainekelpoisuus2_id,
	d6c.id as d_ainekelpoisuus3_id,
	f.aine_sektori

INTO ANTERO.dw.f_virta_otp_ainekelpoisuudet

FROM (
	SELECT
		p.kelpoisuuden_vuosi,
		p2.kelpoisuuden_vuosi as kelpoisuuden_vuosi2,
		p3.kelpoisuuden_vuosi as kelpoisuuden_vuosi3,
		 
		p.henkilo,
		p.ika,
		p.sukupuoli,

		p.kelpoisuuden_organisaatiokoodi,
		coalesce(p2.kelpoisuuden_organisaatiokoodi, '-1') as kelpoisuuden_organisaatiokoodi2,
		coalesce(p3.kelpoisuuden_organisaatiokoodi, '-1') as kelpoisuuden_organisaatiokoodi3,

		p.korkeimman_tutkinnon_koulutuskoodi,
		p.korkeimman_tutkinnon_organisaatiokoodi,
		p.aine,
		p2.aine	as aine2,
		p3.aine	as aine3,
		p.laajuus,
		coalesce(p2.laajuus, 'Tieto puuttuu') as laajuus2,
		coalesce(p3.laajuus, 'Tieto puuttuu') as laajuus3,
		p.aine_sektori
	FROM #temp_ope_pat2 p
	LEFT JOIN #temp_ope_pat2 p2 on p.henkilo = p2.henkilo and p.kelpoisuuden_vuosi >= p2.kelpoisuuden_vuosi and p.aine <> p2.aine 
	LEFT JOIN #temp_ope_pat2 p3 on p.henkilo = p3.henkilo and p.kelpoisuuden_vuosi >= p3.kelpoisuuden_vuosi and p.aine <> p3.aine and p2.kelpoisuuden_vuosi >= p3.kelpoisuuden_vuosi and p2.aine <> p3.aine and p2.aine is not null
	WHERE p.kelpoisuuden_vuosi > 2015 and p.rnk = 1 and (p2.rnk = 1 or p2.rnk is null) and (p3.rnk = 1 or p3.rnk is null)
) f 
LEFT JOIN ANTERO.dw.d_ika d on d.ika_avain = f.ika
LEFT JOIN ANTERO.dw.d_sukupuoli d2 on d2.sukupuoli_koodi = f.sukupuoli
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3a on d3a.organisaatio_koodi = f.kelpoisuuden_organisaatiokoodi
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3b on d3b.organisaatio_koodi = f.kelpoisuuden_organisaatiokoodi2
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3c on d3c.organisaatio_koodi = f.kelpoisuuden_organisaatiokoodi3
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi = f.korkeimman_tutkinnon_organisaatiokoodi
LEFT JOIN ANTERO.dw.d_koulutusluokitus d5 on d5.koulutusluokitus_koodi = f.korkeimman_tutkinnon_koulutuskoodi
LEFT JOIN ANTERO.dw.d_ainekelpoisuus d6a on d6a.aine_fi = f.aine
LEFT JOIN ANTERO.dw.d_ainekelpoisuus d6b on d6b.aine_fi = f.aine2
LEFT JOIN ANTERO.dw.d_ainekelpoisuus d6c on d6c.aine_fi = f.aine3


GO

USE [ANTERO]