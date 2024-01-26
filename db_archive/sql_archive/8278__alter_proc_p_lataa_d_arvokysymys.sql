USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_arvokysymys]    Script Date: 17.11.2023 16:22:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
		source,
		kysymysversio
	  )
	  select
		-1,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		999,999,
		0,0,
		nimi,
		'ETL: p_lataa_d_arvokysymys'
		,1
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
		source='ETL: p_lataa_d_arvokysymys',
		kysymysversio=1
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
	  'ETL: p_lataa_d_arvokysymys' AS source,
	  kysymysversio
  FROM Arvo_SA.sa.sa_arvo_kysymykset k
  LEFT JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma kkr on kkr.kysymysryhmaid = k.kysymysryhmaid

) AS src
ON target.kysymysryhmaid = src.kysymysryhmaid
  AND target.kysymysid = src.kysymysid
  AND target.kysymysversio = src.kysymysversio
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
    target.source = src.source,
	kysymysversio = src.kysymysversio

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
    source,
	kysymysversio
  )
  VALUES (
    src.kysymysryhmaid, src.kysymysryhma_fi, src.kysymysryhma_sv, src.kysymysryhma_en,
    src.kysymysid, src.kysymys_fi, src.kysymys_sv, src.kysymys_en,
    src.kysymysryhmajarjestys, src.kysymysjarjestys,
    src.rahoitusmallikysymys,src.kiusaamiskysymys,
    src.vastaustyyppi,
    src.source,
	src.kysymysversio
  );

--vaihtelevasti puuttuvat käännökset estävät tällä hetkellä opiskelijapalautevisualisointien päivittymisen. JS 3.10.2023
UPDATE dw.d_arvokysymys
SET kysymysryhma_sv = 'Studiemiljön', kysymysryhma_en = 'Study atmosphere'
WHERE kysymysryhma_sv = 'Opiskeluilmapiiri'

-- AMK uraseuranta: kysymys 10736 ilman mainintaa vuodesta

UPDATE dw.d_arvokysymys
SET 
	kysymys_fi = (SELECT MIN(kysymys_fi) FROM dw.d_arvokysymys WHERE kysymysid = '10736' and kysymysversio = 1),
	kysymys_sv = (SELECT MIN(kysymys_sv) FROM dw.d_arvokysymys WHERE kysymysid = '10736' and kysymysversio = 1),
	kysymys_en = (SELECT MIN(kysymys_en) FROM dw.d_arvokysymys WHERE kysymysid = '10736' and kysymysversio = 1)
WHERE kysymysid = '10736'

GO

USE [ANTERO]