IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_hist_yo6a_avoin_yliopisto_opetus') BEGIN

create table sa.sa_suorat_hist_yo6a_avoin_yliopisto_opetus
(
  vuosi int
, yliopisto_tunnus varchar(5)
, koulutusalakoodi varchar(5)
, tarjotut_pisteet_lkm decimal(9,1)
, itse_jarj_tutkopiskelijoille int
, itse_jarj_ei_tutkopiskelijoille int
, kans_ja_tyovaen_tutkopiskelijoille int
, kans_ja_tyovaen_ei_tutkopiskelijoille int
, kans_opiston_tutkopiskelijoille int
, kans_opiston_ei_tutkopiskelijoille int
, kesäyliop_tutkopiskelijoille int
, kesäyliop_ei_tutkopiskelijoille int
, muut_jarj_tutkopiskelijoille int
, muut_jarj_ei_tutkopiskelijoille int
, latausaika  datetime
, paivitysaika  datetime
, imp_created_date datetime
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_avoin_yliopisto_opetus') BEGIN

CREATE TABLE dw.f_yo_avoin_yliopisto_opetus(
	d_yliopisto_id int NOT NULL,
	d_koulutusala95_id int NOT NULL,
	vuosi int NOT NULL,
	tarjotut_pisteet_lkm int NOT NULL,
	itse_jarj_tutkopiskelijoille int NOT NULL,
	itse_jarj_ei_tutkopiskelijoille int NOT NULL,
	kans_ja_tyovaen_tutkopiskelijoille int NOT NULL,
	kans_ja_tyovaen_ei_tutkopiskelijoille int NOT NULL,
	kans_opiston_tutkopiskelijoille int NOT NULL,
	kans_opiston_ei_tutkopiskelijoille int NOT NULL,
	kesäyliop_tutkopiskelijoille int NOT NULL,
	kesäyliop_ei_tutkopiskelijoille int NOT NULL,
	muut_jarj_tutkopiskelijoille int NOT NULL,
	muut_jarj_ei_tutkopiskelijoille int NOT NULL,
	loadtime datetime NULL,
	source varchar(255) NULL,
	username varchar(55) NULL
) 

END
