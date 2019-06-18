-- OKM opettajatiedonkeruu tulostaulu
USE ANTERO
GO
IF EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_opettajapatevyydet'
) 
BEGIN
DROP TABLE sa.sa_virta_otp_opettajapatevyydet
END


IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_opettajapatevyydet'
) 
BEGIN


CREATE TABLE sa.sa_virta_otp_opettajapatevyydet(

	id bigint IDENTITY(1,1) NOT NULL,
	sukupuolikoodi varchar(3) NULL,
	ika int NULL,
	organisaatiokoodi varchar(5) NULL,
	oppilaitostyyppi_koodi int NULL,
	db varchar(20) NULL,
	vuosi int NULL,
	patevkoodi_ke smallint NULL,
	ke_tutkinto smallint NULL,
	ke_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_ik smallint NULL,
	ik_tutkinto smallint NULL,
	ik_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_il smallint NULL,
	il_tutkinto smallint NULL,
	il_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_im smallint NULL,
	im_tutkinto smallint NULL,
	im_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_in smallint NULL,
	in_tutkinto smallint NULL,
	in_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_io smallint NULL,
	io_tutkinto smallint NULL,
	io_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_ip smallint NULL,
	ip_tutkinto smallint NULL,
	ip_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_iq smallint NULL,
	iq_tutkinto smallint NULL,
	iq_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_ir smallint NULL,
	ir_tutkinto smallint NULL,
	ir_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_is smallint NULL,
	is_tutkinto smallint NULL,
	is_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_it smallint NULL,
	it_tutkinto smallint NULL,
	it_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_iu smallint NULL,
	iu_tutkinto smallint NULL,
	iu_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_iv smallint NULL,
	iv_tutkinto smallint NULL,
	iv_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_iw smallint NULL,
	iw_tutkinto smallint NULL,
	iw_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_iy smallint NULL,
	iy_tutkinto smallint NULL,
	iy_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_jb smallint NULL,
	jb_tutkinto smallint NULL,
	jb_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_ja smallint NULL,
	ja_tutkinto smallint NULL,
	ja_opintosuoritus_avain varchar(100) NULL,
	patevkoodi_jc smallint NULL,
	jc_tutkinto smallint NULL,
	jc_opintosuoritus_avain varchar(100) NULL,
	patevyyskoodi1 char(2) NULL,
	patevyysselite1 varchar(512) NULL,
	oppilaitostunnus1 varchar(6) NULL,
	Patevyysmerk_vuosi1 int NULL,
	laajuus1 float NULL,
	popintosuoritus_avain1 varchar(100) NULL,
	patevyyskoodi2 char(2) NULL,
	patevyysselite2 varchar(512) NULL,
	oppilaitostunnus2 varchar(6) NULL,
	Patevyysmerk_vuosi2 int NULL,
	laajuus2 float NULL,
	popintosuoritus_avain2 varchar(100) NULL,
	patevyyskoodi3 char(2) NULL,
	patevyysselite3 varchar(512) NULL,
	oppilaitostunnus3 varchar(6) NULL,
	Patevyysmerk_vuosi3 int NULL,
	laajuus3 float NULL,
	popintosuoritus_avain3 varchar(100) NULL,
	patevyyskoodi4 char(2) NULL,
	patevyysselite4 varchar(512) NULL,
	oppilaitostunnus4 varchar(6) NULL,
	Patevyysmerk_vuosi4 int NULL,
	laajuus4 float NULL,
	popintosuoritus_avain4 varchar(100) NULL,
	patevyyskoodi5 char(2) NULL,
	patevyysselite5 varchar(512) NULL,
	oppilaitostunnus5 varchar(6) NULL,
	Patevyysmerk_vuosi5 int NULL,
	laajuus5 float NULL,
	popintosuoritus_avain5 varchar(100) NULL,
	tkkoodi1 varchar(6) NULL,
	tutkinnon_nimi1 varchar(256) NULL,
	toppilaitostunnus1 varchar(6) NULL,
	kala1 int NULL,
	tv1 int NULL,
	topintosuoritus_avain1 varchar(100) NULL,
	tkkoodi2 varchar(6) NULL,
	tutkinnon_nimi2 varchar(256) NULL,
	toppilaitostunnus2 varchar(6) NULL,
	kala2 int NULL,
	tv2 int NULL,
	topintosuoritus_avain2 varchar(100) NULL,
	tkkoodi3 varchar(6) NULL,
	tutkinnon_nimi3 varchar(256) NULL,
	toppilaitostunnus3 varchar(6) NULL,
	kala3 int NULL,
	tv3 int NULL,
	topintosuoritus_avain3 varchar(100) NULL,
	tkkoodi4 varchar(6) NULL,
	tutkinnon_nimi4 varchar(256) NULL,
	toppilaitostunnus4 varchar(6) NULL,
	kala4 int NULL,
	tv4 int NULL,
	topintosuoritus_avain4 varchar(100) NULL,
	tkkoodi5 varchar(6) NULL,
	tutkinnon_nimi5 varchar(256) NULL,
	toppilaitostunnus5 varchar(6) NULL,
	kala5 int NULL,
	tv5 int NULL,
	topintosuoritus_avain5 varchar(100) NULL,
	opiskelija_avain varchar(100) NULL,
	opettajapatevyytta int NOT NULL,
	tutkintopatevyyksia int NOT NULL,
	pateyyksiayhteensa int NOT NULL,
	ainepatevyytta int NOT NULL,
	loadtime datetime2(4) NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NULL,

 CONSTRAINT PK__sa_virta_otp_opettajapatevyydet PRIMARY KEY CLUSTERED (	id ASC) 
) ;



ALTER TABLE sa.sa_virta_otp_opettajapatevyydet ADD  CONSTRAINT DF__sa_virta_otp_opettajapatevyydet__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_opettajapatevyydet ADD  CONSTRAINT DF__sa_virta_otp_opettajapatevyydet__username  DEFAULT (suser_name()) FOR username
;

END
