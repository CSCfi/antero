USE [VipunenTK_lisatiedot]
GO
/******[dbo].[Rahoitusmalli_korkeakoulut]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rahoitusmalli_korkeakoulut]') AND type in (N'U'))
BEGIN
CREATE TABLE VipunenTK_lisatiedot.[dbo].[Rahoitusmalli_korkeakoulut](
	[id] [int] NOT NULL,
	[rahoituksen_vuosi] [nvarchar](20) NULL,
	[sektori] [nvarchar](30) NULL,
	[rahoituksen_kategoria] [nvarchar](200) NULL,
	[indikaattori] [nvarchar](200) NULL,
	[rahoitus_1000_euroa] [int] NULL,
	[osuus_rahoituksesta] [decimal](4,3) NULL,
	[tietolahde] [nvarchar](100) NULL,
	[user] [nvarchar](100) NULL,
	[luotu] [date] NULL,
) ON [PRIMARY]
END

IF NOT EXISTS 
		(SELECT * FROM VipunenTK_lisatiedot.dbo.Rahoitusmalli_korkeakoulut f
		WHERE f.[rahoituksen_vuosi]<>'2019' AND f.[rahoituksen_vuosi]<>'2019'
		)
BEGIN
INSERT INTO VipunenTK_lisatiedot.[dbo].[Rahoitusmalli_korkeakoulut]
	([id]
	,[rahoituksen_vuosi]
	,[sektori]
	,[rahoituksen_kategoria]
	,[indikaattori]
	,[rahoitus_1000_euroa]
	,[osuus_rahoituksesta]
	,[tietolahde]
	,[user]
	,[luotu])
VALUES
	(1
	,'2019'
	,'Ammattikorkeakoulu'
	,'Koulutus'
	,'Suoritetut ammattikorkeakoulututkinnot'
	,309941
	,0.4
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(2
	,'2019'
	,'Ammattikorkeakoulu'
	,'Koulutus'
	,'Suoritetut ammatilliset opettajankoulutusopinnot'
	,15497
	,0.02
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(3
	,'2019'
	,'Ammattikorkeakoulu'
	,'Koulutus'
	,'55 opintopistetta suorittaneet'
	,178216
	,0.23
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(4
	,'2019'
	,'Ammattikorkeakoulu'
	,'Koulutus'
	,'Avoin ammattikorkeakouluopetus, erilliset opinnot ja maahanmuuttajien valmentava koulutus, opintopisteet'
	,38743
	,0.05
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(5
	,'2019'
	,'Ammattikorkeakoulu'
	,'Koulutus'
	,'Opiskelijapalaute'
	,23246
	,0.03
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(6
	,'2019'
	,'Ammattikorkeakoulu'
	,'Koulutus'
	,'Kansainvälinen opiskelijavaihto'
	,15497
	,0.02
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(7
	,'2019'
	,'Ammattikorkeakoulu'
	,'Koulutus'
	,'Ammattikorkeakoulusta valmistuneiden työllisten määrä'
	,30994
	,0.04
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(8
	,'2019'
	,'Ammattikorkeakoulu'
	,'Koulutus'
	,'Alakohtainen rahoitus'
	,7749
	,0.01
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(9
	,'2019'
	,'Ammattikorkeakoulu'
	,'Tutkimus- ja kehittämistoiminta'
	,'Ulkopuolinen TKI-rahoitus'
	,61988
	,0.08
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(10
	,'2019'
	,'Ammattikorkeakoulu'
	,'Tutkimus- ja kehittämistoiminta'
	,'Suoritetut ylemmät ammattikorkeakoulututkinnot'
	,30994
	,0.04
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(11
	,'2019'
	,'Ammattikorkeakoulu'
	,'Tutkimus- ja kehittämistoiminta'
	,'Julkaisut'
	,15497
	,0.02
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(12
	,'2019'
	,'Ammattikorkeakoulu'
	,'Tutkimus- ja kehittämistoiminta'
	,'Henkilöstön kansainvälinen liikkuvuus'
	,7748
	,0.01
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(13
	,'2019'
	,'Ammattikorkeakoulu'
	,'Muut koulutuspolitiikan ja tutkimus- ja kehittämispolitiikan tavoitteet'
	,'Strategiarahoitus'
	,38743
	,0.05
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(14
	,'2019'
	,'Ammattikorkeakoulu'
	,'Perusrahoitus yhteensä'
	,'Perusrahoitus yhteensä'
	,774853
	,1.00
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(15
	,'2019'
	,'Ammattikorkeakoulu'
	,'ALV kompensaatio'
	,'ALV kompensaatio'
	,51611
	,NULL
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(16
	,'2019'
	,'Ammattikorkeakoulu'
	,'Rahoitus yhteensä'
	,'Rahoitus yhteensä'
	,826464
	,NULL
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(17
	,'2019'
	,'Yliopisto'
	,'Koulutus'
	,'Ylemmät korkeakoulututkinnot'
	,202605
	,0.13
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(18
	,'2019'
	,'Yliopisto'
	,'Koulutus'
	,'Alemmat korkeakoulututkinnot'
	,93510
	,0.06
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(19
	,'2019'
	,'Yliopisto'
	,'Koulutus'
	,'55 opintopistettä suorittaneet'
	,155850
	,0.1
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(20
	,'2019'
	,'Yliopisto'
	,'Koulutus'
	,'Avoin yo-opetus ja erilliset opinnot opintopisteet ym.'
	,31170
	,0.02
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(21
	,'2019'
	,'Yliopisto'
	,'Koulutus'
	,'Vaihto-opiskelu, opintopisteet'
	,31170
	,0.02
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(22
	,'2019'
	,'Yliopisto'
	,'Koulutus'
	,'Ulkomaalaiset ylemmän kk-tutkinnon suorittaneet'
	,15585
	,0.01
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(23
	,'2019'
	,'Yliopisto'
	,'Koulutus'
	,'Työllistyneet ylemmän kk-tutkinnon suorittaneet'
	,31170
	,0.02
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(24
	,'2019'
	,'Yliopisto'
	,'Koulutus'
	,'Opiskelijapalaute'
	,46755
	,0.03
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(25
	,'2019'
	,'Yliopisto'
	,'Tutkimus ja tutkijankoulutus'
	,'Julkaisut'
	,202605
	,0.13
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(26
	,'2019'
	,'Yliopisto'
	,'Tutkimus ja tutkijankoulutus'
	,'Tohtorin tutkinnot'
	,140265
	,0.09
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(27
	,'2019'
	,'Yliopisto'
	,'Tutkimus ja tutkijankoulutus'
	,'Kansainvälinen rahoitus'
	,46755
	,0.03
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(28
	,'2019'
	,'Yliopisto'
	,'Tutkimus ja tutkijankoulutus'
	,'Muu kilpailtu tutkimusrahoitus'
	,93510
	,0.06
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(29
	,'2019'
	,'Yliopisto'
	,'Tutkimus ja tutkijankoulutus'
	,'Ulkomaalaiset opetus- ja tutkimushenkilökunta'
	,31170
	,0.02
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(30
	,'2019'
	,'Yliopisto'
	,'Muut koulutus- ja tiedepolitiikan tavoitteet'
	,'Valtakunnalliset tehtävät'
	,109095
	,0.07
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(31
	,'2019'
	,'Yliopisto'
	,'Muut koulutus- ja tiedepolitiikan tavoitteet'
	,'Alakohtainen osuus'
	,140265
	,0.09
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(32
	,'2019'
	,'Yliopisto'
	,'Muut koulutus- ja tiedepolitiikan tavoitteet'
	,'Strategiarahoitus'
	,187020
	,0.12
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(33
	,'2019'
	,'Yliopisto'
	,'Eläkemaksurakenteen muutos'
	,'Eläkemaksurakenteen muutos'
	,1900
	,NULL
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(34
	,'2019'
	,'Yliopisto'
	,'Perusrahoitus yhteensä'
	,'Perusrahoitus yhteensä'
	,1560400
	,1
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(35
	,'2019'
	,'Yliopisto'
	,'Muu yliopistolain mukainen valtion rahoitus'
	,'Laskennallisen rahoituksen ulkopuolella, AYO'
	,11660
	,NULL
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(36
	,'2019'
	,'Yliopisto'
	,'Muu yliopistolain mukainen valtion rahoitus'
	,'ALV kompensaatio'
	,152498
	,NULL
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(37
	,'2019'
	,'Yliopisto'
	,'Muu yliopistolain mukainen valtion rahoitus'
	,'ALV saatava/velka edellisiltä vuosilta'
	,-1045
	,NULL
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(38
	,'2019'
	,'Yliopisto'
	,'Muu yliopistolain mukainen valtion rahoitus'
	,'Laskennallisen rahoituksen ulkopuolella, muut kuin AYO'
	,27000
	,NULL
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(39
	,'2019'
	,'Yliopisto'
	,'Rahoitus yhteensä'
	,'Rahoitus yhteensä'
	,1750513
	,NULL
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
	,
	(-1
	,'Tuntematon'
	,'Tuntematon'
	,'Tuntematon'
	,'Tuntematon'
	,NULL
	,NULL
	,'manuaalinen'
	,'CSC Janne'
	,'2019-02-15')
END

GO
USE [ANTERO]