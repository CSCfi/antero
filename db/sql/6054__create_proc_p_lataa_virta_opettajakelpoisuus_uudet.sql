USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_virta_opettajakelpoisuus_uudet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_virta_opettajakelpoisuus_uudet] AS' 
END
GO

ALTER PROCEDURE [sa].[p_lataa_virta_opettajakelpoisuus_uudet]  AS


DROP TABLE IF EXISTS sa.virta_opettajakelpoisuus_uudet

SELECT --TOP 1000
	vuosi
	,up.opiskelija_avain_org
	,up.opiskelija_avain
	,[sukupuoli_koodi] = sukupuolikoodi
	,[ika]
	,up.organisaatio_fi
	,[organisaatio_koodi] = organisaatiokoodi
	,[patevyys_nro]
	,[patevyys_koodi]
	,kelpoisuus_koodi = map.kelpoisuuskoodi
	,kelpoisuus_priorisoitu = p1.koodi
	,kelpoisuus_koodi_kaikki = kelp_s.kelp_kaikki
	,kelpoisuus_koodi_kaikki_myos_aiemmat = kelp_sa.kelp_kaikki
	,[patevyys_selite]
	,[patevyys_vuosi]
	,[patevyys_oppilaitos]
	,ainekelpoisuuksien_maara = kelp_aine.ainekelp_lkm
	,korkein_tutkinto = tutk.[tutkinto_koodi]
	,korkein_tutkinto_vuosi = tutk.[tutkinto_vuosi]
	,korkein_tutkinto_oppilaitos = tutk.[tutkinto_oppilaitos]
	,[suoritustapa] = case when [tutkinnon_yhteydessa]=1 then 1 when rnk_patevyys=1 then 2 else 3 end
	,tutkinto_suoritettu = tutk_suoritettu.totuusarvo
	,pedagoginen_suoritettu = case when pedag.pedag_vuosi is not null then 1 else 0 end
	,pedagoginen_vuosi = pedag.pedag_vuosi
	,patevyys_hyvaksytaan
	,patevyys_ryhma = patevyysryhma1_fi
	,laajuus =
		case
			when ainepatevyys.op='120' and aiempi60.suoritettu=1 then '120 (suorittanut aiemmin 60)'
			else cast(ainepatevyys.op as varchar(10))
		end
	,rnk_kelpoisuusryhma = row_number() over (
		partition by up.opiskelija_avain, (case when up.patevyysryhma1_fi='opettaja' then p1.koodi else up.patevyys_selite end) 
		order by tutk_suoritettu.totuusarvo desc, (case when up.patevyysryhma1_fi='opettajaaineet' then case when pedag.pedag_vuosi is not null then 1 else 0 end end) desc, up.patevyys_vuosi desc, up.vuosi
	)

INTO sa.virta_opettajakelpoisuus_uudet	

FROM [sa].[virta_otp_opettajapatevyydet_unpivot] up
LEFT JOIN dw.d_organisaatioluokitus ol on ol.organisaatio_koodi=up.organisaatiokoodi

--kelpoisuuskoodi
LEFT JOIN sa.virta_opettajapatevyys_mappaus map on map.patevyyskoodi=up.patevyys_koodi

--aine ja laajuus
CROSS APPLY (
 SELECT
	aine = LEFT(up.patevyys_selite,LEN(up.patevyys_selite)-CHARINDEX(',',REVERSE(up.patevyys_selite)))
	,op = LTRIM(RTRIM(REPLACE(REVERSE(SUBSTRING(REVERSE(up.patevyys_selite),0,CHARINDEX(',',REVERSE(up.patevyys_selite)))),'op.','')))
) ainepatevyys

--aiemmin suoritettu 60op pätevyys samasta aineesta
OUTER APPLY (
	SELECT
		suoritettu = 1
	FROM [sa].[virta_otp_opettajapatevyydet_unpivot] up4
	WHERE up4.patevyysryhma1_fi='opettajaaineet' and up4.vuosi<up.vuosi and up4.opiskelija_avain_org=up.opiskelija_avain_org
	and COALESCE(NULLIF(LTRIM(RTRIM(REPLACE(REVERSE(SUBSTRING(REVERSE(up4.patevyys_selite),0,CHARINDEX(',',REVERSE(up4.patevyys_selite)))),'op.',''))),'muu laajuus'),0)=60
	and LEFT(up4.patevyys_selite,LEN(up4.patevyys_selite)-CHARINDEX(',',REVERSE(up4.patevyys_selite)))=ainepatevyys.aine
) aiempi60

