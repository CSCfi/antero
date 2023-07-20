USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 20.7.2023 16:48:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












--exec [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_hakutiedot] 

ALTER PROCEDURE [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_hakutiedot] AS

drop table if exists dw._temp_koski_hakeutumisvelvolliset_hakutiedot

select * into dw._temp_koski_hakeutumisvelvolliset_hakutiedot
from
(
	select distinct
		f.HenkiloOID
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
	
	from sa.sa_odw_hakeneet f
	join [dw].[d_haku] h on h.haku_oid = f.HakuOid
	join [dw].[d_hakukohde] hk on hk.oid = f.HakukohdeOID
	join [sa].[sa_hakukohde_koulutus] hkk on hkk.hakukohde_oid = f.HakukohdeOID
	left join [dw].[d_koulutusluokitus] d on d.koulutusluokitus_koodi = hkk.hakukohdekoulutus_koodi
	left join dw.d_koulutustyyppi kt on kt.koodi = hkk.koulutustyyppi_koodi
	
	where 1=1
	and h.[korkeakouluhaku] = 0
	and hkk.hakukohdekoulutus_nro = 1
	and hkk.koulutuksen_alkamisvuosi > 2020 --huom. samalla rajautuu haut, joille ei alkamisvuositietoa

) q

GO
