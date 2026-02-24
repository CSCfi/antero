USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_ovara_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 5.2.2026 7.54.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE [dw].[p_lataa_f_koski_hakeutumisvelvolliset_hakutiedot] AS

DROP TABLE IF EXISTS dw.f_koski_hakeutumisvelvolliset_hakutiedot

SELECT * INTO dw.f_koski_hakeutumisvelvolliset_hakutiedot
FROM
(
	SELECT DISTINCT
		f.master_oid
		,f.haku_oid as HakuOid
		,f.hakukohde_oid as HakukohdeOID
		,f.hakutoive as HakutoiveNumero
		,f.valittu
		,f.vastaanottanut_paikan
		,f.ilmoittautunut
		,f.oppilaitos_oid as OppilaitosOID
	
		,f.[koulutuksen_alkamisvuosi]
		,f.[koulutuksen_alkamiskausi] --k/s
		--,koodit_koulutusnimike_hv_hakutiedot = coalesce(d.koulutusluokitus_koodi, '-1')
		,kt.koodi as koulutustyyppi_koodi
		,hk.ammatillinen_perustutkinto_erityisopetuksena --vaativa erityinen tuki

		--FI
		,h.hakutapa_fi
		,h.hakutyyppi_fi
		,koulutustyyppi_hakukohde_fi = 
			coalesce(
				case 
					when f.koulutuskoodi = '301101' then 'Lukiokoulutus'
					when f.koulutuskoodi in (/*'301101',*/'301102','301103','301104') then d.koulutusluokitus_fi 
					else kt.selite_fi 
				end
				,'Tieto puuttuu'
			)

		--SV
		,h.hakutapa_sv
		,h.hakutyyppi_sv
		,koulutustyyppi_hakukohde_sv = 
			coalesce(
				case 
					when f.koulutuskoodi = '301101' then 'Gymnasieutbildning'
					when f.koulutuskoodi in (/*'301101',*/'301102','301103','301104') then d.koulutusluokitus_sv 
					else kt.selite_sv 
				end
				,'Information saknas'
			)

		--JARJESTYS
		,h.jarjestys_hakutapa --99999
		,h.jarjestys_hakutyyppi --99999
		,jarjestys_koulutustyyppi_hakukohde = coalesce(kt.jarjestys, '99')
	
	FROM sa.sa_ovara_hakeneet f
	join sa.sa_ovara_hakukohteet ohk on ohk.hakukohde_oid = f.hakukohde_oid
	JOIN [dw].[d_haku] h on h.haku_oid = f.haku_oid
	JOIN [dw].[d_hakukohde] hk on hk.oid = f.hakukohde_oid
	LEFT JOIN [dw].[d_koulutusluokitus] d on d.koulutusluokitus_koodi = f.koulutuskoodi
	LEFT JOIN dw.d_koulutustyyppi kt on kt.koodi = d.koulutustyyppi_koodi
	WHERE 1=1
	AND f.kk_haku = 0
	AND f.koulutuksen_alkamisvuosi > year(getdate()) - 4 --huom. samalla rajautuu haut, joille ei alkamisvuositietoa

) q