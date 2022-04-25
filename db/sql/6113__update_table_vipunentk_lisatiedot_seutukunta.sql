use vipunentk_lisatiedot
go

update [dbo].[seutukunta] set jarjestys -= 1 
where seutukunta_koodi in ('015','016')
