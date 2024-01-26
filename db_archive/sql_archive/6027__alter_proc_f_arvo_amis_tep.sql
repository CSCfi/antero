USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_amis_tep]    Script Date: 10.3.2022 9:10:04 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_arvo_amis_tep]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvovastaus_taustakysymys]    Script Date: 10.3.2022 9:10:04 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_arvovastaus_taustakysymys]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvovastaus_monivalinta]    Script Date: 10.3.2022 9:10:04 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_arvovastaus_monivalinta]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvovastaus]    Script Date: 10.3.2022 9:10:04 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_arvovastaus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvokysymys]    Script Date: 10.3.2022 9:10:04 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_arvokysymys]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvokyselykerta]    Script Date: 10.3.2022 9:10:04 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_arvokyselykerta]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvokyselykerta]    Script Date: 10.3.2022 9:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_arvokyselykerta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_arvokyselykerta] AS' 
END
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
			CASE kyselypohja_tarkenne 
				WHEN 'aloittaneet' THEN 'Aloittaneet' 
				WHEN 'tutkinnon_osia_suorittaneet' THEN 'Tutkinnon osia suorittaneet'
				WHEN 'tutkinnon_suorittaneet' THEN 'Koko tutkinnon suorittaneet'
				ELSE coalesce(kyselypohja_tarkenne, kyselypohja_nimi)
			END 
		,kyselypohja_tarkenne_sv = 
			CASE kyselypohja_tarkenne 
				WHEN 'aloittaneet' THEN 'Inlett' 
				WHEN 'tutkinnon_osia_suorittaneet' THEN 'Avlagt en examensdel eller examensdelar'
				WHEN 'tutkinnon_suorittaneet' THEN 'Avlagt hela examen'
				WHEN 'AMK' THEN 'YH-examen'
				WHEN 'YAMK' THEN 'Högre YH-examen'
				ELSE coalesce(kyselypohja_tarkenne, kyselypohja_nimi)
			END 
		,kyselypohja_tarkenne_en =
			CASE kyselypohja_tarkenne 
				WHEN 'aloittaneet' THEN 'Started' 
				WHEN 'tutkinnon_osia_suorittaneet' THEN 'Completed a vocational qualification unit(s)'
				WHEN 'tutkinnon_suorittaneet' THEN 'Completed a vocational qualification in full'
				WHEN 'AMK' THEN 'UAS qualification'
				WHEN 'YAMK' THEN 'Higher UAS qualification'
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
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvokysymys]    Script Date: 10.3.2022 9:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_arvokysymys]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_arvokysymys] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_d_arvokysymys] AS

if not exists (select * from dw.d_arvokysymys where id=-1) 

	begin
  
	  set identity_insert dw.d_arvokysymys on;
  
	  insert into dw.d_arvokysymys (
		id,
		kysymysryhmaid,kysymysryhma_fi,kysymysryhma_sv,kysymysryhma_en,
		kysymysid,kysymys_fi,kysymys_sv,kysymys_en,
		kysymysryhmajarjestys,kysymysjarjestys,
		rahoitusmallikysymys,kiusaamiskysymys,
		vastaustyyppi,
		source
	  )
	  select
		-1,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		999,999,
		0,0,
		nimi,
		'ETL: p_lataa_d_arvokysymys'
	  from sa.sa_koodistot
	  where koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  set identity_insert dw.d_arvokysymys off;

	end 

else 

	begin
		update d
		set
		kysymysryhmaid=s.koodi,
		kysymysryhma_fi=s.nimi,
		kysymysryhma_sv=s.nimi_sv,
		kysymysryhma_en=s.nimi_en,
		kysymysid=s.koodi,
		kysymys_fi=s.nimi,
		kysymys_sv=s.nimi_sv,
		kysymys_en=s.nimi_en,
		kysymysryhmajarjestys=999,
		kysymysjarjestys=999,
		rahoitusmallikysymys=0,
		kiusaamiskysymys=0,
		vastaustyyppi=s.nimi,
		source='ETL: p_lataa_d_arvokysymys'
		from dw.d_arvokysymys d
		join sa.sa_koodistot s on s.koodi=d.kysymysryhmaid
		where s.koodisto='vipunenmeta'
		and s.koodi='-1'
		;
	end

