USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_korkea_aste_valintatapajonot]    Script Date: 23.2.2022 9:55:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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

SELECT DISTINCT
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
			WHEN 
				f.JonoNimi like 'Avoim%' OR f.JonoNimi like '%Avoin%' OR 
				d1.haun_nimi_fi like '%Avoi%' OR d1.haun_nimi_fi like '%Öppna%' OR d1.haun_nimi_fi like '%Öppen%' OR
				d3.selite_fi like '%Avoi%' OR d3.selite_fi like '%Öppen%' OR d3.selite_fi like '%Öppna%' OR d3.selite_fi like '%Open%' then 'av'
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
	left join dw.d_hakukohde d3 on d3.oid = f.HakukohdeOID
	WHERE d2.koulutuksen_alkamisvuosi > 2014) f
	LEFT JOIN dw.d_valintatapajono d1 on d1.koodi = f.JonoTyyppi
	left join dw.d_hakukohde d2 on d2.oid = f.HakukohdeOID

GO

USE [ANTERO]