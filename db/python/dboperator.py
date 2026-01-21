#!/usr/bin/python3
# -*- coding: utf-8 -*-
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
#import mssql #pitää ensin asentaa

# Uses env vars for the connection.
# If not set, kill the process!
dbhost = os.getenv("DATABASE_HOST")
dbname = os.getenv("DATABASE_NAME")
dbuser = os.getenv("DATABASE_USER")
dbpass = os.getenv("DATABASE_PASS")
if not dbhost or not dbname or not dbuser or not dbpass:
  print("Missing database settings. Exiting.")
  sys.exit(2)

# global vars; information maintains between calls
conn = pymssql.connect(dbhost, dbuser, dbpass, dbname)
#conn = mssql.connect(dbhost, dbuser, dbpass, dbname)
cur = conn.cursor(as_dict=True)

columnlist = []
columntypes = dict()

count = -1

# best practices columns
columnlistignore = ["id","loadtime","source","username"]

# columns - figure out columns and their data types
# - populate columnlist with unique values
#   takes columnlistignore into account
# - populate columntypes with unique values
#
# NB! From one row at a time!
#  If api leaves null values entirely out from response
#  (for ex. virta-jtp julkaisut), this function should be
#  called N times so that all column names appear where N is
#  at least 1 but is your own choice.
#  Sometimes even all rows might be worth looping through.
#  The idea is that before create and insert calls the whole dataset
#  could be looped through so that all possible columns are known
#  and only after that create the table and insert the data...
def columns(row,debug=False):
  global columnlist, columntypes, columnlistignore
  for col in row:
    key = str(col)
    # if column name from source collides with "reserved" names prefixit with "_source_"
    if key in columnlistignore:
      key = '_source_'+key
    if type(row[col]) is int:
      if row[col] > 2**31:
        columntypes[key] = 'bigint'
      else:
        columntypes[key] = 'int'
    elif type(row[col]) is bool:
      columntypes[key] = 'bit'
    elif type(row[col]) is float:
      columntypes[key] = 'float'
    elif type(row[col]) is str:
      # attempt to solve max length of string
      lenkey = "len"+key
      strlen = len(row[col]) if len(row[col])>2 else 2 # minimum of 2 chars
      # initial or bigger
      if lenkey not in columntypes or strlen > columntypes[lenkey]:
        columntypes[lenkey] = strlen
        columntypes[key] = "varchar("+str(strlen)+")"
        if debug: print("dboperator.columns: key:%s, type:%s, columntype:%s, strlen:%s" % (key,type(row[col]),columntypes[key],columntypes[lenkey]))
    # ignore dict type altogether (for now)
    if type(row[col]) is not dict:
      # default to string type. NoneType goes here also
      if key not in columntypes:
        columntypes[key] = 'varchar(max)'
      if debug: print("dboperator.columns: key:%s, type:%s, columntype:%s, (col:%s)" % (key,type(row[col]),columntypes[key],col))
      if key not in columnlist:
        columnlist.append(key)
  for ignr in columnlistignore:
    if ignr in columnlist:
      columnlist.remove(ignr)
  if debug: print("dboperator.columns: columnlist="+(",".join(columnlist)))

def resetcolumns(row,debug=False):
  global columnlist, columntypes
  columnlist = []
  columntypes = dict()
  columns(row,debug)