MERGE dw.d_arvokysymys AS target

USING (

  SELECT DISTINCT
  k.kysymysryhmaid,
  COALESCE(kysymysryhma_fi,kysymysryhma_sv,kysymysryhma_en) kysymysryhma_fi,
  COALESCE(kysymysryhma_sv,kysymysryhma_fi,kysymysryhma_en) kysymysryhma_sv,
  COALESCE(kysymysryhma_en,kysymysryhma_fi,kysymysryhma_sv) kysymysryhma_en,
  kysymysid,
  COALESCE(kysymys_fi,kysymys_sv,kysymys_en) kysymys_fi,
  COALESCE(kysymys_sv,kysymys_fi,kysymys_en) kysymys_sv,
  COALESCE(kysymys_en,kysymys_fi,kysymys_sv) kysymys_en,
  kkr.jarjestys as kysymysryhmajarjestys,
  k.jarjestys as kysymysjarjestys,
  coalesce(rahoitusmallikysymys,0) as rahoitusmallikysymys,
  case when coalesce(taustakysymyksen_tyyppi,'') in ('kiusaaminen','kiusaamiseen_puuttuminen') then 1 else 0 end as kiusaamiskysymys,
  vastaustyyppi,
  'ETL: p_lataa_d_arvokysymys' AS source
  FROM Arvo_SA.sa.sa_arvo_kysymykset k
  LEFT JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma kkr on kkr.kysymysryhmaid=(SELECT TOP 1 kysymysryhmaid FROM Arvo_SA.sa.sa_arvo_kysely_kysymysryhma WHERE kysymysryhmaid=k.kysymysryhmaid)

   ) AS src
ON target.kysymysryhmaid = src.kysymysryhmaid
  AND target.kysymysid = src.kysymysid
  AND target.kysymysryhmajarjestys = src.kysymysryhmajarjestys
  AND target.kysymysjarjestys = src.kysymysjarjestys
  --AND coalesce(target.rahoitusmallikysymys, 0) = coalesce(src.rahoitusmallikysymys,0)
  AND target.vastaustyyppi = src.vastaustyyppi

WHEN MATCHED THEN
  UPDATE SET
    kysymysryhma_fi = src.kysymysryhma_fi,
    kysymysryhma_sv = src.kysymysryhma_sv,
    kysymysryhma_en = src.kysymysryhma_en,
	kysymysryhmajarjestys = src.kysymysryhmajarjestys,
    kysymys_fi = src.kysymys_fi,
    kysymys_sv = src.kysymys_sv,
    kysymys_en = src.kysymys_en,
	kysymysjarjestys = src.kysymysjarjestys,
    rahoitusmallikysymys = src.rahoitusmallikysymys,
	kiusaamiskysymys = src.kiusaamiskysymys,
    vastaustyyppi = src.vastaustyyppi,
    target.source = src.source

WHEN NOT MATCHED BY source AND id != '-1'  THEN DELETE

WHEN NOT MATCHED BY target THEN
  INSERT (
    kysymysryhmaid,
    kysymysryhma_fi,
    kysymysryhma_sv,
    kysymysryhma_en,
    kysymysid,
    kysymys_fi,
    kysymys_sv,
    kysymys_en,
    kysymysryhmajarjestys,
    kysymysjarjestys,
    rahoitusmallikysymys,
	kiusaamiskysymys,
    vastaustyyppi,
    source
  )
  VALUES (
    src.kysymysryhmaid, src.kysymysryhma_fi, src.kysymysryhma_sv, src.kysymysryhma_en,
    src.kysymysid, src.kysymys_fi, src.kysymys_sv, src.kysymys_en,
    src.kysymysryhmajarjestys, src.kysymysjarjestys,
    src.rahoitusmallikysymys,src.kiusaamiskysymys,
    src.vastaustyyppi,
    src.source
  );

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvovastaus]    Script Date: 10.3.2022 9:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_arvovastaus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_arvovastaus] AS' 
END
GO
ALTER PROCEDURE [dw].[p_lataa_d_arvovastaus] AS
if not exists (select * from dw.d_arvovastaus where id=-1) begin
  set identity_insert dw.d_arvovastaus on;
  insert into dw.d_arvovastaus (
    id, vuosi, vastaus_koodi,
    vastaus_fi,vastaus_sv,vastaus_en,
    kysymysryhmaid, vastaustyyppi,
    source
  )


  select
    -1,-1,
    koodi,nimi,nimi_sv,nimi_en,
    -1, -1,
    'ETL: p_lataa_d_arvovastaus'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_arvovastaus off;
