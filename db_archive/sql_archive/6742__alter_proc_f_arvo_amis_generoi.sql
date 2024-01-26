USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_amis_generoi_tyhjat_kuukaudet]    Script Date: 8.12.2022 12:23:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_arvo_amis_generoi_tyhjat_kuukaudet] AS

DROP TABLE IF EXISTS dw.f_arvo_amis_generoi_tyhjat_kuukaudet_temp

SELECT * INTO dw.f_arvo_amis_generoi_tyhjat_kuukaudet_temp FROM (
	select distinct
		kk.kyselykertaid
		,k.kysymysid
	from Arvo_SA.sa.sa_arvo_kysely_kysymysryhma kkr
	join Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselyid = kkr.kyselyid
	join Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysryhmaid = kkr.kysymysryhmaid
	join ANTERO.dw.d_arvokysymys d on d.kysymysid = k.kysymysid
	where kk.tyyppi = 'amispalaute' 
	and kk.kyselypohja_tarkenne not like '%pilotti%'
	and k.valtakunnallinen = 1
	and k.vastaustyyppi != 'vapaateksti'
	and (k.taustakysymyksen_tyyppi is null or k.taustakysymyksen_tyyppi IN ('kiusaaminen','kiusaamiseen_puuttuminen'))
) k


INSERT INTO dw.f_arvo_amis (
	koulutustoimija
	,[d_organisaatio_oppilaitos_id]
	,[d_organisaatio_koulutustoimija_id]
	,[d_amos_spl_jarjestaja_linkki_id]
	,[d_alueluokitus_oppilaitos_id]
	,[d_alueluokitus_koulutustoimija_id]
	,[d_koulutusluokitus_id]
	,[d_arvovastaus_taustakysymys_sukupuoli_id]
	,[d_arvovastaus_taustakysymys_aidinkieli_id]
	,[d_arvovastaus_taustakysymys_ika_id]
	,[d_arvovastaus_taustakysymys_hakeutumisvayla_id]
	,[d_oppisopimuskoulutus_id]
	,[d_arvovastaus_taustakysymys_arvio_tilanteesta_id]
	,[d_alueluokitus_henkilon_kotikunta_id]
	,[d_kalenteri_tunnus_luotu_id]
	,[d_kalenteri_vastaus_id]
	,[d_arvokysymys_id]
	,[d_arvokyselykerta_id]
	,[d_arvovastaus_monivalinta_id]
	,[d_rahoitusryhma_id]
	,[vastaajaid]
	,[source]
	,[numerovalinta]
	,[d_suoritus_kieli_id]
)


SELECT 
      coalesce(koulutustoimija, f2.ytunnus)
	  ,coalesce(f1.[d_organisaatio_oppilaitos_id], d8.id)
      ,coalesce(f1.[d_organisaatio_koulutustoimija_id], d8b.id)
      ,coalesce(f1.[d_amos_spl_jarjestaja_linkki_id], d9.id)
      ,coalesce(f1.[d_alueluokitus_oppilaitos_id], d10.id)
      ,coalesce(f1.[d_alueluokitus_koulutustoimija_id], d11.id)
      ,coalesce(f1.[d_koulutusluokitus_id], d7.id, '-1')
      ,'-1'
      ,'-1'
      ,'-1'
      ,'-1'
      ,'-1'
      ,'-1'
      ,'-1'
      ,coalesce(f1.[d_kalenteri_tunnus_luotu_id], d5.id)
      ,'-1'
      ,coalesce(f1.[d_arvokysymys_id], d12.id)
      ,coalesce(f1.[d_arvokyselykerta_id], d6.id)
      ,'-1'
	  ,coalesce(f1.d_rahoitusryhma_id, d13.id)
      ,[vastaajaid]
      ,'ETL: p_lataa_f_arvo_amis_generoi_tyhjat_kuukaudet'
      ,[numerovalinta]
      ,'-1'
FROM [ANTERO].[dw].[f_arvo_amis] f1
inner join dw.d_kalenteri d1 on d1.id = f1.d_kalenteri_tunnus_luotu_id
inner join dw.d_arvokyselykerta d2 on d2.id = f1.d_arvokyselykerta_id
inner join dw.d_koulutusluokitus d3 on d3.id = f1.d_koulutusluokitus_id
inner join dw.d_organisaatioluokitus d4 on d4.id = f1.d_organisaatio_oppilaitos_id
inner join dw.d_organisaatioluokitus d4a on d4a.id = f1.d_organisaatio_koulutustoimija_id
inner join dw.d_rahoitusryhma d4b on d4b.id = f1.d_rahoitusryhma_id
--
right join dw.f_arvo_luodut_vastaajatunnukset f2 on f2.kyselykertaid = d2.kyselykertaid 
													and coalesce(f2.oppilaitoskoodi, f2.ytunnus) = coalesce(nullif(d4.organisaatio_koodi,'-1'), d4a.organisaatio_koodi) 
													and coalesce(f2.tutkintokoodi,'-1') = d3.koulutusluokitus_koodi 
													and year(f2.kuukausi) = d1.vuosi and month(f2.kuukausi) = d1.kuukausi 
													and coalesce(f2.rahoitusryhma,'-1') = d4b.koodi 
													and f2.vastaajatunnukset_lkm > 0 
--
inner join dw.d_kalenteri d5 on d5.kalenteri_avain = f2.kuukausi
inner join dw.d_arvokyselykerta d6 on d6.kyselykertaid = f2.kyselykertaid
left join dw.d_koulutusluokitus d7 on d7.koulutusluokitus_koodi = f2.tutkintokoodi
left join dw.d_organisaatioluokitus d8 on d8.organisaatio_koodi = coalesce(f2.oppilaitoskoodi,'-1')
left join dw.d_organisaatioluokitus d8b on d8b.organisaatio_koodi = coalesce(f2.ytunnus,'-1')
left join dw.d_amos_spl_jarjestaja_linkki d9 on d9.ytunnus_avain = coalesce(f2.ytunnus,'-1')
left join dw.d_alueluokitus d10 on d10.kunta_koodi = d8.kunta_koodi
left join dw.d_alueluokitus d11 on d11.kunta_koodi = d8b.kunta_koodi
inner join dw.f_arvo_amis_generoi_tyhjat_kuukaudet_temp k1 on k1.kyselykertaid = d6.kyselykertaid
left join dw.d_arvokysymys d12 on d12.kysymysid = k1.kysymysid
left join dw.d_rahoitusryhma d13 on d13.koodi = coalesce(f2.rahoitusryhma,'-1')

WHERE (d2.kyselykertaid is null or coalesce(nullif(d4.organisaatio_koodi,'-1'), d4a.organisaatio_koodi) is null or d3.koulutusluokitus_koodi is null or d1.vuosi is null or d1.kuukausi is null or d4b.koodi is null)
and d6.kyselypohja = 'amispalaute'
and d6.kyselypohja_tarkenne_fi not like '%pilotti%'
and (d8.id != -1 or d8b.id != -1)

DROP TABLE IF EXISTS dw.f_arvo_amis_generoi_tyhjat_kuukaudet_temp
