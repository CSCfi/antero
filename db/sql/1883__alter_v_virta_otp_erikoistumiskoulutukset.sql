USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_erikoistumiskoulutukset]    Script Date: 16.10.2018 13:14:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dw].[v_virta_otp_erikoistumiskoulutukset] AS

SELECT   	
    d1.erikoistumiskoulutus_nimi_fi as  [Erikoistumiskoulutus],
	d1.erikoistumiskoulutus_koodi as    [Erikoistumiskoulutuskoodi],
	d2.ika_fi	as						[Ikä],
	d2.ikaryhma1_fi	as					[Ikäryhmä],
	d3.ohjauksenala_nimi_fi	as			[OKM Ohjauksen ala],

    f.opiskeluoikeus_alku_pvm as		[Opiskeluoikeuden alkamispvm],

	d4.sukupuoli_fi	as					[Sukupuoli],
	d5.organisaatio_fi	as				[Korkeakoulu],
	d5.organisaatio_koodi	as			[Korkeakoulukoodi] ,
	d5.oppilaitostyyppi_fi as           [Sektori],

	d1.jarjestys_erikoistumiskoulutus_koodi as [Erikoistumiskoulutus jarj],
	d2.jarjestys_ika	as				[Ikä jarj],
	d2.jarjestys_ikaryhma1	as			[Ikäryhmä jarj],
	d3.jarjestys_ohjauksenala_koodi	as [Ohjauksen ala jarj] ,  
	d4.jarjestys_sukupuoli_koodi	as [Sukupuoli jarj] ,
	d5.jarjestys_organisaatio_koodi	as [Korkeakoulu jarj] ,
	
	f.lkm	as lkm

	FROM 	ANTERO.dw.f_virta_otp_erikoistumiskoulutukset f 
	          LEFT JOIN ANTERO.dw.d_erikoistumiskoulutus d1 on d1.id = f.d_erikoistumiskoulutuskoodi_id
		      LEFT JOIN ANTERO.dw.d_ika d2 on d2.id	=	f.d_ika_id
		      LEFT JOIN ANTERO.dw.d_ohjauksenala d3 on d3.id	=	f.d_ohjauksenala_id
              LEFT JOIN ANTERO.dw.d_sukupuoli d4 on d4.id	=	f.d_sukupuoli_id
			  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 on d5.id = f.d_organisaatioluokitus_id


GO



