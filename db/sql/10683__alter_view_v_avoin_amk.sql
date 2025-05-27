USE [ANTERO]
GO

/****** Object:  View [dw].[v_avoin_amk]    Script Date: 10.3.2025 10.53.26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER view [dw].[v_avoin_amk] as



select 

	[Tilastovuosi] = vuosi

	,[Sukupuoli] = d1.sukupuoli_fi

	,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
	,[Koulutusala] = d3.selite_fi

	,[Ammattikorkeakoulu] = d4.organisaatio_fi

	--Ruotsi

	,[Statistikår] = vuosi

	,[Kön] = d1.sukupuoli_sv

	,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv
	,[Utbildningsområde] = d3.selite_sv

	,[Yrkeshögskola] = d4.organisaatio_sv

	--Englanti

	,[Statistical year] = vuosi

	,[Gender] = d1.sukupuoli_en

	,[Field of education - HE steering] = d2.ohjauksenala_nimi_en
	,[Field of education] = d3.selite_en

	,[University of applied sciences] = d4.organisaatio_en

	--mittarit
	,f.osallistuneet
	,opintopisteet_yht
	,opintopisteet_amk
	,opintopisteet_kansalaisopistot
	,opintopisteet_kansanopistot
	,opintopisteet_kesayo
	,opintopisteet_muut
	,opintopisteet_yo

	,[Sektori] 
	,[Sektorn] 
	,[Sector] 

	--koodit
	,[Koodit Ammattikorkeakoulu] = d4.organisaatio_koodi
	,[Koodit Sukupuoli] = d1.sukupuoli_koodi
	,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
	,[Koodit Koulutusala] = d3.koodi

from

(
	select
		vuosi
		,d_sukupuoli_id
		,d_ohjauksenala_id
		,d_koulutusala_2002_id
		,d.organisaatio_koodi

		,f.osallistuneet
		,0 as opintopisteet_yht
		,0 as opintopisteet_amk
		,0 as opintopisteet_kansalaisopistot
		,0 as opintopisteet_kansanopistot
		,0 as opintopisteet_kesayo
		,0 as opintopisteet_muut
		,0 as opintopisteet_yo

		,[Sektori] = 'Avoin amk'
		,[Sektorn] = 'Öppen yrkeshögskola'
		,[Sector] = 'Open UAS'
	from [dw].[f_amk_avoimen_opiskelijat] f
	left join dw.d_organisaatioluokitus d on d.id=f.d_amk_id

	union all

	select
		 vuosi
		,d_sukupuoli_id = -1
		,d_ohjauksenala_id
		,d_koulutusala_2002_id
		,d.organisaatio_koodi

		,0
		,f.avoinamk_op_lkm
		,f.avoinamk_op_amk_lkm
		,f.avoinamk_op_kansal_lkm
		,f.avoinamk_op_kansan_lkm
		,f.avoinamk_op_kesa_lkm
		,f.avoinamk_op_muut_lkm
		,f.avoinamk_op_yliop_lkm

		,[Sektori] = 'Avoin amk'
		,[Sektorn] = 'Öppen yrkeshögskola'
		,[Sector] = 'Open UAS'
	from [dw].[f_amk_opintopisteet] f
	left join dw.d_organisaatioluokitus d on d.id=f.d_amk_id

	union all

	select
		 vuosi
		,d_sukupuoli_id
		,d_ohjauksenala_id
		,d_koulutusala_2002_id
		,d.organisaatio_koodi

		,osallistuneet
		,0
		,0
		,0
		,0
		,0
		,0
		,0

		,[Sektori] = 'Maahanmuuttajat'
		,[Sektorn] = 'Invandrare'
		,[Sector] = 'Migrants'
	from [dw].[f_amk_maahanmuuttajien_valmentava_koulutus] f
	left join dw.d_organisaatioluokitus d on d.id=f.d_amk_id

	union all

	select
		 vuosi
		,d_sukupuoli_id = -1
		,d_ohjauksenala_id
		,d_koulutusala_2002_id
		,d.organisaatio_koodi

		,0
		,mamu_op_lkm
		,0
		,0
		,0
		,0
		,0
		,0

		,[Sektori] = 'Maahanmuuttajat'
		,[Sektorn] = 'Invandrare'
		,[Sector] = 'Migrants'
	from [dw].[f_amk_opintopisteet] f
	left join dw.d_organisaatioluokitus d on d.id=f.d_amk_id

) f

join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_koulutusala_2002 d3 on d3.id=f.d_koulutusala_2002_id
join dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi=f.organisaatio_koodi

GO

USE [ANTERO]