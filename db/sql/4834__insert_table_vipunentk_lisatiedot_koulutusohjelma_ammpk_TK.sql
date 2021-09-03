use [VipunenTK_lisatiedot]
go

if not exists (select * from [dbo].[koulutusohjelma_ammpk_TK] where [koulutusohjelma_ammpk_koodi] = '8537')
insert into [dbo].[koulutusohjelma_ammpk_TK]
([id],[luotu],[alkaa],[paattyy],[koulutusohjelma_ammpk_koodi],[koulutusohjelma_ammpk],[koulutusohjelma_ammpk_SV],[koulutusohjelma_ammpk_EN],[jarjestys],[virhetilanne],[poistettu],[tietolahde],[kommentti])
values 
((select max(id)+1 from [dbo].[koulutusohjelma_ammpk_TK]),'2021-09-01','1900-01-01','9999-01-01'
,'8537'
,'Kompetensområdet skivindustrin'
,'Kompetensområdet skivindustrin'
,'Training programme in record industry'
,1,'E',0,'Tilastokeskus','CSC Juha');

if not exists (select * from [dbo].[koulutusohjelma_ammpk_TK] where [koulutusohjelma_ammpk_koodi] = '8550')
insert into [dbo].[koulutusohjelma_ammpk_TK]
([id],[luotu],[alkaa],[paattyy],[koulutusohjelma_ammpk_koodi],[koulutusohjelma_ammpk],[koulutusohjelma_ammpk_SV],[koulutusohjelma_ammpk_EN],[jarjestys],[virhetilanne],[poistettu],[tietolahde],[kommentti])
values 
((select max(id)+1 from [dbo].[koulutusohjelma_ammpk_TK]),'2021-09-01','1900-01-01','9999-01-01'
,'8550'
,'Kompetensområdet livmedelsteknologi'
,'Kompetensområdet livmedelsteknologi'
,'Training programme in food technology'
,1,'E',0,'Tilastokeskus','CSC Juha');

if not exists (select * from [dbo].[koulutusohjelma_ammpk_TK] where [koulutusohjelma_ammpk_koodi] = '8599')
insert into [dbo].[koulutusohjelma_ammpk_TK]
([id],[luotu],[alkaa],[paattyy],[koulutusohjelma_ammpk_koodi],[koulutusohjelma_ammpk],[koulutusohjelma_ammpk_SV],[koulutusohjelma_ammpk_EN],[jarjestys],[virhetilanne],[poistettu],[tietolahde],[kommentti])
values 
((select max(id)+1 from [dbo].[koulutusohjelma_ammpk_TK]),'2021-09-01','1900-01-01','9999-01-01'
,'8599'
,'Kompetensområdet schaktningsmaskintransport'
,'Kompetensområdet schaktningsmaskintransport'
,'Training programme in excavation machine transport'
,1,'E',0,'Tilastokeskus','CSC Juha');

if not exists (select * from [dbo].[koulutusohjelma_ammpk_TK] where [koulutusohjelma_ammpk_koodi] = '8601')
insert into [dbo].[koulutusohjelma_ammpk_TK]
([id],[luotu],[alkaa],[paattyy],[koulutusohjelma_ammpk_koodi],[koulutusohjelma_ammpk],[koulutusohjelma_ammpk_SV],[koulutusohjelma_ammpk_EN],[jarjestys],[virhetilanne],[poistettu],[tietolahde],[kommentti])
values 
((select max(id)+1 from [dbo].[koulutusohjelma_ammpk_TK]),'2021-09-01','1900-01-01','9999-01-01'
,'8601'
,'Kompetensområdet ytbehandling av trävaror'
,'Kompetensområdet ytbehandling av trävaror'
,'Training programme in surface treatment of wood products'
,1,'E',0,'Tilastokeskus','CSC Juha');

