USE [ANTERO]
GO
/****** Object:  View [dw].[v_haku_ja_valinta_kk_ytl]    Script Date: 24.6.2020 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_haku_ja_valinta_kk_ytl]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dw].[v_haku_ja_valinta_kk_ytl] AS

WITH yo_hakenut_2_seuraavalla_kaudella AS (

	SELECT 
		 ylioppilastutkinnon_suoritusvuosi
		,d_kausi_ylioppilastutkinto_id
		,d_sukupuoli_id
		,d1.koulutussektori_fi
		,henkilo_oid
		,ensisijainen_hakija = max(case when hakutoive=1 then 1 else 0 end)
		,valittu = max(case when f.valinnan_tila IN (''HYVAKSYTTY'',''VARASIJALTA_HYVAKSYTTY'',''PERUNUT'') then 1 else 0 end)
		,vastaanottanut = max(case when f.vastaanoton_tila IN (''VASTAANOTTANUT_SITOVASTI'',''EHDOLLISESTI_VASTAANOTTANUT'') then 1 else 0 end)
	FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_korkea_aste] f
	left join dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_hakukohde_id
	left join dw.d_kausi d2 on d2.id = f.d_kausi_ylioppilastutkinto_id
	left join dw.d_kausi d3 on d3.id = f.d_kausi_koulutuksen_alkamiskausi_id
	--valitaan vain henkilöt jotka ovat ylioppilaaksi valmistumisen jälkeen hakeneet kahden seuraavan kauden aikana
	WHERE (
		case
			when d2.koodi = ''S'' and f.koulutuksen_alkamisvuosi = f.ylioppilastutkinnon_suoritusvuosi+1 then 1 
			when d2.koodi = ''K'' and ((f.koulutuksen_alkamisvuosi = f.ylioppilastutkinnon_suoritusvuosi and d3.koodi = ''S'') or
									 (f.koulutuksen_alkamisvuosi = f.ylioppilastutkinnon_suoritusvuosi+1 and d3.koodi = ''K'')) then 1
			else 0
		end
	) = 1
	and d1.koulutussektori_koodi != ''-1''
	GROUP BY  
		 ylioppilastutkinnon_suoritusvuosi
		,d_kausi_ylioppilastutkinto_id
		,d_sukupuoli_id
		,d1.koulutussektori_fi	
		,henkilo_oid
)

SELECT
	 [Suoritusvuosi (ylioppilastutkinto)] = vuosi
	,[Suorituskausi (ylioppilastutkinto)] = d1.selite_fi
	,[Sukupuoli] = d2.sukupuoli_fi
	,[Sektori (hakukohde)] = t2.koulutussektori_fi
	,Q.yo
	,henkilo_oid
	,t2.ensisijainen_hakija
	,t2.valittu
	,t2.vastaanottanut
FROM (
	SELECT 
		[vuosi]
		,t1.d_kausi_id
		,t1.d_sukupuoli_id
		,yo = count(distinct [opiskelijaID])
	FROM [ANTERO].[dw].[f_ytl_arvosanat] t1
	GROUP BY  
		 vuosi
		,t1.d_kausi_id
		,t1.d_sukupuoli_id
) Q
left join dw.d_kausi d1 on d1.id = Q.d_kausi_id
left join dw.d_sukupuoli d2 on d2.id = Q.d_sukupuoli_id
left join yo_hakenut_2_seuraavalla_kaudella t2 on t2.d_sukupuoli_id = Q.d_sukupuoli_id and t2.ylioppilastutkinnon_suoritusvuosi = Q.vuosi and t2.d_kausi_ylioppilastutkinto_id = Q.d_kausi_id
WHERE d2.sukupuoli_koodi != ''-1''

' 