end else begin
  update d
  set
    vuosi = s.koodi,
    vastaus_koodi = s.koodi,
    vastaus_fi = s.nimi,
    vastaus_sv = s.nimi_sv,
    vastaus_en = s.nimi_en,
    kysymysryhmaid = s.koodi,
    vastaustyyppi = s.koodi,
    source = 'ETL: p_lataa_d_arvovastaus'
  from dw.d_arvovastaus d
  join sa.sa_koodistot s on s.koodi=d.vastaus_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end

MERGE dw.d_arvovastaus AS target
USING (
  SELECT
  vuosi,
  koodi,
  COALESCE(selite_fi,selite_sv,selite_en) selite_fi,
  COALESCE(selite_sv,selite_fi,selite_en) selite_sv,
  COALESCE(selite_en,selite_fi,selite_sv) selite_en,
  kysymysryhmaid,
  vastaustyyppi,
  'ETL: p_lataa_d_arvovastaus' AS source
   FROM  sa.sa_suorat_koodistot_arvo_vastaukset
  ) AS src

ON target.vastaus_koodi = src.koodi
  AND target.kysymysryhmaid = src.kysymysryhmaid
  AND target.vuosi = src.vuosi
  AND target.vastaustyyppi = src.vastaustyyppi
WHEN MATCHED THEN
  UPDATE SET
    vuosi = src.vuosi,
    vastaus_koodi = src.koodi,
    vastaus_fi = src.selite_fi,
    vastaus_sv = src.selite_sv,
    vastaus_en = src.selite_en,
    kysymysryhmaid = src.kysymysryhmaid,
    vastaustyyppi = src.vastaustyyppi,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    vuosi,
    vastaus_koodi,
    vastaus_fi,
    vastaus_sv,
    vastaus_en,
    kysymysryhmaid,
    vastaustyyppi,
    source
  )
  VALUES (
    src.vuosi,
    src.koodi, src.selite_fi, src.selite_sv, src.selite_en,
    src.kysymysryhmaid,
    src.vastaustyyppi,
    src.source
  );

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvovastaus_monivalinta]    Script Date: 10.3.2022 9:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_arvovastaus_monivalinta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_arvovastaus_monivalinta] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_arvovastaus_monivalinta] AS

--TARKISTUS ONKO DIMENSIOSSA TIETO PUUTTUU -RIVI. JOS EI, NIIN LISÄTÄÄN. MUUTEN PÄIVITETÄÄN RIVI.
IF NOT EXISTS (SELECT * FROM dw.d_arvovastaus_monivalinta WHERE id=-1)

	BEGIN

	  SET identity_INSERT dw.d_arvovastaus_monivalinta on;

	  INSERT INTO dw.d_arvovastaus_monivalinta (
		id,
		koodi,
		vastaus_fi,
		vastaus_sv,
		vastaus_en,
		kysymysid,
		jarjestys,
		source
	  )


	  SELECT
		-1,
		-1,
		nimi,
		nimi_sv,
		nimi_en,
		-1,
		99,
		'ETL: p_lataa_d_arvovastaus_monivalinta'
	  FROM sa.sa_koodistot
	  WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET identity_INSERT dw.d_arvovastaus_monivalinta off;

	END

ELSE

	BEGIN

	  UPDATE d SET
		koodi = s.koodi,
		vastaus_fi = s.nimi,
		vastaus_sv = s.nimi_sv,
		vastaus_en = s.nimi_en,
		kysymysid = s.koodi,
		jarjestys = 99,
		source = 'ETL: p_lataa_d_arvovastaus_monivalinta'
	  FROM dw.d_arvovastaus_monivalinta d
	  join sa.sa_koodistot s on s.koodi=d.koodi
	  WHERE s.koodisto='vipunenmeta'
	  and s.koodi='-1'
	  ;
	END
