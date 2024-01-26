USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 28.9.2023 21:35:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_koski_hakeutumisvelvolliset_opiskelutiedot] AS

DECLARE @max_ajankohta date = (select max([ajankohta]) as max_ajankohta from [dw].[f_koski_oppivelvolliset])

DROP TABLE IF EXISTS dw.f_koski_hakeutumisvelvolliset_opiskelutiedot

SELECT * INTO dw.f_koski_hakeutumisvelvolliset_opiskelutiedot
FROM
(
	SELECT DISTINCT
		f.oppija_oid
		--,[koodit_koulutusnimike_hv_opiskelutiedot] = coalesce(d6.koulutusluokitus_koodi, '-1')
		,f.oppivelvollisuuden_suorittamiseen_kelpaava_hv

		,max_ajankohta = @max_ajankohta
		,f.tilastovuosi
		
		--FI
		,opiskelun_tarkasteluhetki_fi = 
			case 
				when f.ajankohta = @max_ajankohta then 'Viimeisin / Ei vielä tarkastelua tilastovuonna'
				else concat(d11.kuukausi_fi, 'n ', day(f.ajankohta), '.') 
			end 
		,tayttanyt_18_v_opiskelun_tarkasteluhetki_fi = 
			case f.ika_18_tarkasteluhetkella_hv 
				when 1 then 'Kyllä' 
				when 0 then 'Ei / Ei vielä tarkastelua tilastovuonna' 
			end
		,opiskelutoiminta_opiskelun_tarkasteluhetki_fi = 
			case 
				when f.oppivelvollisuuden_suorittamiseen_kelpaava_hv = 1 then 'Opiskelee oppiv. suor. kelp. koulutuksessa'
				else 'Ei opiskele oppiv. suor. kelp. koulutuksessa / Ei vielä tarkastelua tilastovuonna'
			end
		,koulutustyyppi_opiskelun_tarkasteluhetki_fi = 
			coalesce(
				case
					when koulutusmoduuli_koodiarvo_hv = '301101' then 'Lukiokoulutus'
					when koulutusmoduuli_koodiarvo_hv in (/*'301101',*/'301102','301103','301104') then d6.koulutusluokitus_fi
					else d9.selite_fi			
				end
				,'Tieto puuttuu'
			)
		,koulutusmuoto_opiskelun_tarkasteluhetki_fi = d7.selite_fi
		,suorituksen_tyyppi_opiskelun_tarkasteluhetki_fi = d8.selite_fi
		
		--SV
		,opiskelun_tarkasteluhetki_sv = 
			case 
				when f.ajankohta = @max_ajankohta then 'Senaste / Har inte ännu granskats under statistikåret'
				else concat(day(f.ajankohta), ' ', d11.kuukausi_sv)
			end 
		,tayttanyt_18_v_opiskelun_tarkasteluhetki_sv = 
			case f.ika_18_tarkasteluhetkella_hv 
				when 1 then 'Ja' 
				when 0 then 'Nej / Har inte ännu granskats under statistikåret'
			end
		,opiskelutoiminta_opiskelun_tarkasteluhetki_sv = 
			case 
				when f.oppivelvollisuuden_suorittamiseen_kelpaava_hv = 1 then 'Studerar i utb. som är godtagbar för fullgörande av läroplikten'
				else 'Studerar inte i utb. som är godtagbar för fullgörande av läroplikten / Har inte ännu granskats under statistikåret'
			end
		,koulutustyyppi_opiskelun_tarkasteluhetki_sv = 
			coalesce(
				case
					when koulutusmoduuli_koodiarvo_hv = '301101' then 'Gymnasieutbildning'
					when koulutusmoduuli_koodiarvo_hv in (/*'301101',*/'301102','301103','301104') then d6.koulutusluokitus_sv
					else d9.selite_sv			
				end
				,'Information saknas'
			)
		,koulutusmuoto_opiskelun_tarkasteluhetki_sv = d7.selite_sv
		,suorituksen_tyyppi_opiskelun_tarkasteluhetki_sv = d8.selite_sv

		--JARJESTYS
		,[jarjestys_opiskelun_tarkasteluhetki] = concat(10+month(f.ajankohta), 10+day(f.ajankohta))
		,[jarjestys_koulutusmuoto_opiskelun_tarkasteluhetki] = d7.jarjestys
		,[jarjestys_suorituksen_tyyppi_opiskelun_tarkasteluhetki] = d8.jarjestys

	FROM [dw].[f_koski_oppivelvolliset] f 
	LEFT JOIN [dw].[d_koulutusluokitus] d6 on d6.koulutusluokitus_koodi = f.koulutusmoduuli_koodiarvo_hv
	LEFT JOIN [dw].[d_koski_koulutusmuoto] d7 on d7.koodi = f.koulutusmuoto_hv
	LEFT JOIN [dw].[d_koski_suorituksen_tyyppi] d8 on d8.koodi = f.suorituksen_tyyppi_hv
	LEFT JOIN [dw].[d_koulutustyyppi] d9 on d9.koodi = d6.koulutustyyppi_koodi
	LEFT JOIN [dw].[d_kalenteri] d11 on d11.kalenteri_avain = f.ajankohta

	WHERE 1=1
	AND f.tilastovuosi > year(getdate()) - 4
	AND (f.tilastokuukausi between 9 and 12 OR /*syyslukukauden livetieto*/ f.ov_kuutioon = 0)

) q

GO
