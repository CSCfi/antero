USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_spl_jarjestaja_linkki]    Script Date: 7.11.2022 17:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_amos_spl_jarjestaja_linkki] AS



IF NOT EXISTS (select * from dw.d_amos_spl_jarjestaja_linkki where id=-1) 
BEGIN
	SET IDENTITY_INSERT dw.d_amos_spl_jarjestaja_linkki ON;
	INSERT INTO dw.d_amos_spl_jarjestaja_linkki (
		id
		,oid_avain
		,ytunnus_avain
		,oid_amos_spl
		,ytunnus_amos_spl
		,nimi_amos_spl
		,sisaltyy_amos_spl
		,kunta_koodi
		,nimi_ennen_fuusiota
		,voimaan_alkaen
		,source
	)
	SELECT
		-1
		,koodi
		,koodi
		,koodi
		,koodi
		,nimi
		,koodi
		,koodi
		,nimi
		,'1900-01-01'
		,'etl: p_lataa_d_amos_spl_jarjestaja_linkki'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta' and koodi='-1'
END

ELSE BEGIN
	UPDATE d SET
		oid_avain = s.koodi
		,ytunnus_avain = s.koodi
		,oid_amos_spl = s.koodi
		,ytunnus_amos_spl = s.koodi
		,nimi_amos_spl = s.nimi
		,sisaltyy_amos_spl = s.koodi
		,kunta_koodi = s.koodi
		,nimi_ennen_fuusiota = s.nimi
		,voimaan_alkaen = '1900-01-01'
		,source = 'etl: p_lataa_d_amos_spl_jarjestaja_linkki'
	FROM dw.d_amos_spl_jarjestaja_linkki d
	join sa.sa_koodistot s on s.koodi=d.oid_avain
	WHERE s.koodisto='vipunenmeta'
	and s.koodi='-1'

END
SET IDENTITY_INSERT dw.d_amos_spl_jarjestaja_linkki OFF;

;WITH kysely AS (
	SELECT DISTINCT
		oid_avain = d2.organisaatio_oid
		,ytunnus_avain = coalesce(okm8.koul_jarj, st1.vanha_ytunnus)
		,oid_amos_spl = case when ca1.sisaltyy = 1 then d1.organisaatio_oid end
		,ytunnus_amos_spl = case when ca1.sisaltyy = 1 then d1.organisaatio_koodi end
		,nimi_amos_spl = coalesce(nullif(d3.toiminimi,'Tieto puuttuu'), d1.organisaatio_fi)
		,sisaltyy_amos_spl = ca1.sisaltyy
		,kunta_koodi = d1.kunta_koodi
		,nimi_ennen_fuusiota = case when coalesce(st1.lopettanut,1) = 0 then coalesce(nullif(d4.toiminimi,'Tieto puuttuu'), d2.organisaatio_fi) end
		,voimaan_alkaen = st1.voimaan_alkaen 
		,source = 'etl: p_lataa_d_amos_spl_jarjestaja_linkki'
	FROM sa.sa_amos_siirtotiedosto_okm8 okm8
	LEFT JOIN dw.d_organisaatioluokitus ol ON ol.organisaatio_koodi = okm8.koul_jarj
	FULL JOIN (
		SELECT DISTINCT 
			vanha_ytunnus = left(vanha, 9)
			,uusi_ytunnus = left(uusi, 9)
			,voimaan_alkaen
			,lopettanut = case when uusi is null then 1 else 0 end
		FROM sa.sa_amos_siirtotiedosto_okm1 s1
		--otetaan vain viimeisin fuusio
		where voimaan_alkaen = (select max(voimaan_alkaen) from sa.sa_amos_siirtotiedosto_okm1 s2 where left(s2.vanha,9) = left(s1.vanha,9))
	) st1 ON st1.vanha_ytunnus = okm8.koul_jarj
	LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = coalesce(st1.uusi_ytunnus, okm8.koul_jarj)
	LEFT JOIN dw.d_ytj_yritystiedot d3 ON d3.ytunnus = d1.organisaatio_koodi
	LEFT JOIN dw.d_ytj_yritystiedot d4 ON d4.ytunnus = st1.vanha_ytunnus
	LEFT JOIN dw.d_organisaatioluokitus d2 ON d2.organisaatio_koodi = coalesce(okm8.koul_jarj, st1.vanha_ytunnus)
	OUTER APPLY (select sisaltyy = case when (okm8.id is not null and st1.lopettanut is null) or st1.lopettanut = 0 then 1 else 0 end) ca1
)

MERGE dw.d_amos_spl_jarjestaja_linkki AS target
USING (
	
	SELECT distinct 
		oid_avain 
		,ytunnus_avain 
		,oid_amos_spl 
		,ytunnus_amos_spl 
		,nimi_amos_spl 
		,sisaltyy_amos_spl 
		,kunta_koodi 
		,nimi_ennen_fuusiota 
		,voimaan_alkaen
		,source
	FROM kysely

	UNION 

	SELECT distinct 
		oid_avain = sa.koulutustoimija_oid
		,ytunnus_avain = d2.organisaatio_koodi
		,oid_amos_spl = null
		,ytunnus_amos_spl = null
		,nimi_amos_spl = d2.organisaatio_fi
		,sisaltyy_amos_spl = 0
		,kunta_koodi = d2.kunta_koodi
		,nimi_ennen_fuusiota = null
		,voimaan_alkaen = null
		,d.source
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus sa
	LEFT JOIN kysely d on d.oid_avain = sa.koulutustoimija_oid
	LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_oid = sa.koulutustoimija_oid
	WHERE koulutusmuoto = 'ammatillinenkoulutus' and d.oid_avain is null

) AS src ON target.oid_avain = src.oid_avain and target.ytunnus_avain = src.ytunnus_avain

WHEN MATCHED
	THEN
		UPDATE SET 
			target.oid_avain = src.oid_avain
			,target.ytunnus_avain = src.ytunnus_avain
			,target.oid_amos_spl = src.oid_amos_spl
			,target.ytunnus_amos_spl = src.ytunnus_amos_spl
			,target.nimi_amos_spl = src.nimi_amos_spl
			,target.sisaltyy_amos_spl = src.sisaltyy_amos_spl
			,target.kunta_koodi = src.kunta_koodi
			,target.nimi_ennen_fuusiota = src.nimi_ennen_fuusiota
			,target.voimaan_alkaen = src.voimaan_alkaen
			,target.source = src.source

WHEN NOT MATCHED
	THEN 
		INSERT (
			oid_avain
			,ytunnus_avain
			,oid_amos_spl
			,ytunnus_amos_spl
			,nimi_amos_spl
			,sisaltyy_amos_spl
			,kunta_koodi
			,nimi_ennen_fuusiota
			,voimaan_alkaen
			,source
		)
		VALUES (
			src.oid_avain
			,src.ytunnus_avain
			,src.oid_amos_spl
			,src.ytunnus_amos_spl
			,src.nimi_amos_spl
			,src.sisaltyy_amos_spl
			,src.kunta_koodi
			,src.nimi_ennen_fuusiota
			,src.voimaan_alkaen
			,src.source
		);