use VipunenTK_lisatiedot
go

if not exists (select top 1 * from [dbo].[Vipunen_aineisto_fakta_proseduuri] where [aineisto_avain] = 'TK_K2_4h')
begin

  insert into [dbo].[Vipunen_aineisto_fakta_proseduuri]([aineisto_avain], fakta, proseduuri)
  values('TK_K2_4h', 'f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', 'p_lataa_f_2_3efg')

  insert into [dbo].[Vipunen_aineisto_fakta_proseduuri]([aineisto_avain], fakta, proseduuri)
  values('TK_K2_4h', 'f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', 'p_lataa_f_2_3h')
  
  insert into [dbo].[Vipunen_aineisto_fakta_proseduuri]([aineisto_avain], fakta, proseduuri)
  values('TK_K2_4h', 'f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot', 'p_lataa_f_2_4efg')
  
  insert into [dbo].[Vipunen_aineisto_fakta_proseduuri]([aineisto_avain], fakta, proseduuri)
  values('TK_K2_4h', 'f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', 'p_lataa_OTV_f_2_3')
  
  insert into [dbo].[Vipunen_aineisto_fakta_proseduuri]([aineisto_avain], fakta, proseduuri)
  values('TK_K2_4h', 'f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot', 'p_lataa_OTV_f_2_4')

end
