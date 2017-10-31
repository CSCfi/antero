--
--  create table sa_suorat_koodistot_amk_tehtavanryhma
--

USE ANTERO
IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='dw'
	AND TABLE_NAME='sa_suorat_koodistot_amk_tehtavanryhma')

BEGIN
CREATE TABLE [sa].[sa_suorat_koodistot_amk_tehtavanryhma](
      [koodi] varchar(20)
      ,[selite_FI] varchar(100)
      ,[selite_SV] varchar(100)
      ,[selite_EN] varchar(100)
      ,[lataaja] varchar(100)
      ,[latausaika] varchar(100)
			,[source] varchar(100)
		)
END
