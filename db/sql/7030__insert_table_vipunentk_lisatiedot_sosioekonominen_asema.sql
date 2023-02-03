use [VipunenTK_lisatiedot]
go


if not exists (
	select * 
	from [dbo].[sosioekonominen_asema]
	where sosioekonominen_asema_koodi='X'
)

begin

  declare @id int = (select max(id) from [dbo].[sosioekonominen_asema])

  insert [dbo].[sosioekonominen_asema] (
	  id
	  ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[sosioekonominen_asema_koodi]
      ,[sosioekonominen_asema_ryhma]
      ,[sosioekonominen_asema_ryhma_SV]
      ,[sosioekonominen_asema_ryhma_EN]
      ,[sosioekonominen_asema]
      ,[sosioekonominen_asema_SV]
      ,[sosioekonominen_asema_EN]
      ,[jarjestys_ryhma]
      ,[jarjestys_asema]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  )
  select @id+1
	  ,[luotu]='2022-12-23'
      ,[alkaa]='1900-01-01'
      ,[paattyy]='9999-01-01'
      ,[sosioekonominen_asema_koodi]='X'
      ,[sosioekonominen_asema_ryhma]='Muut tai tuntematon'
      ,[sosioekonominen_asema_ryhma_SV]='Övriga eller information saknas'
      ,[sosioekonominen_asema_ryhma_EN]='Others or missing data'
      ,[sosioekonominen_asema]='Muut tai tuntematon'
      ,[sosioekonominen_asema_SV]='Övriga eller information saknas'
      ,[sosioekonominen_asema_EN]='Others or missing data'
      ,[jarjestys_ryhma]='8'
      ,[jarjestys_asema]='98'
      ,[virhetilanne]='E'
      ,[poistettu]=' '
      ,[tietolahde]='Manuaalinen'
      ,[kommentti]='CSC Juha'

end