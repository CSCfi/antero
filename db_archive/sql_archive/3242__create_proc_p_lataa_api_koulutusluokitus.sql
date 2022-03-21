USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_koulutusluokitus]    Script Date: 2.9.2020 15:39:26 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_koulutusluokitus]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_koulutusluokitus]    Script Date: 2.9.2020 15:39:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dw].[p_lataa_api_koulutusluokitus] AS

TRUNCATE TABLE [dw].[api_koulutusluokitus]

INSERT INTO [dw].[api_koulutusluokitus]

SELECT koulutusluokitus_avain
,koulutusluokitus_koodi
,koulutusluokitus_fi
,koulutusluokitus_sv
,koulutusluokitus_en
,koulutusastetaso1_koodi
,koulutusastetaso1_fi
,koulutusastetaso1_sv
,koulutusastetaso1_en
,koulutusastetaso2_koodi
,koulutusastetaso2_fi
,koulutusastetaso2_sv
,koulutusastetaso2_en
,koulutusalataso1_koodi
,koulutusalataso1_fi
,koulutusalataso1_sv
,koulutusalataso1_en
,koulutusalataso2_koodi
,koulutusalataso2_fi
,koulutusalataso2_sv
,koulutusalataso2_en
,koulutusalataso3_koodi
,koulutusalataso3_fi
,koulutusalataso3_sv
,koulutusalataso3_en
,okmohjauksenala_koodi
,okmohjauksenala_fi
,okmohjauksenala_sv
,okmohjauksenala_en
,koulutussektori_koodi
,koulutussektori_fi
,koulutussektori_sv
,koulutussektori_en
,tutkintotyyppi_koodi
,tutkintotyyppi_fi
,tutkintotyyppi_sv
,tutkintotyyppi_en
,[Rahoitusmallialat amk 2021-2024_koodi] = d1.Ammattikorkeakoulut_tutkintotavoitteet_koodi
,[Rahoitusmallialat amk 2021-2024_fi] = d1.Ammattikorkeakoulut_tutkintotavoitteet
,[Rahoitusmallialat amk 2021-2024_sv] = d1.Ammattikorkeakoulut_tutkintotavoitteet_SV
,[Rahoitusmallialat amk 2021-2024_en] = d1.Ammattikorkeakoulut_tutkintotavoitteet_EN
,[Rahoitusmallialat yo 2021-2024_koodi] = d1.Yliopistot_tutkintotavoitteet2021_koodi
,[Rahoitusmallialat yo 2021-2024_fi] = d1.Yliopistot_tutkintotavoitteet2021
,[Rahoitusmallialat yo 2021-2024_sv] = d1.Yliopistot_tutkintotavoitteet2021_SV
,[Rahoitusmallialat yo 2021-2024_en] = d1.Yliopistot_tutkintotavoitteet2021_EN

--oletusjärjestys
,ROW_NUMBER() OVER(ORDER BY f.id ASC) as defaultorder

FROM dw.d_koulutusluokitus f
LEFT JOIN VipunenTK_lisatiedot.dbo.isced_suomi_ohjauksenala d1 
	on f.koulutusastetaso1_koodi in ('6','7','8') and d1.iscfi2013_koodi = coalesce(nullif(f.koulutusalataso3_koodi, '9999'), '-1')


GO


