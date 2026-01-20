USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 15.4.2025 12.40.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dw].[p_lataa_f_koski_hakeutumisvelvolliset_hakutiedot] AS

DROP TABLE IF EXISTS dw.f_koski_hakeutumisvelvolliset_hakutiedot

SELECT * INTO dw.f_koski_hakeutumisvelvolliset_hakutiedot
FROM
(
	SELECT DISTINCT
		coalesce(kh.master_oid,f.HenkiloOID) as master_oid
		,f.HakuOid
		,f.HakukohdeOID
		,f.HakutoiveNumero
		,f.ValinnanTila
		,f.VastaanotonTila
		,f.IlmoittautumisenTila
		,f.OppilaitosOID
	
		,hkk.[koulutuksen_alkamisvuosi]
		,hkk.[koulutuksen_alkamiskausi] --k/s
		--,koodit_koulutusnimike_hv_hakutiedot = coalesce(d.koulutusluokitus_koodi, '-1')
		,hkk.[koulutustyyppi_koodi]
		,hk.ammatillinen_perustutkinto_erityisopetuksena --vaativa erityinen tuki

		--FI
		,h.hakutapa_fi
		,h.hakutyyppi_fi
		,koulutustyyppi_hakukohde_fi = 
			coalesce(
				case 
					when hkk.hakukohdekoulutus_koodi = '301101' then 'Lukiokoulutus'
					when hkk.hakukohdekoulutus_koodi in (/*'301101',*/'301102','301103','301104') then d.koulutusluokitus_fi 
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
					when hkk.hakukohdekoulutus_koodi = '301101' then 'Gymnasieutbildning'
					when hkk.hakukohdekoulutus_koodi in (/*'301101',*/'301102','301103','301104') then d.koulutusluokitus_sv 
					else kt.selite_sv 
				end
				,'Information saknas'
			)

		--JARJESTYS
		,h.jarjestys_hakutapa --99999
		,h.jarjestys_hakutyyppi --99999
		,jarjestys_koulutustyyppi_hakukohde = coalesce(kt.jarjestys, '99')
	
	FROM sa.sa_odw_hakeneet f
	JOIN [dw].[d_haku] h on h.haku_oid = f.HakuOid
	JOIN [dw].[d_hakukohde] hk on hk.oid = f.HakukohdeOID
	JOIN [sa].[sa_hakukohde_koulutus] hkk on hkk.hakukohde_oid = f.HakukohdeOID
	LEFT JOIN [dw].[d_koulutusluokitus] d on d.koulutusluokitus_koodi = hkk.hakukohdekoulutus_koodi
	LEFT JOIN dw.d_koulutustyyppi kt on kt.koodi = hkk.koulutustyyppi_koodi
	LEFT JOIN Koski_SA.sa.sa_koski_henkilo kh on kh.oppija_oid = f.HenkiloOID
	
	WHERE 1=1
	AND h.[korkeakouluhaku] = 0
	AND hkk.hakukohdekoulutus_nro = 1
	AND hkk.koulutuksen_alkamisvuosi > year(getdate()) - 4 --huom. samalla rajautuu haut, joille ei alkamisvuositietoa

) q

GO

USE [ANTERO]