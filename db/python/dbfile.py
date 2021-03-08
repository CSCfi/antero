#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
dbfile

From a file given as argument executes SQL file contents to database
which is pointed out via environment variables.

This script depends on script dboperator.
"""
import sys,getopt,os
import pymssql
from time import localtime, strftime
import glob # tiedostojen listaamiseen, kelpaa myös ns wildcardsit
import re
import codecs

import dboperator

def show(message):
  print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message)

def loadsql(sqlfile,verbose=False):
  fd = open(sqlfile, 'r')
  allsql = fd.read()
  # remove UTF-8 BOM characters if they exist
  allsql = allsql[3:] if allsql.startswith(codecs.BOM_UTF8) else allsql
  fd.close()
  # split MS SQL batches
  for sql in re.split('\ngo.*\n', allsql, flags=re.IGNORECASE):
    if verbose: show(sql)
        r2 = dboperator.execute(sql)
        if (r2!=1):
            show(r2)
            exit(2)

def load(sqlfile,migrate,verbose=False):
  show("begin "+sqlfile)

  number_togo = None
  if "__" in sqlfile:
    number_togo = int(sqlfile[sqlfile.rfind("/")+1:sqlfile.index("__",sqlfile.rfind("/")+1)])

  if migrate and number_togo is not None:
    # migration install step 0 is special, just add the table for others
    if number_togo==0:
      loadsql(sqlfile,verbose)
    else:
      number_last = None
      result = dboperator.get("select max(number) as number from dbo.migration where phase='%s'"%(migrate))
      if result[0]["number"] is not None:
        number_last = int(result[0]["number"])

      if verbose: show("migrating %s which is going on at %s and now trying %s"%(migrate,number_last,number_togo))

      if number_last is None or number_togo > number_last:
        show("Migrating from %s to %s"%(number_last,number_togo))
        loadsql(sqlfile,verbose)
        result = dboperator.execute("insert into migration (phase,number) values ('%s',%s)"%(migrate,number_togo))
        if (result!=1):
            show(result)
            exit(2)
      else:
        if verbose: show("skipping migration %s < %s"%(number_togo,number_last))

  else:
    loadsql(sqlfile,verbose)

  dboperator.close()
  show("ready")

def usage():
  print("""
usage: dbfile.py -f|--file <file> [-m|--migrate <phase>] [-v|--verbose]
""")

def main(argv):
  # muuttujat jotka kerrotaan argumentein
  sqlfile = ""
  migrate = ""
  verbose = False

  try:
    opts, args = getopt.getopt(argv,"f:m:v",["file=","migrate=","verbose"])
  except getopt.GetoptError as err:
    print(err)
    usage()
    sys.exit(2)
  for opt, arg in opts:
    if opt in ("-f", "--file"): sqlfile = arg
    elif opt in ("-m", "--migrate"): migrate = arg
    elif opt in ("-v", "--verbose"): verbose = True
  if not sqlfile:
    usage()
    sys.exit(2)

  load(sqlfile,migrate,verbose)

if __name__ == "__main__":
  main(sys.argv[1:])
