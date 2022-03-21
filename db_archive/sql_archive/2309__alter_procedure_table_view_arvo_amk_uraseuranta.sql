USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_amk_uraseuranta]    Script Date: 30.6.2019 14:48:58 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_arvo_amk_uraseuranta]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_amk_uraseuranta]') AND type in (N'U'))
ALTER TABLE [dw].[f_arvo_amk_uraseuranta] DROP CONSTRAINT IF EXISTS [DF__f_arvo_amk_uraseuranta_username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_amk_uraseuranta]') AND type in (N'U'))
ALTER TABLE [dw].[f_arvo_amk_uraseuranta] DROP CONSTRAINT IF EXISTS [DF__f_arvo_amk_uraseuranta_loadtime]
GO
/****** Object:  View [dw].[v_arvo_amk_uraseuranta]    Script Date: 30.6.2019 14:48:58 ******/
DROP VIEW IF EXISTS [dw].[v_arvo_amk_uraseuranta]
GO
/****** Object:  Table [dw].[f_arvo_amk_uraseuranta]    Script Date: 30.6.2019 14:48:58 ******/
DROP TABLE IF EXISTS [dw].[f_arvo_amk_uraseuranta]
GO
/****** Object:  Table [dw].[f_arvo_amk_uraseuranta]    Script Date: 30.6.2019 14:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_amk_uraseuranta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_arvo_amk_uraseuranta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_organisaatio_oppilaitos_id] [int] NOT NULL,
	[d_organisaatio_koulutustoimija_id] [int] NULL,
	[d_alueluokitus_oppilaitos_id] [int] NULL,
	[d_alueluokitus_koulutustoimija_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_arvovastaus_taustakysymys_pohjakoulutus_id] [int] NULL,
	[d_arvovastaus_taustakysymys_tyokokemus_id] [int] NULL,
	[d_arvovastaus_monivalinta_id] [int] NULL,
	[d_alueluokitus_henkilon_kotikunta_id] [int] NOT NULL,
	[d_kalenteri_tunnus_luotu_id] [int] NOT NULL,
	[d_kalenteri_vastaus_id] [int] NULL,
	[d_arvokysymys_id] [int] NOT NULL,
	[d_arvokyselykerta_id] [int] NOT NULL,
	[d_suoritus_kieli_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[vastaajaid] [nvarchar](50) NOT NULL,
	[numerovalinta] [nvarchar](50) NULL,
	[valmistumisvuosi] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK__f_arvo_amk_uraseuranta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dw].[v_arvo_amk_uraseuranta]    Script Date: 30.6.2019 14:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_arvo_amk_uraseuranta]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dw].[v_arvo_amk_uraseuranta] AS

SELECT 
														--AIKAMUUTTUJAT
f.valmistumisvuosi							AS ''Valmistumisvuosi''			--virtatiedoista "valmistumisvuosi"
							
											--KYSELYMUUTTUJAT
, d4.kysymys_fi								AS ''Kysymys''
, d4.kysymysryhma_fi						AS ''Kysymysryhmä''
, COALESCE(																	--ei-monivalintakysymyksissä näytetään numerovalinta
  NULLIF(d6.vastaus_fi,''Tieto puuttuu'') 
  ,numerovalinta)							AS ''Monivalintavaihtoehto''
, d4b.kytkin_fi								AS ''Rahoitusmallikysymys''
														
, o2.organisaatio_fi						AS ''Korkeakoulu''


, d7.koulutusluokitus_fi					AS ''Koulutusnimike''									
, d7.koulutusalataso1_fi					AS ''Koulutusala, taso 1''
, d7.koulutusalataso2_fi					AS ''Koulutusala, taso 2''
, d7.koulutusalataso3_fi					AS ''Koulutusala, taso 3''
, d7.koulutusastetaso1_fi					AS ''Koulutusaste, taso 1''
, d7.koulutusastetaso2_fi					AS ''Koulutusaste, taso 2''
, d7.okmohjauksenala_fi						AS ''OKM ohjauksen ala''
, d9b.kieli_fi		  						AS ''Suorituskieli''

--- kysymyksistä --> pohjakoulutus, työkokemus--> suodatetaan pois datasetistä
 

														--HENKILÖMUUTTUJAT
, d8.sukupuoli_fi							AS ''Sukupuoli''	
, d9.kieliryhma1_fi							AS ''Äidinkieli''
, vt.ikaryhma3_fi							AS ''Ikäryhmä''
, vt.ikaryhma2_fi							AS ''IkäryhmäII''
, d10.vastaus_fi							AS ''Pohjakoulutus''
, d11.vastaus_fi							AS ''Työkokemus''
														--MUUT
, d5.kyselyid
, d5.kyselykertaid
, d4.kysymysid
, f.vastaajaid
, d6.koodi									AS ''vastauskoodi''
, CONCAT(d5.kyselyid,d4.kysymysid,d6.koodi,f.vastaajaid)
											AS ''vastausavain''
, d4.vastaustyyppi							AS ''vastaustyyppi''
,case 
	when d4.vastaustyyppi IN (''asteikko5_1'',''arvosana6'') OR rahoitusmallikysymys=''1'' then 1 
	else 0 
  end										AS ''vastaustyyppi_keskiarvo''

,case 
	when kysymysryhma_fi = ''OMAN OSAAMISEN JA TYÖN VASTAAVUUS (3/3)'' then 1 / 6.0
	else 1.0
end											AS rahoituskysmys_paino

, f.numerovalinta 							AS ''numerovalinta''

--, f2.id										AS ''luodut_vastaajatunnukset_id''
													--KOODIMUUTTUJAT
, d7.koulutusluokitus_koodi					AS ''Koodit Tutkinto''
, o2.organisaatio_koodi						AS ''Koodit Oppilaitos''
, d1.organisaatio_koodi						AS ''Koodit Koulutuksen järjestäjä''
, d3.kuukausi								AS ''Koodit Tilastokuukausi''     
, d4b.kytkin_koodi							AS ''Koodit Rahoitusmallikysymys''

														--JÄRJESTYSMUUTTUJAT
, d9.jarjestys_kieliryhma1					AS ''Järjestys äidinkieli''
, vt.jarjestys_ikaryhma3					AS ''Järjestys ikäryhmä''
, d8.jarjestys_sukupuoli_koodi				AS ''Järjestys sukupuoli''
, d7.jarjestys_tutkintotyyppi_koodi			AS ''Järjestys tutkintotyyppi''
, d7.jarjestys_koulutusalataso1_koodi		AS ''Järjestys koulutusala1''
, d7.jarjestys_koulutusalataso2_koodi		AS ''Järjestys koulutusala2''
, d7.jarjestys_koulutusalataso3_koodi		AS ''Järjestys koulutusala3''
, d7.jarjestys_koulutusastetaso1_koodi		AS ''Jarjestys koulutusastetaso1''
, d7.jarjestys_koulutusastetaso2_koodi		AS ''Jarjestys koulutusastetaso2''
, d7.jarjestys_okmohjauksenala_koodi		AS ''Jarjestys okmohjauksenala''
, d9b.jarjestys_kieliryhma1					AS ''Jarjestys suorituskieli''
, d10.jarjestys_koodi						AS ''Järjestys pohjakoulutus''
, D11.koodi									AS ''Järjestys työkokemus''
, COALESCE(NULLIF(d6.koodi,-1),numerovalinta)
											AS ''Järjestys monivalintavaihtoehto''
, d4.kysymysjarjestys						AS ''Järjestys kysymys''
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_fi=d4.kysymysryhma_fi)	AS ''Järjestys kysymysryhma''



FROM dw.f_arvo_amk_uraseuranta AS f

LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_koulutustoimija_id									
LEFT JOIN dw.d_alueluokitus d2 on d2.id=f.d_alueluokitus_koulutustoimija_id																
LEFT JOIN dw.d_organisaatioluokitus o2 ON f.d_organisaatio_oppilaitos_id = o2.id													
LEFT JOIN dw.d_alueluokitus a2 on   a2.id=f.d_alueluokitus_oppilaitos_id	
LEFT JOIN dw.d_kalenteri d3 ON f.d_kalenteri_tunnus_luotu_id=d3.id   
LEFT JOIN dw.d_kalenteri d3b ON f.d_kalenteri_vastaus_id = d3b.id
LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
LEFT JOIN dw.d_kytkin d4b ON d4b.kytkin_koodi = cast(d4.rahoitusmallikysymys as int)
LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
LEFT JOIN dw.d_arvovastaus_monivalinta d6 ON f.d_arvovastaus_monivalinta_id = d6.id
LEFT JOIN dw.d_koulutusluokitus d7 ON f.d_koulutusluokitus_id = d7.id
LEFT JOIN dw.d_sukupuoli d8 ON d8.id = f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d9 ON d9.id = f.d_aidinkieli_id
LEFT JOIN dw.d_kieli d9b ON d9b.id = f.d_suoritus_kieli_id
LEFT JOIN dw.d_ika vt ON vt.id = f.d_ika_id
LEFT JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.id =f.d_arvovastaus_taustakysymys_pohjakoulutus_id		-- pohjakoulutus
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.id=f.d_arvovastaus_taustakysymys_tyokokemus_id					-- työkokemus
																			
--LEFT JOIN dw.f_arvo_luodut_vastaajatunnukset f2 ON f2.kyselykertaid = d5.kyselykertaid and f2.oppilaitoskoodi = o2.organisaatio_koodi and f2.tutkintokoodi = d7.koulutusluokitus_koodi and YEAR(f2.kuukausi) = d3.vuosi and MONTH(f2.kuukausi) = d3.kuukausi


where d4.kysymysryhma_fi not in (''Lupa tietojen käsittelyyn'',''KIITOS VASTAUKSISTASI!'')
and numerovalinta<>''-1'' 


' 
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_arvo_amk_uraseuranta_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_arvo_amk_uraseuranta] ADD  CONSTRAINT [DF__f_arvo_amk_uraseuranta_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_arvo_amk_uraseuranta_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_arvo_amk_uraseuranta] ADD  CONSTRAINT [DF__f_arvo_amk_uraseuranta_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_amk_uraseuranta]    Script Date: 30.6.2019 14:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_arvo_amk_uraseuranta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_arvo_amk_uraseuranta] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_arvo_amk_uraseuranta] AS

TRUNCATE TABLE dw.f_arvo_amk_uraseuranta

INSERT INTO dw.f_arvo_amk_uraseuranta (
	 d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_sukupuoli_id 
	,d_aidinkieli_id 
	,d_ika_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvokyselykerta_id
	,d_arvovastaus_monivalinta_id
	,numerovalinta
	,vastaajaid
	,d_suoritus_kieli_id
	,d_arvovastaus_taustakysymys_pohjakoulutus_id
	,d_arvovastaus_taustakysymys_tyokokemus_id
	,valmistumisvuosi
	,source
)

SELECT 
     coalesce(d1a.id,-1)			AS d_organisaatio_oppilaitos_id
	,coalesce(d1b.id,-1)			AS d_organisaatio_koulutustoimija_id
	,coalesce(d2a.id,-1)			AS d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id,-1)			AS d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id,-1)				AS d_koulutusluokitus_id
	,coalesce(d6.id, -1)			AS d_sukupuoli_id						
	,coalesce(d8.id,-1)				AS d_aidinkieli_id							
	,coalesce(d9.id, -1) 			AS d_ika_valmistuessa_id					
	,coalesce(d4.id,-1)				AS d_alueluokitus_henkilon_kotikunta_id						
	,coalesce(d5.id,-1)				AS d_kalenteri_tunnus_luotu_id
	,coalesce(d5b.id,-1)			AS d_kalenteri_vastaus_id									
	,coalesce(d11.id,-1)			AS d_arvokysymys_id												--> puljaamista org --> LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = MAIN_QUERY.kysymysryhmaid AND d6.kysymysid = MAIN_QUERY.kysymysid AND d6.kysymysryhmajarjestys = MAIN_QUERY.kysymysryhmajarjestys
	, coalesce(d12.id,-1)			AS d_arvokyselykerta_id
	,coalesce(d15.id,-1)			AS d_arvovastaus_monivalinta_id			
	,f2.numerovalinta								
	,f.vastaajaid
	,coalesce(d10.id, -1)			AS d_suoritus_kieli_id												
	,coalesce(pk.id, -1)			AS d_pohjakoulutus_arvovastaus_vastaus_id
	,coalesce(tk.id, -1)			AS d_tyokokemus_arvovastaus_id
	, vtt.valmistumisvuosi			AS valmistumisvuosi
	,'ETL: p_lataa_f_arvo_amk_uraseuranta' as source

	from 
	
	Arvo_SA.sa.sa_arvo_vastaajat f 
	LEFT JOIN Arvo_SA.sa.sa_arvo_vastaukset f2 ON f2.vastaajatunnusid=f.vastaajatunnusid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid=f2.kysymysid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f4 on f4.kyselykertaid=f2.kyselykertaid
	--LEFT JOIN ARVO_SA.sa.sa_arvo_kysely_kysymysryhma f5 on f5.kysymysryhmaid=f3.kysymysryhmaid
	LEFT JOIN ARVO_SA.sa.sa_virta_taustatiedot vtt on vtt.vastaajaid=f.vastaajaid
	
	LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = f.oppilaitoskoodi
	LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = f2.koulutustoimija
	LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
	LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
	LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_avain like 'koulutus_%' and d3.koulutusluokitus_koodi = f.tutkintokoodi
	LEFT JOIN dw.d_alueluokitus d4 ON d4.alueluokitus_avain like 'kunta_%' and d4.kunta_koodi = f.kuntakoodi
	LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = f.vastaajatunnus_alkupvm
	LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = f2.vastausaika
	LEFT JOIN Arvo_SA.sa.sa_virta_taustatiedot vt  on vt.vastaajatunnusid=f.vastaajatunnusid							--sukupuoli, aidinkieli, ika valmistuessa
	LEFT JOIN dw.d_sukupuoli d6 ON d6.sukupuoli_koodi=vt.sukupuoli
	LEFT JOIN dw.d_kieli d8 on d8.kieli_koodi=vt.aidinkieli
	LEFT JOIN dw.d_ika d9 on d9.ika_avain=vt.ika_valmistuessa
	LEFT JOIN dw.d_kieli d10 on d10.kieli_koodi=f.suorituskieli
	LEFT JOIN dw.d_arvokysymys d11 on d11.kysymysid=f3.kysymysid  --and  d11.kysymysryhmaid=f3.kysymysryhmaid and d11.kysymysryhmajarjestys=f5.jarjestys
	LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = f2.numerovalinta and d15.kysymysid = f2.kysymysid
	LEFT JOIN dw.d_arvokyselykerta d12 on d12.kyselykertaid = f4.kyselykertaid
	LEFT JOIN (select distinct								--POHJAKOULUTUS kysymyksestä --> 'Mikä oli korkein suorittamasi tutkinto ennen vuonna 2013 suorittamaasi tutkintoa?'			    
			    arvovastaus.id as id		
			, kyselykertaid
			, vastausid
			, vastaajaid
			, arvovastaus.vastaus_fi as pohjakoulutus
			,a.kysymysid
			from Arvo_SA.sa.sa_arvo_vastaukset a 
			inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid=a.kysymysid and b.taustakysymyksen_tyyppi='pohjakoulutus'
			left join dw.d_arvovastaus_taustakysymys arvovastaus on arvovastaus.vastaus_fi = a.monivalintavaihtoehto_fi and arvovastaus.kysymysid=a.kysymysid)
			AS pk ON pk.vastaajaid = f2.vastaajaid AND pk.kyselykertaid = f2.kyselykertaid 	
	
	LEFT JOIN (select distinct								--TYÖKOKEMUS kysymyksestä--> 'Mikä oli korkein suorittamasi tutkinto ennen vuonna 2013 suorittamaasi tutkintoa?'			    
			     arvovastaus.id as id		
			   , kyselykertaid
			   , vastausid
			   , vastaajaid
			   , arvovastaus.vastaus_fi as pohjakoulutus
			   ,a.kysymysid
			   from Arvo_SA.sa.sa_arvo_vastaukset a 
			   inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid=a.kysymysid and b.taustakysymyksen_tyyppi='tyokokemus'
			   left join dw.d_arvovastaus_taustakysymys arvovastaus on arvovastaus.vastaus_fi = a.monivalintavaihtoehto_fi and arvovastaus.kysymysid=a.kysymysid)
			   AS tk ON tk.vastaajaid = f2.vastaajaid AND tk.kyselykertaid = f2.kyselykertaid 	


--haetaan normaaleista kysymyksistä ja pohjakoulutus ja työkokemus -kysymykset suodatetaan faktalatauksesta pois. 
	where f4.tyyppi = 'amk-uraseuranta'
	and f3.valtakunnallinen = 1 
	and coalesce(f3.taustakysymyksen_tyyppi,'') not in ('pohjakoulutus','tyokokemus')
	and f3.vastaustyyppi != 'vapaateksti'
