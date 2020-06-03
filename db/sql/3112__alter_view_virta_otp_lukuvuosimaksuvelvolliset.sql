USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_lukuvuosimaksuvelvolliset]    Script Date: 29.4.2020 11:16:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW  [dw].[v_virta_otp_lukuvuosimaksuvelvolliset] 
AS

SELECT 
	   [Tilastovuosi]
	  ,[Aloitusvuosi]
      ,[Sukupuoli] = d1.sukupuoli_fi 
      ,[Ikä] = d2.ika_fi
	  ,[Ikäryhmä] = d2.ikaryhma2_fi
      ,[Kansalaisuus] = d3.maatjavaltiot2_fi
	  ,[Kansalaisuus (maanosa)] = d3.maanosa_fi
	  ,[Kansalaisuus (maanosa, suuralue)] = d3.maanosa2_fi

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
	  ,[jarj Ikäryhmä] = d2.jarjestys_ikaryhma2
	  ,[jarj Kansalaisuus maanosa] = d3.jarjestys_maanosa_koodi
	  ,[jarj Kansalaisuus maanosa2] = d3.jarjestys_maanosa2_koodi
	  ,[jarj Koulutussektori] = d4.jarjestys_koulutussektori_koodi
	  ,[jarj Koulutusaste taso 1] = d4.jarjestys_koulutusastetaso1_koodi
	  ,[jarj Koulutusaste taso 2] = d4.jarjestys_koulutusastetaso2_koodi
	  ,[jarj Koulutusala taso 1] = d4.jarjestys_koulutusalataso1_koodi
	  ,[jarj Koulutusala taso 2] = d4.jarjestys_koulutusalataso2_koodi
	  ,[jarj Koulutusala taso 3] = d4.jarjestys_koulutusalataso3_koodi
	  ,[jarj OKM ohjauksen ala] = d4.jarjestys_okmohjauksenala_koodi

FROM dw.f_virta_otp_lukuvuosimaksuvelvolliset f

		INNER JOIN dw.d_sukupuoli d1 ON d1.id = f.d_sukupuoli_id
		INNER JOIN dw.d_ika d2 ON d2.id = f.d_ika_id
		INNER JOIN dw.d_maatjavaltiot2 d3 ON d3.id = f.d_maatjavaltiot_kansalaisuus_id
		INNER JOIN dw.d_koulutusluokitus d4 ON d4.id = f.d_koulutusluokitus_id
		INNER JOIN dw.d_organisaatioluokitus d5 ON d5.id = f.d_organisaatioluokitus_oppilaitos_id
		INNER JOIN dw.d_organisaatioluokitus d6 ON d6.id = f.d_organisaatioluokitus_jarjestaja_id



GO


