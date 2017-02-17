IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amk_henkilon_tyo') BEGIN

CREATE TABLE [dw].[f_amk_henkilon_tyo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[d_tieteenala_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_koulutusala02_id] [int] NOT NULL,
	[d_toimipaikka_id] [int] NOT NULL,
	[d_nimike_id] [int] NOT NULL,
	[d_tutkinnon_taso] [int] NOT NULL,
	[d_maa_id] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_muun_henkiloston_henkilostoryhma_id] [int] NOT NULL,
	[d_tehtavanjaottelu] [int] NOT NULL,
	[d_nimitystapa_id] [int] NOT NULL,
	[d_kieli_id] [int] NOT NULL,
	[d_paatoimiset_opettajat] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[henkilotyovuosi] [decimal](10, 4) NOT NULL,
	[tyoajan_kayttotiedot_opetus] [decimal](10, 4) NOT NULL,
	[tyoajan_kayttotiedot_tki_toiminta] [decimal](10, 4) NOT NULL,
	[tyoajan_kayttotiedot_tki_hallinto] [decimal](10, 4) NOT NULL,
	[kelpoisuus_tutkinto] [int] NOT NULL,
	[kelpoisuus_tyokokemus] [int] NOT NULL,
	[kelpoisuus_opettajankoulutus] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_amk_he__3213E83F6F6DBF08] PRIMARY KEY CLUSTERED 
(
	[id] ASC
));

