#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
koulutustarjonta_hakukohde

todo doc
"""
import sys, os, getopt
import httplib
import json
from time import localtime, strftime

import dboperator

def show(message):
  print strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message

def makerow():
  return {
    #-- tietojen lähde: https://virkailija.opintopolku.fi/tarjonta-service/swagger/index.html#!/hakukohde/findByOid_get_1
    #--organisaatioRyhmaOids (array[string], optional),
    "hakuaikaAlkuPvm": None, # nvarchar(max) null, --(string, optional),
    "hakuaikaLoppuPvm": None, # nvarchar(max) null, --(string, optional),
    #--ryhmaliitokset (array[RyhmaliitosV1RDTO], optional),
    "koulutuksenAlkamiskausiUri": None, # nvarchar(max) null, --(string, optional),
    "aloituspaikatLkm": None, # int null, --(integer): Hakukohde's aloituspaikat amount,
    "ensikertalaistenAloituspaikat": None, # int null, --(integer, optional),
    "valintojenAloituspaikatLkm": None, # int null, --(integer, optional),
    #--koulutukset (Set[KoulutusIdentification], optional): Hakukohde's related koulutukset (same as hakukohdeKoulutusOids but different format),
    #--yhteystiedot (array[YhteystiedotV1RDTO], optional),
    "hakukohdeKoulutusOids": None, # (array[string]): Hakukohde's related koulutus oids,
    #--valintakokeet (array[ValintakoeV1RDTO], optional),
    "hakukohteenNimiUri": None, # nvarchar(max) null, --(string, optional),
    "lukioKoulutus": None, # bit null, --(boolean, optional),
    "alinHyvaksyttavaKeskiarvo": None, # float null, --(number, optional),
    #--painotettavatOppiaineet (array[PainotettavaOppiaineV1RDTO], optional),
    #--? hakukohteenNimet (Map[string,string], optional): Hashmap containing hakukohde names and name language,
    #--aloituspaikatKuvaukset (Map[string,string], optional),
    "ammatillinenPerustutkinto": None, # bit null, --(boolean, optional),
    "hakulomakeUrl": None, # nvarchar(max) null, --(string, optional): Hakulomakkeen www-osoite,
    "koulutuksenAlkamisvuosi": None, # int null, --(integer, optional),
    "tarjoajaOids": None, # nvarchar(max) null, --(Set[string], optional),
    "koulutusmoduuliTyyppi": None, # nvarchar(max) null, --(string, optional),
    "hakuOid": None, # nvarchar(max) null, --(string): Hakukohde's haku's oid,
    "koulutuslaji": None, # nvarchar(max) null, --(string, optional),
    #--koulutusmoduuliToteutusTarjoajatiedot (Map[string,KoulutusmoduuliTarjoajatiedotV1RDTO], optional),
    "uniqueExternalId": None, # nvarchar(max) null, --(string, optional): Oppilaitoksen globaalisti uniikki tunniste hakukohteelle,
    "ulkoinenTunniste": None, # nvarchar(max) null, --(string, optional),
    #--hakukohteenLiitteet (array[HakukohdeLiiteV1RDTO], optional),
    "ataruLomakeAvain": None, # nvarchar(max) null, --(string, optional): Atarulomakkeen avain,
    "ylioppilastutkintoAntaaHakukelpoisuuden": None, # bit null, --(boolean, optional),
    "hakuaikaId": None, # nvarchar(max) null, --(string, optional): Hakukohde's haku's inner application period,
    "soraKuvausTunniste": None, # int null, --(integer, optional),
    #--soraKuvausKielet (Set[string], optional),
    "valintaPerusteKuvausTunniste": None, # int null, --(integer, optional),
    #--valintaPerusteKuvausKielet (Set[string], optional),
    #--hakukelpoisuusvaatimusUris (array[string], optional),
    "alinValintaPistemaara": None, # int null, --(integer, optional),
    "sahkoinenToimitusOsoite": None, # nvarchar(max) null, --(string, optional),
    "soraKuvausKoodiUri": None, # nvarchar(max) null, --(string, optional),
    "valintaperustekuvausKoodiUri": None, # nvarchar(max) null, --(string, optional),
    "liitteidenToimitusPvm": None, # nvarchar(max) null, --(string, optional),
    #--lisatiedot (Map[string,string], optional),
    "kelaLinjaKoodi": None, # nvarchar(max) null, --(string, optional),
    "kelaLinjaTarkenne": None, # nvarchar(max) null, --(string, optional),
    #--pohjakoulutusliitteet (array[string], optional): Liitepyyntöjen pohjakoulutusvaatimukset,
    "ohjeetUudelleOpiskelijalle": None, # nvarchar(max) null, --(string, optional),
    #--liitteidenToimitusOsoite (OsoiteRDTO, optional),
    "toteutusTyyppi": None, # nvarchar(max) null, --(ToteutustyyppiEnum, optional) = ['AMMATILLINEN_PERUSTUTKINTO' or 'LUKIOKOULUTUS' or 'KORKEAKOULUTUS' or 'AMMATILLINEN_PERUSKOULUTUS_ERITYISOPETUKSENA' or 'VALMENTAVA_JA_KUNTOUTTAVA_OPETUS_JA_OHJAUS' or 'PERUSOPETUKSEN_LISAOPETUS' or 'KORKEAKOULUOPINTO' or 'AMMATILLISEEN_PERUSKOULUTUKSEEN_OHJAAVA_JA_VALMISTAVA_KOULUTUS' or 'AMMATILLISEEN_PERUSKOULUTUKSEEN_VALMENTAVA' or 'AMMATILLISEEN_PERUSKOULUTUKSEEN_VALMENTAVA_ER' or 'MAAHANMUUTTAJIEN_AMMATILLISEEN_PERUSKOULUTUKSEEN_VALMISTAVA_KOULUTUS' or 'MAAHANMUUTTAJIEN_JA_VIERASKIELISTEN_LUKIOKOULUTUKSEEN_VALMISTAVA_KOULUTUS' or 'VAPAAN_SIVISTYSTYON_KOULUTUS' or 'AMMATTITUTKINTO' or 'ERIKOISAMMATTITUTKINTO' or 'AMMATILLINEN_PERUSTUTKINTO_NAYTTOTUTKINTONA' or 'LUKIOKOULUTUS_AIKUISTEN_OPPIMAARA' or 'EB_RP_ISH' or 'ESIOPETUS' or 'PERUSOPETUS' or 'AIKUISTEN_PERUSOPETUS' or 'PELASTUSALAN_KOULUTUS' or 'ERIKOISAMMATTITUTKINTO_VALMISTAVA' or 'AMMATTITUTKINTO_VALMISTAVA' or 'AMMATILLINEN_PERUSTUTKINTO_NAYTTOTUTKINTONA_VALMISTAVA'],
    "kaksoisTutkinto": None, # bit null, --(boolean, optional),
    "kaytetaanHaunPaattymisenAikaa": None, # bit null, --(boolean, optional),
    "kaytetaanJarjestelmanValintaPalvelua": None, # bit null, --(boolean, optional),
    #--valintaperusteKuvaukset (Map[string,string], optional),
    #--soraKuvaukset (Map[string,string], optional),
    "ylinValintapistemaara": None, # int null, --(integer, optional),
    #--hakukelpoisuusVaatimusKuvaukset (Map[string,string], optional),
    #--hakuMenettelyKuvaukset (Map[string,string], optional),
    #--peruutusEhdotKuvaukset (Map[string,string], optional),
    #--opintoOikeusUris (array[string], optional),
    "josYoEiMuitaLiitepyyntoja": None, # bit null, --(boolean, optional): Jos ylioppilastutkinto tai kansainvälinen ylioppilastutkinto, ei muiden tutkintojen liitepyyntöjä.,
    "overridesHaunHakulomakeUrl": None, # bit null, --(boolean, optional): Onko haulle asetettu hakulomakkeen url ylikirjoitettu hakukohdekohtaisella urlilla,
    "tila": None, # nvarchar(max) null, --(TarjontaTila) = ['POISTETTU' or 'LUONNOS' or 'VALMIS' or 'JULKAISTU' or 'PERUTTU' or 'KOPIOITU' or 'PUUTTEELLINEN']: Hakukohde's state,
    "edellisenVuodenHakijatLkm": None, # int null, --(integer, optional),
    "hakukohteenNimi": None, # nvarchar(max) null, --(string, optional),
    #--yhdenPaikanSaanto (YhdenPaikanSaanto): Onko yhden paikan sääntö voimassa hakukohteelle ja miksi,
    "kaytetaanHakukohdekohtaistaHakuaikaa": None, # bit null, --(boolean, optional),
    #--tarjoajaNimet (Map[string,string], optional),
    "koulutusAsteTyyppi": None, # nvarchar(max) null, --(string, optional),
    "tutkintoonJohtava": None, # bit null, --(boolean, optional),
    "opetusKielet": None, #--opetusKielet (Set[string], optional),
    "createdBy": None, # nvarchar(max) null, --(string): Luonnin suorittajan nimi,
    "modified": None, # nvarchar(max) null, --(string): Viimeinen muokkauspäivä ja aika,
    "modifiedBy": None, # nvarchar(max) null, --(string): Muokkauksen suorittajan nimi,
    "created": None, # nvarchar(max) null, --(string): Luontipäivä ja aika,
    "oid": None, # nvarchar(max) null, --(string): Objektin yksilöivä tunniste,
    "version": None # int null, --(integer): Objektin versio numero
  }

def getnimi(i,kieli):
  lang = "kieli_"+kieli
  if lang in i["nimi"]:
    return i["nimi"][lang]
  return None

def load(hostname,url,schema,table,verbose=False,debug=False):
  if verbose: show("begin")

  row = makerow()
  dboperator.columns(row,debug)

  if verbose: show("empty %s.%s"%(schema,table))
  dboperator.empty(schema,table,debug)

  httpconn = httplib.HTTPSConnection(hostname)
  show("load securely from "+hostname+url)

  # get list of oids
  httpconn.request('GET', url)
  rr = httpconn.getresponse()
  jj = json.loads(rr.read())
  cnt = 0
  for ii in jj["result"]:
    cnt += 1
    # show some sign of being alive
    if cnt%100 == 0:
      sys.stdout.write('.')
      sys.stdout.flush()
    if cnt%1000 == 0:
      show("-- %d" % (cnt))

    url = "/tarjonta-service/rest/v1/hakukohde/%s?populateAdditionalKomotoFields=true"%(ii["oid"])
    try:
      httpconn.request('GET', url)
      r = httpconn.getresponse()
      j = json.loads(r.read())
    except ValueError, e:
      show("-- %d -- could not load %s"%(cnt,ii["oid"]))
    else:
      i = j["result"]
      row = makerow()

      for col in row:
        row[col] = None if col not in i else i[col]
        if type(row[col]) is list:
          row[col] = ''.join(map(str,json.dumps(row[col])))

      if verbose: show("%d -- %s"%(cnt,row["oid"]))
      if debug: print row
      dboperator.insert(hostname+url,schema,table,row,debug)

  if verbose: show("ready")

def usage():
  print """
