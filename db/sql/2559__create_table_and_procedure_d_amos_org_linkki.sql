USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_spl_organisaatio_linkki]    Script Date: 24.10.2019 15:06:56 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_amos_spl_organisaatio_linkki]
GO
/****** Object:  Table [dw].[d_amos_spl_organisaatio_linkki]    Script Date: 24.10.2019 15:06:56 ******/
DROP TABLE IF EXISTS [dw].[d_amos_spl_organisaatio_linkki]
GO
/****** Object:  Table [dw].[d_amos_spl_organisaatio_linkki]    Script Date: 24.10.2019 15:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_spl_organisaatio_linkki]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amos_spl_organisaatio_linkki](
	[ps_toimipiste_oid] [varchar](max) NULL,
	[oo_koulutustoimija_oid] [varchar](max) NULL,
	[fuusiota_edeltava_ytunnus] [varchar](9) NULL,
	[amos_spl_master_ytunnus] [varchar](10) NULL,
	[ol_organisaatio_koodi] [varchar](20) NULL,
	[ol_organisaatio_fi] [nvarchar](255) NULL,
	[kunta_koodi] [varchar](5) NULL,
	[kunta_fi] [nvarchar](200) NOT NULL,
	[maakunta_fi] [nvarchar](200) NULL,
	[ely_fi] [nvarchar](60) NULL,
	[avi_fi] [nvarchar](60) NULL,
	[rnk_tp] [bigint] NULL,
	[rnk_kt] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_spl_organisaatio_linkki]    Script Date: 24.10.2019 15:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_amos_spl_organisaatio_linkki]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_amos_spl_organisaatio_linkki] AS' 
END
GO














ALTER PROCEDURE [dw].[p_lataa_d_amos_spl_organisaatio_linkki] AS

-- jhe 21.3.2019, jhe 29.04.2019, 16.5.2019
--  juho mikkosen speksi 18.3
-- käytetään suoritepäätöslaskennassa
-- tarjoaa koulutustoimijatason y-tunnuksen ps-oidia vastaan suoritteiden summausta varten
-- materialisoidaan näkymä tästä riippuvien latausten keventämiseksi

--29.04.2019, lisätty aluetietoa, vrt. Kari raporttispeksi (Tutkinnot ja tutkinnon osat)

-- 16.5 kytketty OKM:n fuusiomasteriin, eli jo tässä vaiheessa vaihdetaan raportoitavan järjestäjän y-tunnus,
--.. joka löytyy fuusiotaulusta [dw].[d_amos_rajapinta_organisaatioliitokset], joka luodaan kyselyllä [dw].[v_amos_spl_koski_suorite_organisaatio_linkki]
-- Kyselyn logiikka: ensin haetaan oidilla d_organisaatiosta y-tunnus, joka sitten tarvittaessa vaihdetaan fuusioituneeseen
-- aluetiedot poimitaan fuusioituneelle tunnukselle, ei ns. alkuperäiselle
-- siksi kyselyn rakenne näin kerroksellinen
-- Näkymä materialisoidaan, muuten kosken suoritedataa vasten raportoiminen koettelisi ms-alustan suorituskykyä.



truncate table [dw].[d_amos_spl_organisaatio_linkki]

insert into [dw].[d_amos_spl_organisaatio_linkki]

select 
  ps_toimipiste_oid, 
  oo_koulutustoimija_oid, 
  fuusiota_edeltava_ytunnus, 
  m.koul_jarj as amos_spl_master_ytunnus,
  ol_organisaatio_koodi, 
  ol2.organisaatio_fi as ol_organisaatio_fi, 
  ol2.kunta_koodi, 
  al.kunta_fi, 
  al.maakunta_fi, 
  al.ely_fi, 
  al.avi_fi,
  rank() over (partition by ps_toimipiste_oid order by oo_koulutustoimija_oid) as rnk_tp
  ,rank() over (partition by oo_koulutustoimija_oid order by ps_toimipiste_oid) as rnk_kt
from 
  (
    select 
      distinct t1.ps_toimipiste_oid, 
      t1.oo_koulutustoimija_oid, 
      CASE WHEN aol.uusi_ytunnus IS NOT NULL THEN aol.uusi_ytunnus ELSE t1.ol_organisaatio_koodi END AS ol_organisaatio_koodi, 
      aol.poistuva_ytunnus as fuusiota_edeltava_ytunnus 
    from 
      (
        SELECT
          distinct 
		  ps.toimipiste_oid as ps_toimipiste_oid, 
          oo.koulutustoimija_oid as oo_koulutustoimija_oid, 
          ol.organisaatio_koodi as ol_organisaatio_koodi 
        FROM 
          Koski_SA.sa.sa_koski_paatason_suoritus AS ps 
          INNER JOIN Koski_SA.sa.sa_koski_opiskeluoikeus AS oo ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
          INNER JOIN ANTERO.dw.d_organisaatioluokitus AS ol ON oo.koulutustoimija_oid = ol.organisaatio_oid
      ) t1 
      LEFT JOIN [dw].[d_amos_rajapinta_organisaatioliitokset] AS aol ON t1.ol_organisaatio_koodi = aol.poistuva_ytunnus --where aol.poistuva_ytunnus is not null
      ) t2 
  INNER JOIN ANTERO.dw.d_organisaatioluokitus AS ol2 ON ol2.organisaatio_koodi = t2.ol_organisaatio_koodi 
  INNER JOIN ANTERO.dw.d_alueluokitus as al on ol2.kunta_koodi = al.kunta_koodi 
--liputetaan master
  LEFT JOIN [ANTERO].[sa].[sa_amos_siirtotiedosto_okm8] m ON ol2.organisaatio_koodi=m.koul_jarj


