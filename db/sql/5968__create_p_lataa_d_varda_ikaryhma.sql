USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_ikaryhma]    Script Date: 28.2.2022 16.34.18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE or alter procedure [dw].[p_lataa_d_varda_ikaryhma] AS

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
           ,'Alle 3 vuotta'
           ,'Younger than 3 years'
		   ,'Alle 3 vuotta'
           ,'Alle 3 vuotta'
           ,'Alle 3 vuotta'
           ,1
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_ikaryhma'),
		   (2
		   ,2
		   ,'3 - 5 vuotta'
           ,'3 - 5 vuotta'
           ,'3 - 5 years'
		   ,'3 - 5 vuotta'
           ,'3 - 5 vuotta'
           ,'3 - 5 vuotta'
           ,2
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_ikaryhma'),
           (3
		   ,3
		   ,'6 vuotta'
           ,'6 vuotta'
           ,'6 years'
		   ,'6 vuotta'
           ,'6 vuotta'
           ,'6 vuotta'
           ,3
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_ikaryhma'),
		  (4
		   ,4
		   ,'7 vuotta ja yli'
           ,'7 vuotta ja yli'
           ,'7 vuotta ja yli'
		   ,'7 vuotta ja yli'
           ,'7 vuotta ja yli'
           ,'7 vuotta ja yli'
           ,4
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_ikaryhma')



