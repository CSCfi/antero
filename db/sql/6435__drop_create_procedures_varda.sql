USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_vakasuhteet_vakapaatokset]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_f_varda_vakasuhteet_vakapaatokset]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_vakajarjestajat_toimipaikat]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_f_varda_vakajarjestajat_toimipaikat]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_toimintapainotus]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_f_varda_toimintapainotus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_kielipainotus]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_f_varda_kielipainotus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_jarjestamismuoto]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_f_varda_jarjestamismuoto]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_huoltajatiedot]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_f_varda_huoltajatiedot]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_yritysluokitus_backup]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_d_varda_yritysluokitus_backup]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_yritysluokitus]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_d_varda_yritysluokitus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_varhaiskasvatuspaikkaluokitus]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_d_varda_varhaiskasvatuspaikkaluokitus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_tuntimaara_asteikko]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_d_varda_tuntimaara_asteikko]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_toimipaikkaluokitus]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_d_varda_toimipaikkaluokitus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_maksuluokka]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_d_varda_maksuluokka]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_kytkin]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_d_varda_kytkin]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_ikaryhma]    Script Date: 15.9.2022 16:18:57 ******/
DROP PROCEDURE IF EXISTS  [dw].[p_lataa_d_varda_ikaryhma]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_ikaryhma]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   procedure [dw].[p_lataa_d_varda_ikaryhma] AS

truncate table dw.d_varda_ikaryhma;

SET IDENTITY_INSERT dw.d_varda_ikaryhma ON;

