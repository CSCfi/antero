USE [ANTERO]
GO

/****** Object:  View [dw].[v_api_opiskelijat_ja_tutkinnot]    Script Date: 17.12.2019 17:04:17 ******/
DROP VIEW IF EXISTS [dw].[v_api_opiskelijat_ja_tutkinnot]
GO

/****** Object:  View [dw].[v_api_opiskelijat_ja_tutkinnot]    Script Date: 17.12.2019 17:04:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



























CREATE VIEW [dw].[v_api_opiskelijat_ja_tutkinnot] as

--OHJE UUDEN TK-AINEISTON SAAPUESSA: 
--lisää uudet tk-sopimusvuodet alle tk-osioon (kommentoi K2.8b/K2.9c pois, jos se ei vielä ole tullut)
--päivitä uutta tk-aineistoa vastaavan Virta-ennakon where-ehdon tilastovuosi (K2.9c <-> opiskelija, K2.8b <-> tutkinto)

WITH t as
(
	SELECT 	tilv
			, aineisto
			, tunn
			, koulk
			, sp
			, tutk	=	sum(tutk)
			, opisk	=	sum(opisk)
			, uusi	=	sum(coalesce(uusi, 0))
			, ROW_NUMBER() OVER(ORDER BY tilv, aineisto, tunn, koulk, sp) as defaultorder
	FROM
	(
	--virta

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	lkm
				, opisk	=	0
				, uusi	=	0
				, olosyys	=	'1'		--olosyys, koultyp ja laak rajausehtona myöhemmin
				, koultyp
				, laak	=	NULL
		FROM	[ANTERO].[sa].[sa_virta_otp_tkTUTKINTOOKMEnnakko]
		WHERE	tilv = '2019'	--uusin tk-sopimusvuosi (K2.9c)

		UNION ALL
		
		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	0
				, opisk	=	lkm
				, uusi	=	case
								when alvv = tilv and (lahde = '51' or ensisop = 1)	--tk-aineistoissa yo:lle alvv -> alvv_kk
								then lkm
							end
				, olosyys
				, koultyp
				, laak	=	NULL
		FROM	[ANTERO].[sa].[sa_virta_otp_tkOPISKOKMEnnakko]
		WHERE	tilv = '2019'	--uusin tk-sopimusvuosi (K2.8b)

		UNION ALL

	--tk
	--sopv19

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	lkm
				, opisk	=	0
				, uusi	=	0
				, olosyys = '1'
				, koultyp
				, laak
		FROM	[TK_H9098_CSC].[dbo].[TK_K2_9c_sopv_19]

		UNION ALL

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	0
				, opisk	=	lkm
				, uusi	=	case
								when lahde = '51' and (alvv_kk = tilv or (koulk like '8%' and opoikv = tilv))
								then lkm
								when lahde = '41' and alvv = tilv and ensisop = 1
								then lkm
							end
				, olosyys
				, koultyp
				, laak				
		FROM [TK_H9098_CSC].[dbo].[TK_K2_8b_sopv_19]		

		UNION ALL

	--sopv18

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	lkm
				, opisk	=	0
				, uusi	=	0
				, olosyys = '1'
				, koultyp
				, laak
		FROM	[TK_H9098_CSC].[dbo].[TK_2_9c_sopv_18]

		UNION ALL

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	0
				, opisk	=	lkm
				, uusi	=	case
								when lahde = '51' and (alvv_kk = tilv or (koulk like '8%' and opoikv = tilv))
								then lkm
								when lahde = '41' and alvv = tilv and ensisop = 1
								then lkm
							end
				, olosyys
				, koultyp
				, laak				
		FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_18]
		
		UNION ALL

	--sopv17

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	lkm
				, opisk	=	0
				, uusi	=	0
				, olosyys = '1'
				, koultyp
				, laak
		FROM	[TK_H9098_CSC].[dbo].[TK_2_9c_sopv_17]

		UNION ALL

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	0
				, opisk	=	lkm
				, uusi	=	case
								when lahde = '51' and (alvv_kk = tilv or (koulk like '8%' and opoikv = tilv))
								then lkm
								when lahde = '41' and alvv = tilv and ensisop = 1
								then lkm
							end
				, olosyys
				, koultyp
				, laak				
		FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_17]
		
		UNION ALL

	--sopv16

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	lkm
				, opisk	=	0
				, uusi	=	0
				, olosyys = '1'
				, koultyp
				, laak
		FROM	[TK_H9098_CSC].[dbo].[TK_2_9c_sopv_16]

		UNION ALL

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	0
				, opisk	=	lkm
				, uusi	=	case
								when lahde = '51' and (alvv_kk = tilv or (koulk like '8%' and opoikv = tilv))
								then lkm
								when lahde = '41' and alvv = tilv and ensisop = 1
								then lkm
							end
				, olosyys
				, koultyp
				, laak				
		FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_16]
		
		UNION ALL

	--sopv15

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	lkm
				, opisk	=	0
				, uusi	=	0
				, olosyys = '1'
				, koultyp
				, laak	=	NULL
		FROM	[TK_H9098_CSC].[dbo].[TK_2_9c_sopv_15]

		UNION ALL

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	0
				, opisk	=	lkm
				, uusi	=	case
								when lahde = '51' and (alvv_kk = tilv or (koulk like '8%' and opoikv = tilv))
								then lkm
								when lahde = '41' and alvv = tilv and ensisop = 1
								then lkm
							end
				, olosyys
				, koultyp
				, laak	=	NULL				
		FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_15]
		
		UNION ALL

	--sopv14

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	lkm
				, opisk	=	0
				, uusi	=	0
				, olosyys = '1'
				, koultyp
				, laak	=	NULL
		FROM	[TK_H9098_CSC].[dbo].[TK_2_9c_sopv_14]

		UNION ALL

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	0
				, opisk	=	lkm
				, uusi	=	case
								when lahde = '51' and (alvv_kk = tilv or (koulk like '8%' and opoikv = tilv))
								then lkm
								when lahde = '41' and alvv = tilv and ensisop = 1
								then lkm
							end
				, olosyys
				, koultyp
				, laak	=	NULL				
		FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_14]
		
		UNION ALL

	--sopv13

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	lkm
				, opisk	=	0
				, uusi	=	0
				, olosyys = '1'
				, koultyp
				, laak	=	NULL
		FROM	[TK_H9098_CSC].[dbo].[TK_2_9c_sopv_13]

		UNION ALL

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	0
				, opisk	=	lkm
				, uusi	=	case
								when lahde = '51' and (alvv_kk = tilv or (koulk like '8%' and opoikv = tilv))
								then lkm
								when lahde = '41' and alvv = tilv and ensisop = 1
								then lkm
							end
				, olosyys
				, koultyp
				, laak	=	NULL				
		FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_13]
		
		UNION ALL

	--sopv12

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	lkm
				, opisk	=	0
				, uusi	=	0
				, olosyys = '1'
				, koultyp
				, laak	=	NULL
		FROM	[TK_H9098_CSC].[dbo].[TK_2_9c_sopv_12]

		UNION ALL

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	0
				, opisk	=	lkm
				, uusi	=	case
								when lahde = '51' and (alvv_kk = tilv or (koulk like '8%' and opoikv = tilv))
								then lkm
								when lahde = '41' and alvv = tilv and ensisop = 1
								then lkm
							end
				, olosyys
				, koultyp
				, laak	=	NULL				
		FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_12]
		
		UNION ALL

	--sopv11

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	lkm
				, opisk	=	0
				, uusi	=	0
				, olosyys = '1'
				, koultyp
				, laak	=	NULL
		FROM	[TK_H9098_CSC].[dbo].[TK_2_9c_sopv_11]

		UNION ALL

		SELECT	tilv
				, aineisto
				, tunn
				, koulk
				, sp
				, tutk	=	0
				, opisk	=	lkm
				, uusi	=	case
								when lahde = '51' and (alvv_kk = tilv or (koulk like '8%' and opoikv = tilv))
								then lkm
								when lahde = '41' and alvv = tilv and ensisop = 1
								then lkm
							end
				, olosyys
				, koultyp
				, laak	=	NULL				
		FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_11]
		
	) kaikki
	
	WHERE	laak is null
	AND		olosyys in ('1','2')
	--(koultyp is null or koultyp in ('','1','2')				
		
	GROUP BY tilv
			, aineisto
			, tunn
			, koulk
			, sp
)

SELECT	[Tilastovuosi]		=	t.tilv
		, [Aineistotyyppi]	=	d0.aineistotyyppi_nimi_fi
		, [Sektori]			=	COALESCE(d2.koulutussektori_fi, 'Tuntematon')
		, [Korkeakoulu]		=	COALESCE(d1.organisaatio_fi, 'Tuntematon')
										 --case
											--when d1.loppupvm is NULL
											--then d1.organisaatio_fi
											--else d1.organisaatio_vanha_fi
										 --end
		, [Koulutus]  		=	COALESCE(d2.koulutusluokitus_fi, 'Tuntematon')
		, [Sukupuoli]		=	COALESCE(d4.sukupuoli_fi, 'Tuntematon')

		--mittarit
		, [Tutkinnot]			= t.tutk
		, [Opiskelijat]			= t.opisk	
		, [Uudet opiskelijat]	= t.uusi
	
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
		, [Koodi Korkeakoulu]	=	t.tunn
		, [Koodi Koulutus]		=	t.koulk

		--oletusjärjestys
		, defaultorder

FROM	t
		LEFT JOIN ANTERO.dw.d_aineistotyyppi d0 on d0.aineistotyyppi_koodi = t.aineisto
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = t.tunn
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = t.koulk
		LEFT JOIN VipunenTK_lisatiedot.dbo.isced_suomi_ohjauksenala d3 on d3.iscfi2013_koodi = d2.koulutusalataso3_koodi
		LEFT JOIN ANTERO.dw.d_sukupuoli d4 on d4.sukupuoli_koodi = t.sp

WHERE	d2.koulutussektori_koodi in ('4','5')

