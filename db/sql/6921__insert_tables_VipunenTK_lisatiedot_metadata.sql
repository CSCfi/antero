use VipunenTK_lisatiedot
go


if not exists (select * from [dbo].[Vipunen_aineisto] where aineisto_avain in ('TK_K4_2d'))
begin

  insert [dbo].[Vipunen_aineisto]
  select '4.2d Väestön koulutusrakenne (sis. syntyperä)', 'TK_K4_2d', 'Väestö- ja työmarkkina- aineistot', '12', '-1'

end
;

if not exists (select * from [dbo].[Vipunen_aineisto_fakta_proseduuri] where aineisto_avain in ('TK_K4_2d'))
begin

  insert [dbo].[Vipunen_aineisto_fakta_proseduuri]
  select 'TK_K4_2d', 'f_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan', 'p_lataa_f_4_2d'

end
;

if not exists (select * from [dbo].[Vipunen_kuutio] where [kuutio_avain] = 'VKR_SYP_TAB')
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
	'Väestön koulutusrakenne syntyperän mukaan'
    ,'VKR_SYP_TAB'
    ,'tabular'
    ,'Väestön koulutusrakenne'
    ,'TK'
    ,'vipunen'
  )
  
end
;

if not exists (select * from [dbo].[Vipunen_aineisto_kuutio] where [kuutio_avain] = 'VKR_SYP_TAB' and [aineisto_avain] in ('TK_K4_2d'))
begin

  insert [dbo].[Vipunen_aineisto_kuutio] 
  select 'TK_K4_2d', 'VKR_SYP_TAB'

end
;