usage: koulutustarjonta_hakukohde.py [-H|--hostname <hostname>] [-u|--url <url>] [-e|--schema <schema>] [-t|--table <table>] [-v|--verbose] [-d|--debug]

hostname defaults to "testi.virkailija.opintopolku.fi"
url defaults to "/tarjonta-service/rest/v1/haku/findAll"
schema defaults to $SCHEMA then to "sa"
table defaults to $TABLE then to "koulutustarjonta_haku"
"""

def main(argv):
  # variables from arguments with possible defaults
  hostname = os.getenv("OPINTOPOLKU") or "testi.virkailija.opintopolku.fi"
  url = "/tarjonta-service/rest/v1/hakukohde"
  schema = os.getenv("SCHEMA") or "sa"
  table = os.getenv("TABLE") or "koulutustarjonta_hakukohde"
  verbose,debug = False,False

  try:
    opts, args = getopt.getopt(argv,"H:u:e:t:c:vd",["hostname=","url=","schema=","table=","verbose","debug"])
  except getopt.GetoptError as err:
    print(err)
    usage()
    sys.exit(2)
  for opt, arg in opts:
    if opt in ("-H", "--hostname"): hostname = arg
    elif opt in ("-u", "--url"): url = arg
    elif opt in ("-e", "--schema"): schema = arg
    elif opt in ("-t", "--table"): table = arg
    elif opt in ("-v", "--verbose"): verbose = True
    elif opt in ("-d", "--debug"): debug = True
  if not hostname or not url or not schema or not table:
    usage()
    sys.exit(2)

  if debug: print "debugging"

  load(hostname,url,schema,table,verbose,debug)

  dboperator.close(debug)

if __name__ == "__main__":
  main(sys.argv[1:])
