#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
koulutustarjonta_koulutus

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
    #-- tietojen lähde: https://virkailija.opintopolku.fi/tarjonta-service/swagger/index.html#!/koulutus/postKoulutus_post_5
    #-- sekä tuosta search-kutsusta organisaation oid:
    "organisaatio_oid": None,
    #opintojenLaajuusarvo (KoodiV1RDTO): Opintojen laajuuden arvo,
    "opintojenLaajuusarvo_arvo": None,
    #koulutusohjelma (NimiV1RDTO): Tutkinto-ohjelman nimi monella kielella, ainakin yksi kieli pitää olla täytetty,
    "koulutusohjelma_uri": None,
    #koulutuksenAlkamisPvms (Set[Date], optional): Koulutuksen alkamispvm, voi olla tyhjä, jos tyhjä alkamiskausi ja alkamisvuosi pitää olla valittuna,
    #opetuskielis (KoodiUrisV1RDTO): Koulutuksen opetuskielet, ainakin yksi kieli pitää olla syötetty (sisältää koodisto koodi uri:a),
    "toteutustyyppi": None, # (ToteutustyyppiEnum) = ['AMMATILLINEN_PERUSTUTKINTO' or 'LUKIOKOULUTUS' or 'KORKEAKOULUTUS' or 'AMMATILLINEN_PERUSKOULUTUS_ERITYISOPETUKSENA' or 'VALMENTAVA_JA_KUNTOUTTAVA_OPETUS_JA_OHJAUS' or 'PERUSOPETUKSEN_LISAOPETUS' or 'KORKEAKOULUOPINTO' or 'AMMATILLISEEN_PERUSKOULUTUKSEEN_OHJAAVA_JA_VALMISTAVA_KOULUTUS' or 'AMMATILLISEEN_PERUSKOULUTUKSEEN_VALMENTAVA' or 'AMMATILLISEEN_PERUSKOULUTUKSEEN_VALMENTAVA_ER' or 'MAAHANMUUTTAJIEN_AMMATILLISEEN_PERUSKOULUTUKSEEN_VALMISTAVA_KOULUTUS' or 'MAAHANMUUTTAJIEN_JA_VIERASKIELISTEN_LUKIOKOULUTUKSEEN_VALMISTAVA_KOULUTUS' or 'VAPAAN_SIVISTYSTYON_KOULUTUS' or 'AMMATTITUTKINTO' or 'ERIKOISAMMATTITUTKINTO' or 'AMMATILLINEN_PERUSTUTKINTO_NAYTTOTUTKINTONA' or 'LUKIOKOULUTUS_AIKUISTEN_OPPIMAARA' or 'EB_RP_ISH' or 'ESIOPETUS' or 'PERUSOPETUS' or 'AIKUISTEN_PERUSOPETUS' or 'PELASTUSALAN_KOULUTUS' or 'ERIKOISAMMATTITUTKINTO_VALMISTAVA' or 'AMMATTITUTKINTO_VALMISTAVA' or 'AMMATILLINEN_PERUSTUTKINTO_NAYTTOTUTKINTONA_VALMISTAVA']: Koulutuksen toteutuksen tarkasti yksiloiva enumeraatio,
    #organisaatio (OrganisaatioV1RDTO): Tarjoaja tai organisaation johon koulutus on liitetty,
    #oppiaineet (Set[OppiaineV1RDTO], optional): Oppiaineet,
    "tunniste": None, # (string, optional): Tutkinto-ohjelman tunniste, oppilaitoksen oma tunniste järjestettävälle koulutukselle,
    #kuvausKomo (fi.vm.sade.tarjonta.service.resources.v1.dto.koulutus.KuvausV1RDTO, optional): Koulutuksen koulutusmoduulin monikieliset kuvaustekstit,
    #koulutuksenAlkamiskausi (KoodiV1RDTO, optional): Koulutuksen alkamiskausi koodisto koodi uri, jos ei määritetty ainakin yksi alkamispvm pitää olla valittuna,
    "koulutuksenAlkamiskausi_arvo": None,
    "koulutuksenAlkamisvuosi": None, # (integer, optional): Koulutuksen alkamisvuosi, jos ei määritetty ainakin yksi alkamispvm pitää olla valittuna,
    "koulutusmoduuliTyyppi": None, # (string) = ['TUTKINNON_OSA' or 'TUTKINTO' or 'TUTKINTO_OHJELMA' or 'OPINTOKOKONAISUUS' or 'OPINTOJAKSO']: Koulutuksen koulutusmoduulin tyyppi,
    #koulutuslaji (KoodiV1RDTO, optional): Koulutuslaji-koodi,
    "koulutuslaji_uri": None,
    "komoOid": None, # (string, optional): Koulutusmoduulin yksilöivä tunniste,
    "uniqueExternalId": None, # (string, optional): Oppilaitoksen globaalisti uniikki tunniste koulutukselle,
    #opintopolkuAlkamiskausi (Map, optional): Opintopolussa näytettävä koulutuksen alkaminen,
    #"hinta": None, # (number, optional): Koulutuksen hinta, on pakollinen jos koulutus on merkitty maksulliseksi,
    #"hintaString": None, # (string, optional): Koulutuksen hinta (korvaa vanhan Double-tyyppisen hinnan, koska pitää tukea myös muita kun numeroita),
    #sisaltyvatKoulutuskoodit (KoodiUrisV1RDTO, optional): Koulutukseen sisältyvät koulutuskoodit,
    "isAvoimenYliopistonKoulutus": None, # (boolean, optional): Onko koulutus avoimen yliopiston/ammattikorkeakoulun koulutus,
    #opetusAikas (KoodiUrisV1RDTO): Koulutuksen opetusajat (esim. Iltaopetus) (sisältää koodisto koodi uri:a),
    #opetusPaikkas (KoodiUrisV1RDTO): Koulutuksen opetuspaikat (sisältää koodisto koodi uri:a),
    #aihees (KoodiUrisV1RDTO, optional): Koulutuksen aiheet (sisältää koodisto koodi uri:a),
    #"hakijalleNaytettavaTunniste": None, # (string, optional): Hakijalle näytettävä tunniste,
    #yhteyshenkilos (Set[YhteyshenkiloTyyppi], optional),
    #opetusTarjoajat (Set[string], optional): Opintojen tarjoajat,
    #opetusJarjestajat (Set[string], optional): Opintojen järjestäjät,
    #opetusmuodos (KoodiUrisV1RDTO): Koulutuksen opetusmuodot (sisältää koodisto koodi uri:a),
    #suunniteltuKestoTyyppi (KoodiV1RDTO): Koulutuksen suunntellun keston tyyppi (koodisto koodi uri),
    #"suunniteltuKestoTyyppi_uri": None,
    #"suunniteltuKestoArvo": None, # (string): Koulutuksen suunntellun keston arvo,
    #ammattinimikkeet (KoodiUrisV1RDTO, optional): Koulutuksen ammattinimikkeet (sisältää koodisto koodi uri:a),
    "opintojenMaksullisuus": None, # (boolean, optional): Valitaan opintojen maksullisuuden (false=koulutus ei vaadi maksua),
    #kuvausKomoto (fi.vm.sade.tarjonta.service.resources.v1.dto.koulutus.KuvausV1RDTO, optional): Koulutuksen koulutusmoduulin toteutuksen monikieliset kuvaustekstit,
    #extraParams (Map[string,string], optional): Map-rakenne ylimääräisille parametreille, joita voi tarvittaessa hyödyntää tallennuksen yhteydessä,
    #sisaltyyKoulutuksiin (Set[KoulutusIdentification], optional): Koulutukset, joihin tämä koulutus sisältyy,
    "komotoOid": None, # (string, optional): Koulutusmoduulin totetuksen yksilöivä tunniste,
    #parents (Set[string], optional): Koulutuksen yläpuoliset kouloutukset,
    "tila": None, # (TarjontaTila) = ['POISTETTU' or 'LUONNOS' or 'VALMIS' or 'JULKAISTU' or 'PERUTTU' or 'KOPIOITU' or 'PUUTTEELLINEN']: Koulutuksen julkaisun tila,
    "moduulityyppi": None, # (ModuulityyppiEnum) = ['AMMATILLINEN_PERUSKOULUTUS' or 'LUKIOKOULUTUS' or 'KORKEAKOULUTUS' or 'PERUSOPETUKSEN_LISAOPETUS' or 'VALMENTAVA_JA_KUNTOUTTAVA_OPETUS' or 'AMM_OHJAAVA_JA_VALMISTAVA_KOULUTUS' or 'MAAHANM_LUKIO_VALMISTAVA_KOULUTUS' or 'MAAHANM_AMM_VALMISTAVA_KOULUTUS' or 'VAPAAN_SIVISTYSTYON_KOULUTUS' or 'PERUSOPETUS' or 'PERUSOPETUS_ULKOMAINEN' or 'AMMATILLINEN_PERUSTUTKINTO_NAYTTOTUTKINTONA' or 'ERIKOISAMMATTITUTKINTO' or 'AMMATTITUTKINTO' or 'TUNTEMATON']: Koulutusmoduulin karkeasti yksilöivä enumeraatio,
    #children (Set[string], optional): Koulutuksen lapset,
    #koulutusala (KoodiV1RDTO): OPH2002 koulutusala-koodi,
    "koulutusala_uri": None,
    #koulutusaste (KoodiV1RDTO): OPH2002 koulutusaste-koodi,
    "koulutusaste_uri": None,
    #koulutuskoodi (KoodiV1RDTO): Kuusinumeroinen tilastokeskuksen koulutuskoodi,
    "koulutuskoodi_uri": None,
    "koulutuskoodi_arvo": None, #tilastokeskuksen koulutuskoodi
    "koulutuskoodi_nimi": None, #koulutuksen nimi
    #opintoala (KoodiV1RDTO): OPH2002 opintoala-koodi,
    "opintoala_uri": None,
    #opintojenLaajuusyksikko (KoodiV1RDTO): Opintojen laajusyksikko-koodi,
    "opintojenLaajuusYksikko_uri": None,
    #tutkinto (KoodiV1RDTO): OPH tutkinto-koodi,
    "tutkinto_uri": None,
    #ohjelmas (KoodiUrisV1RDTO, optional): Kaikki haettuun koodiin sisaltyvat koulutusohjelma-, osaamisala- tai lukiolinja-tyyppiset koodit.,
    #eqf (KoodiV1RDTO): EQF-koodi,
    "eqf_uri": None,
    #nqf (KoodiV1RDTO): NQF-koodi,
    "nqf_uri": None,
    #koulutustyyppi (KoodiV1RDTO): Koulutustyyppi-koodi,
    "koulutustyyppi_arvo": None,
    "pohjakoulutusvaatimus_arvo": None,
    "createdBy": None, # (string): Luonnin suorittajan nimi,
    "modified": None, # (string): Viimeinen muokkauspäivä ja aika,
    "modifiedBy": None, # (string): Muokkauksen suorittajan nimi,
    "created": None, # (string): Luontipäivä ja aika,
    "oid": None, # (string): Objektin yksilöivä tunniste,
    "version": None # (integer): Objektin versio numero
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
  reqheaders = {'Caller-id': '1.2.246.562.10.2013112012294919827487.vipunen'}
  httpconn.request('GET', url, headers=reqheaders)
  #httpconn.request('GET', url)
  rr = httpconn.getresponse()
  jj = json.loads(rr.read())
  cnt = 0
  for iii in jj["result"]["tulokset"]:
    #NB! iii["oid"] on organisaation oid! talteen?
    for ii in iii["tulokset"]:
      cnt += 1
      # show some sign of being alive
      if cnt%100 == 0:
        sys.stdout.write('.')
        sys.stdout.flush()
      if cnt%1000 == 0:
        show("-- %d" % (cnt))

      # get one koulutus. skip koodisto meta etc
      url = "/tarjonta-service/rest/v1/koulutus/%s?meta=false&img=false"%(ii["oid"])
      try:
        httpconn.request('GET', url, headers=reqheaders)
        r = httpconn.getresponse()
        j = json.loads(r.read())
      except ValueError, e:
        show("-- %d -- could not load %s"%(cnt,ii["oid"]))
      else:
        # some results may give KeyError
        try:
          i = j["result"]
        except KeyError, details:
          show("-- %d -- could not load result for %s"%(cnt,ii["oid"]))
        row = makerow()

        for col in row:
          if col == "nimi":
            row["nimi"] = getnimi(i,"fi")
            row["nimi_sv"] = getnimi(i,"sv")
            row["nimi_en"] = getnimi(i,"en")
          elif "_uri" in col:
            (colkey,coluri) = col.split("_")
            if colkey in i:
              if coluri in i[colkey]:
                row[col] = i[colkey][coluri]
          elif "_arvo" in col:
            (colkey,colarvo) = col.split("_")
            if colkey in i:
              if colarvo in i[colkey]:
                row[col] = i[colkey][colarvo]
          #elif col == "koulutuskoodi_arvo":
           # (colkey,colarvo) = col.split("_")
           # if colkey in i:
           #   if colarvo in i[colkey]:
           #     row[col] = i[colkey][colarvo]
          elif col == "koulutuskoodi_nimi":
            (colkey,colnimi) = col.split("_")
            if colkey in i:
              if colnimi in i[colkey]:
                row[col] = i[colkey][colnimi]
          else:
            row[col] = None if col not in i else i[col]
            if type(row[col]) is list:
              row[col] = ''.join(map(str,json.dumps(row[col])))

        # add organization oid stored from search results above
        row["organisaatio_oid"] = iii["oid"]

        if verbose: show("%d -- %s"%(cnt,row["oid"]))
        if debug: print row
        dboperator.insert(hostname+url,schema,table,row,debug)

  if verbose: show("ready")

def usage():
  print """
usage: koulutustarjonta_koulutus.py [-H|--hostname <hostname>] [-u|--url <url>] [-e|--schema <schema>] [-t|--table <table>] [-v|--verbose] [-d|--debug]

hostname defaults to "testi.virkailija.opintopolku.fi"
url defaults to "/tarjonta-service/rest/v1/koulutus/search"
schema defaults to $SCHEMA then to "sa"
table defaults to $TABLE then to "koulutustarjonta_koulutus"
"""

def main(argv):
  # variables from arguments with possible defaults
  hostname = os.getenv("OPINTOPOLKU") or "virkailija.testiopintopolku.fi"
  url = "/tarjonta-service/rest/v1/koulutus/search"
  schema = os.getenv("SCHEMA") or "sa"
  table = os.getenv("TABLE") or "koulutustarjonta_koulutus"
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
