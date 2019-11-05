#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
koulutustarjonta_haku

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
    "korkeakouluHaku": None, # bit null, --(boolean, optional),
    #hakuaikas (array[HakuaikaV1RDTO]): Lista haun hakuaikoja,
    "kohdejoukkoUri": None, # nvarchar(max) null, --(string): Haun kohdejoukko koodisto uri,
    "koulutuksenAlkamiskausiUri": None, # nvarchar(max) null, --(string): Koulutuksen alkamiskausi koodisto uri,
    "koulutuksenAlkamisVuosi": None, # int null, --(integer): Koulutuksen alkamisvuosi,
    "hakutyyppiUri": None, # nvarchar(max) null, --(string): Hakutyypin koodisto uri,
    "hakutapaUri": None, # nvarchar(max) null, --(string): Hakutapa koodisto uri,
    "hakukausiUri": None, # nvarchar(max) null, --(string): Hakukauden koodisto uri,
    "hakukausiVuosi": None, # int null, --(integer): Hakukauden vuosi,
    "sijoittelu": None, # bit null, --(boolean): Käytetäänkö järjestelmän sijoittelupalvelua,
    "haunTunniste": None, # nvarchar(max) null, --(string): Haun tunniste,
    #nimi (Map[string,string]): Haun monikielinen nimi,
    "nimi": None, # nvarchar(max) null,
    "nimi_sv": None, # nvarchar(max) null,
    "nimi_en": None, # nvarchar(max) null,
    "tarjoajaOids": None, # nvarchar(max) null, --(array[string], optional): Tarjoaja organisatio oidit. Muokkaajat.,
    "koulutusmoduuliTyyppi": None, # nvarchar(max) null, --(string, optional) = ['TUTKINNON_OSA' or 'TUTKINTO' or 'TUTKINTO_OHJELMA' or 'OPINTOKOKONAISUUS' or 'OPINTOJAKSO']: Haun koulutusmoduulin tyyppi,
    #hakukohdeOids (array[string]): Haun hakukohdehteiden OID lista,
    "ataruLomakeAvain": None, # nvarchar(max) null, --(string, optional): Ataru lomakeavain,
    "kohdejoukonTarkenne": None, # nvarchar(max) null, --(string, optional): Haun kohdejoukon tarkenne,
    "maxHakukohdes": None, # int null, --(integer): Maksimi hakukohteiden lukumäärä, ei rajoita tarjontaa vaan kouutusinformaatiossa käytössä,
    "ylioppilastutkintoAntaaHakukelpoisuuden": None, # bit null, --(boolean, optional): Ylioppilastutkinto antaa hakukelpoisuuden,
    "usePriority": None, # bit null, --(boolean, optional): Hakukohteet järjestettävä prioriteettijärjestykseen.,
    "jarjestelmanHakulomake": None, # bit null, --(boolean): Käytetäänkö järjestelmän hakulomaketta,
    "opintopolunNayttaminenLoppuu": None, # nvarchar(max) null, --(string, optional): Mihin asti haku näytetään opintopolussa,
    "tunnistusKaytossa": None, # bit null, --(boolean, optional): Tunnistus käytössä,
    #sisaltyvatHaut (Set[string], optional): Sisältyvät haut,
    "autosyncTarjonta": None, # bit null, --(boolean, optional): Käytetäänkö haussa tarjonnan automaattista sykkausta,
    "autosyncTarjontaFrom": None, # nvarchar(max) null, --(string, optional): Päivämäärä, josta lähin tarjonnan automaattinen synkkaus on käytössä,
    "autosyncTarjontaTo": None, # nvarchar(max) null, --(string, optional): Päivämäärä, johon asti tarjonnan automaattinen synkkaus on käytössä,
    "hakulomakeUri": None, # nvarchar(max) null, --(string, optional): Hakulomakkeen www-osoite,
    "organisaatioOids": None, # nvarchar(max) null, --(array[string], optional): Tarjoaja organisatio oidit. Hakukohteita liittävät.,
    "parentHakuOid": None, # nvarchar(max) null, --(string, optional): Isäntähaku, johon haku mahdollisesti linkittyy,
    "tila": None, # nvarchar(max) null, --(string): Haun tila (LUONNOS, JULKAISTU, VALMIS, ...),
    #yhdenPaikanSaanto (YhdenPaikanSaanto): Onko yhden paikan sääntö voimassa haulle ja miksi,
    #koodiMeta (Map[string,KoodiV1RDTO], optional): Koodiston avattua metadataa,
    #organisaatioryhmat (array[string], optional): Hakuun liittyvät organisaatioryhmät,
    #hakukohdeOidsYlioppilastutkintoAntaaHakukelpoisuuden (array[string], optional): Lista hakukohteista joilla ylioppilastutkinto antaa hakukelpoisuuden,
    "maksumuuriKaytossa": None, # bit null, --(boolean, optional): Maksumuuri käytössä,
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

  reqheaders = {'Caller-id': '1.2.246.562.10.2013112012294919827487.vipunen'}
  httpconn.request('GET', url, headers=reqheaders)
  #httpconn.request('GET', url)
  r = httpconn.getresponse()
  j = json.loads(r.read())
  cnt = 0
  for i in j["result"]:
    cnt += 1
    # show some sign of being alive
    if cnt%100 == 0:
      sys.stdout.write('.')
      sys.stdout.flush()
    if cnt%1000 == 0:
      show("-- %d" % (cnt))

    row = makerow()

    for col in row:
      if col == "nimi":
        row["nimi"] = getnimi(i,"fi")
        row["nimi_sv"] = getnimi(i,"sv")
        row["nimi_en"] = getnimi(i,"en")
      else:
        row[col] = None if col not in i else i[col]
      if type(row[col]) is list:
        row[col] = ''.join(map(str,json.dumps(row[col])))

    if verbose: show("%d -- %s"%(cnt,row["oid"]))
    if debug: print row
    dboperator.insert(hostname+url,schema,table,row,debug)

  if verbose: show("ready")

def usage():
  print """
usage: koulutustarjonta_haku.py [-H|--hostname <hostname>] [-u|--url <url>] [-e|--schema <schema>] [-t|--table <table>] [-v|--verbose] [-d|--debug]

hostname defaults to "virkailija.testiopintopolku.fi"
url defaults to "/tarjonta-service/rest/v1/haku/findAll"
schema defaults to $SCHEMA then to "sa"
table defaults to $TABLE then to "koulutustarjonta_haku"
"""

def main(argv):
  # variables from arguments with possible defaults
  hostname = os.getenv("OPINTOPOLKU") or "virkailija.testiopintopolku.fi"
  url = "/tarjonta-service/rest/v1/haku/findAll"
  schema = os.getenv("SCHEMA") or "sa"
  table = os.getenv("TABLE") or "koulutustarjonta_haku"
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
