USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat]    Script Date: 16.7.2020 14:06:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat] AS

-- truncate table f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat
-- insert into f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat select * from v_f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat

SELECT
	 tilastointivuosi = tilv
	,tilv_date = tilv_date
	,lahde = lahde
	,oppilaitos = tunn
	,koulutuksen_jarjestaja = jarj
	,oppisopimuskoulutuksen_jarjestaja = opjarj
	,koulutusluokitus = koulk
	,sukupuoli = sp
	,aidinkieli_versio1 = aikielir1
	,syntymavuosi = syntv
	,syntymakuukausi = synkk
	,kirjoihintulovuosi = alvv
	,kirjoihintulokausi = allk
	,lukumaara = lkm
	,nuorten_aikuisten_koulutus = aikoul
	,ammatillisen_koulutuksen_koulutuslaji = tutklaja
	,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus = tutktav
	,opetushallinnon_koulutus = ophal
	,tietolahde = tietolahde
	,rivinumero = rivinumero
-- johdetut
	,aineistotunnus = '3.14'
	,koulutussektori = cast(
	(
		case
		when lahde = '*1' then '1'
		when lahde in ('21','22','23') then '2'
		when lahde in ('31','32','33','34','35') then '3'
		when lahde in ('41','42') then '4'
		when lahde in ('51','52') then '5'
		end
	)
	as nvarchar(2))
	,koulutuksen_jarjestamismuoto = cast(
	(
		case
		when lahde in ('31','32','33','35') then '1'
		when lahde in ('34') then '2'
		end
	)
	as nvarchar(2))
	,ammatillinen_peruskoulutus_lisakoulutus = cast(
	(
		case
		when tutklaja /*ammatillisen_koulutuksen_koulutuslaji*/ = '1' then '1'
		when tutklaja /*ammatillisen_koulutuksen_koulutuslaji*/ in ('2','3') then '2'
		end
	)
	as nvarchar(2))
	,ika_1v = CAST(
	(
		case
		when isnumeric(syntv)=1 and syntv<tilv
		then cast(cast(tilv as int) - cast(syntv as int) as varchar)
		end
	)
	as nvarchar(4))
	,aloittaneet = CAST(
	(
		case when alvv /*kirjoihintulovuosi*/=tilv /*tilastointivuosi*/ then lkm /*lukumaara*/ end
	)
	as int)
	,opiskelijat = cast(
	(
		lkm /*lukumaara*/
	)
	as int)

	,koulutuslaji_OKM_avain =
		CASE
			WHEN aikoul = '1' THEN 3 --Lukiokoulutus (nuorten koulutus)
			WHEN aikoul = '2' THEN 4 --Lukiokoulutus (aikuiskoulutus)
			WHEN tutklaja = 2 AND lahde in ('31','32','33','35') THEN 7 --Ammattitutkinto (oppilaitosmuotoinen)
			WHEN tutklaja = 3 AND lahde in ('31','32','33','35') THEN 8 --Erikoisammattitutkinto  (oppilaitosmuotoinen)
			WHEN tutklaja = 2 AND lahde = '34' THEN 11 --Ammattitutkinto (oppisopimuskoulutus)
			WHEN tutklaja = 3 AND lahde = '34' THEN 12 --Erikoisammattitutkinto (oppisopimuskoulutus)			
			--tutktav poistui lain muuttuessa 2018
			WHEN tutklaja = 1 AND lahde in ('31','32','33','35') THEN 61 --Ammatillinen perustutkinto (oppilaitosmuotoinen)
			WHEN tutklaja = 1 AND lahde = '34' THEN 64 --Ammatillinen perustutkinto (oppisopimuskoulutus)
			ELSE -1
		END

FROM VipunenTK_DW.dbo.[sa_3_14_Lukio_ja_amm_opisk_mediaani_iat]




GO


USE [ANTERO]