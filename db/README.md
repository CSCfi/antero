# Antero ETL for the relational database part

## Extracting data into Staging Area (SA)

..with Python and MS SQL

### Requirements

#### Software
In CentOS installation via `yum` with dependencies (there are quite a few!) is sufficient and Python pip packages from, well, `pip`.

* FreeTDS and unixODBC
    * yum package(s):
        * `freedts-devel`
* Python 2
    * yum package(s):
        * `python-devel`
        * `python-pip`
        * `yajl`
    * pip packages:
        * `httplib`
        * `pymssql`
        * `ijson`
        * (may be more: yajl, yajl-py, urllib2, urllib3, requests, ...)

#### Settings

* Database connection
    * Environment variables
        * `DATABASE_HOST`
        * `DATABASE_NAME`
        * `DATABASE_USER`
        * `DATABASE_PASS`
* APIKEYS or authentication
    * Environment variables
        * `API_USERNAME`
        * `API_PASSWORD`

### Loader scripts

For the purpose of these staging area data loading, or extract, scripts there has been made a generic `dboperator.py` script as a Python module. What is special about this module is that it requires those environment variables mentioned above, it opens database connection at init, and there is a function called `columns` that must be always called before any insert statements as it sets up column information to the module. Module `dboperator` also has some functionality for column types for creating tables on-the-fly but a decision has been made that database objects are created and maintained elsewhere and must be set up prior to loading data.

#### Codesets and classifications

Each classification script (filename contains word "luokitus") handles columns and data directly on their own since they all are specific in their content. But a more generic script `codes.py` loads codesets which all have the same structure and are loaded in the same database table.

#### Fact data

There is a generic fact loader script `load.py` but it does have some limitations to it. For example it might not (attempts for improvement have been made) work on more sophisticated APIs that leave out fields based on null values or other reasons. See the script itself for more details.

One attempt towards figuring out columns on-the-fly has been made (see `dboperator.py` and its function `columns`). This is not a complete generalization yet but could be sufficient enough for now.

Fact loaders that require data specific handling should have their own data loading script but it is recommended to try to see if generic `load.py` could do the work (or develop it further if it doesn't).


## Transformation

Transform phase really is made just by calling remotely SQL stored procedures that do the heavy lifting. Stored procedures are called via jenkins job that calls Python script callsp.py with arguments.

Stored procedures are created and maintained via SQL scripts under `/db` directory.
 
