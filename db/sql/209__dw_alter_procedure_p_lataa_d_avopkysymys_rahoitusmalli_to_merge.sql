ALTER PROCEDURE dw.p_lataa_d_avopkysymys AS
if not exists (select * from dw.d_avopkysymys where id=-1) begin
  set identity_insert dw.d_avopkysymys on;
  insert into dw.d_avopkysymys (
    id,
    kysymysryhmaid,kysymysryhma_fi,kysymysryhma_sv,kysymysryhma_en,
    kysymysid,kysymys_fi,kysymys_sv,kysymys_en,
    kysymysryhmajarjestys,kysymysjarjestys,
    rahoitusmallikysymys,
    source
  )
  select
    -1,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    999,999,
    0,
    'ETL: p_lataa_d_avopkysymys'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_avopkysymys off;
end else begin
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
    source='ETL: p_lataa_d_avopkysymys'
  from dw.d_avopkysymys d
  join sa.sa_koodistot s on s.koodi=d.kysymysryhmaid
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dw.d_avopkysymys AS target
USING (
  SELECT
  kysymysryhmaid,
  COALESCE(kysymysryhma_fi,kysymysryhma_sv,kysymysryhma_en) kysymysryhma_fi,
  COALESCE(kysymysryhma_sv,kysymysryhma_fi,kysymysryhma_en) kysymysryhma_sv,
  COALESCE(kysymysryhma_en,kysymysryhma_fi,kysymysryhma_sv) kysymysryhma_en,
  kysymysid,
  COALESCE(kysymys_fi,kysymys_sv,kysymys_en) kysymys_fi,
  COALESCE(kysymys_sv,kysymys_fi,kysymys_en) kysymys_sv,
  COALESCE(kysymys_en,kysymys_fi,kysymys_sv) kysymys_en,
  kysymysryhmajarjestys,
  kysymysjarjestys,
  -- mapping from kysymys to rahoitusmalli
  case when kysymys_fi IN (
   'Aikaisemmin tai muualla hankittu osaamiseni (AHOT) otettiin opinnoissani riittävästi huomioon.'
  ,'Opinnoissani ei juuri ollut turhia opintojaksoja, päällekkäisyyksiä tai toistoa.'
  ,'Henkilökohtainen opiskelusuunnitelmani (HOPS) ohjasi ja edisti oppimistani.'
  ,'Korkeakouluni opintojen tarjonta mahdollisti ympärivuotisen opiskelun.'
  ,'Opintojen ohjaus oli tasokasta.'
  ,'Opetus oli asiantuntevaa.'
  ,'Opetusmenetelmät ja työskentelytavat olivat monipuolisia ja soveltuivat erilaisiin oppimistilanteisiin.'
  ,'Yhteistyö opettajien kanssa oli luontevaa.'
  ,'Opettajat huomioivat opiskelijat tasapuolisesti ja oikeudenmukaisesti.'
  ,'Opetus- ja opiskelutilat soveltuivat erilaisiin oppimistilanteisiin.'
  ,'Opinnoissani hyödynnettiin hyvin verkko-oppimisen tarjoamia mahdollisuuksia.'
  ,'Työelämää käytettiin monipuolisesti oppimisympäristönä.'
  ,'Korkeakouluni käyttämät tietotekniikka- ja ohjelmistopalvelut olivat hyvät (riittävät ja nykyaikaiset).'
  ,'Kirjasto- ja tietopalvelut tukivat oppimistani.'
  ,'Sain riittävästi tietoa ja tukea tavoitteideni mukaiseen opintojen etenemiseen.'
  ,'Opintosuorituksista saamani arvioinnit vastasivat osaamistani.'
  ,'Sain riittävästi palautetta osaamiseni kehittymisestä.'
  ,'Missä määrin opiskelijoiden palaute mielestäsi huomioitiin opintojen kehittämisessä? Palaute huomioitiin'
  ,'Tarjolla oli monipuolisesti myös vieraskielistä opetusta.'
  ,'Korkeakoulussani oli hyvät mahdollisuudet suorittaa työharjoittelu ja/tai opiskelijavaihto ulkomailla.'
  ,'Valmistuneita ja jo työelämään siirtyneitä entisiä opiskelijoita (alumneja) hyödynnettiin onnistuneesti osana opintojani.'
  ,'Minulle tarjottiin riittävästi mahdollisuuksia osallistua opintoihin, joissa työskenneltiin yhdessä työelämän kanssa.'
  ,'Olen saanut opintojeni aikana riittävästi tukea urasuunnitteluun.'
  ,'Sain korkeakouluni edustajilta riittävästi tukea ja ohjausta harjoitteluuni liittyen.'
  ,'Harjoittelu vahvisti osaamistani.'
  ,'Sain korkeakouluni edustajilta riittävästi tukea ja ohjausta opinnäytetyössäni.'
  ,'Opinnäytetyöni valmensi minua työelämän asiantuntijatehtäviin.'
  ,'Opintoni kokonaisuudessaan') then 1
  else 0
  end AS rahoitusmallikysymys,
  'ETL: p_lataa_d_avopkysymys' AS source
  FROM sa.sa_arvo_kaikki
  WHERE 1 = 1
  GROUP BY
  kysymysryhmaid,kysymysryhma_fi,kysymysryhma_sv,kysymysryhma_en,
  kysymysid,kysymys_fi,kysymys_sv,kysymys_en,
  kysymysryhmajarjestys,
  kysymysjarjestys
  ) AS src
ON target.kysymysryhmaid = src.kysymysryhmaid AND target.kysymysid = src.kysymysid
  AND target.kysymysryhmajarjestys = src.kysymysryhmajarjestys
  AND target.kysymysjarjestys = src.kysymysjarjestys
  AND target.rahoitusmallikysymys = src.rahoitusmallikysymys
WHEN MATCHED THEN
  UPDATE SET
    kysymysryhma_fi = src.kysymysryhma_fi,
    kysymysryhma_sv = src.kysymysryhma_sv,
    kysymysryhma_en = src.kysymysryhma_en,
    kysymys_fi = src.kysymys_fi,
    kysymys_sv = src.kysymys_sv,
    kysymys_en = src.kysymys_en,
    rahoitusmallikysymys = src.rahoitusmallikysymys,
    target.source = src.source
WHEN NOT MATCHED THEN
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
    source
  )
  VALUES (
    src.kysymysryhmaid, src.kysymysryhma_fi, src.kysymysryhma_sv, src.kysymysryhma_en,
    src.kysymysid, src.kysymys_fi, src.kysymys_sv, src.kysymys_en,
    src.kysymysryhmajarjestys, src.kysymysjarjestys,
    src.rahoitusmallikysymys,
    src.source
  );
