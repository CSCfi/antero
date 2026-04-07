USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_arvokysymys]    Script Date: 16.3.2026 10.03.52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_arvokysymys] AS

DROP TABLE IF EXISTS ANTERO.dbo.temp_arvo_kysymykset

SELECT DISTINCT
	k.kysymysryhmaid,
	REPLACE(COALESCE(kkr.nimi_fi,kkr.nimi_sv,kkr.nimi_en), '  ', ' ') as kysymysryhma_fi,
	REPLACE(COALESCE(kkr.nimi_sv,kkr.nimi_fi,kkr.nimi_en), '  ', ' ') as  kysymysryhma_sv,
	REPLACE(COALESCE(kkr.nimi_en,kkr.nimi_fi,kkr.nimi_sv), '  ', ' ') as kysymysryhma_en,
	kysymysid,
	REPLACE(COALESCE(kysymys_fi,kysymys_sv,kysymys_en), '  ', ' ') as kysymys_fi,
	REPLACE(COALESCE(kysymys_sv,kysymys_fi,kysymys_en), '  ', ' ') as kysymys_sv,
	REPLACE(COALESCE(kysymys_en,kysymys_fi,kysymys_sv), '  ', ' ') as kysymys_en,
	kkr.jarjestys as kysymysryhmajarjestys,
	k.jarjestys as kysymysjarjestys,
	coalesce(k.rahoitusmallikysymys,0) as rahoitusmallikysymys,
	case when coalesce(k.taustakysymyksen_tyyppi,'') in ('kiusaaminen','kiusaamiseen_puuttuminen') then 1 else 0 end as kiusaamiskysymys,
	k.kysymystyyppi as vastaustyyppi,
	kysymysversio,
	k.kyselyid,
	kk.kyselytyyppi,
	1 as rnk,
	'ETL: p_lataa_d_arvokysymys' AS source
INTO ANTERO.dbo.temp_arvo_kysymykset
FROM Arvo_SA.sa.sa_arvo_v2_kysymykset k
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kysymysryhmat kkr on kkr.kysymysryhmaid = k.kysymysryhmaid and kkr.kyselyid = k.kyselyid
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt kk on kk.kyselyid = k.kyselyid
 
INSERT INTO ANTERO.dbo.temp_arvo_kysymykset
SELECT DISTINCT
	k.kysymysryhmaid,
	REPLACE(COALESCE(k.kysymysryhma_fi,k.kysymysryhma_sv,k.kysymysryhma_en), '  ', ' ') as kysymysryhma_fi,
	REPLACE(COALESCE(k.kysymysryhma_sv,k.kysymysryhma_fi,k.kysymysryhma_en), '  ', ' ') as kysymysryhma_sv,
	REPLACE(COALESCE(k.kysymysryhma_en,k.kysymysryhma_fi,k.kysymysryhma_sv), '  ', ' ') as kysymysryhma_en,
	k.kysymysid,
	REPLACE(COALESCE(k.kysymys_fi,k.kysymys_sv,k.kysymys_en), '  ', ' ')  as kysymys_fi,
	REPLACE(COALESCE(k.kysymys_sv,k.kysymys_fi,k.kysymys_en), '  ', ' ')  as kysymys_sv,
	REPLACE(COALESCE(k.kysymys_en,k.kysymys_fi,k.kysymys_sv), '  ', ' ')  as kysymys_en,
	kkr.jarjestys as kysymysryhmajarjestys,
	k.jarjestys as kysymysjarjestys,
	coalesce(k.rahoitusmallikysymys,0) as rahoitusmallikysymys,
	case when coalesce(taustakysymyksen_tyyppi,'') in ('kiusaaminen','kiusaamiseen_puuttuminen') then 1 else 0 end as kiusaamiskysymys,
	k.vastaustyyppi,
	k.kysymysversio,
	kkr.kyselyid,
	kk.tyyppi,
	1 as rnk,
	'ETL: p_lataa_d_arvokysymys' AS source
FROM Arvo_SA.sa.sa_arvo_kysymykset k
LEFT JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma kkr on kkr.kysymysryhmaid = k.kysymysryhmaid
LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselyid = kkr.kyselyid
LEFT JOIN ANTERO.dbo.temp_arvo_kysymykset ak 
	on ak.kysymysid = k.kysymysid 
	and ak.kysymysversio = k.kysymysversio 
	and ak.kysymysjarjestys = k.jarjestys
	and ak.kyselyid = kkr.kyselyid 
	and ak.kysymysryhmaid = kkr.kysymysryhmaid
	and ak.kysymysryhmajarjestys = kkr.jarjestys
