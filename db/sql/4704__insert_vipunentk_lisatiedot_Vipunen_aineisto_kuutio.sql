use VipunenTK_lisatiedot
go

if not exists (select top 1 * from [dbo].[Vipunen_aineisto_kuutio] where [aineisto_avain] = 'TK_K2_4h')
begin

  insert into [dbo].[Vipunen_aineisto_kuutio]([aineisto_avain], kuutio_avain)
  values('TK_K2_4h', 'I_KL_TAB')

  insert into [dbo].[Vipunen_aineisto_kuutio]([aineisto_avain], kuutio_avain)
  values('TK_K2_4h', 'I_UOSI_TAB')

  insert into [dbo].[Vipunen_aineisto_kuutio]([aineisto_avain], kuutio_avain)
  values('TK_K2_4h', 'LAKKK_TAB')

  insert into [dbo].[Vipunen_aineisto_kuutio]([aineisto_avain], kuutio_avain)
  values('TK_K2_4h', 'OTV_TA_TAB')

  insert into [dbo].[Vipunen_aineisto_kuutio]([aineisto_avain], kuutio_avain)
  values('TK_K2_4h', 'OTVY_TAB')

  insert into [dbo].[Vipunen_aineisto_kuutio]([aineisto_avain], kuutio_avain)
  values('TK_K2_4h', 'TAOT_TAB')

  insert into [dbo].[Vipunen_aineisto_kuutio]([aineisto_avain], kuutio_avain)
  values('TK_K2_4h', 'TIM_TAB')

  insert into [dbo].[Vipunen_aineisto_kuutio]([aineisto_avain], kuutio_avain)
  values('TK_K2_4h', 'UUV_YHT_TAB')

end







