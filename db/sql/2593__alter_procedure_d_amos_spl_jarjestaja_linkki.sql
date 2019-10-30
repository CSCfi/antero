USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_spl_jarjestaja_linkki]    Script Date: 29.10.2019 17:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_d_amos_spl_jarjestaja_linkki] AS

DECLARE @maxVoimaan8 as date
SET @maxVoimaan8 = (SELECT MAX(voimaan_alkaen) FROM ANTERO.sa.sa_amos_siirtotiedosto_okm8)


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
	,nimi_ennen_fuusiota = case when fuusio = 1 then nykyinen_nimi else null end


FROM (

	SELECT DISTINCT
		 koulutustoimija_oid = oo.koulutustoimija_oid
		,nykyinen_ytunnus = vanha
		,nykyinen_nimi = ol.organisaatio_fi
		,uusi_ytunnus = coalesce(uusi, ol.organisaatio_koodi)
		,uusi_nimi
		,fuusio = case when uusi is not null then 1 else 0 end
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
FULL OUTER JOIN (SELECT * FROM [ANTERO].[sa].[sa_amos_siirtotiedosto_okm8] WHERE voimaan_alkaen = @maxVoimaan8 ) st8 ON Q.uusi_ytunnus = st8.koul_jarj
--haetaan järjestäjän oid 
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d ON d.organisaatio_koodi = coalesce(st8.koul_jarj, Q.uusi_ytunnus)

ORDER BY coalesce(st8.organisaatio_fi, nykyinen_nimi)

