USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_ytj_yritystiedot] AS

BEGIN

	TRUNCATE TABLE ANTERO.dw.d_ytj_yritystiedot

	INSERT INTO ANTERO.dw.d_ytj_yritystiedot(
		[id]
		,[ytunnus]
		,[toiminimi]
		,[posti_postinumero]
		,[posti_maa]
		,[posti_toimipaikka]
		,[kaynti_postinumero]
		,[kaynti_maa]
		,[kaynti_toimipaikka]
		,[yrityslopetettu]
		,[yrityslopetettu_pvm]
		,[yritysmuoto_seloste]
		,[yritysmuoto_koodi]
		,[kotipaikkakunta_seloste]
		,[kotipaikkakunta_koodi]
		,[toimiala_seloste]
		,[toimiala_koodi]
		,[kieli_seloste]
		,[elinkeinotoimintalopetettu_pvm]
		,[loadtime]
		,[source]
		,ytunnus_raportointiin
	)
	SELECT ytj.[id]
		  ,[ytunnus] = COALESCE([ytunnus], 'Tieto puuttuu')
		  ,[toiminimi] = COALESCE([toiminimi], 'Tieto puuttuu')
		  ,[posti_postinumero] = COALESCE([posti_postinumero], 'Tieto puuttuu')
		  ,[posti_maa] = COALESCE([posti_maa], 'Tieto puuttuu')
		  ,[posti_toimipaikka] = COALESCE([posti_toimipaikka], 'Tieto puuttuu')
		  ,[kaynti_postinumero] = COALESCE([kaynti_postinumero], 'Tieto puuttuu')
		  ,[kaynti_maa] = COALESCE([kaynti_maa], 'Tieto puuttuu')
		  ,[kaynti_toimipaikka] = COALESCE([kaynti_toimipaikka], 'Tieto puuttuu')
		  ,[yrityslopetettu] = COALESCE([yrityslopetettu], -1)
		  ,[yrityslopetettu_pvm] = COALESCE(d2.id, -1)
		  ,[yritysmuoto_seloste] = COALESCE([yritysmuoto_seloste], 'Tieto puuttuu')
		  ,[yritysmuoto_koodi] = COALESCE([yritysmuoto_koodi], -1)
		  ,[kotipaikkakunta_seloste] = COALESCE([kotipaikka_seloste], 'Tieto puuttuu')
		  ,[kotipaikkakunta_koodi] = COALESCE([kotipaikka_koodi], -1)
		  ,[toimiala_seloste] = COALESCE([toimiala_seloste], 'Tieto puuttuu')
		  ,[toimiala_koodi] = (COALESCE([toimiala_koodi], '-1'))
		  ,[kieli_seloste] = COALESCE([kieli_seloste], 'Tieto puuttuu')
		  ,[elinkeinotoimintalopetettu_pvm] = COALESCE(d1.id, -1)
		  ,[loadtime] = GETDATE()
		  ,[source] = 'p_lataa_d_ytj_yritystiedot'
		  ,ytunnus_raportointiin = null

	FROM Koski_SA.sa.sa_ytj_yritystiedot ytj
	LEFT JOIN ANTERO.dw.d_kalenteri d1 ON COALESCE(try_convert(varchar,ytj.elinkeinotoimintalopetettu_pvm), '9999-12-31') = d1.kalenteri_avain
	LEFT JOIN ANTERO.dw.d_kalenteri d2 ON COALESCE(try_convert(varchar,ytj.elinkeinotoimintalopetettu_pvm), '9999-12-31') = d2.kalenteri_avain
	
	UNION
	
	SELECT 
		-1
		,'0000000-0'
		,'Tieto puuttuu'
		,'Tieto puuttuu'
		,'Tieto puuttuu'
		,'Tieto puuttuu'
		,'Tieto puuttuu'
		,'Tieto puuttuu'
		,'Tieto puuttuu'
		,1
		,-1
		,'Tieto puuttuu'
		,-1
		,'Tieto puuttuu'
		,-1
		,'Tieto puuttuu'
		,'-1'
		,'Tieto puuttuu'
		,-1
		,GETDATE()
		,'p_lataa_d_ytj_yritystiedot'
		,null
	;

	UPDATE t
	SET ytunnus_raportointiin = CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', [ytunnus]), 2)
	FROM [dw].[d_ytj_yritystiedot] t

END

GO