if not exists (select * from [dbo].[koulutusohjelma_ammpk_TK] where [koulutusohjelma_ammpk_koodi] = '8642')
insert into [dbo].[koulutusohjelma_ammpk_TK]
([id],[luotu],[alkaa],[paattyy],[koulutusohjelma_ammpk_koodi],[koulutusohjelma_ammpk],[koulutusohjelma_ammpk_SV],[koulutusohjelma_ammpk_EN],[jarjestys],[virhetilanne],[poistettu],[tietolahde],[kommentti])
values 
((select max(id)+1 from [dbo].[koulutusohjelma_ammpk_TK]),'2021-09-01','1900-01-01','9999-01-01'
,'8642'
,'Kompetensområdet stenbranschen'
,'Kompetensområdet stenbranschen'
,'Training programme in stone industry'
,1,'E',0,'Tilastokeskus','CSC Juha');

if not exists (select * from [dbo].[koulutusohjelma_ammpk_TK] where [koulutusohjelma_ammpk_koodi] = '8649')
insert into [dbo].[koulutusohjelma_ammpk_TK]
([id],[luotu],[alkaa],[paattyy],[koulutusohjelma_ammpk_koodi],[koulutusohjelma_ammpk],[koulutusohjelma_ammpk_SV],[koulutusohjelma_ammpk_EN],[jarjestys],[virhetilanne],[poistettu],[tietolahde],[kommentti])
values 
((select max(id)+1 from [dbo].[koulutusohjelma_ammpk_TK]),'2021-09-01','1900-01-01','9999-01-01'
,'8649'
,'Kompetensområdet bild- och mediekonst'
,'Kompetensområdet bild- och mediekonst'
,'Training programme in visual and media arts'
,1,'E',0,'Tilastokeskus','CSC Juha');

if not exists (select * from [dbo].[koulutusohjelma_ammpk_TK] where [koulutusohjelma_ammpk_koodi] = '8656')
insert into [dbo].[koulutusohjelma_ammpk_TK]
([id],[luotu],[alkaa],[paattyy],[koulutusohjelma_ammpk_koodi],[koulutusohjelma_ammpk],[koulutusohjelma_ammpk_SV],[koulutusohjelma_ammpk_EN],[jarjestys],[virhetilanne],[poistettu],[tietolahde],[kommentti])
values 
((select max(id)+1 from [dbo].[koulutusohjelma_ammpk_TK]),'2021-09-01','1900-01-01','9999-01-01'
,'8656'
,'Kompetensområdet ventilationsmontering'
,'Kompetensområdet ventilationsmontering'
,'Training programme in ventilation mounting'
,1,'E',0,'Tilastokeskus','CSC Juha');

if not exists (select * from [dbo].[koulutusohjelma_ammpk_TK] where [koulutusohjelma_ammpk_koodi] = '8657')
insert into [dbo].[koulutusohjelma_ammpk_TK]
([id],[luotu],[alkaa],[paattyy],[koulutusohjelma_ammpk_koodi],[koulutusohjelma_ammpk],[koulutusohjelma_ammpk_SV],[koulutusohjelma_ammpk_EN],[jarjestys],[virhetilanne],[poistettu],[tietolahde],[kommentti])
values 
((select max(id)+1 from [dbo].[koulutusohjelma_ammpk_TK]),'2021-09-01','1900-01-01','9999-01-01'
,'8657'
,'Kompetensområdet kylmontering'
,'Kompetensområdet kylmontering'
,'Training programme in cooling assemblies'
,1,'E',0,'Tilastokeskus','CSC Juha');

if not exists (select * from [dbo].[koulutusohjelma_ammpk_TK] where [koulutusohjelma_ammpk_koodi] = '8665')
insert into [dbo].[koulutusohjelma_ammpk_TK]
([id],[luotu],[alkaa],[paattyy],[koulutusohjelma_ammpk_koodi],[koulutusohjelma_ammpk],[koulutusohjelma_ammpk_SV],[koulutusohjelma_ammpk_EN],[jarjestys],[virhetilanne],[poistettu],[tietolahde],[kommentti])
values 
((select max(id)+1 from [dbo].[koulutusohjelma_ammpk_TK]),'2021-09-01','1900-01-01','9999-01-01'
,'8665'
,'Kompetensområdet fotvård'
,'Kompetensområdet fotvård'
,'Training programme in chiropody'
,1,'E',0,'Tilastokeskus','CSC Juha');

