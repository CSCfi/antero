IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='koulutustarjonta_haku'
) BEGIN

CREATE TABLE sa.koulutustarjonta_haku(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  
  -- tietojen lähde: https://virkailija.opintopolku.fi/tarjonta-service/swagger/index.html#!/haku/findAllHakus_get_6
  korkeakouluHaku bit null, --(boolean, optional),
  --hakuaikas (array[HakuaikaV1RDTO]): Lista haun hakuaikoja,
  kohdejoukkoUri nvarchar(max) null, --(string): Haun kohdejoukko koodisto uri,
  koulutuksenAlkamiskausiUri nvarchar(max) null, --(string): Koulutuksen alkamiskausi koodisto uri,
  koulutuksenAlkamisVuosi int null, --(integer): Koulutuksen alkamisvuosi,
  hakutyyppiUri nvarchar(max) null, --(string): Hakutyypin koodisto uri,
  hakutapaUri nvarchar(max) null, --(string): Hakutapa koodisto uri,
  hakukausiUri nvarchar(max) null, --(string): Hakukauden koodisto uri,
  hakukausiVuosi int null, --(integer): Hakukauden vuosi,
  sijoittelu bit null, --(boolean): Käytetäänkö järjestelmän sijoittelupalvelua,
  haunTunniste nvarchar(max) null, --(string): Haun tunniste,
  --nimi (Map[string,string]): Haun monikielinen nimi,
  nimi nvarchar(max) null,
  nimi_sv nvarchar(max) null,
  nimi_en nvarchar(max) null,
  tarjoajaOids nvarchar(max) null, --(array[string], optional): Tarjoaja organisatio oidit. Muokkaajat.,
  koulutusmoduuliTyyppi nvarchar(max) null, --(string, optional) = ['TUTKINNON_OSA' or 'TUTKINTO' or 'TUTKINTO_OHJELMA' or 'OPINTOKOKONAISUUS' or 'OPINTOJAKSO']: Haun koulutusmoduulin tyyppi,
  --hakukohdeOids (array[string]): Haun hakukohdehteiden OID lista,
  ataruLomakeAvain nvarchar(max) null, --(string, optional): Ataru lomakeavain,
  kohdejoukonTarkenne nvarchar(max) null, --(string, optional): Haun kohdejoukon tarkenne,
  maxHakukohdes int null, --(integer): Maksimi hakukohteiden lukumäärä, ei rajoita tarjontaa vaan kouutusinformaatiossa käytössä,
  ylioppilastutkintoAntaaHakukelpoisuuden bit null, --(boolean, optional): Ylioppilastutkinto antaa hakukelpoisuuden,
  usePriority bit null, --(boolean, optional): Hakukohteet järjestettävä prioriteettijärjestykseen.,
  jarjestelmanHakulomake bit null, --(boolean): Käytetäänkö järjestelmän hakulomaketta,
  opintopolunNayttaminenLoppuu nvarchar(max) null, --(string, optional): Mihin asti haku näytetään opintopolussa,
  tunnistusKaytossa bit null, --(boolean, optional): Tunnistus käytössä,
  --sisaltyvatHaut (Set[string], optional): Sisältyvät haut,
  autosyncTarjonta bit null, --(boolean, optional): Käytetäänkö haussa tarjonnan automaattista sykkausta,
  autosyncTarjontaFrom nvarchar(max) null, --(string, optional): Päivämäärä, josta lähin tarjonnan automaattinen synkkaus on käytössä,
  autosyncTarjontaTo nvarchar(max) null, --(string, optional): Päivämäärä, johon asti tarjonnan automaattinen synkkaus on käytössä,
  hakulomakeUri nvarchar(max) null, --(string, optional): Hakulomakkeen www-osoite,
  organisaatioOids nvarchar(max) null, --(array[string], optional): Tarjoaja organisatio oidit. Hakukohteita liittävät.,
  parentHakuOid nvarchar(max) null, --(string, optional): Isäntähaku, johon haku mahdollisesti linkittyy,
  tila nvarchar(max) null, --(string): Haun tila (LUONNOS, JULKAISTU, VALMIS, ...),
  --yhdenPaikanSaanto (YhdenPaikanSaanto): Onko yhden paikan sääntö voimassa haulle ja miksi,
  --koodiMeta (Map[string,KoodiV1RDTO], optional): Koodiston avattua metadataa,
  --organisaatioryhmat (array[string], optional): Hakuun liittyvät organisaatioryhmät,
  --hakukohdeOidsYlioppilastutkintoAntaaHakukelpoisuuden (array[string], optional): Lista hakukohteista joilla ylioppilastutkinto antaa hakukelpoisuuden,
  maksumuuriKaytossa bit null, --(boolean, optional): Maksumuuri käytössä,
  createdBy nvarchar(max) null, --(string): Luonnin suorittajan nimi,
  modified nvarchar(max) null, --(string): Viimeinen muokkauspäivä ja aika,
  modifiedBy nvarchar(max) null, --(string): Muokkauksen suorittajan nimi,
  created nvarchar(max) null, --(string): Luontipäivä ja aika,
  oid nvarchar(max) null, --(string): Objektin yksilöivä tunniste,
  version int null, --(integer): Objektin versio numero
  
  CONSTRAINT PK__koulutustarjonta_haku PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.koulutustarjonta_haku ADD  CONSTRAINT DF__koulutustarjonta_haku__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.koulutustarjonta_haku ADD  CONSTRAINT DF__koulutustarjonta_haku__username  DEFAULT (suser_name()) FOR username
;

END
/* revert
drop table sa.koulutustarjonta_haku
--*/
