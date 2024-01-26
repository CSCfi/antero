USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_virta_opettajakelpoisuus]    Script Date: 21.9.2022 14:41:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_virta_opettajakelpoisuus] AS

DROP TABLE IF EXISTS sa.virta_opettajakelpoisuus

-- TEMP-tauluun kombinaatiot kelpoisuuskoodeista sekä kelpoisuuskoulujen korkeakoulu ja pvm
	select
		pat.henkilo,
		map.kelpoisuuskoodi as kelpoisuuskoodi1, 
		map2.kelpoisuuskoodi as kelpoisuuskoodi2,
		pat.paivamaara as pvm1,
		pat2.paivamaara as pvm2,
		pat.organisaatiokoodi as organisaatiokoodi1,
		pat2.organisaatiokoodi as organisaatiokoodi2,
		map3.kelpoisuuskoodi as kelpoisuuskoodi3,
		aine.patevyyskoodi as ainepatevyys,
		aine.organisaatiokoodi as aine_organisaatiokoodi,
		aine.paivamaara as aine_pvm,
		pat.patevyysnimi as nimi1,
		pat2.patevyysnimi as nimi2
	into #temp_ope_pat1
	from [sa].[sa_virta_otp_ope_patevyydet] pat
	left join [dw].[d_virta_patevyydet] d on d.patevyys_koodi = pat.patevyyskoodi
	left join [sa].[virta_opettajapatevyys_mappaus] map on map.patevyyskoodi = pat.patevyyskoodi
	left join (
		select henkilo, patevyyskoodi, patevyysnimi, organisaatiokoodi, paivamaara
		from [sa].[sa_virta_otp_ope_patevyydet] s
		left join [dw].[d_virta_patevyydet] d on d.patevyys_koodi = s.patevyyskoodi
		where d.patevyysryhma1_fi = 'opettaja'
	) pat2 on pat2.henkilo = pat.henkilo and pat2.patevyyskoodi <> pat.patevyyskoodi
	left join (
		select henkilo, patevyyskoodi , organisaatiokoodi, paivamaara
		from [sa].[sa_virta_otp_ope_patevyydet] s
		left join [dw].[d_virta_patevyydet] d on d.patevyys_koodi = s.patevyyskoodi
		where d.patevyysryhma1_fi = 'opettaja'
	) pat3 on pat3.henkilo = pat.henkilo and pat3.patevyyskoodi <> pat.patevyyskoodi and pat3.patevyyskoodi <> pat2.patevyyskoodi and (pat3.paivamaara <= pat.paivamaara or pat3.paivamaara <= pat2.paivamaara)
	left join (
		select henkilo, patevyyskoodi , organisaatiokoodi, paivamaara
		from [sa].[sa_virta_otp_ope_patevyydet] s
		left join [dw].[d_virta_patevyydet] d on d.patevyys_koodi = s.patevyyskoodi
		where d.patevyysryhma1_fi = 'opettajaaineet'
	) aine on aine.henkilo = pat.henkilo
	left join [sa].[virta_opettajapatevyys_mappaus] map2 on map2.patevyyskoodi = pat2.patevyyskoodi
	left join [sa].[virta_opettajapatevyys_mappaus] map3 on map3.patevyyskoodi = pat3.patevyyskoodi
	where d.patevyysryhma1_fi = 'opettaja'

	-- Toiseen temp-tauluun kelpoisuuskoodit jos tarvittavat kombinaatiot on suoritettu
	SELECT 
		f.henkilo, 
		f.kelpoisuus,
		f.organisaatiokoodi,
		YEAR(f.pvm) as vuosi,
		pvm,
		suoritustapa,
		rnk = row_number() over (
			partition by henkilo, case when kelpoisuus = 'LA' THEN 'AI' else kelpoisuus end
			order by pvm, pvm1, pvm2)
	into #temp_ope_pat2
	FROM (
		SELECT DISTINCT
			henkilo,
			CASE 
				WHEN kelpoisuuskoodi1 = 'OP' AND kelpoisuuskoodi2 in ('AI','JA','JB','JC') THEN 'OP'
				WHEN kelpoisuuskoodi1 = 'ER' AND kelpoisuuskoodi2 in ('AI','JA','JB','JC') THEN 'ER'
				WHEN kelpoisuuskoodi1 in ('AI','JA','JB','JC') AND ainepatevyys is not null AND ainepatevyys not in ('gf','ms') THEN 'AI'
				WHEN kelpoisuuskoodi1 = 'PE' AND kelpoisuuskoodi2 in ('AI','JA','JB','JC') THEN 'PE'
				WHEN kelpoisuuskoodi1 = 'EL' AND kelpoisuuskoodi2 = 'VA' THEN 'EL'
				WHEN kelpoisuuskoodi1 = 'VA' THEN 'VA'
				WHEN kelpoisuuskoodi1 = 'VS' THEN 'VS'
				WHEN kelpoisuuskoodi1 = 'IX' THEN 'IX'
				WHEN kelpoisuuskoodi1 = 'AI' AND ainepatevyys is null THEN 'PD'
			END as kelpoisuus,

			CASE 
				WHEN kelpoisuuskoodi1 = 'OP' AND kelpoisuuskoodi2 in ('AI','JA','JB','JC') THEN
					CASE WHEN pvm1 < pvm2 THEN pvm2 ELSE pvm1 END
				WHEN kelpoisuuskoodi1 = 'ER' AND kelpoisuuskoodi2 in ('AI','JA','JB','JC') THEN
					CASE WHEN pvm1 < pvm2 THEN pvm2 ELSE pvm1 END
				WHEN kelpoisuuskoodi1 in ('AI','JA','JB','JC') AND ainepatevyys is not null AND ainepatevyys not in ('gf','ms') THEN 
					CASE WHEN pvm1 < aine_pvm THEN aine_pvm ELSE pvm1 END
				WHEN kelpoisuuskoodi1 = 'PE' AND kelpoisuuskoodi2 in ('AI','JA','JB','JC') THEN
					CASE WHEN pvm1 < pvm2 THEN pvm2 ELSE pvm1 END
				WHEN kelpoisuuskoodi1 = 'EL' AND kelpoisuuskoodi2 = 'VA' THEN
					CASE WHEN pvm1 < pvm2 THEN pvm2 ELSE pvm1 END
				WHEN kelpoisuuskoodi1 = 'VA' THEN pvm1
				WHEN kelpoisuuskoodi1 = 'VS' THEN pvm1
				WHEN kelpoisuuskoodi1 = 'IX' THEN pvm1
				WHEN kelpoisuuskoodi1 = 'AI' AND ainepatevyys is null THEN pvm1
			END as pvm,
			CASE 
				WHEN kelpoisuuskoodi1 = 'OP' AND kelpoisuuskoodi2 in ('AI','JA','JB','JC') THEN
					CASE WHEN pvm1 < pvm2 THEN organisaatiokoodi2 ELSE organisaatiokoodi1 END
				WHEN kelpoisuuskoodi1 = 'ER' AND kelpoisuuskoodi2 in ('AI','JA','JB','JC') THEN
					CASE WHEN pvm1 < pvm2 THEN organisaatiokoodi2 ELSE organisaatiokoodi1 END 
				WHEN kelpoisuuskoodi1 in ('AI','JA','JB','JC') AND ainepatevyys is not null AND ainepatevyys not in ('gf','ms') THEN 
					CASE WHEN pvm1 < aine_pvm THEN aine_organisaatiokoodi ELSE organisaatiokoodi1 END
				WHEN kelpoisuuskoodi1 = 'PE' AND kelpoisuuskoodi2 in ('AI','JA','JB','JC') THEN
					CASE WHEN pvm1 < pvm2 THEN organisaatiokoodi2 ELSE organisaatiokoodi1 END
				WHEN kelpoisuuskoodi1 = 'EL' AND kelpoisuuskoodi2 = 'VA' THEN
					CASE WHEN pvm1 < pvm2 THEN organisaatiokoodi2 ELSE organisaatiokoodi1 END
				WHEN kelpoisuuskoodi1 = 'VA' THEN organisaatiokoodi1
				WHEN kelpoisuuskoodi1 = 'VS' THEN organisaatiokoodi1
				WHEN kelpoisuuskoodi1 = 'IX' THEN organisaatiokoodi1
				WHEN kelpoisuuskoodi1 = 'AI' AND ainepatevyys is null THEN organisaatiokoodi1
			END as organisaatiokoodi,
			pvm1,
			pvm2,
			CASE
				WHEN nimi1 like '%erilliset%' or  nimi2 like '%erilliset%' THEN 2
				ELSE 1
			END as suoritustapa
		FROM #temp_ope_pat1 
		
		UNION

		SELECT DISTINCT
			henkilo,
			'PD' as kelpoisuus,
			pvm1 as pvm,
			organisaatiokoodi1 as organisaatiokoodi,
			pvm1,
			pvm1,
			CASE
				WHEN nimi1 like '%erilliset%' THEN 2
				ELSE 1
			END as suoritustapa
		FROM #temp_ope_pat1
		WHERE kelpoisuuskoodi1 = 'AI' and ainepatevyys is not null and YEAR(aine_pvm) > YEAR(pvm1)

		UNION

		SELECT DISTINCT
			henkilo,
			kelpoisuuskoodi1 as kelpoisuus,
			pvm1 as pvm,
			organisaatiokoodi1 as organisaatiokoodi,
			pvm1,
			pvm1,
			CASE
				WHEN nimi1 like '%erilliset%' THEN 2
				ELSE 1
			END as suoritustapa
		FROM #temp_ope_pat1
		WHERE kelpoisuuskoodi1 in ('JA', 'JB', 'JC')
		
		UNION

		SELECT DISTINCT
			henkilo,
			'LA' as kelpoisuus,
			aine_pvm as pvm,
			aine_organisaatiokoodi as organisaatiokoodi,
			pvm1,
			pvm2,
			CASE
				WHEN nimi1 like '%erilliset%' THEN 2
				ELSE 1
			END as suoritustapa
		FROM #temp_ope_pat1
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d on d.organisaatio_koodi = #temp_ope_pat1.aine_organisaatiokoodi
		WHERE ainepatevyys in ('gf','ms')) f
	WHERE f.kelpoisuus is not null and henkilo is not null


