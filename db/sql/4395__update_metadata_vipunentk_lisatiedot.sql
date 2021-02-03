use [VipunenTK_lisatiedot]
go
  
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
 
go
use antero