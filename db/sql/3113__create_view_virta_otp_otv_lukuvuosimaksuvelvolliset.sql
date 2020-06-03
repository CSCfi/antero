USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_lukuvuosimaksuvelvolliset]    Script Date: 3.6.2020 15:18:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW  [dw].[v_virta_otp_otv_lukuvuosimaksuvelvolliset] 
AS


SELECT 
	   [Tilastovuosi]
	  ,[Aloitusvuosi]
      ,[Sukupuoli] = d1.sukupuoli_fi 
      ,[Ikä] = d2.ika
	  ,[Ikäryhmä] = d2.ika5v
      ,CASE WHEN d3.maatjavaltiot2_fi = 'Suomi' THEN 'Suomi' ELSE 'Tuntematon' END as 'Kansalaisuus' 
	 -- ,[Kansalaisuus (maanosa)] = d3.maanosa_fi
	 -- ,[Kansalaisuus (maanosa, suuralue)] = d3.maanosa2_fi

      ,[Sektori] = d4.koulutussektori_fi
	  ,[Koulutusaste, taso 1] = d4.koulutusastetaso1_fi
	  ,[Koulutusaste, taso 2] = d4.koulutusastetaso2_fi
	  ,[Koulutusala, taso 1] = d4.koulutusalataso1_fi
	  ,[Koulutusala, taso 2] = d4.koulutusalataso2_fi
	  ,[Koulutusala, taso 3] = d4.koulutusalataso3_fi
	  ,[OKM ohjauksen ala] = d4.okmohjauksenala_fi
	  ,[Tutkintonimike] = d4.koulutusluokitus_fi

      ,[Korkeakoulu] = d5.organisaatio_fi
      ,[Koulutuksen järjestäjä] = d6.organisaatio_fi	

	  ,[lkm]

	  --koodimuuttujat
	  ,[Koodit Ikä] = d2.ika_avain
	  ,[Koodit Korkeakoulu] = d5.organisaatio_koodi
	  ,[Koodit Tutkinto] = d4.koulutusluokitus_koodi
	  
	  --järjestyskentät
	  ,[jarj Sukupuoli] = d1.jarjestys_sukupuoli_koodi
	  ,[jarj Ikäryhmä] = d2.jarjestys_ika5v
	  --,[jarj Kansalaisuus maanosa] = d3.jarjestys_maanosa_koodi
	  --,[jarj Kansalaisuus maanosa2] = d3.jarjestys_maanosa2_koodi
	  ,[jarj Koulutussektori] = d4.jarjestys_koulutussektori_koodi
	  ,[jarj Koulutusaste taso 1] = d4.jarjestys_koulutusastetaso1_koodi
	  ,[jarj Koulutusaste taso 2] = d4.jarjestys_koulutusastetaso2_koodi
	  ,[jarj Koulutusala taso 1] = d4.jarjestys_koulutusalataso1_koodi
	  ,[jarj Koulutusala taso 2] = d4.jarjestys_koulutusalataso2_koodi
	  ,[jarj Koulutusala taso 3] = d4.jarjestys_koulutusalataso3_koodi
	  ,[jarj OKM ohjauksen ala] = d4.jarjestys_okmohjauksenala_koodi

FROM dw.f_virta_otp_lukuvuosimaksuvelvolliset f
		INNER JOIN dw.d_sukupuoli d1 ON d1.id = f.d_sukupuoli_id
		INNER JOIN VipunenTK.dbo.d_ika d2 ON d2.ika_avain = cast(f.d_ika_id as varchar)
		INNER JOIN dw.d_maatjavaltiot2 d3 ON d3.id = f.d_maatjavaltiot_kansalaisuus_id
		INNER JOIN dw.d_koulutusluokitus d4 ON d4.id = f.d_koulutusluokitus_id
		INNER JOIN dw.d_organisaatioluokitus d5 ON d5.id = f.d_organisaatioluokitus_oppilaitos_id
		INNER JOIN dw.d_organisaatioluokitus d6 ON d6.id = f.d_organisaatioluokitus_jarjestaja_id
WHERE tilastovuosi > (select max(tilastointivuosi) from [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] WHERE aineisto = 'L')

UNION ALL

SELECT
		tilastointivuosi as 'Tilastovuosi'
		,kirjoihintulovuosi  as 'Aloitusvuosi'
		,d10.sukupuoli as 'Sukupuoli'
		,d7.ika as 'Ikä'	
		,d7.ika5v as 'Ikäryhmä'
		,d8.kansalaisuus_versio2 as 'Kansalaisuus'

		,d9.koulutussektori as 'Sektori'
		,d11.koulutusastetaso1_fi as 'Koulutusaste, taso 1'
		,d11.koulutusastetaso2_fi as 'Koulutusaste, taso 2'
		,d11.koulutusalataso1_fi as 'Koulutusala, taso 1'
		,d11.koulutusalataso2_fi as 'Koulutusala, taso 2'
		,d11.koulutusalataso3_fi as 'Koulutusala, taso 3'
		,d11.okmohjauksenala_fi as 'OKM ohjauksen ala'
		,CASE WHEN d12.koulutus_koodi = '999999' THEN d14.erikoislaakarikoulutus ELSE d12.koulutus END as 'Tutkintonimike'
		,d13.oppilaitos as 'Korkeakoulu'
		,d13.koulutuksen_jarjestaja as 'Koulutuksen järjestäjä'

		,lukumaara as 'lkm'

		--koodimuuttujat
		,d7.ika_avain as 'Koodit Ikä'
		,d13.oppilaitoskoodi as 'Koodit Korkeakoulu'
		,d12.koulutus_koodi as 'Koodit Tutkinto'

		--järjestyskentät
		,[jarj Sukupuoli] = d10.jarjestys
		,[jarj Ikäryhmä] = d7.jarjestys_ika5v
		,[jarj Koulutussektori] = d9.jarjestys
		,[jarj Koulutusaste taso 1] = d11.jarjestys_koulutusastetaso1_koodi
		,[jarj Koulutusaste taso 2] = d11.jarjestys_koulutusastetaso2_koodi
		,[jarj Koulutusala taso 1] = d11.jarjestys_koulutusalataso1_koodi
		,[jarj Koulutusala taso 2] = d11.jarjestys_koulutusalataso2_koodi
		,[jarj Koulutusala taso 3] = d11.jarjestys_koulutusalataso3_koodi
		,[jarj OKM ohjauksen ala] = d11.jarjestys_okmohjauksenala_koodi
	
FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] f2
		LEFT JOIN VipunenTK.dbo.d_ika d7 ON d7.id = f2.ika_id
		LEFT JOIN VipunenTK.dbo.d_kansalaisuus_versio2 d8 ON d8.id = f2.kansalaisuus_versio2_id
		LEFT JOIN VipunenTK.dbo.d_koulutussektori d9 on d9.id = f2.koulutussektori_id
		LEFT JOIN VipunenTK.dbo.d_sukupuoli d10 on d10.id = f2.sukupuoli_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d11 on d11.koulutusluokitus_koodi = f2.koulutusluokitus
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d12 on d12.id = f2.koulutusluokitus_id
		LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d13 on d13.id = f2.oppilaitos_id
		LEFT JOIN VipunenTK.dbo.d_erikoislaakarikoulutus d14 ON d14.id = f2.erikoislaakarikoulutus_id
WHERE (opiskelijan_olo_tamm in (1,2) or opiskelijan_olo_syys in (1,2)) and rahoituslahde_id = '5' and aineisto = 'L' and tilastointivuosi >= 2017