# create - create table if not exists and empty it
# nb! columns and their types must be known before (see columns)
def create(schema,table,debug=False):
  global conn, cur, columntypes, columnlist
  sqlcreate_beg = """
  IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA='"""+schema+"""' AND TABLE_NAME='"""+table+"""'
  )
  BEGIN
    CREATE TABLE """+schema+"""."""+table+"""(
      id bigint IDENTITY(1,1) NOT NULL,
      loadtime datetime NOT NULL,
      source nvarchar(100) NULL,
      username nvarchar(128) NOT NULL,
  """
  sqlcreate_mid = ""
  sqlcreate_end = """
      CONSTRAINT PK__"""+table+""" PRIMARY KEY CLUSTERED (id)
    );
    ALTER TABLE """+schema+"""."""+table+""" ADD CONSTRAINT DF__"""+table+"""__loadtime  DEFAULT (getdate()) FOR loadtime;
    ALTER TABLE """+schema+"""."""+table+""" ADD CONSTRAINT DF__"""+table+"""__username  DEFAULT (suser_name()) FOR username;
  END
  """
  for col in columnlist:
    sqlcreate_mid += "%s %s NULL,"%(col,columntypes[col])
  # create/execute
  cur.execute(sqlcreate_beg+sqlcreate_mid+sqlcreate_end)
  conn.commit()
  # empty
  empty(schema,table,debug)
  if debug: print("dboperator.create: columnlist="+(",".join(columnlist)))

# drop - drop a table
# todo: drop other objects as well...
def drop(schema,table,debug=False):
  global conn, cur
  if debug: print("dboperator.drop: "+schema+"."+table)
  sql = """
  IF EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA='"""+schema+"""' AND TABLE_NAME='"""+table+"""'
  )
  BEGIN
    DROP TABLE """+schema+"""."""+table+"""
  END
  """
  # remove/drop/execute
  cur.execute(sql)
  conn.commit()

# empty - with truncate
def empty(schema,table,debug=False):
  global conn, cur, count
  if debug: print("dboperator.empty: %s.%s"%(schema,table))
  cur.execute("TRUNCATE TABLE %s.%s"%(schema,table))
  count = cur.rowcount
  conn.commit()

# remove - delete with condition (column==value)
def remove(schema,table,column,value,debug=False):
  global conn, cur, count
  if debug: print("dboperator.remove: schema=%s table=%s column=%s value=%s"%(schema,table,column,value))
  cur.execute("DELETE FROM %s.%s WHERE %s='%s'"%(schema,table,column,value))
  count = cur.rowcount
  conn.commit()

# insert - one row at a time
# nb! columns must be known already (see columns)
def insert(source,schema,table,row,debug=False):  # insert single row
  global conn, cur, count, columnlist
  if debug: print("dboperator.insert: columnlist="+(",".join(columnlist)))
  columnstr = ",".join(columnlist)
  placeholders = ','.join(['%s' for s in columnlist])

  statement = "INSERT INTO %s.%s (%s,source) VALUES (%s,'%s');"%(schema,table,columnstr,placeholders,source)
  cur.execute(statement,tuple([row[c.replace('_source_','')] for c in columnlist]))
  count = cur.rowcount
  conn.commit()

# insert - many rows at a time @hpetrell
def insertMany(source, schema, table, rows, debug=False): #insert array
  global conn, cur, count, columnlist
  if debug: print("dboperator.insert: columnlist="+(",".join(columnlist)))
  columnstr = ",".join(columnlist)
  placeholders = ','.join(['%s' for s in columnlist])
  tmpdata = []
  statement = "INSERT INTO %s.%s (%s,source) VALUES (%s,'%s');"%(schema,table,columnstr,placeholders,source)
  for row in rows:
       tmpdata.append(tuple([row[c.replace('_source_','')] for c in columnlist]))

  cur.executemany(statement, tmpdata)
  count = cur.rowcount
  conn.commit()

# for procedure calls and ready made statements
def execute(sql, debug=False):
    global conn, cur, count
    if debug:
        print("dboperator.execute: sql=" + sql)

    try:
        cur.execute(sql)
        count = cur.rowcount
        conn.commit()
        return 1

    # --- VANHA  ---
    #except pymssql.Error as sqlerror:
    #    return str(sqlerror)

    # --- UUSI ---
    except Exception as e:
         return str(e)
# get results of a query as an array of dicts
def get(sql,debug=False):
  global conn, cur, count
  if debug: print("dboperator.get: sql="+sql)
  cur.execute(sql)
  count = cur.rowcount
  result = cur.fetchall()
  return result

def close(debug=False):
  global conn, cur
  if debug: print("dboperator.close: closing")
  cur.close()
  conn.close()
