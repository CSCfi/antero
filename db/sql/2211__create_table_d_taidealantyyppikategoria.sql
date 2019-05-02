USE [ANTERO]
GO

/****** Object:  Table [dw].[d_taidealantyyppikategoria]    Script Date: 2.5.2019 16:49:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_taidealantyyppikategoria]') AND type in (N'U'))

CREATE TABLE [dw].[d_taidealantyyppikategoria](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[taidealantyyppikategoria_koodi] [varchar](3) NOT NULL,
	[taidealantyyppikategoria_nimi_fi] [varchar](100) NOT NULL,
	[taidealantyyppikategoria_nimi_sv] [varchar](100) NOT NULL,
	[taidealantyyppikategoria_nimi_en] [varchar](100) NOT NULL,
	[source] [varchar](100) NOT NULL,
	[jarjestys_taidealantyyppikategoria_koodi]  AS (case when [taidealantyyppikategoria_koodi]=(-1) then '99999' else CONVERT([varchar](10),[taidealantyyppikategoria_koodi]) end),
 CONSTRAINT [PK_D_TAIDEALANTYYPPIKATEGORIA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO [dw].[d_taidealantyyppikategoria] (taidealantyyppikategoria_koodi, taidealantyyppikategoria_nimi_fi)
values (-1,'Tieto puuttuu'),
(1,'arkkitehtuurikilpailuehdotus'),
(2,'dramatisointi / dramaturgy'),
(3,'esiintyjä /esittävä taide'),
(4,'esiintyjä erillisesti tuotetussa tallenteessa (muu kuin konsertin tai vastaavan dokumentaatio)'),
(5,'esiintyjä musiikkiteatteriproduktiossa (esim. oopperarooli)'),
(6,'esiintyjä muussa taiteellisessa suorituksessa, kuvaile'),
(7,'esitys / performance'),
(8,'esitys / produktio'),
(9,'graafinen suunnitelma / graphic design'),
(10,'kaunokirjallinen teos (runo, romaani, näytelmä, satu jne.)'),
(11,'kaupunkisuunnitelma'),
(12,'kiertue'),
(13,'konsepti'),
(14,'konsertti: avustava tehtävä yhtyeen tai vastaan jäsenenä'),
(15,'konsertti: kapellimestarina toimiminen'),
(16,'konsertti: kuoronjohtajana toimiminen'),
(17,'konsertti: kuvaile'),
(18,'konsertti: soolokonsertti (resitaali)'),
(19,'konsertti: vaativa solistinen tehtävä (kuten orkesterin solisti)'),
(20,'konsertti: vaativa tehtävä yhtyeen tai vastaavan jäsenenä (yksi esittäjistä)'),
(21,'koreografia'),
(22,'kuunnelma'),
(23,'kuvakirja'),
(24,'kuvasuunnittelu / illustration or lay out'),
(25,'kuvaus / cinematography'),
(26,'käsikirjoitus / scriptwriting'),
(27,'käsikirjoitus / adaptaatio'),
(28,'käännös'),
(29,'lavastus'),
(30,'leikkaus / editing'),
(31,'libretto'),
(32,'maisemasuunnitelma'),
(33,'mallisto / collection'),
(34,'mediatuotanto / media production'),
(35,'monitaiteinen kirjoittaminen'),
(36,'musiikillisen kokonaisuuden taiteellinen tuottaja'),
(37,'musiikkiteoksen sanoitus tai sanoituksen käännös'),
(38,'muu julkinen teos'),
(39,'näytelmä'),
(40,'näyttelijä / acting'),
(41,'näyttelyn suunnittelu/kuratointi'),
(42,'näytös'),
(43,'ohjaus / directing'),
(44,'palvelumuotoilu'),
(45,'peli / game'),
(46,'performanssi'),
(47,'produktion taiteellinen johtaminen / tuottaminen'),
(48,'puvustus / costume design'),
(49,'rakennussuunnitelma'),
(50,'sanoitus'),
(51,'sarjakuva'),
(52,'screening'),
(53,'sisustussuunnitelma'),
(54,'sovitus'),
(55,'sävellys'),
(56,'taidekasvatusproduktio / art education project'),
(57,'tanssija'),
(58,'tapahtuma / event'),
(59,'tarinateatteri'),
(60,'teoksen, esityksen valmennus'),
(61,'toteutettu kaupunkitila'),
(62,'toteutettu maisema'),
(63,'toteutettu rakennus'),
(64,'tuotanto / production'),
(65,'tuotesuunnitelma / product design'),
(66,'valosuunnittelu, suunnitelma / lightning design'),
(67,'verkkotaide, toteutus / website, digital application design'),
(68,'visualisointi / visualization'),
(69,'yhteiskunnallinen taideprojekti / societal art project'),
(70,'yhteisnäyttely'),
(71,'yhteisötaiteellinen projekti / community art project'),
(72,'yksityisnäyttely'),
(73,'ympäristötaide'),
(74,'äänikirja'),
(75,'äänisuunnittelu, suunnitelma / sound design');




