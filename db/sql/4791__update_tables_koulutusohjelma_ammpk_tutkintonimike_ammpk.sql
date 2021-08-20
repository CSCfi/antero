use [VipunenTK_lisatiedot]
go

update [dbo].[koulutusohjelma_ammpk]
set luotu = '2021-08-20'
where tietolahde not in ('Manuaalinen','Tilastokeskus')
  and luotu <> '2021-08-20'

update [dbo].[tutkintonimike_ammpk]
set luotu = '2021-08-20'
where tietolahde not in ('Manuaalinen','Tilastokeskus')
  and luotu <> '2021-08-20'