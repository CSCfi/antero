USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_yritysluokitus]    Script Date: 30.3.2023 14:27:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER   procedure [dw].[p_lataa_d_varda_yritysluokitus] AS


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
		   ,[yritys_tyyppi_sv]
		   ,[yritys_tyyppi_en]
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
		   ,'Privat'
		   ,'Private'
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
		   ,'Privat'
		   ,'Private'
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
		   ,'Privat'
		   ,'Private'
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
		   ,'Privat'
		   ,'Private'
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
		   ,'Privat'
		   ,'Private'
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
		   ,'Privat'
		   ,'Private'
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
		   ,'Privat'
		   ,'Private'
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
		   ,'Privat'
		   ,'Private'
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
		   ,'Privat'
		   ,'Private'
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
		   ,'Privat'
		   ,'Private'
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
		   ,'Kommun'
		   ,'Municipality'
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
		   ,'Kommun'
		   ,'Municipality'
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
		   ,'Privat'
		   ,'Private'
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
		   ,'Privat'
		   ,'Private'
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
		   ,'Privat'
		   ,'Private'
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_varda_yritysmuoto')


/*
 update [ANTERO].[dw].[d_varda_yritysluokitus]
 set nimi_sv = nimi_fi, nimi_en = nimi_fi
*/




GO


