USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yamk_tutkinnot_esilataus]    Script Date: 9.1.2026 9.17.27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_yamk_tutkinnot_esilataus] AS

TRUNCATE TABLE [dw].[api_yamk_tutkinnot]

INSERT INTO [dw].[api_yamk_tutkinnot] 

--mukaillen v_virta_otp_tutkinnot
  SELECT [Tutkinnon suorittamisvuosi]	= f.tutkinnonsuoritusvuosi	
	, [Suorituskuukausi]
	, [Koodit korkeakoulu]			= f.oppilaitosnro
	, [Korkeakoulu] 				= COALESCE(d1.organisaatio_fi,'Tuntematon')
	, [Tutkintokoodi] 				= COALESCE(f.tutkintokoodi,'999999')
	, [Tutkinto]  					= COALESCE(d2.koulutusluokitus_fi,'Tuntematon') 
	, [Tutkinnon laajuus op] 		= f.tutkinnonlaajuusop
			 
	--, [Koulutuskieli] 			=	COALESCE(d5.kieli_fi,'Tuntematon')
	--, [Koulutuskunta] 			=	COALESCE(d6.kunta_fi,'Tuntematon')				
	, [Rahoituslahde]				=	COALESCE(d9.rahoituslahde_nimi_fi,'Tuntematon')

	--mittarit
	, [Tutkinnot lkm]

	--koulutuskoodijohdannaiset
	, [Koulutusaste taso 1]				=	COALESCE(d2.koulutusastetaso1_fi,'Tuntematon')
	, [Koulutusaste taso 2]				=	COALESCE(d2.Koulutusastetaso2_fi,'Tuntematon')
	, [Koulutusala taso 1]				=	COALESCE(d2.koulutusalataso1_fi,'Tuntematon')
	, [Koulutusala taso 2]				=	COALESCE(d2.koulutusalataso2_fi,'Tuntematon')
	, [Koulutusala taso 3]				=	COALESCE(d2.koulutusalataso3_fi,'Tuntematon')
	, [OKM ohjauksen ala]				=	COALESCE(d2.okmohjauksenala_fi,'Tuntematon')
	, [Rahoitusmallialat amk 2021-2024]	=	COALESCE(d3.Ammattikorkeakoulut_tutkintotavoitteet,'Tuntematon')
	
	--, [defaultorder]

	FROM

	(SELECT oppilaitosnro
		, tutkinnonsuoritusvuosi
		, [Suorituskuukausi]
		, tutkintokoodi
		, tutkinnonlaajuusop
		--, koulutuskieli
		--, koulutuskunta
		, rahoituslahde
			
		, [Tutkinnot lkm] = count(*)

		/*, ROW_NUMBER() OVER(ORDER BY oppilaitosnro
								, tutkinnonsuoritusvuosi
								, [Suorituskuukausi]
								, tutkintokoodi
								, tutkinnonlaajuusop
								--, koulutuskieli
								--, koulutuskunta
								, rahoituslahde) as defaultorder*/

		FROM 

		(SELECT d.organisaatio_nykyinen_koodi as oppilaitosnro
			, tutkinnonsuoritusvuosi
			, [Suorituskuukausi] = MONTH(dateadd(S, tutkinnonsuorituspvm/1000, '1970-01-01 03:00:00')) --group by
			, tutkintokoodi
			, tutkinnonlaajuusop
			--, koulutuskieli
			--, koulutuskunta
			, rahoituslahde
			FROM ANTERO.sa.[sa_virta_otp_tutkinnot] s
			LEFT JOIN ANTERO.dw.d_organisaatioluokitus d on d.organisaatio_koodi = s.oppilaitosnro
		) f0
	
		GROUP BY oppilaitosnro
			, tutkinnonsuoritusvuosi
			, [Suorituskuukausi]
			, tutkintokoodi
			, tutkinnonlaajuusop
			--, koulutuskieli
			--, koulutuskunta
			, rahoituslahde

	) f

	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = f.oppilaitosnro
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.tutkintokoodi
	LEFT JOIN VipunenTK_lisatiedot.dbo.isced_suomi_ohjauksenala d3 on d3.iscfi2013_koodi = d2.koulutusalataso3_koodi
	--LEFT JOIN ANTERO.dw.d_kieli d5 ON d5.kieli_koodi = f.koulutuskieli
	--LEFT JOIN ANTERO.dw.d_alueluokitus d6 ON d6.kunta_koodi = f.koulutuskunta
	LEFT JOIN ANTERO.dw.d_virta_rahoituslahde d9 ON d9.rahoituslahde_koodi = f.rahoituslahde
	
	WHERE d2.koulutusastetaso2_koodi = '71' --vain yamk