INSERT INTO [dw].[d_varda_ikaryhma]
           (ID
		   ,[koodi]
           ,[nimi_fi]
           ,[nimi_sv]
           ,[nimi_en]
           ,[kuvaus_fi]
           ,[kuvaus_sv]
           ,[kuvaus_en]
           ,[jarj_nro]
           ,[alkupvm]
           ,[loppupvm]
           ,[source])
     VALUES
           (1
		   ,1
		   ,'Alle 3 vuotta'
           ,'Under 3 år'
           ,'Younger than 3 years'
		   ,'Alle 3 vuotta'
           ,'Under 3 år'
           ,'Younger than 3 years'
           ,1
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_ikaryhma'),
		   (2
		   ,2
		   ,'3 - 5 vuotta'
           ,'3 - 5 år'
           ,'3 - 5 years'
		   ,'3 - 5 vuotta'
           ,'3 - 5 år'
           ,'3 - 5 years'
           ,2
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_ikaryhma'),
           (3
		   ,3
		   ,'6 vuotta'
           ,'6 år'
           ,'6 years'
		   ,'6 vuotta'
           ,'6 år'
           ,'6 years'
           ,3
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_ikaryhma'),
		  (4
		   ,4
		   ,'7 vuotta ja yli'
           ,'7 år och över'
           ,'7 vuotta ja yli'
		   ,'7 vuotta ja yli'
           ,'7 år och över'
           ,'7 vuotta ja yli'
           ,4
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_ikaryhma')





GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_kytkin]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   procedure [dw].[p_lataa_d_varda_kytkin] AS

truncate table dw.d_varda_kytkin;

SET IDENTITY_INSERT dw.d_varda_kytkin ON;

INSERT INTO [dw].[d_varda_kytkin]
           (ID
		   ,[kytkin_luokka]
           ,[kytkin_koodi]
           ,[kytkin_fi]
           ,[kytkin_en]
           ,[kytkin_sv]
           ,[jarjestys_kytkin_koodi]
		   ,alkamis_pvm
		   ,paattymis_pvm
           ,[source])
     VALUES
           (-1
		   ,'Tieto puuttuu'
		   ,'-1'
           ,'Tieto puuttuu'
           ,'Information missing'
		   ,'Information saknas'
           ,-1
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_kytkin'),
           (1
		   ,'vakapaatos_kokopaivainen_vaka'
		   ,'0'
           ,'Osapäiväinen varhaiskasvatus'
           ,'EN Osapäiväinen varhaiskasvatus'
		   ,'Halvdagsverksamhet'
           ,2
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_kytkin'),
           (2
		   ,'vakapaatos_kokopaivainen_vaka'
		   ,'1'
           ,'Kokopäiväinen varhaiskasvatus'
           ,'EN Kokopäiväinen varhaiskasvatus'
		   ,'Heldagsverksamhet'
           ,1
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_kytkin'),
           (3
		   ,'vakapaatos_paivittainen_vaka'
		   ,'0'
           ,'Osaviikkoinen varhaiskasvatus'
           ,'EN Osaviikkoinen varhaiskasvatus'
		   ,'Ordnas under en del av veckan'
           ,2
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_kytkin'),
           (4
		   ,'vakapaatos_paivittainen_vaka'
		   ,'1'
           ,'Päivittäinen varhaiskasvatus'
           ,'EN Päivittäinen varhaiskasvatus'
		   ,'Ordnas dagligen'
           ,1
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_kytkin')





GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_maksuluokka]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   procedure [dw].[p_lataa_d_varda_maksuluokka] AS

delete from dw.d_varda_maksuluokka;

SET IDENTITY_INSERT dw.d_varda_maksuluokka ON;

INSERT INTO [dw].[d_varda_maksuluokka]
           (id
		   ,[koodi]
		   ,tilastovuosi
		   ,max_arvo
		   ,yritystyyppi
           ,[nimi_fi]
           ,[nimi_sv]
           ,[nimi_en]
           ,[kuvaus_fi]
           ,[kuvaus_sv]
           ,[kuvaus_en]
		   ,jarjestysnumero
           ,[alkupvm]
           ,[loppupvm]
           ,[source])
     VALUES
	            (1,
				'-1'
		   ,'2000'
		   ,'0'
		   ,NULL
		   ,'Tieto puuttuu'
           ,'Information saknas'
           ,'Information missing'
           ,'Tieto puuttuu'
           ,'Information saknas'
           ,'Information missing'
		   ,999
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
		    (2,
			'1'
		   ,'2020'
		   ,'27'
		   ,'Kunta'
           ,'Maksu 0 €'
           ,'Avgift 0 €'
           ,'Käännös puuttuu'
           ,'Maksu 0 €'
           ,'Avgift 0 €'
           ,'Käännös puuttuu'
		   ,1
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
		   (3,
		   '2'
		   ,'2020'
		   ,'288'
           ,'Kunta'
		   ,'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä'
           ,'Klientavgift mellan den lägsta debiterade och den maximala avgiften'
           ,'Käännös puuttuu'
           ,'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä'
           ,'Klientavgift mellan den lägsta debiterade och den maximala avgiften'
           ,'Käännös puuttuu'
		   ,2
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
		   (4
		   ,'3'
		   ,'2020'
		   ,NULL
           ,'Kunta'
           ,'Enimmäismaksu'
           ,'Högsta avgift'
           ,'Käännös puuttuu'
           ,'Enimmäismaksu'
           ,'Högsta avgift'
           ,'Käännös puuttuu'
		   ,3
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
           (5
		   ,'4'
		   ,'2020'
		   ,'290'
		   ,'Yksityinen'
		   ,'0-290 €'
           ,'0-290 €'
           ,'0-290 €'
           ,'0-290 €'
           ,'0-290 €'
           ,'0-290 €'
		   ,4
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
		   (6
		   ,'5'
		   ,'2020'
		   ,'400'
		   ,'Yksityinen'
           ,'291-400 €'
           ,'291-400 €'
           ,'291-400 €'
           ,'291-400 €'
           ,'291-400 €'
           ,'291-400 €'
		   ,5
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
		   (7
		   ,'6'
		   ,'2020'
		   ,'500'
           ,'Yksityinen'
		   ,'401-500 €'
           ,'401-500 €'
           ,'401-500 €'
           ,'401-500 €'
           ,'401-500 €'
           ,'401-500 €'
		   ,6
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
		   (8
		   ,'7'
		   ,'2020'
		   ,NULL
           ,'Yksityinen'
		   ,'Yli 500 €'
           ,'Yli 500 €'
           ,'Yli 500 €'
           ,'Yli 500 €'
           ,'Yli 500 €'
           ,'Yli 500 €'
		   ,7
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
		   (9
		   ,'1'
           ,'2021'
		   ,'27'
           ,'Kunta'
           ,'Maksu 0 €'
           ,'Avgift 0 €'
           ,'Käännös puuttuu'
           ,'Maksu 0 €'
           ,'Avgift 0 €'
           ,'Käännös puuttuu'
		   ,1
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
		   (10
		   ,'2'
		   ,'2021'
		   ,'288'
           ,'Kunta'
		   ,'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä'
           ,'Klientavgift mellan den lägsta debiterade och den maximala avgiften'
           ,'Käännös puuttuu'
           ,'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä'
           ,'Klientavgift mellan den lägsta debiterade och den maximala avgiften'
           ,'Käännös puuttuu'
		   ,2
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
		   (11
		   ,'3'
		   	,'2021'
		   ,NULL
           ,'Kunta'
           ,'Enimmäismaksu'
           ,'Högsta avgift'
           ,'Käännös puuttuu'
           ,'Enimmäismaksu'
           ,'Högsta avgift'
           ,'Käännös puuttuu'
           ,3
		   ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
           (12
		   ,'4'
		   ,'2021'
		   ,'290'
		   ,'Yksityinen'
		   ,'0-290 €'
           ,'0-290 €'
           ,'0-290 €'
           ,'0-290 €'
           ,'0-290 €'
           ,'0-290 €'
		   ,4
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
		   (14
		   ,'5'
		   ,'2021'
		   ,'400'
		   ,'Yksityinen'
           ,'291-400 €'
           ,'291-400 €'
           ,'291-400 €'
           ,'291-400 €'
           ,'291-400 €'
           ,'291-400 €'
		   ,5
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
		   (15
		   ,'6'
		   ,'2021'
		   ,'500'
           ,'Yksityinen'
		   ,'401-500 €'
           ,'401-500 €'
           ,'401-500 €'
           ,'401-500 €'
           ,'401-500 €'
           ,'401-500 €'
		   ,6
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka'),
		   (16
		   ,'7'
		   ,'2021'
		   ,NULL
           ,'Yksityinen'
		   ,'Yli 500 €'
           ,'Yli 500 €'
           ,'Yli 500 €'
           ,'Yli 500 €'
           ,'Yli 500 €'
           ,'Yli 500 €'
		   ,7
           ,'2021-04-14'
           ,NULL
           ,'p_lataa_d_varda_maksuluokka')




GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_toimipaikkaluokitus]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


















CREATE   procedure [dw].[p_lataa_d_varda_toimipaikkaluokitus] AS

truncate table dw.d_varda_toimipaikkaluokitus

INSERT INTO [dw].[d_varda_toimipaikkaluokitus]
           ([koodi]
           ,[nimi_fi]
           ,[nimi_sv]
           ,[nimi_en]
           ,[kuvaus_fi]
           ,[kuvaus_sv]
           ,[kuvaus_en]
           ,[alkupvm]
           ,[loppupvm]
		   ,[source])
     VALUES
           ('1'
           ,'1 toimipaikka' --FI
           ,'Ett verksamhetsställe' --SV
           ,'1 toimipaikka' --EN
           ,'1 toimipaikka'  --FI
		   ,'Ett verksamhetsställe'  --SV
           ,'1 toimipaikka'  --EN
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_d_varda_toimipaikkaluokitus'),

		   ('2'
           ,'2-3 toimipaikkaa' --FI
           ,'2-3 verksamhetsställen' --SV
           ,'2-3 toimipaikkaa' --EN
           ,'2-3 toimipaikkaa'  --FI
		   ,'2-3 verksamhetsställen'  --SV
           ,'2-3 toimipaikkaa'  --EN
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_d_varda_toimipaikkaluokitus'),

		   		   ('3'
           ,'4-10 toimipaikkaa' --FI
           ,'4-10 verksamhetsställen' --SV
           ,'4-10 toimipaikkaa' --EN
           ,'4-10 toimipaikkaa' --FI
           ,'4-10 verksamhetsställen' --SV
           ,'4-10 toimipaikkaa' --EN
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_d_varda_toimipaikkaluokitus'),

		   ('4'
           ,'11-20 toimipaikkaa' --FI
           ,'11-20 verksamhetsställen' --SV
           ,'11-20 toimipaikkaa' --EN
           ,'11-20 toimipaikkaa' --FI
           ,'11-20 verksamhetsställen' --SV
           ,'11-20 toimipaikkaa' --EN
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_d_varda_toimipaikkaluokitus'),

		   		   ('5'
           ,'Yli 20 toimipaikkaa' --FI
           ,'Över 20 verksamhetsställen' --SV
           ,'Yli 20 toimipaikkaa' --EN
           ,'Yli 20 toimipaikkaa'  --FI
           ,'Över 20 verksamhetsställen'  --SV
           ,'Yli 20 toimipaikkaa'  --EN
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_d_varda_toimipaikkaluokitus')


GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_tuntimaara_asteikko]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



















CREATE   procedure [dw].[p_lataa_d_varda_tuntimaara_asteikko] AS

truncate table dw.d_varda_tuntimaara_asteikko;

SET IDENTITY_INSERT dw.d_varda_tuntimaara_asteikko ON;

INSERT INTO [dw].[d_varda_tuntimaara_asteikko]
           (ID
		   ,[koodi]
           ,[nimi_fi]
           ,[nimi_sv]
           ,[nimi_en]
           ,[kuvaus_fi]
           ,[kuvaus_sv]
           ,[kuvaus_en]
           ,[jarj_nro]
           ,[alkupvm]
           ,[loppupvm]
           ,[source])
     VALUES
           (1
		   ,1
		   ,'Alle 25 h'
           ,'Under 25h'
           ,'Alle 25 h'
		   ,'Alle 25 h'
           ,'Under 25h'
           ,'Alle 25 h'
           ,1
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_tuntimaara_asteikko'),
		   (2
		   ,2
		   ,'25 - 35 h'
           ,'25 - 35 h'
           ,'25 - 35 h'
		   ,'25 - 35 h'
           ,'25 - 35 h'
           ,'25 - 35 h'
           ,2
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_tuntimaara_asteikko'),
           (3
		   ,3
		   ,'Yli 35 h'
           ,'Över 35h'
           ,'Yli 35 h'
		   ,'Yli 35 h'
           ,'Över 35h'
           ,'Yli 35 h'
           ,3
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_tuntimaara_asteikko')



GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_varhaiskasvatuspaikkaluokitus]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


















CREATE   procedure [dw].[p_lataa_d_varda_varhaiskasvatuspaikkaluokitus] AS

truncate table dw.d_varda_varhaiskasvatuspaikkaluokitus

INSERT INTO [dw].[d_varda_varhaiskasvatuspaikkaluokitus]
           ([koodi]
           ,[nimi_fi]
           ,[nimi_sv]
           ,[nimi_en]
           ,[kuvaus_fi]
           ,[kuvaus_sv]
           ,[kuvaus_en]
           ,[alkupvm]
           ,[loppupvm]
		   ,jarj_nro
		   ,[source])
     VALUES
	       ('-1'
           ,'Tieto puuttuu' --FI
           ,'Information saknas' --SV
           ,'Data missing' --EN
           ,'Tieto puuttuu' --FI
           ,'Information saknas' --SV
           ,'Data missing' --EN
           ,'2021-03-23'
           ,NULL
		   ,-1
		   ,'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus'),

           ('1'
           ,'Alle 25' --FI
           ,'Mindre än 25' --SV
           ,'Less than 25' --EN
           ,'Alle 25' --FI
           ,'Mindre än 25' --SV
           ,'Less than 25' --EN
           ,'2021-03-23'
           ,NULL
		   ,1
		   ,'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus'),

		   ('2'
           ,'25 - 49' --FI
           ,'25 - 49' --SV
           ,'25 - 49' --EN
           ,'25 - 49'  --FI
		   ,'25 - 49'  --EN
           ,'25 - 49'  --SV
           ,'2021-03-23'
           ,NULL
		   ,2
		   ,'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus'),

		   ('3'
           ,'50 - 99' --FI
           ,'50 - 99' --SV
           ,'50 - 99' --EN
           ,'50 - 99' --FI
           ,'50 - 99' --EN
           ,'50 - 99' --SV
           ,'2021-03-23'
           ,NULL
		   ,3
		   ,'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus'),

		   ('4'
           ,'100 - 149' --FI
           ,'100 - 149' --SV
           ,'100 - 149' --EN
           ,'100 - 149' --FI
           ,'100 - 149' --SV
           ,'100 - 149' --EN
           ,'2021-03-23'
           ,NULL
		   ,4
		   ,'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus'),

		   	('5'
           ,'150 - 199' --FI
           ,'150 - 199' --SV
           ,'150 - 199' --EN
           ,'150 - 199' --FI
           ,'150 - 199' --SV
           ,'150 - 199' --EN
           ,'2021-03-23'
           ,NULL
		   ,5
		   ,'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus'),

		   ('6'
           ,'200 - 249' --FI
           ,'200 - 249' --SV
           ,'200 - 249' --EN
           ,'200 - 249' --FI
           ,'200 - 249' --SV
           ,'200 - 249' --EN
           ,'2021-03-23'
           ,NULL
		   ,6
		   ,'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus'),

		   ('7'
           ,'250 tai yli' --FI
           ,'250 eller mer' --SV
           ,'250 or more' --EN
           ,'250 tai yli' --FI
           ,'250 eller mer' --SV
           ,'250 or more' --EN
           ,'2021-03-23'
           ,NULL
		   ,7
		   ,'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus')




GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_yritysluokitus]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   procedure [dw].[p_lataa_d_varda_yritysluokitus] AS


truncate table dw.d_varda_yritysluokitus;

SET IDENTITY_INSERT dw.d_varda_yritysluokitus ON;

INSERT INTO [dw].[d_varda_yritysluokitus]
           (id
		   ,[koodi]
           ,[nimi_fi]
           ,[nimi_sv]
           ,[nimi_en]
           ,[kuvaus_fi]
           ,[kuvaus_sv]
           ,[kuvaus_en]
           ,[yritysmuoto_ryhma_fi]
		   ,yritysmuoto_ryhma_en
		   ,yritysmuoto_ryhma_sv
           ,[yritys_tyyppi]
           ,[alkupvm]
           ,[loppupvm]
		   ,[source])
     VALUES
           (1
		   ,'16'
           ,'Osakeyhtiö'
           ,'Aktiebolag'
           ,NULL
           ,'Osakeyhtiö' --FI
           ,'Aktiebolag' --SV
           ,'Osakeyhtiö' --EN
           ,'Yritykset'  --FI
		   ,'Yritykset'  --EN
           ,'Företag'  --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (2
		   ,'13'
           ,'Kommandiittiyhtiö'
           ,'Kommanditbolag'
           ,NULL
           ,'Kommandiittiyhtiö' --FI
           ,'Kommanditbolag' --SV
           ,'Kommandiittiyhtiö' --EN
           ,'Yritykset'  --FI
		   ,'Yritykset'  --EN
           ,'Företag'  --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (3
		   ,'18'
           ,'Säätiö'
           ,'Stiftelse'
           ,NULL
           ,'Säätiö' --FI
           ,'Stiftelse' --SV
           ,'Säätiö' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Föreningar och stiftelser' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (4
		   ,'71'
           ,'Paikallisyhteisö'
           ,'Lokalsamfund'
           ,NULL
           ,'Paikallisyhteisö' --FI
           ,'Lokalsamfund' --SV
           ,'Paikallisyhteisö' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Föreningar och stiftelser' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (5
		   ,'26'
           ,'Yksityinen elinkeinonharjoittaja'
           ,'Enskild näringsidkare'
           ,NULL
           ,'Yksityinen elinkeinonharjoittaja' --FI
           ,'Enskild näringsidkare' --SV
           ,'Yksityinen elinkeinonharjoittaja' --EN
           ,'Yksityiset elinkeinonharjoittajat'  --FI
           ,'Yksityiset elinkeinonharjoittajat'  --EN
           ,'Enskilda näringsidkare'  --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (6
		   ,'45'
           ,'Ortodoksinen kirkko'
           ,'Ortodoxa kyrkan'
           ,NULL
           ,'Ortodoksinen kirkko' --FI
           ,'Ortodoxa kyrkan' --SV
           ,'Ortodoksinen kirkko' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Föreningar och stiftelser' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (7
		   ,'14'
           ,'Osuuskunta'
           ,'Andelslag'
           ,NULL
           ,'Osuuskunta' --FI
           ,'Andelslag' --SV
           ,'Osuuskunta' --EN
           ,'Yritykset'  --FI
           ,'Yritykset'  --EN
           ,'Företag'  --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (8
		   ,'46'
           ,'Uskonnollinen yhdyskunta'
           ,'Församling/Lokalsamfund'
           ,NULL
           ,'Uskonnollinen yhdyskunta' --FI
           ,'Församling/Lokalsamfund' --SV
           ,'Uskonnollinen yhdyskunta' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Föreningar och stiftelser' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (9
		   ,'29'
           ,'Muu yhdistys'
           ,'Annan förening'
           ,NULL
           ,'Muu yhdistys' --FI
           ,'Annan förening' --SV
           ,'Muu yhdistys' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Föreningar och stiftelser' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (10
		   ,'0'
           ,'Ei yritysmuotoa'
           ,'Ingen företagsform'
           ,NULL
           ,'Ei yritysmuotoa' --FI
           ,'Ingen företagsform' --SV
           ,'Ei yritysmuotoa' --EN
           ,'Yksityiset elinkeinonharjoittajat'  --FI
           ,'Yksityiset elinkeinonharjoittajat'  --EN
           ,'Enskilda näringsidkare'  --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (11
		   ,'41'
           ,'Kunta'
           ,'Kommun'
           ,NULL
           ,'Kunta' --FI
           ,'Kommun' --SV
           ,'Kunta' --EN
           ,'Kunta' --FI
           ,'Kunta'  --EN
           ,'Kommun'  --SV
           ,'Kunta'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (12
		   ,'42'
           ,'Kuntayhtymä'
           ,'Samkommun'
           ,NULL
           ,'Kuntayhtymä' --FI
           ,'Samkommun' --SV
           ,'Kuntayhtymä' --EN
           ,'Kunta' --FI
           ,'Kunta'  --EN
           ,'Kommun'  --SV
           ,'Kunta'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (13
		   ,'5'
           ,'Avoin yhtiö'
           ,'Öppet bolag'
           ,NULL
           ,'Avoin yhtiö' --FI
           ,'Öppet bolag' --SV
           ,'Avoin yhtiö' --EN
           ,'Yritykset'  --FI
           ,'Yritykset'  --EN
           ,'Företag'  --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (14
		   ,'44'
           ,'Evankelis-luterilainen kirkko'
           ,'Ev.luth.kyrkan'
           ,NULL
           ,'Evankelis-luterilainen kirkko' --FI
           ,'Ev.luth.kyrkan' --SV
           ,'Evankelis-luterilainen kirkko' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Föreningar och stiftelser' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (15
		   ,'6'
           ,'Aatteellinen yhdistys'
           ,'Ideell förening'
           ,NULL
           ,'Aatteellinen yhdistys' --FI
           ,'Ideell förening' --SV
           ,'Aatteellinen yhdistys' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Föreningar och stiftelser' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto')


/*
 update [ANTERO].[dw].[d_varda_yritysluokitus]
 set nimi_sv = nimi_fi, nimi_en = nimi_fi
*/



GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_yritysluokitus_backup]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dw].[p_lataa_d_varda_yritysluokitus_backup] AS

truncate table dw.d_varda_yritysluokitus;

SET IDENTITY_INSERT dw.d_varda_yritysluokitus ON;

INSERT INTO [dw].[d_varda_yritysluokitus]
           (id
		   ,[koodi]
           ,[nimi_fi]
           ,[nimi_sv]
           ,[nimi_en]
           ,[kuvaus_fi]
           ,[kuvaus_sv]
           ,[kuvaus_en]
           ,[yritysmuoto_ryhma_fi]
		   ,yritysmuoto_ryhma_en
		   ,yritysmuoto_ryhma_sv
           ,[yritys_tyyppi]
           ,[alkupvm]
           ,[loppupvm]
		   ,[source])
     VALUES
           (1
		   ,'OSAKEYHTIO'
           ,'Osakeyhtiö'
           ,NULL
           ,NULL
           ,'Osakeyhtiö' --FI
           ,'Osakeyhtiö' --SV
           ,'Osakeyhtiö' --EN
           ,'Yritykset'  --FI
		   ,'Yritykset'  --EN
           ,'Yritykset'  --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (2
		   ,'KOMMANDIITTIYHTIO'
           ,'Kommandiittiyhtiö'
           ,NULL
           ,NULL
           ,'Kommandiittiyhtiö' --FI
           ,'Kommandiittiyhtiö' --SV
           ,'Kommandiittiyhtiö' --EN
           ,'Yritykset'  --FI
		   ,'Yritykset'  --EN
           ,'Yritykset'  --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (3
		   ,'SAATIO'
           ,'Säätiö'
           ,NULL
           ,NULL
           ,'Säätiö' --FI
           ,'Säätiö' --SV
           ,'Säätiö' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Yhdistykset ja säätiöt' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (4
		   ,'PAIKALLISYHTEISO'
           ,'Paikallisyhteisö'
           ,NULL
           ,NULL
           ,'Paikallisyhteisö' --FI
           ,'Paikallisyhteisö' --SV
           ,'Paikallisyhteisö' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Yhdistykset ja säätiöt' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (5
		   ,'YKSITYINEN_ELINKEINONHARJOITTAJA'
           ,'Yksityinen elinkeinonharjoittaja'
           ,NULL
           ,NULL
           ,'Yksityinen elinkeinonharjoittaja' --FI
           ,'Yksityinen elinkeinonharjoittaja' --SV
           ,'Yksityinen elinkeinonharjoittaja' --EN
           ,'Yksityiset elinkeinonharjoittajat'  --FI
           ,'Yksityiset elinkeinonharjoittajat'  --EN
           ,'Yksityiset elinkeinonharjoittajat'  --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (6
		   ,'ORTODOKSINEN_KIRKKO'
           ,'Ortodoksinen kirkko'
           ,NULL
           ,NULL
           ,'Ortodoksinen kirkko' --FI
           ,'Ortodoksinen kirkko' --SV
           ,'Ortodoksinen kirkko' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Yhdistykset ja säätiöt' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (7
		   ,'OSUUSKUNTA'
           ,'Osuuskunta'
           ,NULL
           ,NULL
           ,'Osuuskunta' --FI
           ,'Osuuskunta' --SV
           ,'Osuuskunta' --EN
           ,'Yritykset'  --FI
           ,'Yritykset'  --EN
           ,'Yritykset'  --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (8
		   ,'USKONNOLLINEN_YHDYSKUNTA'
           ,'Uskonnollinen yhdyskunta'
           ,NULL
           ,NULL
           ,'Uskonnollinen yhdyskunta' --FI
           ,'Uskonnollinen yhdyskunta' --SV
           ,'Uskonnollinen yhdyskunta' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Yhdistykset ja säätiöt' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (9
		   ,'MUU_YHDISTYS'
           ,'Muu yhdistys'
           ,NULL
           ,NULL
           ,'Muu yhdistys' --FI
           ,'Muu yhdistys' --SV
           ,'Muu yhdistys' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Yhdistykset ja säätiöt' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (10
		   ,'EI_YRITYSMUOTOA'
           ,'Ei yritysmuotoa'
           ,NULL
           ,NULL
           ,'Ei yritysmuotoa' --FI
           ,'Ei yritysmuotoa' --SV
           ,'Ei yritysmuotoa' --EN
           ,'Yksityiset elinkeinonharjoittajat'  --FI
           ,'Yksityiset elinkeinonharjoittajat'  --EN
           ,'Yksityiset elinkeinonharjoittajat'  --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (11
		   ,'KUNTA'
           ,'Kunta'
           ,NULL
           ,NULL
           ,'Kunta' --FI
           ,'Kunta' --SV
           ,'Kunta' --EN
           ,'Kunta' --FI
           ,'Kunta'  --EN
           ,'Kunta'  --SV
           ,'Kunta'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (12
		   ,'KUNTAYHTYMA'
           ,'Kuntayhtymä'
           ,NULL
           ,NULL
           ,'Kuntayhtymä' --FI
           ,'Kuntayhtymä' --SV
           ,'Kuntayhtymä' --EN
           ,'Kunta' --FI
           ,'Kunta'  --EN
           ,'Kunta'  --SV
           ,'Kunta'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (13
		   ,'AVOIN_YHTIO'
           ,'Avoin yhtiö'
           ,NULL
           ,NULL
           ,'Avoin yhtiö' --FI
           ,'Avoin yhtiö' --SV
           ,'Avoin yhtiö' --EN
           ,'Yritykset'  --FI
           ,'Yritykset'  --EN
           ,'Yritykset'  --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (14
		   ,'EV_LUT_KIRKKO'
           ,'Evankelis-luterilainen kirkko'
           ,NULL
           ,NULL
           ,'Evankelis-luterilainen kirkko' --FI
           ,'Evankelis-luterilainen kirkko' --SV
           ,'Evankelis-luterilainen kirkko' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Yhdistykset ja säätiöt' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto'),

		   (15
		   ,'AATTEELLINEN_YHDISTYS'
           ,'Aatteellinen yhdistys'
           ,NULL
           ,NULL
           ,'Aatteellinen yhdistys' --FI
           ,'Aatteellinen yhdistys' --SV
           ,'Aatteellinen yhdistys' --EN
           ,'Yhdistykset ja säätiöt' --FI
           ,'Yhdistykset ja säätiöt' --EN
           ,'Yhdistykset ja säätiöt' --SV
           ,'Yksityinen'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto')

GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_huoltajatiedot]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   procedure [dw].[p_lataa_f_varda_huoltajatiedot] AS

BEGIN TRANSACTION;

truncate table dw.f_varda_huoltajatiedot;



with  CTE as
		(select 
		2020 as aloitusvuosi,
		case when alkamis_pvm <= '2020-12-31' and
		                  (paattymis_pvm >= '2020-12-31' or paattymis_pvm < '1900-12-30')
						  then 2020
				else NULL end as tilastovuosi,
		maksutieto_id,
		mt.lapsi_id,
		la.henkilo_id * 50 as henkilo_id,
		yksityinen_jarjestaja,
		coalesce(mp.id, '-1') as d_maksun_peruste_id,
		-1 as d_maksun_luokka_id,
		palveluseteli_arvo,
		asiakasmaksu,
		perheen_koko,
		CAST(alkamis_pvm as date) as alkamis_pvm,
		Case when paattymis_pvm < '1900-12-30' then '9999-01-01'
			 else CAST(paattymis_pvm as date)
			 end as paattymis_pvm,
		null as cum_sum,
		'p_lataa_varda_huoltajatiedot' as source

--faktat
from varda_sa.sa.sa_varda_maksutieto mt
-- dimensiot
left join dw.d_varda_maksunperuste mp on mp.koodi = UPPER(mt.maksun_peruste_koodi)
join varda_sa.sa.sa_varda_lapsi la on la.lapsi_id = mt.lapsi_id

UNION ALL
	Select aloitusvuosi + 1,
	Case when alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
	          paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date)
		then aloitusvuosi + 1
		else null end as tilastovuosi,
	maksutieto_id,
	lapsi_id,
	henkilo_id,
	yksityinen_jarjestaja,
	d_maksun_peruste_id,
	d_maksun_luokka_id,
	palveluseteli_arvo,
	asiakasmaksu,
	perheen_koko,
	alkamis_pvm,
	paattymis_pvm,
	cum_sum,
	source

	from    CTE
        where   aloitusvuosi + 1 <= datepart(year, getdate()) 
		and alkamis_pvm <= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date) and 
		paattymis_pvm >= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date)

)

INSERT INTO [dw].[f_varda_huoltajatiedot] (
		   tilastovuosi
		   ,[maksutieto_id]
           ,[lapsi_id]
		   ,henkilo_id
           ,[yksityinen_jarjestaja]
           ,[d_maksun_peruste_id]
		   ,[d_maksun_luokka_id]
           ,[palveluseteli_arvo]
           ,[asiakasmaksu]
           ,[perheen_koko]
           ,[alkamis_pvm]
           ,[paattymis_pvm]
		   ,cum_sum
           ,[source]
 )
 
select tilastovuosi,
	maksutieto_id,
	lapsi_id,
	henkilo_id,
	yksityinen_jarjestaja,
	d_maksun_peruste_id,
	d_maksun_luokka_id,
	palveluseteli_arvo,
	asiakasmaksu,
	perheen_koko,
	alkamis_pvm,
	paattymis_pvm,
	cum_sum,
	source
	
	from CTE;

Update dw.f_varda_huoltajatiedot
       set d_maksun_luokka_id = case
	    when upper(vap.jarjestamismuoto_koodi) in ('JM01', 'JM02','JM03') and asiakasmaksu < (select min(max_arvo) from dw.d_varda_maksuluokka where tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta') then (select id from dw.d_varda_maksuluokka where koodi = 1 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta')
		when upper(vap.jarjestamismuoto_koodi) in ('JM01', 'JM02','JM03') and asiakasmaksu >= (select min(max_arvo) from dw.d_varda_maksuluokka where tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta') and asiakasmaksu < (select max(max_arvo) from dw.d_varda_maksuluokka where tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta') then (select id from dw.d_varda_maksuluokka where koodi = 2 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta')
	    when upper(vap.jarjestamismuoto_koodi) in ('JM01', 'JM02','JM03') and asiakasmaksu >= (select max(max_arvo) from dw.d_varda_maksuluokka where tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta') then (select id from dw.d_varda_maksuluokka where koodi = 3 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta')
	    when upper(vap.jarjestamismuoto_koodi) NOT in ('JM01', 'JM02','JM03') and asiakasmaksu < 290 then (select id from dw.d_varda_maksuluokka where koodi = 4 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Yksityinen')
		when upper(vap.jarjestamismuoto_koodi) NOT in ('JM01', 'JM02','JM03') and asiakasmaksu >= 290 and asiakasmaksu <= 400 then (select id from dw.d_varda_maksuluokka where koodi = 5 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Yksityinen')
	    when upper(vap.jarjestamismuoto_koodi) NOT in ('JM01', 'JM02','JM03') and asiakasmaksu >= 401 and asiakasmaksu <= 500 then (select id from dw.d_varda_maksuluokka where koodi = 6 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Yksityinen')
	    when upper(vap.jarjestamismuoto_koodi) NOT in ('JM01', 'JM02','JM03') and asiakasmaksu > 500 then (select id from dw.d_varda_maksuluokka where koodi = 7 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Yksityinen')
	    else -1 END
	   From dw.f_varda_huoltajatiedot
	   left join varda_sa.sa.sa_varda_lapsi la on la.lapsi_id = f_varda_huoltajatiedot.lapsi_id
	   left join varda_sa.sa.sa_varda_varhaiskasvatuspaatos vap on vap.lapsi_id = la.lapsi_id
	   where tilastovuosi >= 2020;


with CTE2 as (
  select alkamis_pvm,
  year(alkamis_pvm) as tilastovuosi,
  case when paattymis_pvm > '2100-12-30' then Dateadd(year, 1, getdate())
	   else paattymis_pvm
	   end as paattymis_pvm,
  lapsi_id,
  cast(asiakasmaksu as float) as asiakasmaksu
  from varda_sa.sa.sa_varda_maksutieto
  where  alkamis_pvm  < '2022-01-01' and paattymis_pvm >= '2021-01-01'
  Union all
  Select DATEADD(Month, 1, alkamis_pvm),
         year(DATEADD(Month, 1, alkamis_pvm)) as tilastovuosi,
		 paattymis_pvm,
		 lapsi_id,
		 asiakasmaksu
  from CTE2
  where dateadd(month, 1, alkamis_pvm) < paattymis_pvm
  )

update dw.f_varda_huoltajatiedot
		set cum_sum = CTE2_S.cum_sum
		from dw.f_varda_huoltajatiedot
		join (select  tilastovuosi, lapsi_id, sum(asiakasmaksu) AS cum_sum
	    from CTE2 where tilastovuosi > 2019 and tilastovuosi <= Year(getdate()) group by tilastovuosi, lapsi_id) CTE2_S 
		on CTE2_S.tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and CTE2_S.lapsi_id = f_varda_huoltajatiedot.lapsi_id
		option (maxrecursion 32000)

COMMIT;





GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_jarjestamismuoto]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE   procedure [dw].[p_lataa_f_varda_jarjestamismuoto] AS

truncate table dw.f_varda_jarjestamismuoto;

with  CTE as
		(select 
		2020 as aloitusvuosi,
		case when tp.alkamis_pvm <= '2020-12-31' and
		         (tp.paattymis_pvm >= '2020-12-31' or tp.paattymis_pvm = '') then 2020
				 else NULL end as tilastovuosi,
		case when tp.alkamis_pvm <= '2020-12-31' and
		         (tp.paattymis_pvm >= '2020-12-31' or tp.paattymis_pvm = '') then Concat(2020, '_', tp.organisaatio_oid)
				 else NULL end as tilastovuosi_toimipaikka_oid,
		tp.organisaatio_oid as toimipaikka_oid,
		tp.toimipaikka_id,
		case when lower(tp.jarjestamismuoto_koodi) like '%jm01%' then (select id from dw.d_varda_jarjestamismuoto where koodi = 'jm01')
		     else null
			 end as d_varda_jarjestamismuoto_id_jm01,
		case when lower(tp.jarjestamismuoto_koodi) like '%jm02%' then (select id from dw.d_varda_jarjestamismuoto where koodi = 'jm02')
		     else null
			 end as d_varda_jarjestamismuoto_id_jm02,
		case when lower(tp.jarjestamismuoto_koodi) like '%jm03%' then (select id from dw.d_varda_jarjestamismuoto where koodi = 'jm03')
		     else null
			 end as d_varda_jarjestamismuoto_id_jm03,
		case when lower(tp.jarjestamismuoto_koodi) like '%jm04%' then (select id from dw.d_varda_jarjestamismuoto where koodi = 'jm04')
		     else null
			  end as d_varda_jarjestamismuoto_id_jm04,
		case when lower(tp.jarjestamismuoto_koodi) like '%jm05%' then (select id from dw.d_varda_jarjestamismuoto where koodi = 'jm05')
		     else null
			  end as d_varda_jarjestamismuoto_id_jm05,
		tp.alkamis_pvm,
	    Case when tp.paattymis_pvm = '' then '9999-01-01'
			 else CAST(tp.paattymis_pvm as date)
			 end as paattymis_pvm,
		'p_lataa_f_varda_jarjestamismuoto' as source

	  --faktat
	  FROM varda_sa.sa.sa_varda_toimipaikka tp

	  union all
		select
		aloitusvuosi + 1,
		case when alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
		         paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date) then aloitusvuosi + 1
				 else NULL end as tilastovuosi,
		case when alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
		         paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date) then Concat(aloitusvuosi + 1, '_', toimipaikka_oid)
				 else NULL end as tilastovuosi_toimipaikka_oid,
		toimipaikka_oid,
		toimipaikka_id,
		d_varda_jarjestamismuoto_id_jm01,
		d_varda_jarjestamismuoto_id_jm02,
		d_varda_jarjestamismuoto_id_jm03,
		d_varda_jarjestamismuoto_id_jm04,
		d_varda_jarjestamismuoto_id_jm05,
		alkamis_pvm,
		paattymis_pvm,
		source

		from    CTE
			where   (aloitusvuosi + 1) <= datepart(year, getdate()) and
			        alkamis_pvm <= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date) and 
					paattymis_pvm >= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date)
	  )

INSERT INTO [dw].[f_varda_jarjestamismuoto] (
			tilastovuosi,
			d_varda_jarjestamismuoto_id_jm01,
			d_varda_jarjestamismuoto_id_jm02,
			d_varda_jarjestamismuoto_id_jm03,
			d_varda_jarjestamismuoto_id_jm04,
			d_varda_jarjestamismuoto_id_jm05,
			alkamis_pvm,
			paattymis_pvm,
			toimipaikka_id,
			tilastovuosi_toimipaikka_oid,
			source
 )
 
select tilastovuosi,
	   d_varda_jarjestamismuoto_id_jm01,
	   d_varda_jarjestamismuoto_id_jm02,
	   d_varda_jarjestamismuoto_id_jm03,
	   d_varda_jarjestamismuoto_id_jm04,
	   d_varda_jarjestamismuoto_id_jm05,
	   alkamis_pvm,
	   paattymis_pvm,
	   toimipaikka_id,
	   tilastovuosi_toimipaikka_oid,
	   source
	
	from CTE



GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_kielipainotus]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE   procedure [dw].[p_lataa_f_varda_kielipainotus] AS

truncate table dw.f_varda_kielipainotus;

with  CTE as
		(select 
		2020 as aloitusvuosi,
		case when kp.alkamis_pvm <= '2020-12-31' and
		         (kp.paattymis_pvm >= '2020-12-31' or kp.paattymis_pvm = '') then 2020
				 else NULL end as tilastovuosi,
		case when kp.alkamis_pvm <= '2020-12-31' and
		         (kp.paattymis_pvm >= '2020-12-31' or kp.paattymis_pvm = '') then Concat(2020, '_', tp.organisaatio_oid)
				 else NULL end as tilastovuosi_toimipaikka_oid,
		tp.organisaatio_oid as toimipaikka_oid,
		tp.toimipaikka_id,
		coalesce(kk.id, '-1') as d_varda_kielikoodistoopetushallinto_id,
		kp.alkamis_pvm,
	    Case when kp.paattymis_pvm = '' then '9999-01-01'
			 else CAST(kp.paattymis_pvm as date)
			 end as paattymis_pvm,
		'p_lataa_f_varda_kielipainotus' as source

	  --faktat
	  FROM varda_sa.sa.sa_varda_kielipainotus kp
	  inner join varda_sa.sa.sa_varda_toimipaikka tp on tp.toimipaikka_id = kp.toimipaikka_id

	  --dimensiot
	  left join dw.d_varda_kielikoodistoopetushallinto kk on kk.koodi = UPPER(kp.kielipainotus_koodi)

	  union all
		select
		aloitusvuosi + 1,
		case when alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
		         paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date) then aloitusvuosi + 1
				 else NULL end as tilastovuosi,
		case when alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
		         paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date) then Concat(aloitusvuosi + 1, '_', toimipaikka_oid)
				 else NULL end as tilastovuosi_toimipaikka_oid,
		toimipaikka_oid,
		toimipaikka_id,
		coalesce(d_varda_kielikoodistoopetushallinto_id, '-1') as d_varda_kielikoodistoopetushallinto_id,
		alkamis_pvm,
		paattymis_pvm,
		source

		from    CTE
			where   (aloitusvuosi + 1) <= datepart(year, getdate()) and
			        alkamis_pvm <= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date) and 
					paattymis_pvm >= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date)
	  )

INSERT INTO [dw].[f_varda_kielipainotus] (
			tilastovuosi,
			d_varda_kielikoodistoopetushallinto_id,
			alkamis_pvm,
			paattymis_pvm,
			toimipaikka_id,
			tilastovuosi_toimipaikka_oid,
			source
 )
 
select tilastovuosi,
	   d_varda_kielikoodistoopetushallinto_id,
       alkamis_pvm,
	   paattymis_pvm,
	   toimipaikka_id,
	   tilastovuosi_toimipaikka_oid,
	   source
	
	from CTE



GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_toimintapainotus]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










Create   procedure [dw].[p_lataa_f_varda_toimintapainotus] AS

delete from dw.f_varda_toimintapainotus;

with  CTE as
		(select 
		2020 as aloitusvuosi,
		case when topa.alkamis_pvm <= '2020-12-31' and
		         (topa.paattymis_pvm >= '2020-12-31' or topa.paattymis_pvm = '') then 2020
				 else NULL end as tilastovuosi,
		case when topa.alkamis_pvm <= '2020-12-31' and
		         (topa.paattymis_pvm >= '2020-12-31' or topa.paattymis_pvm = '') then Concat(2020, '_', tp.organisaatio_oid)
				 else NULL end as tilastovuosi_toimipaikka_oid,
		tp.organisaatio_oid as toimipaikka_oid,
		tp.toimipaikka_id,
		coalesce(toim.id, '-1') as d_varda_toiminnallinenpainotus_id,
		topa.alkamis_pvm,
	    case when topa.paattymis_pvm = '' then '9999-01-01'
		     else cast(topa.paattymis_pvm as date) end as paattymis_pvm,
		'p_lataa_f_varda_toimintapainotus' as source

	  --faktat
	  FROM varda_sa.sa.sa_varda_toimintapainotus topa
	  inner join varda_sa.sa.sa_varda_toimipaikka tp on tp.toimipaikka_id = topa.toimipaikka_id

	  --dimensiot
	  left join dw.d_varda_toiminnallinenpainotus toim on toim.koodi = UPPER(topa.toimintapainotus_koodi)

	  union all
		select
		aloitusvuosi + 1,
		case when alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
		         paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date) then aloitusvuosi + 1
				 else NULL end as tilastovuosi,
		case when alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
		         paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date) then Concat(aloitusvuosi + 1, '_', toimipaikka_oid)
				 else NULL end as tilastovuosi_toimipaikka_oid,
		toimipaikka_oid,
		toimipaikka_id,
		coalesce(d_varda_toiminnallinenpainotus_id, '-1') as d_varda_toiminnallinenpainotus_id,
		alkamis_pvm,
		paattymis_pvm,
		source

		from    CTE
			where   (aloitusvuosi + 1) <= datepart(year, getdate()) and
			        alkamis_pvm <= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date) and 
					paattymis_pvm >= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date)
	  )

INSERT INTO [dw].[f_varda_toimintapainotus] (
			tilastovuosi,
			d_varda_toiminnallinenpainotus_id,
			alkamis_pvm,
			paattymis_pvm,
			toimipaikka_id,
			tilastovuosi_toimipaikka_oid,
			source
 )
 
select tilastovuosi,
	   d_varda_toiminnallinenpainotus_id,
       alkamis_pvm,
	   paattymis_pvm,
	   toimipaikka_id,
	   tilastovuosi_toimipaikka_oid,
	   source
	
	from CTE



GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_vakajarjestajat_toimipaikat]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE   procedure [dw].[p_lataa_f_varda_vakajarjestajat_toimipaikat] AS

BEGIN TRANSACTION;

truncate table dw.f_varda_vakajarjestajat_toimipaikat;

with CTE as (

		   select  
	       2020 as aloitusvuosi,
		   case when tp.alkamis_pvm <= '2020-12-31' and
		             tp.paattymis_pvm >= '2020-12-31' then 2020
				else NULL end as tilastovuosi,
	       tp.toimipaikka_id as toimipaikka_id
		   ,vaj.organisaatio_oid as vakajarjestaja_oid
		   ,vaj.vakajarjestaja_id as vakajarjestaja_id
           ,Case when vaj.nimi = 'ENONTEKIÖN KUNTA' then 'Enontekiön kunta'
				 when vaj.nimi = 'PARIKKALAN KUNTA' then 'Parikkalan kunta'
				 else vaj.nimi
				 END as vakajarjestaja_nimi
           ,coalesce(alue.id, '-1') as d_alueluokitus_vakajarjestaja_kotikunta_id
           ,NULL as toimipaikka_nimi
           ,tp.organisaatio_oid as toimipaikka_oid
           ,coalesce(alue2.id, '-1') as d_alueluokitus_toimipaikka_kunta_id
           ,coalesce(kj.id, '-1') as d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id
           ,coalesce(tm.id, '-1') as d_varda_toimipaikka_toimintamuoto_id
           ,coalesce(yl.id, '-1') as d_varda_yritysluokitus_id
		   ,case when tp.varhaiskasvatuspaikat < 25   then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 1)
				 when tp.varhaiskasvatuspaikat < 50   then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 2)
				 when tp.varhaiskasvatuspaikat < 100  then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 3)
				 when tp.varhaiskasvatuspaikat < 150  then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 4)
				 when tp.varhaiskasvatuspaikat < 200  then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 5)
				 when tp.varhaiskasvatuspaikat < 250  then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 6)
				 when tp.varhaiskasvatuspaikat >= 250 then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 7)
				 else -1 end as d_varda_varhaiskasvatuspaikkaluokitus_id
		   ,coalesce(ol.id, '-1') as d_organisaatioluokitus_vakajarjestaja_id
		   ,tp.varhaiskasvatuspaikat
		   ,--pitää miettiä, mitä dimensiota käytetään ja tehdä tarvittaessa lataus, jossa myös ryhmittely. JS 12.5.2022
		   /*Case when yritysmuoto = 'OSAKEYHTIO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Osakeyhtiö')
				 when yritysmuoto = 'KOMMANDIITTIYHTIO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Kommandiittiyhtiö')
				 when yritysmuoto = 'SAATIO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Säätiö')
				 when yritysmuoto = 'PAIKALLISYHTEISO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Paikallisyhteisö')
				 when yritysmuoto = 'YKSITYINEN_ELINKEINONHARJOITTAJA' then (select id from dw.d_yritysmuoto where nimi_fi = 'Yksityinen elinkeinonharjoittaja')
				 when yritysmuoto = 'ORTODOKSINEN_KIRKKO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Ortodoksinen kirkko')
				 when yritysmuoto = 'OSUUSKUNTA' then (select id from dw.d_yritysmuoto where nimi_fi = 'Osuuskunta')
				 when yritysmuoto = 'USKONNOLLINEN_YHDYSKUNTA' then (select id from dw.d_yritysmuoto where nimi_fi = 'Uskonnollinen yhdyskunta')
				 when yritysmuoto = 'MUU_YHDISTYS' then (select id from dw.d_yritysmuoto where nimi_fi = 'Muu yhdistys')
				 when yritysmuoto = 'EI_YRITYSMUOTOA' then (select id from dw.d_yritysmuoto where nimi_fi = 'Ei yritysmuotoa')
				 when yritysmuoto = 'KUNTA' then (select id from dw.d_yritysmuoto where nimi_fi = 'Kunta')
				 when yritysmuoto = 'AVOIN_YHTIO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Avoin yhtiö')
				 when yritysmuoto = 'EV_LUT_KIRKKO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Ev.lut.kirkko')
				 when yritysmuoto = 'AATTEELLINEN_YHDISTYS' then (select id from dw.d_yritysmuoto where nimi_fi = 'Aatteellinen yhdistys')
				 else*/ -1
				 --end 
				 as d_yritysmuoto_id
           ,tp.alkamis_pvm
           ,tp.paattymis_pvm as paattymis_pvm
           ,'p_lataa_f_varda_vakajarjestajat_toimipaikat' as source

--faktat
from varda_sa.sa.sa_varda_vakajarjestaja vaj
inner join varda_sa.sa.sa_varda_toimipaikka tp on tp.vakajarjestaja_id = vaj.vakajarjestaja_id

-- dimensiot
left join dw.d_alueluokitus alue on alue.kunta_koodi = vaj.kunta_koodi
left join dw.d_alueluokitus alue2 on alue2.kunta_koodi = tp.kunta_koodi
left join dw.d_varda_kasvatusopillinenjarjestelma kj on kj.koodi = tp.kasvatusopillinen_jarjestelma_koodi
left join dw.d_varda_toimintamuoto tm on tm.koodi = tp.toimintamuoto_koodi
inner join dw.d_varda_yritysluokitus yl on yl.koodi = vaj.yritysmuoto --ei haluta mm. kuolinpesiä mukaan. AK 30.8.2022
left join dw.d_organisaatioluokitus ol on ol.organisaatio_oid = vaj.organisaatio_oid

UNION ALL
	Select aloitusvuosi + 1,
	Case when alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
	          paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date)
		then aloitusvuosi + 1
		else null end as tilastovuosi
	,toimipaikka_id
	,vakajarjestaja_oid
	,vakajarjestaja_id
    ,vakajarjestaja_nimi
    ,coalesce(d_alueluokitus_vakajarjestaja_kotikunta_id, '-1') as d_alueluokitus_vakajarjestaja_kotikunta_id
    ,NULL as toimipaikka_nimi
    ,toimipaikka_oid
    ,coalesce(d_alueluokitus_toimipaikka_kunta_id, '-1') as d_alueluokitus_toimipaikka_kunta_id
    ,coalesce(d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id, '-1') as d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id
    ,coalesce(d_varda_toimipaikka_toimintamuoto_id, '-1') as d_varda_toimipaikka_toimintamuoto_id
    ,coalesce(d_varda_yritysluokitus_id, '-1') as d_varda_yritysluokitus_id
	,coalesce(d_varda_varhaiskasvatuspaikkaluokitus_id, '-1') as d_varda_varhaiskasvatuspaikkaluokitus_id
    ,coalesce(d_organisaatioluokitus_vakajarjestaja_id, '-1') as d_organisaatioluokitus_vakajarjestaja_id
	,varhaiskasvatuspaikat
    ,d_yritysmuoto_id
    ,alkamis_pvm
    ,paattymis_pvm
    ,'p_lataa_f_varda_vakajarjestajat_toimipaikat' as source
	
	from    CTE
        where   aloitusvuosi + 1 <= datepart(year, getdate()) 
		and alkamis_pvm <= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date) and 
		paattymis_pvm >= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date)
)


INSERT INTO [dw].[f_varda_vakajarjestajat_toimipaikat]
           ( tilastovuosi
		   ,[toimipaikka_id]
		   ,[vakajarjestaja_oid]
		   ,vakajarjestaja_id
           ,[vakajarjestaja_nimi]
           ,d_alueluokitus_vakajarjestaja_kunta_id
           ,[toimipaikka_nimi]
           ,[toimipaikka_oid]
           ,[d_alueluokitus_toimipaikka_kunta_id]
           ,[d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id]
           ,[d_varda_toimipaikka_toimintamuoto_id]
		   ,[d_varda_yritysluokitus_id]
		   ,d_varda_varhaiskasvatuspaikkaluokitus_id
		   ,d_organisaatioluokitus_vakajarjestaja_id
           ,[varhaiskasvatuspaikat]
		   ,d_yritysmuoto_id
           ,[alkamis_pvm]
           ,[paattymis_pvm]
           ,[source])

select  tilastovuosi
		   ,[toimipaikka_id]
		   ,[vakajarjestaja_oid]
		   ,vakajarjestaja_id
           ,[vakajarjestaja_nimi]
           ,d_alueluokitus_vakajarjestaja_kotikunta_id
           ,[toimipaikka_nimi]
           ,[toimipaikka_oid]
           ,[d_alueluokitus_toimipaikka_kunta_id]
           ,[d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id]
           ,[d_varda_toimipaikka_toimintamuoto_id]
		   ,[d_varda_yritysluokitus_id]
		   ,d_varda_varhaiskasvatuspaikkaluokitus_id
		   ,d_organisaatioluokitus_vakajarjestaja_id
           ,[varhaiskasvatuspaikat]
		   ,d_yritysmuoto_id
           ,[alkamis_pvm]
           ,[paattymis_pvm]
           ,[source]
		 from CTE

update dw.f_varda_vakajarjestajat_toimipaikat set d_varda_toimipaikkaluokitus_id =
		case when (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) = 1 then (select id from dw.d_varda_toimipaikkaluokitus where koodi = 1)
		     when (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) > 1 and (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) < 4 then (select id from dw.d_varda_toimipaikkaluokitus where koodi = 2)
		     when (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) > 3 and (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) < 11 then (select id from dw.d_varda_toimipaikkaluokitus where koodi = 3)
		     when (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) > 10 and (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) < 21 then (select id from dw.d_varda_toimipaikkaluokitus where koodi = 4)
		     when (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) >= 21 then (select id from dw.d_varda_toimipaikkaluokitus where koodi = 5)
		else -1 end

COMMIT;










GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_vakasuhteet_vakapaatokset]    Script Date: 15.9.2022 16:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dw].[p_lataa_f_varda_vakasuhteet_vakapaatokset] AS

truncate table dw.f_varda_vakasuhteet_vakapaatokset;

with CTE as (
		select
		2020 as aloitusvuosi,
	    case when vas.paattymis_pvm > tp.paattymis_pvm and
		          vas.alkamis_pvm <= '2020-12-31' and
		          tp.paattymis_pvm >= '2020-12-31' then 2020
			when vas.paattymis_pvm <= tp.paattymis_pvm and
			     vas.alkamis_pvm <= '2020-12-31' and
		         vas.paattymis_pvm >= '2020-12-31' then 2020
				else NULL end as tilastovuosi,
        he.henkilo_id * 50 as henkilo_id,
		lapsi.lapsi_id,
		coalesce(alue.id, '-1') as d_alueluokitus_kotikunta,
		he.syntyma_pvm,
		case when DATEDIFF(year,he.syntyma_pvm, cast('2020-12-31' as date)) < 3 then				(select id from dw.d_varda_ikaryhma where koodi = 1)
		   when DATEDIFF(year,he.syntyma_pvm, cast('2020-12-31' as date)) between 3 and 5 then	(select id from dw.d_varda_ikaryhma where koodi = 2)
		   when DATEDIFF(year,he.syntyma_pvm, cast('2020-12-31' as date)) = 6 then				(select id from dw.d_varda_ikaryhma where koodi = 3)
		   when DATEDIFF(year,he.syntyma_pvm, cast('2020-12-31' as date)) > 6 then				(select id from dw.d_varda_ikaryhma where koodi = 4)
		   else null end as d_ikaryhma_id,
		coalesce(kieli.id, '-1') as d_kieli_aidinkieli,
		sukup.id as d_sukupuoli,
		CASE WHEN (lapsi.vakatoimija_id IS NULL or lapsi.vakatoimija_id = 0) and lapsi.oma_organisaatio_id is null then tp.vakajarjestaja_id
	  		 WHEN (lapsi.vakatoimija_id IS NULL or lapsi.vakatoimija_id = 0) and lapsi.oma_organisaatio_id is not null then lapsi.oma_organisaatio_id
			 ELSE lapsi.vakatoimija_id
			 END as vakajarjestaja_id,
		yl.id as d_varda_yritysluokitus_id,
		vap.alkamis_pvm as vakapaatos_alkamis_pvm,
		vap.hakemus_pvm as vakapaatos_hakemus_pvm,
		vap.paattymis_pvm as vakapaatos_paattymis_pvm,
		jm.id as d_jarjestamismuoto_id_vakapaatos,
		case when vap.vuorohoito_kytkin = 'f' then (select id from dw.d_kytkin where kytkin_koodi = '0')
	    	 when vap.vuorohoito_kytkin = 't' then (select id from dw.d_kytkin where kytkin_koodi = '1')
			 else -1
			 end as d_kytkin_vakapaatos_vuorohoito,

		case when vap.kokopaivainen_vaka_kytkin = 'f' then (select id from dw.d_varda_kytkin where kytkin_koodi = '0' and kytkin_luokka = 'vakapaatos_kokopaivainen_vaka')
	    	 when vap.kokopaivainen_vaka_kytkin = 't' then (select id from dw.d_varda_kytkin where kytkin_koodi = '1' and kytkin_luokka = 'vakapaatos_kokopaivainen_vaka')
			 else -1
			 end as d_varda_kytkin_vakapaatos_kokopaivainen_vaka,
		
		case when vap.paivittainen_vaka_kytkin = 'f' then (select id from dw.d_varda_kytkin where kytkin_koodi = '0' and kytkin_luokka = 'vakapaatos_paivittainen_vaka')
	    	 when vap.paivittainen_vaka_kytkin = 't' then (select id from dw.d_varda_kytkin where kytkin_koodi = '1' and kytkin_luokka = 'vakapaatos_paivittainen_vaka')
			 else -1
			 end as d_varda_kytkin_vakapaatos_paivittainen_vaka,
		
		case when vap.pikakasittely_kytkin = 'f' then (select id from dw.d_kytkin where kytkin_koodi = '0')
	    	 when vap.pikakasittely_kytkin = 't' then (select id from dw.d_kytkin where kytkin_koodi = '1')
			 else -1
			 end as d_kytkin_vakapaatos_pikakasittely,
		cast(vap.tuntimaara_viikossa as float) as vakapaatos_tuntimaara_viikossa,
	    case when cast(vap.tuntimaara_viikossa as float)  < 25 then (select id from dw.d_varda_tuntimaara_asteikko where koodi = 1)
		   when cast(vap.tuntimaara_viikossa as float)  between 25 and 35 then (select id from dw.d_varda_tuntimaara_asteikko where koodi = 2)
		   when cast(vap.tuntimaara_viikossa as float)  > 35 then (select id from dw.d_varda_tuntimaara_asteikko where koodi = 3)
		   end as d_tuntimaara_asteikko_id,
		vas.varhaiskasvatussuhde_id,
		vas.alkamis_pvm as vakasuhde_alkamis_pvm,
		vas.paattymis_pvm as vakasuhde_paattymis_pvm,
		tp.alkamis_pvm as toimipaikka_alkamis_pvm,
		tp.paattymis_pvm as toimipaikka_paattymis_pvm,
		vas.toimipaikka_id as vakasuhde_toimipaikka_id,
		'p_lataa_varda_vakapaatokset_ja_suhteet' as source

--faktat
from varda_sa.sa.sa_varda_henkilo he
inner join varda_sa.sa.sa_varda_lapsi lapsi on lapsi.henkilo_id = he.henkilo_id
inner join varda_sa.sa.sa_varda_varhaiskasvatuspaatos vap on vap.lapsi_id = lapsi.lapsi_id
inner join varda_sa.sa.sa_varda_varhaiskasvatussuhde vas on vas.varhaiskasvatuspaatos_id = vap.varhaiskasvatuspaatos_id
inner join varda_sa.sa.sa_varda_toimipaikka tp on tp.toimipaikka_id = vas.toimipaikka_id
inner join varda_sa.sa.sa_varda_vakajarjestaja vj on tp.vakajarjestaja_id = vj.vakajarjestaja_id

-- dimensiot
left join dw.d_sukupuoli sukup on sukup.sukupuoli_koodi = he.sukupuoli_koodi
left join dw.d_alueluokitus alue on alue.kunta_koodi = he.kotikunta_koodi
left join dw.d_varda_kielikoodistoopetushallinto kieli on kieli.koodi = upper(he.aidinkieli_koodi)
left join dw.d_varda_jarjestamismuoto jm on jm.koodi = upper(vap.jarjestamismuoto_koodi)
left join dw.d_kytkin kytkin on kytkin.kytkin_koodi = vap.vuorohoito_kytkin
left join dw.d_kytkin kytkin2 on kytkin2.kytkin_koodi = vap.kokopaivainen_vaka_kytkin
left join dw.d_kytkin kytkin3 on kytkin3.kytkin_koodi = vap.paivittainen_vaka_kytkin
left join dw.d_kytkin kytkin4 on kytkin4.kytkin_koodi = vap.pikakasittely_kytkin
inner join dw.d_varda_yritysluokitus yl on yl.koodi = vj.yritysmuoto

UNION ALL
     Select
		aloitusvuosi + 1,
		Case when toimipaikka_paattymis_pvm < vakasuhde_paattymis_pvm and
				  vakasuhde_alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
	              toimipaikka_paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date)
			 then aloitusvuosi + 1
			 when vakasuhde_alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
	              vakasuhde_paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date)
			then aloitusvuosi + 1
		else null end as tilastovuosi,
        henkilo_id,
		lapsi_id,
		coalesce(d_alueluokitus_kotikunta, '-1') as d_alueluokitus_kotikunta,
		syntyma_pvm,
		case when DATEDIFF(year,syntyma_pvm, cast(concat(aloitusvuosi + 1, '-12-31') as date)) < 3 then				(select id from dw.d_varda_ikaryhma where koodi = 1)
		   when DATEDIFF(year,syntyma_pvm, cast(concat(aloitusvuosi + 1, '-12-31') as date)) between 3 and 5 then	(select id from dw.d_varda_ikaryhma where koodi = 2)
		   when DATEDIFF(year,syntyma_pvm, cast(concat(aloitusvuosi + 1, '-12-31') as date)) = 6 then				(select id from dw.d_varda_ikaryhma where koodi = 3)
		   when DATEDIFF(year,syntyma_pvm, cast(concat(aloitusvuosi + 1, '-12-31') as date)) > 6 then				(select id from dw.d_varda_ikaryhma where koodi = 4)
		   else null end as d_ikaryhma_id,
		coalesce(d_kieli_aidinkieli, '-1') as d_kieli_aidinkieli,
		d_sukupuoli,
	    vakajarjestaja_id,
		d_varda_yritysluokitus_id,
		vakapaatos_alkamis_pvm,
		vakapaatos_hakemus_pvm,
		vakapaatos_paattymis_pvm,
		d_jarjestamismuoto_id_vakapaatos,
		d_kytkin_vakapaatos_vuorohoito,
		d_varda_kytkin_vakapaatos_kokopaivainen_vaka,
		d_varda_kytkin_vakapaatos_paivittainen_vaka,
		d_kytkin_vakapaatos_pikakasittely,
		vakapaatos_tuntimaara_viikossa,
		d_tuntimaara_asteikko_id,
		varhaiskasvatussuhde_id,
		vakasuhde_alkamis_pvm,
		vakasuhde_paattymis_pvm,
		toimipaikka_alkamis_pvm,
		toimipaikka_paattymis_pvm,
		vakasuhde_toimipaikka_id,
		'p_lataa_varda_vakapaatokset_ja_suhteet' as source

		from CTE
		where   aloitusvuosi + 1 <= datepart(year, getdate()) 
				and vakasuhde_alkamis_pvm <= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date) and 
				vakasuhde_paattymis_pvm >= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date)
)

INSERT INTO [dw].[f_varda_vakasuhteet_vakapaatokset] (
	   tilastovuosi
	  ,[henkilo_id]
	  ,lapsi_id
      ,[d_alueluokitus_kotikunta]
      ,[henkilo_syntyma_pvm]
	  ,d_ikaryhma_id
      ,[d_kieli_aidinkieli]
      ,[d_sukupuoli]
	  ,[vakajarjestaja_id]
	  ,d_varda_yritysluokitus_id
      ,[vakapaatos_alkamis_pvm]
      ,[vakapaatos_hakemus_pvm]
      ,[vakapaatos_paattymis_pvm]
      ,[d_jarjestamismuoto_id_vakapaatos]
      ,[d_kytkin_vakapaatos_vuorohoito]
      ,[d_varda_kytkin_vakapaatos_kokopaivainen_vaka]
      ,[d_varda_kytkin_vakapaatos_paivittainen_vaka]
      ,[d_kytkin_vakapaatos_pikakasittely]
      ,[vakapaatos_tuntimaara_viikossa]
	  ,d_tuntimaara_asteikko_id
	  ,[vakasuhde_id]
      ,[vakasuhde_alkamis_pvm]
      ,[vakasuhde_paattymis_pvm]
      ,[vakasuhde_toimipaikka_id]
	  ,source
 )

select tilastovuosi
	  ,[henkilo_id]
	  ,lapsi_id
      ,[d_alueluokitus_kotikunta]
      ,[syntyma_pvm]
	  ,d_ikaryhma_id
      ,[d_kieli_aidinkieli]
      ,[d_sukupuoli]
	  ,[vakajarjestaja_id]
	  ,d_varda_yritysluokitus_id
      ,[vakapaatos_alkamis_pvm]
      ,[vakapaatos_hakemus_pvm]
      ,[vakapaatos_paattymis_pvm]
      ,[d_jarjestamismuoto_id_vakapaatos]
      ,[d_kytkin_vakapaatos_vuorohoito]
      ,[d_varda_kytkin_vakapaatos_kokopaivainen_vaka]
      ,[d_varda_kytkin_vakapaatos_paivittainen_vaka]
      ,[d_kytkin_vakapaatos_pikakasittely]
      ,[vakapaatos_tuntimaara_viikossa]
	  ,d_tuntimaara_asteikko_id
	  ,varhaiskasvatussuhde_id
      ,[vakasuhde_alkamis_pvm]
      ,[vakasuhde_paattymis_pvm]
      ,[vakasuhde_toimipaikka_id]
	  ,source 

from CTE


















GO