--opiskelijan ainepätevyyksien määrä
OUTER APPLY (	
	SELECT
		ainekelp_lkm = count(distinct LEFT(patevyys_selite,LEN(patevyys_selite)-CHARINDEX(',',REVERSE(patevyys_selite))))
	FROM [sa].[virta_otp_opettajapatevyydet_unpivot] up3
	WHERE up3.patevyysryhma1_fi='opettajaaineet' and up3.vuosi <= up.vuosi and up3.opiskelija_avain_org=up.opiskelija_avain_org
) kelp_aine

--korkein tutkinto
OUTER APPLY (
	SELECT top 1
		opiskelija_avain_org
		,tutkinto_koodi
		,tutkinto_vuosi
		,tutkinto_oppilaitos
		,alempi_kk = case when koulutusastetaso2_koodi = 63 then 1 else 0 end
		,ylempi_kk = case when koulutusastetaso2_koodi >= 72 then 1 else 0 end
		,amk = case when koulutusastetaso2_koodi in (62,71) then 1 else 0 end
	FROM [sa].[virta_otp_opettajapatevyydet_unpivot]
	LEFT JOIN dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = tutkinto_koodi
	WHERE tutkinto_vuosi <= up.vuosi and opiskelija_avain_org = up.opiskelija_avain_org
	ORDER BY kl.koulutusastetaso2_koodi desc, tutkinto_vuosi desc, tutkinto_koodi
) tutk 

--pedagogiset
OUTER APPLY (
	SELECT 
		pedag_vuosi = min(patevyys_vuosi)
	FROM sa.virta_otp_opettajapatevyydet_unpivot v
	WHERE v.patevyys_selite like '%pedagogiset%' and v.patevyys_vuosi <= up.vuosi and v.opiskelija_avain_org = up.opiskelija_avain_org
	GROUP BY opiskelija_avain_org
) pedag 

--suorittanut tarvittavan tutkinnon
CROSS APPLY (
	SELECT
		totuusarvo = case when tutk.ylempi_kk=1 or (tutk.alempi_kk=1 and map.kelpoisuuskoodi='VA') or (tutk.amk=1 and up.patevyysryhma1_fi='opettajaaineet' and ol.oppilaitostyyppi_koodi='41') then 1 else 0 end
) tutk_suoritettu

--OPISKELIJAN KAIKKI PÄTEVYYDET
--opiskelijan kaikki pätevyydet, sama vuosi
OUTER APPLY (
	SELECT
		kelp_kaikki = left(kelp_kaikki, len(kelp_kaikki)-1)
	FROM (
		SELECT distinct 
			--opiskelija_avain_org
			kelp_kaikki = 
				CONCAT(
					 CASE WHEN MAX(op.aineenopettajan_pedagogiset) = 1 AND kelp_aine.ainekelp_lkm > 0 THEN 'AI_' ELSE '' END
					,CASE WHEN MAX(op.ammatillinen_opettajakoulutus) = 1 THEN 'JA_' ELSE '' END
					,CASE WHEN MAX(op.ammatillinen_erityisopettajakoulutus) = 1 THEN 'JB_' ELSE '' END
					,CASE WHEN MAX(op.ammatillinen_opinto_ohjaajakoulutus) = 1 THEN 'JC_' ELSE '' END
					,CASE WHEN MAX(op.ruotsinkielinen_ammatillinen_opettajankoulutus) = 1 THEN 'IX_' ELSE '' END
					,CASE WHEN MAX(op.erityislastentarhanopettaja) = 1 THEN 'EL_' ELSE '' END
					,CASE WHEN MAX(op.erityisopettaja) = 1 THEN 'ER_' ELSE '' END
					,CASE WHEN MAX(op.opinto_ohjaaja) = 1 THEN 'OP_' ELSE '' END
					,CASE WHEN MAX(op.monialaiset_opinnot) = 1 THEN 'PE_' ELSE '' END
					,CASE WHEN MAX(op.varhaiskasvatuksen_ammatilliset_valmiudet) = 1 THEN 'VA_' ELSE '' END
				)
		FROM [sa].[virta_otp_opettajapatevyydet_unpivot] up2
		LEFT JOIN sa.virta_opettajapatevyys_mappaus map on map.patevyyskoodi=up2.patevyys_koodi
		LEFT JOIN dw.d_opettajapatevyys op on op.koodi=map.kelpoisuuskoodi
		WHERE 1=1
		and up2.patevyysryhma1_koodi='AAA'
		and up2.patevyys_hyvaksytaan=1
		and up2.patevyysryhma1_koodi=up.patevyysryhma1_koodi
		and up2.opiskelija_avain_org=up.opiskelija_avain_org
		and up2.vuosi = up.vuosi
		GROUP BY opiskelija_avain_org
	) Q
	WHERE len(kelp_kaikki)>1
) kelp_s --on kelp.opiskelija_avain_org=up.opiskelija_avain_org and up.patevyysryhma1_koodi='AAA'

