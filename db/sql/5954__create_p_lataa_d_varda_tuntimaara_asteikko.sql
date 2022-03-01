USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_tuntimaara_asteikko]    Script Date: 28.2.2022 16.42.37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















CREATE or alter procedure [dw].[p_lataa_d_varda_tuntimaara_asteikko] AS

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
           ,'Alle 25 h'
           ,'Alle 25 h'
		   ,'Alle 25 h'
           ,'Alle 25 h'
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
           ,'Yli 35 h'
           ,'Yli 35 h'
		   ,'Yli 35 h'
           ,'Yli 35 h'
           ,'Yli 35 h'
           ,3
		   ,'2019-01-01'
           ,NULL
		   ,'p_lataa_d_varda_tuntimaara_asteikko')

