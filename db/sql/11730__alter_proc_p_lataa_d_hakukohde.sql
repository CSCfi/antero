USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_hakukohde]    Script Date: 4.2.2026 9.12.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_hakukohde] AS

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
SELECT DISTINCT hakukohde_oid
INTO #temp_hakukohteet
FROM ANTERO.sa.sa_ovara_hakeneet
WHERE oppilaitos_oid in ('1.2.246.562.10.87186754146','1.2.246.562.10.11100437117')

MERGE dw.d_hakukohde AS target
USING (

	SELECT DISTINCT
		hk.hakukohde_oid as oid
		-- CSCVIPUNEN-4593
		,CASE
			WHEN th.hakukohde_oid is not NULL THEN coalesce(hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_sv,hk.hakukohteen_nimi_en)
			WHEN coalesce(hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_sv,hk.hakukohteen_nimi_en) in ('Lukio', 'Yleislinja') THEN 'Lukion yleislinja'
			WHEN coalesce(hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_sv,hk.hakukohteen_nimi_en) in ('Gymnasiets allmän linje', 'Gymnasium allmän linje') THEN 'Gymnasiets allmänna linje'
			ELSE coalesce(hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_sv,hk.hakukohteen_nimi_en)
		END as nimi_fi
		,CASE
			WHEN th.hakukohde_oid is not NULL  THEN coalesce(hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_sv,hk.hakukohteen_nimi_en)
			WHEN coalesce(hk.hakukohteen_nimi_sv,hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_en) = 'Gymnasium' THEN 'Gymnasiets allmänna linje'
			WHEN coalesce(hk.hakukohteen_nimi_sv,hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_en) in ('Gymnasiets allmän linje', 'Gymnasium allmän linje') THEN 'Gymnasiets allmänna linje'
			ELSE coalesce(hk.hakukohteen_nimi_sv,hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_en)
		END as nimi_sv
		,CASE
			WHEN th.hakukohde_oid is not NULL  THEN coalesce(hk.hakukohteen_nimi_en,hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_sv)
			WHEN coalesce(hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_sv,hk.hakukohteen_nimi_en) in ('Lukio', 'Yleislinja') THEN 'General upper secondary curriculum option'
			WHEN coalesce(hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_sv,hk.hakukohteen_nimi_en) in ('Gymnasiets allmän linje', 'Gymnasium allmän linje') THEN 'Gymnasiets allmänna linje'
			WHEN coalesce(hk.hakukohteen_nimi_en,hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_sv) in ('Lukion yleislinja', 'Yleislinja') THEN 'General upper secondary curriculum option'
			ELSE coalesce(hk.hakukohteen_nimi_en,hk.hakukohteen_nimi_fi,hk.hakukohteen_nimi_sv)
		END as nimi_en
		,coalesce(toinenAsteOnkoKaksoistutkinto,0) as kaksoistutkinto
		,CASE 
			WHEN hk.hakukohteen_nimi_fi like '%vaativa%' and hk.hakukohteen_nimi_fi like '%erityi%' THEN 1
			WHEN hk.hakukohteen_nimi_sv like '%krävande särskilt stöd%' THEN 1
			WHEN t.ammatillinenperustutkintoerityisopetuksena = 1 THEN 1
			WHEN t.jarjestetaanerityisopetuksena = 1 THEN 1
			ELSE 0 
		END as ammatillinen_perustutkinto_erityisopetuksena
		,UPPER(hk.tila) as tila
		,'etl: p_lataa_d_hakukohde' AS source
	FROM ANTERO.sa.sa_ovara_kouta_hakukohteet hk
	LEFT JOIN ANTERO.sa.sa_ovara_kouta_toteutus t on t.toteutus_oid = hk.toteutus_oid
	LEFT JOIN #temp_hakukohteet th on th.hakukohde_oid = hk.hakukohde_oid
	WHERE NOT EXISTS (SELECT TOP 1 hakukohdeoid FROM ANTERO.sa.sa_hakukohteet hk2 WHERE hk2.hakukohdeoid = hk.hakukohde_oid)

	UNION ALL

	SELECT DISTINCT
		 hk.hakukohdeOid
		 -- CSCVIPUNEN-4593
		 ,CASE
			WHEN th.hakukohde_oid is not NULL THEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en)
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Lukio', 'Yleislinja') and hk2.opetusKielet = '["kieli_sv"]' THEN 'Gymnasiets allmänna linje'
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Lukio', 'Yleislinja') THEN 'Lukion yleislinja'
			WHEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en) in ('Gymnasiets allmän linje', 'Gymnasium allmän linje') THEN 'Gymnasiets allmänna linje'
			ELSE coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en)
		END as nimi_fi
		,CASE
			WHEN th.hakukohde_oid is not NULL  THEN coalesce(hk.nimi_fi,hk.nimi_sv,hk.nimi_en)
			WHEN coalesce(hk.nimi_sv,hk.nimi_fi,hk.nimi_en) = 'Gymnasium' and hk2.opetusKielet = '["kieli_sv"]' THEN 'Gymnasiets allmänna linje'
			WHEN coalesce(hk.nimi_sv,hk.nimi_fi,hk.nimi_en) = 'Gymnasium' THEN 'Gymnasiets allmänna linje'
			WHEN coalesce(hk.nimi_sv,hk.nimi_fi,hk.nimi_en) in ('Gymnasiets allmän linje', 'Gymnasium allmän linje') THEN 'Gymnasiets allmänna linje'
			ELSE coalesce(hk.nimi_sv,hk.nimi_fi,hk.nimi_en)
		END as nimi_sv
		,CASE
			WHEN th.hakukohde_oid is not NULL  THEN coalesce(hk.nimi_en,hk.nimi_fi,hk.nimi_sv)
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
	left join #temp_hakukohteet th on th.hakukohde_oid = hk.hakukohdeOid

) AS src ON target.oid = src.oid

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
			 src.oid
			,src.nimi_fi
			,src.nimi_sv
			,src.nimi_en
			,src.kaksoistutkinto
			,src.ammatillinen_perustutkinto_erityisopetuksena
			,src.source
			);

DROP TABLE IF EXISTS #temp_hakukohteet