USE [VipunenTK_lisatiedot]
GO
/****** Object:  View [dbo].[v_aidinkieli_versio1]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_aidinkieli_versio1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_aidinkieli_versio1] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	aidinkieli_versio1_koodi,
	aidinkieli_versio1,
	aidinkieli_versio1_SV,
	aidinkieli_versio1_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.aidinkieli_versio1
' 
GO
/****** Object:  View [dbo].[v_aidinkieli_versio2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_aidinkieli_versio2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_aidinkieli_versio2] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	aidinkieli_versio2_koodi,
	aidinkieli_versio2,
	aidinkieli_versio2_SV,
	aidinkieli_versio2_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.aidinkieli_versio2
' 
GO
/****** Object:  View [dbo].[v_aidinkieli_versio3]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_aidinkieli_versio3]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_aidinkieli_versio3] AS
SELECT
	id,
	luotu,
	aidinkieli_versio3_koodi,
	aidinkieli_versio3,
	aidinkieli_versio3_SV,
	aidinkieli_versio3_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.aidinkieli_versio3

' 
GO
/****** Object:  View [dbo].[v_aikaisemmat_tutkinnot]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_aikaisemmat_tutkinnot]'))
EXEC dbo.sp_executesql @statement = N'



 
CREATE VIEW [dbo].[v_aikaisemmat_tutkinnot] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	aikaisemmat_tutkinnot_koodi,
	aikaisemmat_tutkinnot,
	aikaisemmat_tutkinnot_SV,
	aikaisemmat_tutkinnot_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.aikaisemmat_tutkinnot




' 
GO
/****** Object:  View [dbo].[v_aikaisempi_korkein_tutkinto]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_aikaisempi_korkein_tutkinto]'))
EXEC dbo.sp_executesql @statement = N'

 
CREATE VIEW [dbo].[v_aikaisempi_korkein_tutkinto] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	aikaisempi_korkein_tutkinto_koodi,
	aikaisempi_korkein_tutkinto,
	aikaisempi_korkein_tutkinto_SV,
	aikaisempi_korkein_tutkinto_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.aikaisempi_korkein_tutkinto


' 
GO
/****** Object:  View [dbo].[v_aikalkk]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_aikalkk]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_aikalkk] AS  

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[aikalkk_koodi]
      ,[koodinselite]
      ,[koodinselite_SV]
      ,[koodinselite_EN]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
      ,[jarjestys]
      ,[virhetilanne]
  FROM [VipunenTK_lisatiedot].[dbo].[aikalkk]
' 
GO
/****** Object:  View [dbo].[v_aikuisopiskelija]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_aikuisopiskelija]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_aikuisopiskelija] AS  

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[aikuisopiskelija_koodi]
      ,[aikuisopiskelija]
      ,[aikuisopiskelija_SV]
      ,[aikuisopiskelija_EN]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
      ,[jarjestys]
      ,[virhetilanne]
  FROM [VipunenTK_lisatiedot].[dbo].[aikuisopiskelija]
' 
GO
/****** Object:  View [dbo].[v_aineisto]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_aineisto]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_aineisto] AS  

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[aineisto_koodi]
      ,[aineisto]
      ,[aineisto_SV]
      ,[aineisto_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[aineisto]
' 
GO
/****** Object:  View [dbo].[v_aineisto_OTV]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_aineisto_OTV]'))
EXEC dbo.sp_executesql @statement = N'
--use [VipunenTK_lisatiedot]

/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[v_aineisto_OTV] as

SELECT [id]
      ,[aineisto_koodi]
      ,[tilastointivuosi]
      ,[alkaa]
      ,[paattyy]
      ,[aineisto]
      ,[aineisto_SV]
      ,[aineisto_EN]
      ,[jarjestys]
      ,[toisen_asteen_koulutus]
      ,[kaikkien_asteiden_koulutus]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[aineisto_OTV]
  
' 
GO
/****** Object:  View [dbo].[v_AL_K3_10_alueluokitus_kunta_nykytila]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_AL_K3_10_alueluokitus_kunta_nykytila]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_AL_K3_10_alueluokitus_kunta_nykytila] AS
-- CSC Jarmo 2.5.2014
-- Mappausnäkymä aloittaneiden läpäisyn lähtöaineiston K3.10 alueluokitusten päivittämiseksi nykytilaan
-- Käytetään ennen läpäisyn laskentaohjelman ajoa VipunenTK_SA-alueen näkymissä.

-- Select * from VipunenTK_lisatiedot.dbo.v_AL_K3_10_alueluokitus_kunta_nykytila

SELECT 
       [alueluokitus_koodi]
      ,[alueluokitus_koodi_nykytila]
  FROM [VipunenTK_lisatiedot].[dbo].[AL_alueluokitus_nykytila]
  WHERE ISNULL(vaikuttaa_K3_10_aineistoon,''E'') = ''K''
  AND alueluokitus_tyyppi=''''

' 
GO
/****** Object:  View [dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] AS
-- CSC Jarmo 2.5.2014
-- Mappausnäkymä aloittaneiden läpäisyn lähtöaineiston K3.10 alueluokitusten päivittämiseksi nykytilaan
-- Käytetään ennen läpäisyn laskentaohjelman ajoa VipunenTK_SA-alueen näkymissä.

-- Select * from VipunenTK_lisatiedot.dbo.v_AL_K3_10_alueluokitus_maakunta_nykytila

SELECT 
       [alueluokitus_koodi]
      ,[alueluokitus_koodi_nykytila]
  FROM [VipunenTK_lisatiedot].[dbo].[AL_alueluokitus_nykytila]
  WHERE ISNULL(vaikuttaa_K3_10_aineistoon,''E'') = ''K''
  AND alueluokitus_tyyppi=''MAAK''

' 
GO
/****** Object:  View [dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] AS
-- CSC Jarmo 2.5.2014
-- Mappausnäkymä aloittaneiden läpäisyn lähtöaineiston K3.10 järjestäjien päivittämiseksi nykytilaan
-- Käytetään ennen läpäisyn laskentaohjelman ajoa VipunenTK_SA-alueen näkymissä.

-- Select * from VipunenTK_lisatiedot.dbo.v_AL_K3_10_koulutuksen_jarjestaja_nykytila

SELECT 
       [koulutuksen_jarjestajakoodi]
      ,[koulutuksen_jarjestajakoodi_nykytila]
  FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila]
  WHERE ISNULL(vaikuttaa_K3_10_aineistoon,''E'') = ''K''' 
GO
/****** Object:  View [dbo].[v_AL_K3_10_koulutusluokitus_nykytila]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_AL_K3_10_koulutusluokitus_nykytila]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_AL_K3_10_koulutusluokitus_nykytila] AS
-- CSC Jarmo 2.5.2014
-- Mappausnäkymä aloittaneiden läpäisyn lähtöaineiston K3.10 koulutusluokitusten päivittämiseksi nykytilaan
-- Käytetään ennen läpäisyn laskentaohjelman ajoa VipunenTK_SA-alueen näkymissä.

-- Select * from VipunenTK_lisatiedot.dbo.v_AL_K3_10_koulutusluokitus_nykytila

SELECT 
       [koulutus_koodi]
      ,[koulutus_koodi_nykytila]
  FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila]
  WHERE ISNULL(vaikuttaa_K3_10_aineistoon,''E'') = ''K''
' 
GO
/****** Object:  View [dbo].[v_AL_K3_9_alueluokitus_kunta_nykytila]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_AL_K3_9_alueluokitus_kunta_nykytila]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_AL_K3_9_alueluokitus_kunta_nykytila] AS
-- CSC Jarmo 2.5.2014
-- Mappausnäkymä aloittaneiden läpäisyn lähtöaineiston K3.9 alueluokitusten päivittämiseksi nykytilaan
-- Käytetään ennen läpäisyn laskentaohjelman ajoa VipunenTK_SA-alueen näkymissä.

-- Select * from VipunenTK_lisatiedot.dbo.v_AL_K3_9_alueluokitus_kunta_nykytila

SELECT 
       [alueluokitus_koodi]
      ,[alueluokitus_koodi_nykytila]
  FROM [VipunenTK_lisatiedot].[dbo].[AL_alueluokitus_nykytila]
  WHERE ISNULL(vaikuttaa_K3_9_aineistoon,''E'') = ''K''
  AND alueluokitus_tyyppi=''''

' 
GO
/****** Object:  View [dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] AS
-- CSC Jarmo 2.5.2014
-- Mappausnäkymä aloittaneiden läpäisyn lähtöaineiston K3.9 alueluokitusten päivittämiseksi nykytilaan
-- Käytetään ennen läpäisyn laskentaohjelman ajoa VipunenTK_SA-alueen näkymissä.

-- Select * from VipunenTK_lisatiedot.dbo.v_AL_K3_9_alueluokitus_maakunta_nykytila

SELECT 
       [alueluokitus_koodi]
      ,[alueluokitus_koodi_nykytila]
  FROM [VipunenTK_lisatiedot].[dbo].[AL_alueluokitus_nykytila]
  WHERE ISNULL(vaikuttaa_K3_9_aineistoon,''E'') = ''K''
  AND alueluokitus_tyyppi=''MAAK''


' 
GO
/****** Object:  View [dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] AS
-- CSC Jarmo 2.5.2014
-- Mappausnäkymä aloittaneiden läpäisyn lähtöaineiston K3.9 järjestäjien päivittämiseksi nykytilaan
-- Käytetään ennen läpäisyn laskentaohjelman ajoa VipunenTK_SA-alueen näkymissä.

-- Select * from VipunenTK_lisatiedot.dbo.v_AL_K3_9_koulutuksen_jarjestaja_nykytila

SELECT 
       [koulutuksen_jarjestajakoodi]
      ,[koulutuksen_jarjestajakoodi_nykytila]
  FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila]
  WHERE ISNULL(vaikuttaa_K3_9_aineistoon,''E'') = ''K''' 
GO
/****** Object:  View [dbo].[v_AL_K3_9_koulutusluokitus_nykytila]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_AL_K3_9_koulutusluokitus_nykytila]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_AL_K3_9_koulutusluokitus_nykytila] AS
-- CSC Jarmo 2.5.2014
-- Mappausnäkymä aloittaneiden läpäisyn lähtöaineiston K3.9 koulutusluokitusten päivittämiseksi nykytilaan
-- Käytetään ennen läpäisyn laskentaohjelman ajoa VipunenTK_SA-alueen näkymissä.

-- Select * from VipunenTK_lisatiedot.dbo.v_AL_K3_9_koulutusluokitus_nykytila

SELECT 
       [koulutus_koodi]
      ,[koulutus_koodi_nykytila]
  FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila]
  WHERE ISNULL(vaikuttaa_K3_9_aineistoon,''E'') = ''K''
' 
GO
/****** Object:  View [dbo].[v_aloittaneiden_lapaisy_1_tutkintolaji]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_aloittaneiden_lapaisy_1_tutkintolaji]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_aloittaneiden_lapaisy_1_tutkintolaji] AS

-- Muodostaa seurantatilanteen 1 dimension lähtötiedoista
-- Jarmo 13.5.2013
-- Select * from v_aloittaneiden_lapaisy_1_tutkintolaji
Select 
	alkaa, 
	paattyy,  
	jarjestys,
	[1a koodi] = Case 
		When LEFT(koodi,2) = ''1a'' then koodi end,
	[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] = Case 
		When LEFT(koodi,2) = ''1a'' then selite end,
	[1b koodi] = Case 
		When LEFT(koodi,2) = ''1b'' then koodi end,
	[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa] = Case 
		When LEFT(koodi,2) = ''1b'' then selite end,
	[1c koodi] = Case 
		When LEFT(koodi,2) = ''1c'' then koodi end,
	[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] = Case 
		When LEFT(koodi,2) = ''1c'' then selite end,
	[1d koodi] = Case 
		When LEFT(koodi,2) = ''1d'' then koodi end,
	[1d Aloittaneista ilman tutkintoa opiskelua jatkavat koulutuslajin mukaan] = Case 
		When LEFT(koodi,2) = ''1d'' then selite end,
	[1e koodi] = Case 
		When LEFT(koodi,2) = ''1e'' then koodi end,
	[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan] = Case 
		When LEFT(koodi,2) = ''1e'' then selite end,
	[1f koodi] = Case 
		When LEFT(koodi,2) = ''1f'' then koodi end,
	[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan] = Case 
		When LEFT(koodi,2) = ''1f'' then selite end,
	[1g koodi] = Case 
		When LEFT(koodi,2) = ''1g'' then koodi end,
	[1g Aloittaneista alkuperäisen tutkintolajin opiskelua jatkavat koulutuslajin mukaan] = Case 
		When LEFT(koodi,2) = ''1g'' then selite end,
	[1h koodi] = Case 
		When LEFT(koodi,2) = ''1h'' then koodi end,
	[1h Aloittaneista muun tutkintolajin opiskelua jatkavat koulutuslajin mukaan] = Case 
		When LEFT(koodi,2) = ''1h'' then selite end
from aloittaneiden_lapaisy_seuranta
where LEFT(koodi,1)=''1''
' 
GO
/****** Object:  View [dbo].[v_ammatillinen_koulutus_luokittelu]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ammatillinen_koulutus_luokittelu]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[v_ammatillinen_koulutus_luokittelu] AS
/*
Drop table  VipunenTK_DW.dbo.d_ammatillinen_koulutus_luokittelu
Select * into VipunenTK_DW.dbo.d_ammatillinen_koulutus_luokittelu from VipunenTK_lisatiedot.dbo.[v_ammatillinen_koulutus_luokittelu] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_ammatillinen_koulutus_luokittelu
Insert into VipunenTK_DW.dbo.d_ammatillinen_koulutus_luokittelu
Select * from VipunenTK_lisatiedot.dbo.[v_ammatillinen_koulutus_luokittelu] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
	  ,[ammatillisen_koulutuksen_luokittelu_avain]
	  ,[oppisopimuskoulutus_koodi]
	  ,[ammatillisen_koulutuksen_koulutuslaji_koodi]
	  ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi]
	  ,[ammatillisen_koulutuksen_luokittelu_4_7_4_8_avain]
	  ,[ammatillisen_koulutuksen_luokittelu_4_7_4_8]
	  ,[ammatillisen_koulutuksen_luokittelu_4_7_4_8_SV]
	  ,[ammatillisen_koulutuksen_luokittelu_4_7_4_8_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[ammatillinen_koulutus_luokittelu]

' 
GO
/****** Object:  View [dbo].[v_ammatillinen_peruskoulutus_lisakoulutus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ammatillinen_peruskoulutus_lisakoulutus]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_ammatillinen_peruskoulutus_lisakoulutus] AS  
SELECT [id]
,[luotu]
,[alkaa]
,[paattyy]
,[ammatillinen_peruskoulutus_lisakoulutus_koodi]
,[ammatillinen_peruskoulutus_lisakoulutus]
,[ammatillinen_peruskoulutus_lisakoulutus_SV]
,[ammatillinen_peruskoulutus_lisakoulutus_EN]
,[jarjestys]
,[virhetilanne]
,[poistettu]
,[tietolahde]
,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[ammatillinen_peruskoulutus_lisakoulutus]
' 
GO
/****** Object:  View [dbo].[v_ammatillisen_koulutuksen_koulutuslaji]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ammatillisen_koulutuksen_koulutuslaji]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_ammatillisen_koulutuksen_koulutuslaji] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	ammatillisen_koulutuksen_koulutuslaji_koodi,
	ammatillisen_koulutuksen_koulutuslaji,
	ammatillisen_koulutuksen_koulutuslaji_SV,
	ammatillisen_koulutuksen_koulutuslaji_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.ammatillisen_koulutuksen_koulutuslaji
' 
GO
/****** Object:  View [dbo].[v_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_koodi,
	ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa,
	ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_SV,
	ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa
' 
GO
/****** Object:  View [dbo].[v_ammattiasema]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ammattiasema]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_ammattiasema] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	ammattiasema_koodi,
	ammattiasema,
	ammattiasema_SV,
	ammattiasema_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.ammattiasema
' 
GO
/****** Object:  View [dbo].[v_ammattiluokitus_2001]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ammattiluokitus_2001]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[v_ammattiluokitus_2001] as
select
	id,
	luotu,
	alkaa,
	paattyy,
	ammattiluokitus_2001_avain,
	ammattiluokitus_2001_koodi,
	ammattiluokitus_2001,
	ammattiluokitus_2001_SV,
	ammattiluokitus_2001_EN,
	taso,
	jarjestys,
	jarjestys_taso,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
from dbo.ammattiluokitus_2001
' 
GO
/****** Object:  View [dbo].[v_ammattiluokitus_2010]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ammattiluokitus_2010]'))
EXEC dbo.sp_executesql @statement = N'



/*
Select * into VipunenTK_DW.dbo.d_ammattiluokitus_2010 from VipunenTK_lisatiedot.dbo.[v_ammattiluokitus_2010] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_ammattiluokitus_2010
Insert into VipunenTK_DW.dbo.d_ammattiluokitus_2010
Select * from VipunenTK_lisatiedot.dbo.[v_ammattiluokitus_2010] where virhetilanne<>''K''
*/

CREATE view [dbo].[v_ammattiluokitus_2010] as

SELECT [id]
      ,[luotu]
      ,[ammattiluokitus_2010_avain]
      ,[ammattiluokitus_2010_5_taso_koodi]
      ,[ammattiluokitus_2010_5_taso]
      ,[ammattiluokitus_2010_5_taso_SV]
      ,[ammattiluokitus_2010_5_taso_EN]
      ,[ammattiluokitus_2010_4_taso_koodi]
      ,[ammattiluokitus_2010_4_taso]
      ,[ammattiluokitus_2010_4_taso_SV]
      ,[ammattiluokitus_2010_4_taso_EN]
      ,[ammattiluokitus_2010_3_taso_koodi]
      ,[ammattiluokitus_2010_3_taso]
      ,[ammattiluokitus_2010_3_taso_SV]
      ,[ammattiluokitus_2010_3_taso_EN]
      ,[ammattiluokitus_2010_2_taso_koodi]
      ,[ammattiluokitus_2010_2_taso]
      ,[ammattiluokitus_2010_2_taso_SV]
      ,[ammattiluokitus_2010_2_taso_EN]
      ,[ammattiluokitus_2010_1_taso_koodi]
      ,[ammattiluokitus_2010_1_taso]
      ,[ammattiluokitus_2010_1_taso_SV]
      ,[ammattiluokitus_2010_1_taso_EN]
      ,[taso]
      ,[jarjestys_ammattiluokitus_2010_taso5]
      ,[jarjestys_ammattiluokitus_2010_taso4]
      ,[jarjestys_ammattiluokitus_2010_taso3]
      ,[jarjestys_ammattiluokitus_2010_taso2]
      ,[jarjestys_ammattiluokitus_2010_taso1]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [dbo].[ammattiluokitus_2010]

