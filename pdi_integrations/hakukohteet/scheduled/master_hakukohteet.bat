for /f "tokens=1-3 delims=/- " %%a in ('date /t') do set XDate=%%c%%b%%a
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set XTime=%%a.%%b

set path_etl=d:\antero\pdi_integrations\hakukohteet
set path_log=d:\pdi_integrations\logs
D:
cd D:/data-integration

Kitchen.bat /file:%path_etl%/master_hakukohteet.kjb /level:basic > %path_log%/master_hakukohteetH_"%Xdate% %XTime%".log
