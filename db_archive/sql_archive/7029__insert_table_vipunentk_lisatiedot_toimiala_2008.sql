use [VipunenTK_lisatiedot]
go


if not exists (
	select * 
	from [dbo].[toimiala_2008] 
	where [toimiala_2008_avain]='Y'
)

begin

  declare @id int = (select max(id) from [dbo].[toimiala_2008])

  insert [dbo].[toimiala_2008] (
	  id
	  ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[toimiala_2008_avain]
      ,[toimiala_2008_koodi]
      ,[toimiala_2008]
      ,[toimiala_2008_SV]
      ,[toimiala_2008_EN]
      ,[taso]
      ,[taso1]
      ,[jarjestys]
      ,[jarjestys_taso]
      ,[jarjestys_taso1]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  )
  select @id+1
	  ,[luotu]='2022-12-23'
      ,u.[alkaa]
      ,u.[paattyy]
      ,[toimiala_2008_avain]='Y'
      ,[toimiala_2008_koodi]='Y'
      ,[toimiala_2008]=x.toimiala_2008 + ' tai ' + lower(u.toimiala_2008)
      ,[toimiala_2008_SV]=x.toimiala_2008_SV + ' eller ' + lower(u.toimiala_2008_SV)
      ,[toimiala_2008_EN]=x.toimiala_2008_EN + ' or ' + lower(u.toimiala_2008_EN)
      ,u.[taso]
      ,[taso1]='Y'
      ,u.[jarjestys]
      ,u.[jarjestys_taso]
      ,u.[jarjestys_taso1]
      ,u.[virhetilanne]
      ,u.[poistettu]
      ,[tietolahde]='TK 1.21b ja 1.22b'
      ,[kommentti]='CSC Juha'
	from [dbo].[toimiala_2008] u
	cross apply (select * from [dbo].[toimiala_2008] where toimiala_2008_avain='X') x
	where u.toimiala_2008_avain='U'

end