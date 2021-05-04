use [VipunenTK_lisatiedot]
go

update [dbo].[tutkintolaji_tyollistymiseen] 
set tutkintolaji_tyollistymiseen = 'Ammatillinen perustutkinto (opetussuunnitelmaperusteinen)'
,tutkintolaji_tyollistymiseen_SV = 'Grundläggande yrkesexamen (läroplansgrundad)'
,tutkintolaji_tyollistymiseen_EN = 'Vocational upper secondary qualification (curriculum-based)'
where tutkintolaji_tyollistymiseen_koodi = '04'

update [dbo].[tutkintolaji_tyollistymiseen] 
set tutkintolaji_tyollistymiseen = 'Ammatillinen perustutkinto (näyttötutkinto)'
,tutkintolaji_tyollistymiseen_SV = 'Grundläggande yrkesexamen (fristående examen)'
,tutkintolaji_tyollistymiseen_EN = 'Vocational upper secondary qualification (competence-based)'
where tutkintolaji_tyollistymiseen_koodi = '05'

go