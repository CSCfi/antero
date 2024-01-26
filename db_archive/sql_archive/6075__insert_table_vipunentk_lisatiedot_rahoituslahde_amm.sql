/****** Script for SelectTopNRows command from SSMS  ******/
use [VipunenTK_lisatiedot]
go

if not exists (
	select top 1 1 from [dbo].[rahoituslahde_amm]
	where rahoituslahde_amm_koodi = '13'
)
begin
	insert [dbo].[rahoituslahde_amm] (
		[id]
		,[luotu]
		--,[alkaa]
		--,[paattyy]
		,[rahoituslahde_amm_koodi]
		,[rahoituslahde_amm]
		,[rahoituslahde_amm_SV]
		,[rahoituslahde_amm_EN]
		,[jarjestys]
		,[virhetilanne]
		,[poistettu]
		,[tietolahde]
		,[kommentti]
	)
	values (
		13
		,'2022-03-29'
		--,[alkaa]
		--,[paattyy]
		,'13'
		,'Työvoimakoulutus (valtiosopimukseen perustuva rahoitus)'
		,'Arbetskraftsutbildning (som baserar sig på ett avtal med staten)'
		,'Labour market training (based on an agreement with the state)'
		,'1130'
		,'E'
		,' '
		,'Manuaalinen'
		,'CSC Juha'
	)
end
