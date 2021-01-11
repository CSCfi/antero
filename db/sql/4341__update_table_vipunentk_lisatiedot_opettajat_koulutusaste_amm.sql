/****** Script for SelectTopNRows command from SSMS  ******/
use VipunenTK_lisatiedot
go

update [VipunenTK_lisatiedot].[dbo].[opettajat_koulutusaste_amm] 
set koulutusaste_SV = 'Övrig yrkesutbildning (som fördjupar/kompletterar yrkeskompetensen eller förbereder för yrkesuppgifter)'
,koulutusaste_EN = 'Other vocational education (to intensify/supplement professional competence or preparatory for a professional task)'
where koulutusaste = 'Muu ammatillinen koulutus (osaamista syventävä, täydentävä tai tehtävään valmistava)'

go
use antero