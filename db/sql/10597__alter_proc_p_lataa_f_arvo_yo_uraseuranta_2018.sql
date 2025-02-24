USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_yo_uraseuranta_2018]    Script Date: 24.2.2025 12.12.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   PROCEDURE [dw].[p_lataa_f_arvo_yo_uraseuranta_2018] AS

TRUNCATE TABLE ANTERO.dw.f_arvo_yo_uraseuranta_2018

INSERT INTO ANTERO.dw.f_arvo_yo_uraseuranta_2018
(
	 [d_ika_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_maatjavaltiot2_kansalaisuus_id]
	,[d_koulutusluokitus_id]
	,[d_virta_rahoituslahde_id]
	,[d_arvokysymys_id]
	,[kyselypohja]
	,[kyselyvuosi]
	,[rahoitusmallikysymys]
	,[rahoituskysymys_paino]
	,[Monivalintavaihtoehto]
	,[numerovalinta]
	,[d_organisaatioluokitus_id]
	,[vastaajaid]
	,[flervalsalternativ]
	,[multiple_choice_option]
	,[ura_maisteri]
	,[ura_tohtori]
	,[source]
)
SELECT  
	coalesce(d1.id,-1) as d_ika_id,		
	coalesce(d2.id,-1) as d_sukupuoli_id,
    coalesce(d3.id,-1) as d_kieli_aidinkieli_id,
    coalesce(d4.id,-1) as d_maatjavaltiot2_kansalaisuus_id,
	coalesce(d5.id,-1) as d_koulutusluokitus_id,
	coalesce(d7.id,-1) as d_virta_rahoituslahde_id,
	kysymykset.id as d_arvokysymys_id,
    f1.kyselypohja,
    f1.kyselyvuosi,
    CASE
		WHEN f1.kysymysnumero in (
			6803, 6805,6836,6837,6889,6890,6908,6910,6913,6914,					-- vuoden 2018 kysymykset
			8364, 8366, 8397, 8398, 8447, 8450, 8451, 8469, 8471, 8474, 8475,         -- vuoden 2019 kysymykset
			10228, 10227, 10224, 10222, 10204, 10203, 10151, 10150, 10119, 10117,		-- vuoden 2020 kysymykset	
			13354, 13356, 13359, 13360, 13335, 13336, 13434, 13435, 13443, 13445
		)	-- Vuoden 2021 kysymykset  	
		THEN 1 
		ELSE 0 
	END as [rahoitusmallikysymys],
	case					
		when kysymysryhma_fi = 'VI TYÖ JA OSAAMINEN (3/3)' then 1 / 6.0
		else 1.0
	end	as rahoituskysymys_paino,									
    f1.vastaus_arvo as [Monivalintavaihtoehto],
    f1.Vastaus_alkuperäinen as [numerovalinta],
    d6.id as d_organisaatioluokitus_id,
    f1.Index_vastaajaid as vastaajaid,
   
    f1.vastaus_sv as flervalsalternativ,
    f1.vastaus_en as multiple_choice_option,
   
    CASE WHEN f1.kyselypohja='URASEURANTA-MAISTERI' THEN 1 ELSE 0 END as ura_maisteri,
    CASE WHEN f1.kyselypohja='URASEURANTA-TOHTORI' THEN  1 ELSE 0 END as ura_tohtori,

	'ETL: p_lataa_f_arvo_yo_uraseuranta_2018' as source
   
FROM [ANTERO].SA.sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit f1
LEFT JOIN [ANTERO].sa.sa_arvo_yo_uraseuranta_taustatiedot f2 on f2.tunnus=f1.Vastaajatunnus
LEFT JOIN dw.d_ika d1 on d1.ika_avain=coalesce(round(cast(f2.ika_valmistuessa as float),0),-1)	
LEFT JOIN dw.d_sukupuoli d2 on d2.sukupuoli_koodi=round(cast(f2.sukupuoli as float),0)
LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi=f2.aidinkieli
LEFT JOIN dw.d_maatjavaltiot2 d4 on d4.maatjavaltiot2_koodi=round(cast(f2.kansalaisuus as float),0)
LEFT JOIN dw.d_koulutusluokitus d5 on d5.koulutusluokitus_koodi= round(cast(f2.koulutusalakoodi as float),0)
LEFT JOIN dw.d_organisaatioluokitus d6 on d6.organisaatio_koodi=RIGHT('00000'+isnull(f1.organisaatio_koodi,''),5) 
LEFT JOIN dw.d_virta_rahoituslahde d7 on d7.rahoituslahde_koodi = f2.rahoituslahde
OUTER APPLY (
	SELECT * FROM (
		SELECT 
			k.*,
			RANK() OVER (PARTITION BY kysymysid ORDER BY kysymysversio, kysymysryhmajarjestys, id) as rnk
		FROM ANTERO.dw.d_arvokysymys k 
	) k WHERE k.rnk = 1 and k.kysymysid = f1.Kysymysnumero
) kysymykset 
LEFT JOIN [ANTERO].[sa].[sa_arvo_yo_uraseuranta_oppilaitoskoodit] d8 on d8.Vastaajatunnus = f1.Vastaajatunnus

WHERE
(
	kysymykset.kysymysryhma_fi not like '%Kiitos%' AND
	kysymykset.vastaustyyppi not in ('vapaateksti', 'luku')
)
OR
(
	kysymykset.kysymysid in (8240, 8242, 8254, 6923, 6921, 6935, 10255, 10257, 10269,  10253, 6830, 8391, 10144) AND 
	f1.vastaus_arvo not like '%vaihtoehto ei koske minua%'
)
GO

USE [ANTERO]