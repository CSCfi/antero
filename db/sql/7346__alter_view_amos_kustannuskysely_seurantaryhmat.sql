USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_kustannuskysely_seurantaryhmat]    Script Date: 6.2.2023 12:06:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dw].[v_amos_kustannuskysely_seurantaryhmat] AS

SELECT 
	 [Tilastovuosi] = f.vuosi
	,[Koulutuksen järjestäjä] = d1.organisaatio_fi
	,[Seurantaryhmä, taso 1] = d2.taso1
	,[Seurantaryhmä, taso 2] = d2.taso2
	,[Seurantaryhmä, taso 3] = d2.taso3
	,[Tutkintotyyppi] = case when d5.koodi='muu' then 'Muu ammatillinen koulutus' else d3.tutkintotyypin_ryhma_fi end
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi
	,[Kustannusryhmä] = d5.selite_fi
	,[Omistajatyyppi]
	,[Oppisopimuskoulutus] = d6.kytkin_fi
	,[Vankilaopetus] = d7.kytkin_fi
	--
	,[Koodit Koulutuksen järjestäjä] = d1.organisaatio_koodi
	--
	,[jarjestys_koulutusala_taso_1] = d4.jarjestys_koulutusalataso1_koodi
	--
	,[euroa]
	,[ov_op_avain] = CONCAT(f.vuosi, d1.organisaatio_koodi, d3.tutkintotyypin_ryhma_koodi, d4.koulutusalataso1_koodi, d5.koodi, d6.kytkin_koodi, d7.kytkin_koodi)
FROM dw.f_amos_kustannuskysely_seurantaryhmat f
left join dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatioluokitus_id
left join dw.d_amos_kustannuskysely_seurantaryhma d2 on d2.id=f.d_amos_seurantaryhma_id
left join dw.d_koulutusluokitus d3 on d3.id=f.d_koulutusluokitus_tutkintotyypin_ryhma_id
left join dw.d_koulutusluokitus d4 on d4.id=f.d_koulutusluokitus_koulutusala_taso1_id
left join dw.d_ammatillisen_tutkinnon_kustannusryhma d5 on d5.id=f.d_ammatillisen_tutkinnon_kustannusryhma_id
left join dw.d_kytkin d6 on d6.id=f.d_kytkin_oppisopimuskoulutus_id
left join dw.d_kytkin d7 on d7.id=f.d_kytkin_vankilaopetus_id


