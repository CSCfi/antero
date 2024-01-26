USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_varhaiskasvatuspaikkaluokitus]    Script Date: 28.2.2022 16.43.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















CREATE or ALTER procedure [dw].[p_lataa_d_varda_varhaiskasvatuspaikkaluokitus] AS

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