' 
GO
/****** Object:  View [dbo].[v_asuinkunta_sama_vai_eri_kuin_aiemmin]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_asuinkunta_sama_vai_eri_kuin_aiemmin]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_asuinkunta_sama_vai_eri_kuin_aiemmin] AS
SELECT 

	[id]
	,[luotu]
	,[asuinkunta_sama_vai_eri_kuin_aiemmin_koodi]
	,[asuinkunta_sama_vai_eri_kuin_aiemmin]
	,[asuinkunta_sama_vai_eri_kuin_aiemmin_SV]
	,[asuinkunta_sama_vai_eri_kuin_aiemmin_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[asuinkunta_sama_vai_eri_kuin_aiemmin]
WHERE virhetilanne = ''E''
' 
GO
/****** Object:  View [dbo].[v_asuinmaakunta_sama_kuin_tyopaikan]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_asuinmaakunta_sama_kuin_tyopaikan]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_asuinmaakunta_sama_kuin_tyopaikan] AS
/*
Select * into VipunenTK_DW.dbo.d_asuinmaakunta_sama_kuin_tyopaikan from VipunenTK_lisatiedot.dbo.[v_asuinmaakunta_sama_kuin_tyopaikan] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_asuinmaakunta_sama_kuin_tyopaikan
Insert into VipunenTK_DW.dbo.d_asuinmaakunta_sama_kuin_tyopaikan
Select * from VipunenTK_lisatiedot.dbo.[v_asuinmaakunta_sama_kuin_tyopaikan] where virhetilanne<>''K''
*/
SELECT 
	   [id]
      ,[luotu]
      ,[asuinmaakunta_sama_kuin_tyopaikan_avain]
      ,[asuinmaakunta_sama_kuin_tyopaikan]
      ,[asuinmaakunta_sama_kuin_tyopaikan_SV]
      ,[asuinmaakunta_sama_kuin_tyopaikan_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[asuinmaakunta_sama_kuin_tyopaikan]
WHERE virhetilanne <> ''K''

' 
GO
/****** Object:  View [dbo].[v_avoinvayla]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_avoinvayla]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_avoinvayla] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	avoinvayla_koodi,
	avoinvayla,
	avoinvayla_SV,
	avoinvayla_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.avoinvayla
' 
GO
/****** Object:  View [dbo].[v_edellisen_vuoden_opiskelu]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_edellisen_vuoden_opiskelu]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_edellisen_vuoden_opiskelu] AS
/*
Drop table  VipunenTK_DW.dbo.d_edellisen_vuoden_opiskelu
Select * into VipunenTK_DW.dbo.d_edellisen_vuoden_opiskelu from VipunenTK_lisatiedot.dbo.[v_edellisen_vuoden_opiskelu] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_edellisen_vuoden_opiskelu
Insert into VipunenTK_DW.dbo.d_edellisen_vuoden_opiskelu
Select * from VipunenTK_lisatiedot.dbo.[v_edellisen_vuoden_opiskelu] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,edellisen_vuoden_opiskelu_avain
      ,edellisen_vuoden_opiskelu_koulutus
      ,edellisen_vuoden_opiskelu_koulutus_SV
      ,edellisen_vuoden_opiskelu_koulutus_EN
      ,edellisen_vuoden_opiskelu_tarkennus
      ,edellisen_vuoden_opiskelu_tarkennus_SV
      ,edellisen_vuoden_opiskelu_tarkennus_EN
      ,jarjestys_koulutus
      ,jarjestys_tarkennus
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[edellisen_vuoden_opiskelu]


' 
GO
/****** Object:  View [dbo].[v_edeltavan_vuoden_asuinpaikka]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_edeltavan_vuoden_asuinpaikka]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_edeltavan_vuoden_asuinpaikka] AS
SELECT 

	[id]
	,[luotu]
	,[edeltavan_vuoden_asuinpaikka_koodi]
	,[edeltavan_vuoden_asuinpaikka]
	,[edeltavan_vuoden_asuinpaikka_SV]
	,[edeltavan_vuoden_asuinpaikka_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[edeltavan_vuoden_asuinpaikka]
WHERE virhetilanne = ''E''
' 
GO
/****** Object:  View [dbo].[v_elakkeelle_siirtynyt_tai_kuollut]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_elakkeelle_siirtynyt_tai_kuollut]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_elakkeelle_siirtynyt_tai_kuollut] AS

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
   	  ,[elakkeelle_siirtynyt_tai_kuollut_koodi]
      ,[elakkeelle_siirtynyt_tai_kuollut_ryhma]
      ,[elakkeelle_siirtynyt_tai_kuollut_ryhma_SV]
      ,[elakkeelle_siirtynyt_tai_kuollut_ryhma_EN]
	  ,[elakkeelle_siirtynyt_tai_kuollut]
	  ,[elakkeelle_siirtynyt_tai_kuollut_SV]
	  ,[elakkeelle_siirtynyt_tai_kuollut_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[elakkeelle_siirtynyt_tai_kuollut]
' 
GO
/****** Object:  View [dbo].[v_ensisijainen_opintooikeus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ensisijainen_opintooikeus]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_ensisijainen_opintooikeus] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	ensisijainen_opintooikeus_koodi,
	ensisijainen_opintooikeus,
	ensisijainen_opintooikeus_SV,
	ensisijainen_opintooikeus_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.ensisijainen_opintooikeus
' 
GO
/****** Object:  View [dbo].[v_erityisopetuksen_peruste]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_erityisopetuksen_peruste]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_erityisopetuksen_peruste] AS

SELECT [id]
      ,[luotu]
      ,[erityisopetuksen_peruste_avain]
      ,[erityisopetuksen_peruste]
      ,[erityisopetuksen_peruste_SV]
      ,[erityisopetuksen_peruste_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[erityisopetuksen_peruste]

' 
GO
/****** Object:  View [dbo].[v_erityisoppilaan_opetusryhma]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_erityisoppilaan_opetusryhma]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_erityisoppilaan_opetusryhma] AS

SELECT [id]
      ,[luotu]
      ,[erityisoppilaan_opetusryhma_avain]
      ,[erityisoppilaan_opetusryhma]
      ,[erityisoppilaan_opetusryhma_SV]
      ,[erityisoppilaan_opetusryhma_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[erityisoppilaan_opetusryhma]


' 
GO
/****** Object:  View [dbo].[v_eu_etamaat]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_eu_etamaat]'))
EXEC dbo.sp_executesql @statement = N'
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE VIEW [dbo].[v_eu_etamaat] AS

SELECT [id]
      ,[eu_etamaat_avain]
      ,[eu_etamaat]
      ,[eu_etamaat_SV]
      ,[eu_etamaat_EN]
      ,[jarjestys]
	  ,virhetilanne

  FROM [VipunenTK_lisatiedot].[dbo].[eu_etamaat]


' 
GO
/****** Object:  View [dbo].[v_hakukohde]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_hakukohde]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_hakukohde] AS
/*
Drop table  VipunenTK_DW.dbo.d_hakukohde
Select * into VipunenTK_DW.dbo.d_hakukohde from VipunenTK_lisatiedot.dbo.[v_hakukohde] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_hakukohde
Insert into VipunenTK_DW.dbo.d_hakukohde
Select * from VipunenTK_lisatiedot.dbo.[v_hakukohde] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[hakukohde_avain]
      ,[hakukohde]
      ,[hakukohde_SV]
      ,[hakukohde_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[hakukohde]

' 
GO
/****** Object:  View [dbo].[v_hakukohde_erillisvalinta]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_hakukohde_erillisvalinta]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_hakukohde_erillisvalinta] AS
/*
Drop table  VipunenTK_DW.dbo.d_hakukohde_erillisvalinta
Select * into VipunenTK_DW.dbo.d_hakukohde_erillisvalinta from VipunenTK_lisatiedot.dbo.[v_hakukohde_erillisvalinta] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_hakukohde_erillisvalinta
Insert into VipunenTK_DW.dbo.d_hakukohde_erillisvalinta
Select * from VipunenTK_lisatiedot.dbo.[v_hakukohde_erillisvalinta] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[hakukohde_erillisvalinta_avain]
      ,[hakukohde_erillisvalinta]
      ,[hakukohde_erillisvalinta_SV]
      ,[hakukohde_erillisvalinta_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[hakukohde_erillisvalinta]


' 
GO
/****** Object:  View [dbo].[v_hakukohteen_prioriteetti]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_hakukohteen_prioriteetti]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_hakukohteen_prioriteetti] AS
/*
Drop table  VipunenTK_DW.dbo.d_hakukohteen_prioriteetti
Select * into VipunenTK_DW.dbo.d_hakukohteen_prioriteetti from VipunenTK_lisatiedot.dbo.[v_hakukohteen_prioriteetti] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_hakukohteen_prioriteetti
Insert into VipunenTK_DW.dbo.d_hakukohteen_prioriteetti
Select * from VipunenTK_lisatiedot.dbo.[v_hakukohteen_prioriteetti] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[hakukohteen_prioriteetti_avain]
      ,[hakukohteen_prioriteetti]
      ,[hakukohteen_prioriteetti_SV]
      ,[hakukohteen_prioriteetti_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[hakukohteen_prioriteetti]
' 
GO
/****** Object:  View [dbo].[v_hakukohteen_tulos]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_hakukohteen_tulos]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_hakukohteen_tulos] AS
/*
Drop table  VipunenTK_DW.dbo.d_hakukohteen_tulos
Select * into VipunenTK_DW.dbo.d_hakukohteen_tulos from VipunenTK_lisatiedot.dbo.[v_hakukohteen_tulos] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_hakukohteen_tulos
Insert into VipunenTK_DW.dbo.d_hakukohteen_tulos
Select * from VipunenTK_lisatiedot.dbo.[v_hakukohteen_tulos] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,hakukohde_hyvaksytty_koodi
      ,hakukohde_hyvaksytty
      ,hakukohde_hyvaksytty_SV
      ,hakukohde_hyvaksytty_EN
      ,jarjestys_hyvaksytty
      ,hakukohde_vastaanotettu_koodi
      ,hakukohde_vastaanotettu
      ,hakukohde_vastaanotettu_SV
      ,hakukohde_vastaanotettu_EN
      ,jarjestys_vastaanotettu
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[hakukohteen_tulos]

' 
GO
/****** Object:  View [dbo].[v_hakukohteen_tutkinnon_taso]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_hakukohteen_tutkinnon_taso]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_hakukohteen_tutkinnon_taso] AS
/*
Drop table  VipunenTK_DW.dbo.d_hakukohteen_tutkinnon_taso
Select * into VipunenTK_DW.dbo.d_hakukohteen_tutkinnon_taso from VipunenTK_lisatiedot.dbo.[v_hakukohteen_tutkinnon_taso] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_hakukohteen_tutkinnon_taso
Insert into VipunenTK_DW.dbo.d_hakukohteen_tutkinnon_taso
Select * from VipunenTK_lisatiedot.dbo.[v_hakukohteen_tutkinnon_taso] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
	  ,hakukohde_tutkinnon_taso_koodi
	  ,hakukohde_tutkinnon_taso
	  ,hakukohde_tutkinnon_taso_SV
	  ,hakukohde_tutkinnon_taso_EN
	  ,jarjestys_hakukohde_tutkinnon_taso
	  ,hakukohde_tutkinnon_taso_tarkennus_koodi
	  ,hakukohde_tutkinnon_taso_tarkennus
	  ,hakukohde_tutkinnon_taso_tarkennus_SV
	  ,hakukohde_tutkinnon_taso_tarkennus_EN
	  ,jarjestys_hakukohde_tutkinnon_taso_tarkennus
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[hakukohteen_tutkinnon_taso]



' 
GO
/****** Object:  View [dbo].[v_hallinnonala]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_hallinnonala]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_hallinnonala] AS  
SELECT [id]
,[luotu]
,[alkaa]
,[paattyy]
,[hallinnonala_koodi]
,[hallinnonala]
,[hallinnonala_SV]
,[hallinnonala_EN]
,[jarjestys]
,[virhetilanne]
,[poistettu]
,[tietolahde]
,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[hallinnonala]
' 
GO
/****** Object:  View [dbo].[v_hallinnonala2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_hallinnonala2]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_hallinnonala2] AS  
SELECT [id]
,[luotu]
,[alkaa]
,[paattyy]
,[hallinnonala_koodi]
,[hallinnonala]
,[hallinnonala_SV]
,[hallinnonala_EN]
,[jarjestys]
,[virhetilanne]
,[poistettu]
,[tietolahde]
,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[hallinnonala2]

' 
GO
/****** Object:  View [dbo].[v_hetu_ok]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_hetu_ok]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_hetu_ok] AS
/*
Drop table  VipunenTK_DW.dbo.d_hetu_ok
Select * into VipunenTK_DW.dbo.d_hetu_ok from VipunenTK_lisatiedot.dbo.[v_hetu_ok] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_hetu_ok
Insert into VipunenTK_DW.dbo.d_hetu_ok
Select * from VipunenTK_lisatiedot.dbo.[v_hetu_ok] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[hetu_ok_avain]
      ,[hetu_ok]
      ,[hetu_ok_SV]
      ,[hetu_ok_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[hetu_ok]

' 
GO
/****** Object:  View [dbo].[v_ika]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ika]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_ika] AS
/*
--Drop table VipunenTK_DW.dbo.d_ika
--Select * into VipunenTK_DW.dbo.d_ika from VipunenTK_lisatiedot.dbo.v_ika where [virhetilanne]<>''K''
Truncate table VipunenTK_DW.dbo.d_ika
Insert into VipunenTK_DW.dbo.d_ika
Select * from VipunenTK_lisatiedot.dbo.v_ika where [virhetilanne]<>''K''
*/

SELECT 
       [id]
      ,[luotu]
      ,[ika_avain]
      ,[ika_int]
      ,[ika]
      ,[ika_SV]
      ,[ika_EN]
      ,[ika5v_int]
      ,[ika5v]
      ,[ika5v_SV]
      ,[ika5v_EN]
      ,[jarjestys_ika]
      ,[jarjestys_ika5v]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[ika]
' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_koodi]
      ,[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]
      ,[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_SV]
      ,[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_EN]
      ,[jarjestys_4e]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_koodi]
      ,[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]
      ,[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_SV]
      ,[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_EN]
      ,[jarjestys_2e]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_koodi]
      ,[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]
      ,[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_SV]
      ,[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_EN]
      ,[jarjestys_1e]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutussektorilla]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutussektorilla]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutussektorilla] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_alkuperaisella_koulutussektorilla_koodi]
      ,[jatkaa_opiskelua_alkuperaisella_koulutussektorilla]
      ,[jatkaa_opiskelua_alkuperaisella_koulutussektorilla_SV]
      ,[jatkaa_opiskelua_alkuperaisella_koulutussektorilla_EN]
      ,[jarjestys_7e]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_alkuperaisella_koulutussektorilla]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_koodi]
      ,[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]
      ,[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_SV]
      ,[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_EN]
      ,[jarjestys_3e]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisessa_maakunnassa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_alkuperaisessa_maakunnassa]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_alkuperaisessa_maakunnassa] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_alkuperaisessa_maakunnassa_koodi]
      ,[jatkaa_opiskelua_alkuperaisessa_maakunnassa]
      ,[jatkaa_opiskelua_alkuperaisessa_maakunnassa_SV]
      ,[jatkaa_opiskelua_alkuperaisessa_maakunnassa_EN]
      ,[jarjestys_6e]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_alkuperaisessa_maakunnassa]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_koodi]
      ,[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]
      ,[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_SV]
      ,[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_EN]
      ,[jarjestys_5e]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_koodi]
      ,[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]
      ,[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_SV]
      ,[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_EN]
      ,[jarjestys_4f]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muulla_koulutusalalla_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_muulla_koulutusalalla_2002]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_muulla_koulutusalalla_2002] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_muulla_koulutusalalla_2002_koodi]
      ,[jatkaa_opiskelua_muulla_koulutusalalla_2002]
      ,[jatkaa_opiskelua_muulla_koulutusalalla_2002_SV]
      ,[jatkaa_opiskelua_muulla_koulutusalalla_2002_EN]
      ,[jarjestys_2f]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_muulla_koulutusalalla_2002]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muulla_koulutusasteella_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_muulla_koulutusasteella_2002]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_muulla_koulutusasteella_2002] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_muulla_koulutusasteella_2002_koodi]
      ,[jatkaa_opiskelua_muulla_koulutusasteella_2002]
      ,[jatkaa_opiskelua_muulla_koulutusasteella_2002_SV]
      ,[jatkaa_opiskelua_muulla_koulutusasteella_2002_EN]
      ,[jarjestys_1f]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_muulla_koulutusasteella_2002]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muulla_koulutussektorilla]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_muulla_koulutussektorilla]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_muulla_koulutussektorilla] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_muulla_koulutussektorilla_koodi]
      ,[jatkaa_opiskelua_muulla_koulutussektorilla]
      ,[jatkaa_opiskelua_muulla_koulutussektorilla_SV]
      ,[jatkaa_opiskelua_muulla_koulutussektorilla_EN]
      ,[jarjestys_7f]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_muulla_koulutussektorilla]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muulla_opintoalalla_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_muulla_opintoalalla_2002]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_muulla_opintoalalla_2002] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_muulla_opintoalalla_2002_koodi]
      ,[jatkaa_opiskelua_muulla_opintoalalla_2002]
      ,[jatkaa_opiskelua_muulla_opintoalalla_2002_SV]
      ,[jatkaa_opiskelua_muulla_opintoalalla_2002_EN]
      ,[jarjestys_3f]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_muulla_opintoalalla_2002]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muussa_maakunnassa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_muussa_maakunnassa]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_muussa_maakunnassa] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_muussa_maakunnassa_koodi]
      ,[jatkaa_opiskelua_muussa_maakunnassa]
      ,[jatkaa_opiskelua_muussa_maakunnassa_SV]
      ,[jatkaa_opiskelua_muussa_maakunnassa_EN]
      ,[jarjestys_6f]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_muussa_maakunnassa]


' 
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muussa_oppilaitoksessa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatkaa_opiskelua_muussa_oppilaitoksessa]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_jatkaa_opiskelua_muussa_oppilaitoksessa] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatkaa_opiskelua_muussa_oppilaitoksessa_koodi]
      ,[jatkaa_opiskelua_muussa_oppilaitoksessa]
      ,[jatkaa_opiskelua_muussa_oppilaitoksessa_SV]
      ,[jatkaa_opiskelua_muussa_oppilaitoksessa_EN]
      ,[jarjestys_5f]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatkaa_opiskelua_muussa_oppilaitoksessa]


' 
GO
/****** Object:  View [dbo].[v_jatko_opiskelu]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_jatko_opiskelu]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_jatko_opiskelu] AS


SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[jatko_opiskelu_koodi]
      ,[jatko_opiskelu]
      ,[jatko_opiskelu_SV]
      ,[jatko_opiskelu_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[jatko_opiskelu]


' 
GO
/****** Object:  View [dbo].[v_joustava_perusopetus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_joustava_perusopetus]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_joustava_perusopetus] AS
/*
Drop table  VipunenTK_DW.dbo.d_joustava_perusopetus
Select * into VipunenTK_DW.dbo.d_joustava_perusopetus from VipunenTK_lisatiedot.dbo.[v_joustava_perusopetus] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_joustava_perusopetus
Insert into VipunenTK_DW.dbo.d_joustava_perusopetus
Select * from VipunenTK_lisatiedot.dbo.[v_joustava_perusopetus] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[joustava_perusopetus_koodi]
      ,[joustava_perusopetus]
      ,[joustava_perusopetus_SV]
      ,[joustava_perusopetus_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[joustava_perusopetus]


' 
GO
/****** Object:  View [dbo].[v_kansalaisuus_versio1]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_kansalaisuus_versio1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_kansalaisuus_versio1] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	kansalaisuus_versio1_koodi,
	kansalaisuus_versio1,
	kansalaisuus_versio1_SV,
	kansalaisuus_versio1_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.kansalaisuus_versio1
' 
GO
/****** Object:  View [dbo].[v_kansalaisuus_versio2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_kansalaisuus_versio2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_kansalaisuus_versio2] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	kansalaisuus_versio2_koodi,
	kansalaisuus_versio2,
	kansalaisuus_versio2_SV,
	kansalaisuus_versio2_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.kansalaisuus_versio2
' 
GO
/****** Object:  View [dbo].[v_kausi]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_kausi]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_kausi] AS

SELECT [kausi_id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[vuosi]
      ,[vuosiselite]
      ,[vuosiselite_SV]
      ,[vuosiselite_EN]
      ,[lukukausi]
      ,[lukukausiselite]
      ,[lukukausiselite_SV]
      ,[lukukausiselite_EN]
      ,[kuukausi]
      ,[kuukausiselite]
      ,[kuukausiselite_SV]
      ,[kuukausiselite_EN]
      ,[paiva]
      ,[lukuvuosi]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[kausi]
' 
GO
/****** Object:  View [dbo].[v_kieli]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_kieli]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view [dbo].[v_kieli] as

/*

truncate table vipunentk_dw.dbo.kieli
insert into vipunentk_dw.dbo.d_kieli
select * from vipunentk_lisatiedot.dbo.v_kieli
where virhetilanne = ''E''

*/

