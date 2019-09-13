USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_yo_uraseuranta_2018]    Script Date: 9.5.2019 16:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_arvo_yo_uraseuranta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_arvo_yo_uraseuranta] AS' 
END
GO
    
	
	

ALTER PROCEDURE [dw].[p_lataa_f_arvo_yo_uraseuranta] AS

TRUNCATE TABLE dw.f_arvo_yo_uraseuranta

INSERT INTO dw.f_arvo_yo_uraseuranta (
	d_organisaatio_id,
	d_koulutusluokitus_id,
	d_kieli_id,
	d_alueluokitus_id,
	d_arvokysymys_id,
	d_arvokyselykerta_id,
	vaihtoehto,
	monivalintavaihtoehto_fi,
	monivalintavaihtoehto_sv,
	monivalintavaihtoehto_en,
	numerovalinta,
	vapaateksti,
	laajuus,
	paaaine,
	arvosana,
	asteikko,
	d_sukupuoli_id,
	d_kieli_aidinkieli_id,
	d_maatjavaltiot_kansalaisuus_id,
	valintavuosi,
	d_alueluokitus_asuinkunta_id,
	d_ika_valmistuessa_id,
	valmistumisvuosi,
	lasnaolo_lukukausia,
	kirjoilla_olo_kuukausia,
	vastaajaid,
	valtakunnallinen,
	lukumaara,
	kyselypohja,
	kysymysryhma,
	kysymys,
	kyselyvuosi,
	vastaustyyppi,
	source
)

SELECT DISTINCT
	 coalesce(d1a.id,d1b.id,-1) AS d_organisaatio_id
	,coalesce(d2.id,-1) AS d_koulutusluokitus_id
	,coalesce(d3.id,-1) AS d_kieli_id
	,coalesce(d4.id,-1) AS d_alueluokitus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d7.id,-1) AS d_arvokyselykerta_id

	,f.vaihtoehto
	,f.monivalintavaihtoehto_fi
	,f.monivalintavaihtoehto_sv
	,f.monivalintavaihtoehto_en
	,f.numerovalinta
	,f.vapaateksti
  
	,f.[taustatiedot.laajuus] as laajuus
	,f.[taustatiedot.paaaine] as paaaine
	,f.[taustatiedot.arvosana] as arvosana
	,f.[taustatiedot.asteikko] as asteikko
	,coalesce(d8.id,-1) as d_sukupuoli_id
	,coalesce(d9.id,-1) as d_kieli_aidinkieli_id
	,coalesce(d10.id,-1) as d_maatjavaltiot_kansalaisuus_id
	,f.[taustatiedot.valintavuosi] as valintavuosi
	,coalesce(d12.id,-1) as d_alueluokitus_asuinkunta_id
	,coalesce(d13.id,-1) as d_ika_valmistuessa_id
	,f.[taustatiedot.valmistumisvuosi] as valmistumisvuosi
	,f.[taustatiedot.lasnaolo_lukukausia] as lasnaolo_lukukausi
	,f.[taustatiedot.kirjoilla_olo_kuukausia] as kirjoilla_olo_kuukausia

	,f.vastaajaid
	,f.valtakunnallinen
  
	,cast(1 as int) AS lukumaara
	,case 
		when f.kysely_fi like '%tohtori%' then 'URASEURANTA-TOHTORI'
		else 'URASEURANTA-MAISTERI' 
	 end as kyselypohja
	,f.kysymysryhma_fi
	,f.kysymys_fi
	,cast(f.[taustatiedot.valmistumisvuosi] as int)+(case when f.kysely_fi like '%tohtori%' then 3 else 5 end)
	,f.vastaustyyppi
	,'ETL: p_lataa_f_arvo_uraseuranta' AS source

FROM sa.sa_arvo_uraseuranta as f
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = cast(f.valmistavan_koulutuksen_oppilaitos as varchar)
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = cast(f.koulutustoimija as varchar)
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_avain like 'koulutus_%' and d2.koulutusluokitus_koodi = cast(f.tutkintotunnus as varchar)
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi=cast(f.[taustatiedot.aidinkieli] as varchar)
LEFT JOIN dw.d_alueluokitus d4 ON d4.alueluokitus_avain like 'kunta_%' and d4.kunta_koodi = cast(f.[taustatiedot.asuinkunta_koodi] as varchar)
--LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = cast(f.vastausaika as date)
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = f.kysymysryhmaid AND d6.kysymysid = f.kysymysid AND d6.kysymysryhmajarjestys=f.kysymysryhma_jarjestys AND d6.kysymysjarjestys=f.jarjestys
--LEFT JOIN dw.d_arvokysymys d6b ON d6b.kysymysryhmaid = f.kysymysryhmaid AND d6.kysymysid = f.jatkokysymys_kysymysid AND d6.kysymysryhmajarjestys=f.kysymysryhma_jarjestys AND d6.kysymysjarjestys=f.jarjestys
LEFT JOIN dw.d_arvokyselykerta d7 ON d7.kyselykertaid = f.kyselykertaid
LEFT JOIN dw.d_sukupuoli d8 ON d8.sukupuoli_koodi=f.[taustatiedot.sukupuoli]
LEFT JOIN dw.d_kieli d9 ON d9.kieli_koodi=cast(f.[taustatiedot.aidinkieli] as varchar)
LEFT JOIN dw.d_maatjavaltiot2 d10 ON d10.maatjavaltiot2_koodi=cast(f.[taustatiedot.kansalaisuus] as varchar)
--LEFT JOIN 
LEFT JOIN dw.d_alueluokitus d12 ON d12.alueluokitus_avain=cast(f.[taustatiedot.asuinkunta_koodi] as varchar)
LEFT JOIN dw.d_ika d13 ON d13.ika_avain=f.[taustatiedot.ika_valmistuessa]

WHERE f.kyselykerta not like '%AMK%'
and [taustatiedot.valmistumisvuosi] is not null
--and coalesce(f.taustakysymykset,-1)=0




GO