--TARKISTUS PÄÄTTYY

--NYKYISTEN TIETOJEN PÄIVITYS TAI UUSIEN LISÄÄMINEN
MERGE dw.d_arvovastaus_monivalinta AS TARGET

	USING (

	  SELECT DISTINCT
		  jarjestys AS koodi,
		 COALESCE(monivalintavaihtoehto_fi,monivalintavaihtoehto_sv,monivalintavaihtoehto_en) AS selite_fi,
		 COALESCE(monivalintavaihtoehto_sv,monivalintavaihtoehto_fi,monivalintavaihtoehto_en) AS selite_sv,
		 COALESCE(monivalintavaihtoehto_en,monivalintavaihtoehto_fi,monivalintavaihtoehto_sv) AS selite_en,
		  v.kysymysid,
		  jarjestys,
		  'ETL: p_lataa_d_arvovastaus_monivalinta' AS source
	   FROM  Arvo_SA.sa.sa_arvo_monivalintavaihtoehdot v
	  -- lähteen SA-taulu muuttunut 2/2021

	  -- INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid=v.kysymysid
	  -- WHERE COALESCE(monivalintavaihtoehto_fi,monivalintavaihtoehto_sv,monivalintavaihtoehto_en) IS NOT NULL
	  -- and taustakysymyksen_tyyppi IS NULL
	  -- and k.valtakunnallinen = 1
	  -- and k.vastaustyyppi = 'monivalinta'

	 ) AS src

ON TARGET.koodi = src.koodi and TARGET.kysymysid = src.kysymysid

WHEN MATCHED THEN

	UPDATE SET
		koodi = src.koodi,
		vastaus_fi = src.selite_fi,
		vastaus_sv = src.selite_sv,
		vastaus_en = src.selite_en,
		kysymysid = src.kysymysid,
		jarjestys = src.jarjestys,
		TARGET.source = src.source

WHEN NOT MATCHED THEN

	INSERT (
	koodi,
	vastaus_fi,
	vastaus_sv,
	vastaus_en,
	kysymysid,
	jarjestys,
	source
	)

	VALUES (
	src.koodi,
	src.selite_fi,
	src.selite_sv,
	src.selite_en,
	src.kysymysid,
	src.jarjestys,
	src.source
	);

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvovastaus_taustakysymys]    Script Date: 10.3.2022 9:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_arvovastaus_taustakysymys]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_arvovastaus_taustakysymys] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_arvovastaus_taustakysymys] AS

--TARKISTUS ONKO DIMENSIOSSA TIETO PUUTTUU -RIVI. JOS EI, NIIN LISÄTÄÄN. MUUTEN PÄIVITETÄÄN RIVI.
IF NOT EXISTS (SELECT * FROM dw.d_arvovastaus_taustakysymys WHERE id=-1) 

	BEGIN

	  SET identity_INSERT dw.d_arvovastaus_taustakysymys on;

	  INSERT INTO dw.d_arvovastaus_taustakysymys (
		id, 
		koodi,
		vastaus_fi,
		vastaus_sv,
		vastaus_en,
		tyyppi,
		kysymysid,
		jarjestys_koodi,
		source
	  )


	  SELECT
		-1,
		-1,
		nimi,
		nimi_sv,
		nimi_en,
		nimi,
		-1,
		99,
		'ETL: p_lataa_d_arvovastaus_taustakysymys'
	  FROM sa.sa_koodistot
	  WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;
 
	SET identity_INSERT dw.d_arvovastaus_taustakysymys off
	END 


ELSE 

	BEGIN

	  UPDATE d SET
		koodi = s.koodi,
		vastaus_fi = s.nimi,
		vastaus_sv = s.nimi_sv,
		vastaus_en = s.nimi_en,
		tyyppi = s.nimi,
		kysymysid = s.koodi,
		jarjestys_koodi = '99',
		source = 'ETL: p_lataa_d_arvovastaus_taustakysymys'
	  FROM dw.d_arvovastaus_taustakysymys d
	  join sa.sa_koodistot s on s.koodi=d.koodi
	  WHERE s.koodisto='vipunenmeta'
	  and s.koodi='-1'
	  ;
	END


