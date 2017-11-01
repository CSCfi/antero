ALTER procedure [dw].[p_lataa_d_yo] as

if (select count(1) from dw.d_yo where yo_tunnus = '-1') = 0
begin
	TRUNCATE TABLE dw.d_yo
    INSERT dw.d_yo (yo_tunnus, yo_nimi_fi, yo_nimi_sv, yo_nimi_en, source) VALUES (N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'etl: p_lataa_d_yo')
End

merge dw.d_yo as target
using (select koodi
      ,coalesce(nimi, nimi_sv, nimi_en) as nimi
      ,coalesce(nimi_sv, nimi, nimi_en) as nimi_sv
      ,coalesce(nimi_en, nimi, nimi_sv) as nimi_en
    ,'etl: p_lataa_d_yo' as source
  from sa.sa_oppilaitosluokitus
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

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo' AND COLUMN_NAME='jarjestys_yo_koodi')

	BEGIN
		ALTER TABLE dw.d_yo ADD jarjestys_yo_koodi AS case when yo_tunnus = '-1' then 'ZZZZZ' else cast(yo_tunnus as varchar(10))
		END
	END
