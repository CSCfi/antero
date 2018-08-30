USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_varda_koodistot]    Script Date: 30.7.2018 14:37:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_varda_koodistot]') AND type in (N'P', N'PC'))
BEGIN

EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_varda_koodistot] AS' 
END
GO

ALTER procedure [dw].[p_lataa_varda_koodistot] as 

truncate table dw.d_varda_jarjestamismuoto
INSERT INTO [dw].[d_varda_jarjestamismuoto]
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
select
      [koodi]
      ,[nimi_fi]
      ,[nimi_sv]
      ,[nimi_en]
      ,[kuvaus_fi]
      ,[kuvaus_sv]
      ,[kuvaus_en]
      ,[alkupvm]
      ,[loppupvm]
	  ,'p_lataa_varda_koodistot' as [Source]
  FROM [ANTERO].[sa].[sa_varda_koodistot]
  where koodisto = 'vardajarjestamismuoto'

;

truncate table dw.d_varda_kasvatusopillinenjarjestelma
INSERT INTO [dw].[d_varda_kasvatusopillinenjarjestelma]
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
select
      [koodi]
      ,[nimi_fi]
      ,[nimi_sv]
      ,[nimi_en]
      ,[kuvaus_fi]
      ,[kuvaus_sv]
      ,[kuvaus_en]
      ,[alkupvm]
      ,[loppupvm]
	  ,'p_lataa_varda_koodistot' as [Source]
  FROM [ANTERO].[sa].[sa_varda_koodistot]
  where koodisto = 'vardakasvatusopillinenjarjestelma'

;

truncate table dw.d_varda_toiminnallinenpainotus
INSERT INTO [dw].[d_varda_toiminnallinenpainotus]
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
select
      [koodi]
      ,[nimi_fi]
      ,[nimi_sv]
      ,[nimi_en]
      ,[kuvaus_fi]
      ,[kuvaus_sv]
      ,[kuvaus_en]
      ,[alkupvm]
      ,[loppupvm]
	  ,'p_lataa_varda_koodistot' as [Source]
  FROM [ANTERO].[sa].[sa_varda_koodistot]
  where koodisto = 'vardatoiminnallinenpainotus'

;

truncate table dw.d_varda_toimintamuoto
INSERT INTO [dw].[d_varda_toimintamuoto]
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
select
      [koodi]
      ,[nimi_fi]
      ,[nimi_sv]
      ,[nimi_en]
      ,[kuvaus_fi]
      ,[kuvaus_sv]
      ,[kuvaus_en]
      ,[alkupvm]
      ,[loppupvm]
	  ,'p_lataa_varda_koodistot' as [Source]
  FROM [ANTERO].[sa].[sa_varda_koodistot]
  where koodisto = 'vardatoimintamuoto'

;

truncate table dw.d_varda_tutkintonimike
INSERT INTO [dw].[d_varda_tutkintonimike]
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
select
      [koodi]
      ,[nimi_fi]
      ,[nimi_sv]
      ,[nimi_en]
      ,[kuvaus_fi]
      ,[kuvaus_sv]
      ,[kuvaus_en]
      ,[alkupvm]
      ,[loppupvm]
	  ,'p_lataa_varda_koodistot' as [Source]
  FROM [ANTERO].[sa].[sa_varda_koodistot]
  where koodisto = 'vardatutkintonimike'

;

truncate table dw.d_varda_tyoaika
INSERT INTO [dw].[d_varda_tyoaika]
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
select
      [koodi]
      ,[nimi_fi]
      ,[nimi_sv]
      ,[nimi_en]
      ,[kuvaus_fi]
      ,[kuvaus_sv]
      ,[kuvaus_en]
      ,[alkupvm]
      ,[loppupvm]
	  ,'p_lataa_varda_koodistot' as [Source]
  FROM [ANTERO].[sa].[sa_varda_koodistot]
  where koodisto = 'vardatyoaika'

;
truncate table dw.d_varda_tyosuhde
INSERT INTO [dw].[d_varda_tyosuhde]
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
select
      [koodi]
      ,[nimi_fi]
      ,[nimi_sv]
      ,[nimi_en]
      ,[kuvaus_fi]
      ,[kuvaus_sv]
      ,[kuvaus_en]
      ,[alkupvm]
      ,[loppupvm]
	  ,'p_lataa_varda_koodistot' as [Source]
  FROM [ANTERO].[sa].[sa_varda_koodistot]
  where koodisto = 'vardatyosuhde'
;
truncate table dw.d_varda_tyotehtava
INSERT INTO [dw].[d_varda_tyotehtava]
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
select
      [koodi]
      ,[nimi_fi]
      ,[nimi_sv]
      ,[nimi_en]
      ,[kuvaus_fi]
      ,[kuvaus_sv]
      ,[kuvaus_en]
      ,[alkupvm]
      ,[loppupvm]
	  ,'p_lataa_varda_koodistot' as [Source]
  FROM [ANTERO].[sa].[sa_varda_koodistot]
  where koodisto = 'vardatyotehtava'




GO


