USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_varda_koodistot]    Script Date: 15.9.2022 16:30:21 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_varda_koodistot]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_varda_koodistot]    Script Date: 15.9.2022 16:30:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE procedure [dw].[p_lataa_varda_koodistot] as 

truncate table dw.d_varda_jarjestamismuoto
INSERT INTO [dw].[d_varda_jarjestamismuoto]
           ([koodi]
           ,[nimi_fi]
           ,[nimi_sv]
           ,[nimi_en]
           ,[kuvaus_fi]
           ,[kuvaus_sv]
           ,[kuvaus_en]
		   ,jarj_nro
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
	  ,convert(int, RIGHT(koodi,2))
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
		   ,jarj_nro
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
	  ,convert(int, RIGHT(koodi,2))
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
		   ,jarjestys
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
	  ,convert(int, RIGHT(koodi,2))
	  ,'p_lataa_varda_koodistot' as [Source]
  FROM [ANTERO].[sa].[sa_varda_koodistot]
  where koodisto = 'vardatoimintamuoto'

;

truncate table dw.d_varda_tutkinto
INSERT INTO [dw].[d_varda_tutkinto]
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
  where koodisto = 'vardatutkinto'

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
truncate table dw.d_varda_tehtavanimike
INSERT INTO [dw].[d_varda_tehtavanimike]
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
  where koodisto = 'vardatehtavanimike'
;
truncate table dw.d_varda_kielikoodistoopetushallinto
INSERT INTO [dw].[d_varda_kielikoodistoopetushallinto]
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
	  ,Case when koodi = 'FI' then 1
			when koodi = 'SV' then 2
			when koodi = 'SE' then 3
			when koodi = 'SEIN' then 4
			when koodi = 'SEKO' then 5
			when koodi = 'SEPO' then 6
			when koodi = 'VK' then 7
			when koodi = 'EN' then 8
			when koodi = 'XX' then 9
			else NULL end as jarj_nro
	  ,'p_lataa_varda_koodistot' as [Source]
  FROM [ANTERO].[sa].[sa_varda_koodistot]
  where koodisto = 'kielikoodistoopetushallinto'

truncate table dw.d_varda_maksunperuste
INSERT INTO [dw].[d_varda_maksunperuste]
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
  where koodisto = 'vardamaksunperuste'



GO


