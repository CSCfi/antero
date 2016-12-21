# Vipunen ETL for extracting

## Process

Orchestrator is Jenkins. Python is used to deliver data from original source to database. Python scripts are tried to keep as generic as possible and the process has been born on-the-fly with error-and-learn method.

The process is:

1. Database and a user with sufficient permissions must be created prior by other means.
  * User permissions require:
    * table and other database objects creation (views, procedures)
    * insert and delete rows, and truncate tables
    * executing procedures
2. Jenkins preparation
  1. Jenkins job called `pull-vipunen-repo` polls GitHub repository vipunen and keeps an up-to-date copy of all the files in there.
  2. Whenever you want to update a specific environment (test, prod) you have to manually execute (Jenkins term build) that environments `etl-files` job.
    * `etl-files` job is very important for the whole environment!
      * All other jobs depend (and should depend) on it.
      * This job keeps archived files that dictate the version for the whole environment.
    * One can call this `etl-files` job parameterized (default is latest successful) which means that it is not the only option to read the latest files from `pull-vipunen-repo`. For example if there is a need to use an older version of the code for whatever reason.
3. Database objects must be created with SQL scripts from repository folder /db/sa/ in the order given in filenames.
  * A Python script for just this purpose has been made and it's called dbfile.py.
  * In Jenkins is a environment specific job called `build-sa-db` for this phase.
  * Therefore Jenkins job `build-sa-db` must be executed or necessary database objects might not exist for the next phases!
    * For now there is no reverse operations. So, if some database objects cause problems human interfering is required.
4. All previous phases (1-3) in this process are all sort of preparation for actual loading of data (extracting). From this point on process goes deeper into the repository and reader (you) should move on to the next README (python/README.md). In short with important notes, however:
  * In Jenkins there is for each environment a MultiJob project (job) called `do-extract` which calls, in given phases but in parallel in a phase, other jobs.
  * Job `do-extract` is the only job with a meaningful timer regarding data loading!
  * Some structure has been made to the jobs that perform the actual work (data loading) but this structure is not mandatory at all. What is important is that these jobs are set up in `do-extract` in a meaningful order (phases). There is no automation for setting these up, so whenever new loadings (jobs) are made they need to be set in `do-extract` as well.
