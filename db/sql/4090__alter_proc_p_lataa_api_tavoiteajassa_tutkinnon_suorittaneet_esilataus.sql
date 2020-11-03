USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet_esilataus]    Script Date: 2.11.2020 20:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet_esilataus] AS

TRUNCATE TABLE [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]

INSERT INTO [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]

SELECT	[Tilastovuosi]	=	t.tutkintovuosi
		, [Sektori]		=	case d1.oppilaitostyyppi_koodi --COALESCE(d2.koulutussektori_fi, 'Tuntematon')
								when '41' then 'Ammattikorkeakoulukoulutus'
								when '42' then 'Yliopistokoulutus'
								else 'Tuntematon'
							end
		, [Korkeakoulu]	=	COALESCE(d1.organisaatio_fi, 'Tuntematon')
		, [Koulutus]	=	COALESCE(d2.koulutusluokitus_fi, 'Tuntematon') 

	  --mittarit
		, [Tutkinnot]
								--Tulkitaan tavoiteaikatiedot puuttuviksi, jos kaikissa 0:
		, [Tavoiteajassa]	=	case [Tavoiteajassa]+[Tavoiteaika ylitetty korkeintaan 12 kk]+[Tavoiteaika ylitetty yli 12 kk]
									when 0 then null
									else [Tavoiteajassa]
								end

		, [Tavoiteaika ylitetty korkeintaan 12 kk]	=	case [Tavoiteajassa]+[Tavoiteaika ylitetty korkeintaan 12 kk]+[Tavoiteaika ylitetty yli 12 kk]
															when 0 then null 
															else [Tavoiteaika ylitetty korkeintaan 12 kk]
														end

		, [Tavoiteaika ylitetty yli 12 kk]	=	case [Tavoiteajassa]+[Tavoiteaika ylitetty korkeintaan 12 kk]+[Tavoiteaika ylitetty yli 12 kk]
													when 0 then null 
													else [Tavoiteaika ylitetty yli 12 kk]
												end
		, [On aiempi korkeakoulututkinto]
		, [Tutkintopisteet]

	  --yleisön pyynnöstä
		, [Tutkintopisteluokka]

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
		, [Koodi Sektori]		=	case d1.oppilaitostyyppi_koodi --d2.koulutussektori_koodi
										when '41' then '4'
										when '42' then '5'
										else '-1'
									end
		, [Koodi Korkeakoulu]	=	t.oppilaitosnro
		, [Koodi Koulutus]		=	t.tutkintokoodi

	  --oletusjärjestys
		, defaultorder

FROM

(
  --mukaillen v_virta_otp_tavoiteajassa_tutkinnon_suorittaneet
	SELECT	tutkintovuosi
			, oppilaitosnro
			, tutkintokoodi

			, [Tutkinnot]								=	count(*)
			, [Tavoiteajassa]							=	sum(tavoiteajassavalmistunut)
			, [Tavoiteaika ylitetty korkeintaan 12 kk]	=	sum(xonenintaan12kk)
			, [Tavoiteaika ylitetty yli 12 kk]			=	sum(xonyli12kk)
			, [On aiempi korkeakoulututkinto]			=	sum(onaiempitutkinto)
			, [Tutkintopisteet]							=	sum(cast(tutkintokerroin as decimal(12,4)))
			, [Tutkintopisteluokka]						=	cast(tutkintokerroin as decimal(12,4))

			, ROW_NUMBER() OVER(ORDER BY tutkintovuosi
									, oppilaitosnro
									, tutkintokoodi
									, tavoiteajassavalmistunut
									, xonenintaan12kk
									, xonyli12kk
									, onaiempitutkinto
									, tutkintokerroin) as defaultorder

	FROM 	ANTERO.sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet f

	GROUP BY tutkintovuosi
		, oppilaitosnro
		, tutkintokoodi
		, tavoiteajassavalmistunut
		, xonenintaan12kk
		, xonyli12kk
		, onaiempitutkinto
		, tutkintokerroin
			
) t 
		
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = t.oppilaitosnro
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = t.tutkintokoodi
LEFT JOIN VipunenTK_lisatiedot.dbo.isced_suomi_ohjauksenala d3 on d3.iscfi2013_koodi = d2.koulutusalataso3_koodi

WHERE d1.oppilaitostyyppi_koodi in ('41','42')
--WHERE d2.koulutussektori_koodi in ('4','5')

GO