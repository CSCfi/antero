USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_arvokyselykerta]    Script Date: 4.9.2023 18:38:51 ******/
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
  ,kyselypohja_tarkenne_fi
  ,kyselypohja_tarkenne_sv
  ,kyselypohja_tarkenne_en
  ,kyselypohja_tarkenne_amis_fi
  ,kyselypohja_tarkenne_amis_sv
  ,kyselypohja_tarkenne_amis_en
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
  ,nimi
  ,nimi_sv
  ,nimi_en
  ,nimi
  ,nimi_sv
  ,nimi_en
  ,-1
FROM sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
set identity_insert dw.d_arvokyselykerta off;
end

MERGE dw.d_arvokyselykerta AS target
USING (

	SELECT
		kyselyid,
		COALESCE(kysely_fi,kysely_sv,kysely_en) kysely_fi,
		COALESCE(kysely_sv,kysely_fi,kysely_en) kysely_sv,
		COALESCE(kysely_en,kysely_fi,kysely_sv) kysely_en,
		kyselykertaid,
		kyselykerta,
		tyyppi as kyselypohja,
		kyselypohja_tarkenne_fi =
			CASE 
				WHEN kyselypohja_tarkenne = 'aloittaneet' THEN 'Aloittaneet' 
				WHEN kyselypohja_tarkenne  = 'tutkinnon_osia_suorittaneet' THEN 'Tutkinnon osia suorittaneet'
				WHEN kyselypohja_tarkenne  = 'tutkinnon_suorittaneet' THEN 'Koko tutkinnon suorittaneet'
				WHEN tyyppi = 'avop' and kyselypohja_nimi like '%YAMK%' THEN 'YAMK'
				WHEN tyyppi = 'avop' THEN 'AMK'
				WHEN tyyppi = 'tyopaikkakysely' THEN 'Työelämäpalaute: työpaikkakysely' --työpaikkakyselyllä 2023 uusi nimi, varmistetaan suodatusten pysyvyys
				WHEN tyyppi = 'tyopaikkaohjaajakysely' THEN 'Työelämäpalaute: työpaikkaohjaajan kysely' --varmistetaan suodatusten pysyvyys
				ELSE coalesce(kyselypohja_tarkenne, kyselypohja_nimi)
			END 
		,kyselypohja_tarkenne_sv = 
			CASE 
				WHEN kyselypohja_tarkenne  = 'aloittaneet' THEN 'Inlett' 
				WHEN kyselypohja_tarkenne  = 'tutkinnon_osia_suorittaneet' THEN 'Avlagt en examensdel eller examensdelar'
				WHEN kyselypohja_tarkenne  = 'tutkinnon_suorittaneet' THEN 'Avlagt hela examen'
				WHEN tyyppi = 'avop' and kyselypohja_nimi like '%YAMK%' then 'Högre YH-examen'
				WHEN tyyppi = 'avop' then 'YH-examen'
				WHEN kyselypohja_tarkenne  = 'AMK' THEN 'YH-examen'
				WHEN kyselypohja_tarkenne  = 'YAMK' THEN 'Högre YH-examen'
				WHEN tyyppi = 'tyopaikkakysely' THEN 'Työelämäpalaute: työpaikkakysely' --työpaikkakyselyllä 2023 uusi nimi, varmistetaan suodatusten pysyvyys
				WHEN tyyppi = 'tyopaikkaohjaajakysely' THEN 'Työelämäpalaute: työpaikkaohjaajan kysely' --varmistetaan suodatusten pysyvyys
				ELSE coalesce(kyselypohja_tarkenne, kyselypohja_nimi)
			END 
		,kyselypohja_tarkenne_en =
			CASE 
				WHEN kyselypohja_tarkenne  = 'aloittaneet' THEN 'Started' 
				WHEN kyselypohja_tarkenne  = 'tutkinnon_osia_suorittaneet' THEN 'Completed a vocational qualification unit(s)'
				WHEN kyselypohja_tarkenne  = 'tutkinnon_suorittaneet' THEN 'Completed a vocational qualification in full'
				WHEN tyyppi = 'avop' and kyselypohja_nimi like '%YAMK%' then 'Higher UAS qualification'
				WHEN tyyppi = 'avop' then 'UAS qualification'
				WHEN kyselypohja_tarkenne  = 'AMK' THEN 'UAS qualification'
				WHEN kyselypohja_tarkenne  = 'YAMK' THEN 'Higher UAS qualification'
				WHEN tyyppi = 'tyopaikkakysely' THEN 'Työelämäpalaute: työpaikkakysely' --työpaikkakyselyllä 2023 uusi nimi, varmistetaan suodatusten pysyvyys
				WHEN tyyppi = 'tyopaikkaohjaajakysely' THEN 'Työelämäpalaute: työpaikkaohjaajan kysely' --varmistetaan suodatusten pysyvyys
				ELSE coalesce(kyselypohja_tarkenne, kyselypohja_nimi)
			END 
		,kyselypohja_tarkenne_amis_fi =
			CASE 		
				WHEN kyselypohja_tarkenne = 'aloittaneet' THEN 'Aloituskysely'			
				WHEN kyselypohja_tarkenne in ('tutkinnon_osia_suorittaneet','tutkinnon_suorittaneet') THEN 'Päättökysely'
			END
		,kyselypohja_tarkenne_amis_sv = 
			CASE 		
				WHEN kyselypohja_tarkenne = 'aloittaneet' THEN 'Startenkät'			
				WHEN kyselypohja_tarkenne in ('tutkinnon_osia_suorittaneet','tutkinnon_suorittaneet') THEN 'Slutenkät'
			END
		,kyselypohja_tarkenne_amis_en =
			CASE 	
				WHEN kyselypohja_tarkenne = 'aloittaneet' THEN 'Initial stage questionnaire'			
				WHEN kyselypohja_tarkenne in ('tutkinnon_osia_suorittaneet','tutkinnon_suorittaneet') THEN 'Final stage questionnaire'
			END
		,kyselykerta_vuosi as vuosi,
		'ETL: p_lataa_d_avopkyselykerta' AS source
	FROM Arvo_SA.sa.sa_arvo_kyselykerrat
	
) AS src