--TARKISTUS PÄÄTTYY

--NYKYISTEN TIETOJEN PÄIVITYS TAI UUSIEN LISÄÄMINEN
MERGE dw.d_arvovastaus_taustakysymys AS TARGET

	USING (

	  SELECT DISTINCT
		  COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) AS koodi,
		  COALESCE(monivalintavaihtoehto_fi,(CASE vaihtoehto WHEN 'ei' THEN 'Ei' WHEN 'kylla' THEN 'Kyllä' END)) AS selite_fi,
		  COALESCE(monivalintavaihtoehto_sv,(CASE vaihtoehto WHEN 'ei' THEN 'Nej' WHEN 'kylla' THEN 'Ja' END)) AS selite_sv,
		  COALESCE(monivalintavaihtoehto_en,(CASE vaihtoehto WHEN 'ei' THEN 'No' WHEN 'kylla' THEN 'Yes' END)) AS selite_en,
		  taustakysymyksen_tyyppi AS tyyppi,
		  v.kysymysid,
		  COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) AS jarjestys_koodi,
		  'ETL: p_lataa_d_arvovastaus_taustakysymys' AS source
	   FROM  Arvo_SA.sa.sa_arvo_vastaukset v
	   INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid=v.kysymysid
	   WHERE COALESCE(monivalintavaihtoehto_fi,monivalintavaihtoehto_sv,monivalintavaihtoehto_en,vaihtoehto) IS NOT NULL
	   and k.valtakunnallinen = 1
	   and v.numerovalinta <> '-1'
	   and k.taustakysymyksen_tyyppi is not null
	   
	 ) AS src

ON TARGET.koodi = src.koodi and TARGET.kysymysid = src.kysymysid
  
WHEN MATCHED THEN
  
	UPDATE SET  
		koodi = src.koodi,
		vastaus_fi = src.selite_fi,
		vastaus_sv = src.selite_sv,
		vastaus_en = src.selite_en,
		tyyppi = src.tyyppi,
		kysymysid = src.kysymysid,
		jarjestys_koodi = src.jarjestys_koodi,
		TARGET.source = src.source

WHEN NOT MATCHED THEN
	
	INSERT (
	koodi,
	vastaus_fi,
	vastaus_sv,
	vastaus_en,
	tyyppi,
	kysymysid,
	jarjestys_koodi,
	source
	)

	VALUES (
	src.koodi, 
	src.selite_fi, 
	src.selite_sv, 
	src.selite_en,
	src.tyyppi,
	src.kysymysid,
	src.jarjestys_koodi,
	src.source
	);



GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_amis_tep]    Script Date: 10.3.2022 9:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_arvo_amis_tep]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_arvo_amis_tep] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_f_arvo_amis_tep] AS


DROP INDEX IF EXISTS [NC_arvo_amis_tep] ON [dw].[f_arvo_amis_tep]

DROP TABLE IF EXISTS dw.f_arvo_amis_tep

--TRUNCATE TABLE dw.f_arvo_amis_tep


;WITH 
taustakysymykset AS (
	select distinct 
		kyselykertaid
		,vastaajaid
		,numerovalinta
		,vaihtoehto
		,b.taustakysymyksen_tyyppi
		,b.kysymysid
	from Arvo_SA.sa.sa_arvo_vastaukset a 
	inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid=a.kysymysid 
)
, kyselyjen_linkitys AS (
	SELECT distinct 
		 tyopaikkakysely_vastaajatunnus = k_tpk.vastaajatunnus
		,tyopaikkaohjaajakysely_vastaajatunnus = tpok_tt.vastaajatunnus
	FROM Arvo_SA.sa.sa_arvo_kohteet k_tpk
	LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot tpk_tt ON tpk_tt.vastaajatunnusid = k_tpk.vastaajatunnusid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid = k_tpk.kyselykertaid
	LEFT JOIN (
		SELECT distinct
			k_tpok.vastaajatunnus
			,kk.koulutustoimija
			,tt.tyonantaja
			,tyopaikka_normalisoitu
			,tt.tyopaikkajakson_loppupvm
		FROM Arvo_SA.sa.sa_arvo_kohteet k_tpok
		LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot tt ON tt.vastaajatunnusid = k_tpok.vastaajatunnusid
		LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid = k_tpok.kyselykertaid
		WHERE kk.tyyppi = 'tyoelamapalaute'
	) tpok_tt ON tpok_tt.koulutustoimija = kk.koulutustoimija
			 AND tpok_tt.tyonantaja = tpk_tt.tyonantaja
			 AND coalesce(tpok_tt.tyopaikka_normalisoitu,'') = coalesce(tpk_tt.tyopaikka_normalisoitu,'')
			 AND tpok_tt.tyopaikkajakson_loppupvm between tpk_tt.tiedonkeruu_alkupvm and tpk_tt.tiedonkeruu_loppupvm

	WHERE kk.tyyppi = 'tyopaikkakysely'
)

