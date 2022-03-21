USE ANTERO
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_arvokyselykerta'
  and COLUMN_NAME ='kyselypohja_tarkenne_fi'
) BEGIN

ALTER TABLE dw.d_arvokyselykerta ADD kyselypohja_tarkenne_fi nvarchar(500) null
ALTER TABLE dw.d_arvokyselykerta ADD kyselypohja_tarkenne_sv nvarchar(500) null
ALTER TABLE dw.d_arvokyselykerta ADD kyselypohja_tarkenne_en nvarchar(500) null

END