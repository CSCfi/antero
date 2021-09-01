USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_korkea_aste_valintatapajonot]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_haku_ja_valinta_korkea_aste_valintatapajonot]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_korkea_aste_valintatapajonot] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_korkea_aste_valintatapajonot] AS


TRUNCATE TABLE dw.f_haku_ja_valinta_korkea_aste_valintatapajonot

DECLARE @loadtime datetime = getdate()

INSERT INTO dw.f_haku_ja_valinta_korkea_aste_valintatapajonot (

	henkilo_oid,
	haku_oid,
	d_hakukohde_id,
	d_valintatapajono_id,
	valintatapajono_nimi,
	kokonaispisteet,
	paatelty,
	loadtime,
	source,
	username

)

SELECT 
	f.HenkiloOID,
	f.HakuOID,
	coalesce(d2.id, '-1'),
	coalesce(d1.id, '-1'),
	f.JonoNimi, 
	f.kokonaispisteet,
	CASE 
		WHEN f.paatelty = 1 and f.JonoTyyppi is not null then 1
		ELSE 0
	END as paatelty,
	@loadtime,
	'ETL: p_lataa_f_haku_ja_valinta_korkea_aste_valintatapajonot' AS source,
	suser_name() 
FROM (
	SELECT
		CASE 
			/*WHEN f.JonoTyyppi is not null then f.JonoTyyppi
			WHEN f.JonoNimi like '%yhteispiste%' OR f.JonoNimi like '%ja koepiste%' OR f.JonoNimi like '%Totalp%' OR f.JonoNimi like '%Total p%' then 'yp'
			WHEN (f.JonoNimi like 'Exam%' OR f.JonoNimi like '%Koepiste%' OR f.JonoNimi like '%Koevalinta%') AND (f.JonoNimi not like '%+%' AND f.JonoNimi not like '% ja %') then 'kp'
			WHEN f.JonoNimi like '%Todistus%' then 'tv'
			WHEN f.JonoNimi like '%Kilpailu%' then 'km'
			WHEN (f.JonoNimi like 'Avoim%') OR (d1.haun_nimi_fi like '%Avoimen%' OR d1.haun_nimi_fi like '%Öppna%') then 'av' */
			WHEN f.JonoTyyppi = 'av' then 'm'
			ELSE f.JonoTyyppi
		END AS JonoTyyppi,
		f.JonoNimi,
		CASE 
			WHEN coalesce(f.Kokonaispisteet,0) >= coalesce(f.ValintatapaJononAlinHyvaksyttyPistemaara,0) THEN f.Kokonaispisteet
			ELSE f.ValintatapaJononAlinHyvaksyttyPistemaara
		END as kokonaispisteet,
		f.HakukohdeOID,
		f.HenkiloOID,
		f.HakuOID,
		CASE 
			WHEN f.JonoTyyppi is null then 1
			ELSE 0
		END AS paatelty
	FROM [sa].[sa_odw_valintatapajono] f
	inner join dw.d_haku d1 on d1.haku_oid = f.HakuOid and d1.korkeakouluhaku = 1
	left join sa.sa_hakukohde_koulutus d2 on d2.hakukohde_oid = f.HakukohdeOID and d2.hakukohdekoulutus_nro = 1
	WHERE d2.koulutuksen_alkamisvuosi > 2014) f
	LEFT JOIN dw.d_valintatapajono d1 on d1.koodi = f.JonoTyyppi
	left join dw.d_hakukohde d2 on d2.oid = f.HakukohdeOID






GO


