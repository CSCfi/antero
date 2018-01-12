IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa'
   AND TABLE_NAME='sa_ammattinimikkeet_the_qs') BEGIN

CREATE TABLE sa.sa_ammattinimikkeet_the_qs(
  id int IDENTITY(1,1) NOT NULL,
  Nimike nvarchar(50) NULL,
	Ammattinumero nvarchar(10) NULL,
	Kansallinen nvarchar(10) NULL,
	Tutkijanurataso nvarchar(10) NULL,
	Lisatieto nvarchar(200) NULL,
	Ranking nvarchar(10) NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_ammattinimikkeet_the_qs PRIMARY KEY CLUSTERED
(
  id ASC
)
)
;
ALTER TABLE sa.sa_ammattinimikkeet_the_qs ADD  CONSTRAINT DF__sa_ammattinimikkeet_the_qs__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_ammattinimikkeet_the_qs ADD  CONSTRAINT DF__sa_ammattinimikkeet_the_qs__username  DEFAULT (suser_name()) FOR username
;

END
