IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_amk_kelpoisuus') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_amk_kelpoisuus AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_amk_koulutustyyppi') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_amk_koulutustyyppi AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_amk_liikkuvuusohjelma') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_amk_liikkuvuusohjelma AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_amk_muun_henkilokunnan_henkilostoryhma') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_amk_muun_henkilokunnan_henkilostoryhma AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_amk_paatoimiset_opettajat') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_amk_paatoimiset_opettajat AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_amk_tehtavanjaottelu') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_amk_tehtavanjaottelu AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_amk_toimipisteen_toimipaikka') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_amk_toimipisteen_toimipaikka AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_ek_nimike') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_ek_nimike AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_koulutusala_1995') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_koulutusala_1995 AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_koulutusala_2002') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_koulutusala_2002 AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_suorat_liikkuvuudentyyppi') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_suorat_liikkuvuudentyyppi AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_yo_harjoittelukoulujen_henkilostoryhma') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_yo_harjoittelukoulujen_henkilostoryhma AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_yo_henkilostoryhma') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_yo_henkilostoryhma AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_yo_nimitystapa') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_yo_nimitystapa AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_yo_tehtavanjaottelu') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_yo_tehtavanjaottelu AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_yo_tiedekunta') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_yo_tiedekunta AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_yo_toimipiste') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_yo_toimipiste AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_yo_toimipisteen_toimipaikka') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_yo_toimipisteen_toimipaikka AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_yo_tutkijanuravaihe') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_yo_tutkijanuravaihe AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_yo_valinta_kutsumenettelylla') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_d_yo_valinta_kutsumenettelylla AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_henkilon_tyo') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_amk_henkilon_tyo AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_julkaisut_f_i') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_amk_julkaisut_f_i AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_luennoitsijat') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_amk_luennoitsijat AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_opettaja_ja_henkilostoliikkuvuus') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_amk_opettaja_ja_henkilostoliikkuvuus AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_opinnaytetyot') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_amk_opinnaytetyot AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_ostopalveluna_hankittu_tyo') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_amk_ostopalveluna_hankittu_tyo AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_sivutoimiset_opettajat') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_amk_sivutoimiset_opettajat AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_talous') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_amk_talous AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_avoimen_yliopiston_kautta_opiskelevat') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_yo_avoimen_yliopiston_kautta_opiskelevat AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_erillisella_opinto_oikeudella_opiskelevat') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_yo_erillisella_opinto_oikeudella_opiskelevat AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_harjoittelukoulujen_opintopisteet') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_yo_harjoittelukoulujen_opintopisteet AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_harjoittelukoulut') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_yo_harjoittelukoulut AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_henkilon_tyo') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_yo_henkilon_tyo AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_julkaisut_f_i') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_yo_julkaisut_f_i AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_opettaja_ja_tutkijavierailut') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_yo_opettaja_ja_tutkijavierailut AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_taydennyskoulutukset_jarjestetty') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_yo_taydennyskoulutukset_jarjestetty AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_taydennyskoulutukset_osallistumiset') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_yo_taydennyskoulutukset_osallistumiset AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_tilat') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_yo_tilat AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_toimipisteet') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'dw.p_lataa_f_yo_toimipisteet AS' END
