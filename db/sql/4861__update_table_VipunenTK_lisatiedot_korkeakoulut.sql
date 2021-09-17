use VipunenTK_lisatiedot
go

  update [dbo].[korkeakoulut]
  set oppilaitos = 'Tampereen yliopisto'
  ,oppilaitos_SV = 'Tammerfors universitet'
  ,oppilaitos_EN = 'University of Tampere'
  where oppilaitoskoodi = '01915'
  