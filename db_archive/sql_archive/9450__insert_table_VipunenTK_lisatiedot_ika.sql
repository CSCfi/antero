use [VipunenTK_lisatiedot]
go

if not exists (select * from [VipunenTK_lisatiedot].[dbo].[ika] where ika_int > 109)
insert [VipunenTK_lisatiedot].[dbo].[ika] (
	[luotu]
    ,[ika_avain]
    ,[ika_int]
    ,[ika]
    ,[ika_SV]
    ,[ika_EN]
    ,[ika5v_int]
    ,[ika5v]
    ,[ika5v_SV]
    ,[ika5v_EN]
    ,[jarjestys_ika]
    ,[jarjestys_ika5v]
    ,[virhetilanne]
    ,[poistettu]
    ,[tietolahde]
    ,[kommentti]
)
select [luotu]='2023-12-27'
      ,[ika_avain]+10
      ,[ika_int]+10
      ,[ika]+10
      ,[ika_SV]+10
      ,[ika_EN]+10
      ,[ika5v_int]=([ika_int]+10)/5*5
      ,[ika5v]
      ,[ika5v_SV]
      ,[ika5v_EN]
      ,[jarjestys_ika]
      ,[jarjestys_ika5v]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]='CSC Juha'
from [VipunenTK_lisatiedot].[dbo].[ika]
where ika_int >= 100
