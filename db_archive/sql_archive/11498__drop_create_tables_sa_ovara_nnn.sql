USE ANTERO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_ataru_hakemus]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_ataru_hakemus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_ataru_hakemus](
	[hakemus_oid] [varchar](100) NULL,
	[hakemus_versio_id] [varchar](100) NULL,
	[versio_id] [int] NULL,
	[lomake_id] [varchar](100) NULL,
	[lomakeversio_id] [int] NULL,
	[liitteet] [varchar](max) NULL,
	[luotu] [datetime] NULL,
	[tila] [varchar](100) NULL,
	[jatetty] [datetime] NULL,
	[kieli] [varchar](10) NULL,
	[haku_oid] [varchar](100) NULL,
	[henkilo_oid] [varchar](100) NULL,
	[ulk_kunta] [varchar](1000) NULL,
	[kotikunta] [varchar](100) NULL,
	[asuinmaa] [varchar](100) NULL,
	[sukupuoli] [int] NULL,
	[kansalaisuus] [varchar](100) NULL,
	[valintatuloksen_julkaisulupa] [varchar](100) NULL,
	[asiointikieli] [varchar](100) NULL,
	[pohjakoulutuksen_maa_toinen_aste] [int] NULL,
	[muokattu] [datetime] NULL,
	[poistettu] [int] NULL,
	[hakemusmaksun_tila] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[master_oid] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_ataru_hakutoive]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_ataru_hakutoive]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_ataru_hakutoive](
	[hakutoive_id] [varchar](100) NULL,
	[hakukohde_henkilo_id] [varchar](100) NULL,
	[hakemus_oid] [varchar](100) NULL,
	[henkilo_oid] [varchar](100) NULL,
	[hakukohde_oid] [varchar](100) NULL,
	[hakutoivenumero] [varchar](10) NULL,
	[poistettu] [int] NULL,
	[muokattu] [datetime] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[master_oid] [varchar](100) NULL
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_hakeneet]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_hakeneet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_hakeneet](
	[hakemus_oid] [varchar](100) NULL,
	[master_oid] [varchar](100) NULL,
	[haku_oid] [varchar](100) NULL,
	[hakemus_luotu] [datetime] NULL,
	[hakemus_muokattu] [datetime] NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [varchar](1) NULL,
	[hakukohde_oid] [varchar](100) NULL,
	[hakutoive] [int] NULL,
	[ensikertalainen] [int] NULL,
	[aidosti_ensikertainen] [int] NOT NULL,
	[kotikunta] [varchar](100) NULL,
	[sukupuoli] [int] NULL,
	[aidinkieli] [varchar](100) NULL,
	[ika] [int] NULL,
	[kansalaisuus] [varchar](3) NULL,
	[kk_haku] [int] NOT NULL,
	[koulutuskoodi] [varchar](100) NULL,
	[hakukohteen_tutkinnon_taso_kk_sykli] [int] NULL,
	[hakukohteen_tutkinnon_taso_kk] [int] NULL,
	[jatkotutkintohaku] [int] NOT NULL,
	[koulutusaste] [int] NULL,
	[koulutustoimija_oid] [varchar](200) NULL,
	[oppilaitos_oid] [varchar](200) NULL,
	[toimipiste_oid] [varchar](200) NULL,
	[organisaatio_oid] [varchar](200) NULL,
	[laajuus] [decimal](18, 0) NULL,
	[opetuksen_kieli] [varchar](8000) NULL,
	[valittu] [int] NOT NULL,
	[vastaanottanut_paikan] [int] NOT NULL,
	[ilmoittautunut] [int] NOT NULL,
	[pisteet] [float] NULL,
	[alinhyvaksyttypistemaara] [float] NULL,
	[ylinhyvaksyttypistemaara] [float] NULL,
	[pohjakoulutus] [int] NULL,
	[luokkataso] [varchar](100) NULL,
	[lahtokoulu] [varchar](100) NULL,
	[valintatapajonon_tyyppi] [varchar](100) NULL,
	[valintatapajono_oid] [varchar](100) NULL,
	[Yo_Amk_YoAmk] [int] NULL,
	[pohjakoulutusvaatimus_koodi] [varchar](max) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](5) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_hakukohteet]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_hakukohteet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_hakukohteet](
	[hakukohde_oid] [varchar](100) NULL,
	[haku_oid] [varchar](100) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [varchar](1) NULL,
	[toimipiste_oid] [varchar](200) NULL,
	[oppilaitos_oid] [varchar](200) NULL,
	[koulutustoimija_oid] [varchar](200) NULL,
	[organisaatio_oid] [varchar](200) NULL,
	[koulutuskoodi] [varchar](100) NULL,
	[koulutustyyppi] [varchar](100) NULL,
	[hakukohteen_tutkinnon_taso_kk_sykli] [int] NULL,
	[hakukohteen_tutkinnon_taso_kk] [int] NULL,
	[kk_haku] [int] NOT NULL,
	[opetuksen_kieli] [varchar](8000) NULL,
	[laajuus] [decimal](18, 0) NULL,
	[pohjakoulutusvaatimus_koodi] [varchar](max) NULL,
	[ammatillinenperustutkintoerityisopetuksena] [int] NULL,
	[jarjestetaanerityisopetuksena] [int] NULL,
	[alinhyvaksyttypistemaara] [float] NULL,
	[aloituspaikat] [int] NULL,
	[aloituspaikat_ensikertalaisille] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_koodistot_koodi]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_koodistot_koodi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_koodistot_koodi](
	[koodistouri] [varchar](100) NULL,
	[versioitu_koodiuri] [varchar](500) NULL,
	[koodiuri] [varchar](1000) NULL,
	[koodiarvo] [varchar](100) NULL,
	[koodiversio] [int] NULL,
	[koodinimi] [varchar](max) NULL,
	[nimi_fi] [varchar](1000) NULL,
	[nimi_sv] [varchar](1000) NULL,
	[nimi_en] [varchar](1000) NULL,
	[tila] [varchar](100) NULL,
	[voimassaalkupvm] [datetime] NULL,
	[voimassaloppupvm] [datetime] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_kouta_hakukohteet]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_kouta_hakukohteet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_kouta_hakukohteet](
	[hakukohde_oid] [varchar](100) NULL,
	[toteutus_oid] [varchar](100) NULL,
	[haku_oid] [varchar](100) NULL,
	[alkupvm] [datetime] NULL,
	[paattymispvm] [datetime] NULL,
	[hakukohteen_nimi_fi] [varchar](1000) NULL,
	[hakukohteen_nimi_sv] [varchar](1000) NULL,
	[hakukohteen_nimi_en] [varchar](1000) NULL,
	[alkamiskausityyppi] [varchar](100) NULL,
	[koulutuksenAlkamiskausiKoodi] [varchar](100) NULL,
	[koulutuksenAlkamisvuosi] [int] NULL,
	[koulutuksenAlkamispaivamaara] [datetime] NULL,
	[koulutuksenLoppumispaivamaara] [datetime] NULL,
	[koulutuksenalkamiskausi] [varchar](4000) NULL,
	[jarjestyspaikka_oid] [varchar](500) NULL,
	[ulkoinen_tunniste] [varchar](100) NULL,
	[organisaatio_oid] [varchar](100) NULL,
	[valintaperuste_id] [varchar](100) NULL,
	[hakuoid] [varchar](100) NULL,
	[tila] [varchar](100) NULL,
	[esikatselu] [varchar](4000) NULL,
	[hakukohdekoodiuri] [varchar](100) NULL,
	[hakulomaketyyppi] [varchar](100) NULL,
	[pohjakoulutusvaatimuskoodiurit] [varchar](max) NULL,
	[toinenasteonkokaksoistutkinto] [int] NULL,
	[kaytetaanhaunaikataulua] [int] NULL,
	[hakuajat] [varchar](4000) NULL,
	[kaytetaanhaunalkamiskautta] [int] NULL,
	[aloituspaikat] [int] NULL,
	[aloituspaikat_ensikertalaisille] [int] NULL,
	[painotetutarvosanat] [varchar](100) NULL,
	[jarjestaaurheilijanammkoulutusta] [int] NULL,
	[muokkaaja] [varchar](100) NULL,
	[organisaatiooid] [varchar](100) NULL,
	[kielivalinta] [varchar](100) NULL,
	[muokattu] [datetime] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_kouta_haut]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_kouta_haut]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_kouta_haut](
	[haku_oid] [varchar](100) NULL,
	[haun_nimi_fi] [varchar](1000) NULL,
	[haun_nimi_en] [varchar](1000) NULL,
	[haun_nimi_sv] [varchar](1000) NULL,
	[koulutuksenAlkamiskausiKoodi] [varchar](10) NULL,
	[koulutuksenAlkamisvuosi] [int] NULL,
	[koulutuksenAlkamispaivamaara] [date] NULL,
	[koulutuksenLoppumispaivamaara] [date] NULL,
	[tila] [varchar](30) NULL,
	[hakutapakoodiuri] [varchar](100) NULL,
	[externalid] [varchar](100) NULL,
	[kohdejoukkokoodiuri] [varchar](100) NULL,
	[kohdejoukontarkennekoodiuri] [varchar](100) NULL,
	[alkamiskausityyppi] [varchar](100) NULL,
	[hakuajat] [varchar](4000) NULL,
	[kielivalinta] [varchar](100) NULL,
	[alkupvm] [varchar](100) NULL,
	[paattymispvm] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_kouta_koulutus]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_kouta_koulutus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_kouta_koulutus](
	[koulutus_oid] [varchar](50) NULL,
	[koulutuksen_nimi_fi] [varchar](500) NULL,
	[koulutuksen_nimi_sv] [varchar](500) NULL,
	[koulutuksen_nimi_en] [varchar](500) NULL,
	[organisaatio_oid] [varchar](50) NULL,
	[externalid] [varchar](500) NULL,
	[johtaatutkintoon] [int] NULL,
	[koulutustyyppi] [varchar](100) NULL,
	[koulutuksetkoodiuri] [varchar](1000) NULL,
	[koulutuskoodi] [varchar](100) NULL,
	[jarjestysnro] [int] NULL,
	[tila] [varchar](100) NULL,
	[esikatselu] [int] NULL,
	[tarjoajat] [varchar](max) NULL,
	[julkinen] [int] NULL,
	[kielivalinta] [varchar](100) NULL,
	[sorakuvausid] [varchar](100) NULL,
	[tyyppi] [varchar](100) NULL,
	[kuvaus] [varchar](100) NULL,
	[lisatiedot] [varchar](max) NULL,
	[tutkinnonosat] [varchar](4000) NULL,
	[koulutusalakoodiurit] [varchar](1000) NULL,
	[tutkintonimikekoodiurit] [varchar](1000) NULL,
	[opintojenlaajuusyksikkokoodiuri] [varchar](100) NULL,
	[opintojenlaajuusnumero] [decimal](18, 0) NULL,
	[opintojenlaajuusnumeromin] [decimal](18, 0) NULL,
	[opintojenlaajuusnumeromax] [decimal](18, 0) NULL,
	[isavoinkorkeakoulutus] [varchar](100) NULL,
	[tunniste] [varchar](1000) NULL,
	[opinnontyyppikoodiuri] [varchar](100) NULL,
	[korkeakoulutustyypit] [varchar](1000) NULL,
	[ismuokkaajaophvirkailija] [int] NULL,
	[osaamisalakoodiuri] [varchar](1000) NULL,
	[erikoistumiskoulutuskoodiuri] [varchar](1000) NULL,
	[linkkieperusteisiin] [varchar](1000) NULL,
	[muokkaaja] [varchar](100) NULL,
	[teemakuva] [varchar](1000) NULL,
	[eperusteid] [int] NULL,
	[muokattu] [varchar](100) NULL,
	[luokittelutermit] [varchar](2000) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_kouta_pistehistoria]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_kouta_pistehistoria]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_kouta_pistehistoria](
	[id] [varchar](100) NULL,
	[tarjoaja] [varchar](100) NULL,
	[hakukohdekoodi] [varchar](100) NULL,
	[pisteet] [float] NULL,
	[vuosi] [int] NULL,
	[aloituspaikat] [int] NULL,
	[ensisijaisestihakeneet] [int] NULL,
	[muokattu] [datetime] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[valintatapajono_oid] [varchar](100) NULL,
	[hakukohde_oid] [varchar](100) NULL,
	[haku_oid] [varchar](100) NULL,
	[tyyppi] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_kouta_toteutus]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_kouta_toteutus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_kouta_toteutus](
	[toteutus_oid] [varchar](50) NULL,
	[koulutus_oid] [varchar](50) NULL,
	[organisaatio_oid] [varchar](50) NULL,
	[toteutuksen_nimi_fi] [varchar](500) NULL,
	[toteutuksen_nimi_sv] [varchar](500) NULL,
	[toteutuksen_nimi_en] [varchar](500) NULL,
	[tila] [varchar](50) NULL,
	[tyyppi] [varchar](100) NULL,
	[opetustapakoodiurit] [varchar](1000) NULL,
	[maksullisuustyyppi] [varchar](100) NULL,
	[maksunmaara] [int] NULL,
	[onkoapuraha] [int] NULL,
	[suunniteltukestovuodet] [int] NULL,
	[suunniteltukestokuukaudet] [int] NULL,
	[ammattinimikkeet] [varchar](4000) NULL,
	[hakutermi] [varchar](100) NULL,
	[ishakukohteetkaytossa] [int] NULL,
	[muokattu] [varchar](100) NULL,
	[opetuskieli_koodit] [varchar](100) NULL,
	[opintojenlaajuusyksikko_koodit] [varchar](100) NULL,
	[opintojenlaajuusnumero] [varchar](10) NULL,
	[ammatillinenperustutkintoerityisopetuksena] [int] NULL,
	[jarjestetaanerityisopetuksena] [int] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[koulutuksenAlkamiskausiKoodi] [varchar](100) NULL,
	[koulutuksenAlkamispaivamaara] [datetime] NULL,
	[koulutuksenAlkamisvuosi] [int] NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_kouta_valintaperuste]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_kouta_valintaperuste]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_kouta_valintaperuste](
	[valintaperuste_id] [varchar](100) NULL,
	[valintaperuste_nimi] [varchar](1000) NULL,
	[externalid] [varchar](100) NULL,
	[tila] [varchar](100) NULL,
	[esikatselu] [varchar](100) NULL,
	[koulutustyyppi] [varchar](100) NULL,
	[hakutapakoodiuri] [varchar](100) NULL,
	[kohdejoukkokoodiuri] [varchar](100) NULL,
	[julkinen] [varchar](100) NULL,
	[valintakokeet] [varchar](max) NULL,
	[tyyppi] [varchar](100) NULL,
	[sisalto] [varchar](max) NULL,
	[valintatavat] [varchar](max) NULL,
	[hakukelpoisuus] [int] NULL,
	[lisatiedot] [int] NULL,
	[valintakokeidenyleiskuvaus] [varchar](1000) NULL,
	[ismuokkaajaophvirkailija] [int] NULL,
	[organisaatiooid] [varchar](100) NULL,
	[muokkaaja] [varchar](100) NULL,
	[kielivalinta] [varchar](100) NULL,
	[muokattu] [varchar](100) NULL,
	[muokkaajannimi] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
