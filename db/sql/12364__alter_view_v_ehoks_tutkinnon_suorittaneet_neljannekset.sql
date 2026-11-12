USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_ehoks_tutkinnon_suorittaneet_neljannekset] AS

SELECT 
	[oppija_oid] = HASHBYTES('SHA2_256', vs.salt + f.oppija_oid)
	,[opiskeluoikeus_oid] = HASHBYTES('SHA2_256', vs.salt + f.opiskeluoikeus_oid)

	,[Koulutuksen alkamisvuosi] = [alkamisvuosi]
	,[Koulutuksen päättymisvuosi] = year(vahvistuspaiva)
	,[Koulutuksen järjestäjä] = d10.organisaatio_fi
	,[Koulutuksen järjestäjän kunta] = d10a.kunta_fi
	,[Koulutuksen järjestäjän maakunta] = d10a.maakunta_fi

	,[Osaamisen hankkimistapa] = d5.selite_fi
	,[Osaamisen hankkimistavat] = d4.selite_fi
	,[Työpaikka] = coalesce(d14.toiminimi,'Tieto puuttuu')
	,[Työnantajan toimiala, taso 1] = d11.taso_1_selite_fi
	,[Työnantajan toimiala, taso 2] = d11.taso_2_selite_fi

	,[Tutkintotyypin ryhmä] = 
		case 
			when d1.tutkintotyyppi_koodi = '-1' and d9.koodi = '3' then 'Tieto puuttuu (tutkinnon osaa pienempi kokonaisuus)' 
			when d24.kytkin_koodi = 1 then (select distinct tutkintotyypin_ryhma_fi from [ANTERO].[dw].[d_koulutusluokitus] where tutkintotyypin_ryhma_koodi = '09') 
			else d1.tutkintotyypin_ryhma_fi 
		end
	,[Tutkintotyyppi] = 
		case 
			when d1.tutkintotyyppi_koodi = '-1' and d9.koodi = '3' then 'Tieto puuttuu (tutkinnon osaa pienempi kokonaisuus)' 
			when d1.koulutusluokitus_fi like '%VALMA%' then 'VALMA' 
			when d1.koulutusluokitus_fi like '%TELMA%' then 'TELMA' 
			when d24.kytkin_koodi =  1 then (select distinct tutkintotyypin_ryhma_fi from [ANTERO].[dw].[d_koulutusluokitus] where tutkintotyypin_ryhma_koodi = '09') 
			else d1.tutkintotyyppi_fi 
		end
	,[Koulutusala, taso 1] = d1.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d1.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d1.koulutusalataso3_fi
	,[Tutkinto] = d1.koulutusluokitus_fi
	,[Suorituksen tyyppi] = d9.selite_fi

	,[Sukupuoli] = d2.sukupuoli_fi
	,[Ikä, alkamisvuonna] = d3.ika_fi
	,[Ikäryhmä, alkamisvuonna] = d3.ikaryhma3_fi

	,[Neljännes] = concat(f.[neljannes],'. neljännes opiskeluajasta')
	,[neljanneksen_kesto] = f.neljannes_paivat
	,paivat
	,opiskeluoikeuden_kesto_paivia
	,[Kesto kuukausina] =  floor(paivat / 30.5)
	,[Kesto viikkoina] = floor(paivat / 7.0)
	,[Oppisopimuskoulutuksen osuus] = 
		case 
			when f.oppisopimuksen_osuus < 0.25 then '0 - 25 %'
			when f.oppisopimuksen_osuus < 0.50 then '25 - 50 %'
			when f.oppisopimuksen_osuus < 0.75 then '50 - 75 %'
			else '75 - 100 %'
		end
	,[Koulutussopimuskoulutuksen osuus] = 
		case 
			when f.koulutussopimuksen_osuus < 0.25 then '0 - 25 %'
			when f.koulutussopimuksen_osuus < 0.50 then '25 - 50 %'
			when f.koulutussopimuksen_osuus < 0.75 then '50 - 75 %'
			else '75 - 100 %'
		end
	--,[Aika aloittamisesta jakson alkuun (kk)] = f.aika_aloittamisesta_sopimusjaksoon_kk
	--,[Työpaikkajaksojen lkm] = f.tyopaikkajaksojen_lkm

	,[lkm] = 1
	--,[sopimusten_lkm_opiskeluoikeudessa]
    --,[sopimusten_lkm_opiskeluoikeus_yritys]

	--koodit
	,[Koodit Koulutuksen järjestäjä] = d10.organisaatio_koodi
	,[Koodit Työpaikka] = f.tyopaikan_ytunnus

	--järjestykset
	,[järjestys Tutkintotyyppi] = case when d24.kytkin_koodi =  1 then 98 else d1.jarjestys_tutkintotyyppi_koodi end
	,[järjestys Koulutusala, taso 1] = d1.jarjestys_koulutusalataso1_koodi
	,[järjestys Koulutusala, taso 2] = d1.jarjestys_koulutusalataso2_koodi
	,[järjestys Koulutusala, taso 3] = d1.jarjestys_koulutusalataso3_koodi
	,[järjestys Suorituksen tyyppi] = d9.jarjestys
	,[jarjestys Neljannes] = f.neljannes
	,[järjestys Osaamisen hankkimistapa] = d5.jarjestys
	,[järjestys Osaamisen hankkimistavat] = d4.jarjestys

FROM [ANTERO].[dw].[f_ehoks_tutkinnon_suorittaneet_neljannekset] f
LEFT JOIN dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_sukupuoli d2 on d2.id = f.d_sukupuoli_id
LEFT JOIN dw.d_ika d3 on d3.id = f.d_ika_alkamisvuonna_id
LEFT JOIN dw.d_osaamisen_hankkimistavat d4 on d4.id = f.d_osaamisen_hankkimistavat_id
LEFT JOIN dw.d_osaamisen_hankkimistapa d5 on d5.id = f.d_osaamisen_hankkimistapa_id
LEFT JOIN dw.d_suorituksen_tyyppi d9 on d9.id = f.d_suorituksen_tyyppi_id
LEFT JOIN dw.d_organisaatioluokitus d10 on d10.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_alueluokitus d10a on d10a.kunta_koodi = d10.kunta_koodi
LEFT JOIN dw.d_toimialaluokitus2008 d11 on d11.id = f.d_toimiala_id
LEFT JOIN dw.d_ytj_yritystiedot d14 on d14.ytunnus=f.tyopaikan_ytunnus
LEFT JOIN dw.d_kytkin d24 on d24.id = f.d_kytkin_muu_ammatillinen_id
JOIN dbo.view_salt vs on vs.[view] = 'v_ehoks_tutkinnon_suorittaneet_neljannekset'

GO