--INSERT INTO dw.f_arvo_amis_tep (
--	 [d_organisaatio_oppilaitos_id]
--    ,[d_organisaatio_koulutustoimija_id]
--    ,[d_amos_spl_jarjestaja_linkki_id]
--    ,[d_alueluokitus_oppilaitos_id]
--    ,[d_alueluokitus_koulutustoimija_id]
--    ,[d_koulutusluokitus_id]
--    ,[d_alueluokitus_toimipaikka_id]
--    ,[d_maatjavaltiot2_toimipaikka_id]
--    ,[d_kalenteri_tunnus_luotu_id]
--    ,[d_kalenteri_vastaus_id]
--    ,[d_arvokysymys_id]
--    ,[d_arvokyselykerta_id]
--    ,[d_arvovastaus_monivalinta_id]
--    ,[d_suoritus_kieli_id]
--    ,[d_ytj_yritystiedot_tyonantaja_id]
--    ,[d_oppisopimuksen_perusta_id]
--    ,[d_tutkinnon_osa_id]
--    ,[sopimustyyppi]
--    ,[numerovalinta]
--    ,[tyopaikkajakson_kesto]
--    ,[vastaajaid]
--    ,[vastaajatunnus]
--    ,[tyopaikkaohjaajakysely_vastaajatunnus]
--    ,[source]
--)

SELECT distinct
     coalesce(d1a.id,-1) AS d_organisaatio_oppilaitos_id
	,coalesce(d1b.id,-1) AS d_organisaatio_koulutustoimija_id
	,coalesce(d1c.id,-1) AS d_amos_spl_jarjestaja_linkki_id
	,coalesce(d2a.id,-1) AS d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id,-1) AS d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id,-1) AS d_koulutusluokitus_id
	,coalesce(d9.id,-1) AS d_alueluokitus_toimipaikka_id
	,coalesce(d10.id,-1) AS d_maatjavaltiot2_toimipaikka_id
	,coalesce(d5.id,-1) AS d_kalenteri_tunnus_luotu_id
	,coalesce(d5b.id,-1) AS d_kalenteri_vastaus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d7.id,-1) AS d_arvokyselykerta_id
	,coalesce(d11.id,-1) as d_arvovastaus_taustakysymys_tehtava_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,coalesce(d16.id,-1) AS d_suoritus_kieli_id
	,coalesce(d17.id,-1) AS d_ytj_yritystiedot_tyonantaja_id
	,coalesce(d18.id,-1) AS d_oppisopimuksen_perusta_id
	,coalesce(d19.id,-1) AS d_tutkinnon_osa_id
	,sopimustyyppi = MAIN_QUERY.[taustatiedot.sopimustyyppi]
	,MAIN_QUERY.numerovalinta
	,ca.vaihtoehto
	,tyopaikkajakson_kesto = cast(MAIN_QUERY.tyopaikkajakson_kesto as float)
	,MAIN_QUERY.vastaajaid
	,MAIN_QUERY.vastaajatunnus
	,tyopaikkaohjaajakysely_vastaajatunnus = oa.tyopaikkaohjaajakysely_vastaajatunnus
	,cast(MAIN_QUERY.source as varchar(250)) AS source

INTO dw.f_arvo_amis_tep

