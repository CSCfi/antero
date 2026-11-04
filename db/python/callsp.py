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

def load(database,schema,procedure,parameters,verbose=False,autocommit=False):
  show("begin with "+database+" "+schema+" "+procedure+" "+parameters+(" (autocommit)" if autocommit else ""))
  sql = "execute "+database+"."+schema+"."+procedure
  if (parameters != ""):
   sql = "execute "+database+"."+schema+"."+procedure+" "+parameters
   
  result = dboperator.execute(sql, autocommit=autocommit)
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
usage: callsp.py [-e|--schema <schema>] -p|--procedure <procedure> [-s|--parameters <params>] [-a|--autocommit] [-v|--verbose]

schema defaults to $SCHEMA then to "" (for database default if set)
procedure is mandatory argument. Name of the procedure to execute.
autocommit is optional. Use it for procedures that manage their own
transactions (BEGIN TRAN/COMMIT, sp_getapplock). Default is off.                                                                                                                                 
""")

def main(argv):
  # variables that are given as arguments with possible default values
  database = os.getenv("DATABASE_NAME")
  schema = os.getenv("SCHEMA") or ""
  procedure = ""
  parameters = ""
  verbose = False
  autocommit = False            

  try:
    opts, args = getopt.getopt(argv,"d:e:p:s:va",["database=","schema=","procedure=","parameters=","verbose","autocommit"])
  except getopt.GetoptError as err:
    print(err)
    usage()
    sys.exit(2)
  for opt, arg in opts:
    if opt in ("-d", "--database"): database = arg
    elif opt in ("-e", "--schema"): schema = arg
    elif opt in ("-p", "--procedure"): procedure = arg
    elif opt in ("-s", "--parameters"): parameters = arg
    elif opt in ("-v", "--verbose"): verbose = True
    elif opt in ("-a", "--autocommit"): autocommit = True                                                     
  if not schema or not procedure:
    usage()
    sys.exit(2)

  load(database,schema,procedure,parameters,verbose,autocommit)

if __name__ == "__main__":
  main(sys.argv[1:])
