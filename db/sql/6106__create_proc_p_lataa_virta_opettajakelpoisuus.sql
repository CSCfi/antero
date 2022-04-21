USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_virta_opettajakelpoisuus_uudet_uusi_testi]    Script Date: 21.4.2022 11:11:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [sa].[p_lataa_virta_opettajakelpoisuus] AS

DROP TABLE IF EXISTS sa.virta_opettajakelpoisuus

--;WITH pat as (
	select
		vuosi
		,henkilo
		,opiskelija_avain = pat.opiskelijaavain 
		,opiskelija_avain_org = concat(pat.organisaatiokoodi,pat.opiskelijaavain) 
		,kk
		,organisaatiokoodi
		,pat.patevyyskoodi
		,patevyysnimi
		,aine = LEFT(patevyysnimi,len(patevyysnimi)-charindex(',',reverse(patevyysnimi)))
		,laajuus = ltrim(rtrim(replace(reverse(SUBSTRING(reverse(patevyysnimi),0,charindex(',',reverse(patevyysnimi)))),'op.','')))
		,map.kelpoisuuskoodi
		,patevyysryhma = vp.patevyysryhma1_fi
	into #temp_ope_pat
	from [sa].[sa_virta_otp_ope_patevyydet] pat
	left join dw.d_virta_patevyydet vp on vp.patevyys_koodi=pat.patevyyskoodi
	left join sa.virta_opettajapatevyys_mappaus map on map.patevyyskoodi=pat.patevyyskoodi
	left join dw.d_organisaatioluokitus ol on ol.organisaatio_koodi = pat.organisaatiokoodi
	where not (ol.oppilaitostyyppi_koodi=41 and pat.patevyyskoodi in ('ik','il','im','ip','in','io','iu','is','it','ir'))
--)

SELECT 
	 p.henkilo
	,p.opiskelija_avain_org
	,ika = kelp.vuosi-year(h.syntymaaika)
	,h.sukupuoli
	--
	,p.patevyyskoodi
	,p.patevyysnimi
	,kelpoisuus_koodi = p1.koodi
	,kelpoisuus_koodi_kaikki_kelpoisuusvuosi = kelp_s.kelp_kaikki
	,kelpoisuus_koodi_kaikki_myos_aiemmat_vuodet = kelp_sa.kelp_kaikki
	--
	,kelpoisuus_vuosi = kelp.vuosi
	,kelpoisuuden_kk = p.kk
	,kelpoisuuden_organisaatiokoodi = p.organisaatiokoodi
	,korkeimman_tutkinnon_vuosi = kork_tutk.vuosi
	,korkeimman_tutkinnon_koulutuskoodi = kork_tutk.koulutuskoodi
	,korkeimman_tutkinnon_organisaatiokoodi = kork_tutk.organisaatio_koodi
	,sektori = ol.oppilaitostyyppi_koodi
	,vuosi_patevyys = p.vuosi
	,vuosi_pedagogiset = pedag.vuosi
	,vuosi_tutkinto = tutk.vuosi
	,suoritustapa = case when p.patevyysnimi like '%erilliset%' then 2 else 1 end
	,kelpoisuuksien_maara = kaikki_kelp.lkm
	,aine
	,laajuus =
		case
			when p.laajuus='120' and aiempi60.suoritettu=1 then '120 (suorittanut aiemmin 60)'
			else p.laajuus
		end
	,p.patevyysryhma
	--tämä hidastaa merkittävästi:
	,rnk = row_number() over (
		partition by concat(coalesce(h.henkilo, h.opiskelijaavain) ,h.organisaatiokoodi), (case when p.patevyysryhma='AAA' then p1.koodi else p.patevyysnimi end) 
		order by kelp.vuosi
	)

INTO sa.virta_opettajakelpoisuus

FROM #temp_ope_pat p
left join dw.d_organisaatioluokitus ol on ol.organisaatio_koodi=p.organisaatiokoodi
left join sa.sa_virta_otp_ope_henkilotiedot h on h.henkilo=p.henkilo and h.opiskelijaavain=p.opiskelija_avain

--eka suoritusvuosi tutkintotyypeittäin
left join (
	select 
		henkilo
		,amk = min(case when kl.koulutusastetaso2_koodi >= 62 then vuosi end)
		,alempi_kk = min(case when kl.koulutusastetaso2_koodi >= 63 then vuosi end)
		,ylempi_kk = min(case when kl.koulutusastetaso2_koodi >= 72 then vuosi end)
	from [sa].[sa_virta_otp_ope_tutkinnot] t
	left join dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi=t.koulutuskoodi
	group by henkilo
) tutk_tyypit on tutk_tyypit.henkilo = p.henkilo

--eka vaadittava tutkinto
cross apply (
	select
		vuosi =
			case 
				when p.patevyysryhma='opettaja' then 
					case
						when kelpoisuuskoodi='VA' then tutk_tyypit.alempi_kk
						else tutk_tyypit.ylempi_kk
					end
				when p.patevyysryhma='opettajaaineet' then 
					case
						when ol.oppilaitostyyppi_koodi='41' then tutk_tyypit.amk
						else tutk_tyypit.ylempi_kk
					end
			end		
) tutk

