#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
dboperator

Makes connection to MS SQL Server database at init and offers basic
SQL operations.
Holds the number of affrected rows within (count).

Offers also a function to close the connection which is good to
remember to call at the end.
"""
import sys,os
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

columnlist = []

count = -1

# best practices columns
columnlistignore = ["id","loadtime","source","username"]

# columns
# - populate columnlist with unique values
#   takes columnlistignore into account
def columns(row,debug=False):
  global columnlist, columnlistignore
  for col in row:
    if col not in columnlist:
      columnlist.append(col)
  for ignr in columnlistignore:
    if ignr in columnlist:
      columnlist.remove(ignr)
  if debug: print "dboperator.columns: columnlist="+(",".join(columnlist))

def resetcolumns(row,debug=False):
  global columnlist
  columnlist = []
  columns(row,debug)

# empty - with truncate
def empty(table,debug=False):
  global conn, cur, count
  if debug: print "dboperator.empty: %s"%(table)
  cur.execute("TRUNCATE TABLE [%s]"%(table))
  count = cur.rowcount
  conn.commit()

# remove - delete with condition (column==value)
# this function is not used!?
def remove(table,column,value,debug=False):
  global conn, cur, count
  if debug: print "dboperator.remove: table=%s column=%s value=%s"%(table,column,value)
  cur.execute("DELETE FROM [%s] WHERE %s='%s'"%(table,column,value))
  count = cur.rowcount
  conn.commit()

# insert - one row at a time
# nb! columns must be known already (see columns)
def insert(source,table,row,debug=False):
  global conn, cur, count, columnlist
  if debug: print "dboperator.insert: columnlist="+(",".join(columnlist))
  columnstr = ",".join(columnlist)
  placeholders = ','.join(['%s' for s in columnlist])

  statement = "INSERT INTO [%s] (%s,source) VALUES (%s,'%s');" % (table,columnstr,placeholders,source)
  cur.execute(statement,tuple([row[c] for c in columnlist]))
  count = cur.rowcount
  conn.commit()

def execute(sql,debug=False):
  global conn, cur, count, columnlist
  if debug: print "dboperator.execute: sql="+sql
  cur.execute(sql)
  count = cur.rowcount
  conn.commit()

def get(sql,debug=False):
  global conn, cur, count, columnlist
  if debug: print "dboperator.get: sql="+sql
  cur.execute(sql)
  count = cur.rowcount
  result = cur.fetchall()
  return result

def close(debug=False):
  global conn, cur
  if debug: print "dboperator.close: closing"
  cur.close()
  conn.close()
