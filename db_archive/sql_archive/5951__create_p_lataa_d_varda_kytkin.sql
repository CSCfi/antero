USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_kytkin]    Script Date: 28.2.2022 16.40.17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE or alter procedure [dw].[p_lataa_d_varda_kytkin] AS

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
		   ,'SV Osapäiväinen varhaiskasvatus'
           ,2
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_kytkin'),
           (2
		   ,'vakapaatos_kokopaivainen_vaka'
		   ,'1'
           ,'Kokopäiväinen varhaiskasvatus'
           ,'EN Kokopäiväinen varhaiskasvatus'
		   ,'SV Kokopäiväinen varhaiskasvatus'
           ,1
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_kytkin'),
           (3
		   ,'vakapaatos_paivittainen_vaka'
		   ,'0'
           ,'Osaviikkoinen varhaiskasvatus'
           ,'EN Osaviikkoinen varhaiskasvatus'
		   ,'SV Osaviikkoinen varhaiskasvatus'
           ,2
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_kytkin'),
           (4
		   ,'vakapaatos_paivittainen_vaka'
		   ,'1'
           ,'Päivittäinen varhaiskasvatus'
           ,'EN Päivittäinen varhaiskasvatus'
		   ,'SV Päivittäinen varhaiskasvatus'
           ,1
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_kytkin')