SELECT 
	 p.henkilo
	,ika = kelp.vuosi-year(h.syntymaaika)
	,h.sukupuoli
	
	,kelpoisuus_koodi = p1.koodi
	,kelpoisuus_koodi_kaikki_kelpoisuusvuosi = kelp_s.kelp_kaikki
	,kelpoisuus_koodi_kaikki_myos_aiemmat_vuodet = kelp_sa.kelp_kaikki
	--
	,kelpoisuus_vuosi = kelp.vuosi
	,kelpoisuuden_organisaatiokoodi = p.organisaatiokoodi
	,korkeimman_tutkinnon_vuosi = kork_tutk.vuosi
	,korkeimman_tutkinnon_koulutuskoodi = kork_tutk.koulutuskoodi
	,korkeimman_tutkinnon_organisaatiokoodi = kork_tutk.organisaatio_koodi
	,sektori = ol.oppilaitostyyppi_koodi
	,vuosi_patevyys = p.vuosi
	,vuosi_tutkinto = tutk.vuosi
	,CASE
		WHEN p.suoritustapa = 1 THEN 1
		WHEN p.suoritustapa = 2 and kelp_sa.kelp_kaikki = kelp_s.kelp_kaikki THEN 2
		ELSE 3
	END as suoritustapa 
	,kelpoisuuksien_maara = kaikki_kelp.lkm
	,coalesce(ya.yli_asetuksen,0) as yli_asetuksen
	,rnk = row_number() over (
		partition by h.henkilo, p1.koodi 
		order by kelp.vuosi,p.vuosi
	)

