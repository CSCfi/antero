IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='koulutustarjonta_hakukohde'
) BEGIN

CREATE TABLE sa.koulutustarjonta_hakukohde(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  
  -- tietojen lähde: https://virkailija.opintopolku.fi/tarjonta-service/swagger/index.html#!/hakukohde/findByOid_get_1
  --organisaatioRyhmaOids (array[string], optional),
  hakuaikaAlkuPvm nvarchar(max) null, --(string, optional),
  hakuaikaLoppuPvm nvarchar(max) null, --(string, optional),
  --ryhmaliitokset (array[RyhmaliitosV1RDTO], optional),
  koulutuksenAlkamiskausiUri nvarchar(max) null, --(string, optional),
  aloituspaikatLkm int null, --(integer): Hakukohde's aloituspaikat amount,
  ensikertalaistenAloituspaikat int null, --(integer, optional),
  valintojenAloituspaikatLkm int null, --(integer, optional),
  --koulutukset (Set[KoulutusIdentification], optional): Hakukohde's related koulutukset (same as hakukohdeKoulutusOids but different format),
  --yhteystiedot (array[YhteystiedotV1RDTO], optional),
  --hakukohdeKoulutusOids (array[string]): Hakukohde's related koulutus oids,
  --valintakokeet (array[ValintakoeV1RDTO], optional),
  hakukohteenNimiUri nvarchar(max) null, --(string, optional),
  lukioKoulutus bit null, --(boolean, optional),
  alinHyvaksyttavaKeskiarvo float null, --(number, optional),
  --painotettavatOppiaineet (array[PainotettavaOppiaineV1RDTO], optional),
  --? hakukohteenNimet (Map[string,string], optional): Hashmap containing hakukohde names and name language,
  --aloituspaikatKuvaukset (Map[string,string], optional),
  ammatillinenPerustutkinto bit null, --(boolean, optional),
  hakulomakeUrl nvarchar(max) null, --(string, optional): Hakulomakkeen www-osoite,
  koulutuksenAlkamisvuosi int null, --(integer, optional),
  tarjoajaOids nvarchar(max) null, --(Set[string], optional),
  koulutusmoduuliTyyppi nvarchar(max) null, --(string, optional),
  hakuOid nvarchar(max) null, --(string): Hakukohde's haku's oid,
  koulutuslaji nvarchar(max) null, --(string, optional),
  --koulutusmoduuliToteutusTarjoajatiedot (Map[string,KoulutusmoduuliTarjoajatiedotV1RDTO], optional),
  uniqueExternalId nvarchar(max) null, --(string, optional): Oppilaitoksen globaalisti uniikki tunniste hakukohteelle,
  ulkoinenTunniste nvarchar(max) null, --(string, optional),
  --hakukohteenLiitteet (array[HakukohdeLiiteV1RDTO], optional),
  ataruLomakeAvain nvarchar(max) null, --(string, optional): Atarulomakkeen avain,
  ylioppilastutkintoAntaaHakukelpoisuuden bit null, --(boolean, optional),
  hakuaikaId nvarchar(max) null, --(string, optional): Hakukohde's haku's inner application period,
  soraKuvausTunniste int null, --(integer, optional),
  --soraKuvausKielet (Set[string], optional),
  valintaPerusteKuvausTunniste int null, --(integer, optional),
  --valintaPerusteKuvausKielet (Set[string], optional),
  --hakukelpoisuusvaatimusUris (array[string], optional),
  alinValintaPistemaara int null, --(integer, optional),
  sahkoinenToimitusOsoite nvarchar(max) null, --(string, optional),
  soraKuvausKoodiUri nvarchar(max) null, --(string, optional),
  valintaperustekuvausKoodiUri nvarchar(max) null, --(string, optional),
  liitteidenToimitusPvm nvarchar(max) null, --(string, optional),
  --lisatiedot (Map[string,string], optional),
  kelaLinjaKoodi nvarchar(max) null, --(string, optional),
  kelaLinjaTarkenne nvarchar(max) null, --(string, optional),
  --pohjakoulutusliitteet (array[string], optional): Liitepyyntöjen pohjakoulutusvaatimukset,
  ohjeetUudelleOpiskelijalle nvarchar(max) null, --(string, optional),
  --liitteidenToimitusOsoite (OsoiteRDTO, optional),
  toteutusTyyppi nvarchar(max) null, --(ToteutustyyppiEnum, optional) = ['AMMATILLINEN_PERUSTUTKINTO' or 'LUKIOKOULUTUS' or 'KORKEAKOULUTUS' or 'AMMATILLINEN_PERUSKOULUTUS_ERITYISOPETUKSENA' or 'VALMENTAVA_JA_KUNTOUTTAVA_OPETUS_JA_OHJAUS' or 'PERUSOPETUKSEN_LISAOPETUS' or 'KORKEAKOULUOPINTO' or 'AMMATILLISEEN_PERUSKOULUTUKSEEN_OHJAAVA_JA_VALMISTAVA_KOULUTUS' or 'AMMATILLISEEN_PERUSKOULUTUKSEEN_VALMENTAVA' or 'AMMATILLISEEN_PERUSKOULUTUKSEEN_VALMENTAVA_ER' or 'MAAHANMUUTTAJIEN_AMMATILLISEEN_PERUSKOULUTUKSEEN_VALMISTAVA_KOULUTUS' or 'MAAHANMUUTTAJIEN_JA_VIERASKIELISTEN_LUKIOKOULUTUKSEEN_VALMISTAVA_KOULUTUS' or 'VAPAAN_SIVISTYSTYON_KOULUTUS' or 'AMMATTITUTKINTO' or 'ERIKOISAMMATTITUTKINTO' or 'AMMATILLINEN_PERUSTUTKINTO_NAYTTOTUTKINTONA' or 'LUKIOKOULUTUS_AIKUISTEN_OPPIMAARA' or 'EB_RP_ISH' or 'ESIOPETUS' or 'PERUSOPETUS' or 'AIKUISTEN_PERUSOPETUS' or 'PELASTUSALAN_KOULUTUS' or 'ERIKOISAMMATTITUTKINTO_VALMISTAVA' or 'AMMATTITUTKINTO_VALMISTAVA' or 'AMMATILLINEN_PERUSTUTKINTO_NAYTTOTUTKINTONA_VALMISTAVA'],
  kaksoisTutkinto bit null, --(boolean, optional),
  kaytetaanHaunPaattymisenAikaa bit null, --(boolean, optional),
  kaytetaanJarjestelmanValintaPalvelua bit null, --(boolean, optional),
  --valintaperusteKuvaukset (Map[string,string], optional),
  --soraKuvaukset (Map[string,string], optional),
  ylinValintapistemaara int null, --(integer, optional),
  --hakukelpoisuusVaatimusKuvaukset (Map[string,string], optional),
  --hakuMenettelyKuvaukset (Map[string,string], optional),
  --peruutusEhdotKuvaukset (Map[string,string], optional),
  --opintoOikeusUris (array[string], optional),
  josYoEiMuitaLiitepyyntoja bit null, --(boolean, optional): Jos ylioppilastutkinto tai kansainvälinen ylioppilastutkinto, ei muiden tutkintojen liitepyyntöjä.,
  overridesHaunHakulomakeUrl bit null, --(boolean, optional): Onko haulle asetettu hakulomakkeen url ylikirjoitettu hakukohdekohtaisella urlilla,
  tila nvarchar(max) null, --(TarjontaTila) = ['POISTETTU' or 'LUONNOS' or 'VALMIS' or 'JULKAISTU' or 'PERUTTU' or 'KOPIOITU' or 'PUUTTEELLINEN']: Hakukohde's state,
  edellisenVuodenHakijatLkm int null, --(integer, optional),
  hakukohteenNimi nvarchar(max) null, --(string, optional),
  --yhdenPaikanSaanto (YhdenPaikanSaanto): Onko yhden paikan sääntö voimassa hakukohteelle ja miksi,
  kaytetaanHakukohdekohtaistaHakuaikaa bit null, --(boolean, optional),
  --tarjoajaNimet (Map[string,string], optional),
  koulutusAsteTyyppi nvarchar(max) null, --(string, optional),
  tutkintoonJohtava bit null, --(boolean, optional),
  --opetusKielet (Set[string], optional),
  createdBy nvarchar(max) null, --(string): Luonnin suorittajan nimi,
  modified nvarchar(max) null, --(string): Viimeinen muokkauspäivä ja aika,
  modifiedBy nvarchar(max) null, --(string): Muokkauksen suorittajan nimi,
  created nvarchar(max) null, --(string): Luontipäivä ja aika,
  oid nvarchar(max) null, --(string): Objektin yksilöivä tunniste,
  version int null, --(integer): Objektin versio numero
  
  CONSTRAINT PK__koulutustarjonta_hakukohde PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.koulutustarjonta_hakukohde ADD  CONSTRAINT DF__koulutustarjonta_hakukohde__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.koulutustarjonta_hakukohde ADD  CONSTRAINT DF__koulutustarjonta_hakukohde__username  DEFAULT (suser_name()) FOR username
;

END
/* revert
drop table sa.koulutustarjonta_hakukohde
--*/
