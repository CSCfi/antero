USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_spl_jarjestaja_linkki]    Script Date: 29.10.2019 10:05:09 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_amos_spl_jarjestaja_linkki]
GO
/****** Object:  Table [dw].[d_amos_spl_jarjestaja_linkki]    Script Date: 29.10.2019 10:05:09 ******/
DROP TABLE IF EXISTS [dw].[d_amos_spl_jarjestaja_linkki]
GO
/****** Object:  Table [dw].[d_amos_spl_jarjestaja_linkki]    Script Date: 29.10.2019 10:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_spl_jarjestaja_linkki]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amos_spl_jarjestaja_linkki](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[oid_avain] [varchar](max) NULL,
	[ytunnus_avain] [varchar](20) NULL,
	[oid_amos_spl] [varchar](200) NULL,
	[ytunnus_amos_spl] [varchar](10) NULL,
	[nimi_amos_spl] [nvarchar](255) NULL,
	[sisaltyy_amos_spl] [int] NOT NULL,
	[kunta_koodi] [varchar](5) NULL,
	[nimi_ennen_fuusiota] [nvarchar](255) NULL,
 CONSTRAINT [PK_d_amos_spl_organisaatio_linkki] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_spl_jarjestaja_linkki]    Script Date: 29.10.2019 10:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_amos_spl_jarjestaja_linkki]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_amos_spl_jarjestaja_linkki] AS' 
END
GO




ALTER PROCEDURE [dw].[p_lataa_d_amos_spl_jarjestaja_linkki] AS


--DROP TABLE [dw].[d_amos_spl_jarjestaja_linkki]
TRUNCATE TABLE [dw].[d_amos_spl_jarjestaja_linkki]

INSERT INTO [dw].[d_amos_spl_jarjestaja_linkki]


SELECT DISTINCT
	 oid_avain = koulutustoimija_oid
	,ytunnus_avain = coalesce(nykyinen_ytunnus, uusi_ytunnus, st8.koul_jarj)
	,oid_amos_spl = case when st8.koul_jarj is not null then d.organisaatio_oid else null end
	,ytunnus_amos_spl = st8.koul_jarj
	,nimi_amos_spl = coalesce(st8.organisaatio_fi, nykyinen_nimi)
	,sisaltyy_amos_spl = case when st8.koul_jarj is not null then 1 else 0 end
	,kunta_koodi = d.kunta_koodi
	,nimi_ennen_fuusiota = case when nykyinen_ytunnus is not null then nykyinen_nimi else null end

--INTO [dw].[d_amos_spl_jarjestaja_linkki]

FROM (

	SELECT DISTINCT
		 koulutustoimija_oid = oo.koulutustoimija_oid
		,nykyinen_ytunnus = vanha
		,nykyinen_nimi = ol.organisaatio_fi
		,uusi_ytunnus = coalesce(uusi, ol.organisaatio_koodi)
		,uusi_nimi
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus AS oo 
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus ol ON oo.koulutustoimija_oid = ol.organisaatio_oid
	LEFT JOIN (
		SELECT DISTINCT 
			vanha = left(vanha,9)
			,uusi = left(uusi,9)
			,uusi_nimi = nullif(rtrim(ltrim(right(uusi,len(uusi)-9))),'')
		FROM ANTERO.sa.sa_amos_siirtotiedosto_okm1
	) st1 ON st1.vanha = ol.organisaatio_koodi

	WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'

) Q
--suoritepäätöslaskentaan kuuluvat järjestäjät, myös ne joita ei löydy Kosken datasta
FULL OUTER JOIN [ANTERO].[sa].[sa_amos_siirtotiedosto_okm8] st8 ON Q.uusi_ytunnus = st8.koul_jarj
--haetaan järjestäjän oid 
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d ON d.organisaatio_koodi = coalesce(st8.koul_jarj, Q.uusi_ytunnus)

ORDER BY coalesce(st8.organisaatio_fi, nykyinen_nimi)

