create procedure dbo.p_lataa_d_yo as

merge dbo.d_yo as target
using (select koodi
      ,coalesce(nimi, nimi_sv, nimi_en) as nimi
      ,coalesce(nimi_sv, nimi, nimi_en) as nimi_sv
      ,coalesce(nimi_en, nimi, nimi_sv) as nimi_en
	  ,'etl: p_lataa_d_yo' as source
  from vipunen_sa.dbo.sa_oppilaitosluokitus
  where oppilaitostyyppikoodi = '42') as src
on target.yo_tunnus = src.koodi
when matched then 
	update set yo_nimi_fi = src.nimi,
				yo_nimi_sv = src.nimi_sv,
				yo_nimi_en = src.nimi_en,
				target.source = src.source
when not matched then
	insert (yo_tunnus
           ,yo_nimi_fi
           ,yo_nimi_sv
           ,yo_nimi_en
           ,source)
	values (src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source);