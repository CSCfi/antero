USE [VipunenTK_lisatiedot]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_koulutusohjelma_ammpk]    Script Date: 10.9.2021 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_koulutusohjelma_ammpk]
AS

delete from [dbo].[koulutusohjelma_ammpk]
where koulutusohjelma_ammpk_koodi > 0;

insert into [dbo].[koulutusohjelma_ammpk]
select 
	id = ROW_NUMBER() over (order by cast(koodi as int))
	,luotu = '1900-01-01'
	,alkaa = '1900-01-01'
	,paattyy = '9999-01-01'
	,koulutusohjelma_ammpk_koodi = koodi
	,[koulutusohjelma_ammpk] = coalesce(nimi,nimi_sv,nimi_en)
	,[koulutusohjelma_ammpk_SV] = coalesce(nimi_sv,nimi,nimi_en)
	,[koulutusohjelma_ammpk_EN] = coalesce(nimi_en,nimi,nimi_sv)
	,[jarjestys] = 1
	,[virhetilanne] = 'E'
	,[poistettu] = 0
	,[tietolahde] = 'p_lataa_koulutusohjelma_ammpk ' + left(cast(loadtime as nvarchar),10)
	,[kommentti] = 'CSC Juha'

from [ANTERO].[sa].[sa_koodistot] 
where koodisto='osaamisala' and koodi > 0
order by cast(koodi as int);

insert into [dbo].[koulutusohjelma_ammpk]
select
	[id] = (select max(id) from [dbo].[koulutusohjelma_ammpk]) + ROW_NUMBER() over (order by cast([koulutusohjelma_ammpk_koodi] as int)) 
    ,[luotu]
    ,[alkaa]
    ,[paattyy]
    ,[koulutusohjelma_ammpk_koodi]
    ,[koulutusohjelma_ammpk] = coalesce(koulutusohjelma_ammpk,koulutusohjelma_ammpk_SV,koulutusohjelma_ammpk_EN)
	,[koulutusohjelma_ammpk_SV] = coalesce(koulutusohjelma_ammpk_SV,koulutusohjelma_ammpk,koulutusohjelma_ammpk_EN)
	,[koulutusohjelma_ammpk_EN] = coalesce(koulutusohjelma_ammpk_EN,koulutusohjelma_ammpk,koulutusohjelma_ammpk_SV)
    ,[jarjestys]
    ,[virhetilanne]
    ,[poistettu]
    ,[tietolahde]
    ,[kommentti]

from [dbo].[koulutusohjelma_ammpk_TK]
where [koulutusohjelma_ammpk_koodi] not in (select [koulutusohjelma_ammpk_koodi] from [dbo].[koulutusohjelma_ammpk]) 
order by cast([koulutusohjelma_ammpk_koodi] as int);



