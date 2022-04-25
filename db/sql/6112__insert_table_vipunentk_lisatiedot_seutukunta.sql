
if (select count(*) from [dbo].[seutukunta] where seutukunta_koodi in ('015','016')) = 0

begin

	update [dbo].[seutukunta] set jarjestys *= 10 
	
	insert [dbo].[seutukunta] 
	select [id] = (select max(id) from [dbo].[seutukunta]) + seutukunta_koodi - 200
      ,[luotu] = '2022-04-25'
      ,[alkaa]
      ,[paattyy]
      ,[seutukunta_koodi] = case seutukunta_koodi when '201' then '015' when '202' then '016' end
      ,[koodinselite]
      ,[koodinselite_SV]
      ,[koodinselite_EN]
      ,[jarjestys] = jarjestys + 1
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti] 
	from [dbo].[seutukunta] 
	where seutukunta_koodi in ('201','202')

end
