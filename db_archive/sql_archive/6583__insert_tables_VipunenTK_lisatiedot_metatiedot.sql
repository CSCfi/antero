use VipunenTK_lisatiedot
go

--2.8f, 2.9d; 4.3b


--2.8f, 2.9d
if not exists (select * from [dbo].[Vipunen_aineisto] where aineisto_avain in ('TK_K2_8f','TK_K2_9d'))
begin

  insert [dbo].[Vipunen_aineisto]
  select '2.8f Korkeakouluopiskelijat (sis. syntyperä)', 'TK_K2_8f', 'Opiskelija- opinto- ja tutkintoaineistot', '6', '-1'
  
  insert [dbo].[Vipunen_aineisto]
  select '2.9d Korkeakoulututkinnot (sis. syntyperä)', 'TK_K2_9d', 'Opiskelija- opinto- ja tutkintoaineistot', '6', '-1'

end
;

if not exists (select * from [dbo].[Vipunen_aineisto_fakta_proseduuri] where aineisto_avain in ('TK_K2_8f','TK_K2_9d'))
begin

  insert [dbo].[Vipunen_aineisto_fakta_proseduuri]
  select 'TK_K2_8f', 'f_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan', 'p_lataa_f_2_8f_2_9d'
  
  insert [dbo].[Vipunen_aineisto_fakta_proseduuri]
  select 'TK_K2_9d', 'f_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan', 'p_lataa_f_2_8f_2_9d'

end
;

if not exists (select * from [dbo].[Vipunen_kuutio] where [kuutio_avain] = 'OTV_KK_SYP_TAB')
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
	'OTV korkeakoulut syntypera'
    ,'OTV_KK_SYP_TAB'
    ,'tabular'
    ,'OTV'
    ,'TK'
    ,'vipunen'
  )
  
end
;

if not exists (select * from [dbo].[Vipunen_aineisto_kuutio] where [kuutio_avain] = 'OTV_KK_SYP_TAB' and [aineisto_avain] in ('TK_K2_8f','TK_K2_9d'))
begin

  insert [dbo].[Vipunen_aineisto_kuutio] 
  select 'TK_K2_8f', 'OTV_KK_SYP_TAB'

  insert [dbo].[Vipunen_aineisto_kuutio] 
  select 'TK_K2_9d', 'OTV_KK_SYP_TAB'
  
end
;


--4.3b
if not exists (select * from [dbo].[Vipunen_aineisto] where aineisto_avain in ('TK_K4_3b'))
begin

  insert [dbo].[Vipunen_aineisto]
  select '4.3b Tutkinnon suorittaneiden pääasiallinen toiminta (sis. syntyperä)', 'TK_K4_3b', 'Väestö- ja työmarkkina- aineistot', '4', '-2'

end
;

if not exists (select * from [dbo].[Vipunen_aineisto_fakta_proseduuri] where aineisto_avain in ('TK_K4_3b'))
begin

  insert [dbo].[Vipunen_aineisto_fakta_proseduuri]
  select 'TK_K4_3b', 'f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan', 'p_lataa_f_4_3b'

end
;

if not exists (select * from [dbo].[Vipunen_kuutio] where [kuutio_avain] = 'TY_SYP_TAB')
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
	'Työllistyminen syntyperän mukaan'
    ,'TY_SYP_TAB'
    ,'tabular'
    ,'Työllistyminen'
    ,'TK'
    ,'vipunen'
  )
  
end
;

if not exists (select * from [dbo].[Vipunen_aineisto_kuutio] where [kuutio_avain] = 'TY_SYP_TAB' and [aineisto_avain] in ('TK_K4_3b'))
begin

  insert [dbo].[Vipunen_aineisto_kuutio] 
  select 'TK_K4_3b', 'TY_SYP_TAB'

end
;