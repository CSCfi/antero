IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_keksintoilmoitukset') BEGIN

create table dw.f_yo_keksintoilmoitukset(
	d_yliopisto_id int 
	,d_koulutusala_id int
	,d_ohjauksenala_id int
	,d_julkaisutyyppi_id int
	,d_julkaisun_kansainvalisyys_id int
	,d_tieteenala_id int
	,vuosi int
	,h21 int
	,h22 int
	,h23 int
	,h24 int
	,loadtime datetime
	,source varchar(55)
	,username varchar(55)
)
;

END