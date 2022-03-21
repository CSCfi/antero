use VipunenTK_lisatiedot
go

if not exists (select top 1 * from [dbo].[Vipunen_aineisto_fakta_proseduuri] where [aineisto_avain] = 'TK_K2_22c')
begin

  insert into [dbo].[Vipunen_aineisto_fakta_proseduuri]([aineisto_avain], fakta, proseduuri)
  values('TK_K2_22c', 'f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus', 'p_lataa_perusopetuksen_erityisopetus')

  insert into [dbo].[Vipunen_aineisto_fakta_proseduuri]([aineisto_avain], fakta, proseduuri)
  values('TK_K2_22c', 'f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm', 'p_lataa_perusopetuksen_erityisopetus')
  
  insert into [dbo].[Vipunen_aineisto_fakta_proseduuri]([aineisto_avain], fakta, proseduuri)
  values('TK_K2_22c', 'f_Perusasteen_erityisopetus_tukea_saavien_oppilaiden_lkm', 'p_lataa_perusopetuksen_erityisopetus')
  
end