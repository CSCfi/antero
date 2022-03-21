USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_avop]    Script Date: 26.10.2019 15:14:15 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_arvo_avop]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_avop]') AND type in (N'U'))
ALTER TABLE [dw].[f_arvo_avop] DROP CONSTRAINT IF EXISTS [DF__f_arvo_avop__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_avop]') AND type in (N'U'))
ALTER TABLE [dw].[f_arvo_avop] DROP CONSTRAINT IF EXISTS [DF__f_arvo_avop__loadtime]
GO
/****** Object:  View [dw].[v_arvo_avop]    Script Date: 26.10.2019 15:14:15 ******/
DROP VIEW IF EXISTS [dw].[v_arvo_avop]
GO
/****** Object:  Table [dw].[f_arvo_avop]    Script Date: 26.10.2019 15:14:15 ******/
DROP TABLE IF EXISTS [dw].[f_arvo_avop]
GO
/****** Object:  Table [dw].[f_arvo_avop]    Script Date: 26.10.2019 15:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_avop]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_arvo_avop](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_organisaatio_oppilaitos_id] [int] NOT NULL,
	[d_organisaatio_koulutustoimija_id] [int] NULL,
	[d_alueluokitus_oppilaitos_id] [int] NULL,
	[d_alueluokitus_koulutustoimija_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_kytkin_opetushallinnon_alainen_koulutus_id] [int] NULL,
	[d_kieli_suorituskieli_id] [int] NULL,
	[d_arvovastaus_taustakysymys_sukupuoli_id] [nvarchar](50) NOT NULL,
	[d_arvovastaus_taustakysymys_ika_id] [int] NULL,
	[d_arvovastaus_taustakysymys_pohjakoulutus_id] [int] NULL,
	[d_alueluokitus_henkilon_kotikunta_id] [int] NOT NULL,
	[d_kalenteri_tunnus_luotu_id] [int] NOT NULL,
	[d_kalenteri_vastaus_id] [int] NULL,
	[d_arvokysymys_id] [int] NOT NULL,
	[d_arvokyselykerta_id] [int] NOT NULL,
	[d_arvovastaus_monivalinta_id] [int] NULL,
	[vastaajaid] [nvarchar](50) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
	[numerovalinta] [nvarchar](50) NULL,
 CONSTRAINT [PK__f_arvo_avop] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dw].[v_arvo_avop]    Script Date: 26.10.2019 15:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_arvo_avop]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dw].[v_arvo_avop] AS


SELECT --TOP 100

														--AIKAMUUTTUJAT
d5.vuosi									AS ''Kyselyvuosi''
, d3b.kuukausi_fi							AS ''Vastauskuukausi''

														--KYSELYMUUTTUJAT
, d4.kysymys_fi								AS ''Kysymys''
, d4.kysymysryhma_fi						AS ''Kysymysryhmä''
, COALESCE(NULLIF(d6.vastaus_fi,''Tieto puuttuu''),numerovalinta) AS ''Monivalintavaihtoehto'' --ei-monivalintakysymyksissä näytetään numerovalinta
, d4b.kytkin_fi								AS ''Rahoitusmallikysymys''
, d5.kyselypohja_tarkenne_fi				AS ''Kyselypohja''


														--OPPILAITOS
, d2.organisaatio_fi						AS ''Organisaatio''

														--KOULUTUs
,case 
	when d12.kytkin_koodi = 0 then ''Muiden hallinnonalojen alainen koulutus'' 
	else ''Opetushallinnon alainen koulutus'' 
end											AS ''Hallinnonala''
, d7.koulutusluokitus_fi					AS ''Koulutusnimike''		
, d7.koulutusastetaso1_fi					AS ''Koulutusaste, taso 1''
, d7.koulutusastetaso2_fi					AS ''Koulutusaste, taso 2''							
, d7.koulutusalataso1_fi					AS ''Koulutusala, taso 1''
, d7.koulutusalataso2_fi					AS ''Koulutusala, taso 2''
, d7.koulutusalataso3_fi					AS ''Koulutusala, taso 3''
, d7.okmohjauksenala_fi						AS ''OKM ohjauksen ala''
, d9.kieli_fi								AS ''Kieli''

														--HENKILÖMUUTTUJAT
, d8.vastaus_fi								AS ''Sukupuoli''	
, d11.vastaus_fi							AS ''Ikäryhmä''
, d10.vastaus_fi							AS ''Pohjakoulutus''



														--MUUT
, d5.kyselyid
, d5.kyselykertaid
, d4.kysymysid
, f.vastaajaid
, d6.koodi									AS ''vastauskoodi''
, d4.vastaustyyppi							AS ''vastaustyyppi''
, case 
	when d4.vastaustyyppi LIKE ''asteikko%'' OR d4.vastaustyyppi LIKE ''arvosana%'' then 1 
	else 0 
  end										AS ''vastaustyyppi_keskiarvo''
, case 
	when d4.kysymysid in (select kysymysid from dw.d_arvokysymys where kysymys_fi = ''Missä määrin opiskelijoiden palaute mielestäsi huomioitiin opintojen kehittämisessä? Palaute huomioitiin'') then
		case
			when f.numerovalinta = ''0'' then 7.0
			when f.numerovalinta = ''1'' then 5.5
			when f.numerovalinta = ''2'' then 4.0
			when f.numerovalinta = ''3'' then 2.5
			when f.numerovalinta = ''4'' then 1.0
		end
	else f.numerovalinta
  end										AS numerovalinta
  


--Ruotsi
, d5.vuosi									AS ''Enkätår''
, d3b.kuukausi_sv							AS ''Svarsmånad''

, d5.kyselypohja_tarkenne_sv				AS ''Frågeformulär''
, d4.kysymys_sv								AS ''Fråga''
, d4.kysymysryhma_sv						AS ''Frågegrupp''
, COALESCE(NULLIF(d6.vastaus_sv,''Information saknas''),numerovalinta) AS ''Flervalsalternativ''
, d4b.kytkin_sv								AS ''Finansieringsmodellsfråga''

, d2.organisaatio_sv						AS ''Organisation''
,case 
	when d12.kytkin_koodi = 0 then ''Annan än utbildning som är underställd utbildningsförvaltningen'' 
	else ''Utbildning som är underställd utbildningsförvaltningen'' 
end											AS ''Förvaltningsområde''

, d7.koulutusluokitus_sv					AS ''Utbildningsbenämning''	
, d7.koulutusastetaso1_sv					AS ''Utbildningsnivå, nivå 1''
, d7.koulutusastetaso2_sv					AS ''Utbildningsnivå, nivå 2''								
, d7.koulutusalataso1_sv					AS ''Utbildningsområde, nivå 1''
, d7.koulutusalataso2_sv					AS ''Utbildningsområde, nivå 2''
, d7.koulutusalataso3_sv					AS ''Utbildningsområde, nivå 3''
, d7.okmohjauksenala_sv						AS ''UKM-styrningsområde''
, d9.kieli_sv								AS ''Språk''

, d8.vastaus_sv								AS ''Kön''	
, d11.vastaus_sv							AS ''Åldersgrupp''
, d10.vastaus_sv							AS ''Grundutbildning''


--Englanti
, d5.vuosi									AS ''Survey year''
, d3b.kuukausi_en							AS ''Response month''

, d5.kyselypohja_tarkenne_en				AS ''Survey format''
, d4.kysymys_en								AS ''Question''
, d4.kysymysryhma_en						AS ''Question group''
, COALESCE(NULLIF(d6.vastaus_en,''Missing data''),numerovalinta) AS ''Multiple choice option''
, d4b.kytkin_en								AS ''Funding model question''

, d2.organisaatio_en						AS ''Organization''
,case 
	when d12.kytkin_koodi = 0 then ''Oher than education under the education administration'' 
	else ''Education under the education administration'' 
end											AS ''Administrative sector''

, d7.koulutusluokitus_en					AS ''Name of education''
, d7.koulutusastetaso1_en					AS ''Level of education, tier 1''
, d7.koulutusastetaso2_en					AS ''Level of education, tier 2''									
, d7.koulutusalataso1_en					AS ''Field of education, tier 1''
, d7.koulutusalataso2_en					AS ''Field of education, tier 2''
, d7.koulutusalataso3_en					AS ''Field of education, tier 3''
, d7.okmohjauksenala_en						AS ''Field of education, HE steering''
, d9.kieli_en								AS ''Language''

, d8.vastaus_en								AS ''Gender''	
, d11.vastaus_en							AS ''Age group''
, d10.vastaus_en							AS ''Prior education''


														--KOODIMUUTTUJAT
, d7.koulutusluokitus_koodi					AS ''Koodit Koulutusnimike''
, d2.organisaatio_koodi						AS ''Koodit Organisaatio''
, d3b.kuukausi								AS ''Koodit Vastauskuukausi''     
, d4b.kytkin_koodi							AS ''Koodit Rahoitusmallikysymys''


														--JÄRJESTYSMUUTTUJAT
, (select max(d.jarjestys_koodi)	
from dw.d_arvovastaus_taustakysymys d 
where d.vastaus_fi=d10.vastaus_fi)			AS ''Järjestys pohjakoulutus''
, d11.jarjestys_koodi						AS ''Järjestys ikäryhmä''
, (select max(d.jarjestys_koodi)	
from dw.d_arvovastaus_taustakysymys d 
where d.vastaus_fi=d8.vastaus_fi)			AS ''Järjestys sukupuoli''
, d7.jarjestys_koulutusastetaso1_koodi		AS ''Järjestys koulutusaste1''
, d7.jarjestys_koulutusastetaso2_koodi		AS ''Järjestys koulutusaste2''
, d7.jarjestys_koulutusalataso1_koodi		AS ''Järjestys koulutusala1''
, d7.jarjestys_koulutusalataso2_koodi		AS ''Järjestys koulutusala2''
, d7.jarjestys_koulutusalataso3_koodi		AS ''Järjestys koulutusala3''
, d7.jarjestys_okmohjauksenala_koodi		AS ''Järjestys okm ohjauksen ala''
, COALESCE(NULLIF(d6.koodi,-1),numerovalinta)
											AS ''Järjestys monivalintavaihtoehto''
, (select max(d.kysymysjarjestys)	
from dw.d_arvokysymys d 
where d.kysymys_fi=d4.kysymys_fi)			AS ''Järjestys kysymys''
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_fi=d4.kysymysryhma_fi)	AS ''Järjestys kysymysryhma''



FROM dw.f_arvo_avop AS f

JOIN dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_koulutustoimija_id									
JOIN dw.d_alueluokitus d1b on d1b.id=f.d_alueluokitus_koulutustoimija_id																
JOIN dw.d_organisaatioluokitus d2 ON d2.id=f.d_organisaatio_oppilaitos_id 
JOIN dw.d_alueluokitus d2b on d2b.id=f.d_alueluokitus_oppilaitos_id	
JOIN dw.d_kalenteri d3 ON f.d_kalenteri_tunnus_luotu_id=d3.id   
JOIN dw.d_kalenteri d3b ON f.d_kalenteri_vastaus_id = d3b.id
JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
JOIN dw.d_kytkin d4b ON d4b.kytkin_koodi = cast(d4.rahoitusmallikysymys as int)
JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
JOIN dw.d_arvovastaus_monivalinta d6 ON f.d_arvovastaus_monivalinta_id = d6.id
JOIN dw.d_koulutusluokitus d7 ON f.d_koulutusluokitus_id = d7.id
JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.id = f.d_arvovastaus_taustakysymys_sukupuoli_id
JOIN dw.d_kieli d9 ON d9.id = f.d_kieli_suorituskieli_id
JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.id = f.d_arvovastaus_taustakysymys_pohjakoulutus_id
JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.id = f.d_arvovastaus_taustakysymys_ika_id
JOIN dw.d_kytkin d12 ON d12.id = f.d_kytkin_opetushallinnon_alainen_koulutus_id



																					
' 
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_arvo_avop__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_arvo_avop] ADD  CONSTRAINT [DF__f_arvo_avop__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_arvo_avop__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_arvo_avop] ADD  CONSTRAINT [DF__f_arvo_avop__username]  DEFAULT (suser_sname()) FOR [username]
END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_avop]    Script Date: 26.10.2019 15:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_arvo_avop]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_arvo_avop] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_f_arvo_avop] AS


TRUNCATE TABLE dw.f_arvo_avop

;WITH CTE AS (
	select distinct 
		 a.kyselykertaid
		,a.vastaajaid
		,a.kysymysid
		,a.numerovalinta as koodi
		,b.taustakysymyksen_tyyppi
	from Arvo_SA.sa.sa_arvo_vastaukset a 
	join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid 
	join Arvo_SA.sa.sa_arvo_kyselykerrat c on c.kyselykertaid=a.kyselykertaid
	where b.taustakysymyksen_tyyppi in ('sukupuoli','ika','pohjakoulutus')
	and c.tyyppi = 'avop'
)

INSERT INTO dw.f_arvo_avop (
	 d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_kytkin_opetushallinnon_alainen_koulutus_id
	,d_kieli_suorituskieli_id
	,d_arvovastaus_taustakysymys_sukupuoli_id 
	,d_arvovastaus_taustakysymys_ika_id
	,d_arvovastaus_taustakysymys_pohjakoulutus_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvokyselykerta_id
	,d_arvovastaus_monivalinta_id
	,numerovalinta
	,vastaajaid
	,source
)

SELECT 
     coalesce(d1a.id,-1) AS d_organisaatio_oppilaitos_id
	,coalesce(d1b.id,-1) AS d_organisaatio_koulutustoimija_id
	,coalesce(d2a.id,-1) AS d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id,-1) AS d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id,-1) AS d_koulutusluokitus_id
	,coalesce(d17.id,-1) AS d_kytkin_opetushallinnon_alainen_koulutus_id
	,coalesce(d16.id, -1) as d_kieli_suorituskieli_id
	,coalesce(d8.id,-1) AS d_arvovastaus_taustakysymys_sukupuoli_id
	,coalesce(d10.id,-1) AS d_arvovastaus_taustakysymys_ika_id
	,coalesce(d11.id,-1) AS d_arvovastaus_taustakysymys_pohjakoulutus_id
	,coalesce(d4.id,-1) AS d_alueluokitus_henkilon_kotikunta_id
	,coalesce(d5a.id,-1) AS d_kalenteri_tunnus_luotu_id
	,coalesce(d5b.id,-1) AS d_kalenteri_vastaus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d7.id,-1) AS d_arvokyselykerta_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,MAIN_QUERY.numerovalinta
	,MAIN_QUERY.vastaajaid
	,MAIN_QUERY.source
FROM (

	SELECT 
		 f2.oppilaitoskoodi
		,f.koulutustoimija
		,f2.tutkintokoodi
		,tk_sp.koodi as sp_koodi
		,tk_sp.kysymysid as sp_kysymysid
		,tk_ika.koodi as ika_koodi
		,tk_ika.kysymysid as ika_kysymysid
		,tk_pk.koodi as pk_koodi
		,tk_pk.kysymysid as pk_kysymysid
		,f2.kuntakoodi as kotikunta
		,f2.vastaajatunnus_alkupvm
		,f.vastausaika
		,CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE -1 END as vastausid_monivalinta
		,f.numerovalinta
		,f.vastaajaid
		,f.kyselyid
		,f.kyselykertaid
		,f3.kysymysid
		,f3.kysymysryhmaid
		,f4.jarjestys as kysymysryhmajarjestys
		,f2.suorituskieli
		,CASE WHEN f2.oppilaitoskoodi = '02557' THEN 0 ELSE 1 END as opetushallinnon_alainen_koulutus
		,'ETL: p_lataa_f_arvo_avop' AS source
	FROM Arvo_SA.sa.sa_arvo_vastaukset as f
	INNER JOIN Arvo_SA.sa.sa_arvo_vastaajat f2 on f2.vastaajaid = f.vastaajaid
	INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid
	INNER JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid
	INNER JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselyid = f4.kyselyid and f5.kyselykertaid = f.kyselykertaid 
	--HENKILÖN TAUSTATIEDOT
	LEFT JOIN (
		select
			 kyselykertaid
			,vastaajaid
			,kysymysid
			,koodi
		from CTE
		where taustakysymyksen_tyyppi = 'sukupuoli'
	) AS tk_sp ON tk_sp.vastaajaid = f.vastaajaid AND tk_sp.kyselykertaid = f.kyselykertaid

	LEFT JOIN (
		select 
			 kyselykertaid
			,vastaajaid
			,kysymysid
			,koodi
		from CTE  
		where taustakysymyksen_tyyppi = 'ika'
	) AS tk_ika ON tk_ika.vastaajaid = f.vastaajaid AND tk_ika.kyselykertaid = f.kyselykertaid

	LEFT JOIN (
		select 
			 kyselykertaid
			,vastaajaid
			,kysymysid
			,koodi
		from CTE 
		where taustakysymyksen_tyyppi = 'pohjakoulutus'
	) AS tk_pk ON tk_pk.vastaajaid = f.vastaajaid AND tk_pk.kyselykertaid = f.kyselykertaid

	WHERE f5.tyyppi = 'avop' 
	AND f3.valtakunnallinen = 1 
	AND f3.taustakysymyksen_tyyppi is null
	AND f3.vastaustyyppi != 'vapaateksti'


) MAIN_QUERY

LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MAIN_QUERY.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = MAIN_QUERY.koulutustoimija
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = MAIN_QUERY.tutkintokoodi
LEFT JOIN dw.d_alueluokitus d4 ON d4.kunta_koodi = MAIN_QUERY.kotikunta
LEFT JOIN dw.d_kalenteri d5a ON d5a.kalenteri_avain = CAST(MAIN_QUERY.vastaajatunnus_alkupvm AS varchar(20))
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = CAST(MAIN_QUERY.vastausaika AS varchar(20))
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = MAIN_QUERY.kysymysryhmaid AND d6.kysymysid = MAIN_QUERY.kysymysid AND d6.kysymysryhmajarjestys = MAIN_QUERY.kysymysryhmajarjestys
LEFT JOIN dw.d_arvokyselykerta d7 ON d7.kyselykertaid = MAIN_QUERY.kyselykertaid
LEFT JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.koodi = MAIN_QUERY.sp_koodi and d8.kysymysid = MAIN_QUERY.sp_kysymysid
LEFT JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.koodi = MAIN_QUERY.ika_koodi and d10.kysymysid = MAIN_QUERY.ika_kysymysid
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.koodi = MAIN_QUERY.pk_koodi and d11.kysymysid = MAIN_QUERY.pk_kysymysid
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MAIN_QUERY.numerovalinta and d15.kysymysid = MAIN_QUERY.kysymysid
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MAIN_QUERY.suorituskieli
LEFT JOIN dw.d_kytkin d17 ON d17.kytkin_koodi = MAIN_QUERY.opetushallinnon_alainen_koulutus


GO
