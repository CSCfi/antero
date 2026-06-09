USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_hakukohde]    Script Date: 9.9.2025 9.42.36 ******/
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

-- CSCVIPUNEN-4593
SELECT DISTINCT HakukohdeOID 
INTO #temp_hakukohteet
FROM ANTERO.sa.sa_odw_hakeneet
WHERE OppilaitosOID  in ('1.2.246.562.10.87186754146','1.2.246.562.10.11100437117')

MERGE dw.d_hakukohde AS target
USING (

	SELECT DISTINCT
		 hk.hakukohdeOid
		 -- CSCVIPUNEN-4593
		 ,CASE
			WHEN th.HakukohdeOid is not NULL THEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en)
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Lukio', 'Yleislinja') and hk2.opetusKielet = '["kieli_sv"]' THEN 'Gymnasiets allmänna linje'
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Lukio', 'Yleislinja') THEN 'Lukion yleislinja'
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Gymnasiets allmän linje', 'Gymnasium allmän linje') THEN 'Gymnasiets allmänna linje'
			ELSE coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en)
		END as nimi_fi
		,CASE
			WHEN th.HakukohdeOid is not NULL  THEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en)
			WHEN coalesce(hk.nimi_sv,hk.nimi_fi,hk.nimi_en) = 'Gymnasium' and hk2.opetusKielet = '["kieli_sv"]' THEN 'Gymnasiets allmänna linje'
			WHEN coalesce(hk.nimi_sv,hk.nimi_fi,hk.nimi_en) = 'Gymnasium' THEN 'Gymnasiets allmänna linje'
			WHEN coalesce(hk.nimi_sv,hk.nimi_fi,hk.nimi_en) in ('Gymnasiets allmän linje', 'Gymnasium allmän linje') THEN 'Gymnasiets allmänna linje'
			ELSE coalesce(hk.nimi_sv,hk.nimi_fi,hk.nimi_en)
		END as nimi_sv
		,CASE
			WHEN th.HakukohdeOid is not NULL  THEN coalesce(hk.nimi_en,hk.nimi_fi,hk.nimi_sv)
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Lukio', 'Yleislinja') and hk2.opetusKielet = '["kieli_sv"]' THEN 'Gymnasiets allmänna linje'
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Lukio', 'Yleislinja') THEN 'General upper secondary curriculum option'
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Gymnasiets allmän linje', 'Gymnasium allmän linje') THEN 'Gymnasiets allmänna linje'
			WHEN coalesce(hk.nimi_en,hk.nimi_fi,hk.nimi_sv) in ('Lukion yleislinja', 'Yleislinja') THEN 'General upper secondary curriculum option'
			ELSE coalesce(hk.nimi_en,hk.nimi_fi,hk.nimi_sv)
		END as nimi_en
		,coalesce(hk2.kaksoisTutkinto,0) as kaksoistutkinto
		,case
			when (h.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or h.nimi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or h.nimi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%')
			and (hk.nimi_fi not like '%telma%' and hk.nimi_fi not like '%valma%') then 1
			else 0
		 end as ammatillinen_perustutkinto_erityisopetuksena
		,hk.tila
		,'etl: p_lataa_d_hakukohde' AS source
	FROM sa.sa_hakukohteet hk
	left join sa.koulutustarjonta_hakukohde hk2 on hk2.oid = hk.hakukohdeOid
	left join sa.koulutustarjonta_haku h on h.oid = hk2.hakuOid
	left join #temp_hakukohteet th on th.HakukohdeOid = hk.hakukohdeOid

	UNION ALL

	SELECT DISTINCT
		hk.hakukohdeOid
		-- CSCVIPUNEN-4593
		,CASE
			WHEN th.HakukohdeOid is not NULL THEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en)
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Lukio', 'Yleislinja') THEN 'Lukion yleislinja'
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Gymnasiets allmän linje', 'Gymnasium allmän linje') THEN 'Gymnasiets allmänna linje'
			ELSE coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en)
		END as nimi_fi
		,CASE
			WHEN th.HakukohdeOid is not NULL  THEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en)
			WHEN coalesce(hk.nimi_sv,hk.nimi_fi,hk.nimi_en) = 'Gymnasium' THEN 'Gymnasiets allmänna linje'
			WHEN coalesce(hk.nimi_sv,hk.nimi_fi,hk.nimi_en) in ('Gymnasiets allmän linje', 'Gymnasium allmän linje') THEN 'Gymnasiets allmänna linje'
			ELSE coalesce(hk.nimi_sv,hk.nimi_fi,hk.nimi_en)
		END as nimi_sv
		,CASE
			WHEN th.HakukohdeOid is not NULL  THEN coalesce(hk.nimi_en,hk.nimi_fi,hk.nimi_sv)
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Lukio', 'Yleislinja') THEN 'General upper secondary curriculum option'
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Gymnasiets allmän linje', 'Gymnasium allmän linje') THEN 'Gymnasiets allmänna linje'
			WHEN coalesce(hk.nimi_en,hk.nimi_fi,hk.nimi_sv) in ('Lukion yleislinja', 'Yleislinja') THEN 'General upper secondary curriculum option'
			ELSE coalesce(hk.nimi_en,hk.nimi_fi,hk.nimi_sv)
		END as nimi_en
		,case when coalesce(toinenAsteOnkoKaksoistutkinto, 'False') = 'True' then 1
		 else 0 end as kaksoistutkinto
		,CASE 
			WHEN hk.nimi_fi like '%vaativa%' and hk.nimi_fi like '%erityi%' THEN 1
			WHEN hk.nimi_sv like '%krävande särskilt stöd%' THEN 1
			ELSE coalesce(hk.ammatillinenPerustutkintoErityisopetuksena,0) 
		 END as ammatillinen_perustutkinto_erityisopetuksena
		,UPPER(hk.tila) as tila
		,'etl: p_lataa_d_hakukohde' AS source
	FROM sa.sa_kouta_hakukohteet hk
	left join #temp_hakukohteet th on th.HakukohdeOid = hk.hakukohdeOid

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

DROP TABLE IF EXISTS #temp_hakukohteet


GO


