USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 13.10.2022 17:48:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





--exec [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_hakutiedot] 

CREATE OR ALTER PROCEDURE [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_hakutiedot] AS

drop table if exists dw._temp_koski_hakeutumisvelvolliset_hakutiedot

select * into dw._temp_koski_hakeutumisvelvolliset_hakutiedot
from
(
	select distinct
	
	--hakeneet
	f.HenkiloOID
	,f.HakuOid
	,f.HakukohdeOID
	,f.HakutoiveNumero
	,f.ValinnanTila
	,f.VastaanotonTila
	,f.IlmoittautumisenTila
	,f.OppilaitosOID
	
	--haku
	,[Hakutapa] = h.hakutapa_fi
	,[Hakutyyppi] = h.hakutyyppi_fi
	
	--hakukohde
	,hkk.[koulutuksen_alkamisvuosi]
	,hkk.[koulutuksen_alkamiskausi] --k/s
	,koodit_koulutusnimike_hv_hakutiedot = coalesce(d.koulutusluokitus_koodi, '-1')
	,hkk.[koulutustyyppi_koodi]
	,[Koulutustyyppi (hakukohde)] = coalesce(
		case 
			when hkk.hakukohdekoulutus_koodi = '301101' then 'Lukiokoulutus'
			when hkk.hakukohdekoulutus_koodi in (/*'301101',*/'301102','301103','301104') then d.koulutusluokitus_fi 
			else kt.selite_fi 
		end
		,'Tieto puuttuu'
	)
	,hk.ammatillinen_perustutkinto_erityisopetuksena --vaativa erityinen tuki

	--jarjestys
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
