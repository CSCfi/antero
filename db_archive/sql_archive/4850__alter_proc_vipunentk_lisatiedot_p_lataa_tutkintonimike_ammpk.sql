USE [VipunenTK_lisatiedot]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkintonimike_ammpk]    Script Date: 10.9.2021 18:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_tutkintonimike_ammpk]
AS

delete from [dbo].[tutkintonimike_ammpk]
where tutkintonimike_ammpk_koodi > 0;

insert into [dbo].[tutkintonimike_ammpk]
select 
	id = ROW_NUMBER() over (order by cast(koodi as int))
	,luotu = '1900-01-01'
	,alkaa = '1900-01-01'
	,paattyy = '9999-01-01'
	,tutkintonimike_ammpk_koodi = koodi
	,[tutkintonimike_ammpk] = coalesce(nimi,nimi_sv,nimi_en)
	,[tutkintonimike_ammpk_SV] = coalesce(nimi_sv,nimi,nimi_en)
	,[tutkintonimike_ammpk_EN] = coalesce(nimi_en,nimi,nimi_sv)
	,[jarjestys] = 1
	,[virhetilanne] = 'E'
	,[poistettu] = 0
	,[tietolahde] = 'p_lataa_tutkintonimike_ammpk ' + left(cast(loadtime as nvarchar),10)
	,[kommentti] = 'CSC Juha'

from [ANTERO].[sa].[sa_koodistot] 
where koodisto='tutkintonimikkeet' and koodi > 0
order by cast(koodi as int);

insert into [dbo].[tutkintonimike_ammpk]
select
	[id] = (select max(id) from [dbo].[tutkintonimike_ammpk]) + ROW_NUMBER() over (order by cast([tutkintonimike_ammpk_koodi] as int))
    ,[luotu]
    ,[alkaa]
    ,[paattyy]
    ,[tutkintonimike_ammpk_koodi]
    ,[tutkintonimike_ammpk] = coalesce(tutkintonimike_ammpk,tutkintonimike_ammpk_SV,tutkintonimike_ammpk_EN)
	,[tutkintonimike_ammpk_SV] = coalesce(tutkintonimike_ammpk_SV,tutkintonimike_ammpk,tutkintonimike_ammpk_EN)
	,[tutkintonimike_ammpk_EN] = coalesce(tutkintonimike_ammpk_EN,tutkintonimike_ammpk,tutkintonimike_ammpk_SV)
    ,[jarjestys]
    ,[virhetilanne]
    ,[poistettu]
    ,[tietolahde]
    ,[kommentti]

from [dbo].[tutkintonimike_ammpk_TK]
where [tutkintonimike_ammpk_koodi] not in (select [tutkintonimike_ammpk_koodi] from [dbo].[tutkintonimike_ammpk]) 
order by cast([tutkintonimike_ammpk_koodi] as int);