--eka pedagoginen (ainepätevyys)
left join (
	select 
		henkilo
		,vuosi = min(vuosi)
	from [sa].[sa_virta_otp_ope_patevyydet]
	where patevyysnimi LIKE '%pedagogiset%'
	group by henkilo
) pedag on pedag.henkilo = p.henkilo and p.patevyysryhma='opettajaaineet'

--kelpoisuusvuosi 
cross apply (
	select 
		vuosi = nullif(max(v), 9999)
	from (
		values (p.vuosi),(coalesce(tutk.vuosi, 9999)),(case when p.patevyysryhma='opettajaaineet' then coalesce(pedag.vuosi, 9999) end)
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
			,organisaatio_koodi
			,rnk = row_number() over (order by kl.koulutusastetaso2_koodi desc, t2.vuosi desc)
		from [sa].[sa_virta_otp_ope_tutkinnot] t2
		left join dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi=t2.koulutuskoodi
		where t2.vuosi <= kelp.vuosi and t2.henkilo=p.henkilo
	) q
	where rnk=1
) kork_tutk

--kelpoisuuksien määrä
cross apply (
	select
		lkm = 
			count(distinct
				case 
					when p3.patevyysryhma='opettaja' then p3.kelpoisuuskoodi
					when p3.patevyysryhma='opettajaaineet' then p3.aine
				end
			)
	from #temp_ope_pat p3
	where p3.henkilo=p.henkilo 
	and p3.patevyysryhma=p.patevyysryhma
	and p3.vuosi <= kelp.vuosi
) kaikki_kelp

--aiemmin suoritettu 60op pätevyys samasta aineesta
outer apply (
	select
		suoritettu = 1
	from #temp_ope_pat pat4
	where pat4.patevyysryhma='opettajaaineet' and pat4.vuosi < p.vuosi and pat4.henkilo=p.henkilo
	and pat4.laajuus='60'
	and pat4.aine=p.aine
) aiempi60

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
					,case when max(op.ammatillinen_opettajakoulutus) = 1 then 'JA_' end
					,case when max(op.ammatillinen_erityisopettajakoulutus) = 1 then 'JB_' end
					,case when max(op.ammatillinen_opinto_ohjaajakoulutus) = 1 then 'JC_' end
					,case when max(op.ruotsinkielinen_ammatillinen_opettajankoulutus) = 1 then 'IX_' end
					,case when max(op.erityislastentarhanopettaja) = 1 then 'EL_' end
					,case when max(op.erityisopettaja) = 1 then 'ER_' end
					,case when max(op.opinto_ohjaaja) = 1 then 'OP_' end
					,case when max(op.monialaiset_opinnot) = 1 then 'PE_' end
					,case when max(op.varhaiskasvatuksen_ammatilliset_valmiudet) = 1 then 'VA_' end
				)
		from [sa].[sa_virta_otp_ope_patevyydet] up2
		left join dw.d_virta_patevyydet vp on vp.patevyys_koodi = up2.patevyyskoodi
		left join sa.virta_opettajapatevyys_mappaus map on map.patevyyskoodi = up2.patevyyskoodi
		left join dw.d_opettajapatevyys op on op.koodi = map.kelpoisuuskoodi
		where 1=1
		and vp.patevyysryhma1_koodi='AAA'
		--and up2.patevyys_hyvaksytaan=1
		and vp.patevyysryhma1_fi=p.patevyysryhma
		--and up2.opiskelijaavain=p.opiskelija_avain
		and concat(up2.organisaatiokoodi,up2.opiskelijaavain)=p.opiskelija_avain_org
		and up2.vuosi = p.vuosi
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
					,case when max(op.ammatillinen_opettajakoulutus) = 1 then 'JA_' end
					,case when max(op.ammatillinen_erityisopettajakoulutus) = 1 then 'JB_' end
					,case when max(op.ammatillinen_opinto_ohjaajakoulutus) = 1 then 'JC_' end
					,case when max(op.ruotsinkielinen_ammatillinen_opettajankoulutus) = 1 then 'IX_' end
					,case when max(op.erityislastentarhanopettaja) = 1 then 'EL_' end
					,case when max(op.erityisopettaja) = 1 then 'ER_' end
					,case when max(op.opinto_ohjaaja) = 1 then 'OP_' end
					,case when max(op.monialaiset_opinnot) = 1 then 'PE_' end
					,case when max(op.varhaiskasvatuksen_ammatilliset_valmiudet) = 1 then 'VA_' end
				)
		from [sa].[sa_virta_otp_ope_patevyydet] up2
		left join dw.d_virta_patevyydet vp on vp.patevyys_koodi = up2.patevyyskoodi
		left join sa.virta_opettajapatevyys_mappaus map on map.patevyyskoodi = up2.patevyyskoodi
		left join dw.d_opettajapatevyys op on op.koodi = map.kelpoisuuskoodi
		where 1=1
		and vp.patevyysryhma1_koodi='AAA'
		--and up2.patevyys_hyvaksytaan=1
		and vp.patevyysryhma1_fi=p.patevyysryhma
		--and up2.opiskelijaavain=p.opiskelija_avain
		and concat(up2.organisaatiokoodi,up2.opiskelijaavain)=p.opiskelija_avain_org
		and up2.vuosi <= p.vuosi
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

WHERE 1=1


--ORDER BY henkilo,p.patevyysryhma

DROP TABLE IF EXISTS #temp_ope_pat


GO

USE [ANTERO]