use VipunenTK_lisatiedot



if exists (select * from [VipunenTK_lisatiedot].[dbo].[perusopetuksen_yleisopetuksen_osuus] where [perusopetuksen_yleisopetuksen_osuus_koodi] = 'int_tuntem')
begin
   update [VipunenTK_lisatiedot].[dbo].[perusopetuksen_yleisopetuksen_osuus]
   set jarjestys = '1980'
   where [perusopetuksen_yleisopetuksen_osuus_koodi] = 'int_tuntem'
end