select
	id,
	luotu,
	alkaa,
	paattyy,
	kieli_avain,
	kieli_koodi,
	kieli,
	kieli_SV,
	kieli_EN,
	iso3kirjainta_koodi,
	jarjestys,
	jarjestys_iso3kirjainta,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
from dbo.kieli

' 
GO
/****** Object:  View [dbo].[v_kieli2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_kieli2]'))
EXEC dbo.sp_executesql @statement = N'



/*
truncate table VipunenTK_DW.dbo.d_kieli2
insert into VipunenTK_DW.dbo.d_kieli2
select * into VipunenTK_DW.dbo.d_kieli2 from [VipunenTK_lisatiedot].[dbo].[v_kieli2]
*/



CREATE VIEW [dbo].[v_kieli2] AS
SELECT 

	[id]
	,[luotu]
	,[kieli_koodi]
	,[kieli]
	,[kieli_SV]
	,[kieli_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[kieli2]
--WHERE virhetilanne = ''E''








' 
GO
/****** Object:  View [dbo].[v_koulutuksen_jarjestajan_koko]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutuksen_jarjestajan_koko]'))
EXEC dbo.sp_executesql @statement = N'


/*
truncate table VipunenTK_DW.dbo.d_koulutuksen_jarjestajan_koko
insert into VipunenTK_DW.dbo.d_koulutuksen_jarjestajan_koko
select * into VipunenTK_DW.dbo.d_koulutuksen_jarjestajan_koko from [VipunenTK_lisatiedot].[dbo].[v_koulutuksen_jarjestajan_koko]
*/



CREATE VIEW [dbo].[v_koulutuksen_jarjestajan_koko] AS
SELECT 

	[id]
	,[luotu]
	,[koko_koodi]
	,[koko]
	,[koko_SV]
	,[koko_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[koulutuksen_jarjestajan_koko]
--WHERE virhetilanne = ''E''







' 
GO
/****** Object:  View [dbo].[v_koulutuksen_jarjestamismuoto]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutuksen_jarjestamismuoto]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_koulutuksen_jarjestamismuoto] AS  
SELECT [id]
,[luotu]
,[alkaa]
,[paattyy]
,[koulutuksen_jarjestamismuoto_koodi]
,[koulutuksen_jarjestamismuoto]
,[koulutuksen_jarjestamismuoto_SV]
,[koulutuksen_jarjestamismuoto_EN]
,[jarjestys]
,[virhetilanne]
,[poistettu]
,[tietolahde]
,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[koulutuksen_jarjestamismuoto]
' 
GO
/****** Object:  View [dbo].[v_koulutuksen_kesto]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutuksen_kesto]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_koulutuksen_kesto] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	koulutuksen_kesto_koodi,
	koulutuksen_kesto,
	koulutuksen_kesto_SV,
	koulutuksen_kesto_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.koulutuksen_kesto

' 
GO
/****** Object:  View [dbo].[v_koulutuksen_kieli_versio1]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutuksen_kieli_versio1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_koulutuksen_kieli_versio1] AS  

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[koulutuksen_kieli_versio1_koodi]
      ,[koulutuksen_kieli_versio1]
      ,[koulutuksen_kieli_versio1_SV]
      ,[koulutuksen_kieli_versio1_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[koulutuksen_kieli_versio1]
' 
GO
/****** Object:  View [dbo].[v_koulutuksen_paattaneiden_toiminta]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutuksen_paattaneiden_toiminta]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_koulutuksen_paattaneiden_toiminta] AS  

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[koulutuksen_paattaneiden_toiminta_koodi]
      ,[koulutuksen_paattaneiden_toiminta]
      ,[koulutuksen_paattaneiden_toiminta_SV]
      ,[koulutuksen_paattaneiden_toiminta_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[koulutuksen_paattaneiden_toiminta]
' 
GO
/****** Object:  View [dbo].[v_koulutuksen_tavoite_toteuma]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutuksen_tavoite_toteuma]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_koulutuksen_tavoite_toteuma] AS  
SELECT [id]
,[luotu]
,[alkaa]
,[paattyy]
,[koulutuksen_tavoite_toteuma_koodi]
,[koulutuksen_tavoite_toteuma]
,[koulutuksen_tavoite_toteuma_SV]
,[koulutuksen_tavoite_toteuma_EN]
,[jarjestys]
,[virhetilanne]
,[poistettu]
,[tietolahde]
,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[koulutuksen_tavoite_toteuma]
' 
GO
/****** Object:  View [dbo].[v_koulutuksesta_kulunut_aika]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutuksesta_kulunut_aika]'))
EXEC dbo.sp_executesql @statement = N'



/*
Drop table VipunenTK_DW.dbo.d_koulutuksesta_kulunut_aika 
Select * into VipunenTK_DW.dbo.d_koulutuksesta_kulunut_aika from VipunenTK_lisatiedot.dbo.[v_koulutuksesta_kulunut_aika] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_koulutuksesta_kulunut_aika
Insert into VipunenTK_DW.dbo.d_koulutuksesta_kulunut_aika
Select * from VipunenTK_lisatiedot.dbo.[v_koulutuksesta_kulunut_aika] where virhetilanne<>''K''
*/

CREATE VIEW [dbo].[v_koulutuksesta_kulunut_aika] AS
SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[koulutuksesta_kulunut_aika_koodi]
      ,[koulutuksesta_kulunut_aika]
      ,[koulutuksesta_kulunut_aika_SV]
      ,[koulutuksesta_kulunut_aika_EN]
      ,[jarjestys]
      ,[koulutuksesta_kulunut_aika_5v]
      ,[koulutuksesta_kulunut_aika_5v_SV]
      ,[koulutuksesta_kulunut_aika_5v_EN]
      ,[jarjestys_5v]
      ,[koulutuksesta_kulunut_aika_tthv]
      ,[koulutuksesta_kulunut_aika_tthv_SV]
      ,[koulutuksesta_kulunut_aika_tthv_EN]
      ,[jarjestys_tthv]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[koulutuksesta_kulunut_aika]




' 
GO
/****** Object:  View [dbo].[v_koulutusaste_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutusaste_2002]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_koulutusaste_2002] AS
/*
--Drop table VipunenTK_DW.dbo.d_koulutusaste_2002
--Select * into VipunenTK_DW.dbo.d_koulutusaste_2002 from VipunenTK_lisatiedot.dbo.v_koulutusaste_2002 where [virhetilanne]<>''K''
Truncate table VipunenTK_DW.dbo.d_koulutusaste_2002
Insert into VipunenTK_DW.dbo.d_koulutusaste_2002
Select * from VipunenTK_lisatiedot.dbo.v_koulutusaste_2002 where [virhetilanne]<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[koulutusaste_2002koodi]
      ,[koulutusaste_2002]
      ,[koulutusaste_2002_SV]
      ,[koulutusaste_2002_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[koulutusaste_2002]
' 
GO
/****** Object:  View [dbo].[v_koulutuslaji]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutuslaji]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_koulutuslaji] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	koulutuslaji_koodi,
	koulutuslaji,
	koulutuslaji_SV,
	koulutuslaji_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.koulutuslaji
' 
GO
/****** Object:  View [dbo].[v_koulutuslaji_okm]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutuslaji_okm]'))
EXEC dbo.sp_executesql @statement = N'/****** Script for SelectTopNRows command from SSMS  ******/

CREATE VIEW [dbo].[v_koulutuslaji_okm] as

SELECT [id]
      ,[luotu]
      ,[koulutuslaji_okm_avain]
      ,[koulutuslaji_okm]
      ,[koulutuslaji_okm_SV]
      ,[koulutuslaji_okm_EN]
      ,[koulutuslaji_okm2]
      ,[koulutuslaji_okm2_SV]
      ,[koulutuslaji_okm2_EN]
      ,[jarjestys]
      ,[jarjestys2]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[koulutuslaji_okm]' 
GO
/****** Object:  View [dbo].[v_koulutuslaji2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutuslaji2]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_koulutuslaji2] AS

/*
truncate table [VipunenTK_DW].[dbo].[d_koulutuslaji2]
insert into [VipunenTK_DW].[dbo].[d_koulutuslaji2]
select * from [v_koulutuslaji2] where virhetilanne=''E''

drop table [VipunenTK_DW].[dbo].[d_koulutuslaji2]
select * into [VipunenTK_DW].[dbo].[d_koulutuslaji2] from [v_koulutuslaji2] where virhetilanne=''E''
*/

SELECT [id]
      ,[luotu]
      ,[koulutuslaji2_koodi]
      ,[koulutuslaji2]
      ,[koulutuslaji2_SV]
      ,[koulutuslaji2_EN]
      ,[jarjestys_koulutuslaji2]
      ,[jarjestamistapa]
      ,[jarjestamistapa_SV]
      ,[jarjestamistapa_EN]
      ,[jarjestys_jarjestamistapa]
      ,[jarjestamismuoto]
      ,[jarjestamismuoto_SV]
      ,[jarjestamismuoto_EN]
      ,[jarjestys_jarjestamismuoto]
      ,[tutkintotyyppi]
      ,[tutkintotyyppi_SV]
      ,[tutkintotyyppi_EN]
      ,[jarjestys_tutkintotyyppi]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [dbo].[koulutuslaji2]
' 
GO
/****** Object:  View [dbo].[v_koulutuslaji3]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutuslaji3]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_koulutuslaji3] AS

/*
truncate table [VipunenTK_DW].[dbo].[d_koulutuslaji3]
insert into [VipunenTK_DW].[dbo].[d_koulutuslaji3]
select * from [v_koulutuslaji3] where virhetilanne=''E''

drop table [VipunenTK_DW].[dbo].[d_koulutuslaji3]
select * into [VipunenTK_DW].[dbo].[d_koulutuslaji3] from [v_koulutuslaji3] where virhetilanne=''E''
*/

SELECT [id]
      ,[luotu]
      ,[koulutuslaji3_koodi]
      ,[koulutuslaji3]
      ,[koulutuslaji3_SV]
      ,[koulutuslaji3_EN]
      ,[jarjestys_koulutuslaji3]
      ,[jarjestamistapa]
      ,[jarjestamistapa_SV]
      ,[jarjestamistapa_EN]
      ,[jarjestys_jarjestamistapa]
      ,[jarjestamismuoto]
      ,[jarjestamismuoto_SV]
      ,[jarjestamismuoto_EN]
      ,[jarjestys_jarjestamismuoto]
      ,[tutkintotyyppi]
      ,[tutkintotyyppi_SV]
      ,[tutkintotyyppi_EN]
      ,[jarjestys_tutkintotyyppi]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [dbo].[koulutuslaji3]

' 
GO
/****** Object:  View [dbo].[v_koulutusluokitus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutusluokitus]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_koulutusluokitus] AS

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[koulutusluokitus_avain]
      ,[koulutus_koodi]
      ,[viimeisin_tilv]
      ,[koulutus]
      ,[koulutus_SV]
      ,[koulutus_EN]
      ,[koulutuslyhyt]
      ,[koulutuslyhyt_SV]
      ,[koulutuslyhyt_EN]
      ,[taso_koodi]
      ,[koulutusala_koodi]
      ,[koulutusala]
      ,[koulutusala_SV]
      ,[koulutusala_EN]
      ,[koulutusaste_koodi]
      ,[koulutusaste]
      ,[koulutusaste_SV]
      ,[koulutusaste_EN]
      ,[koulutusala2002_koodi]
      ,[koulutusala2002]
      ,[koulutusala2002_SV]
      ,[koulutusala2002_EN]
      ,[opintoala2002_koodi]
      ,[opintoala2002]
      ,[opintoala2002_SV]
      ,[opintoala2002_EN]
      ,[koulutusaste2002_koodi]
      ,[koulutusaste2002]
      ,[koulutusaste2002_SV]
      ,[koulutusaste2002_EN]
      ,[koulutusala1995_koodi]
      ,[koulutusala1995]
      ,[koulutusala1995_SV]
      ,[koulutusala1995_EN]
      ,[opintoala1995_koodi]
      ,[opintoala1995]
      ,[opintoala1995_SV]
      ,[opintoala1995_EN]
      ,[koulutusaste1995_koodi]
      ,[koulutusaste1995]
      ,[koulutusaste1995_SV]
      ,[koulutusaste1995_EN]
      ,[isclek_koodi]
      ,[isclek]
      ,[isclek_SV]
      ,[isclek_EN]
      ,[iscle_koodi]
      ,[iscle]
      ,[iscle_SV]
      ,[iscle_EN]
      ,[iscfik_koodi]
      ,[iscfik]
      ,[iscfik_SV]
      ,[iscfik_EN]
      ,[iscde_koodi]
      ,[iscde]
      ,[iscde_SV]
      ,[iscde_EN]
      ,[iscor_koodi]
      ,[iscor]
      ,[iscor_SV]
      ,[iscor_EN]
      ,[iscst_koodi]
      ,[iscst]
      ,[iscst_SV]
      ,[iscst_EN]
      ,[iscdu_koodi]
      ,[iscdu]
      ,[iscdu_SV]
      ,[iscdu_EN]
      ,[SCD_alkaa]
      ,[SCD_paattyy]
      ,[olo_koodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutus_koodi]
      ,[muutosvuosi]
      ,[jarjestys]
      ,[jarjestys_taso]
      ,[jarjestys_koulutusala]
      ,[jarjestys_koulutusaste]
      ,[jarjestys_koulutusala2002]
      ,[jarjestys_opintoala2002]
      ,[jarjestys_koulutusaste2002]
      ,[jarjestys_koulutusala1995]
      ,[jarjestys_opintoala1995]
      ,[jarjestys_koulutusaste1995]
      ,[jarjestys_isclek]
      ,[jarjestys_iscle]
      ,[jarjestys_iscfik]
      ,[jarjestys_iscde]
      ,[jarjestys_iscor]
      ,[jarjestys_iscst]
      ,[jarjestys_iscdu]
      ,[virhetilanne]
      ,[tietolahde]
  FROM [VipunenTK_lisatiedot].[dbo].[koulutusluokitus]
  WHERE id in (-2, -1)

' 
GO
/****** Object:  View [dbo].[v_koulutusmuoto]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutusmuoto]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_koulutusmuoto] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	koulutusmuoto_koodi,
	koulutusmuoto,
	koulutusmuoto_SV,
	koulutusmuoto_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.koulutusmuoto
' 
GO
/****** Object:  View [dbo].[v_koulutusohjelma_amk]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutusohjelma_amk]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_koulutusohjelma_amk] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	koulutusohjelma_amk_koodi,
	koulutusohjelma_amk,
	koulutusohjelma_amk_SV,
	koulutusohjelma_amk_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.koulutusohjelma_amk
' 
GO
/****** Object:  View [dbo].[v_koulutusohjelma_ammpk]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutusohjelma_ammpk]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_koulutusohjelma_ammpk] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	koulutusohjelma_ammpk_koodi,
	koulutusohjelma_ammpk,
	koulutusohjelma_ammpk_SV,
	koulutusohjelma_ammpk_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.koulutusohjelma_ammpk
' 
GO
/****** Object:  View [dbo].[v_koulutusryhma]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutusryhma]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_koulutusryhma] AS
SELECT 

	[id]
	,[luotu]
	,[koulutusryhma_koodi]
	,[koulutusryhma]
	,[koulutusryhma_SV]
	,[koulutusryhma_EN]
	,[koulutusryhma2]
	,[koulutusryhma2_SV]
	,[koulutusryhma2_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[koulutusryhma]
WHERE virhetilanne = ''E''

' 
GO
/****** Object:  View [dbo].[v_koulutussektori]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutussektori]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_koulutussektori] AS  
SELECT [id]
,[luotu]
,[alkaa]
,[paattyy]
,[koulutussektori_koodi]
,[koulutussektori]
,[koulutussektori_SV]
,[koulutussektori_EN]
,[jarjestys]
,[virhetilanne]
,[poistettu]
,[tietolahde]
,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[koulutussektori]
' 
GO
/****** Object:  View [dbo].[v_koulutustyyppi]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutustyyppi]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_koulutustyyppi] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	koulutustyyppi_koodi,
	koulutustyyppi,
	koulutustyyppi_SV,
	koulutustyyppi_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.koulutustyyppi
' 
GO
/****** Object:  View [dbo].[v_kylla_ei]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_kylla_ei]'))
EXEC dbo.sp_executesql @statement = N'

/****** Script for SelectTopNRows command from SSMS  ******/

CREATE view [dbo].[v_kylla_ei] AS
/**

INSERT INTO [VipunenTK_DW].[dbo].[d_kylla_ei]
SELECT [id]
      ,[luotu]
      ,[kylla_ei_koodi]
      ,[kylla_ei]
      ,[kylla_ei_SV]
      ,[kylla_ei_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[v_kylla_ei]
WHERE virhetilanne = ''E''

**/

SELECT [id]
      ,[luotu]
      ,[kylla_ei_koodi]
      ,[kylla_ei]
      ,[kylla_ei_SV]
      ,[kylla_ei_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[kylla_ei]

' 
GO
/****** Object:  View [dbo].[v_lahde]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_lahde]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_lahde] AS
/*
Drop table  VipunenTK_DW.dbo.d_lahde
Select * into VipunenTK_DW.dbo.d_lahde from VipunenTK_lisatiedot.dbo.[v_lahde] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_lahde
Insert into VipunenTK_DW.dbo.d_lahde
Select * from VipunenTK_lisatiedot.dbo.[v_lahde] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[lahde_koodi]
      ,[lahde]
      ,[lahde_SV]
      ,[lahde_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[lahde]
' 
GO
/****** Object:  View [dbo].[v_lukiokoulutuksen_koulutuslaji]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_lukiokoulutuksen_koulutuslaji]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_lukiokoulutuksen_koulutuslaji] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	lukiokoulutuksen_koulutuslaji_koodi,
	lukiokoulutuksen_koulutuslaji,
	lukiokoulutuksen_koulutuslaji_SV,
	lukiokoulutuksen_koulutuslaji_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.lukiokoulutuksen_koulutuslaji
' 
GO
/****** Object:  View [dbo].[v_lukion_ainevalinnat]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_lukion_ainevalinnat]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dbo].[v_lukion_ainevalinnat] AS  
/*
truncate table [VipunenTK_DW].[dbo].[d_lukion_ainevalinnat]
insert into [VipunenTK_DW].[dbo].[d_lukion_ainevalinnat]
select * from [v_lukion_ainevalinnat] where virhetilanne=''E''

drop table [VipunenTK_DW].[dbo].[d_lukion_ainevalinnat]
select * into [VipunenTK_DW].[dbo].[d_lukion_ainevalinnat] from [v_lukion_ainevalinnat] where virhetilanne=''E''

*/
SELECT [id]
      ,[luotu]
      ,[avain_aine]
      ,[avain_laajuus]
      ,[aineryhmä_jarjestys]
      ,[aineryhmä]
      ,[aineryhmä_SV]
      ,[aineryhmä_EN]
      ,[aine_jarjestys]
      ,[aine]
      ,[aine_SV]
      ,[aine_EN]
      ,[laajuus_jarjestys]
      ,[laajuus]
      ,[laajuus_SV]
      ,[laajuus_EN]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[lukion_ainevalinnat]

' 
GO
/****** Object:  View [dbo].[v_lukion_kieltenmaara]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_lukion_kieltenmaara]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_lukion_kieltenmaara] AS  
/*
truncate table [VipunenTK_DW].[dbo].[d_lukion_kieltenmaara]
insert into [VipunenTK_DW].[dbo].[d_lukion_kieltenmaara]
select * from VipunenTK_lisatiedot.dbo.[v_lukion_kieltenmaara] where virhetilanne=''E''

drop table [VipunenTK_DW].[dbo].[d_lukion_kieltenmaara]
select * into [VipunenTK_DW].[dbo].[d_lukion_kieltenmaara] from VipunenTK_lisatiedot.dbo.[v_lukion_kieltenmaara] where virhetilanne=''E''

*/
SELECT [id]
      ,[luotu]
      ,[kieltenmaara_koodi]
      ,[kieltenmaara]
      ,[kieltenmaara_SV]
      ,[kieltenmaara_EN]
      ,[kieltenmaara_jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[lukion_kieltenmaara]

' 
GO
/****** Object:  View [dbo].[v_maahantulo_ja_opiskelun_aloittaminen]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_maahantulo_ja_opiskelun_aloittaminen]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_maahantulo_ja_opiskelun_aloittaminen] AS
SELECT 

	[id]
	,[luotu]
	,[maahantulo_ja_opiskelun_aloittaminen_koodi]
	,[maahantulo_ja_opiskelun_aloittaminen]
	,[maahantulo_ja_opiskelun_aloittaminen_SV]
	,[maahantulo_ja_opiskelun_aloittaminen_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[maahantulo_ja_opiskelun_aloittaminen]
WHERE virhetilanne = ''E''

' 
GO
/****** Object:  View [dbo].[v_maassaolo]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_maassaolo]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_maassaolo] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	maassaolo_koodi,
	maassaolo,
	maassaolo_SV,
	maassaolo_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.maassaolo
' 
GO
/****** Object:  View [dbo].[v_mitenna_ammatti]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_mitenna_ammatti]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_mitenna_ammatti] AS
/*
Select * into VipunenTK_DW.dbo.d_mitenna_ammatti from VipunenTK_lisatiedot.dbo.[v_mitenna_ammatti] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_mitenna_ammatti
Insert into VipunenTK_DW.dbo.d_mitenna_ammatti
Select * from VipunenTK_lisatiedot.dbo.[v_mitenna_ammatti] where virhetilanne<>''K''
*/


SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[mitenna_ammattiryhma1_koodi]
      ,[mitenna_ammattiryhma1]
      ,[mitenna_ammattiryhma1_SV]
      ,[mitenna_ammattiryhma1_EN]
      ,[mitenna_ammattiryhma2_koodi]
      ,[mitenna_ammattiryhma2]
      ,[mitenna_ammattiryhma2_SV]
      ,[mitenna_ammattiryhma2_EN]
      ,[mitenna_ammatti_koodi]
      ,[mitenna_ammatti]
      ,[mitenna_ammatti_SV]
      ,[mitenna_ammatti_EN]
      ,[jarjestys_ammattiryhma1]
      ,[jarjestys_ammattiryhma2]
      ,[jarjestys_ammatti]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[mitenna_ammatti]
' 
GO
/****** Object:  View [dbo].[v_mitenna_toimiala]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_mitenna_toimiala]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_mitenna_toimiala] AS
/*
Select * into VipunenTK_DW.dbo.d_mitenna_toimiala from VipunenTK_lisatiedot.dbo.[v_mitenna_toimiala] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_mitenna_toimiala
Insert into VipunenTK_DW.dbo.d_mitenna_toimiala
Select * from VipunenTK_lisatiedot.dbo.[v_mitenna_toimiala] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[mitenna_toimiala1_koodi]
      ,[mitenna_toimiala1]
      ,[mitenna_toimiala1_SV]
      ,[mitenna_toimiala1_EN]
      ,[mitenna_toimiala2_koodi]
      ,[mitenna_toimiala2]
      ,[mitenna_toimiala2_SV]
      ,[mitenna_toimiala2_EN]
      ,[tol_koodi]
      ,[tol]
      ,[tol_SV]
      ,[tol_EN]
      ,[jarjestys_mitenna_toimiala1]
      ,[jarjestys_mitenna_toimiala2]
      ,[jarjestys_tol]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[mitenna_toimiala]
' 
GO
/****** Object:  View [dbo].[v_moninkertainen_haku]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_moninkertainen_haku]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_moninkertainen_haku] AS  

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[moninkertainen_haku_koodi]
      ,[moninkertainen_haku]
      ,[moninkertainen_haku_SV]
      ,[moninkertainen_haku_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[moninkertainen_haku]
' 
GO
/****** Object:  View [dbo].[v_nuorten_aikuisten_koulutus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_nuorten_aikuisten_koulutus]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_nuorten_aikuisten_koulutus] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	nuorten_aikuisten_koulutus_koodi,
	nuorten_aikuisten_koulutus,
	nuorten_aikuisten_koulutus_SV,
	nuorten_aikuisten_koulutus_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.nuorten_aikuisten_koulutus
' 
GO
/****** Object:  View [dbo].[v_nuorten_aikuisten_koulutus_amm]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_nuorten_aikuisten_koulutus_amm]'))
EXEC dbo.sp_executesql @statement = N'
/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[v_nuorten_aikuisten_koulutus_amm] as 
select [id]
      ,[luotu]
      ,[nuorten_aikuisten_koulutus_amm_koodi]
      ,[nuorten_aikuisten_koulutus_amm]
      ,[nuorten_aikuisten_koulutus_amm_SV]
      ,[nuorten_aikuisten_koulutus_amm_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[nuorten_aikuisten_koulutus_amm]' 
GO
/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[v_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] AS
SELECT 

	[id]
	,[luotu]
	,[tehtavatyyppi_koodi]
	,[tehtavatyyppi]
	,[tehtavatyyppi_SV]
	,[tehtavatyyppi_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]
--WHERE virhetilanne = ''E''




' 
GO
/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_lukiokoulutuksessa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajan_tehtavatyyppi_lukiokoulutuksessa]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_opettajan_tehtavatyyppi_lukiokoulutuksessa] AS
SELECT 

	[id]
	,[luotu]
	,[tehtavatyyppi_koodi]
	,[tehtavatyyppi]
	,[tehtavatyyppi_SV]
	,[tehtavatyyppi_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa]
--WHERE virhetilanne = ''E''



' 
GO
/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_perusopetuksessa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajan_tehtavatyyppi_perusopetuksessa]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_opettajan_tehtavatyyppi_perusopetuksessa] AS
SELECT 

	[id]
	,[luotu]
	,[tehtavatyyppi_koodi]
	,[tehtavatyyppi]
	,[tehtavatyyppi_SV]
	,[tehtavatyyppi_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajan_tehtavatyyppi_perusopetuksessa]
WHERE virhetilanne = ''E''


' 
GO
/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_vapaassa_sivistystyossa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajan_tehtavatyyppi_vapaassa_sivistystyossa]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[v_opettajan_tehtavatyyppi_vapaassa_sivistystyossa] AS
SELECT 

	[id]
	,[luotu]
	,[tehtavatyyppi_koodi]
	,[tehtavatyyppi]
	,[tehtavatyyppi_SV]
	,[tehtavatyyppi_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa]
--WHERE virhetilanne = ''E''





' 
GO
/****** Object:  View [dbo].[v_opettajankelpoisuus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajankelpoisuus]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_opettajankelpoisuus] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	opettajankelpoisuus_koodi,
	opettajankelpoisuus,
	opettajankelpoisuus_SV,
	opettajankelpoisuus_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.opettajankelpoisuus
' 
GO
/****** Object:  View [dbo].[v_opettajankelpoisuus2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajankelpoisuus2]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_opettajankelpoisuus2] AS
SELECT
	id,
	luotu,
	opettajankelpoisuus_koodi,
	opettajankelpoisuus,
	opettajankelpoisuus_SV,
	opettajankelpoisuus_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.opettajankelpoisuus2

' 
GO
/****** Object:  View [dbo].[v_opettajat_aine]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajat_aine]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dbo].[v_opettajat_aine] AS
SELECT 

	[id]
	,[luotu]
	,[aine_koodi]
	,[aine]
	,[aine_SV]
	,[aine_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_aine]
--WHERE virhetilanne = ''E''






' 
GO
/****** Object:  View [dbo].[v_opettajat_aine_2016]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajat_aine_2016]'))
EXEC dbo.sp_executesql @statement = N'






CREATE VIEW [dbo].[v_opettajat_aine_2016] AS
SELECT 

	[id]
	,[luotu]
	,[aine_koodi]
	,[aine]
	,[aine_SV]
	,[aine_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_aine_2016]
--WHERE virhetilanne = ''E''







' 
GO
/****** Object:  View [dbo].[v_opettajat_aine_2016_lukio]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajat_aine_2016_lukio]'))
EXEC dbo.sp_executesql @statement = N'






CREATE VIEW [dbo].[v_opettajat_aine_2016_lukio] AS
SELECT 

	[id]
	,[luotu]
	,[aine_koodi]
	,[aine]
	,[aine_SV]
	,[aine_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_aine_2016_lukio]
--WHERE virhetilanne = ''E''







' 
GO
/****** Object:  View [dbo].[v_opettajat_aine_amm]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajat_aine_amm]'))
EXEC dbo.sp_executesql @statement = N'






CREATE VIEW [dbo].[v_opettajat_aine_amm] AS
SELECT 

	[id]
	,[luotu]
	,[aine_koodi]
	,[aine]
	,[aine_SV]
	,[aine_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_aine_amm]
--WHERE virhetilanne = ''E''







' 
GO
/****** Object:  View [dbo].[v_opettajat_aine_vst]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajat_aine_vst]'))
EXEC dbo.sp_executesql @statement = N'







CREATE VIEW [dbo].[v_opettajat_aine_vst] AS
SELECT 

	[id]
	,[luotu]
	,[aine_koodi]
	,[aine]
	,[aine_SV]
	,[aine_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_aine_vst]
--WHERE virhetilanne = ''E''








' 
GO
/****** Object:  View [dbo].[v_opettajat_koko_osa_aikainen]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajat_koko_osa_aikainen]'))
EXEC dbo.sp_executesql @statement = N'



--select * into vipunentk_dw.dbo.d_opettajat_koko_osa_aikainen from [dbo].[v_opettajat_koko_osa_aikainen]




CREATE VIEW [dbo].[v_opettajat_koko_osa_aikainen] AS
SELECT 

	[id]
	,[luotu]
	,[koko_osa_aikainen_koodi]
	,[koko_osa_aikainen]
	,[koko_osa_aikainen_SV]
	,[koko_osa_aikainen_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_koko_osa_aikainen]
--WHERE virhetilanne = ''E''








' 
GO
/****** Object:  View [dbo].[v_opettajat_koulutusaste]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajat_koulutusaste]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[v_opettajat_koulutusaste] AS
SELECT 

	[id]
	,[luotu]
	,[koulutusaste_koodi]
	,[koulutusaste]
	,[koulutusaste_SV]
	,[koulutusaste_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_koulutusaste]
--WHERE virhetilanne = ''E''




' 
GO
/****** Object:  View [dbo].[v_opettajat_koulutusaste_amm]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajat_koulutusaste_amm]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[v_opettajat_koulutusaste_amm] AS
SELECT 

	[id]
	,[luotu]
	,[koulutusaste_koodi]
	,[koulutusaste]
	,[koulutusaste_SV]
	,[koulutusaste_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_koulutusaste_amm]
--WHERE virhetilanne = ''E''





' 
GO
/****** Object:  View [dbo].[v_opettajat_luokka_aste]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajat_luokka_aste]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[v_opettajat_luokka_aste] AS
SELECT 

	[id]
	,[luotu]
	,[luokka_aste_koodi]
	,[luokka_aste]
	,[luokka_aste_SV]
	,[luokka_aste_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_luokka_aste]
--WHERE virhetilanne = ''E''





' 
GO
/****** Object:  View [dbo].[v_opettajat_osa_aikaisuuden_syy]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajat_osa_aikaisuuden_syy]'))
EXEC dbo.sp_executesql @statement = N'




--select * into vipunentk_dw.dbo.d_opettajat_osa_aikaisuuden_syy from [dbo].[v_opettajat_osa_aikaisuuden_syy]




CREATE VIEW [dbo].[v_opettajat_osa_aikaisuuden_syy] AS
SELECT 

	[id]
	,[luotu]
	,[syy_koodi]
	,[syy]
	,[syy_SV]
	,[syy_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_osa_aikaisuuden_syy]
--WHERE virhetilanne = ''E''









' 
GO
/****** Object:  View [dbo].[v_opettajat_tyosuhteen_luonne]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opettajat_tyosuhteen_luonne]'))
EXEC dbo.sp_executesql @statement = N'


--select * into vipunentk_dw.dbo.d_opettajat_tyosuhteen_luonne from [dbo].[v_opettajat_tyosuhteen_luonne]




CREATE VIEW [dbo].[v_opettajat_tyosuhteen_luonne] AS
SELECT 

	[id]
	,[luotu]
	,[tyosuhteen_luonne_koodi]
	,[tyosuhteen_luonne]
	,[tyosuhteen_luonne_SV]
	,[tyosuhteen_luonne_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_tyosuhteen_luonne]
--WHERE virhetilanne = ''E''







' 
GO
/****** Object:  View [dbo].[v_opetuksen_jarjestajan_tiedoantajatyyppi]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opetuksen_jarjestajan_tiedoantajatyyppi]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_opetuksen_jarjestajan_tiedoantajatyyppi]
AS
SELECT        
	id, 
	luotu, 
	alkaa, 
	paattyy, 
	tiedonantajatyyppi_koodi, 
	tiedonantajatyyppi, 
	tiedonantajatyyppi_SV, 
	tiedonantajatyyppi_EN, 
	jarjestys, 
	virhetilanne, 
	poistettu, 
	tietolahde, 
	kommentti
FROM            dbo.opetuksen_jarjestajan_tiedoantajatyyppi

' 
GO
/****** Object:  View [dbo].[v_opetushallinnon_koulutus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opetushallinnon_koulutus]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_opetushallinnon_koulutus] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	opetushallinnon_koulutus_koodi,
	opetushallinnon_koulutus,
	opetushallinnon_koulutus_SV,
	opetushallinnon_koulutus_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.opetushallinnon_koulutus

' 
GO
/****** Object:  View [dbo].[v_opetushallinnon_koulutusala]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opetushallinnon_koulutusala]'))
EXEC dbo.sp_executesql @statement = N'


/****** Script for SelectTopNRows command from SSMS  ******/

CREATE view [dbo].[v_opetushallinnon_koulutusala] AS

SELECT [id]
      ,[luotu]
      ,[koulutusala_koodi]
      ,[koulutusala]
      ,[koulutusala_SV]
      ,[koulutusala_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolähde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opetushallinnon_koulutusala]


' 
GO
/****** Object:  View [dbo].[v_opetuskieli]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opetuskieli]'))
EXEC dbo.sp_executesql @statement = N'
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE VIEW [dbo].[v_opetuskieli] AS

/***

INSERT INTO [VipunenTK_DW].[dbo].[d_opetuskieli]
SELECT *
FROM [VipunenTK_lisatiedot].[dbo].[v_opetuskieli]
WHERE virhetilanne = ''E''
**/

SELECT [id]
      ,[luotu]
      ,[opetuskieli_koodi]
      ,[opetuskieli]
      ,[opetuskieli_SV]
      ,[opetuskieli_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opetuskieli]
' 
GO
/****** Object:  View [dbo].[v_opetuskieli2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opetuskieli2]'))
EXEC dbo.sp_executesql @statement = N'

/*
truncate table VipunenTK_DW.dbo.d_opetuskieli2
insert into VipunenTK_DW.dbo.d_opetuskieli2
select * from [VipunenTK_lisatiedot].[dbo].[v_opetuskieli2]
*/



CREATE VIEW [dbo].[v_opetuskieli2] AS
SELECT 

	[id]
	,[luotu]
	,[opetuskieli_koodi]
	,[opetuskieli]
	,[opetuskieli_SV]
	,[opetuskieli_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opetuskieli2]
--WHERE virhetilanne = ''E''






' 
GO
/****** Object:  View [dbo].[v_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi,
	opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus,
	opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_SV,
	opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
' 
GO
/****** Object:  View [dbo].[v_opetustuntien_sisalto_ja_tavoiteluokitus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opetustuntien_sisalto_ja_tavoiteluokitus]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_opetustuntien_sisalto_ja_tavoiteluokitus] AS
/*
--Drop table VipunenTK_DW.dbo.d_opetustuntien_sisalto_ja_tavoiteluokitus
--Select * into VipunenTK_DW.dbo.d_opetustuntien_sisalto_ja_tavoiteluokitus from VipunenTK_lisatiedot.dbo.v_opetustuntien_sisalto_ja_tavoiteluokitus where [virhetilanne]<>''K''
Truncate table VipunenTK_DW.dbo.d_opetustuntien_sisalto_ja_tavoiteluokitus
Insert into VipunenTK_DW.dbo.d_opetustuntien_sisalto_ja_tavoiteluokitus
Select * from VipunenTK_lisatiedot.dbo.v_opetustuntien_sisalto_ja_tavoiteluokitus where [virhetilanne]<>''K''
*/
SELECT [id]
      --,[luotu]
      ,[Opetustuntikoodi]
      ,[Koulutusala_lajittelu]
      ,[Koulutusala]
      ,[Koulutusala_SV]
      ,[Koulutusala_EN]
      ,[Opintoala_lajittelu]
      ,[Opintoala]
      ,[Opintoala_SV]
      ,[Opintoala_EN]
      ,[Koulutustyyppi_lajittelu]
      ,[Koulutustyyppi]
      ,[Koulutustyyppi_SV]
      ,[Koulutustyyppi_EN]
      ,[Opetustunti_lajittelu]
      ,[Opetustunti]
      ,[Opetustunti_SV]
      ,[Opetustunti_EN]
      --,[KuutioonKE] --Rajaus on jo tehty where-ehdossa
      --,[Mittari] --Hyödynnetään faktan mappauksessa, ei dimensiossa
      ,[virhetilanne]
      --,[tietolahde]
      --,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opetustuntien_sisalto_ja_tavoiteluokitus]
  WHERE KuutioonKE = ''K''
' 
GO
/****** Object:  View [dbo].[v_opintoala2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opintoala2002]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_opintoala2002] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	opintoala2002_koodi,
	opintoala2002,
	opintoala2002_SV,
	opintoala2002_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.opintoala2002
' 
GO
/****** Object:  View [dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_koodi]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_SV]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_EN]
      ,[jarjestys_4a]
      ,[jarjestys_4b]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan]

' 
GO
/****** Object:  View [dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN]
      ,[jarjestys_4bb]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]


' 
GO
/****** Object:  View [dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_koulutusalan_2002_mukaan_koodi]
      ,[opintojen_kulku_koulutusalan_2002_mukaan]
      ,[opintojen_kulku_koulutusalan_2002_mukaan_SV]
      ,[opintojen_kulku_koulutusalan_2002_mukaan_EN]
      ,[jarjestys_2a]
      ,[jarjestys_2b]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opintojen_kulku_koulutusalan_2002_mukaan]


' 
GO
/****** Object:  View [dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan_versio2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan_versio2]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan_versio2] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_koulutusalan_2002_mukaan_versio2_koodi]
      ,[opintojen_kulku_koulutusalan_2002_mukaan_versio2]
      ,[opintojen_kulku_koulutusalan_2002_mukaan_versio2_SV]
	  ,[opintojen_kulku_koulutusalan_2002_mukaan_versio2_EN]
      ,[jarjestys_2bb]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opintojen_kulku_koulutusalan_2002_mukaan_versio2]




' 
GO
/****** Object:  View [dbo].[v_opintojen_kulku_koulutusasteen_2002_mukaan]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opintojen_kulku_koulutusasteen_2002_mukaan]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_opintojen_kulku_koulutusasteen_2002_mukaan] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_koulutusasteen_2002_mukaan_koodi]
      ,[opintojen_kulku_koulutusasteen_2002_mukaan]
      ,[opintojen_kulku_koulutusasteen_2002_mukaan_SV]
      ,[opintojen_kulku_koulutusasteen_2002_mukaan_EN]
      ,[jarjestys_1a]
      ,[jarjestys_1b]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opintojen_kulku_koulutusasteen_2002_mukaan]

' 
GO
/****** Object:  View [dbo].[v_opintojen_kulku_koulutussektorin_mukaan]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opintojen_kulku_koulutussektorin_mukaan]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_opintojen_kulku_koulutussektorin_mukaan] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_koulutussektorin_mukaan_koodi]
      ,[opintojen_kulku_koulutussektorin_mukaan]
      ,[opintojen_kulku_koulutussektorin_mukaan_SV]
      ,[opintojen_kulku_koulutussektorin_mukaan_EN]
      ,[jarjestys_7a]
      ,[jarjestys_7b]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opintojen_kulku_koulutussektorin_mukaan]



' 
GO
/****** Object:  View [dbo].[v_opintojen_kulku_maakunnan_mukaan]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opintojen_kulku_maakunnan_mukaan]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_opintojen_kulku_maakunnan_mukaan] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_maakunnan_mukaan_koodi]
      ,[opintojen_kulku_maakunnan_mukaan]
      ,[opintojen_kulku_maakunnan_mukaan_SV]
      ,[opintojen_kulku_maakunnan_mukaan_EN]
      ,[jarjestys_6a]
      ,[jarjestys_6b]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opintojen_kulku_maakunnan_mukaan]

' 
GO
/****** Object:  View [dbo].[v_opintojen_kulku_opintoalan_2002_mukaan]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opintojen_kulku_opintoalan_2002_mukaan]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_opintojen_kulku_opintoalan_2002_mukaan] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_opintoala_2002_mukaan_koodi]
      ,[opintojen_kulku_opintoala_2002_mukaan]
      ,[opintojen_kulku_opintoala_2002_mukaan_SV]
      ,[opintojen_kulku_opintoala_2002_mukaan_EN]
      ,[jarjestys_3a]
      ,[jarjestys_3b]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opintojen_kulku_opintoalan_2002_mukaan]

' 
GO
/****** Object:  View [dbo].[v_opintojen_kulku_opintoalan_2002_mukaan_versio2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opintojen_kulku_opintoalan_2002_mukaan_versio2]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_opintojen_kulku_opintoalan_2002_mukaan_versio2] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_opintoala_2002_mukaan_versio2_koodi]
      ,[opintojen_kulku_opintoala_2002_mukaan_versio2]
      ,[opintojen_kulku_opintoala_2002_mukaan_versio2_SV]
      ,[opintojen_kulku_opintoala_2002_mukaan_versio2_EN]
      ,[jarjestys_3bb]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opintojen_kulku_opintoalan_2002_mukaan_versio2]


' 
GO
/****** Object:  View [dbo].[v_opintojen_kulku_oppilaitoksen_mukaan]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opintojen_kulku_oppilaitoksen_mukaan]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_opintojen_kulku_oppilaitoksen_mukaan] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_oppilaitoksen_mukaan_koodi]
      ,[opintojen_kulku_oppilaitoksen_mukaan]
      ,[opintojen_kulku_oppilaitoksen_mukaan_SV]
      ,[opintojen_kulku_oppilaitoksen_mukaan_EN]
      ,[jarjestys_5a]
      ,[jarjestys_5b]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opintojen_kulku_oppilaitoksen_mukaan]

' 
GO
/****** Object:  View [dbo].[v_opintojen_kulku_oppilaitoksen_mukaan_versio2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opintojen_kulku_oppilaitoksen_mukaan_versio2]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_opintojen_kulku_oppilaitoksen_mukaan_versio2] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_oppilaitoksen_mukaan_versio2_koodi]
      ,[opintojen_kulku_oppilaitoksen_mukaan_versio2]
      ,[opintojen_kulku_oppilaitoksen_mukaan_versio2_SV]
      ,[opintojen_kulku_oppilaitoksen_mukaan_versio2_EN]
      ,[jarjestys_5bb]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opintojen_kulku_oppilaitoksen_mukaan_versio2]


' 
GO
/****** Object:  View [dbo].[v_opiskelijan_aikaisempi_yleissivistava_koulutus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opiskelijan_aikaisempi_yleissivistava_koulutus]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_opiskelijan_aikaisempi_yleissivistava_koulutus] AS
/*
Drop table VipunenTK_DW.dbo.d_opiskelijan_olo
Select * into VipunenTK_DW.dbo.d_opiskelijan_olo from VipunenTK_lisatiedot.dbo.[v_opiskelijan_olo] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_opiskelijan_olo
Insert into VipunenTK_DW.dbo.d_opiskelijan_olo
Select * from VipunenTK_lisatiedot.dbo.[v_opiskelijan_olo] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opiskelijan_aikaisempi_yleissivistava_koulutus_koodi] 
      ,[opiskelijan_aikaisempi_yleissivistava_koulutus]
      ,[opiskelijan_aikaisempi_yleissivistava_koulutus_SV]
      ,[opiskelijan_aikaisempi_yleissivistava_koulutus_EN] 
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opiskelijan_aikaisempi_yleissivistava_koulutus]

' 
GO
/****** Object:  View [dbo].[v_opiskelijan_fte_tieto]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opiskelijan_fte_tieto]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_opiskelijan_fte_tieto] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	opiskelijan_fte_tieto_koodi,
	opiskelijan_fte_tieto,
	opiskelijan_fte_tieto_SV,
	opiskelijan_fte_tieto_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.opiskelijan_fte_tieto
' 
GO
/****** Object:  View [dbo].[v_opiskelijan_olo]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opiskelijan_olo]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_opiskelijan_olo] AS
/*
Drop table VipunenTK_DW.dbo.d_opiskelijan_olo
Select * into VipunenTK_DW.dbo.d_opiskelijan_olo from VipunenTK_lisatiedot.dbo.[v_opiskelijan_olo] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_opiskelijan_olo
Insert into VipunenTK_DW.dbo.d_opiskelijan_olo
Select * from VipunenTK_lisatiedot.dbo.[v_opiskelijan_olo] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opiskelijan_olo_koodi]
      ,[opiskelijan_olo]
      ,[opiskelijan_olo_SV]
      ,[opiskelijan_olo_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opiskelijan_olo]
' 
GO
/****** Object:  View [dbo].[v_opiskelijan_olo_tamm]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opiskelijan_olo_tamm]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_opiskelijan_olo_tamm] AS
/*
Drop table VipunenTK_DW.dbo.d_opiskelijan_olo
Select * into VipunenTK_DW.dbo.d_opiskelijan_olo from VipunenTK_lisatiedot.dbo.[v_opiskelijan_olo] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_opiskelijan_olo
Insert into VipunenTK_DW.dbo.d_opiskelijan_olo
Select * from VipunenTK_lisatiedot.dbo.[v_opiskelijan_olo] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opiskelijan_olo_tamm_koodi]
      ,[opiskelijan_olo_tamm]
      ,[opiskelijan_olo_tamm_SV]
      ,[opiskelijan_olo_tamm_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opiskelijan_olo_tamm]

' 
GO
/****** Object:  View [dbo].[v_opiskelu_toiminta]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opiskelu_toiminta]'))
EXEC dbo.sp_executesql @statement = N'

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[v_opiskelu_toiminta] as

/*
truncate table [VipunenTK_DW].[dbo].[d_opiskelu_toiminta]
insert into [VipunenTK_DW].[dbo].[d_opiskelu_toiminta]
select * from [v_opiskelu_toiminta] where virhetilanne=''E''

drop table [VipunenTK_DW].[dbo].[d_opiskelu_toiminta]
select * into [VipunenTK_DW].[dbo].[d_opiskelu_toiminta] from [v_opiskelu_toiminta] where virhetilanne=''E''
*/

SELECT [id]
      ,[luotu]
      ,[opiskelu_toiminta_koodi]
      ,[opiskelu_toiminta]
      ,[opiskelu_toiminta_SV]
      ,[opiskelu_toiminta_EN]
      ,[jarjestys_opiskelu_toiminta]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[opiskelu_toiminta]


' 
GO
/****** Object:  View [dbo].[v_opiskelumuoto]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_opiskelumuoto]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_opiskelumuoto] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	opiskelumuoto_koodi,
	opiskelumuoto,
	opiskelumuoto_SV,
	opiskelumuoto_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.opiskelumuoto
' 
GO
/****** Object:  View [dbo].[v_oppilaitostyyppi]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_oppilaitostyyppi]'))
EXEC dbo.sp_executesql @statement = N'


/*
truncate table VipunenTK_DW.dbo.d_oppilaitostyyppi
insert into VipunenTK_DW.dbo.d_oppilaitostyyppi
select * from [VipunenTK_lisatiedot].[dbo].[v_oppilaitostyyppi]
*/



CREATE VIEW [dbo].[v_oppilaitostyyppi] AS
SELECT 

	[id]
	,[luotu]
	,[oppilaitostyyppi_koodi]
	,[oppilaitostyyppi]
	,[oppilaitostyyppi_SV]
	,[oppilaitostyyppi_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[oppilaitostyyppi]
--WHERE virhetilanne = ''E''







' 
GO
/****** Object:  View [dbo].[v_oppisopimus_purkautunut]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_oppisopimus_purkautunut]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_oppisopimus_purkautunut] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	oppisopimus_purkautunut_koodi,
	oppisopimus_purkautunut,
	oppisopimus_purkautunut_SV,
	oppisopimus_purkautunut_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.oppisopimus_purkautunut
' 
GO
/****** Object:  View [dbo].[v_oppisopimus_yrityksen_koko]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_oppisopimus_yrityksen_koko]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_oppisopimus_yrityksen_koko] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	oppisopimus_yrityksen_koko_koodi,
	oppisopimus_yrityksen_koko,
	oppisopimus_yrityksen_koko_SV,
	oppisopimus_yrityksen_koko_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.oppisopimus_yrityksen_koko
' 
GO
/****** Object:  View [dbo].[v_oppisopimuskoulutus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_oppisopimuskoulutus]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_oppisopimuskoulutus] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	oppisopimuskoulutus_koodi,
	oppisopimuskoulutus,
	oppisopimuskoulutus_SV,
	oppisopimuskoulutus_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.oppisopimuskoulutus
' 
GO
/****** Object:  View [dbo].[v_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	oppis_osallis_ja_tutk_suor_koodi,
	oppis_osallis_ja_tutk_suor,
	oppis_osallis_ja_tutk_suor_SV,
	oppis_osallis_ja_tutk_suor_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM [VipunenTK_lisatiedot].[dbo].[oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet]

' 
GO
/****** Object:  View [dbo].[v_osatutkinto]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_osatutkinto]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_osatutkinto] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	osatutkinto_koodi,
	osatutkinto,
	osatutkinto_SV,
	osatutkinto_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.osatutkinto
' 
GO
/****** Object:  View [dbo].[v_paaasiallinen_toiminta]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_paaasiallinen_toiminta]'))
EXEC dbo.sp_executesql @statement = N'/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[v_paaasiallinen_toiminta] as

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[paaasiallinen_toiminta_koodi]
      ,[paaasiallinen_toiminta]
      ,[paaasiallinen_toiminta_SV]
      ,[paaasiallinen_toiminta_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[paaasiallinen_toiminta]
' 
GO
/****** Object:  View [dbo].[v_paaasiallinen_toiminta_ja_maasta_muuttaneet]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_paaasiallinen_toiminta_ja_maasta_muuttaneet]'))
EXEC dbo.sp_executesql @statement = N'

 
CREATE VIEW [dbo].[v_paaasiallinen_toiminta_ja_maasta_muuttaneet] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	paaasiallinen_toiminta_ja_maasta_muuttaneet_koodi,
	paaasiallinen_toiminta_ja_maasta_muuttaneet,
	paaasiallinen_toiminta_ja_maasta_muuttaneet_SV,
	paaasiallinen_toiminta_ja_maasta_muuttaneet_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.paaasiallinen_toiminta_ja_maasta_muuttaneet


' 
GO
/****** Object:  View [dbo].[v_paaasiallinen_toiminta_okm]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_paaasiallinen_toiminta_okm]'))
EXEC dbo.sp_executesql @statement = N'
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[v_paaasiallinen_toiminta_okm] as

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[paaasiallinen_toiminta_okm_koodi]
      ,[paaasiallinen_toiminta_okm]
      ,[paaasiallinen_toiminta_okm_SV]
      ,[paaasiallinen_toiminta_okm_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[paaasiallinen_toiminta_okm]

' 
GO
/****** Object:  View [dbo].[v_paaasiallinen_toiminta_versio2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_paaasiallinen_toiminta_versio2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_paaasiallinen_toiminta_versio2] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	paaasiallinen_toiminta_versio2_koodi,
	paaasiallinen_toiminta_versio2,
	paaasiallinen_toiminta_versio2_SV,
	paaasiallinen_toiminta_versio2_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.paaasiallinen_toiminta_versio2
' 
GO
/****** Object:  View [dbo].[v_paaasiallinen_toiminta_versio3]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_paaasiallinen_toiminta_versio3]'))
EXEC dbo.sp_executesql @statement = N'

/*
Drop table VipunenTK_DW.dbo.d_paaasiallinen_toiminta_versio3 
Select * into VipunenTK_DW.dbo.d_paaasiallinen_toiminta_versio3 from VipunenTK_lisatiedot.dbo.[v_paaasiallinen_toiminta_versio3] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_paaasiallinen_toiminta_versio3
Insert into VipunenTK_DW.dbo.d_paaasiallinen_toiminta_versio3
Select * from VipunenTK_lisatiedot.dbo.[v_paaasiallinen_toiminta_versio3] where virhetilanne<>''K''
*/

CREATE view [dbo].[v_paaasiallinen_toiminta_versio3] as
SELECT [id]
      ,[luotu]
      ,[paaasiallinen_toiminta_versio3_avain]
      ,[paaasiallinen_toiminta_versio3]
      ,[paaasiallinen_toiminta_versio3_SV]
      ,[paaasiallinen_toiminta_versio3_EN]
      ,[jarjestys_paaasiallinen_toiminta_versio3]
      ,[paaasiallinen_toiminta_versio3_TTHV]
      ,[paaasiallinen_toiminta_versio3_TTHV_SV]
      ,[paaasiallinen_toiminta_versio3_TTHV_EN]
      ,[jarjestys_paaasiallinen_toiminta_versio3_TTHV]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[paaasiallinen_toiminta_versio3]

' 
GO
/****** Object:  View [dbo].[v_perusjoukko]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusjoukko]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_perusjoukko] AS

SELECT [id]
      ,[luotu]
      ,[perusjoukko_avain]
      ,[perusjoukko]
      ,[perusjoukko_SV]
      ,[perusjoukko_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusjoukko]


' 
GO
/****** Object:  View [dbo].[v_perusjoukko_tyolliset]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusjoukko_tyolliset]'))
EXEC dbo.sp_executesql @statement = N'/****** Script for SelectTopNRows command from SSMS  ******/

create  view [dbo].[v_perusjoukko_tyolliset] AS
SELECT [id]
      ,[luotu]
      ,[perusjoukko_tyolliset_avain]
      ,[perusjoukko_tyolliset]
      ,[perusjoukko_tyolliset_SV]
      ,[perusjoukko_tyolliset_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusjoukko_tyolliset]
  WHERE virhetilanne = ''E''
' 
GO
/****** Object:  View [dbo].[v_perusopetuksen_ainevalinnat]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusopetuksen_ainevalinnat]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_perusopetuksen_ainevalinnat] AS  
/*
truncate table [VipunenTK_DW].[dbo].[d_perusopetuksen_ainevalinnat]
insert into [VipunenTK_DW].[dbo].[d_perusopetuksen_ainevalinnat]
select * from [v_perusopetuksen_ainevalinnat] where virhetilanne=''E''

drop table [VipunenTK_DW].[dbo].[d_perusopetuksen_ainevalinnat]
select * into [VipunenTK_DW].[dbo].[d_perusopetuksen_ainevalinnat] from [v_perusopetuksen_ainevalinnat] where virhetilanne=''E''

*/
SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[aineryhmä]
      ,[aineryhmä_SV]
      ,[aineryhmä_EN]
      ,[aine_koodi]
      ,[aine]
      ,[aine_SV]
      ,[aine_EN]
      ,[kielen_taso_koodi]
      ,[kielen_taso]
      ,[kielen_taso_SV]
      ,[kielen_taso_EN]
      ,[ainevalinta]
      ,[ainevalinta_SV]
      ,[ainevalinta_EN]
      ,[aineryhmä_jarjestys]
      ,[aine_jarjestys]
      ,[kielen_taso_jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusopetuksen_ainevalinnat]
' 
GO
/****** Object:  View [dbo].[v_perusopetuksen_aloitusika]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusopetuksen_aloitusika]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_perusopetuksen_aloitusika] AS
/*
Drop table  VipunenTK_DW.dbo.d_perusopetuksen_aloitusika
Select * into VipunenTK_DW.dbo.d_perusopetuksen_aloitusika from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_aloitusika] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_perusopetuksen_aloitusika
Insert into VipunenTK_DW.dbo.d_perusopetuksen_aloitusika
Select * from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_aloitusika] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[perusopetuksen_aloitusika_koodi]
      ,[perusopetuksen_aloitusika]
      ,[perusopetuksen_aloitusika_SV]
      ,[perusopetuksen_aloitusika_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusopetuksen_aloitusika]


' 
GO
/****** Object:  View [dbo].[v_perusopetuksen_erityisen_tuen_paatos]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusopetuksen_erityisen_tuen_paatos]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_perusopetuksen_erityisen_tuen_paatos] AS
/*
Drop table  VipunenTK_DW.dbo.d_perusopetuksen_erityisen_tuen_paatos
Select * into VipunenTK_DW.dbo.d_perusopetuksen_erityisen_tuen_paatos from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_erityisen_tuen_paatos] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_perusopetuksen_erityisen_tuen_paatos
Insert into VipunenTK_DW.dbo.d_perusopetuksen_erityisen_tuen_paatos
Select * from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_erityisen_tuen_paatos] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[perusopetuksen_erityisen_tuen_paatos_koodi]
      ,[perusopetuksen_erityisen_tuen_paatos]
      ,[perusopetuksen_erityisen_tuen_paatos_SV]
      ,[perusopetuksen_erityisen_tuen_paatos_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusopetuksen_erityisen_tuen_paatos]


' 
GO
/****** Object:  View [dbo].[v_perusopetuksen_kieltenmaara]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusopetuksen_kieltenmaara]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_perusopetuksen_kieltenmaara] AS  

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[kieltenmäärä_koodi]
      ,[kieltenmäärä]
      ,[kieltenmäärä_SV]
      ,[kieltenmäärä_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusopetuksen_kieltenmaara]
' 
GO
/****** Object:  View [dbo].[v_perusopetuksen_kuljetusetuus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusopetuksen_kuljetusetuus]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_perusopetuksen_kuljetusetuus] AS
/*
Drop table  VipunenTK_DW.dbo.d_perusopetuksen_kuljetusetuus
Select * into VipunenTK_DW.dbo.d_perusopetuksen_kuljetusetuus from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_kuljetusetuus] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_perusopetuksen_kuljetusetuus
Insert into VipunenTK_DW.dbo.d_perusopetuksen_kuljetusetuus
Select * from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_kuljetusetuus] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[perusopetuksen_kuljetusetuus_koodi]
      ,[perusopetuksen_kuljetusetuus]
      ,[perusopetuksen_kuljetusetuus_SV]
      ,[perusopetuksen_kuljetusetuus_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusopetuksen_kuljetusetuus]


' 
GO
/****** Object:  View [dbo].[v_perusopetuksen_majoitusetuus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusopetuksen_majoitusetuus]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_perusopetuksen_majoitusetuus] AS
/*
Drop table  VipunenTK_DW.dbo.d_perusopetuksen_majoitusetuus
Select * into VipunenTK_DW.dbo.d_perusopetuksen_majoitusetuus from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_majoitusetuus] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_perusopetuksen_majoitusetuus
Insert into VipunenTK_DW.dbo.d_perusopetuksen_majoitusetuus
Select * from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_majoitusetuus] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[perusopetuksen_majoitusetuus_koodi]
      ,[perusopetuksen_majoitusetuus]
      ,[perusopetuksen_majoitusetuus_SV]
      ,[perusopetuksen_majoitusetuus_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusopetuksen_majoitusetuus]


' 
GO
/****** Object:  View [dbo].[v_perusopetuksen_oppimaaran_yksilollistaminen]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusopetuksen_oppimaaran_yksilollistaminen]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_perusopetuksen_oppimaaran_yksilollistaminen] AS
/*
Drop table  VipunenTK_DW.dbo.d_perusopetuksen_oppimaaran_yksilollistaminen
Select * into VipunenTK_DW.dbo.d_perusopetuksen_oppimaaran_yksilollistaminen from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_oppimaaran_yksilollistaminen] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_perusopetuksen_oppimaaran_yksilollistaminen
Insert into VipunenTK_DW.dbo.d_perusopetuksen_oppimaaran_yksilollistaminen
Select * from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_oppimaaran_yksilollistaminen] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[perusopetuksen_oppimaaran_yksilollistaminen_koodi]
      ,[perusopetuksen_oppimaaran_yksilollistaminen]
      ,[perusopetuksen_oppimaaran_yksilollistaminen_SV]
      ,[perusopetuksen_oppimaaran_yksilollistaminen_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusopetuksen_oppimaaran_yksilollistaminen]


' 
GO
/****** Object:  View [dbo].[v_perusopetuksen_pidennetty_oppivelvollisuus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusopetuksen_pidennetty_oppivelvollisuus]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_perusopetuksen_pidennetty_oppivelvollisuus] AS
/*
Drop table  VipunenTK_DW.dbo.d_perusopetuksen_pidennetty_oppivelvollisuus
Select * into VipunenTK_DW.dbo.d_perusopetuksen_pidennetty_oppivelvollisuus from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_pidennetty_oppivelvollisuus] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_perusopetuksen_pidennetty_oppivelvollisuus
Insert into VipunenTK_DW.dbo.d_perusopetuksen_pidennetty_oppivelvollisuus
Select * from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_pidennetty_oppivelvollisuus] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[perusopetuksen_pidennetty_oppivelvollisuus_koodi]
      ,[perusopetuksen_pidennetty_oppivelvollisuus]
      ,[perusopetuksen_pidennetty_oppivelvollisuus_SV]
      ,[perusopetuksen_pidennetty_oppivelvollisuus_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusopetuksen_pidennetty_oppivelvollisuus]


' 
GO
/****** Object:  View [dbo].[v_perusopetuksen_tehostettu_tuki]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusopetuksen_tehostettu_tuki]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_perusopetuksen_tehostettu_tuki] AS
/*
Drop table  VipunenTK_DW.dbo.d_perusopetuksen_tehostettu_tuki
Select * into VipunenTK_DW.dbo.d_perusopetuksen_tehostettu_tuki from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_tehostettu_tuki] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_perusopetuksen_tehostettu_tuki
Insert into VipunenTK_DW.dbo.d_perusopetuksen_tehostettu_tuki
Select * from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_tehostettu_tuki] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[perusopetuksen_tehostettu_tuki_koodi]
      ,[perusopetuksen_tehostettu_tuki]
      ,[perusopetuksen_tehostettu_tuki_SV]
      ,[perusopetuksen_tehostettu_tuki_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusopetuksen_tehostettu_tuki]



' 
GO
/****** Object:  View [dbo].[v_perusopetuksen_tukimuoto]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusopetuksen_tukimuoto]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_perusopetuksen_tukimuoto] AS
/*
Drop table  VipunenTK_DW.dbo.d_perusopetuksen_tukimuoto
Select * into VipunenTK_DW.dbo.d_perusopetuksen_tukimuoto from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_tukimuoto] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_perusopetuksen_tukimuoto
Insert into VipunenTK_DW.dbo.d_perusopetuksen_tukimuoto
Select * from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_tukimuoto] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[perusopetuksen_tukimuoto_koodi]
      ,[perusopetuksen_tukimuoto]
      ,[perusopetuksen_tukimuoto_SV]
      ,[perusopetuksen_tukimuoto_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusopetuksen_tukimuoto]


' 
GO
/****** Object:  View [dbo].[v_perusopetuksen_vuosiluokat]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusopetuksen_vuosiluokat]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_perusopetuksen_vuosiluokat] AS  

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[vuosiluokka_koodi]
      ,[vuosiluokka]
      ,[vuosiluokka_SV]
      ,[vuosiluokka_EN]
      ,[luokkajako_12_36_7_89]
      ,[luokkajako_12_36_7_89_SV]
      ,[luokkajako_12_36_7_89_EN]
      ,[luokkajako_16_79]
      ,[luokkajako_16_79_SV]
      ,[luokkajako_16_79_EN]
      ,[luokkajako_16_710]
      ,[luokkajako_16_710_SV]
      ,[luokkajako_16_710_EN]
	  ,[luokkajako_0_19_10]
	  ,[luokkajako_0_19_10_SV]
	  ,[luokkajako_0_19_10_EN]
      ,[jarjestys]
      ,[luokkajako_12_36_7_89_jarjestys]
      ,[luokkajako_16_79_jarjestys]
      ,[luokkajako_16_710_jarjestys]
	  ,[luokkajako_0_19_10_jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusopetuksen_vuosiluokat]

' 
GO
/****** Object:  View [dbo].[v_perusopetuksen_yleisopetuksen_osuus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_perusopetuksen_yleisopetuksen_osuus]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_perusopetuksen_yleisopetuksen_osuus] AS
/*
Drop table  VipunenTK_DW.dbo.d_perusopetuksen_yleisopetuksen_osuus
Select * into VipunenTK_DW.dbo.d_perusopetuksen_yleisopetuksen_osuus from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_yleisopetuksen_osuus] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_perusopetuksen_yleisopetuksen_osuus
Insert into VipunenTK_DW.dbo.d_perusopetuksen_yleisopetuksen_osuus
Select * from VipunenTK_lisatiedot.dbo.[v_perusopetuksen_yleisopetuksen_osuus] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[perusopetuksen_yleisopetuksen_osuus_koodi]
      ,[perusopetuksen_yleisopetuksen_osuus]
      ,[perusopetuksen_yleisopetuksen_osuus_SV]
      ,[perusopetuksen_yleisopetuksen_osuus_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[perusopetuksen_yleisopetuksen_osuus]


' 
GO
/****** Object:  View [dbo].[v_pohjakoulutuksen_tila]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_pohjakoulutuksen_tila]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_pohjakoulutuksen_tila] AS


SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[pohjakoulutuksen_tila_koodi]
      ,[pohjakoulutuksen_tila]
      ,[pohjakoulutuksen_tila_SV]
      ,[pohjakoulutuksen_tila_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[pohjakoulutuksen_tila]


' 
GO
/****** Object:  View [dbo].[v_pohjoismaa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_pohjoismaa]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_pohjoismaa] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	pohjoismaa_koodi,
	pohjoismaa,
	pohjoismaa_SV,
	pohjoismaa_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.pohjoismaa
' 
GO
/****** Object:  View [dbo].[v_rahoituslahde]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_rahoituslahde]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_rahoituslahde] AS
/*
Drop table VipunenTK_DW.dbo.d_rahoituslahde
Select * into VipunenTK_DW.dbo.d_rahoituslahde from VipunenTK_lisatiedot.dbo.[v_rahoituslahde] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_rahoituslahde
Insert into VipunenTK_DW.dbo.d_rahoituslahde
Select * from VipunenTK_lisatiedot.dbo.[v_rahoituslahde] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[rahoituslahde_koodi]
      ,[rahoituslahde]
      ,[rahoituslahde_SV]
      ,[rahoituslahde_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[rahoituslahde]
' 
GO
/****** Object:  View [dbo].[v_rahoituslahde_amm]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_rahoituslahde_amm]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_rahoituslahde_amm] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	rahoituslahde_amm_koodi,
	rahoituslahde_amm,
	rahoituslahde_amm_SV,
	rahoituslahde_amm_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.rahoituslahde_amm
' 
GO
/****** Object:  View [dbo].[v_sama_koulutusala]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sama_koulutusala]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[v_sama_koulutusala] AS
/*
Drop table  VipunenTK_DW.dbo.d_sama_koulutusala
Select * into VipunenTK_DW.dbo.d_sama_koulutusala from VipunenTK_lisatiedot.dbo.[v_sama_koulutusala] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_sama_koulutusala
Insert into VipunenTK_DW.dbo.d_sama_koulutusala
Select * from VipunenTK_lisatiedot.dbo.[v_sama_koulutusala] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[sama_koulutusala_avain]
      ,[sama_koulutusala]
      ,[sama_koulutusala_SV]
      ,[sama_koulutusala_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[sama_koulutusala]

' 
GO
/****** Object:  View [dbo].[v_sarakeleveys]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sarakeleveys]'))
EXEC dbo.sp_executesql @statement = N'/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[v_sarakeleveys] as 
select [sarakeleveys]
      ,[leveys]
  FROM [VipunenTK_lisatiedot].[dbo].[sarakeleveys]' 
GO
/****** Object:  View [dbo].[v_sektoritutkimuslaitos]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sektoritutkimuslaitos]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_sektoritutkimuslaitos] AS

/*
truncate table [VipunenTK_DW].[dbo].[d_sektoritutkimuslaitos]
insert into [VipunenTK_DW].[dbo].[d_sektoritutkimuslaitos]
select * from [v_sektoritutkimuslaitos] where virhetilanne=''E''

drop table [VipunenTK_DW].[dbo].[d_sektoritutkimuslaitos]
select * into [VipunenTK_DW].[dbo].[d_sektoritutkimuslaitos] from [v_sektoritutkimuslaitos] where virhetilanne=''E''
*/

SELECT [id]
      ,[luotu]
      ,[sektoritutkimuslaitos_avain]
      ,[sektoritutkimuslaitos_lyhenne]
      ,[sektoritutkimuslaitos]
      ,[sektoritutkimuslaitos_SV]
      ,[sektoritutkimuslaitos_EN]
      ,[jarjestys_sektoritutkimuslaitos]
      ,[sektoritutkimuslaitos_lyhenne_historia]
      ,[sektoritutkimuslaitos_historia]
      ,[sektoritutkimuslaitos_historia_SV]
      ,[sektoritutkimuslaitos_historia_EN]
      ,[jarjestys_sektoritutkimuslaitos_historia]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [dbo].[sektoritutkimuslaitos]
' 
GO
/****** Object:  View [dbo].[v_siirtyman_tarkastelusuunta]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_siirtyman_tarkastelusuunta]'))
EXEC dbo.sp_executesql @statement = N'/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_siirtyman_tarkastelusuunta] AS

SELECT [id]
      ,[luotu]
      ,[siirtyman_tarkastelusuunta_avain]
      ,[siirtyman_tarkastelusuunta]
      ,[siirtyman_tarkastelusuunta_SV]
      ,[siirtyman_tarkastelusuunta_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[siirtyman_tarkastelusuunta]
  WHERE virhetilanne = ''E''
' 
GO
/****** Object:  View [dbo].[v_sosioekonominen_asema]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sosioekonominen_asema]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_sosioekonominen_asema] AS
/*
Select * into VipunenTK_DW.dbo.d_sosioekonominen_asema from VipunenTK_lisatiedot.dbo.[v_sosioekonominen_asema] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_sosioekonominen_asema
Insert into VipunenTK_DW.dbo.d_sosioekonominen_asema
Select * from VipunenTK_lisatiedot.dbo.[v_sosioekonominen_asema] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[sosioekonominen_asema_koodi]
      ,[sosioekonominen_asema_ryhma]
      ,[sosioekonominen_asema_ryhma_SV]
      ,[sosioekonominen_asema_ryhma_EN]
      ,[sosioekonominen_asema]
      ,[sosioekonominen_asema_SV]
      ,[sosioekonominen_asema_EN]
      ,[jarjestys_ryhma]
      ,[jarjestys_asema]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[sosioekonominen_asema]
' 
GO
/****** Object:  View [dbo].[v_suhteellinen_ajankohta]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_suhteellinen_ajankohta]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_suhteellinen_ajankohta] AS
/*
Drop table  VipunenTK_DW.dbo.d_suhteellinen_ajankohta
Select * into VipunenTK_DW.dbo.d_suhteellinen_ajankohta from VipunenTK_lisatiedot.dbo.[v_suhteellinen_ajankohta] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_suhteellinen_ajankohta
Insert into VipunenTK_DW.dbo.d_suhteellinen_ajankohta
Select * from VipunenTK_lisatiedot.dbo.[v_suhteellinen_ajankohta] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[suhteellinen_ajankohta_avain]
      ,[suhteellinen_ajankohta]
      ,[suhteellinen_ajankohta_SV]
      ,[suhteellinen_ajankohta_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[suhteellinen_ajankohta]

' 
GO
/****** Object:  View [dbo].[v_sukupuoli]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sukupuoli]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_sukupuoli] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	sukupuoli_koodi,
	sukupuoli,
	sukupuoli_SV,
	sukupuoli_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.sukupuoli

' 
GO
/****** Object:  View [dbo].[v_suoritettu_tutkinto]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_suoritettu_tutkinto]'))
EXEC dbo.sp_executesql @statement = N'



/****** Script for SelectTopNRows command from SSMS  ******/

CREATE view [dbo].[v_suoritettu_tutkinto] AS

SELECT [id]
      ,[luotu]
      ,[suoritettu_tutkinto_koodi]
      ,[suoritettu_tutkinto]
      ,[suoritettu_tutkinto_SV]
      ,[suoritettu_tutkinto_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolähde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[suoritettu_tutkinto]



' 
GO
/****** Object:  View [dbo].[v_suorlk]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_suorlk]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_suorlk] AS  

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[suorlk_koodi]
      ,[koodinselite]
      ,[koodinselite_SV]
      ,[koodinselite_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[suorlk]
' 
GO
/****** Object:  View [dbo].[v_suuntautumisvaihtoehto_amk]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_suuntautumisvaihtoehto_amk]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[v_suuntautumisvaihtoehto_amk] as
select
	id,
	luotu,
	alkaa,
	paattyy,
	suuntautumisvaihtoehto_amk_koodi,
	suuntautumisvaihtoehto_amk,
	suuntautumisvaihtoehto_amk_SV,
	suuntautumisvaihtoehto_amk_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
from dbo.suuntautumisvaihtoehto_amk
' 
GO
/****** Object:  View [dbo].[v_tabular_prosessointi]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tabular_prosessointi]'))
EXEC dbo.sp_executesql @statement = N'


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_tabular_prosessointi] AS
SELECT [kuutio_nimi] AS [Kanta]
      ,[kuutio_prosessointiryhma] AS [Ryhma]
  FROM [VipunenTK_lisatiedot].[dbo].[Vipunen_kuutio]
  WHERE kuutio_toteutustyyppi = ''tabular''


' 
GO
/****** Object:  View [dbo].[v_tarkastelujakso]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tarkastelujakso]'))
EXEC dbo.sp_executesql @statement = N'
-- Truncate table VipunenTK_DW.dbo.d_tarkastelujakso
-- Insert into VipunenTK_DW.dbo.d_tarkastelujakso select * from [VipunenTK_lisatiedot].[dbo].[v_tarkastelujakso] WHERE [virhetilanne] <> ''K''
--

CREATE VIEW [dbo].[v_tarkastelujakso] AS
SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tarkastelujakso_koodi]
      ,[tarkastelujakso]
      ,[tarkastelujakso_SV]
      ,[tarkastelujakso_EN]
      ,[jaksovuosi] 
      ,[jaksokausi]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
      ,[sijoittuminen 0_5 - 5_0 vuotta]
      ,[sijoittuminen 1_0 - 5_5 vuotta]
  FROM [VipunenTK_lisatiedot].[dbo].[tarkastelujakso]

' 
GO
/****** Object:  View [dbo].[v_tiedekunta_yo]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tiedekunta_yo]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tiedekunta_yo] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tiedekunta_yo_koodi,
	tiedekunta_yo,
	tiedekunta_yo_SV,
	tiedekunta_yo_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.tiedekunta_yo
' 
GO
/****** Object:  View [dbo].[v_tieteenala]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tieteenala]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[v_tieteenala] AS
/*
Drop table  VipunenTK_DW.dbo.d_tieteenala
Select * into VipunenTK_DW.dbo.d_tieteenala from VipunenTK_lisatiedot.dbo.[v_tieteenala] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_tieteenala
Insert into VipunenTK_DW.dbo.d_tieteenala
Select * from VipunenTK_lisatiedot.dbo.[v_tieteenala] where virhetilanne<>''K''
*/


SELECT [id]
      ,[luotu]
      ,[tieteenala_avain]
      ,[tieteenala2007]
      ,[tieteenala2007_SV]
      ,[tieteenala2007_EN]
      ,[jarjestys_tieteenala2007]
      ,[tieteenala2010]
      ,[tieteenala2010_SV]
      ,[tieteenala2010_EN]
      ,[jarjestys_tieteenala2010]
      ,[paatieteenala2007]
      ,[paatieteenala2007_SV]
      ,[paatieteenala2007_EN]
      ,[jarjestys_paatieteenala2007]
      ,[paatieteenala2010]
      ,[paatieteenala2010_SV]
      ,[paatieteenala2010_EN]
      ,[jarjestys_paatieteenala2010]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tieteenala]


' 
GO
/****** Object:  View [dbo].[v_tietojen_ajankohta]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tietojen_ajankohta]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tietojen_ajankohta] AS

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tietojen_ajankohta_koodi]
      ,[tietojen_ajankohta]
      ,[tietojen_ajankohta_SV]
      ,[tietojen_ajankohta_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tietojen_ajankohta]
' 
GO
/****** Object:  View [dbo].[v_tilauskoulutuksen_sijaintimaa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tilauskoulutuksen_sijaintimaa]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tilauskoulutuksen_sijaintimaa] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tilauskoulutuksen_sijaintimaa_koodi,
	tilauskoulutuksen_sijaintimaa,
	tilauskoulutuksen_sijaintimaa_SV,
	tilauskoulutuksen_sijaintimaa_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.tilauskoulutuksen_sijaintimaa
' 
GO
/****** Object:  View [dbo].[v_todistus_oppisopimuskoulutuksen_suorittamisesta]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_todistus_oppisopimuskoulutuksen_suorittamisesta]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_todistus_oppisopimuskoulutuksen_suorittamisesta] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	todistus_oppisopimuskoulutuksen_suorittamisesta_koodi,
	todistus_oppisopimuskoulutuksen_suorittamisesta,
	todistus_oppisopimuskoulutuksen_suorittamisesta_SV,
	todistus_oppisopimuskoulutuksen_suorittamisesta_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.todistus_oppisopimuskoulutuksen_suorittamisesta
' 
GO
/****** Object:  View [dbo].[v_toimiala_2008]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_toimiala_2008]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[v_toimiala_2008] as
select
	id,
	luotu,
	alkaa,
	paattyy,
	toimiala_2008_avain,
	toimiala_2008_koodi,
	toimiala_2008,
	toimiala_2008_SV,
	toimiala_2008_EN,
	taso,
	taso1,
	jarjestys,
	jarjestys_taso,
	jarjestys_taso1,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
from dbo.toimiala_2008
' 
GO
/****** Object:  View [dbo].[v_toimiala_tk]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_toimiala_tk]'))
EXEC dbo.sp_executesql @statement = N'

/*
Select * into VipunenTK_DW.dbo.d_toimiala_tk from VipunenTK_lisatiedot.dbo.[v_toimiala_tk] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_toimiala_tk
Insert into VipunenTK_DW.dbo.d_toimiala_tk
Select * from VipunenTK_lisatiedot.dbo.[v_toimiala_tk] where virhetilanne<>''K''
*/

CREATE view [dbo].[v_toimiala_tk] as
SELECT  [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tol2008]
      ,[toimiala1]
      ,[toimiala1_SV]
      ,[toimiala1_EN]
      ,[toimiala2_koodi]
      ,[toimiala2]
      ,[toimiala2_SV]
      ,[toimiala2_EN]
      ,[toimiala3_koodi]
      ,[toimiala3]
      ,[toimiala3_SV]
      ,[toimiala3_EN]
      ,[toimiala4_koodi]
      ,[toimiala4]
      ,[toimiala4_SV]
      ,[toimiala4_EN]
      ,[toimiala5_koodi]
      ,[toimiala5]
      ,[toimiala5_SV]
      ,[toimiala5_EN]
      ,[toimiala6_koodi]
      ,[toimiala6]
      ,[toimiala6_SV]
      ,[toimiala6_EN]
      ,[jarjestys_toimiala1]
      ,[jarjestys_toimiala2]
      ,[jarjestys_toimiala3]
      ,[jarjestys_toimiala4]
      ,[jarjestys_toimiala5]
      ,[jarjestys_toimiala6]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[toimiala_tk]

' 
GO
/****** Object:  View [dbo].[v_toimiala_tthv]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_toimiala_tthv]'))
EXEC dbo.sp_executesql @statement = N'



/*
Drop table VipunenTK_DW.dbo.d_toimiala_tthv 
Select * into VipunenTK_DW.dbo.d_toimiala_tthv from VipunenTK_lisatiedot.dbo.[v_toimiala_tthv] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_toimiala_tthv
Insert into VipunenTK_DW.dbo.d_toimiala_tthv
Select * from VipunenTK_lisatiedot.dbo.[v_toimiala_tthv] where virhetilanne<>''K''
*/

CREATE view [dbo].[v_toimiala_tthv] as
SELECT  [id]
      ,[luotu]
      ,[toimiala_tthv_avain]
      ,[toimiala_tthv]
      ,[toimiala_tthv_SV]
      ,[toimiala_tthv_EN]
      ,[toimiala_ja_tol_tthv]
      ,[toimiala_ja_tol_tthv_SV]
      ,[toimiala_ja_tol_tthv_EN]
      ,[jarjestys_toimiala_tthv]
      ,[paatoimiala_tthv]
      ,[paatoimiala_tthv_SV]
      ,[paatoimiala_tthv_EN]
      ,[jarjestys_paatoimiala_tthv]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[toimiala_tthv]



' 
GO
/****** Object:  View [dbo].[v_toimiala_tthv1_sama_kuin_ed_vuonna]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_toimiala_tthv1_sama_kuin_ed_vuonna]'))
EXEC dbo.sp_executesql @statement = N'/*
select * into vipunentk_dw.dbo.d_toimiala_tthv1_sama_kuin_ed_vuonna from dbo.v_toimiala_tthv1_sama_kuin_ed_vuonna
*/

CREATE VIEW [dbo].[v_toimiala_tthv1_sama_kuin_ed_vuonna] AS
SELECT
	id,
	luotu,
	toimiala_tthv1_sama_kuin_ed_vuonna_koodi,
	toimiala_tthv1_sama_kuin_ed_vuonna,
	toimiala_tthv1_sama_kuin_ed_vuonna_SV,
	toimiala_tthv1_sama_kuin_ed_vuonna_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.toimiala_tthv1_sama_kuin_ed_vuonna


' 
GO
/****** Object:  View [dbo].[v_toimiala_tthv2_sama_kuin_ed_vuonna]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_toimiala_tthv2_sama_kuin_ed_vuonna]'))
EXEC dbo.sp_executesql @statement = N'/*
select * into vipunentk_dw.dbo.d_toimiala_tthv2_sama_kuin_ed_vuonna from dbo.v_toimiala_tthv2_sama_kuin_ed_vuonna
*/

CREATE VIEW [dbo].[v_toimiala_tthv2_sama_kuin_ed_vuonna] AS
SELECT
	id,
	luotu,
	toimiala_tthv2_sama_kuin_ed_vuonna_koodi,
	toimiala_tthv2_sama_kuin_ed_vuonna,
	toimiala_tthv2_sama_kuin_ed_vuonna_SV,
	toimiala_tthv2_sama_kuin_ed_vuonna_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.toimiala_tthv2_sama_kuin_ed_vuonna


' 
GO
/****** Object:  View [dbo].[v_tulodesiili]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tulodesiili]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_tulodesiili] AS
SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tulodesiili_koodi]
      ,[tulodesiili]
      ,[tulodesiili_SV]
      ,[tulodesiili_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tulodesiili]

' 
GO
/****** Object:  View [dbo].[v_tutkimuksen_rahoituslahde]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkimuksen_rahoituslahde]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[v_tutkimuksen_rahoituslahde] AS
/*
Drop table  VipunenTK_DW.dbo.d_tutkimuksen_rahoituslahde
Select * into VipunenTK_DW.dbo.d_tutkimuksen_rahoituslahde from VipunenTK_lisatiedot.dbo.[v_tutkimuksen_rahoituslahde] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_tutkimuksen_rahoituslahde
Insert into VipunenTK_DW.dbo.d_tutkimuksen_rahoituslahde
Select * from VipunenTK_lisatiedot.dbo.[v_tutkimuksen_rahoituslahde] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[rahoituslahde_avain]
      ,[rahoituslahdetarkennus]
      ,[rahoituslahdetarkennus_SV]
      ,[rahoituslahdetarkennus_EN]
      ,[jarjestys_rahoituslahdetarkennus]
      ,[rahoituslahde]
      ,[rahoituslahde_SV]
      ,[rahoituslahde_EN]
      ,[jarjestys_rahoituslahde]
      ,[ulkopuolisen_rahoituksen_kansainvalisyys]
      ,[ulkopuolisen_rahoituksen_kansainvalisyys_SV]
      ,[ulkopuolisen_rahoituksen_kansainvalisyys_EN]
      ,[jarjestys_ulkopuolisen_rahoituksen_kansainvalisyys]
      ,[rahoituslahteen_tyyppi]
      ,[rahoituslahteen_tyyppi_SV]
      ,[rahoituslahteen_tyyppi_EN]
      ,[jarjestys_rahoituslahteen_tyyppi]
      ,[rahoituksen_laatu]
      ,[rahoituksen_laatu_SV]
      ,[rahoituksen_laatu_EN]
      ,[jarjestys_rahoituksen_laatu]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [dbo].[tutkimuksen_rahoituslahde]
' 
GO
/****** Object:  View [dbo].[v_tutkimus_tehtava]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkimus_tehtava]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkimus_tehtava] AS
/*
Drop table  VipunenTK_DW.dbo.d_tutkimus_tehtava
Select * into VipunenTK_DW.dbo.d_tutkimus_tehtava from VipunenTK_lisatiedot.dbo.[v_tutkimus_tehtava] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_tutkimus_tehtava
Insert into VipunenTK_DW.dbo.d_tutkimus_tehtava
Select * from VipunenTK_lisatiedot.dbo.[v_tutkimus_tehtava] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[tutkimus_tehtava_avain]
      ,[tutkimus_tehtava]
      ,[tutkimus_tehtava_SV]
      ,[tutkimus_tehtava_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkimus_tehtava]



' 
GO
/****** Object:  View [dbo].[v_tutkimusmenojen_kohde]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkimusmenojen_kohde]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkimusmenojen_kohde] AS
/*
Drop table  VipunenTK_DW.dbo.d_tutkimusmenojen_kohde
Select * into VipunenTK_DW.dbo.d_tutkimusmenojen_kohde from VipunenTK_lisatiedot.dbo.[v_tutkimusmenojen_kohde] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_tutkimusmenojen_kohde
Insert into VipunenTK_DW.dbo.d_tutkimusmenojen_kohde
Select * from VipunenTK_lisatiedot.dbo.[v_tutkimusmenojen_kohde] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[menokohde_avain]
      ,[menokohde]
      ,[menokohde_SV]
      ,[menokohde_EN]
      ,[jarjestys_menokohde]
      ,[menotyyppi]
      ,[menotyyppi_SV]
      ,[menotyyppi_EN]
      ,[jarjestys_menotyyppi]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkimusmenojen_kohde]
' 
GO
/****** Object:  View [dbo].[v_tutkinnon_tavoite]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinnon_tavoite]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tutkinnon_tavoite] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tutkinnon_tavoite_koodi,
	tutkinnon_tavoite,
	tutkinnon_tavoite_SV,
	tutkinnon_tavoite_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.tutkinnon_tavoite
' 
GO
/****** Object:  View [dbo].[v_tutkinnon_toteuma]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinnon_toteuma]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tutkinnon_toteuma] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tutkinnon_toteuma_koodi,
	tutkinnon_toteuma,
	tutkinnon_toteuma_SV,
	tutkinnon_toteuma_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.tutkinnon_toteuma
' 
GO
/****** Object:  View [dbo].[v_tutkinto]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_tutkinto] AS
/*
Drop table  VipunenTK_DW.dbo.d_tutkinto
Select * into VipunenTK_DW.dbo.d_tutkinto from VipunenTK_lisatiedot.dbo.[v_tutkinto] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_tutkinto
Insert into VipunenTK_DW.dbo.d_tutkinto
Select * from VipunenTK_lisatiedot.dbo.[v_tutkinto] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_avain]
      ,[tutkinto]
      ,[tutkinto_SV]
      ,[tutkinto_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisella_koulutuksen_jarjestajalla]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_alkuperaisella_koulutuksen_jarjestajalla]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_alkuperaisella_koulutuksen_jarjestajalla] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_alkuperaisella_koulutuksen_jarjestajalla_koodi]
      ,[tutkinto_alkuperaisella_koulutuksen_jarjestajalla]
      ,[tutkinto_alkuperaisella_koulutuksen_jarjestajalla_SV]
      ,[tutkinto_alkuperaisella_koulutuksen_jarjestajalla_EN]
      ,[jarjestys_4c]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_alkuperaisella_koulutuksen_jarjestajalla]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisella_koulutusalalla_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_alkuperaisella_koulutusalalla_2002]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_alkuperaisella_koulutusalalla_2002] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_alkuperaisella_koulutusalalla_2002_koodi]
      ,[tutkinto_alkuperaisella_koulutusalalla_2002]
      ,[tutkinto_alkuperaisella_koulutusalalla_2002_SV]
      ,[tutkinto_alkuperaisella_koulutusalalla_2002_EN]
      ,[jarjestys_2c]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_alkuperaisella_koulutusalalla_2002]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisella_koulutusasteella_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_alkuperaisella_koulutusasteella_2002]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_alkuperaisella_koulutusasteella_2002] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_alkuperaisella_koulutusasteella_2002_koodi]
      ,[tutkinto_alkuperaisella_koulutusasteella_2002]
      ,[tutkinto_alkuperaisella_koulutusasteella_2002_SV]
      ,[tutkinto_alkuperaisella_koulutusasteella_2002_EN]
      ,[jarjestys_1c]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_alkuperaisella_koulutusasteella_2002]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisella_koulutussektorilla]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_alkuperaisella_koulutussektorilla]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_alkuperaisella_koulutussektorilla] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_alkuperaisella_koulutussektorilla_koodi]
      ,[tutkinto_alkuperaisella_koulutussektorilla]
      ,[tutkinto_alkuperaisella_koulutussektorilla_SV]
      ,[tutkinto_alkuperaisella_koulutussektorilla_EN]
      ,[jarjestys_7c]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_alkuperaisella_koulutussektorilla]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisella_opintoalalla_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_alkuperaisella_opintoalalla_2002]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_alkuperaisella_opintoalalla_2002] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_alkuperaisella_opintoalalla_2002_koodi]
      ,[tutkinto_alkuperaisella_opintoalalla_2002]
      ,[tutkinto_alkuperaisella_opintoalalla_2002_SV]
      ,[tutkinto_alkuperaisella_opintoalalla_2002_EN]
      ,[jarjestys_3c]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_alkuperaisella_opintoalalla_2002]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisessa_maakunnassa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_alkuperaisessa_maakunnassa]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_alkuperaisessa_maakunnassa] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_alkuperaisessa_maakunnassa_koodi]
      ,[tutkinto_alkuperaisessa_maakunnassa]
      ,[tutkinto_alkuperaisessa_maakunnassa_SV]
      ,[tutkinto_alkuperaisessa_maakunnassa_EN]
      ,[jarjestys_6c]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_alkuperaisessa_maakunnassa]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisessa_oppilaitoksessa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_alkuperaisessa_oppilaitoksessa]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_alkuperaisessa_oppilaitoksessa] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_alkuperaisessa_oppilaitoksessa_koodi]
      ,[tutkinto_alkuperaisessa_oppilaitoksessa]
      ,[tutkinto_alkuperaisessa_oppilaitoksessa_SV]
      ,[tutkinto_alkuperaisessa_oppilaitoksessa_EN]
      ,[jarjestys_5c]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_alkuperaisessa_oppilaitoksessa]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_amk]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_amk]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tutkinto_amk] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tutkinto_amk_koodi,
	tutkinto_amk,
	tutkinto_amk_SV,
	tutkinto_amk_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.tutkinto_amk
' 
GO
/****** Object:  View [dbo].[v_tutkinto_muulla_koulutuksen_jarjestajalla]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_muulla_koulutuksen_jarjestajalla]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_muulla_koulutuksen_jarjestajalla] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_muulla_koulutuksen_jarjestajalla_koodi]
      ,[tutkinto_muulla_koulutuksen_jarjestajalla]
      ,[tutkinto_muulla_koulutuksen_jarjestajalla_SV]
      ,[tutkinto_muulla_koulutuksen_jarjestajalla_EN]
      ,[jarjestys_4d]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_muulla_koulutuksen_jarjestajalla]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_muulla_koulutusalalla_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_muulla_koulutusalalla_2002]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_muulla_koulutusalalla_2002] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_muulla_koulutusalalla_2002_koodi]
      ,[tutkinto_muulla_koulutusalalla_2002]
      ,[tutkinto_muulla_koulutusalalla_2002_SV]
      ,[tutkinto_muulla_koulutusalalla_2002_EN]
      ,[jarjestys_2d]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_muulla_koulutusalalla_2002]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_muulla_koulutusasteella_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_muulla_koulutusasteella_2002]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_muulla_koulutusasteella_2002] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_muulla_koulutusasteella_2002_koodi]
      ,[tutkinto_muulla_koulutusasteella_2002]
      ,[tutkinto_muulla_koulutusasteella_2002_SV]
      ,[tutkinto_muulla_koulutusasteella_2002_EN]
      ,[jarjestys_1d]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_muulla_koulutusasteella_2002]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_muulla_koulutussektorilla]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_muulla_koulutussektorilla]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_muulla_koulutussektorilla] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_muulla_koulutussektorilla_koodi]
      ,[tutkinto_muulla_koulutussektorilla]
      ,[tutkinto_muulla_koulutussektorilla_SV]
      ,[tutkinto_muulla_koulutussektorilla_EN]
      ,[jarjestys_7d]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_muulla_koulutussektorilla]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_muulla_opintoalalla_2002]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_muulla_opintoalalla_2002]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_muulla_opintoalalla_2002] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_muulla_opintoalalla_2002_koodi]
      ,[tutkinto_muulla_opintoalalla_2002]
      ,[tutkinto_muulla_opintoalalla_2002_SV]
      ,[tutkinto_muulla_opintoalalla_2002_EN]
      ,[jarjestys_3d]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_muulla_opintoalalla_2002]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_muussa_maakunnassa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_muussa_maakunnassa]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_muussa_maakunnassa] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_muussa_maakunnassa_koodi]
      ,[tutkinto_muussa_maakunnassa]
      ,[tutkinto_muussa_maakunnassa_SV]
      ,[tutkinto_muussa_maakunnassa_EN]
      ,[jarjestys_6d]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_muussa_maakunnassa]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_muussa_oppilaitoksessa]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_muussa_oppilaitoksessa]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_tutkinto_muussa_oppilaitoksessa] AS
SELECT
	   [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tutkinto_muussa_oppilaitoksessa_koodi]
      ,[tutkinto_muussa_oppilaitoksessa]
      ,[tutkinto_muussa_oppilaitoksessa_SV]
      ,[tutkinto_muussa_oppilaitoksessa_EN]
      ,[jarjestys_5d]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_muussa_oppilaitoksessa]


' 
GO
/****** Object:  View [dbo].[v_tutkinto_suoritettu]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_suoritettu]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[v_tutkinto_suoritettu] AS
/*
Drop table  VipunenTK_DW.dbo.d_tutkinto_suoritettu
Select * into VipunenTK_DW.dbo.d_tutkinto_suoritettu from VipunenTK_lisatiedot.dbo.[v_tutkinto_suoritettu] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_tutkinto_suoritettu
Insert into VipunenTK_DW.dbo.d_tutkinto_suoritettu
Select * from VipunenTK_lisatiedot.dbo.[v_tutkinto_suoritettu] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[tutkinto_suoritettu_avain]
      ,[tutkinto_suoritettu]
      ,[tutkinto_suoritettu_SV]
      ,[tutkinto_suoritettu_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkinto_suoritettu]

' 
GO
/****** Object:  View [dbo].[v_tutkinto_yo]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkinto_yo]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_tutkinto_yo] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tutkinto_yo_koodi,
	tutkinto_yo,
	tutkinto_yo_SV,
	tutkinto_yo_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.tutkinto_yo

' 
GO
/****** Object:  View [dbo].[v_tutkintoasetus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkintoasetus]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tutkintoasetus] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tutkintoasetus_koodi,
	tutkintoasetus,
	tutkintoasetus_SV,
	tutkintoasetus_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.tutkintoasetus
' 
GO
/****** Object:  View [dbo].[v_tutkintojen_maara]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkintojen_maara]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[v_tutkintojen_maara] AS
/*
Drop table  VipunenTK_DW.dbo.d_tutkintojen_maara
Select * into VipunenTK_DW.dbo.d_tutkintojen_maara from VipunenTK_lisatiedot.dbo.[v_tutkintojen_maara] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_tutkintojen_maara
Insert into VipunenTK_DW.dbo.d_tutkintojen_maara
Select * from VipunenTK_lisatiedot.dbo.[v_tutkintojen_maara] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[tutkintojen_maara_avain]
      ,[tutkintojen_maara]
      ,[tutkintojen_maara_SV]
      ,[tutkintojen_maara_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkintojen_maara]

' 
GO
/****** Object:  View [dbo].[v_tutkintolaji_tyollistymiseen]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkintolaji_tyollistymiseen]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_tutkintolaji_tyollistymiseen] AS
SELECT
	[id], 
	[luotu],
	[alkaa], 
	[paattyy],
	[tutkintolaji_tyollistymiseen_koodi],
	[tutkintolaji_tyollistymiseen],
	[tutkintolaji_tyollistymiseen_SV],
	[tutkintolaji_tyollistymiseen_EN],
	[jarjestys],
	[virhetilanne],
	[poistettu],
	[tietolahde],
	[kommentti]
FROM VipunenTK_lisatiedot.dbo.tutkintolaji_tyollistymiseen

' 
GO
/****** Object:  View [dbo].[v_tutkintonimike_ammpk]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkintonimike_ammpk]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tutkintonimike_ammpk] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tutkintonimike_ammpk_koodi,
	tutkintonimike_ammpk,
	tutkintonimike_ammpk_SV,
	tutkintonimike_ammpk_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.tutkintonimike_ammpk
' 
GO
/****** Object:  View [dbo].[v_tutkintoryhma]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkintoryhma]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tutkintoryhma] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tutkintoryhma_koodi,
	tutkintoryhma,
	tutkintoryhma_SV,
	tutkintoryhma_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.tutkintoryhma
' 
GO
/****** Object:  View [dbo].[v_tutkintotaso]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tutkintotaso]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[v_tutkintotaso] AS
/*
Drop table  VipunenTK_DW.dbo.d_tutkintotaso
Select * into VipunenTK_DW.dbo.d_tutkintotaso from VipunenTK_lisatiedot.dbo.[v_tutkintotaso] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_tutkintotaso
Insert into VipunenTK_DW.dbo.d_tutkintotaso
Select * from VipunenTK_lisatiedot.dbo.[v_tutkintotaso] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[tutkintotaso_koodi]
      ,[tutkintotaso]
      ,[tutkintotaso_SV]
      ,[tutkintotaso_EN]
      ,[jarjestys]
      ,[tutkintotaso_tk_henkilokunta]
      ,[tutkintotaso_tk_henkilokunta_SV]
      ,[tutkintotaso_tk_henkilokunta_EN]
      ,[jarjestys_tk_henkilokunta]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tutkintotaso]

' 
GO
/****** Object:  View [dbo].[v_tyonantajasektori]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tyonantajasektori]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tyonantajasektori] AS
/*
--Drop table VipunenTK_DW.dbo.d_tyonantajasektori
--Select * into VipunenTK_DW.dbo.d_tyonantajasektori from VipunenTK_lisatiedot.dbo.v_tyonantajasektori where [virhetilanne]<>''K''
Truncate table VipunenTK_DW.dbo.d_tyonantajasektori
Insert into VipunenTK_DW.dbo.d_tyonantajasektori
Select * from VipunenTK_lisatiedot.dbo.v_tyonantajasektori where [virhetilanne]<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tyonantajasektori_koodi]
      ,[tyonantajasektori]
      ,[tyonantajasektori_SV]
      ,[tyonantajasektori_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tyonantajasektori]
' 
GO
/****** Object:  View [dbo].[v_tyonantajasektori_sama_kuin_ed_vuonna]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tyonantajasektori_sama_kuin_ed_vuonna]'))
EXEC dbo.sp_executesql @statement = N'/*
select * into vipunentk_dw.dbo.d_tyonantajasektori_sama_kuin_ed_vuonna_tthv from dbo.v_tyonantajasektori_sama_kuin_ed_vuonna
*/

CREATE VIEW [dbo].[v_tyonantajasektori_sama_kuin_ed_vuonna] AS
SELECT
	id,
	luotu,
	tyonantajasektori_sama_kuin_ed_vuonna_koodi,
	tyonantajasektori_sama_kuin_ed_vuonna,
	tyonantajasektori_sama_kuin_ed_vuonna_SV,
	tyonantajasektori_sama_kuin_ed_vuonna_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.tyonantajasektori_sama_kuin_ed_vuonna


' 
GO
/****** Object:  View [dbo].[v_tyonantajasektori2]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tyonantajasektori2]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_tyonantajasektori2] AS
/*
Drop table VipunenTK_DW.dbo.d_tyonantajasektori2
Select * into VipunenTK_DW.dbo.d_tyonantajasektori2 from VipunenTK_lisatiedot.dbo.v_tyonantajasektori2 where [virhetilanne]<>''K''
Truncate table VipunenTK_DW.dbo.d_tyonantajasektori2
Insert into VipunenTK_DW.dbo.d_tyonantajasektori2
Select * from VipunenTK_lisatiedot.dbo.v_tyonantajasektori2 where [virhetilanne]<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[tyonantajasektori2_avain]
      ,[tyonantajasektori2]
      ,[tyonantajasektori2_SV]
      ,[tyonantajasektori2_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tyonantajasektori2]

' 
GO
/****** Object:  View [dbo].[v_tyopaikan_sijainti_v_tilastovuonna]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tyopaikan_sijainti_v_tilastovuonna]'))
EXEC dbo.sp_executesql @statement = N'/****** Script for SelectTopNRows command from SSMS  ******/

CREATE VIEW [dbo].[v_tyopaikan_sijainti_v_tilastovuonna] AS

SELECT [id]
      ,[luotu]
      ,[tyopaikan_sijainti_v_tilastovuonna_avain]
      ,[tyopaikan_sijainti_v_tilastovuonna]
      ,[tyopaikan_sijainti_v_tilastovuonna_SV]
      ,[tyopaikan_sijainti_v_tilastovuonna_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[tyopaikan_sijainti_v_tilastovuonna]
  
  WHERE virhetilanne = ''E''
' 
GO
/****** Object:  View [dbo].[v_tyossakayntitilaston_tyonantajasektori]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tyossakayntitilaston_tyonantajasektori]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tyossakayntitilaston_tyonantajasektori] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tyossakayntitilaston_tyonantajasektori_koodi,
	tyossakayntitilaston_tyonantajasektori,
	tyossakayntitilaston_tyonantajasektori_SV,
	tyossakayntitilaston_tyonantajasektori_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.tyossakayntitilaston_tyonantajasektori
' 
GO
/****** Object:  View [dbo].[v_tyovoimapoliittinen]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tyovoimapoliittinen]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tyovoimapoliittinen] AS  
SELECT [id]
,[luotu]
,[alkaa]
,[paattyy]
,[tyovoimapoliittinen_koodi]
,[tyovoimapoliittinen]
,[tyovoimapoliittinen_SV]
,[tyovoimapoliittinen_EN]
,[jarjestys]
,[virhetilanne]
,[poistettu]
,[tietolahde]
,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[tyovoimapoliittinen]
' 
GO
/****** Object:  View [dbo].[v_tyovoimapoliittinen_koulutus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tyovoimapoliittinen_koulutus]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_tyovoimapoliittinen_koulutus] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tyovoimapoliittinen_koulutus_koodi,
	tyovoimapoliittinen_koulutus,
	tyovoimapoliittinen_koulutus_SV,
	tyovoimapoliittinen_koulutus_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.tyovoimapoliittinen_koulutus
' 
GO
/****** Object:  View [dbo].[v_uusi_vanha_opiskelija]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_uusi_vanha_opiskelija]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_uusi_vanha_opiskelija] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	uusi_vanha_opiskelija_koodi,
	uusi_vanha_opiskelija,
	uusi_vanha_opiskelija_SV,
	uusi_vanha_opiskelija_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.uusi_vanha_opiskelija
' 
GO
/****** Object:  View [dbo].[v_vahintaan_45_op_suorittanut]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_vahintaan_45_op_suorittanut]'))
EXEC dbo.sp_executesql @statement = N'
create view [dbo].[v_vahintaan_45_op_suorittanut] as
select
	id,
	luotu,
	alkaa,
	paattyy,
	vahintaan_45_op_suorittanut_koodi,
	vahintaan_45_op_suorittanut,
	vahintaan_45_op_suorittanut_SV,
	vahintaan_45_op_suorittanut_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
from dbo.vahintaan_45_op_suorittanut

' 
GO
/****** Object:  View [dbo].[v_vahintaan_55_op_suorittanut]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_vahintaan_55_op_suorittanut]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[v_vahintaan_55_op_suorittanut] as
select
	id,
	luotu,
	alkaa,
	paattyy,
	vahintaan_55_op_suorittanut_koodi,
	vahintaan_55_op_suorittanut,
	vahintaan_55_op_suorittanut_SV,
	vahintaan_55_op_suorittanut_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
from dbo.vahintaan_55_op_suorittanut
' 
GO
/****** Object:  View [dbo].[v_valiaikainen_amk]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_valiaikainen_amk]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_valiaikainen_amk] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	valiaikainen_amk_koodi,
	valiaikainen_amk,
	valiaikainen_amk_SV,
	valiaikainen_amk_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.valiaikainen_amk
' 
GO
/****** Object:  View [dbo].[v_valtio]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_valtio]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_valtio] AS
SELECT
	[id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[valtio_avain]
      ,[maa_koodi]
      ,[maa]
      ,[maa_SV]
      ,[maa_EN]
      ,[eumaa_koodi]
      ,[eumaa]
      ,[eumaa_SV]
      ,[eumaa_EN]
      ,[etamaa_koodi]
      ,[etamaa]
      ,[etamaa_SV]
      ,[etamaa_EN]
      ,[maanosa_koodi]
      ,[maanosa]
      ,[maanosa_SV]
      ,[maanosa_EN]
      ,[maanosa2_koodi]
      ,[maanosa2]
      ,[maanosa2_SV]
      ,[maanosa2_EN]
      ,[maanosa3_koodi]
      ,[maanosa3]
      ,[maanosa3_SV]
      ,[maanosa3_EN]
      ,[jarjestys]
      ,[jarjestys_eumaa]
      ,[jarjestys_etamaa]
      ,[jarjestys_maanosa]
      ,[jarjestys_maanosa2]
      ,[jarjestys_maanosa3]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[valtio]
' 
GO
/****** Object:  View [dbo].[v_valtio_talteen]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_valtio_talteen]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view [dbo].[v_valtio_talteen] as

--CSC Jarmo 20.3.2015
--Haetaan tieto Tilastokeskuksen toimittamasta siirtokannan taulusta
--Pidetään rakenne samana
--Lisätietoihin jää vain tuntematon ja virhetilanne
/*
select
	id,luotu,alkaa,paattyy,
	valtio_avain,
	maa_koodi,maa,maa_SV,maa_EN,
	eumaa_koodi,eumaa,eumaa_SV,eumaa_EN,
	etamaa_koodi,etamaa,etamaa_SV,etamaa_EN,
	maanosa_koodi,maanosa,maanosa_SV,maanosa_EN,
	maanosa2_koodi,maanosa2,maanosa2_SV,maanosa2_EN,
	maanosa3_koodi,maanosa3,maanosa3_SV,maanosa3_EN,
	jarjestys,jarjestys_eumaa,jarjestys_etamaa,
	jarjestys_maanosa,jarjestys_maanosa2,jarjestys_maanosa3,
	virhetilanne,poistettu,tietolahde,kommentti
from dbo.valtio
*/
Select
	id = rivinumero,
	luotu = luontipvm,
	alkaa = Cast(''1900-01-01'' as DATE),
	paattyy = Cast(''9999-12-31'' as DATE),
	valtio_avain = Cast(maa as nvarchar(10)),
	maa_koodi = Cast(maa as nvarchar(3)),
	maa = Cast([maanimi_s] as nvarchar(100)),
	maa_SV = Cast([maanimi_r] as nvarchar(100)),
	maa_EN = Cast([maanimi_e] as nvarchar(100)),
	eumaa_koodi = cast(eumaa as nvarchar(2)),
	eumaa = Cast(Case eumaa when ''1'' then ''Kyllä'' when ''2'' then ''Ei'' else ''Tuntematon'' end as nvarchar(50)),
	eumaa_SV = Cast(Case eumaa when ''1'' then ''Ja'' when ''2'' then ''Inte'' else ''Information saknas'' end as nvarchar(50)),
	eumaa_EN = Cast(Case eumaa when ''1'' then ''Yes'' when ''2'' then ''No'' else ''Missing data'' end as nvarchar(50)),
	etamaa_koodi = cast(etamaa as nvarchar(2)),
	etamaa = Cast(Case etamaa when ''1'' then ''Kyllä'' when ''2'' then ''Ei'' else ''Tuntematon'' end as nvarchar(50)),
	etamaa_SV = Cast(Case etamaa when ''1'' then ''Ja'' when ''2'' then ''Inte'' else ''Information saknas'' end as nvarchar(50)),
	etamaa_EN = Cast(Case etamaa when ''1'' then ''Yes'' when ''2'' then ''No'' else ''Missing data'' end as nvarchar(50)),	
	maanosa_koodi = cast(mosa as nvarchar(2)),
	maanosa = cast(mosanim as nvarchar(50)),
	maanosa_SV = cast(''*SV*''+mosanim as nvarchar(50)),
	maanosa_EN = cast(''*EN*''+mosanim as nvarchar(50)),
	maanosa2_koodi = cast(mosa_2 as nvarchar(2)),
	maanosa2 = cast(mosanim_2 as nvarchar(50)),
	maanosa2_SV = cast(''*SV*''+mosanim_2 as nvarchar(50)),
	maanosa2_EN = cast(''*EN*''+mosanim_2 as nvarchar(50)),
	maanosa3_koodi = cast(mosa_3 as nvarchar(3)),
	maanosa3 = cast(mosanim_3 as nvarchar(50)),
	maanosa3_SV = cast(''*SV*''+mosanim_3 as nvarchar(50)),
	maanosa3_EN = cast(''*EN*''+mosanim_3 as nvarchar(50)),
	jarjestys = Cast(rivinumero as smallint),
	jarjestys_eumaa = CAST(isnull(eumaa,''9'') as smallint),
	jarjestys_etamaa = CAST(isnull(etamaa,''9'') as smallint),
	jarjestys_maanosa = CAST(isnull(mosa,''9'') as smallint),
	jarjestys_maanosa2 = CAST(isnull(mosa,''9'') as smallint),
	jarjestys_maanosa3 = CAST(isnull(mosa,''9'') as smallint),
	virhetilanne = Cast(''E'' as nchar(1)),
	poistettu = Cast(''0'' as nchar(1)),
	tietolahde,
	kommentti = CAST('''' as nvarchar(250))
from VipunenTK_SA.dbo.v_sa_6_9_Valtiot
where tilv=(select max(tilv) from VipunenTK_SA.dbo.v_sa_6_9_Valtiot)

UNION ALL

--Haetaan virhekoodit lisätiedoista
select
	id,luotu,alkaa,paattyy,
	valtio_avain,
	maa_koodi,maa,maa_SV,maa_EN,
	eumaa_koodi,eumaa,eumaa_SV,eumaa_EN,
	etamaa_koodi,etamaa,etamaa_SV,etamaa_EN,
	maanosa_koodi,maanosa,maanosa_SV,maanosa_EN,
	maanosa2_koodi,maanosa2,maanosa2_SV,maanosa2_EN,
	maanosa3_koodi,maanosa3,maanosa3_SV,maanosa3_EN,
	jarjestys,jarjestys_eumaa,jarjestys_etamaa,
	jarjestys_maanosa,jarjestys_maanosa2,jarjestys_maanosa3,
	virhetilanne,poistettu,tietolahde,kommentti
from dbo.valtio
where virhetilanne = ''K''

' 
GO
/****** Object:  View [dbo].[v_vayla_nayttotutkintoon]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_vayla_nayttotutkintoon]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_vayla_nayttotutkintoon] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	vayla_nayttotutkintoon_koodi,
	vayla_nayttotutkintoon,
	vayla_nayttotutkintoon_SV,
	vayla_nayttotutkintoon_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.vayla_nayttotutkintoon
' 
GO
/****** Object:  View [dbo].[v_vieraskielisyys]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_vieraskielisyys]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_vieraskielisyys] AS
/*
Drop table  VipunenTK_DW.dbo.d_vieraskielisyys
Select * into VipunenTK_DW.dbo.d_vieraskielisyys from VipunenTK_lisatiedot.dbo.[v_vieraskielisyys] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_vieraskielisyys
Insert into VipunenTK_DW.dbo.d_vieraskielisyys
Select * from VipunenTK_lisatiedot.dbo.[v_vieraskielisyys] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[vieraskielisyys_koodi]
      ,[vieraskielisyys]
      ,[vieraskielisyys_SV]
      ,[vieraskielisyys_EN]
      ,[vieraskielisyys_lyhyt]
      ,[vieraskielisyys_lyhyt_SV]
      ,[vieraskielisyys_lyhyt_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[vieraskielisyys]
' 
GO
/****** Object:  View [dbo].[v_virkaryhma]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_virkaryhma]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_virkaryhma] AS
/*
Drop table  VipunenTK_DW.dbo.d_virkaryhma
Select * into VipunenTK_DW.dbo.d_virkaryhma from VipunenTK_lisatiedot.dbo.[v_virkaryhma] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_virkaryhma
Insert into VipunenTK_DW.dbo.d_virkaryhma
Select * from VipunenTK_lisatiedot.dbo.[v_virkaryhma] where virhetilanne<>''K''
*/

SELECT [id]
      ,[luotu]
      ,[virkaryhma_koodi]
      ,[virkaryhma]
      ,[virkaryhma_SV]
      ,[virkaryhma_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[virkaryhma]
' 
GO
/****** Object:  View [dbo].[v_yliopisto]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_yliopisto]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_yliopisto] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	yliopisto_koodi,
	yliopisto,
	yliopisto_SV,
	yliopisto_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.yliopisto
' 
GO
/****** Object:  View [dbo].[v_yllapitajan_kieli]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_yllapitajan_kieli]'))
EXEC dbo.sp_executesql @statement = N'
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE VIEW [dbo].[v_yllapitajan_kieli] AS

/**

INSERT INTO [VipunenTK_DW].[dbo].[d_yllapitajan_kieli]
SELECT * FROM [VipunenTK_lisatiedot].[dbo].[v_yllapitajan_kieli]

**/

SELECT [id]
      ,[luotu]
      ,[yllapitajan_kieli_koodi]
      ,[yllapitajan_kieli]
      ,[yllapitajan_kieli_SV]
      ,[yllapitajan_kieli_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[yllapitajan_kieli]
' 
GO
/****** Object:  View [dbo].[v_yosairaala]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_yosairaala]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[v_yosairaala] AS

/*
truncate table [VipunenTK_DW].[dbo].[d_yosairaala]
insert into [VipunenTK_DW].[dbo].[d_yosairaala]
select * from [v_yosairaala] where virhetilanne=''E''

drop table [VipunenTK_DW].[dbo].[d_yosairaala]
select * into [VipunenTK_DW].[dbo].[d_yosairaala] from [v_yosairaala] where virhetilanne=''E''
*/

SELECT [id]
      ,[luotu]
      ,[yosairaala_avain]
      ,[yosairaala_lyhenne]
      ,[yosairaala]
      ,[yosairaala_SV]
      ,[yosairaala_EN]
      ,[jarjestys_yosairaala]
      ,[yosairaala_lyhenne_historia]
      ,[yosairaala_historia]
      ,[yosairaala_historia_SV]
      ,[yosairaala_historia_EN]
      ,[jarjestys_yosairaala_historia]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [dbo].[yosairaala]

' 
GO
/****** Object:  View [dbo].[v_yrittajan_oppisopimuskoulutus]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_yrittajan_oppisopimuskoulutus]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_yrittajan_oppisopimuskoulutus] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	yrittajan_oppisopimuskoulutus_koodi,
	yrittajan_oppisopimuskoulutus,
	yrittajan_oppisopimuskoulutus_SV,
	yrittajan_oppisopimuskoulutus_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.yrittajan_oppisopimuskoulutus
' 
GO
/****** Object:  View [dbo].[v_yrityksen_koko_tthv]    Script Date: 21.6.2017 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_yrityksen_koko_tthv]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_yrityksen_koko_tthv] AS
SELECT
	id,
	luotu,
	yrityksen_koko_koodi,
	yrityksen_koko,
	yrityksen_koko_SV,
	yrityksen_koko_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.yrityksen_koko_tthv

' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'v_opetuksen_jarjestajan_tiedoantajatyyppi', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "opetuksen_jarjestajan_tiedoantajatyyppi (dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 9
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_opetuksen_jarjestajan_tiedoantajatyyppi'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'v_opetuksen_jarjestajan_tiedoantajatyyppi', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_opetuksen_jarjestajan_tiedoantajatyyppi'
GO

USE [ANTERO]
