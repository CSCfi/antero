USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_kk_ytl]    Script Date: 5.2.2026 8.39.10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   VIEW [dw].[v_haku_ja_valinta_kk_ytl] AS


WITH yo_hakenut_2_seuraavalla_kaudella AS (

	SELECT
		 d2.vuosi as ylioppilastutkinnon_suoritusvuosi
		,case when d2.lukukausi_fi = 'Syksy' then 'S' else 'K' end as ylioppilastutkinnon_kausi
		,d_sukupuoli_id
		,d1.koulutussektori_fi
		,master_oid as henkilo_oid
		,case
			when d2.lukukausi_fi = 'Syksy' and f.koulutuksen_alkamisvuosi = d2.vuosi + 1 and d3.koodi = 'K' then 1
			when d2.lukukausi_fi = 'Kevät' and f.koulutuksen_alkamisvuosi = d2.vuosi and d3.koodi = 'S' THEN 1
			else 2
		end as kaudet
		,ensisijainen_hakija = max(case when hakutoive=1 then 1 else 0 end)
		,valittu = max(f.valittu)
		,vastaanottanut = max(f.vastaanottanut_paikan)
	FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_korkea_aste] f
	left join dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
	left join dw.d_kalenteri d2 on d2.id = f.d_kalenteri_ylioppilastutkinnon_suorituspaivamaara_id
	left join dw.d_kausi d3 on d3.id = f.d_kausi_koulutuksen_alkamiskausi_id
	WHERE (
		case
			when d2.lukukausi_fi = 'Syksy' and f.koulutuksen_alkamisvuosi = d2.vuosi + 1 then 1 
			when d2.lukukausi_fi = 'Kevät' and ((f.koulutuksen_alkamisvuosi = d2.vuosi and d3.koodi = 'S') or
									 (f.koulutuksen_alkamisvuosi = d2.vuosi+1 and d3.koodi = 'K')) then 1
			else 0
		end
	) = 1
	and d1.koulutussektori_koodi != '-1'
	GROUP BY  
		 d2.vuosi
		,d2.lukukausi_fi
		,d_sukupuoli_id
		,d1.koulutussektori_fi	
		,master_oid
		,case
			when d2.lukukausi_fi = 'Syksy' and f.koulutuksen_alkamisvuosi = d2.vuosi + 1 and d3.koodi = 'K' then 1
			when d2.lukukausi_fi = 'Kevät' and f.koulutuksen_alkamisvuosi = d2.vuosi and d3.koodi = 'S' THEN 1
			else 2
		end
)

SELECT
	 [Suoritusvuosi (ylioppilastutkinto)] = vuosi
	,[Suorituskausi (ylioppilastutkinto)] = d1.selite_fi
	,[Sukupuoli] = d2.sukupuoli_fi
	,[Sektori (hakukohde)] = t2.koulutussektori_fi
	,Q.yo
	,henkilo_oid
	,t2.ensisijainen_hakija
	,case 
		when t2.kaudet = 1 THEN 'Täysin välitön siirtyminen' 
		else 'Ei täysin välitön siirtyminen (yksi hakukerta välissä)' 
	end as 'Välitön siirtyminen'
	,valittu = case when getdate() >= d100.valitut then t2.valittu else 0 end
	,vastaanottanut = case when getdate() >= d100.vastaanottaneet then t2.vastaanottanut else 0 end
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
LEFT JOIN dw.d_kausi d1 on d1.id = Q.d_kausi_id
LEFT JOIN dw.d_sukupuoli d2 on d2.id = Q.d_sukupuoli_id
LEFT JOIN yo_hakenut_2_seuraavalla_kaudella t2 on t2.d_sukupuoli_id = Q.d_sukupuoli_id and t2.ylioppilastutkinnon_suoritusvuosi = Q.vuosi and t2.ylioppilastutkinnon_kausi = d1.koodi
--valitut ja vastaanottaneet näytetään vasta kun tiedot ovat lopullisia
LEFT JOIN (

	SELECT
		koulutuksen_alkamisvuosi
		,valitut=max(valitut)
		,vastaanottaneet=max(vastaanottaneet)
	FROM (
		SELECT distinct
			 d.haku_oid
			,d.haun_nimi_fi
			,f.koulutuksen_alkamisvuosi
		FROM dw.f_haku_ja_valinta_hakeneet_korkea_aste f
		JOIN dw.d_haku d on d.id = f.d_haku_id
		JOIN dw.d_kausi d2 on d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
		WHERE d.korkeakouluhaku=1 and d.hakutapa_koodi = '01' and d.hakutyyppi_koodi = '01' and d2.koodi = 'S'
	) Q
	LEFT JOIN (
		SELECT 
			haku_oid
			,valitut=max(valitut)
			,vastaanottaneet=max(vastaanottaneet)
		FROM sa.sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt
		WHERE haku_oid is not null
		GROUP BY haku_oid
	) h on h.haku_oid = Q.haku_oid
	GROUP BY koulutuksen_alkamisvuosi

) d100 on d100.koulutuksen_alkamisvuosi = Q.vuosi

WHERE d2.sukupuoli_koodi != '-1'