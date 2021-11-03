#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
callsp

Call a stored procedure in database.

Depends on dboperator which takes care of connection and other db stuff.
"""
import sys,os,getopt
from time import localtime, strftime

import dboperator

def show(message):
  print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message)

def load(database,schema,procedure,parvals,verbose=False):
  show("begin with "+database+" "+schema+" "+procedure+" "+parvals)
  sql = "execute "+database+"."+schema+"."+procedure
  if (parvals != "")
   sql = "execute "+database+"."+schema+"."+procedure+"("+parvals+")"
   
  result = dboperator.execute(sql)
  #succesful execution result returns 1, anything else is error message
  if (result != 1):
   show("A MSSQL error has been caught during executing " + procedure)
   show("Error code: " + result)
   dboperator.close()
   exit(2) # lopeta virheeseen

  dboperator.close()
  show("ready")

def usage():
  print("""
usage: callsp.py [-e|--schema <schema>] -p|--procedure <procedure> [-v|--verbose]

schema defaults to $SCHEMA then to "" (for database default if set)
procedure is mandatory argument. Name of the procedure to execute.
""")

def main(argv):
  # variables that are given as arguments with possible default values
  database = os.getenv("DATABASE_NAME")
  schema = os.getenv("SCHEMA") or ""
  procedure = ""
  parvals = ""
  verbose = False

  try:
    opts, args = getopt.getopt(argv,"d:e:p:v",["database=","schema=","procedure=","verbose"])
  except getopt.GetoptError as err:
    print(err)
    usage()
    sys.exit(2)
  for opt, arg in opts:
    if opt in ("-d", "--database"): database = arg
    elif opt in ("-e", "--schema"): schema = arg
    elif opt in ("-p", "--procedure"): procedure = arg
    elif opt in ("-v", "--verbose"): verbose = True
  if not schema or not procedure:
    usage()
    sys.exit(2)

  load(database,schema,procedure,parvals,verbose)

if __name__ == "__main__":
  main(sys.argv[1:])
