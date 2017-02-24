#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
dbcommand

Send and execute a command in database.

Depends on dboperator which takes care of connection and other db stuff.
"""
import sys,getopt
from time import localtime, strftime

import dboperator

def show(message):
  print strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message

def load(command,verbose=False):
  show("begin with "+command)

  sql = command
  try:
    print dboperator.get(sql)
  except:
    show("Something went wrong. Probably procedure wasn't found or there is a permission problem. Over and out.")
    dboperator.close()
    exit(2) # lopeta virheeseen

  dboperator.close()

  show("ready")

def usage():
  print """
usage: dbcommand.py -c|--command <command> [-v|--verbose]

command is mandatory argument. The SQL to execute.
"""

def main(argv):
  # variables that are given as arguments with possible default values
  command = ""
  verbose = False

  try:
    opts, args = getopt.getopt(argv,"c:v",["command=","verbose"])
  except getopt.GetoptError as err:
    print(err)
    usage()
    sys.exit(2)
  for opt, arg in opts:
    if opt in ("-c", "--command"): command = arg
    elif opt in ("-v", "--verbose"): verbose = True
  if not command:
    usage()
    sys.exit(2)

  load(command,verbose)

if __name__ == "__main__":
  main(sys.argv[1:])
