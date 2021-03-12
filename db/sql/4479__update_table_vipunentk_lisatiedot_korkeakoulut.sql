go use VipunenTK_lisatiedot

if not exists (select * from [VipunenTK_lisatiedot].[dbo].[korkeakoulut] where oppilaitoskoodi = '10126')
begin
  insert into [VipunenTK_lisatiedot].[dbo].[korkeakoulut] 
	([oppilaitoskoodi]
    ,[oppilaitos]
    ,[oppilaitos_SV]
    ,[oppilaitos_EN])
  values ('10126', 'LAB-ammattikorkeakoulu', 'LAB-ammattikorkeakoulu', 'LAB University of Applied Sciences')
end

update [VipunenTK_lisatiedot].[dbo].[korkeakoulut]
set oppilaitos = 'LAB-ammattikorkeakoulu', oppilaitos_SV = 'LAB-ammattikorkeakoulu', oppilaitos_EN = 'LAB University of Applied Sciences'
where oppilaitos in ('Lahden ammattikorkeakoulu', 'Saimaan ammattikorkeakoulu')

go use antero