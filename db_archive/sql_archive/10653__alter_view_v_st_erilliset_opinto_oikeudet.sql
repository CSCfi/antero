USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_erilliset_opinto_oikeudet]    Script Date: 10.3.2025 9.51.57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER view [dw].[v_st_erilliset_opinto_oikeudet] as

select 

	[Tilastovuosi] = vuosi

	,[Koulutusala] = 'Tuntematon'
	,[OKM ohjauksen ala] = 'Tuntematon'

	,[Yliopisto] = d6.organisaatio_fi

	--ruotsi
	,[Statistikår] = vuosi

	,[Utbildningsområde] = 'Okänd'
	,[UKM-styrningsområde] = 'Okänd'

	,[Universitet] = d6.organisaatio_sv

	--englanti
	,[Statistical year] = vuosi

	,[Field of education] = 'Unknown'
	,[Field of ed. HE steering] = 'Unknown'

	,[University] = d6.organisaatio_en

	--mittarit
	,f.suorittaneiden_lkm
	,f.opettajakoulutus_suorittaneiden_lkm
	,erillisilla_oik_op_lkm = null
	,erillisilla_oik_opkoul_op_lkm = null

	--koodit
	,[Koodit Yliopisto] = d6.organisaatio_koodi
	,[Koodit Koulutusala] = 99
	,[Koodit OKM ohjauksen ala] = 99

from [dw].[f_yo_erillisella_opinto_oikeudella_opiskelevat] f
join dw.d_organisaatioluokitus d6 on d6.id=f.d_yliopisto_id
where cast((cast((vuosi + 1) as varchar(4)) + '-03-03') as date) <= convert(date, getdate()) 
and (suorittaneiden_lkm > 0 or opettajakoulutus_suorittaneiden_lkm > 0)

union all

select 

	[Tilastovuosi] = f.vuosi

	,[Koulutusala] = d1.opintoala95_nimi_fi
	,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi

	,[Yliopisto] = d6.organisaatio_fi 

	--ruotsi
	,[Statistikår] = f.vuosi

	,[Utbildningsområde] = d1.opintoala95_nimi_sv
	,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv

	,[Universitet] = d6.organisaatio_sv

	--englanti
	,[Statistical year] = f.vuosi

	,[Field of education] = d1.opintoala95_nimi_en
	,[Field of ed. HE steering] = d2.ohjauksenala_nimi_en

	,[University] = d6.organisaatio_en

	--mittarit
	,null
	,null
	,[erillisilla_oik_op_lkm]
	,[erillisilla_oik_opkoul_op_lkm]

	--koodit
	,[Koodit Yliopisto] = d6.organisaatio_koodi
	,[Koodit Koulutusala] = case d1.opintoala95_koodi when -1 then 99 else d1.opintoala95_koodi end
	,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end

from [dw].[f_yo_opintopisteet] f
join dw.d_opintoala95 d1 on d1.id=f.d_opintoala95_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_organisaatioluokitus d6 on d6.id=f.d_yo_id
join dw.d_kalenteri d7 on d7.id=f.d_tilannepvm_id

-- Edellisen vuoden data julkaistaan vasta 3.3
where cast((cast((f.vuosi + 1) as varchar(4)) + '-03-03') as date) <= convert(date, getdate())  
and (erillisilla_oik_op_lkm > 0 or erillisilla_oik_opkoul_op_lkm > 0)


GO

USE [ANTERO]