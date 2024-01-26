USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_hakukohde]    Script Date: 9.5.2023 16:00:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE  [dw].[p_lataa_d_hakukohde] AS

IF NOT EXISTS (SELECT * FROM dw.d_hakukohde WHERE id=-1) 

BEGIN

	SET identity_INSERT dw.d_hakukohde on;
	  	
	INSERT dw.d_hakukohde (
		id
		,oid
		,selite_fi
		,selite_sv
		,selite_en
		,kaksoistutkinto
		,ammatillinen_perustutkinto_erityisopetuksena
		,source
		)

	SELECT
	-1,
	koodi,
	nimi,
	nimi_sv,
	nimi_en,
	koodi,
	koodi,
	'etl: p_lataa_d_hakukohde'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	and koodi='-1'
	;
  
	SET identity_INSERT dw.d_hakukohde off;

END 

ELSE 

BEGIN

	UPDATE d SET
	oid = s.koodi,
	selite_fi = s.nimi,
	selite_sv = s.nimi_sv,
	selite_en = s.nimi_en,
	kaksoistutkinto = s.koodi,
	ammatillinen_perustutkinto_erityisopetuksena = s.koodi,
	source = 'etl: p_lataa_d_hakukohde'
	FROM dw.d_hakukohde d
	join sa.sa_koodistot s on s.koodi=d.oid
	WHERE s.koodisto='vipunenmeta'
	and s.koodi='-1'
	;
END
	
MERGE dw.d_hakukohde AS target
USING (

	SELECT DISTINCT
		 hakukohdeOid
		,coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) as nimi_fi
		,coalesce(hk.nimi_sv,hk.nimi_fi,hk.nimi_en) as nimi_sv
		,coalesce(hk.nimi_en,hk.nimi_fi,hk.nimi_sv) as nimi_en
		,coalesce(hk2.kaksoisTutkinto,0) as kaksoistutkinto
		,case
			when (h.nimi like '%haku erityisopetuksena j�rjestett�v��n ammatilliseen koulutukseen%' or h.nimi like 'Erityisopetuksena j�rjestett�v�n ammatillisen koulutuksen haku%' or h.nimi like '%vaativana erityisen� tukena j�rjestett�v��n ammatilliseen koulutukseen%')
			and (hk.nimi_fi not like '%telma%' and hk.nimi_fi not like '%valma%') then 1
			else 0
		 end as ammatillinen_perustutkinto_erityisopetuksena
		,hk.tila
		,'etl: p_lataa_d_hakukohde' AS source
	FROM sa.sa_hakukohteet hk
	left join sa.koulutustarjonta_hakukohde hk2 on hk2.oid = hk.hakukohdeOid
	left join sa.koulutustarjonta_haku h on h.oid = hk2.hakuOid

	UNION ALL

	SELECT DISTINCT
		 hakukohdeOid
		,coalesce(nimi_fi,nimi_sv,nimi_en) as nimi_fi
		,coalesce(nimi_sv,nimi_fi,nimi_en) as nimi_sv
		,coalesce(nimi_en,nimi_fi,nimi_sv) as nimi_en
		,case when coalesce(toinenAsteOnkoKaksoistutkinto, 'False') = 'True' then 1
		 else 0 end as kaksoistutkinto
		,CASE 
			WHEN hk.nimi_fi like '%vaativa%' and hk.nimi_fi like '%erityi%' THEN 1
			WHEN hk.nimi_sv like '%kr�vande s�rskilt st�d%' THEN 1
			ELSE coalesce(hk.ammatillinenPerustutkintoErityisopetuksena,0) 
		 END as ammatillinen_perustutkinto_erityisopetuksena
		,UPPER(hk.tila) as tila
		,'etl: p_lataa_d_hakukohde' AS source
	FROM sa.sa_kouta_hakukohteet hk

) AS src ON target.oid = src.hakukohdeOid

WHEN MATCHED AND src.tila IN ('JULKAISTU', 'ARKISTOITU')
	THEN
		UPDATE
		SET selite_fi = src.nimi_fi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
			,kaksoistutkinto = src.kaksoistutkinto
			,ammatillinen_perustutkinto_erityisopetuksena = src.ammatillinen_perustutkinto_erityisopetuksena
			,target.source = src.source

WHEN MATCHED AND src.tila NOT IN ('JULKAISTU', 'ARKISTOITU')
	THEN
		DELETE

WHEN NOT MATCHED AND src.tila IN ('JULKAISTU', 'ARKISTOITU')
	THEN
		INSERT (
			 oid
			,selite_fi
			,selite_sv
			,selite_en
			,kaksoistutkinto
			,ammatillinen_perustutkinto_erityisopetuksena
			,source
			)
		VALUES (
			 src.hakukohdeOid
			,src.nimi_fi
			,src.nimi_sv
			,src.nimi_en
			,src.kaksoistutkinto
			,src.ammatillinen_perustutkinto_erityisopetuksena
			,src.source
			);





GO

USE [ANTERO]