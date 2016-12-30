# Antero ETL for transform

TODO but transform really is made just by calling remotely SQL stored procedures that do the heavy lifting. Stored procedures are called via jenkins job that calls Python script callsp.py with arguments.

Stored procedures are created and maintained via SQL scripts under `/db` directory.
