--
--  create table sa_suorat_koodistot_amk_tehtavanryhma
--


IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='dw'
	AND TABLE_NAME='sa_suorat_koodistot_amk_tehtavanryhma')

BEGIN
CREATE TABLE [sa].[sa_suorat_koodistot_amk_tehtavanryhma](
      [koodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[lataaja]
      ,[latausaika])

END
