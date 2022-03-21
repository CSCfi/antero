USE [VipunenTK_lisatiedot]
GO

IF NOT EXISTS (SELECT * FROM [VipunenTK_lisatiedot].[dbo].[opettajat_aine] where id=57 or aine_koodi='56')

BEGIN

insert [VipunenTK_lisatiedot].[dbo].[opettajat_aine] (id,luotu,aine_koodi,aine,aine_SV,aine_EN,jarjestys,virhetilanne,poistettu,tietolahde,kommentti)
values (57,'2020-07-01','56','pienryhmäinen muun kuin ev.-lut. tai ortodoksisen uskonnon opettaja','religion, annan än evangelisk-luthersk eller ortodox (undervisning i smågrupp)'
,'religion, other than Evangelical-Lutheran or Orthodox (small-group teaching)','1065','E         ',' ','Tilastokeskus','CSC Juha')

END
GO

update [VipunenTK_lisatiedot].[dbo].[opettajat_aine] set jarjestys = '9999' where aine_koodi='99'
GO
 
USE [ANTERO]
