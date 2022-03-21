USE [ANTERO]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_ytj_yritystiedot]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_ytj_yritystiedot]    Script Date: 14.12.2020 17:09:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dw].[p_lataa_d_ytj_yritystiedot] AS

TRUNCATE TABLE ANTERO.dw.d_ytj_yritystiedot

INSERT INTO ANTERO.dw.d_ytj_yritystiedot
SELECT ytj.[id]
      ,[ytunnus] = COALESCE([ytunnus], 'Tuntematon')
      ,[toiminimi] = COALESCE([toiminimi], 'Tuntematon')
      ,[posti_postinumero] = COALESCE([posti_postinumero], 'Tuntematon')
      ,[posti_maa] = COALESCE([posti_maa], 'Tuntematon')
      ,[posti_toimipaikka] = COALESCE([posti_toimipaikka], 'Tuntematon')
      ,[kaynti_postinumero] = COALESCE([kaynti_postinumero], 'Tuntematon')
      ,[kaynti_maa] = COALESCE([kaynti_maa], 'Tuntematon')
      ,[kaynti_toimipaikka] = COALESCE([kaynti_toimipaikka], 'Tuntematon')
      ,[yrityslopetettu] = COALESCE([yrityslopetettu], -1)
      ,[yrityslopetettu_pvm] = COALESCE(d2.id, -1)
      ,[yritysmuoto_seloste] = COALESCE([yritysmuoto_seloste], 'Tuntematon')
      ,[yritysmuoto_koodi] = COALESCE([yritysmuoto_koodi], -1)
      ,[kotipaikkakunta_seloste] = COALESCE([kotipaikka_seloste], 'Tuntematon')
      ,[kotipaikkakunta_koodi] = COALESCE([kotipaikka_koodi], -1)
      ,[toimiala_seloste] = COALESCE([toimiala_seloste], 'Tuntematon')
      ,[toimiala_koodi] = (COALESCE([toimiala_koodi], '-1'))
      ,[kieli_seloste] = COALESCE([kieli_seloste], 'Tuntematon')
      ,[elinkeinotoimintalopetettu_pvm] = COALESCE(d1.id, -1)
      ,[loadtime] = GETDATE()
      ,[source] = 'p_lataa_d_ytj_yritystiedot'
--	  ,username
FROM Koski_SA.sa.sa_ytj_yritystiedot ytj 
LEFT JOIN ANTERO.dw.d_kalenteri d1 
	ON COALESCE(ytj.elinkeinotoimintalopetettu_pvm, '9999-12-31') = d1.kalenteri_avain
LEFT JOIN ANTERO.dw.d_kalenteri d2
	ON COALESCE(ytj.yrityslopetettu_pvm, '9999-12-31') = d2.kalenteri_avain
UNION
SELECT -1
      ,'0000000-0'
	  ,'Tuntematon'
	  ,'Tuntematon'
	  ,'Tuntematon'
	  ,'Tuntematon'
	  ,'Tuntematon'
	  ,'Tuntematon'
	  ,'Tuntematon'
	  ,1
	  ,-1
	  ,'Tuntematon'
	  ,-1
	  ,'Tuntematon'
	  ,-1
	  ,'Tuntematon'
	  ,'-1'
	  ,'Tuntematon'
	  ,-1
	  ,GETDATE()
	  ,'p_lataa_d_ytj_yritystiedot'




GO

USE ANTERO