INTO sa.virta_opettajakelpoisuus

FROM #temp_ope_pat2 p
left join dw.d_organisaatioluokitus ol on ol.organisaatio_koodi=p.organisaatiokoodi
left join sa.sa_virta_otp_ope_henkilotiedot h on h.henkilo=p.henkilo

--eka suoritusvuosi tutkintotyypeittäin
left join (
	select 
		henkilo
		,amk = min(case when kl.koulutusaste2002_koodi in (62,63,71,72,81,82) or kl.koulutusastetaso2_koodi in (62,63,71,72,81,82) then vuosi end)
		,alempi_kk = min(case when kl.koulutusaste2002_koodi in (63,72,81,82) or kl.koulutusastetaso2_koodi in (63,72,81,82) then vuosi end)
		,ylempi_kk = min(case when kl.koulutusaste2002_koodi in (72,81,82) or kl.koulutusastetaso2_koodi in (72,81,82) then vuosi end)
	from [sa].[sa_virta_otp_ope_tutkinnot] t
	left join dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi=t.koulutuskoodi
	where t.koulutuskoodi <> '999999'
	group by henkilo
) tutk_tyypit on tutk_tyypit.henkilo = p.henkilo

--eka vaadittava tutkinto
cross apply (
	select
		vuosi =
			case
				when kelpoisuus in ('JA','JB', 'JC', 'LA', 'VS') then tutk_tyypit.amk
				when kelpoisuus = 'VA' and ol.oppilaitostyyppi_koodi = 41 then tutk_tyypit.amk
				when kelpoisuus in ('VA','EL') then tutk_tyypit.alempi_kk
				else tutk_tyypit.ylempi_kk
			end		
) tutk

