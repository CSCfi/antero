USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_api_opiskelijat_ja_tutkinnot_esilataus]    Script Date: 14.10.2020 10:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_api_opiskelijat_ja_tutkinnot_esilataus] AS

DECLARE @maxTkOpiskVuosi int, @maxTutkVuosi int

SET @maxTkOpiskVuosi = (SELECT max(tilv) from VipunenTK_SA.dbo.v_sa_2_8_Korkeakoulut_opiskelijat WHERE tilv > 2009 and Aineisto = 'L')
SET @maxTutkVuosi = (SELECT max(tilv) from VipunenTK_SA.dbo.v_sa_2_9_Korkeakoulut_tutkinnot WHERE tilv > 2009 and Aineisto = 'L')

TRUNCATE TABLE [dw].[api_opiskelijat_ja_tutkinnot]

INSERT INTO [dw].[api_opiskelijat_ja_tutkinnot]

SELECT	[Tilastovuosi]		=	f.tilv
		,[Aineistotyyppi]	=	COALESCE(d0.aineistotyyppi_nimi_fi,'Tuntematon')
		,[Sektori]			=	COALESCE(d5.koulutussektori,'Tuntematon')
		,[Korkeakoulu]		=	COALESCE(d1.organisaatio_fi,'Tuntematon')
										 --case
											--when d1.loppupvm is NULL
											--then d1.organisaatio_fi
											--else d1.organisaatio_vanha_fi
										 --end
		,[Koulutus]  		=	COALESCE(d2.koulutusluokitus_fi,'Tuntematon')
		,[Sukupuoli]		=	COALESCE(d4.sukupuoli_fi,'Tuntematon')

		--mittarit
		,[Tutkinnot]			= f.tutk
		,[Opiskelijat]			= f.opisk	
		,[Uudet opiskelijat]	= f.uusi
	
		--koulutuskoodijohdannaiset
		,[Koulutusaste taso 1]				=	COALESCE(d2.koulutusastetaso1_fi,'Tuntematon')
		,[Koulutusaste taso 2]				=	COALESCE(d2.Koulutusastetaso2_fi,'Tuntematon')
		,[Koulutusala taso 1]				=	COALESCE(d2.koulutusalataso1_fi,'Tuntematon')
		,[Koulutusala taso 2]				=	COALESCE(d2.koulutusalataso2_fi,'Tuntematon')
		,[Koulutusala taso 3]				=	COALESCE(d2.koulutusalataso3_fi,'Tuntematon')
		,[OKM ohjauksen ala]				=	COALESCE(d2.okmohjauksenala_fi,'Tuntematon')
		,[Rahoitusmalliala amk 2017-2020]	=	COALESCE(d3.Ammattikorkeakoulut_tutkintotavoitteet,'Tuntematon')
		,[Rahoitusmalliala amk 2021-2024]	=	COALESCE(d3.Ammattikorkeakoulut_tutkintotavoitteet,'Tuntematon')
		,[Rahoitusmalliala yo 2017-2020]	=	COALESCE(d3.Yliopistot_tutkintotavoitteet,'Tuntematon')
		,[Rahoitusmalliala yo 2021-2024]	=	COALESCE(d3.Yliopistot_tutkintotavoitteet2021,'Tuntematon')

		--koodit
		,[Koodi Sektori]		=	f.sektori
		,[Koodi Korkeakoulu]	=	f.tunn
		,[Koodi Koulutus]		=	f.koulk

		--oletusjärjestys
		,defaultorder

