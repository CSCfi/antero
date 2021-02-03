use [VipunenTK_lisatiedot]
go

  if not exists (select * from [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] where kuutio_avain = 'TJK_PROF_TAB')

  begin
	insert into [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio]
	 ([aineisto_avain]
      ,[kuutio_avain]) values ('TK_2_11b', 'TJK_PROF_TAB')
  end
  
go
use antero