#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
dbcommand

Send and execute a command in database. Optionally get a result back. See usage.

NB! Depends on dboperator which takes care of connection and other db stuff.
"""
import sys,getopt
from time import localtime, strftime

import dboperator

def show(message):
  print strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message

def load(command,expect,verbose=False):
  if verbose: show("begin with "+command) # no point in trying to show expect!

  sql = command
  ret = None
  try:
    # quick hack for getting return value. do fix me!
    if expect:
      resql = dboperator.get(sql)
      if verbose: show("command returned %d rows"%(len(resql)))
      # print out (as a return value) the entire result or row count or what, some kind of figuring?
      if expect=='row count':
        ret = len(resql)
      elif len(resql)==1 and expect in resql[0]:
        ret = resql[0][expect]
      else:
        ret = resql
    else:
      dboperator.execute(sql)
  except:
    show("Something went wrong. Over and out.")
    dboperator.close()
    exit(2) # lopeta virheeseen

  if verbose: show("ready")
  return ret
  
def usage():
  print """
usage: dbcommand.py -c|--command <string> [-e|--expect <string>] [-v|--verbose]

command is mandatory argument. The SQL to execute.
expect  is for getting results from a query.
        For ease of use one can tell from one row return query the column which value is expected.
        Special case is "row count" which will just return the number of rows query returns.
        Somewhat default behaviour is to return the whole result set as an array of dicts.
        You can achieve default behaviour by giving a value to this argument that is not part
        of column names in result, for ex. "*", and/or results give exactly NOT one row.
"""

def main(argv):
  # variables that are given as arguments with possible default values
  command = ""
  expect = ""
  verbose = False

  try:
    opts, args = getopt.getopt(argv,"c:e:v",["command=","expect=","verbose"])
  except getopt.GetoptError as err:
    print(err)
    usage()
    sys.exit(2)
  for opt, arg in opts:
    if opt in ("-c", "--command"): command = arg
    elif opt in ("-e", "--expect"): expect = arg
    elif opt in ("-v", "--verbose"): verbose = True
  if not command:
    usage()
    sys.exit(2)

  if expect:
    verbose = False # would interfere with "return" value
  ret = load(command,expect,verbose)
  if expect:
    return ret

  dboperator.close()

if __name__ == "__main__":
  main(sys.argv[1:])
