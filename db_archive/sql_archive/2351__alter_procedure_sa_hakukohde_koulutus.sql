USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakukohde_koulutus]    Script Date: 8.8.2019 16:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [sa].[p_lataa_sa_hakukohde_koulutus] as 

TRUNCATE TABLE [sa].[sa_hakukohde_koulutus]

INSERT INTO [sa].[sa_hakukohde_koulutus]
(
hakukohde_oid
,koulutuksen_alkamisvuosi
,koulutuksen_alkamiskausi
,hakukohdekoulutus_oid
,hakukohdekoulutus_koodi
,koulutustyyppi_koodi
,laajuus_koodi
,pohjakoulutusvaatimus_koodi
,organisaatio_oid
,hakukohdekoulutus_nro

)

SELECT 
	f.hakukohde_oid
	,f.koulutuksen_alkamisvuosi
	,f.koulutuksen_alkamiskausi
	,f.hakukohdekoulutus_oid
	,k.koulutuskoodi_arvo as hakukohdekoulutus_koodi
	,k.koulutustyyppi_arvo as koulutustyyppi_koodi
	,opintojenLaajuusarvo_arvo as laajuus_koodi
	,h.PohjakoulutusvaatimusKoodi as pohjakoulutusvaatimus_koodi
	,f.organisaatio_oid
	,f.hakukohdekoulutus_nro
	
FROM

(
	SELECT distinct
		oid as hakukohde_oid
		,koulutuksenAlkamisvuosi as koulutuksen_alkamisvuosi
		,substring(koulutuksenAlkamiskausiUri,charindex('_',koulutuksenAlkamiskausiUri)+1,1) as koulutuksen_alkamiskausi
		,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',',')) as hakukohdekoulutus_oid
		,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut2.value, '"', ''), '[',''),']',''), ', ',',')) as organisaatio_oid
		,ROW_NUMBER() OVER(PARTITION BY oid ORDER BY LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))) as hakukohdekoulutus_nro
	FROM [ANTERO].[sa].[koulutustarjonta_hakukohde]

	cross apply string_split(cast(hakukohdekoulutusoids as varchar(max)), ',') pilkotut
	cross apply string_split(cast(tarjoajaOids as varchar(max)), ',') pilkotut2

	group by 
	oid
	,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))
	,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut2.value, '"', ''), '[',''),']',''), ', ',','))
	,koulutuksenAlkamisvuosi 
	,substring(koulutuksenAlkamiskausiUri,charindex('_',koulutuksenAlkamiskausiUri)+1,1)
) f

left join sa.koulutustarjonta_koulutus k on k.oid = f.hakukohdekoulutus_oid
left join (
	select distinct 
		HakukohdeOID
		,PohjakoulutusvaatimusKoodi
	from sa.sa_odw_hakeneet 
) h on h.HakukohdeOID = f.hakukohde_oid
 