--kelpoisuusvuosi 
cross apply (
	select 
		vuosi = nullif(max(v), 9999)
	from (
		values (p.vuosi),(coalesce(tutk.vuosi, 9999))
	) AS value(v)
) kelp

--korkein tutkinto 
outer apply (
	select
		vuosi
		,koulutuskoodi
		,organisaatio_koodi
	from (
		select 
			vuosi,
			koulutuskoodi
			,t2.organisaatiokoodi as organisaatio_koodi
			,rnk = row_number() over (order by kl.koulutusastetaso2_koodi desc, t2.vuosi desc)
		from [sa].[sa_virta_otp_ope_tutkinnot] t2
		left join dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi=t2.koulutuskoodi
		where t2.vuosi <= kelp.vuosi and t2.henkilo=p.henkilo and (kl.koulutusaste2002_koodi in (62,63,71,72,81,82) or kl.koulutusastetaso2_koodi in (62,63,71,72,81,82))
	) q
	where rnk=1
) kork_tutk

--kelpoisuuksien määrä
cross apply (
	select
		lkm = 
			count(distinct p3.kelpoisuus)
	from #temp_ope_pat2 p3
	where p3.henkilo=p.henkilo
	and p3.vuosi <= kelp.vuosi
) kaikki_kelp

--HENKILÖN KAIKKI PÄTEVYYDET
--sama vuosi
OUTER APPLY (
	select
		kelp_kaikki = case when len(kelp_kaikki) = 0 then null else left(kelp_kaikki, len(kelp_kaikki)-1) end
	from (
		select distinct 
			kelp_kaikki = 
				concat(
					 case when max(op.aineenopettajan_pedagogiset) = 1 then 'AI_' end
					,case when max(op.luovien_alojen_opettaja) = 1 then 'LA_' end
					,case when max(op.ammatillinen_opettajakoulutus) = 1 then 'JA_' end
					,case when max(op.ammatillinen_erityisopettajakoulutus) = 1 then 'JB_' end
					,case when max(op.ammatillinen_opinto_ohjaajakoulutus) = 1 then 'JC_' end
					,case when max(op.ruotsinkielinen_ammatillinen_opettajankoulutus) = 1 then 'IX_' end
					,case when max(op.erityislastentarhanopettaja) = 1 then 'EL_' end
					,case when max(op.erityisopettaja) = 1 then 'ER_' end
					,case when max(op.opinto_ohjaaja) = 1 then 'OP_' end
					,case when max(op.monialaiset_opinnot) = 1 then 'PE_' end
					,case when max(op.varhaiskasvatuksen_ammatilliset_valmiudet) = 1 then 'VA_' end
					,case when max(op.opettajan_pedagogiset_opinnot) = 1 then 'PD_' end
					,case when max(op.varhaiskasvatuksen_sosionomi) = 1 then 'VS_' end
				)
		from #temp_ope_pat2 up2
		left join dw.d_organisaatioluokitus ol2 on ol2.organisaatio_koodi=up2.organisaatiokoodi
		left join dw.d_opettajapatevyys op on op.koodi = up2.kelpoisuus
		left join (
			select 
				henkilo
				,amk = min(case when kl.koulutusaste2002_koodi in (62,63,71,72,81,82) or kl.koulutusastetaso2_koodi in (62,63,71,72,81,82) then vuosi end)
				,alempi_kk = min(case when kl.koulutusaste2002_koodi in (63,72,81,82) or kl.koulutusastetaso2_koodi in (63,72,81,82) then vuosi end)
				,ylempi_kk = min(case when kl.koulutusaste2002_koodi in (72,81,82) or kl.koulutusastetaso2_koodi in (72,81,82) then vuosi end)
			from [sa].[sa_virta_otp_ope_tutkinnot] t
			left join dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi=t.koulutuskoodi
			group by henkilo
		) tutk_tyypit2 on tutk_tyypit2.henkilo = up2.henkilo
		cross apply (
			select
				vuosi =
					case
						when up2.kelpoisuus in ('JA','JB', 'JC', 'LA', 'VS') then tutk_tyypit2.amk
						when up2.kelpoisuus = 'VA' and ol2.oppilaitostyyppi_koodi = 41 then tutk_tyypit.amk
						when up2.kelpoisuus in ('VA','EL') then tutk_tyypit2.alempi_kk
						else tutk_tyypit2.ylempi_kk
					end		
		) tutk2
		cross apply (
			select 
				vuosi = nullif(max(v2), 9999)
			from (
				values (up2.vuosi),(coalesce(tutk2.vuosi, 9999))
			) AS value(v2)
		) kelp2
		where 1=1
		--and up2.patevyys_hyvaksytaan=1
		--and up2.opiskelijaavain=p.opiskelija_avain
		and up2.henkilo=p.henkilo
		and kelp2.vuosi = kelp.vuosi
		--group by cast(concat(up2.organisaatiokoodi,up2.opiskelijaavain) as varchar(50))
		
	) Q
) kelp_s 
--sama + aiemmat vuodet
OUTER APPLY (
	select
		kelp_kaikki = case when len(kelp_kaikki) = 0  then null else left(kelp_kaikki, len(kelp_kaikki)-1) end
	from (
		select distinct 
			kelp_kaikki = 
				concat(
					 case when max(op.aineenopettajan_pedagogiset) = 1 then 'AI_' end
					,case when max(op.luovien_alojen_opettaja) = 1 then 'LA_' end
					,case when max(op.ammatillinen_opettajakoulutus) = 1 then 'JA_' end
					,case when max(op.ammatillinen_erityisopettajakoulutus) = 1 then 'JB_' end
					,case when max(op.ammatillinen_opinto_ohjaajakoulutus) = 1 then 'JC_' end
					,case when max(op.ruotsinkielinen_ammatillinen_opettajankoulutus) = 1 then 'IX_' end
					,case when max(op.erityislastentarhanopettaja) = 1 then 'EL_' end
					,case when max(op.erityisopettaja) = 1 then 'ER_' end
					,case when max(op.opinto_ohjaaja) = 1 then 'OP_' end
					,case when max(op.monialaiset_opinnot) = 1 then 'PE_' end
					,case when max(op.varhaiskasvatuksen_ammatilliset_valmiudet) = 1 then 'VA_' end
					,case when max(op.opettajan_pedagogiset_opinnot) = 1 then 'PD_' end
					,case when max(op.varhaiskasvatuksen_sosionomi) = 1 then 'VS_' end
				)
		from #temp_ope_pat2 up2
		left join dw.d_organisaatioluokitus ol2 on ol2.organisaatio_koodi=up2.organisaatiokoodi
		left join dw.d_opettajapatevyys op on op.koodi = up2.kelpoisuus
		left join (
			select 
				henkilo
				,amk = min(case when kl.koulutusaste2002_koodi in (62,63,71,72,81,82) or kl.koulutusastetaso2_koodi in (62,63,71,72,81,82) then vuosi end)
				,alempi_kk = min(case when kl.koulutusaste2002_koodi in (63,72,81,82) or kl.koulutusastetaso2_koodi in (63,72,81,82) then vuosi end)
				,ylempi_kk = min(case when kl.koulutusaste2002_koodi in (72,81,82) or kl.koulutusastetaso2_koodi in (72,81,82) then vuosi end)
			from [sa].[sa_virta_otp_ope_tutkinnot] t
			left join dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi=t.koulutuskoodi
			where t.koulutuskoodi <> '999999'
			group by henkilo
		) tutk_tyypit2 on tutk_tyypit2.henkilo = up2.henkilo
		cross apply (
			select
				vuosi =
					case
						when up2.kelpoisuus in ('JA','JB', 'JC', 'LA', 'VS') then tutk_tyypit2.amk
						when up2.kelpoisuus = 'VA' and ol2.oppilaitostyyppi_koodi = 41 then tutk_tyypit.amk
						when up2.kelpoisuus in ('VA','EL') then tutk_tyypit2.alempi_kk
						else tutk_tyypit2.ylempi_kk
					end	
		) tutk2
		cross apply (
			select 
				vuosi = nullif(max(v2), 9999)
			from (
				values (up2.vuosi),(coalesce(tutk2.vuosi, 9999))
			) AS value(v2)
		) kelp2
		where 1=1
		--and up2.patevyys_hyvaksytaan=1
		--and up2.opiskelijaavain=p.opiskelija_avain
		and up2.henkilo=p.henkilo
		and kelp.vuosi >= kelp2.vuosi
		--group by cast(concat(up2.organisaatiokoodi,up2.opiskelijaavain) as varchar(50))
	) Q
) kelp_sa

