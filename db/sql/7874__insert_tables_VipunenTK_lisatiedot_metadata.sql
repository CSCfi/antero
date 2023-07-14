use VipunenTK_lisatiedot
go

if not exists (select * from [dbo].[Vipunen_kuutio] where [kuutio_avain] = 'TEA_TAB')
begin

  insert [dbo].[Vipunen_kuutio] (
	[kuutio_nimi]
    ,[kuutio_avain]
    ,[kuutio_toteutustyyppi]
    ,[kuutio_projekti]
    ,[kuutio_prosessointiryhma]
    ,[ajotunnus]
  )
  values (
	'Tutkintoennusteaineisto'
    ,'TEA_TAB'
    ,'tabular'
    ,'Tutkintoennuste'
    ,'TK'
    ,'vipunen'
  )
  
end
;

if not exists (
	select * from [dbo].[Vipunen_aineisto_kuutio] 
	where [kuutio_avain] = 'TEA_TAB' 
	and [aineisto_avain] in (
		'TK_K2_8b',
		'TK_K3_9',
		'TK_K3_10',
		'TK_K4_2a',
		'TK_K4_2c',
		'TK_K4_8'
	)
)
begin

  insert [dbo].[Vipunen_aineisto_kuutio] 
  select aineisto_avain, 'TEA_TAB'
  from (
	select 'TK_K2_4h' aineisto_avain
	union select 'TK_K2_8b'
	union select 'TK_K3_9'
	union select 'TK_K3_10'
	union select 'TK_K4_2a'
	union select 'TK_K4_2c'
	union select 'TK_K4_8'
  ) q
  
end
;