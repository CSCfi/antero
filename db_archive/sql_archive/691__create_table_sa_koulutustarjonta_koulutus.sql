IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='koulutustarjonta_koulutus'
) BEGIN

CREATE TABLE sa.koulutustarjonta_koulutus(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  
  -- tietojen l‰hde: https://virkailija.opintopolku.fi/tarjonta-service/swagger/index.html#!/koulutus/postKoulutus_post_5
  -- sek‰ tuosta search-kutsusta organisaation oid:
  organisaatio_oid nvarchar(max) null,
  --opintojenLaajuusarvo (KoodiV1RDTO): Opintojen laajuuden arvo,
  opintojenLaajuusarvo_uri nvarchar(max) null,
  --koulutusohjelma (NimiV1RDTO): Tutkinto-ohjelman nimi monella kielella, ainakin yksi kieli pit‰‰ olla t‰ytetty,
  koulutusohjelma_uri nvarchar(max) null,
  --koulutuksenAlkamisPvms (Set[Date], optional): Koulutuksen alkamispvm, voi olla tyhj‰, jos tyhj‰ alkamiskausi ja alkamisvuosi pit‰‰ olla valittuna,
  --opetuskielis (KoodiUrisV1RDTO): Koulutuksen opetuskielet, ainakin yksi kieli pit‰‰ olla syˆtetty (sis‰lt‰‰ koodisto koodi uri:a),
  toteutustyyppi nvarchar(max) null, --(ToteutustyyppiEnum) = ['AMMATILLINEN_PERUSTUTKINTO' or 'LUKIOKOULUTUS' or 'KORKEAKOULUTUS' or 'AMMATILLINEN_PERUSKOULUTUS_ERITYISOPETUKSENA' or 'VALMENTAVA_JA_KUNTOUTTAVA_OPETUS_JA_OHJAUS' or 'PERUSOPETUKSEN_LISAOPETUS' or 'KORKEAKOULUOPINTO' or 'AMMATILLISEEN_PERUSKOULUTUKSEEN_OHJAAVA_JA_VALMISTAVA_KOULUTUS' or 'AMMATILLISEEN_PERUSKOULUTUKSEEN_VALMENTAVA' or 'AMMATILLISEEN_PERUSKOULUTUKSEEN_VALMENTAVA_ER' or 'MAAHANMUUTTAJIEN_AMMATILLISEEN_PERUSKOULUTUKSEEN_VALMISTAVA_KOULUTUS' or 'MAAHANMUUTTAJIEN_JA_VIERASKIELISTEN_LUKIOKOULUTUKSEEN_VALMISTAVA_KOULUTUS' or 'VAPAAN_SIVISTYSTYON_KOULUTUS' or 'AMMATTITUTKINTO' or 'ERIKOISAMMATTITUTKINTO' or 'AMMATILLINEN_PERUSTUTKINTO_NAYTTOTUTKINTONA' or 'LUKIOKOULUTUS_AIKUISTEN_OPPIMAARA' or 'EB_RP_ISH' or 'ESIOPETUS' or 'PERUSOPETUS' or 'AIKUISTEN_PERUSOPETUS' or 'PELASTUSALAN_KOULUTUS' or 'ERIKOISAMMATTITUTKINTO_VALMISTAVA' or 'AMMATTITUTKINTO_VALMISTAVA' or 'AMMATILLINEN_PERUSTUTKINTO_NAYTTOTUTKINTONA_VALMISTAVA']: Koulutuksen toteutuksen tarkasti yksiloiva enumeraatio,
  --organisaatio (OrganisaatioV1RDTO): Tarjoaja tai organisaation johon koulutus on liitetty,
  --oppiaineet (Set[OppiaineV1RDTO], optional): Oppiaineet,
  tunniste nvarchar(max) null, --(string, optional): Tutkinto-ohjelman tunniste, oppilaitoksen oma tunniste j‰rjestett‰v‰lle koulutukselle,
  --kuvausKomo (fi.vm.sade.tarjonta.service.resources.v1.dto.koulutus.KuvausV1RDTO, optional): Koulutuksen koulutusmoduulin monikieliset kuvaustekstit,
  --koulutuksenAlkamiskausi (KoodiV1RDTO, optional): Koulutuksen alkamiskausi koodisto koodi uri, jos ei m‰‰ritetty ainakin yksi alkamispvm pit‰‰ olla valittuna,
  koulutuksenAlkamiskausi_uri nvarchar(max) null,
  koulutuksenAlkamisvuosi int null, --(integer, optional): Koulutuksen alkamisvuosi, jos ei m‰‰ritetty ainakin yksi alkamispvm pit‰‰ olla valittuna,
  koulutusmoduuliTyyppi nvarchar(max) null, --(string) = ['TUTKINNON_OSA' or 'TUTKINTO' or 'TUTKINTO_OHJELMA' or 'OPINTOKOKONAISUUS' or 'OPINTOJAKSO']: Koulutuksen koulutusmoduulin tyyppi,
  --koulutuslaji (KoodiV1RDTO, optional): Koulutuslaji-koodi,
  koulutuslaji_uri nvarchar(max) null,
  komoOid nvarchar(max) null, --(string, optional): Koulutusmoduulin yksilˆiv‰ tunniste,
  uniqueExternalId nvarchar(max) null, --(string, optional): Oppilaitoksen globaalisti uniikki tunniste koulutukselle,
  --opintopolkuAlkamiskausi (Map, optional): Opintopolussa n‰ytett‰v‰ koulutuksen alkaminen,
  hinta float null, --(number, optional): Koulutuksen hinta, on pakollinen jos koulutus on merkitty maksulliseksi,
  hintaString nvarchar(max) null, --(string, optional): Koulutuksen hinta (korvaa vanhan Double-tyyppisen hinnan, koska pit‰‰ tukea myˆs muita kun numeroita),
  --sisaltyvatKoulutuskoodit (KoodiUrisV1RDTO, optional): Koulutukseen sis‰ltyv‰t koulutuskoodit,
  isAvoimenYliopistonKoulutus bit null, --(boolean, optional): Onko koulutus avoimen yliopiston/ammattikorkeakoulun koulutus,
  --opetusAikas (KoodiUrisV1RDTO): Koulutuksen opetusajat (esim. Iltaopetus) (sis‰lt‰‰ koodisto koodi uri:a),
  --opetusPaikkas (KoodiUrisV1RDTO): Koulutuksen opetuspaikat (sis‰lt‰‰ koodisto koodi uri:a),
  --aihees (KoodiUrisV1RDTO, optional): Koulutuksen aiheet (sis‰lt‰‰ koodisto koodi uri:a),
  hakijalleNaytettavaTunniste nvarchar(max) null, --(string, optional): Hakijalle n‰ytett‰v‰ tunniste,
  --yhteyshenkilos (Set[YhteyshenkiloTyyppi], optional),
  --opetusTarjoajat (Set[string], optional): Opintojen tarjoajat,
  --opetusJarjestajat (Set[string], optional): Opintojen j‰rjest‰j‰t,
  --opetusmuodos (KoodiUrisV1RDTO): Koulutuksen opetusmuodot (sis‰lt‰‰ koodisto koodi uri:a),
  --suunniteltuKestoTyyppi (KoodiV1RDTO): Koulutuksen suunntellun keston tyyppi (koodisto koodi uri),
  suunniteltuKestoTyyppi_uri nvarchar(max) null,
  suunniteltuKestoArvo nvarchar(max) null, --(string): Koulutuksen suunntellun keston arvo,
  --ammattinimikkeet (KoodiUrisV1RDTO, optional): Koulutuksen ammattinimikkeet (sis‰lt‰‰ koodisto koodi uri:a),
  opintojenMaksullisuus bit null, --(boolean, optional): Valitaan opintojen maksullisuuden (false=koulutus ei vaadi maksua),
  --kuvausKomoto (fi.vm.sade.tarjonta.service.resources.v1.dto.koulutus.KuvausV1RDTO, optional): Koulutuksen koulutusmoduulin toteutuksen monikieliset kuvaustekstit,
  --extraParams (Map[string,string], optional): Map-rakenne ylim‰‰r‰isille parametreille, joita voi tarvittaessa hyˆdynt‰‰ tallennuksen yhteydess‰,
  --sisaltyyKoulutuksiin (Set[KoulutusIdentification], optional): Koulutukset, joihin t‰m‰ koulutus sis‰ltyy,
  komotoOid nvarchar(max) null, --(string, optional): Koulutusmoduulin totetuksen yksilˆiv‰ tunniste,
  --parents (Set[string], optional): Koulutuksen yl‰puoliset kouloutukset,
  tila nvarchar(max) null, --(TarjontaTila) = ['POISTETTU' or 'LUONNOS' or 'VALMIS' or 'JULKAISTU' or 'PERUTTU' or 'KOPIOITU' or 'PUUTTEELLINEN']: Koulutuksen julkaisun tila,
  moduulityyppi nvarchar(max) null, --(ModuulityyppiEnum) = ['AMMATILLINEN_PERUSKOULUTUS' or 'LUKIOKOULUTUS' or 'KORKEAKOULUTUS' or 'PERUSOPETUKSEN_LISAOPETUS' or 'VALMENTAVA_JA_KUNTOUTTAVA_OPETUS' or 'AMM_OHJAAVA_JA_VALMISTAVA_KOULUTUS' or 'MAAHANM_LUKIO_VALMISTAVA_KOULUTUS' or 'MAAHANM_AMM_VALMISTAVA_KOULUTUS' or 'VAPAAN_SIVISTYSTYON_KOULUTUS' or 'PERUSOPETUS' or 'PERUSOPETUS_ULKOMAINEN' or 'AMMATILLINEN_PERUSTUTKINTO_NAYTTOTUTKINTONA' or 'ERIKOISAMMATTITUTKINTO' or 'AMMATTITUTKINTO' or 'TUNTEMATON']: Koulutusmoduulin karkeasti yksilˆiv‰ enumeraatio,
  --children (Set[string], optional): Koulutuksen lapset,
  --koulutusala (KoodiV1RDTO): OPH2002 koulutusala-koodi,
  koulutusala_uri nvarchar(max) null,
  --koulutusaste (KoodiV1RDTO): OPH2002 koulutusaste-koodi,
  koulutusaste_uri nvarchar(max) null,
  --koulutuskoodi (KoodiV1RDTO): Kuusinumeroinen tilastokeskuksen koulutuskoodi,
  koulutuskoodi_uri nvarchar(max) null,
  --opintoala (KoodiV1RDTO): OPH2002 opintoala-koodi,
  opintoala_uri nvarchar(max) null,
  --opintojenLaajuusyksikko (KoodiV1RDTO): Opintojen laajusyksikko-koodi,
  opintojenLaajuusYksikko_uri nvarchar(max) null,
  --tutkinto (KoodiV1RDTO): OPH tutkinto-koodi,
  tutkinto_uri nvarchar(max) null,
  --ohjelmas (KoodiUrisV1RDTO, optional): Kaikki haettuun koodiin sisaltyvat koulutusohjelma-, osaamisala- tai lukiolinja-tyyppiset koodit.,
  --eqf (KoodiV1RDTO): EQF-koodi,
  eqf_uri nvarchar(max) null,
  --nqf (KoodiV1RDTO): NQF-koodi,
  nqf_uri nvarchar(max) null,
  --koulutustyyppi (KoodiV1RDTO): Koulutustyyppi-koodi,
  koulutustyyppi_uri nvarchar(max) null,
  createdBy nvarchar(max) null, --(string): Luonnin suorittajan nimi,
  modified nvarchar(max) null, --(string): Viimeinen muokkausp‰iv‰ ja aika,
  modifiedBy nvarchar(max) null, --(string): Muokkauksen suorittajan nimi,
  created nvarchar(max) null, --(string): Luontip‰iv‰ ja aika,
  oid nvarchar(max) null, --(string): Objektin yksilˆiv‰ tunniste,
  version int null, --(integer): Objektin versio numero
  
  CONSTRAINT PK__koulutustarjonta_koulutus PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.koulutustarjonta_koulutus ADD  CONSTRAINT DF__koulutustarjonta_koulutus__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.koulutustarjonta_koulutus ADD  CONSTRAINT DF__koulutustarjonta_koulutus__username  DEFAULT (suser_name()) FOR username
;

END
/* revert
drop table sa.koulutustarjonta_koulutus
--*/
