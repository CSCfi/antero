use VipunenTK
go

if not exists (select * from [dbo].[d_syntypera] where syntypera_koodi = '99')
begin
insert [dbo].[d_syntypera] (
	id
	,[luotu]
    ,[alkaa]
    ,[paattyy]
    ,[syntypera_koodi]
    ,[syntypera]
    ,[syntypera_SV]
    ,[syntypera_EN]
    ,[jarjestys]
    ,[virhetilanne]
    ,[poistettu]
    ,[tietolahde]
    ,[kommentti]
)
select id = 5
	,[luotu] = '2022-10-28'
    ,[alkaa]
    ,[paattyy]
    ,[syntypera_koodi] = '99'
    ,[syntypera]
    ,[syntypera_SV]
    ,[syntypera_EN]
    ,[jarjestys]
    ,[virhetilanne]
    ,[poistettu]
    ,[tietolahde] = 'Tilastokeskus'
    ,[kommentti]
from [dbo].[d_syntypera]
where id = -1
end