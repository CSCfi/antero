USE [ANTERO]
GO
/****** Object:  View [dw].[v_amos_kustannuskysely_seurantaryhmat]    Script Date: 26.4.2020 13:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_amos_kustannuskysely_seurantaryhmat]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dw].[v_amos_kustannuskysely_seurantaryhmat] AS

SELECT 
	 [Tilastovuosi] = f.vuosi
	,[Koulutuksen järjestäjä] = d1.organisaatio_fi
	,[Seurantaryhmä, taso 1] = d2.taso1
	,[Seurantaryhmä, taso 2] = d2.taso2
	,[Seurantaryhmä, taso 3] = d2.taso3
	,[Tutkintotyyppi] = case when d5.koodi=''muu'' then ''Muu ammatillinen koulutus'' else d3.tutkintotyypin_ryhma_fi end
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi
	,[Kustannusryhmä] = d5.selite_fi
	,[Omistajatyyppi]
	,[Oppisopimuskoulutus] = d6.kytkin_fi
	,[Vankilaopetus] = d7.kytkin_fi
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



' 
GO
/****** Object:  View [dw].[v_amos_kustannuskysely_tili]    Script Date: 26.4.2020 13:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_amos_kustannuskysely_tili]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dw].[v_amos_kustannuskysely_tili] AS

SELECT 
	 [Tilastovuosi] = f.vuosi
	,[Koulutuksen järjestäjä] = d1.organisaatio_fi
	,[Taso 0] = d2.taso0
	,[Taso 1] = d2.taso1
	,[Taso 2] = d2.taso2
	,[Taso 3] = d2.taso3
	,[Taso 4] = d2.taso4
	,[Taso 5] = d2.taso5
	,[Taso, alin] = d2.taso_alin
	,[tili_jarjestys] = case when d2.taso5 = '''' then ''999'' else CONCAT(d2.id,''_'',d2.koodi) end
	,[Omistajatyyppi] = f.omistajatyyppi_nimi
	,[avain] = CONCAT(f.vuosi, d1.organisaatio_koodi)
	,[maara_euroa]
FROM dw.f_amos_kustannuskysely_jarjestajakohtainen f
LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
LEFT JOIN dw.d_amos_kustannuskysely_tili d2 on d2.id = f.d_amos_tili_id






' 