FROM	
(
	SELECT 	tilv
			,aineisto
			,sektori
			,tunn
			,koulk
			,sp
			,tutk	= sum(tutk)
			,opisk	= sum(opisk)
			,uusi	= sum(uusi)
			,ROW_NUMBER() OVER(ORDER BY tilv,aineisto,sektori,tunn,koulk,sp) as defaultorder
	FROM
	(
	--TILASTOKESKUS
	--tutk
		SELECT	tilv
				,aineisto
				,sektori = left(lahde,1)
				,tunn
				,koulk
				,sp
				,tutk	=	lkm
				,opisk	=	0
				,uusi	=	0

		FROM VipunenTK_SA.dbo.v_sa_2_9_Korkeakoulut_tutkinnot 
		WHERE tilv > 2009 and Aineisto = 'L'

		UNION ALL

	--opisk
		SELECT	tilv
				,aineisto
				,sektori = left(lahde,1)
				,tunn
				,koulk
				,sp
				,tutk	=	0
				,opisk	=	case when olosyys in ('1','2') then lkm else 0 end
				,uusi	=
					case --mukaillen VipunenTK_DW.dbo.v_f_2_8_Korkeakouluopiskelijat
						when lahde = 41
							and alvv = tilv 
							and koultyp not in ('6' ,'7')
							and ensisop = 1
						then lkm  

						when alvv = tilv 
							and koultyp in ('6','7')
							and olosyys  IN ('1','2')
							and ensisop = 1
						then lkm 

						when lahde = 51
							and tilv < 2012
							and alvv = tilv 
							and olosyys  IN ('1','2')
						then lkm 

						--perusopiskelijat
						when lahde = 51
							and tilv >= 2012 
							and not (koulk like '8%' or laak is not null)
							and (case when aineisto = 'L' then alvv_kk else alvv end) = tilv
							and olosyys IN ('1','2')
						then lkm

						--jatko-opiskelijat
						when lahde = 51
							and tilv >= 2012 
							and (koulk like '8%' or laak is not null) --tohtorit ja lisensiaatit ja lääkärien erikoistumiskoulutus
							and opoikv = tilv
							and olosyys IN ('1','2')
						then lkm
						else 0 
					end

		FROM VipunenTK_SA.dbo.v_sa_2_8_Korkeakoulut_opiskelijat
		WHERE tilv > 2009 AND Aineisto = 'L'
		
		UNION ALL

	--VIRTA
	--tutk
		SELECT	tilv
				,aineisto
				,sektori = left(lahde,1)
				,tunn
				,koulk
				,sp
				,tutk	=	lkm
				,opisk	=	0
				,uusi	=	0

		FROM	[ANTERO].[sa].[sa_virta_otp_tkTUTKINTOOKMEnnakko]
		WHERE	tilv > @maxTutkVuosi

		UNION ALL
		
	--opisk
		SELECT	tilv
				,aineisto
				,sektori = left(lahde,1)
				,tunn
				,koulk
				,sp
				,tutk	=	0
				,opisk	=	case when olosyys in ('1','2') then lkm else 0 end
				,uusi	=
					case --mukaillen VipunenTK_DW.dbo.v_f_2_8_Korkeakouluopiskelijat, laak osalta v_sa_2_8_Korkeakoulut_opiskelijat
						when lahde = 41
							and alvv = tilv 
							and koultyp not in ('6' ,'7')
							and ensisop = 1
						then lkm  

						when alvv = tilv 
							and koultyp in ('6','7')
							and olosyys  IN ('1','2')
							and ensisop = 1
						then lkm 

						when lahde = 51
							and tilv < 2012
							and alvv = tilv 
							and olosyys  IN ('1','2')
						then lkm 

						--perusopiskelijat
						when lahde = 51
							and tilv >= 2012 
							and not (koulk like '8%' or koulk in ('775101','775201'))
							and (case when aineisto = 'L' then alvv_kk else alvv end) = tilv
							and olosyys IN ('1','2')
						then lkm

						--jatko-opiskelijat
						when lahde = 51
							and tilv >= 2012 
							and (koulk like '8%' or koulk in ('775101','775201')) --tohtorit ja lisensiaatit ja lääkärien erikoistumiskoulutus
							and opoikv = tilv
							and olosyys IN ('1','2')
						then lkm
						else 0 
					end

		FROM	[ANTERO].[sa].[sa_virta_otp_tkOPISKOKMEnnakko]
		WHERE	tilv > @maxTkOpiskVuosi

	) kaikki
		
	GROUP BY tilv
			,aineisto
			,sektori
			,tunn
			,koulk
			,sp
) f

LEFT JOIN ANTERO.dw.d_aineistotyyppi d0 on d0.aineistotyyppi_koodi = f.aineisto
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = f.tunn
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.koulk
LEFT JOIN VipunenTK_lisatiedot.dbo.isced_suomi_ohjauksenala d3 on d3.iscfi2013_koodi = d2.koulutusalataso3_koodi
LEFT JOIN ANTERO.dw.d_sukupuoli d4 on d4.sukupuoli_koodi = f.sp
LEFT JOIN VipunenTK_lisatiedot.dbo.koulutussektori d5 on d5.koulutussektori_koodi = f.sektori

WHERE d2.koulutusastetaso2_koodi not in ('73','91') --poistetaan lääkärien erik.koul. ja muita erikoistumisia
