IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_avoinsaatavuus'
)
BEGIN

CREATE TABLE dw.d_avoinsaatavuus(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  avoinsaatavuus_koodi varchar(5) NOT NULL,
  avoinsaatavuus_fi nvarchar(100) NOT NULL,
  avoinsaatavuus_sv nvarchar(100) NOT NULL,
  avoinsaatavuus_en nvarchar(100) NOT NULL,
 CONSTRAINT PK__d_avoinsaatavuus PRIMARY KEY CLUSTERED (id ASC)
)

ALTER TABLE dw.d_avoinsaatavuus ADD  CONSTRAINT DF__d_avoinsaatavuus__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE dw.d_avoinsaatavuus ADD  CONSTRAINT DF__d_avoinsaatavuus__username  DEFAULT (suser_sname()) FOR username

END --table exists
/* revert
drop table dw.d_avoinsaatavuus
--*/
