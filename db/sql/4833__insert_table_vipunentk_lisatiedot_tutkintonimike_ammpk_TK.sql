use [VipunenTK_lisatiedot]
go

if not exists (select * from [dbo].tutkintonimike_ammpk_TK where tutkintonimike_ammpk_koodi = '10100')
insert into [dbo].[tutkintonimike_ammpk_TK]
([id],[luotu],[alkaa],[paattyy],[tutkintonimike_ammpk_koodi],[tutkintonimike_ammpk],[tutkintonimike_ammpk_SV],[tutkintonimike_ammpk_EN],[jarjestys],[virhetilanne],[poistettu],[tietolahde],[kommentti])
values 
((select max(id)+1 from [dbo].[tutkintonimike_ammpk_TK]),'2021-09-01','1900-01-01','9999-01-01'
,'10100'
,'Soitinhuoltaja'
,'Instrumentreparatör'
,'Instrument repairer'
,1,'E',0,'Tilastokeskus','CSC Juha');

if not exists (select * from [dbo].tutkintonimike_ammpk_TK where tutkintonimike_ammpk_koodi = '10150')
insert into [dbo].[tutkintonimike_ammpk_TK]
([id],[luotu],[alkaa],[paattyy],[tutkintonimike_ammpk_koodi],[tutkintonimike_ammpk],[tutkintonimike_ammpk_SV],[tutkintonimike_ammpk_EN],[jarjestys],[virhetilanne],[poistettu],[tietolahde],[kommentti])
values 
((select max(id)+1 from [dbo].[tutkintonimike_ammpk_TK]),'2021-09-01','1900-01-01','9999-01-01'
,'10150'
,'Ensihoitaja'
,'Akutvårdare på grundnivå'
,'Emergency practical nurse'
,1,'E',0,'Tilastokeskus','CSC Juha');

if not exists (select * from [dbo].tutkintonimike_ammpk_TK where tutkintonimike_ammpk_koodi = '10155')
insert into [dbo].[tutkintonimike_ammpk_TK]
([id],[luotu],[alkaa],[paattyy],[tutkintonimike_ammpk_koodi],[tutkintonimike_ammpk],[tutkintonimike_ammpk_SV],[tutkintonimike_ammpk_EN],[jarjestys],[virhetilanne],[poistettu],[tietolahde],[kommentti])
values 
((select max(id)+1 from [dbo].[tutkintonimike_ammpk_TK]),'2021-09-01','1900-01-01','9999-01-01'
,'10155'
,'Turvalaiteasentaja'
,'Säkerhetsanordningsmontör'
,'Safety systems installer'
,1,'E',0,'Tilastokeskus','CSC Juha');
