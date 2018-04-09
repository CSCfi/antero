for /f "tokens=1-3 delims=/- " %%a in ('date /t') do set XDate=%%c%%b%%a
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set XTime=%%a.%%b

set path_etl=D:/antero/pdi_integrations/valos/jobs
set path_log=D:/pdi-integrations/logs

d:
cd /
cd data-integration

Kitchen.bat /file:%path_etl%/master_valos.kjb  /level:basic 
REM> D:\pdi-integrations\logs\valos_%Xdate%_%XTime%.log

