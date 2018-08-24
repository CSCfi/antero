from __future__ import print_function

import base64
import httplib
import json
import os
import sys
import timeit
from argparse import ArgumentParser
from contextlib import closing

import debug_dboperator


class Client:
    def __init__(self, host="localhost", path="/vipunendata", port=None, ssl=None, verbose=0,
                 schema='sa', table='sa_odw_hakeneet_debug', hakuOid="", updatedAfter="", initCounter = 0):
        self.host = host
        self.path = path
        self.port = port
        self.source = host + (":" + str(port) if port else "") + path
        self.ssl = ssl
        self.verbose = verbose > 0
        self.schema = schema
        self.table = table
        self.password = os.getenv("API_PASSWORD", "")
        self.hakuOid = hakuOid
        self.updatedAfter = updatedAfter
        self.initCounter = initCounter

    def load(self):
        http_connection = httplib.HTTPSConnection(self.host, port=self.port) if self.ssl else httplib.HTTPConnection(
            host=self.host, port=self.port)
        http_connection.set_debuglevel(self.verbose)
        print("oid:" + self.hakuOid + " updatedAfter: " + self.updatedAfter)
        path2 = self.path
        if(self.hakuOid != '' and self.updatedAfter == ''):
            path2 += "?hakuOid=" + self.hakuOid
            
        elif(self.hakuOid == '' and self.updatedAfter != ''):
            path2 += "?updatedAfter=" + self.updatedAfter
            
        elif(self.hakuOid != '' and self.updatedAfter != ''):
            path2 += "?hakuOid=" + self.hakuOid + "&updatedAfter=" + self.updatedAfter
        with closing(http_connection) as conn:
            headers = {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization": "Basic %s" % base64.b64encode("%s:%s" % ("antero", self.password))
            }
#            parameters = {
#                "hakuOid": self.hakuOid,
#                "updatedAfter": self.updatedAfter
#            }
            #path2=self.path+"?hakuOid="+self.hakuOid+"&updatedAfter="+self.updatedAfter
            #path2 = self.path + '/?updatedAfter="2018-08-22"'
            print("self path=" + self.path)
            print("path2=" + path2)
            #print("hakuOid: " + self.hakuOid + " updatedAfter: " + self.updatedAfter)
            #print("self.path= " + self.path)
            conn.request("GET", path2, headers=headers)
            #conn.request("GET", self.path, headers=headers)
            response = conn.getresponse()
            transfer_encoding = response.getheader("Transfer-Encoding", "")
            if response.status != 200:
                print("Error on request! [%d] %s" % (response.status, response.reason))
                return False
            if transfer_encoding.lower() != "chunked":
                print("Only chunked transfer encoding is supported! Current value: %s" % transfer_encoding)
                return False
            self._read_json_chunks(response)
        return True

    def _read_json_chunks(self, response):
        # Httplib does not support chunk by chunk reading
        # so we have to do it by our self.
        response.chunked = False
        count = 0
        manyCount = 0
        json_data = []
        data = ""
        print("Inserting data...")
        with closing(debug_dboperator) as db:
            self._clear_data(db)
            while True:
                chunk_size = self._get_chunk_size(response)
                if chunk_size == 0:
                    if manyCount!=0:
                        self._insert_data(db, json_data, count)
                        json_data = ''
                        manyCount=0
                    break
                data += self._get_chunk_data(response, chunk_size)
                if data.endswith('}'):
                    # Complete json object.
                    json_data.append(json.loads(data))
                    data = ""
                    manyCount +=1
                    if (count == 0):
                        self._set_columns(db,json_data[0])
                        json_data = []
                        manyCount = 0
                        count += 1
                        continue
                    count += 1
                    self._print_progress(count)
                if manyCount == 1000:
                    #print(json_data)
                    #exit(0)
                    self._insert_data(db, json_data)
                    #sys.exit(0)
                    json_data = []
                    #self._commit(db)
                    manyCount=0
        print("Count: %d" % count)

    @staticmethod
    def _print_progress(count):
        if count % 100 == 0:
            print(".", end="")
        if count % 1000 == 0:
            print("--- %d ---" % count)
        sys.stdout.flush()

    @staticmethod
    def _get_chunk_size(resp):
        size_str = resp.read(2)
        while size_str[-2:] != b"\r\n":
            size_str += resp.read(1)
        return int(size_str[:-2], 16)

    @staticmethod
    def _get_chunk_data(resp, chunk_size):
        data = resp.read(chunk_size)
        resp.read(2)
        return data

    def _insert_data(self, db, json_data):
        db.insertMany(self.source, self.schema, self.table, json_data, self.verbose)

    def _set_columns(self, db, json_data):
        # First json will define columns.
        db.columns(json_data, self.verbose)
        db.insert(self.source, self.schema, self.table, json_data, self.verbose)

    def _commit(self, db):
        db.commitLines()

    def _clear_data(self, db):
        db.empty(self.schema,
                 self.table,
                 self.verbose)

    def _debug(self, message=""):
        if self.verbose:
            print(message)


if __name__ == "__main__":
    start = timeit.default_timer()
    try:
        arg_parser = ArgumentParser(prog="ODW hakukohteet")
        arg_parser.add_argument('--host', type=str, default='localhost', help='api server host, REQUIRED',
                                required=True)
        arg_parser.add_argument('--path', type=str, default='/vipunendata', help='api url path, default=/vipunendata')
        arg_parser.add_argument('-p', '--port', type=int, help='api server port number')
        arg_parser.add_argument('-s', '--ssl', action='store_true', help='use secured http connection')
        arg_parser.add_argument('-v', '--verbose', default=0, action='store_const', const=1,
                                help='increase output verbosity')
        arg_parser.add_argument('--schema', type=str, default='sa', help='database schema, default=sa')
        arg_parser.add_argument('--table', type=str, default='sa_odw_hakeneet_debug',
                                help='database table name, default=sa_odw_hakeneet_debug'),
        arg_parser.add_argument('-oid', '--hakuOid', type=str, help='insert hakuOid', default=''),
        arg_parser.add_argument('-updated', '--updatedAfter', type=str, help='2017-09-29', default='')
        args = arg_parser.parse_args(args=sys.argv[1:])
        success = Client(**vars(args)).load()
        sys.exit(0 if success else 1)
    finally:
        stop = timeit.default_timer()
        print("Done in %f seconds" % (stop - start))
