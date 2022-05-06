/****** Script for SelectTopNRows command from SSMS  ******/
use [VipunenTK_lisatiedot]
go

if (select count(*) from [dbo].[kylla_ei] where [kylla_ei_koodi]='2') = 0

begin

	insert [dbo].[kylla_ei] (
		[id]
		,[luotu]
		,[kylla_ei_koodi]
		,[kylla_ei]
		,[kylla_ei_SV]
		,[kylla_ei_EN]
		,[jarjestys]
		,[virhetilanne]
		,[poistettu]
		,[tietolahde]
		,[kommentti]
	)
	values
	(
		5
		,'2022-05-05'
		,'2'
		,'Ei'
		,'Nej'
		,'No'
		,1010
		,'E'
		,' '
		,'Manuaalinen'
		,'CSC Juha'
	)

end