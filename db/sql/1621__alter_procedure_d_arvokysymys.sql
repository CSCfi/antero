USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvokysymys]    Script Date: 18.4.2018 15:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_d_arvokysymys] AS
if not exists (select * from dw.d_arvokysymys where id=-1) begin
  set identity_insert dw.d_arvokysymys on;
  insert into dw.d_arvokysymys (
    id,
    kysymysryhmaid,kysymysryhma_fi,kysymysryhma_sv,kysymysryhma_en,
    kysymysid,kysymys_fi,kysymys_sv,kysymys_en,
    kysymysryhmajarjestys,kysymysjarjestys,
    rahoitusmallikysymys,
    vastaustyyppi,
    source
  )
  select
    -1,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    999,999,
    0,
    nimi,
    'ETL: p_lataa_d_arvokysymys'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_arvokysymys off;
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
    vastaustyyppi=s.nimi,
    source='ETL: p_lataa_d_arvokysymys'
  from dw.d_arvokysymys d
  join sa.sa_koodistot s on s.koodi=d.kysymysryhmaid
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
-- sa.sa_arvo_kaikki
MERGE dw.d_arvokysymys AS target
USING (
  SELECT DISTINCT
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
  --AMK
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
  ,'Opintoni kokonaisuudessaan'
  --YAMK
  ,'Aikaisemmin tai muualla hankittu osaamiseni (AHOT) otettiin opinnoissani riittävästi huomioon.'
  ,'Opinnoissani ei juuri ollut turhia opintojaksoja, päällekkäisyyksiä tai toistoa.'
  ,'Henkilökohtainen opiskelusuunnitelmani (HOPS) ohjasi ja edisti oppimistani.'
  ,'Korkeakouluni opintojen tarjonta mahdollisti ympärivuotisen opiskelun.'
  ,'Opintojen ohjaus oli tasokasta.'
  ,'Opetus oli asiantuntevaa.'
  ,'Opetusmenetelmät ja työskentelytavat olivat monipuolisia ja soveltuivat erilaisiin oppimistilanteisiin.'
  ,'Opetuksen toteutustavat mahdollistivat opiskelun, työn ja henkilökohtaisen elämäntilanteen yhteensovittamisen.'
  ,'Yhteistyö opettajien kanssa oli luontevaa.'
  ,'Opettajat huomioivat opiskelijat tasapuolisesti ja oikeudenmukaisesti.'
  ,'Opetus- ja opiskelutilat soveltuivat erilaisiin oppimistilanteisiin.'
  ,'Opinnoissani hyödynnettiin hyvin verkko-oppimisen tarjoamia mahdollisuuksia.'
  ,'Työelämää käytettiin monipuolisesti oppimisympäristönä.'
  ,'Korkeakouluni käyttämät tietotekniikka- ja ohjelmistopalvelut olivat hyvät.'
  ,'Kirjasto- ja tietopalvelut tukivat oppimistani.'
  ,'Sain riittävästi tietoa ja tukea tavoitteideni mukaiseen opintojen etenemiseen.'
  ,'Opintosuorituksista saamani arvioinnit vastasivat osaamistani.'
  ,'Sain riittävästi palautetta osaamiseni kehittymisestä.'
  ,'Missä määrin opiskelijoiden palaute mielestäsi huomioitiin opintojen kehittämisessä?'
  ,'Tarjolla oli monipuolisesti myös vieraskielistä opetusta.'
  ,'Kansainvälisyysnäkökulma oli kytketty hyvin osaksi opintojani.'
  ,'Työelämän asiantuntijoiden osaamista hyödynnettiin onnistuneesti korkeakouluni toiminnassa.'
  ,'Opetusjärjestelyt mahdollistivat hyvin opintojen kytkemisen työn ja työyhteisön kehittämiseen.'
  ,'Olen saanut opintojeni aikana riittävästi tukea urasuunnitteluun.'
  ,'Sain korkeakouluni edustajilta riittävästi tukea ja ohjausta opinnäytetyössäni.'
  ,'Opinnäytetyöni valmensi minua vaativiin työelämän asiantuntija- ja kehittämistehtäviin.'
  ,'Olen opintoihini tyytyväinen.'
  --kandipalaute
  ,'Voin hyvin yliopistossani.'
  ,'Olen tyytyväinen omaan opiskeluuni.'
  ,'Koulutuksen myötä kehittynyt osaamiseni vastaa odotuksiani.'
  ,'Koulutukseni on vastannut sille asetettuja tavoitteita.'
  ,'Opetus on ollut mielestäni pääosin laadukasta.'
  ,'Olen ollut tyytyväinen käytettyihin opetusmenetelmiin.'
  ,'Tarjolla on ollut riittävästi ohjausta kandidaatin tutkielman laatimiseen/opinnäytteen tekemiseen.'
  ,'Tarjolla on ollut riittävästi ohjausta opintojen suunnitteluun.'
  ,'Minun on ollut helppoa löytää opintoihini liittyvää tietoa ja tukea.'
  ,'Ongelmatilanteissa olen tarvittaessa löytänyt henkilön, jolta olen voinut pyytää neuvoa.'
  ,'Olen ollut tyytyväinen opinto-ohjelmani tarjoamiin vaikutus- ja osallistumismahdollisuuksiin (esim. opetussuunnitteluun osallistuminen ja palautteen antamisen mahdollisuudet).'
  ,'Olen ollut tyytyväinen vuorovaikutukseeni opetushenkilökunnan kanssa.'
  ,'Opettajilta saamani palaute on auttanut minua opinnoissani.'
  ) OR
  kysymysid IN (
 '1119'
 ,'4088'
 ,'1147'
 ,'4097'
 ,'1142'
 ,'4092'
 ) then 1
  else 0
  end AS rahoitusmallikysymys,
  vastaustyyppi,
  'ETL: p_lataa_d_arvokysymys' AS source
 FROM sa.sa_arvo_kaikki
  WHERE 1 = 1
  GROUP BY
  kysymysryhmaid
  ,kysymysryhma_fi
  ,kysymysryhma_sv
  ,kysymysryhma_en
  ,kysymysid
  ,kysymys_fi
  ,kysymys_sv
  ,kysymys_en
  ,kysymysryhmajarjestys
  ,kysymysjarjestys
  ,vastaustyyppi

   ) AS src
