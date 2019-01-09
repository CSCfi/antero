USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvokyselykerta]    Script Date: 9.1.2019 13:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_d_arvokyselykerta] AS

if not exists (select * from dw.d_arvokyselykerta where id=-1) begin
set identity_insert dw.d_arvokyselykerta on;
insert into dw.d_arvokyselykerta (
   id
  ,[source]
  ,[kyselykertaid]
  ,[kyselykerta]
  ,[kyselyid]
  ,[kysely_fi]
  ,[kysely_sv]
  ,[kysely_en]
  ,kyselypohja
  ,vuosi
)

SELECT distinct
   -1
  ,[source]
  ,koodi
  ,nimi
  ,koodi
  ,nimi
  ,nimi_sv
  ,nimi_en
  ,nimi
  ,-1
FROM sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
set identity_insert dw.d_arvokyselykerta off;
end
MERGE dw.d_arvokyselykerta AS target
USING (

/*
	SELECT
		kyselyid,
		COALESCE(kysely_fi,kysely_sv,kysely_en) kysely_fi,
		COALESCE(kysely_sv,kysely_fi,kysely_en) kysely_sv,
		COALESCE(kysely_en,kysely_fi,kysely_sv) kysely_en,
		kyselykertaid,
		kyselykerta,
		case
			when
			kyselykerta IN
			(
			'AUTOMAATTI AVOP-AMK 2016',
			'AUTOMAATTI AVOP-AMK 2017',
			'AUTOMAATTI AVOP-AMK 2018',
			'AUTOMAATTI AVOP-AMK 2019'
			)
			OR kyselykertaId IN
			(
			'559',
			'560',
			'561',
			'562',
			'563',
			'564',
			'565',
			'566',
			'567',
			'622',
			'623',
			'624',
			'545',
			'671',
			'672',
			'946',
			'947',
			'883',
			'886',
			'887'
			)
			OR kysely_fi IN
			(
			'2017 VAMK Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely  (AVOP)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely  (AVOP)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely ( AVOP )'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP-AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP-automaatti)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, AMK 2017)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, amk-tutkinto)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP) 2017'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP) 2017'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP) 2017'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP) 2017, CENTRIA'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP) Polamk'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP)_2017'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP), AMK-tutkinto'
			,'AMMATTIKORKEAKOULUJEN VALMISTUMISVAIHEEN OPISKELIJAPALAUTEKYSELY (AVOP), ammattikorkeakoulututkinto'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP), automatisoitu'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP): Jyväskylän ammattikorkeakoulu (AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (BITA)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (HYOS)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (TEOS)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (YRLI)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely 2017 (AVOP)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely AVOP (AMK)'
			,'AMMATTIKORKEAKOULUJEN VALMISTUMISVAIHEEN OPISKELIJAPALAUTEKYSELY, ammattikorkeakoulututkinto'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely, Centria-AMK'
			,'AVOP - Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AMK), Centria-AMK'
			,'AVOP ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely, JAMK (AMK-tutkinnot)'
			,'AVOP valmistumisvaiheen päättökysely'
			,'AVOP Valmistumisvaiheen valtakunnallinen opiskelijapalautekysely'
			,'AVOP, AMK (Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely)'
			,'AVOP, Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (amk-tutkinto)'
			,'Centria-AMK - Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP)'
			,'GRADUAND FEEDBACK QUESTIONNAIRE (dss)'
			,'KAMK valmistumisvaiheen opiskelijapalautekysely (AVOP, AMK)'
			,'Opiskelijapalaute, AMK -tutkinto'
			,'Opiskelijapalautekysely, AMK-tutkinto'
			,'Valmistumisvaiheen opiskelijapalautekysely (AMK)'
			,'Valmistumisvaiheen opiskelijapalautekysely (AMK), AVOP'
			,'Valmistumisvaiheen opiskelijapalautekysely (AVOP, AMK)'
			,'Valmistuneiden palautekysely (AVOP)'
			,'Valmistuvan palaute, AMK-tutkinto'
			,'Valtakunnallinen valmistumisvaiheen opiskelijapalautekysely, JAMK (AMK-tutkinnot)'
			,'VAMK - Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP)'
			,'VAMK Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP)'
			,'Insinööri (AMK), Tieto- ja viestintätekniikka 2017'
			,'Insinööri (AMK), Konetekniikka 2017'
			,'Karelia Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP)'
			)
			then 'AVOP-AMK'


			when
			kyselykerta IN
			(
			'AUTOMAATTI AVOP-YAMK 2016',
			'AUTOMAATTI AVOP-YAMK 2017',
			'AUTOMAATTI AVOP-YAMK 2018',
			'AUTOMAATTI AVOP-YAMK 2019'
			)
			OR kyselykertaId IN
			(
			'611',
			'612',
			'613',
			'614',
			'615',
			'616',
			'625',
			'626',
			'948',
			'888',
			'889',
			'890'
			)
			OR kysely_fi IN
			(
			'2017 VAMK Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely  (AVOP, ylempi AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely ( AVOP, ylempi AMK )'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely ( AVOP, ylempi AMK )_2017'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP-YAMK)'
			,'AMMATTIKORKEAKOULUJEN VALMISTUMISVAIHEEN OPISKELIJAPALAUTEKYSELY (AVOP), ylempi ammattikorkeakoulututkinto'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (ylempi AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (ylempi AMK), Centria-AMK'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK 2017)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK) 2'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi amk) 2017'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK) 2017'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK) 2017'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK), automatisoitu'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP): Jyväskylän ammattikorkeakoulu (YAMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely 2017 (AVOP, ylempi AMK)'
			,'Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely AVOP (ylempi AMK)'
			,'AMMATTIKORKEAKOULUJEN VALMISTUMISVAIHEEN OPISKELIJAPALAUTEKYSELY, ylempi ammattikorkeakoulututkinto'
			,'AVOP Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely, JAMK (ylemmät AMK-tutkinnot)'
			,'AVOP - Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (YAMK), Centria-AMK'
			,'AVOP YAMK valmistumisvaiheen valtakunnallinen opiskelijapalautekysely'
			,'AVOP, Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (yamk-tutkinto)'
			,'KAMK valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK)'
			,'Opiskelijapalautekysely, YAMK-tutkinto'
			,'AVOP, ylempi AMK (Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely)'
			,'VAMK Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK)'
			,'VAMK - Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK)'
			,'Valmistuneiden palautekysely (AVOP, ylempi AMK)'
			,'Valmistumisvaiheen opiskelijapalautekysely (AVOP, YAMK)'
			,'Valmistumisvaiheen opiskelijapalautekysely (YAMK)'
			,'Valmistumisvaiheen opiskelijapalautekysely (YAMK) , AVOP'
			,'Valmistumisvaiheen opiskelijapalautekysely AVOP (YAMK)'
			,'Valmistumisvaiheen opiskelijapalautekysely, AVOP (YAMK)'
			,'Valmistuvan palaute; YAMK-tutkinto'
			,'Valtakunnallinen valmistumisvaiheen opiskelijapalautekysely, JAMK (ylemmät AMK-tutkinnot)'
			,'Karelia Ammattikorkeakoulujen valmistumisvaiheen opiskelijapalautekysely (AVOP, ylempi AMK)'
			)
			then 'AVOP-YAMK'


			when
			kyselykerta IN
			(
			'AUTOMAATTI KANDI 2016',
			'AUTOMAATTI KANDI 2017',
			'AUTOMAATTI LAAKIS 2017',
			'AUTOMAATTI EKONOMIT 2017',
			'AUTOMAATTI KANDI 2018',
			'AUTOMAATTI LAAKIS 2018',
			'AUTOMAATTI EKONOMIT 2018',
			'AUTOMAATTI TEK 2018',
			'AUTOMAATTI EKONOMIT 2018 Hanken',
			'AUTOMAATTI KANDI 2019'
			)
			OR kysely_fi IN
			(
			'Kandidatrespons 2017 + Finlands ekonomer + Svenska handelshögskolan'
			,'Kandipalaute 2017'
			,'Kandipalaute 2017 + Suomen Ekonomit'
			,'Kandipalaute 2017 + Suomen lääkäriliitto'
			,'Kandipalaute 2017 + TEK'
			,'Kandipalaute 2017+ TEK'
			,'Kandipalaute 2017, Tampereen teknillinen yliopisto'
			,'Itä-Suomen yliopisto: Kandidaattipalaute 2017'
			,'Itä-Suomen yliopisto: Kandidaattipalaute 2017 + Lääkäriliitto'
			,'Itä-Suomen yliopisto: Kandidaattipalaute 2017 + Suomen Ekonomit'
			,'JY kandipalaute 2017'
			,'JY Kandipalaute 2017 + Suomen Ekonomit'

			)
			then 'KANDIPALAUTE'


			when kyselykerta in
			(
			''
			)
			then 'URASEURANTA-AMK'

			when kyselykerta in
			(
			''
			)
			then 'URASEURANTA-YAMK'


			when kyselykerta in
			(
			'Uraseuranta maisterit 2017 -Aalto-yliopisto'
			,'Maisteriuraseuranta17'
			,'UEF_maisteriuraseuranta2017'
			,'Uraseuranta maisterit 2017 (Jyväskylän yliopisto)'
			,'Uraseuranta maisterit 2017'
			,'Uraseuranta maisterit 2017 Hanken'
			,'Uraseuranta maisterit 2017 - Taideyliopisto'
			,'Uraseuranta maisterit 2017 (Vaasan yliopisto)'
			,'Karriäruppföljning magistrar 2017'
			)
			then 'URASEURANTA-MAISTERI'


			when kyselykerta in
			(
			'Uraseuranta tohtorit 2017 - Aalto-yliopisto'
			,'Tohtoriseuranta17'
			,'UEF Uraseuranta tohtorit 2017'
			,'Uraseuranta tohtorit 2017 (Jyväskylän yliopisto)'
			,'Uraseura tohtorit 2017'
			,'Uraseuranta tohtorit 2017'
			,'Uraseuranta tohtorit 2017 Hanken'
			,'Uraseuranta tohtorit 2017 - Taideyliopisto'
			,'Uraseuranta tohtorit 2017 (Vaasan yliopisto)'
			,'Karriäruppföljning för doktorer 2017'
			)
			then 'URASEURANTA-TOHTORI'

		else 'Muu'
	end as kyselypohja,

	case
		when kysely_fi like '%2017%' then 2017
		when kyselykerta like '%2017%' then 2017
		when kysely_fi like '%2018%' then 2018
		when kyselykerta like '%2018%' then 2018
		when kyselykertaid in ('622','623','624','625','626','731','733') then 2017
		else 2016
	end as vuosi,
	'ETL: p_lataa_d_avopkyselykerta' AS source
	FROM sa.sa_arvo_kaikki
	WHERE 1 = 1
	GROUP BY kyselykertaid, kyselykerta, kyselyid, kysely_fi, kysely_sv, kysely_en

	UNION 
*/

	SELECT
		kyselyid,
		COALESCE(kysely_fi,kysely_sv,kysely_en) kysely_fi,
		COALESCE(kysely_sv,kysely_fi,kysely_en) kysely_sv,
		COALESCE(kysely_en,kysely_fi,kysely_sv) kysely_en,
		kyselykertaid,
		kyselykerta,
		kyselypohja_nimi as kyselypohja,
		CASE kyselypohja_tarkenne 
			WHEN 'aloittaneet' THEN 'Aloittaneet' 
			WHEN 'osia_suorittaneet' THEN 'Tutkinnon osia suorittaneet'
			WHEN 'tutkinnon_suorittaneet' THEN 'Koko tutkinnon suorittaneet'
			ELSE kyselypohja_tarkenne 
		END AS kyselypohja_tarkenne,
		kyselykerta_vuosi as vuosi,
		'ETL: p_lataa_d_avopkyselykerta' AS source
	FROM Arvo_SA.sa.sa_arvo_kyselykerrat
	WHERE kysely_tila='julkaistu'

/*
UNION

SELECT
  kyselyid,
  COALESCE(kysely_fi,kysely_sv,kysely_en) kysely_fi,
  COALESCE(kysely_sv,kysely_fi,kysely_en) kysely_sv,
  COALESCE(kysely_en,kysely_fi,kysely_sv) kysely_en,
  kyselykertaid,
  kyselykerta,
  case

when kyselykerta in
(
''
)
then 'URASEURANTA-AMK'

when kyselykerta in
(
''
)
then 'URASEURANTA-YAMK'

when kyselykerta in
(
''
)
then 'URASEURANTA-KANDI'

when kyselykerta in
(
'Uraseuranta maisterit 2017 -Aalto-yliopisto'
,'Maisteriuraseuranta17'
,'UEF_maisteriuraseuranta2017'
,'Uraseuranta maisterit 2017 (Jyväskylän yliopisto)'
,'Uraseuranta maisterit 2017'
,'Uraseuranta maisterit 2017 Hanken'
,'Uraseuranta maisterit 2017 - Taideyliopisto'
,'Uraseuranta maisterit 2017 (Vaasan yliopisto)'
,'Karriäruppföljning magistrar 2017'
)
then 'URASEURANTA-MAISTERI'

when kyselykerta in
(
'Uraseuranta tohtorit 2017 - Aalto-yliopisto'
,'Tohtoriseuranta17'
,'UEF Uraseuranta tohtorit 2017'
,'Uraseuranta tohtorit 2017 (Jyväskylän yliopisto)'
,'Uraseura tohtorit 2017'
,'Uraseuranta tohtorit 2017'
,'Uraseuranta tohtorit 2017 Hanken'
,'Uraseuranta tohtorit 2017 - Taideyliopisto'
,'Uraseuranta tohtorit 2017 (Vaasan yliopisto)'
,'Karriäruppföljning för doktorer 2017'
)
then 'URASEURANTA-TOHTORI'

else 'Muu'
end as kyselypohja,

case
  when kysely_fi like '%2017%' then 2017
  when kyselykerta like '%2017%' then 2017
  when kyselykerta like '%17%' then 2017
  when kysely_fi like '%2018%' then 2018
  when kyselykerta like '%2018%' then 2018
  when kyselykertaid in ('622','623','624','625','626','731','733') then 2017
  else 2016
end as vuosi,
  'ETL: p_lataa_d_avopkyselykerta' AS source
FROM sa.sa_arvo_uraseuranta
WHERE 1 = 1
GROUP BY
kyselykertaid
, kyselykerta
, kyselyid
, kysely_fi
, kysely_sv
, kysely_en

*/
  ) AS src

ON target.kyselykertaid = src.kyselykertaid AND target.kyselyid = src.kyselyid --AND target.kyselykerta=src.kyselykerta AND target.kysely_fi=src.kysely_fi

WHEN MATCHED THEN

	UPDATE SET
		kysely_fi = src.kysely_fi,
		kysely_sv = src.kysely_sv,
		kysely_en = src.kysely_en,
		kyselykerta = src.kyselykerta,
		kyselypohja = src.kyselypohja,
		kyselypohja_tarkenne = src.kyselypohja_tarkenne,
		vuosi = src.vuosi,
		target.source = src.source

WHEN NOT MATCHED THEN

	  INSERT (
		kyselyid,
		kysely_fi,
		kysely_sv,
		kysely_en,
		kyselykertaid,
		kyselykerta,
		kyselypohja,
		kyselypohja_tarkenne,
		vuosi,
		source
	  )
	  VALUES (
		src.kyselyid, src.kysely_fi, src.kysely_sv, src.kysely_en,
		src.kyselykertaid, src.kyselykerta,src.kyselypohja,src.kyselypohja_tarkenne,src.vuosi,
		src.source
	);
	