--opiskelijan kaikki pätevyydet, sama + aiemmat vuodet
OUTER APPLY (
	SELECT
		kelp_kaikki = left(kelp_kaikki, len(kelp_kaikki)-1)
	FROM (
		SELECT distinct 
			--opiskelija_avain_org
			kelp_kaikki = 
				CONCAT(
					 CASE WHEN MAX(op.aineenopettajan_pedagogiset) = 1 AND kelp_aine.ainekelp_lkm > 0 THEN 'AI_' ELSE '' END
					,CASE WHEN MAX(op.ammatillinen_opettajakoulutus) = 1 THEN 'JA_' ELSE '' END
					,CASE WHEN MAX(op.ammatillinen_erityisopettajakoulutus) = 1 THEN 'JB_' ELSE '' END
					,CASE WHEN MAX(op.ammatillinen_opinto_ohjaajakoulutus) = 1 THEN 'JC_' ELSE '' END
					,CASE WHEN MAX(op.ruotsinkielinen_ammatillinen_opettajankoulutus) = 1 THEN 'IX_' ELSE '' END
					,CASE WHEN MAX(op.erityislastentarhanopettaja) = 1 THEN 'EL_' ELSE '' END
					,CASE WHEN MAX(op.erityisopettaja) = 1 THEN 'ER_' ELSE '' END
					,CASE WHEN MAX(op.opinto_ohjaaja) = 1 THEN 'OP_' ELSE '' END
					,CASE WHEN MAX(op.monialaiset_opinnot) = 1 THEN 'PE_' ELSE '' END
					,CASE WHEN MAX(op.varhaiskasvatuksen_ammatilliset_valmiudet) = 1 THEN 'VA_' ELSE '' END
				)
		FROM [sa].[virta_otp_opettajapatevyydet_unpivot] up2
		LEFT JOIN sa.virta_opettajapatevyys_mappaus map on map.patevyyskoodi=up2.patevyys_koodi
		LEFT JOIN dw.d_opettajapatevyys op on op.koodi=map.kelpoisuuskoodi
		WHERE 1=1
		and up2.patevyysryhma1_koodi='AAA'
		and up2.patevyys_hyvaksytaan=1
		and up2.patevyysryhma1_koodi=up.patevyysryhma1_koodi
		and up2.opiskelija_avain_org=up.opiskelija_avain_org
		and up2.vuosi <= up.vuosi
		GROUP BY opiskelija_avain_org
	) Q
	WHERE len(kelp_kaikki)>1
) kelp_sa

--KELPOISUUKSIEN PRIORISOINTI
--kombinaatiot (osa kombinaatioon kuuluvista pätevyyksistä voi olla suoritettu aiempana vuonna)
OUTER APPLY (
	select top 1 
		koodi
	from sa.virta_opettajakelpoisuus_priorisointi p 
	cross apply (
		select
			eka = left(koodi,2)
			,toka = nullif(substring(koodi, 4, 2),'')
			,kolmas = nullif(substring(koodi, 7, 2),'')
			,neljas = nullif(substring(koodi, 10, 2),'')
	) ca
	where 1=1
	and kelp_sa.kelp_kaikki like concat('%',ca.eka,'%')
	and kelp_sa.kelp_kaikki like concat('%',ca.toka,'%')
	and kelp_sa.kelp_kaikki like concat('%',ca.kolmas,'%')
	and kelp_sa.kelp_kaikki like concat('%',ca.neljas,'%')
	and (
		kelp_s.kelp_kaikki like concat('%',ca.eka,'%')
		or kelp_s.kelp_kaikki like concat('%',coalesce(ca.toka,'ÖÖ'),'%')
		or kelp_s.kelp_kaikki like concat('%',coalesce(ca.kolmas,'ÖÖ'),'%')
		or kelp_s.kelp_kaikki like concat('%',coalesce(ca.neljas,'ÖÖ'),'%')
	)
	order by sija
) p1


WHERE 1=1

END

GO

USE [ANTERO]