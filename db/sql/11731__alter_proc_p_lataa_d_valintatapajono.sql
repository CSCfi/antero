USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_valintatapajono]    Script Date: 4.2.2026 9.21.04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dw].[p_lataa_d_valintatapajono] AS

DELETE FROM dw.d_valintatapajono WHERE valintatapajono_oid = '-1'

SET identity_insert dw.d_valintatapajono ON

INSERT dw.d_valintatapajono (
	id,
	valintatapajono_oid,
	selite_fi,
	selite_sv,
	selite_en,
	hakukohde_oid,
	source
	)
VALUES (
	N'-1',
	N'-1',
	N'Tieto puuttuu',
	N'Informations saknas',
	N'Missing data',
	N'-1',
	N'etl: p_lataa_d_valintatapajono'
)
SET identity_insert dw.d_valintatapajono OFF

MERGE dw.d_valintatapajono AS target
USING (
	SELECT 
		valintatapajono_oid, 
		valintatapajono_nimi as selite_fi,
		valintatapajono_nimi as selite_sv,
		valintatapajono_nimi as selite_en,
		hakukohde_oid,
		'etl: p_lataa_d_valintatapajono' as source
	FROM ANTERO.sa.sa_ovara_valintarekisteri_valintatapajono
	WHERE valintatapajono_nimi is not null

	UNION ALL

	SELECT 
		MIN(concat('odw_', cast(vtj.id as varchar))) as valintatapajono_oid,
		vtj.jonoNimi as valintatapajono_nimi_fi,
		vtj.jonoNimi as valintatapajono_nimi_sv,
		vtj.jonoNimi as valintatapajono_nimi_en,
		vtj.HakukohdeOID,
		'etl: p_lataa_d_valintatapajono' as source
	FROM ANTERO.sa.sa_odw_valintatapajono vtj
	WHERE vtj.jonoNimi is not null
	GROUP BY vtj.jonoNimi, vtj.HakukohdeOID

) AS src
ON target.valintatapajono_oid = src.valintatapajono_oid and target.hakukohde_oid = src.hakukohde_oid

WHEN MATCHED
	THEN
		UPDATE SET 
			target.selite_fi = src.selite_fi,
			target.selite_sv = src.selite_sv,
			target.selite_en = src.selite_en,
			target.source = src.source

WHEN NOT MATCHED by target
	THEN
		INSERT (
			valintatapajono_oid
			,selite_fi
			,selite_sv
			,selite_en
			,hakukohde_oid
			,source
		)
		VALUES (
			src.valintatapajono_oid,
			src.selite_fi,
			src.selite_sv,
			src.selite_en,
			src.hakukohde_oid,
			src.source
		)

WHEN NOT MATCHED by source and id != '-1'
	THEN delete;