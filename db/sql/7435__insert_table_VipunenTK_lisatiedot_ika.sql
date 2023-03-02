/****** Script for SelectTopNRows command from SSMS  ******/
use [VipunenTK_lisatiedot]
go

if not exists (select * from [dbo].[ika] where [ika_avain] = 'ikar6_18')
begin
	insert [dbo].[ika] (
	  [id]
      ,[luotu]
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
	select 
	  [id] = (select max(id)+1 from [dbo].[ika])
      ,[luotu] = '2023-03-02'
      ,[ika_avain] = 'ikar6_18'
      ,[ika_int] = -1
      ,[ika] = '18–24-vuotiaat'
      ,[ika_SV] = '18–24 år'
      ,[ika_EN] = 'Aged 18–24'
      ,[ika5v_int] = -1
      ,[ika5v] = 'Tuntematon'
      ,[ika5v_SV] = 'Okänt'
      ,[ika5v_EN] = 'Unknown'
      ,[jarjestys_ika] = 'ikar6_18'
      ,[jarjestys_ika5v] = 'ikar6_18'
      ,[virhetilanne]= 'E'
      ,[poistettu] = ' '
      ,[tietolahde] = 'Manuaalinen'
      ,[kommentti] = 'CSC Juha'
end