ON target.kysymysryhmaid = src.kysymysryhmaid
  AND target.kysymysid = src.kysymysid
  AND target.kysymysryhmajarjestys = src.kysymysryhmajarjestys
  AND target.kysymysjarjestys = src.kysymysjarjestys
  AND target.rahoitusmallikysymys = src.rahoitusmallikysymys
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
    vastaustyyppi = src.vastaustyyppi,
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
    vastaustyyppi,
    source
  )
  VALUES (
    src.kysymysryhmaid, src.kysymysryhma_fi, src.kysymysryhma_sv, src.kysymysryhma_en,
    src.kysymysid, src.kysymys_fi, src.kysymys_sv, src.kysymys_en,
    src.kysymysryhmajarjestys, src.kysymysjarjestys,
    src.rahoitusmallikysymys,
    src.vastaustyyppi,
    src.source
  );
-- sa_arvo_uraseuranta
  MERGE dw.d_arvokysymys AS target
  USING (
    
   SELECT DISTINCT
    kysymysryhmaid,
    COALESCE(kysymysryhma_fi,kysymysryhma_sv,kysymysryhma_en) kysymysryhma_fi,
    COALESCE(kysymysryhma_sv,kysymysryhma_fi,kysymysryhma_en) kysymysryhma_sv,
    COALESCE(kysymysryhma_en,kysymysryhma_fi,kysymysryhma_sv) kysymysryhma_en,
    kysymysid,
    COALESCE(kysymys_fi,kysymys_sv,kysymys_en) kysymys_fi,
    COALESCE(kysymys_sv,kysymys_fi,kysymys_en) kysymys_sv,
    COALESCE(kysymys_en,kysymys_fi,kysymys_sv) kysymys_en,
    kysymysryhma_jarjestys as kysymysryhmajarjestys,
    jarjestys as kysymysjarjestys,
     case when kysymys_fi IN (
    --AMK
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
    ,'Opintoni kokonaisuudessaan'
    --YAMK
    ,'Aikaisemmin tai muualla hankittu osaamiseni (AHOT) otettiin opinnoissani riittävästi huomioon.'
    ,'Opinnoissani ei juuri ollut turhia opintojaksoja, päällekkäisyyksiä tai toistoa.'
    ,'Henkilökohtainen opiskelusuunnitelmani (HOPS) ohjasi ja edisti oppimistani.'
    ,'Korkeakouluni opintojen tarjonta mahdollisti ympärivuotisen opiskelun.'
    ,'Opintojen ohjaus oli tasokasta.'
    ,'Opetus oli asiantuntevaa.'
    ,'Opetusmenetelmät ja työskentelytavat olivat monipuolisia ja soveltuivat erilaisiin oppimistilanteisiin.'
    ,'Opetuksen toteutustavat mahdollistivat opiskelun, työn ja henkilökohtaisen elämäntilanteen yhteensovittamisen.'
    ,'Yhteistyö opettajien kanssa oli luontevaa.'
    ,'Opettajat huomioivat opiskelijat tasapuolisesti ja oikeudenmukaisesti.'
    ,'Opetus- ja opiskelutilat soveltuivat erilaisiin oppimistilanteisiin.'
    ,'Opinnoissani hyödynnettiin hyvin verkko-oppimisen tarjoamia mahdollisuuksia.'
    ,'Työelämää käytettiin monipuolisesti oppimisympäristönä.'
    ,'Korkeakouluni käyttämät tietotekniikka- ja ohjelmistopalvelut olivat hyvät.'
    ,'Kirjasto- ja tietopalvelut tukivat oppimistani.'
    ,'Sain riittävästi tietoa ja tukea tavoitteideni mukaiseen opintojen etenemiseen.'
    ,'Opintosuorituksista saamani arvioinnit vastasivat osaamistani.'
    ,'Sain riittävästi palautetta osaamiseni kehittymisestä.'
    ,'Missä määrin opiskelijoiden palaute mielestäsi huomioitiin opintojen kehittämisessä?'
    ,'Tarjolla oli monipuolisesti myös vieraskielistä opetusta.'
    ,'Kansainvälisyysnäkökulma oli kytketty hyvin osaksi opintojani.'
    ,'Työelämän asiantuntijoiden osaamista hyödynnettiin onnistuneesti korkeakouluni toiminnassa.'
    ,'Opetusjärjestelyt mahdollistivat hyvin opintojen kytkemisen työn ja työyhteisön kehittämiseen.'
    ,'Olen saanut opintojeni aikana riittävästi tukea urasuunnitteluun.'
    ,'Sain korkeakouluni edustajilta riittävästi tukea ja ohjausta opinnäytetyössäni.'
    ,'Opinnäytetyöni valmensi minua vaativiin työelämän asiantuntija- ja kehittämistehtäviin.'
    ,'Olen opintoihini tyytyväinen.'
    --kandipalaute
    ,'Voin hyvin yliopistossani.'
    ,'Olen tyytyväinen omaan opiskeluuni.'
    ,'Koulutuksen myötä kehittynyt osaamiseni vastaa odotuksiani.'
    ,'Koulutukseni on vastannut sille asetettuja tavoitteita.'
    ,'Opetus on ollut mielestäni pääosin laadukasta.'
    ,'Olen ollut tyytyväinen käytettyihin opetusmenetelmiin.'
    ,'Tarjolla on ollut riittävästi ohjausta kandidaatin tutkielman laatimiseen/opinnäytteen tekemiseen.'
    ,'Tarjolla on ollut riittävästi ohjausta opintojen suunnitteluun.'
    ,'Minun on ollut helppoa löytää opintoihini liittyvää tietoa ja tukea.'
    ,'Ongelmatilanteissa olen tarvittaessa löytänyt henkilön, jolta olen voinut pyytää neuvoa.'
    ,'Olen ollut tyytyväinen opinto-ohjelmani tarjoamiin vaikutus- ja osallistumismahdollisuuksiin (esim. opetussuunnitteluun osallistuminen ja palautteen antamisen mahdollisuudet).'
    ,'Olen ollut tyytyväinen vuorovaikutukseeni opetushenkilökunnan kanssa.'
    ,'Opettajilta saamani palaute on auttanut minua opinnoissani.'
    ) OR
    kysymysid IN (
   '1119'
   ,'4088'
   ,'1147'
   ,'4097'
   ,'1142'
   ,'4092'
   ) then 1
   else 0 end AS rahoitusmallikysymys,
    vastaustyyppi,
    'ETL: p_lataa_d_arvokysymys' AS source
   FROM sa.sa_arvo_uraseuranta
    WHERE 1 = 1
    GROUP BY
    kysymysryhmaid
    ,kysymysryhma_fi
    ,kysymysryhma_sv
    ,kysymysryhma_en
    ,kysymysid
    ,kysymys_fi
    ,kysymys_sv
    ,kysymys_en
    ,kysymysryhma_jarjestys
    ,jarjestys
    ,vastaustyyppi
    ) AS src
  ON target.kysymysryhmaid = src.kysymysryhmaid
    AND target.kysymysid = src.kysymysid
    AND target.kysymysryhmajarjestys = src.kysymysryhmajarjestys
    AND target.kysymysjarjestys = src.kysymysjarjestys
    AND target.rahoitusmallikysymys = src.rahoitusmallikysymys
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
      vastaustyyppi = src.vastaustyyppi,
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
      vastaustyyppi,
      source
    )
    VALUES (
      src.kysymysryhmaid, src.kysymysryhma_fi, src.kysymysryhma_sv, src.kysymysryhma_en,
      src.kysymysid, src.kysymys_fi, src.kysymys_sv, src.kysymys_en,
      src.kysymysryhmajarjestys, src.kysymysjarjestys,
      src.rahoitusmallikysymys,
      src.vastaustyyppi,
      src.source
    );
