USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_yritysluokitus]    Script Date: 28.2.2022 16.43.35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

















Create or ALTER procedure [dw].[p_lataa_d_varda_yritysluokitus] AS

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