ALTER TABLE [dw].[f_amk_henkilon_tyo] ADD  CONSTRAINT [DF_f_amk_henkilosto_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[f_amk_henkilon_tyo] ADD  CONSTRAINT [DF_f_amk_henkilosto_username]  DEFAULT (suser_sname()) FOR [username]
;


 END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amk_julkaisut_f_i') BEGIN

CREATE TABLE [dw].[f_amk_julkaisut_f_i](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[d_koulutusala_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_julkaisutyyppi_id] [int] NOT NULL,
	[d_julkaisun_kansainvalisyys_id] [int] NOT NULL,
	[d_tieteenala_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[julkaisujen_maara] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_amk_ko__3213E83FD0BDD843] PRIMARY KEY CLUSTERED 
(
	[id] ASC
));

ALTER TABLE [dw].[f_amk_julkaisut_f_i] ADD  CONSTRAINT [DF_f_amk_kotimaiset_julkaisut_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[f_amk_julkaisut_f_i] ADD  CONSTRAINT [DF_f_amk_kotimaiset_julkaisut_username]  DEFAULT (suser_sname()) FOR [username]
;

 END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amk_luennoitsijat') BEGIN

CREATE TABLE [dw].[f_amk_luennoitsijat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NULL,
	[d_koulutusala_id] [int] NULL,
	[d_ohjauksenala_id] [int] NULL,
	[vuosi] [int] NULL,
	[kansainvalinen] [int] NULL,
	[luennoitsijoiden_oppitunnit] [decimal](7, 1) NULL,
	[luennoitsijat] [decimal](7, 1) NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
))

; END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amk_opettaja_ja_henkilostoliikkuvuus') BEGIN

CREATE TABLE [dw].[f_amk_opettaja_ja_henkilostoliikkuvuus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[d_ohjauksen_ala_id] [int] NOT NULL,
	[d_maa_id] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_liikkuvuusohjelma_id] [int] NOT NULL,
	[d_tehtavanjaottelu_id] [int] NOT NULL,
	[d_kohdemaa_lahtevat_tai_lahtomaa_saapuvat_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[vierailun_kesto] [decimal](10, 4) NOT NULL,
	[vierailut_ulkomaille_lkm] [int] NOT NULL,
	[vierailut_ulkomailta_lkm] [int] NOT NULL,
	[liikkuvuuden_kesto_ulkomaille] [decimal](10, 4) NOT NULL,
	[liikkuvuuden_kesto_ulkomailta] [decimal](10, 4) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[d_koulutusala_id] [int] NULL,
 CONSTRAINT [PK__f_amk_op__3213E83F29661723] PRIMARY KEY CLUSTERED 
(
	[id] ASC
));

ALTER TABLE [dw].[f_amk_opettaja_ja_henkilostoliikkuvuus] ADD  CONSTRAINT [DF_f_amk_opettaja_ja_henkilostoliikkuvuus_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[f_amk_opettaja_ja_henkilostoliikkuvuus] ADD  CONSTRAINT [DF_f_amk_opettaja_ja_henkilostoliikkuvuus_username]  DEFAULT (suser_sname()) FOR [username]
;
END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amk_opinnaytetyot') BEGIN

CREATE TABLE [dw].[f_amk_opinnaytetyot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[d_ohjauksen_ala_id] [int] NOT NULL,
	[d_koulutustyyppi_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[hankkeistetut_opinnaytetyot] [int] NOT NULL,
	[opinnaytetyot_ei_hankkeistetut] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[d_koulutusala_id] [int] NULL,
 CONSTRAINT [PK__f_amk_op__3213E83F7F8B799A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
));
ALTER TABLE [dw].[f_amk_opinnaytetyot] ADD  CONSTRAINT [DF_f_amk_opinnaytetyot_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[f_amk_opinnaytetyot] ADD  CONSTRAINT [DF_f_amk_opinnaytetyot_username]  DEFAULT (suser_sname()) FOR [username]
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amk_ostopalveluna_hankittu_tyo') BEGIN

CREATE TABLE [dw].[f_amk_ostopalveluna_hankittu_tyo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[d_henkilostoryhma_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[henkilostoryhman_tunnit_lkm] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_amk_os__3213E83F61A14695] PRIMARY KEY CLUSTERED 
(
	[id] ASC
));

ALTER TABLE [dw].[f_amk_ostopalveluna_hankittu_tyo] ADD  CONSTRAINT [DF_f_amk_ostopalveluna_hankittu_tyo_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[f_amk_ostopalveluna_hankittu_tyo] ADD  CONSTRAINT [DF_f_amk_ostopalveluna_hankittu_tyo_username]  DEFAULT (suser_sname()) FOR [username]
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amk_sivutoiminen_henkilokunta') BEGIN

CREATE TABLE [dw].[f_amk_sivutoiminen_henkilokunta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[d_toimipiste_id] [int] NOT NULL,
	[d_ohjauksen_ala_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[sivutoimisten_tuntiopettajien_opetustunnit] [int] NOT NULL,
	[ostopalveluna_hankittu_tuntiopetus] [int] NOT NULL,
	[suomalaiset_luennoitsijat] [int] NOT NULL,
	[ulkomaalaiset_luennoitsijat] [int] NOT NULL,
	[suomalaisten_luennoitsijoiden_pitamat_oppitunnit] [int] NOT NULL,
	[ulkomaalaisten_luennoitsijoiden_pitamat_oppitunnit] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_amk_si__3213E83F9719606D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
));

ALTER TABLE [dw].[f_amk_sivutoiminen_henkilokunta] ADD  CONSTRAINT [DF_f_amk_sivutoiminen_henkilokunta_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[f_amk_sivutoiminen_henkilokunta] ADD  CONSTRAINT [DF_f_amk_sivutoiminen_henkilokunta_username]  DEFAULT (suser_sname()) FOR [username]
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amk_sivutoimiset_opettajat') BEGIN

CREATE TABLE [dw].[f_amk_sivutoimiset_opettajat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NULL,
	[d_koulutusala_id] [int] NULL,
	[d_ohjauksenala_id] [int] NULL,
	[sivutoimisten_tuntiopettajien_opetustunnit] [decimal](7, 1) NULL,
	[ostopalveluna_hankittu_tuntiopetus] [decimal](7, 1) NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](30) NULL,
	[vuosi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
))

; END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amk_toimipisteet') BEGIN

CREATE TABLE [dw].[f_amk_toimipisteet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[d_toimipiste_id] [int] NOT NULL,
	[d_toimipaikka_id] [int] NOT NULL,
	[d_toimiala_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[toimipaikan_henkilokunnan_henkilotyovuodet] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_amk_to__3213E83F6FB50623] PRIMARY KEY CLUSTERED 
(
	[id] ASC
))

; 

ALTER TABLE [dw].[f_amk_toimipisteet] ADD  CONSTRAINT [DF_f_amk_toimipisteet_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[f_amk_toimipisteet] ADD  CONSTRAINT [DF_f_amk_toimipisteet_username]  DEFAULT (suser_sname()) FOR [username]
;

END