FROM (

	SELECT 
		 f2.oppilaitoskoodi
		,f5.koulutustoimija
		,f2.tutkintokoodi
		,tsk_koodi = tk_tsk.numerovalinta
		,tsm_koodi = tk_tsm.numerovalinta
		,sts_koodi = tk_sts.vaihtoehto
		,tk_teht_koodi = tk_teht.numerovalinta
		,tk_teht_kysymysid = tk_teht.kysymysid
		,f2.vastaajatunnus_alkupvm
		,tyopaikkajakson_kesto = f2.[taustatiedot.tyopaikkajakson_kesto]
		,f.vastausaika
		,vastausid_monivalinta = CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE '-1' END
		,f.numerovalinta
		,f.vaihtoehto
		,f.vastaajaid
		,f2.vastaajatunnus
		,f2.kyselykertaid
		,f3.kysymysid
		,f3.kysymysryhmaid
		,f4.jarjestys as kysymysryhmajarjestys
		,f2.suorituskieli
		,f2.[taustatiedot.tyonantaja]
		,f2.[taustatiedot.sopimustyyppi]
		,f2.[taustatiedot.oppisopimuksen_perusta]
		,f2.[taustatiedot.tutkinnon_osa]
		,'ETL: p_lataa_f_arvo_amis_tep' AS source
	FROM Arvo_SA.sa.sa_arvo_kohteet f2
	LEFT JOIN Arvo_SA.sa.sa_arvo_vastaukset f on f2.vastaajatunnusid = f.vastaajatunnusid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselykertaid = f2.kyselykertaid 
	--TAUSTAKYSYMYKSET
	LEFT JOIN (select * from taustakysymykset where taustakysymyksen_tyyppi = 'toimipaikan_kunta') AS tk_tsk ON tk_tsk.vastaajaid = f.vastaajaid AND tk_tsk.kyselykertaid = f.kyselykertaid
	LEFT JOIN (select * from taustakysymykset where taustakysymyksen_tyyppi = 'toimipaikan_maa') AS tk_tsm ON tk_tsm.vastaajaid = f.vastaajaid AND tk_tsm.kyselykertaid = f.kyselykertaid
	LEFT JOIN (select * from taustakysymykset where taustakysymyksen_tyyppi = 'toimipaikka_suomessa') AS tk_sts ON tk_sts.vastaajaid = f.vastaajaid AND tk_sts.kyselykertaid = f.kyselykertaid
	LEFT JOIN (select * from taustakysymykset where taustakysymyksen_tyyppi = 'tehtava_tyonantajalla') AS tk_teht ON tk_teht.vastaajaid = f.vastaajaid AND tk_teht.kyselykertaid = f.kyselykertaid
	WHERE 1=1
	AND f5.tyyppi in ('tyoelamapalaute','tyopaikkakysely')
	--kyselyjen yhdistämistä varten faktatauluun myös ei-valtakunalliset kysymykset ja taustakysymykset (koska osalla vastaukset vain niihin), poisto myöhemmmin
	--AND coalesce(f3.valtakunnallinen, 1) = 1 
	--AND f3.taustakysymyksen_tyyppi is null
	AND coalesce(f3.vastaustyyppi,'') != 'vapaateksti'

) MAIN_QUERY

LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MAIN_QUERY.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = MAIN_QUERY.koulutustoimija
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1c ON d1c.ytunnus_avain = d1b.organisaatio_koodi
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_avain like 'koulutus_%' and d3.koulutusluokitus_koodi = MAIN_QUERY.tutkintokoodi
LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = MAIN_QUERY.vastaajatunnus_alkupvm
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = MAIN_QUERY.vastausaika
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = MAIN_QUERY.kysymysryhmaid AND d6.kysymysid = MAIN_QUERY.kysymysid AND d6.kysymysryhmajarjestys = MAIN_QUERY.kysymysryhmajarjestys
LEFT JOIN dw.d_arvokyselykerta d7 ON d7.kyselykertaid = MAIN_QUERY.kyselykertaid
LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi = MAIN_QUERY.tsk_koodi 
LEFT JOIN dw.d_maatjavaltiot2 d10 ON d10.maatjavaltiot2_koodi = coalesce(MAIN_QUERY.tsm_koodi, case when MAIN_QUERY.sts_koodi = 'kylla' then (select maatjavaltiot2_koodi from dw.d_maatjavaltiot2 where maatjavaltiot2_fi = 'Suomi') end)
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.koodi = MAIN_QUERY.tk_teht_koodi and d11.kysymysid = MAIN_QUERY.tk_teht_kysymysid
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MAIN_QUERY.numerovalinta and d15.kysymysid = MAIN_QUERY.kysymysid
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MAIN_QUERY.suorituskieli
LEFT JOIN dw.d_ytj_yritystiedot d17 ON d17.ytunnus = MAIN_QUERY.[taustatiedot.tyonantaja]
LEFT JOIN dw.d_oppisopimuksen_perusta d18 ON d18.koodi = MAIN_QUERY.[taustatiedot.oppisopimuksen_perusta]
LEFT JOIN dw.d_tutkinnon_osa d19 ON d19.koodi = MAIN_QUERY.[taustatiedot.tutkinnon_osa]
--työpaikkakyselyn rivien monistaminen työpaikkaohjaajan kyselyn kohteilla
OUTER APPLY (select * from kyselyjen_linkitys kl where kl.tyopaikkakysely_vastaajatunnus = MAIN_QUERY.vastaajatunnus) oa
CROSS APPLY (select vaihtoehto = case MAIN_QUERY.vaihtoehto when 'kylla' then 'Kyllä' when 'ei' then 'Ei' else MAIN_QUERY.vaihtoehto end) ca
WHERE d5.rahoituskausi_amm != '01.07.2020 - 30.06.2021'


--työpaikkakyselyn taustatietojen päivittäminen työpaikkaohjaajan kyselyn taustatiedoilla
UPDATE f
SET 
	[d_organisaatio_oppilaitos_id] = coalesce(f2.[d_organisaatio_oppilaitos_id], f.[d_organisaatio_oppilaitos_id])
    ,[d_alueluokitus_oppilaitos_id] = coalesce(f2.[d_alueluokitus_oppilaitos_id], f.[d_alueluokitus_oppilaitos_id])
    ,[d_koulutusluokitus_id] = coalesce(f2.[d_koulutusluokitus_id], f.[d_koulutusluokitus_id])
    --,[d_alueluokitus_toimipaikka_id] = f2.[d_alueluokitus_toimipaikka_id]
    --,[d_maatjavaltiot2_toimipaikka_id] = f2.[d_maatjavaltiot2_toimipaikka_id]
    ,[d_suoritus_kieli_id] = coalesce(f2.[d_suoritus_kieli_id], f.[d_suoritus_kieli_id])
    ,[d_oppisopimuksen_perusta_id] = coalesce(f2.[d_oppisopimuksen_perusta_id], f.[d_oppisopimuksen_perusta_id])
    ,[d_tutkinnon_osa_id] = coalesce(f2.[d_tutkinnon_osa_id], f.[d_tutkinnon_osa_id])
    ,[sopimustyyppi] = coalesce(f2.[sopimustyyppi], f.[sopimustyyppi])
    ,[tyopaikkajakson_kesto] = coalesce(f2.[tyopaikkajakson_kesto], f.[tyopaikkajakson_kesto])
FROM dw.f_arvo_amis_tep f
LEFT JOIN dw.f_arvo_amis_tep f2 on f2.vastaajatunnus = f.tyopaikkaohjaajakysely_vastaajatunnus
WHERE f.tyopaikkaohjaajakysely_vastaajatunnus is not null

--yhdistämisen jälkeen taustakysymysten ja ei-valtakunnallisten kysymysten poisto
DELETE f 
FROM dw.f_arvo_amis_tep f
LEFT JOIN dw.d_arvokysymys d on d.id = f.d_arvokysymys_id
LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid = d.kysymysid
WHERE coalesce(k.valtakunnallinen, 1) != 1 OR k.taustakysymyksen_tyyppi is not null


CREATE NONCLUSTERED INDEX [NC_arvo_amis_tep]
ON [dw].[f_arvo_amis_tep] ([d_koulutusluokitus_id])
INCLUDE ([d_organisaatio_oppilaitos_id],[d_kalenteri_tunnus_luotu_id],[d_arvokyselykerta_id])


