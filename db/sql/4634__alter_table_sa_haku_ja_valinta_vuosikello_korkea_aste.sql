use antero
go

if not exists 
(
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = 'sa' 
    AND TABLE_NAME = 'sa_haku_ja_valinta_vuosikello_korkea_aste' 
	AND COLUMN_NAME = 'seuraava_kaynnistys'
)

alter table [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]
add [seuraava_kaynnistys] date null
go