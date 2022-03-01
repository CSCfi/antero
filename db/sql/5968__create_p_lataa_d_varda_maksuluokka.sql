USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_maksuluokka]    Script Date: 1.3.2022 15.03.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE or ALTER procedure [dw].[p_lataa_d_varda_maksuluokka] AS

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
           ,'Käännös puuttuu'
           ,'Käännös puuttuu'
           ,'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä'
           ,'Käännös puuttuu'
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
           ,'Käännös puuttuu'
           ,'Käännös puuttuu'
           ,'Enimmäismaksu'
           ,'Käännös puuttuu'
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
           ,'Käännös puuttuu'
           ,'Käännös puuttuu'
           ,'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä'
           ,'Käännös puuttuu'
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
           ,'Käännös puuttuu'
           ,'Käännös puuttuu'
           ,'Enimmäismaksu'
           ,'Käännös puuttuu'
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


