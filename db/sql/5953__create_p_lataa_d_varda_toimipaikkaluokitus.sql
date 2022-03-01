USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_toimipaikkaluokitus]    Script Date: 28.2.2022 16.42.07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

















CREATE or alter procedure [dw].[p_lataa_d_varda_toimipaikkaluokitus] AS

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
           ,'1 toimipaikka' --SV
           ,'1 toimipaikka' --EN
           ,'1 toimipaikka'  --FI
		   ,'1 toimipaikka'  --EN
           ,'1 toimipaikka'  --SV
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_d_varda_toimipaikkaluokitus'),

		   ('2'
           ,'2-3 toimipaikkaa' --FI
           ,'2-3 toimipaikkaa' --SV
           ,'2-3 toimipaikkaa' --EN
           ,'2-3 toimipaikkaa'  --FI
		   ,'2-3 toimipaikkaa'  --EN
           ,'2-3 toimipaikkaa'  --SV
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_d_varda_toimipaikkaluokitus'),

		   		   ('3'
           ,'4-10 toimipaikkaa' --FI
           ,'4-10 toimipaikkaa' --SV
           ,'4-10 toimipaikkaa' --EN
           ,'4-10 toimipaikkaa' --FI
           ,'4-10 toimipaikkaa' --EN
           ,'4-10 toimipaikkaa' --SV
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_d_varda_toimipaikkaluokitus'),

		   ('4'
           ,'11-20 toimipaikkaa' --FI
           ,'11-20 toimipaikkaa' --SV
           ,'11-20 toimipaikkaa' --EN
           ,'11-20 toimipaikkaa' --FI
           ,'11-20 toimipaikkaa' --EN
           ,'11-20 toimipaikkaa' --SV
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_d_varda_toimipaikkaluokitus'),

		   		   ('5'
           ,'Yli 20 toimipaikkaa' --FI
           ,'Yli 20 toimipaikkaa' --SV
           ,'Yli 20 toimipaikkaa' --EN
           ,'Yli 20 toimipaikkaa'  --FI
           ,'Yli 20 toimipaikkaa'  --EN
           ,'Yli 20 toimipaikkaa'  --SV
           ,'2021-03-23'
           ,NULL
		   ,'p_lataa_d_varda_toimipaikkaluokitus')

GO


