#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
tkjulkaisut

todo doc
"""
import sys,os,getopt
import httplib,ssl,base64
import json
from time import localtime, strftime

#import dboperator
import pymssql

# Uses env vars for the connection.
# If not set, kill the process!
dbhost = os.getenv("DATABASE_HOST")
dbname = os.getenv("DATABASE_NAME")
dbuser = os.getenv("DATABASE_USER")
dbpass = os.getenv("DATABASE_PASS")
if not dbhost or not dbname or not dbuser or not dbpass:
  print "Missing database settings. Exiting."
  sys.exit(2)

# global vars; information maintains between calls
conn = pymssql.connect(dbhost, dbuser, dbpass, dbname)
cur = conn.cursor(as_dict=True)

def show(message):
  print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message).encode('utf-8')

# hae avaimen arvo json:sta
def jv(jsondata, key):
  if key in jsondata:
    return jsondata[key]
  return None

def load(hostname,url,schema,table,verbose):
  show("begin "+hostname+" "+url+" "+schema+" "+table)
  address=hostname+url

  show("load securely from "+address)
  httpconn=httplib.HTTPSConnection(hostname, context=ssl._create_unverified_context())

  httpconn.request('GET', url)

  r = httpconn.getresponse()
  j = json.loads(r.read())

  show("api returned %d objects"%(len(j)))

  show("empty %s.%s"%(schema,table))
  #dboperator.empty(schema,table)
  cur.execute("TRUNCATE TABLE %s.%s"%(schema,table))
  conn.commit()

  show("insert data")
  cnt=0
  for row in j:
    cnt+=1
    if verbose: show("%d -- %s"%(cnt,row))
    else:
      # show some sign of being alive
      if cnt%100 == 0:
        sys.stdout.write('.')
        sys.stdout.flush()
      if cnt%1000 == 0:
        show("-- %d" % (cnt))

    # sarakkeet
    organisaatioTunnus = jv(row, "organisaatioTunnus")
    ilmoitusVuosi = jv(row, "ilmoitusVuosi")
    julkaisunTunnus = jv(row, "julkaisunTunnus")
    julkaisunTilakoodi = jv(row, "julkaisunTilakoodi")
    julkaisunOrgTunnus = jv(row, "julkaisunOrgTunnus")
    julkaisuVuosi = jv(row, "julkaisuVuosi")
    julkaisunNimi = jv(row, "julkaisunNimi")
    tekijatiedotTeksti = jv(row, "tekijatiedotTeksti")
    tekijoidenLkm = jv(row, "tekijoidenLkm")
    sivunumeroTeksti = jv(row, "sivunumeroTeksti")
    artikkelinumero = jv(row, "artikkelinumero")
    isbn = jv(row, "isbn")
    jufoTunnus = jv(row, "jufoTunnus")
    jufoLuokkaKoodi = jv(row, "jufoLuokkaKoodi")
    julkaisumaaKoodi = jv(row, "julkaisumaaKoodi")
    lehdenNimi = jv(row, "lehdenNimi")
    issn = jv(row, "issn")
    volyymiTeksti = jv(row, "volyymiTeksti")
    lehdenNumeroTeksti = jv(row, "lehdenNumeroTeksti")
    konferenssinNimi = jv(row, "konferenssinNimi")
    kustantajanNimi = jv(row, "kustantajanNimi")
    kustannuspaikkaTeksti = jv(row, "kustannuspaikkaTeksti")
    emojulkaisunNimi = jv(row, "emojulkaisunNimi")
    emojulkaisunToimittajatTeksti = jv(row, "emojulkaisunToimittajatTeksti")
    julkaisutyyppiKoodi = jv(row, "julkaisutyyppiKoodi")
    yhteisjulkaisuKVKytkin = jv(row, "yhteisjulkaisuKVKytkin")
    yhteisjulkaisuSHPKytkin = jv(row, "yhteisjulkaisuSHPKytkin")
    yhteisjulkaisuTutkimuslaitosKytkin = jv(row, "yhteisjulkaisuTutkimuslaitosKytkin")
    yhteisjulkaisuMuuKytkin = jv(row, "yhteisjulkaisuMuuKytkin")
    julkaisunKansainvalisyysKytkin = jv(row, "julkaisunKansainvalisyysKytkin")
    julkaisunKieliKoodi = jv(row, "julkaisunKieliKoodi")
    avoinSaatavuusKoodi = jv(row, "avoinSaatavuusKoodi")
    evoJulkaisunKytkin = jv(row, "evoJulkaisunKytkin")
    doi = jv(row, "doi")
    pysyvaOsoiteTeksti = jv(row, "pysyvaOsoiteTeksti")
    lahdetietokannanTunnus = jv(row, "lahdetietokannanTunnus")
    latausId = jv(row, "latausId")
    yhteisjulkaisuId = jv(row, "yhteisjulkaisuId")
    rinnakkaistallennusKytkin = jv(row, "rinnakkaistallennusKytkin")
    yhteisjulkaisunTunnus = jv(row, "yhteisjulkaisunTunnus")
    juuliOsoiteTeksti = jv(row, "juuliOsoiteTeksti")
    yhteisjulkaisuYritysKytkin = jv(row, "yhteisjulkaisuYritysKytkin")
    jufoId = jv(row, "jufoId")
    orgSektori = jv(row, "orgSektori")

    hankeTKs = jv(row, "hankeTKs")
    hankeTKstr = None
    if type(hankeTKs) is list and len(hankeTKs)>0:
      hankeTKstr = ','.join(str(d) for d in hankeTKs)

    avainsanaTKs = jv(row, "avainsanaTKs")
    avainsanaTKstr = None
    if type(avainsanaTKs) is list and len(avainsanaTKs)>0:
      avainsanaTKstr = ','.join(str(d) for d in avainsanaTKs)

    isbnTKs = jv(row, "isbnTKs")
    isbnTKstr = None
    if type(isbnTKs) is list and len(isbnTKs)>0:
      if "isbn" in isbnTKs[0]:
        isbnTKstr = isbnTKs[0]["isbn"]

    issnTKs = jv(row, "issnTKs")
    issnTKstr = None
    if type(issnTKs) is list and len(issnTKs)>0:
      if "issn" in issnTKs[0]:
        issnTKstr = issnTKs[0]["issn"]

    koulutusalaTKs = jv(row, "koulutusalaTKs")
    koulutusalaTKstr = None
    if type(koulutusalaTKs) is list and len(koulutusalaTKs)>0:
      for d in koulutusalaTKs:
        if "jNro" in d and d["jNro"]==1 and "koulutusala" in d:
          koulutusalaTKstr = d["koulutusala"]

    orgYksikkoTKs = jv(row, "orgYksikkoTKs")
    orgYksikkoTKstr = None
    if type(orgYksikkoTKs) is list and len(orgYksikkoTKs)>0:
      if "julkaisuYksikko" in orgYksikkoTKs[0]:
        orgYksikkoTKstr = orgYksikkoTKs[0]["julkaisuYksikko"]

    tekijaTKs = jv(row, "tekijaTKs")
    tekijaTKstr = ""
    if type(tekijaTKs) is list and len(tekijaTKs)>0:
      di=0
      for d in tekijaTKs:
        di=di+1
        if di>1:
          tekijaTKstr = tekijaTKstr+"; "
        if "sukunimi" in d:
          tekijaTKstr = tekijaTKstr+d["sukunimi"].strip()
        if "etunimet" in d:
          tekijaTKstr = tekijaTKstr+", "+d["etunimet"].strip()

    tieteenalaTKs = jv(row, "tieteenalaTKs")
    tieteenalaTKstr = None
    if type(tieteenalaTKs) is list and len(tieteenalaTKs)>0:
      for d in tieteenalaTKs:
        if "jNro" in d and d["jNro"]==1 and "tieteenala" in d:
          tieteenalaTKstr = d["tieteenala"]

    kasvatusalat_1 = jv(row, "kasvatusalat_1")
    taiteet_ja_kulttuurialat_2 = jv(row, "taiteet_ja_kulttuurialat_2")
    humanistiset_alat_3 = jv(row, "humanistiset_alat_3")
    yhteiskunnalliset_alat_4 = jv(row, "yhteiskunnalliset_alat_4")
    kauppa_hallinto_ja_oikeustieteet_5 = jv(row, "kauppa_hallinto_ja_oikeustieteet_5")
    luonnontieteet_6 = jv(row, "luonnontieteet_6")
    tietojenkasittely_ja_tietoliikenne_7 = jv(row, "tietojenkasittely_ja_tietoliikenne_7")
    tekniikan_alat_8 = jv(row, "tekniikan_alat_8")
    maa_ja_metsatalousalat_9 = jv(row, "maa_ja_metsatalousalat_9")
    laaketieteet_10 = jv(row, "laaketieteet_10")
    terveys_ja_hyvinvointialat_11 = jv(row, "terveys_ja_hyvinvointialat_11")
    palvelualat_12 = jv(row, "palvelualat_12")

    # find out which columns to use on insert
    ##dboperator.resetcolumns(row)
    ##
    ##for col in row:
    ##  if type(row[col]) is list:
    ##    row[col] = ','.join(str(d) for d in row[col])
    ##dboperator.insert(address,schema,table,row)
    #dboperator.execute("""
    cur.execute("""
    INSERT INTO %s.%s
    (
     organisaatioTunnus, ilmoitusVuosi, julkaisunTunnus, julkaisunTilakoodi, julkaisunOrgTunnus, julkaisuVuosi,
     julkaisunNimi, tekijatiedotTeksti, tekijoidenLkm, sivunumeroTeksti, artikkelinumero, isbn, jufoTunnus,
     jufoLuokkaKoodi, julkaisumaaKoodi, lehdenNimi, issn, volyymiTeksti, lehdenNumeroTeksti, konferenssinNimi,
     kustantajanNimi, kustannuspaikkaTeksti, emojulkaisunNimi, emojulkaisunToimittajatTeksti, julkaisutyyppiKoodi,
     yhteisjulkaisuKVKytkin, yhteisjulkaisuSHPKytkin, yhteisjulkaisuTutkimuslaitosKytkin, yhteisjulkaisuMuuKytkin,
     julkaisunKansainvalisyysKytkin, julkaisunKieliKoodi, avoinSaatavuusKoodi, evoJulkaisunKytkin, doi,
     pysyvaOsoiteTeksti, lahdetietokannanTunnus, latausId, yhteisjulkaisuId, rinnakkaistallennusKytkin,
     yhteisjulkaisunTunnus, juuliOsoiteTeksti, yhteisjulkaisuYritysKytkin, jufoId, orgSektori,
     hankeTKs, avainsanaTKs, isbnTKs, issnTKs, koulutusalaTKs, orgYksikkoTKs, tekijaTKs, tieteenalaTKs,
     kasvatusalat_1, taiteet_ja_kulttuurialat_2, humanistiset_alat_3, yhteiskunnalliset_alat_4,
     kauppa_hallinto_ja_oikeustieteet_5, luonnontieteet_6, tietojenkasittely_ja_tietoliikenne_7,
     tekniikan_alat_8, maa_ja_metsatalousalat_9, laaketieteet_10, terveys_ja_hyvinvointialat_11,
     palvelualat_12
     ,source
    )
    """%(schema,table)+"""
    VALUES (
     %s,%s,%s,%s,%s,%s,
     %s,%s,%s,%s,%s,%s,%s,
     %s,%s,%s,%s,%s,%s,%s,
     %s,%s,%s,%s,%s,
     %s,%s,%s,%s,
     %s,%s,%s,%s,%s,
     %s,%s,%s,%s,%s,
     %s,%s,%s,%s,%s,
     %s,%s,%s,%s,%s,%s,%s,%s,
     %s,%s,%s,%s,
     %s,%s,%s,
     %s,%s,%s,%s,
     %s
     ,%s
    )
    """, (
     organisaatioTunnus, ilmoitusVuosi, julkaisunTunnus, julkaisunTilakoodi, julkaisunOrgTunnus, julkaisuVuosi,
     julkaisunNimi, tekijatiedotTeksti, tekijoidenLkm, sivunumeroTeksti, artikkelinumero, isbn, jufoTunnus,
     jufoLuokkaKoodi, julkaisumaaKoodi, lehdenNimi, issn, volyymiTeksti, lehdenNumeroTeksti, konferenssinNimi,
     kustantajanNimi, kustannuspaikkaTeksti, emojulkaisunNimi, emojulkaisunToimittajatTeksti, julkaisutyyppiKoodi,
     yhteisjulkaisuKVKytkin, yhteisjulkaisuSHPKytkin, yhteisjulkaisuTutkimuslaitosKytkin, yhteisjulkaisuMuuKytkin,
     julkaisunKansainvalisyysKytkin, julkaisunKieliKoodi, avoinSaatavuusKoodi, evoJulkaisunKytkin, doi,
     pysyvaOsoiteTeksti, lahdetietokannanTunnus, latausId, yhteisjulkaisuId, rinnakkaistallennusKytkin,
     yhteisjulkaisunTunnus, juuliOsoiteTeksti, yhteisjulkaisuYritysKytkin, jufoId, orgSektori,
     hankeTKstr, avainsanaTKstr, isbnTKstr, issnTKstr, koulutusalaTKstr, orgYksikkoTKstr, tekijaTKstr, tieteenalaTKstr,
     kasvatusalat_1, taiteet_ja_kulttuurialat_2, humanistiset_alat_3, yhteiskunnalliset_alat_4,
     kauppa_hallinto_ja_oikeustieteet_5, luonnontieteet_6, tietojenkasittely_ja_tietoliikenne_7,
     tekniikan_alat_8, maa_ja_metsatalousalat_9, laaketieteet_10, terveys_ja_hyvinvointialat_11,
     palvelualat_12
     ,address
    ))
    conn.commit()

  show("wrote %d"%(cnt))
  #dboperator.close()
  cur.close()
  conn.close()

  show("ready")

def usage():
  print """
usage: tkjulkaisut.py -H|--hostname <hostname> -u|--url <url> -e|--schema <schema> -t|--table <table> [-v|--verbose]
"""

def main(argv):
  # muuttujat jotka kerrotaan argumentein
  hostname,url,schema,table="","","",""
  verbose=False

  try:
    opts,args=getopt.getopt(argv,"H:u:e:t:v",["hostname=","url=","schema=","table=","verbose"])
  except getopt.GetoptError as err:
    print(err)
    usage()
    sys.exit(2)
  for opt,arg in opts:
    if opt in ("-H", "--hostname"): hostname=arg
    elif opt in ("-u", "--url"): url=arg
    elif opt in ("-e", "--schema"): schema=arg
    elif opt in ("-t", "--table"): table=arg
    elif opt in ("-v", "--verbose"): verbose=True
  if not hostname or not url or not schema or not table:
    usage()
    sys.exit(2)

  load(hostname,url,schema,table,verbose)

if __name__ == "__main__":
    main(sys.argv[1:])
