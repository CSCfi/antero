USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakukohde_kielet]    Script Date: 27.10.2023 14:37:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [sa].[p_lataa_sa_hakukohde_kielet] as 

TRUNCATE TABLE sa.sa_hakukohde_kielet

INSERT INTO sa.sa_hakukohde_kielet

SELECT 
	hakukohde_oid
	,UPPER([1]) as kieli1_koodi
	,UPPER([2]) as kieli2_koodi
	,UPPER([3]) as kieli3_koodi
	,kieli_avain = 

		CASE 
			/* 2 kielikoodia per hakukohde */
			WHEN [1] < [2] AND [3] IS NULL THEN UPPER(concat([1], [2])) 
			WHEN [2] < [1] AND [3] IS NULL THEN UPPER(concat([2], [1]))

			/* 3 kielikoodia per hakukohde */
			WHEN [1] < [2] AND [1] < [3] and [2] < [3] THEN UPPER(concat([1], [2], [3]))
			WHEN [1] < [2] AND [1] < [3] and [3] < [2] THEN UPPER(concat([1], [3], [2]))

			WHEN [2] < [1] AND [2] < [3] and [1] < [3] THEN UPPER(concat([2], [1], [3]))
			WHEN [2] < [1] AND [2] < [3] and [3] < [1] THEN UPPER(concat([2], [3], [1]))

			WHEN [3] < [2] AND [3] < [1] and [1] < [2] THEN UPPER(concat([3], [1], [2]))
			WHEN [3] < [2] AND [3] < [1] and [2] < [1] THEN UPPER(concat([3], [1], [2]))

			ELSE UPPER([1])

		END


FROM (

SELECT distinct
	oid as hakukohde_oid
	,REPLACE(LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',',')),'kieli_','') as kieli_koodi
	,ROW_NUMBER()OVER(PARTITION BY oid ORDER BY LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))) as kieli_nro
FROM [ANTERO].[sa].[koulutustarjonta_hakukohde]

cross apply string_split(cast(opetusKielet as varchar(max)), ',') pilkotut

group by oid,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))

UNION ALL

SELECT * FROM (
SELECT distinct
	 hk.hakukohdeOid as hakukohde_oid
	,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LEFT(REPLACE(REPLACE(LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',',')),'oppilaitoksenopetuskieli_',''),'''',''),1), 1,'fi'),2,'sv'),4,'en'), 5, 'fisv'), 3, 'se') as kieli_koodi
	,ROW_NUMBER()OVER(PARTITION BY hk.hakukohdeOid ORDER BY LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))) as kieli_nro
FROM [ANTERO].[sa].[sa_kouta_koulutus] k
LEFT JOIN ANTERO.sa.sa_kouta_hakukohteet hk on k.toteutusOid = hk.toteutusOid
cross apply string_split(cast(opetuskieliKoodiUrit as varchar(max)), ',') pilkotut
group by hk.hakukohdeOid, LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))
) f
WHERE f.kieli_koodi <> '9'
) s1

PIVOT
(
min(kieli_koodi) FOR kieli_nro IN ([1],[2],[3])
)
AS PIVOTTABLE;

GO

USE [ANTERO]