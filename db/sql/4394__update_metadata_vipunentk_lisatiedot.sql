use [VipunenTK_lisatiedot]
go

  if not exists (select * from [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri] where aineisto_avain like '%2_11b%')
  
  begin
	insert into [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri]
	 ([aineisto_avain]
      ,[fakta]
      ,[proseduuri]) values ('TK_2_11b', 'f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili', 'p_lataa_f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili')
  end
  
go
use antero