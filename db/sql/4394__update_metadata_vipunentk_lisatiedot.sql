use [VipunenTK_lisatiedot]
go

  if not exists (select * from [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri] where aineisto_avain like '%2_11b%')
  
  begin
	insert into [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri]
	 ([aineisto_avain]
      ,[fakta]
      ,[proseduuri]) values ('TK_2_11b', 'f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili', 'p_lataa_f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili')
  end
  ;
  
  if not exists (select * from [VipunenTK_lisatiedot].[dbo].[Vipunen_kuutio] where kuutio_avain = 'TJK_PROF_TAB')

  begin
	insert into [VipunenTK_lisatiedot].[dbo].[Vipunen_kuutio]
	 ([kuutio_nimi]
      ,[kuutio_avain]
      ,[kuutio_toteutustyyppi]
      ,[kuutio_projekti]
      ,[kuutio_prosessointiryhma]
      ,[ajotunnus]) values ('Vapaan sivistystyon opiskelijaprofiili', 'TJK_PROF_TAB', 'tabular', 'Tutkintoon johtamaton koulutus', 'TK', 'vipunen')
  end
  ;
  
  if not exists (select * from [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] where kuutio_avain = 'TJK_PROF_TAB')

  begin
	insert into [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio]
	 ([aineisto_avain]
      ,[kuutio_avain]) values ('TK_2_11b', 'TJK_PROF_TAB')
  end
  ;
  
go
use antero