use antero
go

if not exists (
	SELECT 1 
	FROM sys.columns 
	WHERE Name = N'ytunnus_raportointiin'
	AND Object_ID = Object_ID(N'dw.d_ytj_yritystiedot')
)
alter table [dw].[d_ytj_yritystiedot]
add ytunnus_raportointiin VARCHAR(64) null

go
