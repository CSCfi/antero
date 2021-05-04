/****** Script for SelectTopNRows command from SSMS  ******/
use VipunenTK_lisatiedot
go

update [VipunenTK_lisatiedot].[dbo].[koulutusmuoto]
set koulutusmuoto_SV = 'utbildning för unga, utbildning inom skolsystemet (grundläggande utbildning, gymnasieutbildning för unga enligt läroplanen, annan yrkesexamen än fristående examen, yrkeshögskoleutbildning för unga, universitetsutbildning), omfattar även examina inom det militära området och examina avlagda utomlands.'
,koulutusmuoto_EN = 'youth education, education under the education system (basic education, general upper secondary education following the curriculum for young people, vocational other than competence-based qualification, polytechnic education for young people, university education), includes armed forces qualifications and qualifications attained abroad.'
where koulutusmuoto_koodi = '1'
go