USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_ainekelpoisuudet]    Script Date: 8.7.2022 11:06:07 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_virta_otp_ainekelpoisuudet]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_ainekelpoisuudet]    Script Date: 8.7.2022 11:06:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dw].[p_lataa_f_virta_otp_ainekelpoisuudet] AS

--faktataulu
DROP TABLE IF EXISTS ANTERO.dw.f_virta_otp_ainekelpoisuudet


SELECT 
	f.kelpoisuuden_vuosi,
	d.id as d_ika_id,
	d2.id as d_sukupuoli_id,
	d3.id as d_organisaatioluokitus_kelpoisuus_id,
	d4.id as d_organisaatioluokitus_korkein_tutkinto_id,
	d5.id as d_koulutusluokitus_korkein_tutkinto_id,
	d6.id as d_ainekelpoisuus_id,
	f.laajuus,
	sum(f.lkm) as lkm

INTO ANTERO.dw.f_virta_otp_ainekelpoisuudet

FROM (
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
		1 as lkm,
		rnk = row_number() over (partition by f.henkilo, aine order by kelpoisuuden_paivamaara) 
	FROM (
		SELECT DISTINCT
			pat.henkilo, 
			ht.sukupuoli,
			ht.syntymaaika,
			pat.paivamaara as paivamaara_aine, 
			pat.organisaatiokoodi as organisaatiokoodi_aine, 
			pat2.paivamaara as paivamaara_ped, 
			pat2.organisaatiokoodi as organisaatiokoodi_ped, 
			left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) as aine,
			coalesce(nullif(ltrim(rtrim(replace(reverse(substring(reverse(d.patevyys_fi),0,charindex(',',reverse(d.patevyys_fi)))),'op.',''))),''), 'Tieto puuttuuu') as laajuus,
			tut.suorituspaivamaara as paivamaara_tutkinto,
			kl.koulutusluokitus_koodi,
			case 
				when pat.paivamaara >= tut.suorituspaivamaara and pat.paivamaara >= pat2.paivamaara then pat.paivamaara
				when pat2.paivamaara >= tut.suorituspaivamaara and pat2.paivamaara >= pat.paivamaara then pat2.paivamaara
				when tut.suorituspaivamaara >= pat2.paivamaara and tut.suorituspaivamaara >= pat.paivamaara then tut.suorituspaivamaara
			end as kelpoisuuden_paivamaara,
			case
				when pat.paivamaara >= pat2.paivamaara then pat.organisaatiokoodi
				else pat2.organisaatiokoodi
			end as kelpoisuuden_organisaatiokoodi
		FROM ANTERO.sa.sa_virta_otp_ope_patevyydet pat
		LEFT JOIN ANTERO.dw.d_virta_patevyydet d on d.patevyys_koodi = pat.patevyyskoodi
		INNER JOIN ANTERO.sa.sa_virta_otp_ope_patevyydet pat2 on pat.henkilo = pat2.henkilo and pat2.patevyyskoodi in ('ik', 'il', 'im')
		INNER JOIN ANTERO.sa.sa_virta_otp_ope_tutkinnot tut on pat.henkilo = tut.henkilo
		LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = tut.koulutuskoodi
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus ol on ol.organisaatio_koodi = pat.organisaatiokoodi
		LEFT JOIN ANTERO.sa.sa_virta_otp_ope_henkilotiedot ht on ht.henkilo = pat.henkilo
		WHERE d.patevyysryhma1_fi = 'opettajaaineet' and (kl.koulutusaste2002_koodi in (72,81,82) or kl.koulutusastetaso2_koodi in (72,81,82)) and (pat.patevyyskoodi not in ('ms', 'gf') or ol.oppilaitostyyppi_koodi <> 41)

		UNION ALL

		SELECT DISTINCT
			pat.henkilo, 
			ht.sukupuoli,
			ht.syntymaaika,
			pat.paivamaara as paivamaara_aine, 
			pat.organisaatiokoodi as organisaatiokoodi_aine, 
			null as paivamaara_ped, 
			null as organisaatiokoodi_ped, 
			left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) as aine,
			coalesce(nullif(ltrim(rtrim(replace(reverse(substring(reverse(d.patevyys_fi),0,charindex(',',reverse(d.patevyys_fi)))),'op.',''))),''), 'Tieto puuttuuu') as laajuus,
			tut.suorituspaivamaara as paivamaara_tutkinto,
			kl.koulutusluokitus_koodi,
			case 
				when pat.paivamaara >= tut.suorituspaivamaara then pat.paivamaara
				else  tut.suorituspaivamaara
			end as kelpoisuuden_paivamaara,
			pat.organisaatiokoodi as kelpoisuuden_organisaatiokoodi
		FROM ANTERO.sa.sa_virta_otp_ope_patevyydet pat
		LEFT JOIN ANTERO.dw.d_virta_patevyydet d on d.patevyys_koodi = pat.patevyyskoodi
		INNER JOIN ANTERO.sa.sa_virta_otp_ope_tutkinnot tut on pat.henkilo = tut.henkilo
		LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = tut.koulutuskoodi
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus ol on ol.organisaatio_koodi = pat.organisaatiokoodi
		LEFT JOIN ANTERO.sa.sa_virta_otp_ope_henkilotiedot ht on ht.henkilo = pat.henkilo
		WHERE pat.patevyyskoodi in ('ms', 'gf') and ol.oppilaitostyyppi_koodi = 41 and (kl.koulutusaste2002_koodi in (62,63,71,72,81,82) or kl.koulutusastetaso2_koodi in (62,63,71,72,81,82))
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
) f 
LEFT JOIN ANTERO.dw.d_ika d on d.ika_avain = f.ika
LEFT JOIN ANTERO.dw.d_sukupuoli d2 on d2.sukupuoli_koodi = f.sukupuoli
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 on d3.organisaatio_koodi = f.kelpoisuuden_organisaatiokoodi
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi = f.korkeimman_tutkinnon_organisaatiokoodi
LEFT JOIN ANTERO.dw.d_koulutusluokitus d5 on d5.koulutusluokitus_koodi = f.korkeimman_tutkinnon_koulutuskoodi
LEFT JOIN ANTERO.dw.d_ainekelpoisuus d6 on d6.aine_fi = f.aine
WHERE f.rnk = 1 and f.kelpoisuuden_vuosi > 2015
GROUP BY f.kelpoisuuden_vuosi, d.id, d2.id, d3.id, d4.id, d5.id, d6.id, f.laajuus

GO

USE [ANTERO]