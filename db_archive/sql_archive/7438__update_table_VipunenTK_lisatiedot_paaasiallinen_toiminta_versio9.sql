use [VipunenTK_lisatiedot]
go

update [dbo].[paaasiallinen_toiminta_versio9]
set [paaasiallinen_toiminta_versio9] = 'Muut (sisältää eläkeläiset, varusmiehet/siviilipalvelusmiehet ja muut työvoiman ulkopuoliset)'
where paaasiallinen_toiminta_versio9_koodi = '30'
