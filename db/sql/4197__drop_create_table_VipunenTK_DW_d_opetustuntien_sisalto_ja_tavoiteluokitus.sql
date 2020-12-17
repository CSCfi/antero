use VipunenTK_DW
go

drop TABLE VipunenTK_DW.dbo.d_opetustuntien_sisalto_ja_tavoiteluokitus;
SELECT * INTO VipunenTK_DW.dbo.d_opetustuntien_sisalto_ja_tavoiteluokitus
FROM VipunenTK_lisatiedot.[dbo].[v_opetustuntien_sisalto_ja_tavoiteluokitus] 
WHERE virhetilanne = 'E'

go
use antero