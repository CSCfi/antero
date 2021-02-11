use [VipunenTK_lisatiedot]
go
/****** Script for SelectTopNRows command from SSMS  ******/

update [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri]
set proseduuri = 'p_lataa_f_4_5',
fakta = 'f_4_5_Tyovoimatutkimus_tyolliset' 
where aineisto_avain = 'TK_R4_5'

update [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri]
set proseduuri = 'p_lataa_f_4_6ab',
fakta = 'f_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat' 
where aineisto_avain = 'TK_R4_6a'

update [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri]
set proseduuri = 'p_lataa_f_4_6ab',
fakta = 'f_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat' 
where aineisto_avain = 'TK_R4_6b'

go
use [ANTERO]