USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat]    Script Date: 31.3.2021 13:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat] AS


DROP TABLE IF EXISTS [dbo].[opiskelijavuodet_valitaulu_unpivot_luvat]

SELECT 
	q.*
	,lupa_koulutus = 
		case	
			when d21.kytkin_koodi = 0 or q.koulutusmuoto_pihvi = 'lukiokoulutus' or (year(q.alkamispaiva) < 2018 and coalesce(nullif(d11b.koulutusastetaso2_koodi,'-1'),d11a.koulutusastetaso2_koodi) in ('33','41')) then 1
			else 
				case
					when v1.jarjestajaYtunnus is null and q.koulk = '999903' then 9
					when v1.jarjestajaYtunnus is null and q.koulk = '999901' then 8
					when q.muu_ammatillinen_tarkenne = '94095' and q.oppis = 1 and v2.valmistava = 0 then 7
					when q.muu_ammatillinen_tarkenne = '94095' and q.oppis = 0 and v2.valmistava = 0 then 6
					when q.muu_ammatillinen_tarkenne = '94090' and q.oppis = 1 and v2.laaja_oppis = 0 then 5
					when q.muu_ammatillinen_tarkenne = '94090' and q.oppis = 0 and v2.laaja_oppis = 0 then 4
					when v1.jarjestajaYtunnus is null and q.muu_ammatillinen_tarkenne is null and q.oppis = 1 and v2.laaja_oppis = 0 then 3
					when v1.jarjestajaYtunnus is null and q.muu_ammatillinen_tarkenne is null and q.oppis = 0 then 2
					else 1
				end
		end
	,lupa_majoitus = 
		case
			when d21.kytkin_koodi = 0 then 1
			else
				case
					when q.majoitus = 3 and v2.sisaoppilaitosmuotoinen = 0 then 2
					else 1
				end
		end
	,lupa_korotustekija = 
		case 
			when d21.kytkin_koodi = 0 then 1
			else
				case
					when d10.kytkin_koodi = '1' and d11a.tutkintotyyppi_koodi in ('19','20') and v2.tyovoima = 0 then 2
					when d8.kytkin_koodi = '1' and v2.vankila = 0 then 3
					when d5.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 then 4
					else 1
				end
		end
	,verrataan_lupatietoihin = d21.kytkin_koodi
	,lupa_koulutus_jarj = v1.jarjestaja_nimi
	,lupa_koulutus_laaja_oppis = v2.laaja_oppis

INTO [dbo].[opiskelijavuodet_valitaulu_unpivot_luvat]

FROM [dbo].[opiskelijavuodet_valitaulu_unpivot] q
LEFT JOIN ANTERO.dw.d_erityisopetus d5 ON d5.erityisopetus_koodi = q.erityisopetus
LEFT JOIN ANTERO.dw.d_kytkin d8 ON d8.kytkin_koodi = q.vankilaopetus
LEFT JOIN ANTERO.dw.d_kytkin d10 ON d10.kytkin_koodi = q.tyovoimakoulutus
LEFT JOIN ANTERO.dw.d_koulutusluokitus d11a ON d11a.koulutusluokitus_koodi = q.koulk
LEFT JOIN ANTERO.dw.d_koulutusluokitus d11b ON d11b.koulutusluokitus_koodi = q.koulk_pihvi
LEFT JOIN ANTERO.dw.d_kytkin d25 ON d25.kytkin_koodi = (case when q.jarj_oid_pihvi is null then 0 else 1 end)
--LINKITYS LUPATIETOIHIN ALKAA
LEFT JOIN ANTERO.dw.d_kytkin d21 ON d21.kytkin_koodi = 
(
	case 
		when (d11a.tutkintotyyppi_koodi = '02' and q.alkamispaiva >= '2018-08-01') or (d11a.tutkintotyyppi_koodi in ('19','20') and q.alkamispaiva >= '2019-01-01') then 1
		else 0 --tähän 1 jos vertailu halutaan tehdä kaikille opiskeluoikeuksille
	end
)
LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki sjl ON sjl.oid_avain = coalesce(q.jarj_oid_pihvi_hist, q.jarj_oid_pihvi, q.jarj_oid_hist, q.jarj_oid)
--tutkinto-oikeudet
LEFT JOIN ANTERO.sa.sa_amos_oiva_tutkinto_oikeudet v1 ON (tilv_date between v1.alkupvm and coalesce(v1.siirtymapaattyy,v1.loppupvm)) 
	and coalesce(nullif(d11b.koulutusluokitus_fi,'Tieto puuttuu'),d11a.koulutusluokitus_fi) in (v1.tutkinto_nimi1, v1.tutkinto_nimi2, v1.tutkinto_nimi3, v1.tutkinto_nimi4, v1.tutkinto_nimi5)
	and v1.jarjestajaYtunnus = 
	(
		case 
			when tilv_date < sjl.voimaan_alkaen then sjl.ytunnus_avain
			else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
		end
	)
--muut oikeudet
LEFT JOIN ANTERO.sa.v_amos_oiva_muut_oikeudet v2 ON tilv_date between v2.alkupvm and v2.loppupvm 
	and v2.jarjestajaYtunnus =
	(
		case 
			when tilv_date < sjl.voimaan_alkaen then sjl.ytunnus_avain
			else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
		end
	)


GO
USE ANTERO