USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijapalaute_vastausosuudet_kertoimet]    Script Date: 28.7.2021 17:59:47 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijapalaute_vastausosuudet_kertoimet]
GO
/****** Object:  View [dw].[v_amos_opiskelijapalaute]    Script Date: 28.7.2021 17:59:47 ******/
DROP VIEW IF EXISTS [dw].[v_amos_opiskelijapalaute]
GO
/****** Object:  Table [dw].[f_amos_opiskelijapalaute_vastausosuudet_kertoimet]    Script Date: 28.7.2021 17:59:47 ******/
DROP TABLE IF EXISTS [dw].[f_amos_opiskelijapalaute_vastausosuudet_kertoimet]
GO
/****** Object:  Table [dw].[f_amos_opiskelijapalaute_vastausosuudet_kertoimet]    Script Date: 28.7.2021 17:59:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_opiskelijapalaute_vastausosuudet_kertoimet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_opiskelijapalaute_vastausosuudet_kertoimet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ytunnus] [varchar](50) NULL,
	[jarj] [varchar](250) NULL,
	[rahoituskausi] [nvarchar](50) NULL,
	[kysely] [nvarchar](250) NULL,
	[kysely_tarkenne] [nvarchar](250) NULL,
	[kyselyn_kohteet_arvo] [int] NULL,
	[kyselyn_kohteet_vahvistettu] [bigint] NULL,
	[vastanneet_arvo] [bigint] NULL,
	[vastanneet_vahvistettu] [bigint] NULL,
	[vastanneet_rahoitus] [bigint] NULL,
	[vastaajamaaran_lahde] [varchar](20) NOT NULL,
	[vastausosuus_arvo] [float] NULL,
	[vastausosuus_rahoitus] [float] NULL,
	[katokorjauskerroin_arvo] [float] NULL,
	[katokorjauskerroin_rahoitus] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  View [dw].[v_amos_opiskelijapalaute]    Script Date: 28.7.2021 17:59:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_amos_opiskelijapalaute]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dw].[v_amos_opiskelijapalaute] AS

SELECT 

														--AIKAMUUTTUJAT
--d3.vuosi									AS ''Tilastovuosi''
--, d3.kuukausi_fi							AS ''Tilastokuukausi''
  f.rahoituskausi_amm						AS ''Rahoituskausi''
											
											--KYSELYMUUTTUJAT
, f.kyselypohja_tarkenne_amis_fi			AS ''Kysely''
, f.kyselypohja_tarkenne_fi					AS ''Kyselyn kohderyhmä''  
, d4.kysymys_fi								AS ''Kysymys''
, d4.kysymysryhma_fi						AS ''Kysymysryhmä''

														---KOULUTUSTOIMIJA
, d2.organisaatio_fi						AS ''Koulutuksen järjestäjä''

, d2b.maakunta_fi							AS ''Koul. järjestäjän maakunta''
, d2b.kunta_fi								AS ''Koul. järjestäjän kunta''
, d2b.avi_fi								AS ''Koul. järjestäjän AVI''
, d2b.ely_fi								AS ''Koul. järjestäjän ELY''

														--OPPILAITOS
--, o2.organisaatio_fi						AS ''Oppilaitos''
--, a2.maakunta_fi							AS ''Oppilaitoksen maakunta''
--, a2.kunta_fi								AS ''Oppilaitoksen kunta''
--, a2.avi_fi									AS ''Oppilaitoksen AVI''
--, a2.ely_fi									AS ''Oppilaitoksen ELY''


--Ruotsi
--, d3.vuosi									AS ''Statistikår''
--, d3.kuukausi_sv							AS ''Statistikmånad''
--, concat(''1.7.2018'','' - '',  convert(varchar, (DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-3, -1)),104))								AS ''Statistikperiod''
--, d3.rahoituskausi_amm						AS ''Finansieringsperiod''

--, d5.kyselypohja_tarkenne_amis_sv			AS ''Frågeformulär''
--, d5.kyselypohja_tarkenne_sv				AS ''Målgrupp för frågeformulär''  
--, d4.kysymys_sv								AS ''Fråga''
--, d4.kysymysryhma_sv						AS ''Frågegrupp''

--, d1.nimi_amos_spl							AS ''Utbildningsanordnare''
--, d2.maakunta_sv							AS ''Utbildningsanordnarens landskap''
--, d2.kunta_sv								AS ''Utbildningsanordnarens kommun''
--, d2.avi_sv									AS ''Utbildningsanordnarens RFV-område''
--, d2.ely_sv									AS ''Utbildningsanordnarens NMT-område''
--, o2.organisaatio_sv						AS ''Läroanstalt''
--, a2.maakunta_sv							AS ''Läroanstaltens landskap''
--, a2.kunta_sv								AS ''Läroanstaltens kommun''
--, a2.avi_sv									AS ''Läroanstaltens RFV-område''
--, a2.ely_sv									AS ''Läroanstaltens NMT-område''


----Englanti
----, d3.vuosi									AS ''Statistical year''
----, d3.kuukausi_en							AS ''Statistical month''
----, concat(''1.7.2018'','' - '',  convert(varchar, (DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-3, -1)),104))					AS ''Statistical period''
--, d3.rahoituskausi_amm						AS ''Funding period''
--, d5.kyselypohja_tarkenne_amis_en			AS ''Survey''
--, d5.kyselypohja_tarkenne_en				AS ''Target group for survey''  
--, d4.kysymys_en								AS ''Question''
--, d4.kysymysryhma_en						AS ''Question group''
----, COALESCE(NULLIF(d6.vastaus_en,''Missing data''),numerovalinta)						AS ''Multiple choice option''

--, d1.nimi_amos_spl							AS ''Education provider''
--, d2.maakunta_en							AS ''Region of the education provider''
--, d2.kunta_en								AS ''Municipality of the education provider''
--, d2.avi_en									AS ''AVI area of the education provider''
--, d2.ely_en									AS ''ELY area of the education provider''
--, o2.organisaatio_en						AS ''Educational institution''
--, a2.maakunta_en							AS ''Region of the institution''
--, a2.kunta_en								AS ''Municipality of the institution''
--, a2.avi_en									AS ''AVI area of the institution''
--, a2.ely_en									AS ''ELY area of the institution''

														--KOODIMUUTTUJAT
--, d7.koulutusluokitus_koodi					AS ''Koodit Tutkinto''
--, o2.organisaatio_koodi						AS ''Koodit Oppilaitos''
, f.org_koodi								AS ''Koodit Koulutuksen järjestäjä''
--, d3.kuukausi								AS ''Koodit Tilastokuukausi''     


														--JÄRJESTYSMUUTTUJAT
, d2b.jarjestys_avi_koodi					AS ''Järjestys jarj avi''
, d2b.jarjestys_ely_koodi					AS ''Järjestys jarj ely''
, d2b.jarjestys_maakunta_koodi				AS ''Järjestys jarj maakunta''
--, a2.jarjestys_avi_koodi					AS ''Järjestys opp avi''
--, a2.jarjestys_ely_koodi					AS ''Järjestys opp ely''
--, a2.jarjestys_maakunta_koodi				AS ''Järjestys opp maakunta''
--, COALESCE(NULLIF(d6.koodi,-1),numerovalinta)						AS ''Järjestys monivalintavaihtoehto''
, d4.kysymysjarjestys						AS ''Järjestys kysymys''
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_fi=d4.kysymysryhma_fi)	AS ''Järjestys kysymysryhma''


														--MUUT
, f.numerovalinta_summa
, keskiarvo = f.numerovalinta_ka
, keskihajonta = f.numerovalinta_kh
--, f3.kyselyn_kohteet_arvo
--, f3.kyselyn_kohteet_vahvistettu
--, f3.vastanneet_arvo
--, f3.vastanneet_vahvistettu
--, f3.vastanneet_rahoitus
--, f3.vastausosuus_rahoitus
--, f3.vastaajamaaran_lahde
--, f3.katokorjauskerroin_rahoitus
--, f3.katokorjauskerroin_arvo
, vastausosuudet_kertoimet_id = f3.id
FROM (

	SELECT
		ca.org_koodi
		--,f.d_organisaatio_koulutustoimija_id
		--,d_organisaatio_oppilaitos_id
		--,d_alueluokitus_oppilaitos_id
		,d3.rahoituskausi_amm
		,d_arvokysymys_id
		,d2.kyselypohja_tarkenne_fi
		,d2.kyselypohja_tarkenne_amis_fi
		,numerovalinta_summa = sum(cast(numerovalinta as int))
		,numerovalinta_ka = avg(cast(numerovalinta as int) * 1.0)
		,numerovalinta_kh = stdevp(cast(numerovalinta as int))
	FROM dw.f_arvo_amis f
	LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id = f.d_amos_spl_jarjestaja_linkki_id
	LEFT JOIN dw.d_arvokyselykerta d2 ON d2.id = f.d_arvokyselykerta_id
	LEFT JOIN dw.d_kalenteri d3 ON d3.id = f.d_kalenteri_tunnus_luotu_id
	LEFT JOIN dw.d_arvokysymys d4 ON d4.id = f.d_arvokysymys_id
	CROSS APPLY (
		SELECT 
			org_koodi = case when dateadd(year, -1, d1.voimaan_alkaen) < convert(date, right(d3.rahoituskausi_amm,10), 103) then d1.ytunnus_amos_spl else d1.ytunnus_avain end
	) ca
	WHERE 1=1
	and d1.sisaltyy_amos_spl = 1 
	and d_kalenteri_tunnus_luotu_id != ''-1'' 
	and d4.rahoitusmallikysymys = 1
	and datediff(month,d3.paivays,getdate()) >= 3 
	GROUP BY 
		ca.org_koodi
		,d3.rahoituskausi_amm
		,d_arvokysymys_id
		,d2.kyselypohja_tarkenne_fi
		,d2.kyselypohja_tarkenne_amis_fi
	HAVING sum(cast(numerovalinta as int)) is not null
	
) AS f

--LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_koulutustoimija_id									
--LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id=f.d_amos_spl_jarjestaja_linkki_id
LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_koodi=f.org_koodi
LEFT JOIN dw.d_alueluokitus d2b on d2b.kunta_koodi=coalesce(d2.kunta_koodi,-1)
--LEFT JOIN dw.d_organisaatioluokitus o2 ON f.d_organisaatio_oppilaitos_id = o2.id													
--LEFT JOIN dw.d_alueluokitus a2 on a2.id=f.d_alueluokitus_oppilaitos_id	
--LEFT JOIN dw.d_kalenteri d3 ON f.d_kalenteri_tunnus_luotu_id=d3.id   
--LEFT JOIN dw.d_kalenteri d3b ON f.d_kalenteri_vastaus_id = d3b.id
LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
--LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
--LEFT JOIN dw.d_arvovastaus_monivalinta d6 ON f.d_arvovastaus_monivalinta_id = d6.id
--LEFT JOIN dw.d_koulutusluokitus d7 ON f.d_koulutusluokitus_id = d7.id
--LEFT JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.id = f.d_arvovastaus_taustakysymys_sukupuoli_id
--LEFT JOIN dw.d_arvovastaus_taustakysymys d9 ON d9.id = f.d_arvovastaus_taustakysymys_aidinkieli_id
--LEFT JOIN dw.d_arvovastaus_taustakysymys av ON av.id = f.d_arvovastaus_taustakysymys_hakeutumisvayla_id
--LEFT JOIN dw.d_arvovastaus_koulutustausta av2 ON av2.vastaajaid = f.vastaajaid
--LEFT JOIN dw.d_arvovastaus_taustakysymys av3 ON av3.id = f.d_arvovastaus_taustakysymys_ika_id
--LEFT JOIN dw.d_oppisopimuskoulutus av4 ON av4.id = f.d_oppisopimuskoulutus_id
--LEFT JOIN dw.d_arvovastaus_taustakysymys av5 ON av5.id = f.d_arvovastaus_taustakysymys_arvio_tilanteesta_id
--LEFT JOIN dw.d_arvovastaus_koulutustausta p ON p.vastaajaid = f.vastaajaid 
--LEFT JOIN dw.f_arvo_luodut_vastaajatunnukset f2 ON f2.kyselykertaid = d5.kyselykertaid 
--												and f2.oppilaitoskoodi = o2.organisaatio_koodi 
--												and f2.tutkintokoodi = d7.koulutusluokitus_koodi 
--												and YEAR(f2.kuukausi) = d3.vuosi and MONTH(f2.kuukausi) = d3.kuukausi
LEFT JOIN dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet f3 ON f3.rahoituskausi = f.rahoituskausi_amm AND f3.ytunnus = f.org_koodi and f3.kysely_tarkenne = f.kyselypohja_tarkenne_fi

WHERE 1=1
--and d4.rahoitusmallikysymys=1












' 
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijapalaute_vastausosuudet_kertoimet]    Script Date: 28.7.2021 17:59:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_opiskelijapalaute_vastausosuudet_kertoimet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_opiskelijapalaute_vastausosuudet_kertoimet] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijapalaute_vastausosuudet_kertoimet] AS

--DROP TABLE IF EXISTS dw.f_arvo_amis_vastausosuudet_kertoimet
TRUNCATE TABLE dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet

INSERT INTO dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet (	
	[ytunnus]
	,[jarj]
	,[rahoituskausi]
	,[kysely]
	,[kysely_tarkenne]
	,[kyselyn_kohteet_arvo]
	,[kyselyn_kohteet_vahvistettu]
	,[vastanneet_arvo]
	,[vastanneet_vahvistettu]
	,[vastanneet_rahoitus]
	,[vastaajamaaran_lahde]
	,[vastausosuus_arvo]
	,[vastausosuus_rahoitus]
	,[katokorjauskerroin_rahoitus]
	,[katokorjauskerroin_arvo]
)

SELECT DISTINCT 

	q4.[organisaatio_koodi]
	,ol.[organisaatio_fi]
    ,[Rahoituskausi]
    ,[Kysely]
	,[Kysely tarkenne]
    ,[kyselyn_kohteet_arvo]
	,[Vahvistetut kyselyn kohteena olleet]
	,[vastaajat_arvo]
    ,[Vahvistetut vastanneet]
    ,[Vastaajat (Rahoitus)]
    ,[vastaajamaaran_lahde]
    ,[Vastausosuus_arvo]
	,[vastausosuus_rahoitus]
	,katokorjauskerroin_rahoitus =
		CASE 
			WHEN Rahoituskausi = '01.07.2018 - 30.06.2019' THEN
				CASE
					WHEN vastausosuus_rahoitus >= 0.8 THEN 1.0 / vastausosuus_rahoitus
					ELSE 1 + ((15.0/16.0) * vastausosuus_rahoitus) - ((25.0/32.0) * vastausosuus_rahoitus * vastausosuus_rahoitus)
				END
			ELSE 
				CASE
					WHEN vastausosuus_rahoitus >= 0.7 THEN 1.0 / vastausosuus_rahoitus
					WHEN vastausosuus_rahoitus <= 0.2 THEN (857.0/350.0)
					ELSE (1.0 / 0.7) + 2.04 * (0.7 - vastausosuus_rahoitus)
				END
		END
	,katokorjauskerroin_arvo =
		CASE 
			WHEN Rahoituskausi = '01.07.2018 - 30.06.2019' THEN
				CASE
					WHEN vastausosuus_arvo >= 0.8 THEN 1.0 / vastausosuus_arvo
					ELSE 1 + ((15.0/16.0) * vastausosuus_arvo) - ((25.0/32.0) * vastausosuus_arvo * vastausosuus_arvo)
				END
			ELSE
				CASE
					WHEN vastausosuus_arvo >= 0.7 THEN 1.0 / vastausosuus_arvo
					WHEN vastausosuus_arvo <= 0.2 THEN (857.0/350.0)
					ELSE (1.0 / 0.7) + 2.04 * (0.7 - vastausosuus_arvo)
				END
		END
	
--INTO dw.f_arvo_amis_vastausosuudet_kertoimet
FROM (
	SELECT 
		*
		,Vastausosuus_rahoitus = ([Vastaajat (Rahoitus)] * 1.0) / (nullif([Vahvistetut kyselyn kohteena olleet],0) * 1.0) 
		,Vastausosuus_arvo = (nullif([vastaajat_arvo],0) * 1.0) / ([kyselyn_kohteet_arvo] * 1.0) 
			
	FROM (
		SELECT 
			*
			,[Vastaajat (Rahoitus)] =
				CASE
					WHEN [Vahvistetut vastanneet] IS NULL THEN vastaajat_arvo
					WHEN vastaajat_arvo IS NULL THEN [Vahvistetut vastanneet] 
					WHEN [Vahvistetut vastanneet] <= vastaajat_arvo THEN [Vahvistetut vastanneet]
					WHEN [Vahvistetut vastanneet] > vastaajat_arvo THEN vastaajat_arvo
					ELSE 0 
				END
			,vastaajamaaran_lahde =
				CASE 
					WHEN [Vahvistetut vastanneet] IS NULL THEN 'Vastanneet (Arvo)'
					WHEN vastaajat_arvo IS NULL THEN 'Vastanneet (OPH)'
					WHEN [Vahvistetut vastanneet] = vastaajat_arvo THEN 'Sama'
					WHEN [Vahvistetut vastanneet] < vastaajat_arvo THEN 'Vastanneet (OPH)'
					WHEN [Vahvistetut vastanneet] > vastaajat_arvo THEN 'Vastanneet (Arvo)'
					ELSE 'Tuntematon' 
				END
		FROM (
			--vahvistettujen tietojen yhdistäminen arvon tietoihin
			SELECT distinct
				 organisaatio_koodi = ca2.org_koodi
				,Rahoituskausi = q1.Rahoituskausi
				,Kysely
				,[Kysely tarkenne]
				,kyselyn_kohteet_arvo = sum(kyselynkohteet_arvo)
				,[Vahvistetut kyselyn kohteena olleet] = sum([Vahvistetut kyselyn kohteena olleet])
				,vastaajat_arvo = sum(vastaajat_arvo)
				,[Vahvistetut vastanneet] = sum([Vahvistetut vastanneet] )
				
			FROM (
				--arvon tiedot
				SELECT distinct
					organisaatio_koodi = d1.organisaatio_koodi
					,d3.rahoituskausi_amm						AS 'Rahoituskausi'
					,d5.kyselypohja_tarkenne_amis_fi			AS 'Kysely'
					,d5.kyselypohja_tarkenne_fi					AS 'Kysely tarkenne'
					,f2.kyselynkohteet_arvo
					,vastaajat_arvo = count(distinct vastaajaid)
				FROM dw.f_arvo_amis AS f
				LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id = f.d_organisaatio_koulutustoimija_id
				LEFT JOIN dw.d_kalenteri d3 ON d3.id = f.d_kalenteri_tunnus_luotu_id
				LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
				LEFT JOIN (
					SELECT 
						kal.rahoituskausi_amm
						,jarjestaja_koodi = org2.organisaatio_koodi
						,kyselypohja_tarkenne_fi
						,SUM([vastaajatunnukset_lkm]) AS kyselynkohteet_arvo
					FROM [ANTERO].[dw].[f_arvo_luodut_vastaajatunnukset] f 
					LEFT JOIN dw.d_kalenteri kal ON kal.kalenteri_avain = f.kuukausi
					LEFT JOIN dw.d_organisaatioluokitus org ON f.oppilaitoskoodi = org.organisaatio_koodi
					LEFT JOIN dw.d_organisaatioluokitus org2 ON org2.organisaatio_oid=org.ylaorganisaatio_oid
					LEFT JOIN dw.d_arvokyselykerta akk ON akk.kyselykertaid=f.kyselykertaid
					WHERE kal.rahoituskausi_amm is not null and datediff(month,kal.paivays,getdate()) >= 3 
					GROUP BY kal.rahoituskausi_amm, org2.organisaatio_koodi, kyselypohja_tarkenne_fi
				) f2 ON f2.kyselypohja_tarkenne_fi = d5.kyselypohja_tarkenne_fi and f2.jarjestaja_koodi = d1.organisaatio_koodi and f2.rahoituskausi_amm = d3.rahoituskausi_amm --and coalesce(f2.tutkintokoodi,'-1') = d7.koulutusluokitus_koodi

				WHERE f.d_kalenteri_tunnus_luotu_id != '-1' and datediff(month,d3.paivays,getdate()) >= 3 
				GROUP BY d1.organisaatio_koodi,d3.rahoituskausi_amm,d5.kyselypohja_tarkenne_amis_fi,d5.kyselypohja_tarkenne_fi,kyselynkohteet_arvo
			) q1 

			LEFT JOIN [dw].[f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu] f3 ON f3.rahoituskausi = q1.Rahoituskausi AND f3.[Koulutuksen järjestäjän Y-tunnus] = q1.organisaatio_koodi
			CROSS APPLY (
				SELECT
					[Vahvistetut vastanneet] = 
						case 
							when q1.[Kysely tarkenne] = 'Aloittaneet' then f3.[Vastanneet (Aloitusvaiheenkysely)]
							when q1.[Kysely tarkenne] = 'Koko tutkinnon suorittaneet' then f3.[Vastanneet (Tutkinnon suorittaneiden päättövaiheen kysely)]
							when q1.[Kysely tarkenne] = 'Tutkinnon osia suorittaneet' then f3.[Vastanneet (Tutkinnon osan suorittaneiden päättövaiheen kysely)]
						end
					,[Vahvistetut kyselyn kohteena olleet] = 
						case 
							when q1.[Kysely tarkenne] = 'Aloittaneet' then f3.[Kyselyn kohteena olleet  (Aloitusvaiheenkysely)]
							when q1.[Kysely tarkenne] = 'Koko tutkinnon suorittaneet' then f3.[Kyselyn kohteena olleet  (Tutkinnon suorittaneiden päättövaiheen kysely)]
							when q1.[Kysely tarkenne] = 'Tutkinnon osia suorittaneet' then f3.[Kyselyn kohteena olleet  (Tutkinnon osan suorittaneiden päättövaiheen kysely)]
						end 
			) ca
			LEFT JOIN dw.d_amos_spl_jarjestaja_linkki jl ON jl.ytunnus_avain = q1.organisaatio_koodi
			CROSS APPLY (
				SELECT
					rahoituskausi_loppu = convert(date, right(q1.Rahoituskausi,10), 103)
			) ca1
			CROSS APPLY (
				SELECT
					org_koodi = case when cast(dateadd(year, -1, jl.voimaan_alkaen) as date) < ca1.rahoituskausi_loppu then jl.ytunnus_amos_spl else jl.ytunnus_avain end
			) ca2

			GROUP BY ca2.org_koodi,q1.Rahoituskausi,Kysely,[Kysely tarkenne]

		) q2 
	) q3
) q4
LEFT JOIN dw.d_organisaatioluokitus ol on ol.organisaatio_koodi = q4.organisaatio_koodi
ORDER BY q4.organisaatio_koodi, Rahoituskausi
