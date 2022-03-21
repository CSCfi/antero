use VipunenTK_lisatiedot
go

if not exists (select top 1 * from [dbo].[Vipunen_aineisto_kuutio] where [aineisto_avain] = 'TK_K2_22c')
begin
  insert into [dbo].[Vipunen_aineisto_kuutio]([aineisto_avain], kuutio_avain)
  values('TK_K2_22c', 'PAEO_TAB')
end