ON target.kyselykertaid = src.kyselykertaid AND target.kyselyid = src.kyselyid --AND target.kyselykerta=src.kyselykerta AND target.kysely_fi=src.kysely_fi

WHEN MATCHED THEN

	UPDATE SET
		kysely_fi = src.kysely_fi,
		kysely_sv = src.kysely_sv,
		kysely_en = src.kysely_en,
		kyselykerta = src.kyselykerta,
		kyselypohja = src.kyselypohja,
		kyselypohja_tarkenne_fi = src.kyselypohja_tarkenne_fi,
		kyselypohja_tarkenne_sv = src.kyselypohja_tarkenne_sv,
		kyselypohja_tarkenne_en = src.kyselypohja_tarkenne_en,
		kyselypohja_tarkenne_amis_fi = src.kyselypohja_tarkenne_amis_fi,
		kyselypohja_tarkenne_amis_sv = src.kyselypohja_tarkenne_amis_sv,
		kyselypohja_tarkenne_amis_en = src.kyselypohja_tarkenne_amis_en,
		vuosi = src.vuosi,
		target.source = src.source

WHEN NOT MATCHED BY source AND id != '-1' THEN DELETE

WHEN NOT MATCHED BY target THEN

	  INSERT (
		kyselyid,
		kysely_fi,
		kysely_sv,
		kysely_en,
		kyselykertaid,
		kyselykerta,
		kyselypohja,
		kyselypohja_tarkenne_fi,
		kyselypohja_tarkenne_sv,
		kyselypohja_tarkenne_en,
		kyselypohja_tarkenne_amis_fi,
		kyselypohja_tarkenne_amis_sv,
		kyselypohja_tarkenne_amis_en,
		vuosi,
		source
	  )
	  VALUES (
		src.kyselyid, src.kysely_fi, src.kysely_sv, src.kysely_en
		,src.kyselykertaid, src.kyselykerta,src.kyselypohja
		,src.kyselypohja_tarkenne_fi,kyselypohja_tarkenne_sv,kyselypohja_tarkenne_en
		,src.kyselypohja_tarkenne_amis_fi,kyselypohja_tarkenne_amis_sv,kyselypohja_tarkenne_amis_en
		,src.vuosi,
		src.source
	);
GO
