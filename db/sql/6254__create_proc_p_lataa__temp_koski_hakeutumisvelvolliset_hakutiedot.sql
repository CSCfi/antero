USE [ANTERO]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_hakutiedot] AS

--Loma-ajan purkkaa testiluonnoksen päivittämiseksi. JS 23.6.2022.

drop table if exists dw._temp_hakeutumisvelvolliset_hakutiedot

select * into dw._temp_hakeutumisvelvolliset_hakutiedot
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
	
	--haku
	,[Hakutapa] = h.hakutapa_fi
	,[Hakutyyppi] = h.hakutyyppi_fi
	
	--hakukohde
	,hk.[koulutuksen_alkamisvuosi]
	,hk.[koulutuksen_alkamiskausi] --case koulutuksen_alkamiskausi when 's' then 'Syksy' when 'k' then 'Kevät' end
	,hk.[hakukohdekoulutus_koodi]
	,hk.[koulutustyyppi_koodi]
	,[Koulutustyyppi (hakukohde)] = kt.selite_fi

	--järjestykset
	,h.jarjestys_hakutapa --99999
	,h.jarjestys_hakutyyppi --99999
	,jarjestys_koulutustyyppi_hakukohde = kt.jarjestys --99
	
	from sa.sa_odw_hakeneet f
	join [dw].[d_haku] h on h.haku_oid = f.HakuOid
	join [sa].[sa_hakukohde_koulutus] hk on hk.hakukohde_oid = f.HakukohdeOID
	left join dw.d_koulutustyyppi kt on kt.koodi = hk.koulutustyyppi_koodi
	
	where 1=1
	and h.[korkeakouluhaku] = 0
	and hk.hakukohdekoulutus_nro = 1
	and hk.koulutuksen_alkamisvuosi > 2020 --or yksilöllinen ..?

) q
