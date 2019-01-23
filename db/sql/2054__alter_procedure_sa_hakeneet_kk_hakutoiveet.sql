USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet]    Script Date: 22.1.2019 18:51:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet] as

truncate table sa.sa_hakeneet_kk_hakutoiveet 

insert into sa.sa_hakeneet_kk_hakutoiveet 

select 
	hakemusoid
	,MAX([1_koul])	as hakukohdeOID1
	,MAX([1_org])	as organisaatioOID1
	,MAX([2_koul])	as hakukohdeOID2
	,MAX([2_org])	as organisaatioOID2
	,MAX([3_koul])	as hakukohdeOID3
	,MAX([3_org])	as organisaatioOID3
	,MAX([4_koul])	as hakukohdeOID4
	,MAX([4_org])	as organisaatioOID4
	,MAX([5_koul])	as hakukohdeOID5
	,MAX([5_org])	as organisaatioOID5
	,MAX([6_koul])	as hakukohdeOID6
	,MAX([6_org])	as organisaatioOID6

from 
(
	select 
		HakemusOid
		,HakukohdeOID
		,coalesce(OppilaitosOID,KoulutusToimijaOID) as OrganisaatioOID
		,cast(HakutoiveNumero as varchar) + '_koul' as HakutoiveNumeroKoul
		,cast(HakutoiveNumero as varchar) + '_org' as HakutoiveNumeroORG
	from sa.sa_odw_hakeneet f
	where f.koulutusaste in ('1','2') 
	
	
	
) as query
PIVOT (MAX(HakukohdeOID) FOR HakutoiveNumeroKoul IN ([1_koul],[2_koul],[3_koul],[4_koul],[5_koul],[6_koul]))
AS PIVOTTABLE
PIVOT (MAX(OrganisaatioOID) FOR HakutoiveNumeroORG IN ([1_org],[2_org],[3_org],[4_org],[5_org],[6_org]))
AS PIVOTTABLE2
GROUP BY HakemusOid
