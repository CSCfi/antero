--
--  create table sa_suorat_koodistot_amk_tehtavanryhma
--

IF  EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_suorat_koodistot_amk_tehtavanryhma')

BEGIN
exec sp_rename 'sa.sa_suorat_koodistot_amk_tehtavanryhma',
'sa_suorat_koodistot_amk_tehtavaryhma'
END
