USE [ANTERO]
GO

/****** Object:  View [dw].[v_api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 17.12.2019 17:06:02 ******/
DROP VIEW IF EXISTS [dw].[v_api_tavoiteajassa_tutkinnon_suorittaneet]
GO

/****** Object:  View [dw].[v_api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 17.12.2019 17:06:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




















CREATE VIEW [dw].[v_api_tavoiteajassa_tutkinnon_suorittaneet] as

WITH t as
(
	SELECT	tutkintovuosi
			, oppilaitosnro
			, tutkintokoodi

			, [Tutkinnot]								=	count(opiskelijaavain + opiskeluoikeusAvain + oppilaitosnro)
			, [Tavoiteajassa]							=	sum(tavoiteajassavalmistunut)
			, [Tavoiteaika ylitetty korkeintaan 12 kk]	=	sum(xonenintaan12kk)
			, [Tavoiteaika ylitetty yli 12 kk]			=	sum(xonyli12kk)
			, [On aiempi korkeakoulututkinto]			=	sum(onaiempitutkinto)
			, [Tutkintopisteet]							=	sum(cast(tutkintokerroin as decimal(12,4)))

	FROM 	ANTERO.sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet f

	GROUP BY tutkintovuosi
			, oppilaitosnro
			, tutkintokoodi
)

SELECT	[Tilastovuosi]	=	t.tutkintovuosi
		, [Sektori]		=	COALESCE(d2.koulutussektori_fi, 'Tuntematon')
		, [Korkeakoulu]	=	COALESCE(d1.organisaatio_fi, 'Tuntematon')
									--case
										--when d1.loppupvm is NULL
										--then d1.organisaatio_fi
										--else d1.organisaatio_vanha_fi
									--end
		, [Koulutus]	=	COALESCE(d2.koulutusluokitus_fi, 'Tuntematon') 

		--mittarit
		, [Tutkinnot]
		, [Tavoiteajassa]
		, [Tavoiteaika ylitetty korkeintaan 12 kk]
		, [Tavoiteaika ylitetty yli 12 kk]
		, [On aiempi korkeakoulututkinto]
		, [Tutkintopisteet]

		--koulutuskoodijohdannaiset
		, [Koulutusaste taso 1]				=	COALESCE(d2.koulutusastetaso1_fi, 'Tuntematon')
		, [Koulutusaste taso 2]				=	COALESCE(d2.Koulutusastetaso2_fi, 'Tuntematon')
		, [Koulutusala taso 1]				=	COALESCE(d2.koulutusalataso1_fi, 'Tuntematon')
		, [Koulutusala taso 2]				=	COALESCE(d2.koulutusalataso2_fi, 'Tuntematon')
		, [Koulutusala taso 3]				=	COALESCE(d2.koulutusalataso3_fi, 'Tuntematon')
		, [OKM ohjauksen ala]				=	COALESCE(d2.okmohjauksenala_fi, 'Tuntematon')
		, [Rahoitusmalliala amk 2017-2020]	=	COALESCE(d3.Ammattikorkeakoulut_tutkintotavoitteet, 'Tuntematon')
		, [Rahoitusmalliala amk 2021-2024]	=	COALESCE(d3.Ammattikorkeakoulut_tutkintotavoitteet, 'Tuntematon')
		, [Rahoitusmalliala yo 2017-2020]	=	COALESCE(d3.Yliopistot_tutkintotavoitteet, 'Tuntematon')
		, [Rahoitusmalliala yo 2021-2024]	=	COALESCE(d3.Yliopistot_tutkintotavoitteet2021, 'Tuntematon')

		--koodit	
		, [Koodi Sektori]		=	d2.koulutussektori_koodi
		, [Koodi Korkeakoulu]	=	t.oppilaitosnro
		, [Koodi Koulutus]		=	t.tutkintokoodi	

		--oletusjärjestys
		, ROW_NUMBER() OVER(ORDER BY tutkintovuosi, d2.koulutussektori_koodi, oppilaitosnro, tutkintokoodi) as defaultorder

FROM	t 
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = t.oppilaitosnro
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = t.tutkintokoodi
		LEFT JOIN VipunenTK_lisatiedot.dbo.isced_suomi_ohjauksenala d3 on d3.iscfi2013_koodi = d2.koulutusalataso3_koodi

WHERE	d2.koulutussektori_koodi in ('4','5')