WHERE ak.kyselyid is null

UPDATE k
	SET rnk = rnk2
FROM ANTERO.dbo.temp_arvo_kysymykset k
LEFT JOIN (
	SELECT 
		kysymysid, kyselyid, kysymysversio, kysymysryhmaid, kysymysjarjestys, kysymysryhmajarjestys,
		RANK() OVER (PARTITION BY kysymysid, kyselyid ORDER BY kysymysversio desc, kysymysryhmaid, kysymysjarjestys, kysymysryhmajarjestys) as rnk2
	FROM ANTERO.dbo.temp_arvo_kysymykset 
) k2 on k.kysymysid = k2.kysymysid and k.kyselyid = k2.kyselyid and k.kysymysryhmaid = k2.kysymysryhmaid and k.kysymysjarjestys = k2.kysymysjarjestys and k.kysymysryhmajarjestys = k2.kysymysryhmajarjestys

DROP INDEX IF EXISTS [NC__d_arvokysymys] ON [dw].[d_arvokysymys]

if not exists (select * from dw.d_arvokysymys where id=-1) 

	begin
  
	  set identity_insert dw.d_arvokysymys on;
  
	  insert into dw.d_arvokysymys (
		id,
		kysymysryhmaid,kysymysryhma_fi,kysymysryhma_sv,kysymysryhma_en,
		kysymysid,kysymys_fi,kysymys_sv,kysymys_en,
		kysymysryhmajarjestys,kysymysjarjestys,
		kysymysryhmajarjestys2,kysymysjarjestys2,
		rahoitusmallikysymys,kiusaamiskysymys,
		vastaustyyppi,
		kysymysversio,
		kyselyid,
		rnk,
		source
	  )
	  select
		-1,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		999,999,
		999,999,
		0,0,
		nimi,
		1,
		-1,
		1,
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
		kysymysryhmajarjestys2=999,
		kysymysjarjestys2=999,
		rahoitusmallikysymys=0,
		kiusaamiskysymys=0,
		vastaustyyppi=s.nimi,
		kysymysversio=1,
		kyselyid=-1,
		rnk = 1,
		source='ETL: p_lataa_d_arvokysymys'
		from dw.d_arvokysymys d
		join sa.sa_koodistot s on s.koodi=d.kysymysryhmaid
		where s.koodisto='vipunenmeta'
		and s.koodi='-1'
		;
	end

MERGE dw.d_arvokysymys AS target

USING (

  SELECT
	f.kysymysryhmaid,
	f.kysymysryhma_fi,
	f.kysymysryhma_sv,
	f.kysymysryhma_en,
	f.kysymysid,
	f.kysymys_fi,
	f.kysymys_sv,
	f.kysymys_en,
	f.kysymysryhmajarjestys,
	f.kysymysjarjestys,
	MAX(f.kysymysryhmajarjestys) OVER (PARTITION BY f.kysymysryhma_fi,f.kysymysryhma_sv,f.kysymysryhma_en, f.kyselytyyppi) as kysymysryhmajarjestys2,
	MAX(f.kysymysjarjestys) OVER (PARTITION BY f.kysymys_fi,f.kysymys_sv,f.kysymys_en,f.kyselytyyppi) as kysymysjarjestys2,
	f.rahoitusmallikysymys,
	f.kiusaamiskysymys,
	f.vastaustyyppi,
	f.kysymysversio,
	f.kyselyid,
	f.rnk,
	f.source
 FROM ANTERO.dbo.temp_arvo_kysymykset f
 WHERE f.kysymys_fi is not null

) AS src
ON target.kysymysryhmaid = src.kysymysryhmaid
  AND target.kysymysid = src.kysymysid
  AND target.kysymysversio = src.kysymysversio
  AND target.kysymysjarjestys = src.kysymysjarjestys
  AND target.kyselyid = src.kyselyid
  AND target.kysymysryhmaid = src.kysymysryhmaid
  AND target.kysymysryhmajarjestys = src.kysymysryhmajarjestys
 

