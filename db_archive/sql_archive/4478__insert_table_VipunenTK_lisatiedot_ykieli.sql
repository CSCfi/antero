/****** Script for SelectTopNRows command from SSMS  ******/
use [VipunenTK_lisatiedot]
go

if not exists (select * from [VipunenTK_lisatiedot].[dbo].[ykieli] where ykieli_koodi = '8' or id = 5)

begin

  insert into [VipunenTK_lisatiedot].[dbo].[ykieli]

  select [id] = 5
      ,[luotu] = '2020-03-05'
      ,[alkaa]
      ,[paattyy]
      ,[ykieli_koodi] = '8'
      ,[koodinselite]
      ,[koodinselite_SV]
      ,[koodinselite_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  from [VipunenTK_lisatiedot].[dbo].[ykieli]
  where id = -1

end

go use antero