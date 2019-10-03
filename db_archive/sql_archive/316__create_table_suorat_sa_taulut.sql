IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk1_henkilokunta') BEGIN

CREATE TABLE [sa].[sa_suorat_amk1_henkilokunta](
	[Vuosi] [int] NULL,
	[Ammattikorkeakoulu] [nvarchar](55) NULL,
	[Henkilötunnus] [nvarchar](55) NULL,
	[Henkilönumero] [nvarchar](55) NULL,
	[Toimipaikka] [nvarchar](55) NULL,
	[Nimike] [nvarchar](255) NULL,
	[Merkittävimmän tutkinnon taso] [nvarchar](55) NULL,
	[Tutkinnon suoritusmaa] [nvarchar](55) NULL,
	[Sukupuoli] [nvarchar](2) NULL,
	[Syntymävuosi] [nvarchar](55) NULL,
	[Kansalaisuus] [nvarchar](55) NULL,
	[Äidinkieli] [nvarchar](55) NULL,
	[Nimitystapa (työsuhteen vakituisuus / määräaikaisuus)] [nvarchar](55) NULL,
	[Pääasiallinen koulutusala 2002] [nvarchar](55) NULL,
	[Pääasiallinen tieteenala] [nvarchar](55) NULL,
	[Tehtävänjaottelu] [nvarchar](55) NULL,
	[Päätoimiset opettajat] [int] NULL,
	[Muun henkilökunnan henkilöstöryhmä] [int] NULL,
	[Työajan käyttötiedot, opetus] [decimal](7, 4) NULL,
	[Työajan käyttötiedot, TKI-toiminta] [decimal](7, 4) NULL,
	[Työajan käyttötiedot, hallinto] [decimal](7, 4) NULL,
	[Kelpoisuus, tutkinto] [int] NULL,
	[Kelpoisuus, työkokemus] [int] NULL,
	[Kelpoisuus, opettajankoulutus] [int] NULL,
	[Henkilotyovuosi] [decimal](7, 4) NULL,
	[Henkilön suorittaman merkittävin tutkinto] [nvarchar](55) NULL,
	[ORCID-tunniste] [nvarchar](55) NULL,
	[CHECKSUM_AMK_HENKILOKUNTA] [int] NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [nvarchar](255) NULL,
	[Laitos tai vastaava] [nvarchar](255) NULL,
	[ohjauksenala_koodi] [varchar](38) NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk10_opettaja_ja_henkilostoliikkuvuus') BEGIN

CREATE TABLE [sa].[sa_suorat_amk10_opettaja_ja_henkilostoliikkuvuus](
	[vuosi] [int] NULL,
	[ammattikorkeakoulu] [varchar](5) NULL,
	[kohdemaa_lahtevat_tai_lahtomaa_saapuvat] [varchar](8) NULL,
	[koulutusala] [varchar](2) NULL,
	[kansalaisuus] [varchar](3) NULL,
	[sukupuoli] [varchar](2) NULL,
	[liikkuvuusohjelma] [varchar](2) NULL,
	[tehtavanjaottelu] [int] NULL,
	[vierailun_kesto] [decimal](16, 2) NULL,
	[vierailut ulkomaille lkm] [int] NULL,
	[liikkuvuuden_kesto_ulkomaille] [decimal](16, 2) NULL,
	[vierailut ulkomailta lkm] [int] NULL,
	[liikkuvuuden_kesto_ulkomailta] [decimal](16, 2) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[ohjauksenala] [varchar](2) NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk3b_julkaisut') BEGIN

CREATE TABLE [sa].[sa_suorat_amk3b_julkaisut](
	[Vuosi] [int] NULL,
	[Ammattikorkeakoulu] [varchar](5) NULL,
	[I Koulutusala] [varchar](5) NULL,
	[II Koulutusala] [varchar](5) NULL,
	[III Koulutusala] [varchar](5) NULL,
	[IV Koulutusala] [varchar](5) NULL,
	[V Koulutusala] [varchar](5) NULL,
	[VI Koulutusala] [varchar](5) NULL,
	[Julkaisutyyppi] [varchar](3) NULL,
	[I Tieteenala] [varchar](4) NULL,
	[II Tieteenala] [varchar](4) NULL,
	[III Tieteenala] [varchar](4) NULL,
	[IV Tieteenala] [varchar](4) NULL,
	[V Tieteenala] [varchar](4) NULL,
	[VI Tieteenala] [varchar](4) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)] [int] NULL,
	[Julkaisujen määrä] [int] NULL,
	[CHECKSUM_AMK3B_JULKAISUT] [int] NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk4_toimipisteet') BEGIN

CREATE TABLE [sa].[sa_suorat_amk4_toimipisteet](
	[Vuosi] [int] NULL,
	[Ammattikorkeakoulu] [nvarchar](5) NULL,
	[Toimipisteen koodi] [nvarchar](3) NULL,
	[Toimipisteen nimi] [nvarchar](200) NULL,
	[Toimipisteessa tapahtuva toiminta, TKI-toiminta] [nvarchar](5) NULL,
	[Toimipisteessa tapahtuva toiminta, palvelutoiminta] [nvarchar](5) NULL,
	[Toimipisteessa tapahtuva toiminta, nuorten koulutus] [nvarchar](5) NULL,
	[Toimipisteessa tapahtuva toiminta, aikuiskoulutus] [nvarchar](5) NULL,
	[Toimipisteessa tapahtuva toiminta, ylempaan amk-tutkintoon johtava koulutus] [nvarchar](5) NULL,
	[Toimipisteen toimipaikan koodi] [nvarchar](5) NULL,
	[Toimipaikan toimiala] [int] NULL,
	[Toimipisteen toimipaikka] [nvarchar](100) NULL,
	[Toimipaikan ensisijainen katuosoite] [nvarchar](300) NULL,
	[Toimipaikan postinumero] [nvarchar](5) NULL,
	[Toimipaikan kunta] [nvarchar](3) NULL,
	[Toimipaikan henkilokunnan henkilotyovuodet] [decimal](9, 4) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [nvarchar](255) NULL,
	[CHECKSUM_AMK4_TOIMIPISTEET] [int] NULL,
	[IMP_DELETED_DATE] [datetime] NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk6a_luennoitsijat') BEGIN

CREATE TABLE [sa].[sa_suorat_amk6a_luennoitsijat](
	[AMK_TUNNUS] [varchar](5) NULL,
	[KOULUTUSALA_KOODI] [varchar](5) NULL,
	[VUOSI] [int] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[KANSAINVALISYYS_KOODI] [int] NULL,
	[LUENNNOITSIJOIDEN_OPPITUNNIT_LKM] [int] NULL,
	[LUENNNOITSIJAT_LKM] [decimal](10, 1) NULL,
	[ohjauksenala] [varchar](10) NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk6a_sivutoimiset_opettajat') BEGIN

CREATE TABLE [sa].[sa_suorat_amk6a_sivutoimiset_opettajat](
	[AMK_TUNNUS] [varchar](5) NULL,
	[KOULUTUSALA_KOODI] [varchar](5) NULL,
	[VUOSI] [int] NULL,
	[SIVUTOIMISTEN_TUNNIT_LKM] [decimal](7, 1) NULL,
	[OSTOPALVELU_TUNNIT_LKM] [decimal](7, 1) NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[ohjauksenala] [varchar](10) NULL
) 
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk6b_ostopalveluna_hankittu_tyo') BEGIN

CREATE TABLE [sa].[sa_suorat_amk6b_ostopalveluna_hankittu_tyo](
	[Vuosi] [int] NULL,
	[Ammattikorkeakoulu] [varchar](5) NULL,
	[Henkilostoryhma] [int] NULL,
	[henkilostoryhman_tunnit_lkm] [int] NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[CHECKSUM_AMK6B_OSTOPALVELUNA_HANKITTU_TYO] [int] NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk9_opinnaytetyot') BEGIN

CREATE TABLE [sa].[sa_suorat_amk9_opinnaytetyot](
	[Vuosi] [int] NULL,
	[Ammattikorkeakoulu] [varchar](5) NULL,
	[Koulutusala] [varchar](5) NULL,
	[Koulutustyyppi] [int] NULL,
	[Hankkeistetut opinnaytetyot] [int] NULL,
	[Opinnaytetyot (ei hankkeistetut)] [int] NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[CHECKSUM_AMK9_OPINNAYTETYOT] [int] NULL,
	[ohjauksenala] [varchar](10) NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_amk_kelpoisuus') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_amk_kelpoisuus](
	[koodi] [varchar](1) NULL,
	[selite_FI] [varchar](25) NULL,
	[selite_SV] [varchar](25) NULL,
	[selite_EN] [varchar](25) NULL,
	[lataaja] [varchar](30) NULL,
	[latausaika] [datetime] NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_amk_muun_henkilokunnan_henkilostoryhma') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_amk_muun_henkilokunnan_henkilostoryhma](
	[koodi] [varchar](1) NULL,
	[selite_FI] [varchar](50) NULL,
	[selite_SV] [varchar](50) NULL,
	[selite_EN] [varchar](50) NULL,
	[lataaja] [varchar](30) NULL,
	[latausaika] [datetime] NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_amk_paatoimiset_opettajat') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_amk_paatoimiset_opettajat](
	[koodi] [varchar](1) NULL,
	[selite_FI] [varchar](50) NULL,
	[selite_SV] [varchar](50) NULL,
	[selite_EN] [varchar](50) NULL,
	[lataaja] [varchar](30) NULL,
	[latausaika] [datetime] NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_amk_tehtavanjaottelu') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_amk_tehtavanjaottelu](
	[koodi] [varchar](1) NULL,
	[selite_FI] [varchar](50) NULL,
	[selite_SV] [varchar](50) NULL,
	[selite_EN] [varchar](50) NULL,
	[lataaja] [varchar](30) NULL,
	[latausaika] [datetime] NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_ammattikorkeakoulut') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_ammattikorkeakoulut](
	[koodi] [varchar](5) NULL,
	[selite_fi] [varchar](100) NULL,
	[selite_sv] [varchar](100) NULL,
	[selite_en] [varchar](100) NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_ek_nimike') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_ek_nimike](
	[koodi] [varchar](15) NULL,
	[selite_fi] [varchar](56) NULL,
	[selite_sv] [varchar](56) NULL,
	[selite_en] [varchar](56) NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_koulutusala_1995') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_koulutusala_1995](
	[koodi] [int] NULL,
	[selite_fi] [varchar](100) NULL,
	[selite_sv] [varchar](100) NULL,
	[selite_en] [varchar](100) NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_koulutusala_2002') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_koulutusala_2002](
	[koodi] [int] NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_koulutustyyppi') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_koulutustyyppi](
	[koodi] [varchar](50) NULL,
	[selite_fi] [varchar](50) NULL,
	[selite_sv] [varchar](50) NULL,
	[selite_en] [varchar](50) NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_liikkuvuuden_tyyppi') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_liikkuvuuden_tyyppi](
	[koodi] [varchar](1) NULL,
	[selite_fi] [varchar](20) NULL,
	[selite_SV] [varchar](20) NULL,
	[selite_en] [varchar](20) NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_liikkuvuusohjelma') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_liikkuvuusohjelma](
	[koodi] [varchar](2) NULL,
	[selite_fi] [varchar](400) NULL,
	[selite_sv] [varchar](400) NULL,
	[selite_en] [varchar](400) NULL
) 
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_organisaation_alayksikot') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_organisaation_alayksikot](
	[vuosi] [varchar](4) NULL,
	[korkeakoulu_koodi] [varchar](5) NULL,
	[alayksikko_koodi] [varchar](200) NULL,
	[alayksikko_nimi] [varchar](200) NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_tutkinnon_taso') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_tutkinnon_taso](
	[koodi] [int] NULL,
	[selite_fi] [varchar](30) NULL,
	[selite_sv] [varchar](30) NULL,
	[selite_en] [varchar](30) NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_yliopistojen_koulutusalavastuut') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_yliopistojen_koulutusalavastuut](
	[yliopisto_selite_FI] [varchar](200) NULL,
	[koulutusala1995_selite_FI] [varchar](100) NULL,
	[koodi_yliopisto] [varchar](5) NULL,
	[koodi_koulutusala1995] [varchar](2) NULL,
	[lataaja] [varchar](30) NULL,
	[latausaika] [datetime] NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_yo_harjoittelukoulujen_henkilostoryhma') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_yo_harjoittelukoulujen_henkilostoryhma](
	[Koodi] [varchar](50) NULL,
	[selite_FI] [varchar](50) NULL,
	[selite_SV] [varchar](50) NULL,
	[selite_EN] [varchar](50) NULL,
	[lataaja] [varchar](30) NULL,
	[latausaika] [datetime] NULL
)
;
END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_yo_henkilostoryhma') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_yo_henkilostoryhma](
	[Koodi] [varchar](1) NULL,
	[selite_FI] [varchar](50) NULL,
	[selite_SV] [varchar](50) NULL,
	[selite_EN] [varchar](50) NULL,
	[lataaja] [varchar](30) NULL,
	[latausaika] [datetime] NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_yo_nimitystapa') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_yo_nimitystapa](
	[koodi] [varchar](1) NULL,
	[selite_FI] [varchar](50) NULL,
	[selite_SV] [varchar](50) NULL,
	[selite_EN] [varchar](50) NULL,
	[lataaja] [varchar](30) NULL,
	[latausaika] [datetime] NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_yo_tehtavanjaottelu') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_yo_tehtavanjaottelu](
	[koodi] [varchar](1) NULL,
	[selite_FI] [varchar](50) NULL,
	[selite_SV] [varchar](50) NULL,
	[selite_EN] [varchar](50) NULL,
	[lataaja] [varchar](30) NULL,
	[latausaika] [datetime] NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_yo_tiedekunta') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_yo_tiedekunta](
	[yliopistokoodi] [varchar](5) NULL,
	[tiedekuntakoodi] [varchar](10) NULL,
	[tiedekunta] [varchar](200) NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_yo_tutkijanuravaihe') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_yo_tutkijanuravaihe](
	[Koodi] [varchar](1) NULL,
	[selite_FI] [varchar](250) NULL,
	[selite_SV] [varchar](250) NULL,
	[selite_EN] [varchar](250) NULL,
	[lataaja] [varchar](30) NULL,
	[latausaika] [datetime] NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_koodistot_yo_valinta_kutsumenettelylla') BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_yo_valinta_kutsumenettelylla](
	[Koodi] [varchar](1) NULL,
	[selite_FI] [varchar](50) NULL,
	[selite_SV] [varchar](50) NULL,
	[selite_EN] [varchar](50) NULL,
	[lataaja] [varchar](30) NULL,
	[latausaika] [datetime] NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo1_henkilon_tyo') BEGIN

CREATE TABLE [sa].[sa_suorat_yo1_henkilon_tyo](
	[VUOSI] [int] NULL,
	[YLIOPISTO_TUNNUS] [varchar](5) NULL,
	[KOULUTUSALAKOODI] [varchar](5) NULL,
	[OHJAUKSENALA_KOODI] [varchar](5) NULL,
	[YO_HENKILONRO] [varchar](20) NULL,
	[SYNTYMAVUOSI] [varchar](20) NULL,
	[TOIMIPAIKKA_KOODI] [varchar](10) NULL,
	[LAITOS_KOODI] [varchar](20) NULL,
	[TIEDEKUNTA_KOODI] [varchar](20) NULL,
	[TIETEENALA_KOODI_10] [varchar](4) NULL,
	[AIDINKIELI_KOODI] [varchar](5) NULL,
	[KANSALAISUUS_KOODI] [varchar](5) NULL,
	[NIMITYSTAPA_KOODI] [varchar](5) NULL,
	[AMMATTINIMIKE_KOODI] [varchar](20) NULL,
	[TUTKINTO_KOODI] [varchar](6) NULL,
	[TUTKINNON_SUORITUSMAA_KOODI] [varchar](10) NULL,
	[TEHTAVANJAOTTELU_KOODI] [varchar](5) NULL,
	[TUTKIJANURAVAIHE_KOODI] [varchar](5) NULL,
	[HENKILOSTORYHMA_KOODI] [varchar](5) NULL,
	[HARJOITTELUKOULUJEN_KOODI] [varchar](20) NULL,
	[VALINTA_KUTSUMENETTELYLLA_KOODI] [varchar](50) NULL,
	[SUKUPUOLI] [int] NULL,
	[HENKILOTYOVUOSI_LKM] [decimal](10, 4) NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo2_opintopisteet') BEGIN

CREATE TABLE [sa].[sa_suorat_yo2_opintopisteet](
	[Harjoittelukoulussa suoritetut opintopisteet, luokanopettajaharjoittelu] [nvarchar](50) NULL,
	[Harjoittelukoulussa suoritetut opintopisteet, aineenopettajaharjoittelu] [nvarchar](50) NULL,
	[Harjoittelukoulussa suoritetut opintopisteet, erityisopettajat] [nvarchar](50) NULL,
	[Harjoittelukoulussa suoritetut opintopisteet, opinto-ohjaajat] [nvarchar](50) NULL,
	[Harjoittelukoulussa suoritetut opintopisteet, lastentarhanopettajat] [nvarchar](50) NULL,
	[Harjoittelukoulussa suoritetut opintopisteet, aikuiskoulutukseen painottunut harjoittelu] [nvarchar](50) NULL,
	[Yliopisto] [nvarchar](50) NULL,
	[Vuosi] [nvarchar](50) NULL,
	[Koulutusala 1995] [nvarchar](50) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [nvarchar](255) NULL,
	[Harjoittelukoulussa suoritetut opintopisteet, muut opettajankoulutusryhmät] [nvarchar](50) NULL,
	[CHECKSUM_YO2_OPINTOPISTEET] [int] NULL,
	[IMP_DELETED_DATE] [datetime] NULL,
	[ohjauksenala_koodi] [varchar](10) NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo3b_julkaisut') BEGIN

CREATE TABLE [sa].[sa_suorat_yo3b_julkaisut](
	[Vuosi] [int] NULL,
	[Yliopisto] [nvarchar](5) NULL,
	[I Koulutusala] [nvarchar](5) NULL,
	[II Koulutusala] [nvarchar](50) NULL,
	[III Koulutusala] [nvarchar](50) NULL,
	[IV Koulutusala] [nvarchar](50) NULL,
	[V Koulutusala] [nvarchar](50) NULL,
	[VI Koulutusala] [nvarchar](50) NULL,
	[Julkaisutyyppi] [nvarchar](50) NULL,
	[I Tieteenala] [nvarchar](50) NULL,
	[II Tieteenala] [nvarchar](50) NULL,
	[III Tieteenala] [nvarchar](50) NULL,
	[IV Tieteenala] [nvarchar](50) NULL,
	[V Tieteenala] [nvarchar](50) NULL,
	[VI Tieteenala] [nvarchar](50) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [nvarchar](100) NULL,
	[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)] [int] NULL,
	[Julkaisujen määrä] [int] NULL,
	[CHECKSUM_YO3B_JULKAISUT] [int] NULL,
	[IMP_DELETED_DATE] [datetime] NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo4_toimipisteet') BEGIN

CREATE TABLE [sa].[sa_suorat_yo4_toimipisteet](
	[Vuosi] [int] NULL,
	[Yliopisto] [nvarchar](50) NULL,
	[Toimipisteen koodi] [nvarchar](50) NULL,
	[Toimipisteen nimi] [nvarchar](200) NULL,
	[Toimipisteen toimipaikan koodi] [nvarchar](50) NULL,
	[Toimipaikan toimiala] [int] NULL,
	[toimipisteen toimipaikka] [nvarchar](100) NULL,
	[Toimipaikan ensisijainen katuosoite] [nvarchar](300) NULL,
	[Toimipaikan postinumero] [nvarchar](50) NULL,
	[Toimipaikan kunta] [nvarchar](50) NULL,
	[Toimipaikan henkilokunnan henkilotyovuodet] [decimal](9, 4) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [nvarchar](100) NULL,
	[Toimipisteeseen liittyvä toiminta, tutkintoon johtava koulutus] [nvarchar](50) NULL,
	[Toimipisteeseen liittyvä toiminta, tutkimustoiminta] [nvarchar](50) NULL,
	[Toimipisteeseen liittyvä toiminta, Muu (aikuiskoulutus ja palvelutoiminta)] [nvarchar](50) NULL,
	[Tutkimusaseman henkilökunnan maksimimäärä] [int] NULL,
	[Tutkimusaseman henkilökunnan minimimäärä] [int] NULL,
	[Tutkimusaseman yöpymisvuorokaudet] [int] NULL,
	[CHECKSUM_YO4_TOIMIPISTEET] [int] NULL,
	[IMP_DELETED_DATE] [datetime] NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo5_taydennyskoulutukset_jarjestetyt') BEGIN

CREATE TABLE [sa].[sa_suorat_yo5_taydennyskoulutukset_jarjestetyt](
	[VUOSI] [int] NULL,
	[YLIOPISTO_TUNNUS] [varchar](5) NULL,
	[KOULUTUSALAKOODI] [varchar](5) NULL,
	[JARJESTETTYJEN_KOULUTUSTEN_LKM] [int] NULL,
	[LATAUSAIKA] [datetime] NULL,
	[PAIVITYSAIKA] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo5_taydennyskoulutukset_osallistumiset') BEGIN

CREATE TABLE [sa].[sa_suorat_yo5_taydennyskoulutukset_osallistumiset](
	[VUOSI] [int] NULL,
	[YLIOPISTO_TUNNUS] [varchar](5) NULL,
	[KOULUTUSALAKOODI] [varchar](5) NULL,
	[SUKUPUOLI] [int] NULL,
	[OSALLISTUJIEN_LKM] [int] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo6b_avoimen_yliopiston_kautta_opiskelevat') BEGIN

CREATE TABLE [sa].[sa_suorat_yo6b_avoimen_yliopiston_kautta_opiskelevat](
	[YLIOPISTO_TUNNUS] [varchar](5) NULL,
	[KOULUTUSALAKOODI] [varchar](5) NULL,
	[VUOSI] [int] NULL,
	[SUKUPUOLIKOODI] [varchar](2) NULL,
	[OPISKELIJA_NETTO_LKM] [int] NULL,
	[ASIANOMAISUUS] [varchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo6b_erillisella_opinto_oikeudella_opiskelevat') BEGIN

CREATE TABLE [sa].[sa_suorat_yo6b_erillisella_opinto_oikeudella_opiskelevat](
	[Vuosi] [int] NULL,
	[YLIOPISTO_TUNNUS] [varchar](5) NULL,
	[SUORITTANEIDEN_LKM] [int] NULL,
	[OPETTAJAKOULUTUS_SUORITTANEIDEN_LKM] [int] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL
)
;

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo7_opettaja_ja_tutkijavierailut') BEGIN

CREATE TABLE [sa].[sa_suorat_yo7_opettaja_ja_tutkijavierailut](
	[Vuosi] [int] NULL,
	[Yliopisto] [varchar](5) NULL,
	[Koulutusala] [varchar](5) NULL,
	[Tutkijanuravaihe] [varchar](2) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[Vierailutyyppi] [int] NULL,
	[VIERAILUT_ULKOMAILLE_LKM] [int] NULL,
	[VIERAILUT_ULKOMAILTA_LKM] [int] NULL,
	[MAA_KOODI] [varchar](10) NULL,
	[ohjauksenala_koodi] [varchar](200) NULL
)
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo8_tilat') BEGIN

CREATE TABLE [sa].[sa_suorat_yo8_tilat](
	[Vuosi] [int] NULL,
	[Yliopisto] [nvarchar](50) NULL,
	[Muut vuokratilat] [int] NULL,
	[Harjoittelukoulujen tilat] [int] NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [nvarchar](255) NULL,
	[Yliopistokiinteistöyhtiön toimitilat, Suomen Yliopistokiinteistöt Oy] [int] NULL,
	[Yliopistokiinteistöyhtiön toimitilat, Aalto-Yliopistokiinteistöt Oy] [int] NULL,
	[Yliopistokiinteistöyhtiön toimitilat, Helsingin Yliopistokiinteistöt Oy] [int] NULL,
	[CHECKSUM_YO8_TILAT] [int] NULL,
	[IMP_DELETED_DATE] [datetime] NULL
) 
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo9_harjoittelukoulut') BEGIN

CREATE TABLE [sa].[sa_suorat_yo9_harjoittelukoulut](
	[Yliopisto] [nvarchar](255) NULL,
	[Harjoittelukoulun oppilaat, yhteensä] [bigint] NULL,
	[Harjoittelukoulun oppilaat, esiopetus] [bigint] NULL,
	[Harjoittelukoulun oppilaat, perusopetuksen vuodet 1-6] [bigint] NULL,
	[Harjoittelukoulun oppilaat, perusopetuksen vuodet 7-9] [bigint] NULL,
	[Harjoittelukoulun oppilaat, lukio] [bigint] NULL,
	[Harjoittelukoulun kokonaistuntimäärä] [bigint] NULL,
	[Harjoittelukoulun opettajankoulutustehtävien kokonaisviikkotunnit] [bigint] NULL,
	[Vuosi] [bigint] NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [nvarchar](255) NULL
)
;

END