WHEN MATCHED THEN
  UPDATE SET
    kysymysryhma_fi = src.kysymysryhma_fi,
    kysymysryhma_sv = src.kysymysryhma_sv,
    kysymysryhma_en = src.kysymysryhma_en,
	kysymysryhmajarjestys = src.kysymysryhmajarjestys,
	kysymysryhmajarjestys2 = src.kysymysryhmajarjestys2,
    kysymys_fi = src.kysymys_fi,
    kysymys_sv = src.kysymys_sv,
    kysymys_en = src.kysymys_en,
	kysymysjarjestys = src.kysymysjarjestys,
	kysymysjarjestys2 = src.kysymysjarjestys2,
    rahoitusmallikysymys = src.rahoitusmallikysymys,
	kiusaamiskysymys = src.kiusaamiskysymys,
    vastaustyyppi = src.vastaustyyppi,
	kysymysversio = src.kysymysversio,
	kyselyid = src.kyselyid,
	rnk = src.rnk,
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
	kysymysryhmajarjestys2,
    kysymysjarjestys2,
    rahoitusmallikysymys,
	kiusaamiskysymys,
    vastaustyyppi,
	kysymysversio,
	kyselyid,
	rnk,
    source
  )
  VALUES (
    src.kysymysryhmaid, src.kysymysryhma_fi, src.kysymysryhma_sv, src.kysymysryhma_en,
    src.kysymysid, src.kysymys_fi, src.kysymys_sv, src.kysymys_en,
    src.kysymysryhmajarjestys, src.kysymysjarjestys,
	src.kysymysryhmajarjestys2, src.kysymysjarjestys2,
    src.rahoitusmallikysymys,src.kiusaamiskysymys,
    src.vastaustyyppi,
	src.kysymysversio,
	src.kyselyid,
	src.rnk,
    src.source
	
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

-- Korjauksia rahoitusmallikysymystietoihin
UPDATE dw.d_arvokysymys
SET
	rahoitusmallikysymys = 1
WHERE kysymysid in (
	2953,3079,3081,3084,3085,3060,3061,2924,2954,2922, 
	8469,8471,8474,8475,8450,8364,8451,8366,8397,8398
)

UPDATE dw.d_arvokysymys
SET
	rahoitusmallikysymys = 0
WHERE kysymys_fi = 'Opetuksen toteutustavat mahdollistivat opiskelun, työn ja henkilökohtaisen elämäntilanteen yhteensovittamisen.' OR kysymysid in (1537, 4173)


-- Yo-uraseurannan kysymysten yhdenmukaistus
UPDATE ANTERO.dw.d_arvokysymys
SET
	kysymys_fi = 'a) Työnantajat arvostavat tutkintoani.',
	kysymys_sv = 'a) Arbetsgivarna uppskattar min examen.',
	kysymys_en = 'a) Employers value my degree.',
	kysymysjarjestys2 = 1
WHERE kysymysid in (2919,6800,8361,10114)
UPDATE ANTERO.dw.d_arvokysymys
SET
	kysymys_fi = 'b) Suosittelisin koulutustani muille.',
	kysymys_sv = 'b) Jag skulle rekommendera min utbildning för andra.',
	kysymys_en = 'b) I would recommend my studies to others.',
	kysymysjarjestys2 = 2
WHERE kysymysid in (2920,6801,8362,10115)
UPDATE ANTERO.dw.d_arvokysymys
SET
	kysymys_fi = 'c) Opintojen osaamistavoitteet tuotiin selkeästi esille.',
	kysymys_sv = 'c) Lärandemålen lyftes tydligt fram i studierna.',
	kysymys_en = 'c) The learning objectives were made clear during the studies.',
	kysymysjarjestys2 = 3
WHERE kysymysid in (2921,6802,8363,10116)
UPDATE ANTERO.dw.d_arvokysymys
SET
	kysymys_fi = 'd) Koulutus antoi riittävät valmiudet työelämään.',
	kysymys_sv = 'd) Utbildningen gav tillräckliga färdigheter för arbetslivet.',
	kysymys_en = 'd) The studies equipped me sufficiently for the working life.',
	kysymysjarjestys2 = 4
WHERE kysymysid in (2922,6803,8364,10117)
UPDATE ANTERO.dw.d_arvokysymys
SET
	kysymys_fi = 'e) Koulutuksen aikana tuotiin esille yrittäjyys uravaihtoehtona.',
	kysymys_sv = 'e) Under utbildningen lyftes entreprenörskap fram som ett karriäralternativ.',
	kysymys_en = 'e) Entrepreneurship was presented as a career option during the studies.',
	kysymysjarjestys2 = 5
WHERE kysymysid in (2923,6804,8365,10118)

CREATE NONCLUSTERED INDEX [NC__d_arvokysymys]
ON [dw].[d_arvokysymys] ([kysymysryhmaid],[kysymysid],[kysymysryhmajarjestys],[kysymysversio],[kysymysjarjestys])
INCLUDE ([kysymysryhma_fi],[rahoitusmallikysymys])

DROP TABLE IF EXISTS ANTERO.dbo.temp_arvo_kysymykset