--kelpoisuuksien priorisointi
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

OUTER APPLY (
	Select
		CASE 
			WHEN p1.koodi = 'VA_PE' THEN REPLACE((SUBSTRING((SELECT '_' + patevyyskoodi AS 'data()' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in ('VA','PE','AI','JA','JB','JC') FOR XML PATH('')  ), 2 , 9999)),' ', '')
			WHEN p1.koodi = 'AI_PE' THEN REPLACE((SUBSTRING((SELECT '_' + patevyyskoodi AS 'data()' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in ('PE','AI','JA','JB','JC') FOR XML PATH('')  ), 2 , 9999)),' ', '')
			WHEN p1.koodi = 'ER_PE' THEN REPLACE((SUBSTRING((SELECT '_' + patevyyskoodi AS 'data()' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in ('PE','AI','ER','JA','JB','JC') FOR XML PATH('')  ), 2 , 9999)),' ', '')
			WHEN p1.koodi = 'EL' THEN REPLACE((SUBSTRING((SELECT '_' + patevyyskoodi AS 'data()' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in ('EL','VA') FOR XML PATH('')  ), 2 , 9999)),' ', '')
			WHEN p1.koodi = 'OP' THEN REPLACE((SUBSTRING((SELECT '_' + patevyyskoodi AS 'data()' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in ('OP','AI','JA','JB','JC') FOR XML PATH('')  ), 2 , 9999)),' ', '')
			WHEN p1.koodi = 'ER' THEN REPLACE((SUBSTRING((SELECT '_' + patevyyskoodi AS 'data()' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in ('ER','AI','JA','JB','JC') FOR XML PATH('')  ), 2 , 9999)),' ', '')
			WHEN p1.koodi = 'PE' THEN REPLACE((SUBSTRING((SELECT '_' + patevyyskoodi AS 'data()' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in ('PE','AI','JA','JB','JC') FOR XML PATH('')  ), 2 , 9999)),' ', '')
			WHEN p1.koodi = 'AI' THEN REPLACE((SUBSTRING((SELECT '_' + patevyyskoodi AS 'data()' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in ('PE','AI','ER','OP','JA','JB','JC') FOR XML PATH('')  ), 2 , 9999)),' ', '')
			WHEN p1.koodi in('PD', 'LA') THEN REPLACE((SUBSTRING((SELECT '_' + patevyyskoodi AS 'data()' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in ('VA','PE','AI','ER','OP','JA','JB','JC') FOR XML PATH('')  ), 2 , 9999)),' ', '')
			ELSE REPLACE((SUBSTRING((SELECT '_' + patevyyskoodi AS 'data()' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi = p1.koodi FOR XML PATH('')  ), 2 , 9999)),' ', '')
		END as patevyyskoodit
) pat_koodit

OUTER APPLY (
	SELECT MAX(f.yli_asetuksen) as yli_asetuksen
	FROM (
		SELECT
			CASE 
				WHEN pat_koodit.patevyyskoodit not like concat('%',ya_pat.patevyyskoodi, '%') THEN 1
				ELSE 0 
			END as yli_asetuksen
		FROM ANTERO.sa.sa_virta_otp_ope_patevyydet ya_pat
		LEFT JOIN ANTERO.dw.d_virta_patevyydet d on d.patevyys_koodi = ya_pat.patevyyskoodi
		WHERE d.patevyysryhma1_fi = 'opettaja' and ya_pat.henkilo = p.henkilo and ya_pat.vuosi <= kelp.vuosi
	) f
) ya

WHERE 1=1 and p.rnk = 1 and p1.koodi is not null and p1.koodi like concat('%', p.kelpoisuus, '%')


GO

USE [ANTERO]