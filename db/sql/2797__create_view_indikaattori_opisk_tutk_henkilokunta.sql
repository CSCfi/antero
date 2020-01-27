USE [ANTERO]
GO

/****** Object:  View [dw].[v_indikaattori_opisk_tutk_henkilokunta]    Script Date: 27.1.2020 12:44:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


DROP view if exists [dw].[v_indikaattori_opisk_tutk_henkilokunta] 
GO
CREATE view [dw].[v_indikaattori_opisk_tutk_henkilokunta] as


--amk päätoiminen henkilökunta
select
Tilastovuosi = vuosi

--,Sukupuoli = d1.sukupuoli_fi
,[Tutkijanuravaihe] = null

,[Sektori] = 'Ammattikorkeakoulutus'
,[Koulutusala 02] = d4.selite_fi
,[Koulutusala 95] = null
,[OKM ohjauksen ala] = d5.ohjauksenala_nimi_fi
,[Koodit Koulutusaste02] = null

,Korkeakoulu = d7.amk_nimi_fi

--mittarit
,[henkilotyovuosi]
,fte = null
,tutkinnot = null

--järjestykset
,[Koulutusala 02 järj] = cast(d4.koodi as nvarchar)
,[Koulutusala 95 järj] = null
,[OKM ohjauksen ala järj] = case d5.ohjauksenala_koodi when '-1' then '99' else d5.ohjauksenala_koodi end


from [dw].[f_amk_henkilon_tyo] f
left join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
left join dw.d_amk_tehtavanjaottelu d3 on d3.id=f.d_tehtavanjaottelu
left join dw.d_koulutusala_2002 d4 on d4.id=f.d_koulutusala02_id
left join dw.d_ohjauksenala d5 on d5.id=f.d_ohjauksenala_id
left join dw.d_tieteenala d6 on d6.id=f.d_tieteenala_id
left join dw.d_amk d7 on d7.id=f.d_amk_id
where d3.koodi = 1
/*
UNION ALL

--amk sivutoiminen henkilökunta
select
Tilastovuosi = vuosi

----,Sukupuoli = d1.sukupuoli_fi


,[Sektori] = 'Ammattikorkeakoulutus'
,[Koulutusala 02] = d4.selite_fi
,[Koulutusala 95] = null
,[OKM ohjauksen ala] = d5.ohjauksenala_nimi_fi


,Korkeakoulu = d7.amk_nimi_fi

--mittarit
,[henkilotyovuosi] = sivutoimisten_tuntiopettajien_opetustunnit
,fte = null
,tutkinnot = null

--järjestykset
,[Koulutusala 02 järj] = cast(d4.koodi as nvarchar)
,[Koulutusala 95 järj] = null
,[OKM ohjauksen ala järj] = case d5.ohjauksenala_koodi when '-1' then '99' else d5.ohjauksenala_koodi end


from [dw].[f_amk_sivutoimiset_opettajat] f
left join dw.d_koulutusala_2002 d4 on d4.id=f.d_koulutusala_id
left join dw.d_ohjauksenala d5 on d5.id=f.d_ohjauksenala_id
left join dw.d_amk d7 on d7.id=f.d_amk_id


UNION ALL

--amk luennoitsijat
select
Tilastovuosi = vuosi

----,Sukupuoli = d1.sukupuoli_fi


,[Sektori] = 'Ammattikorkeakoulutus'
,[Koulutusala 02] = d4.selite_fi
,[Koulutusala 95] = null
,[OKM ohjauksen ala] = d5.ohjauksenala_nimi_fi


,Korkeakoulu = d7.amk_nimi_fi

--mittarit
,[henkilotyovuosi] = luennoitsijoiden_oppitunnit
,fte = null
,tutkinnot = null

--järjestykset
,[Koulutusala 02 järj] = cast(d4.koodi as nvarchar)
,[Koulutusala 95 järj] = null
,[OKM ohjauksen ala järj] = case d5.ohjauksenala_koodi when '-1' then '99' else d5.ohjauksenala_koodi end


from [dw].[f_amk_luennoitsijat] f
left join dw.d_koulutusala_2002 d4 on d4.id=f.d_koulutusala_id
left join dw.d_ohjauksenala d5 on d5.id=f.d_ohjauksenala_id
left join dw.d_amk d7 on d7.id=f.d_amk_id

*/
UNION ALL

--yo henkilökunta
select 
Tilastovuosi = vuosi

--,Sukupuoli = d1.sukupuoli_fi
,[Tutkijanuravaihe] = d8.selite_fi

,[Sektori] = 'Yliopistokoulutus'
,[Koulutusala 02] = null
,[Koulutusala 95] = d4.selite_fi
,[OKM ohjauksen ala] = d5.ohjauksenala_nimi_fi
,[Koodit Koulutusaste02] = null

,Korkeakoulu = d7.yo_nimi_fi

--mittarit
,[henkilotyovuosi]
,fte = null
,tutkinnot = null

--järjestykset
,[Koulutusala 02 järj] = null
,[Koulutusala 95 järj] = cast(d4.koodi as nvarchar)
,[OKM ohjauksen ala järj] = case d5.ohjauksenala_koodi when '-1' then '99' else d5.ohjauksenala_koodi end


from [dw].[f_yo_henkilon_tyo] f
left join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
left join dw.d_yo_tehtavanjaottelu d3 on d3.id=f.d_tehtavanjaottelu_id
left join dw.d_koulutusala_1995 d4 on d4.id=f.d_koulutusala_id
left join dw.d_ohjauksenala d5 on d5.id=f.d_ohjauksenala_id
left join dw.d_tieteenala d6 on d6.id=f.d_tieteenala_id
left join dw.d_yo d7 on d7.id=f.d_yliopisto_id
left join dw.d_yo_tutkijanuravaihe d8 on d8.id=f.d_tutkijanuravaihe_id
left join dw.d_yo_henkilostoryhma d9 on d9.id=f.d_henkilostoryhma_id
left join dw.d_yo_harjoittelukoulujen_henkilostoryhma d10 on d10.id=f.d_harjoittelukoulujen_henkilostoryhma_id
where d8.koodi not in (1,5)


UNION ALL

--opiskelijat
select 
Tilastovuosi = tilastointivuosi

--,Sukupuoli = d1.sukupuoli
,[Tutkijanuravaihe] = null

,[Sektori] = d8.koulutussektori
,[Koulutusala 02] = d4.koulutusala2002
,[Koulutusala 95] = d4.koulutusala1995
,[OKM ohjauksen ala] = d4.OKM_ohjauksen_ala
,[Koodit Koulutusaste02] = d4.koulutusaste2002_koodi

,Korkeakoulu = d7.oppilaitos

--mittarit
,[henkilotyovuosi] = null
,fte = opiskelijat_fte
,tutkinnot = null

--järjestykset
,[Koulutusala 02 järj] = d4.jarjestys_koulutusala2002
,[Koulutusala 95 järj] = d4.jarjestys_koulutusala1995
,[OKM ohjauksen ala järj] = d4.jarjestys_OKM_ohjauksen_ala


from VipunenTK.dbo.[f_OTV_2_8_Korkeakouluopiskelijat] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d7 on d7.id=f.oppilaitos_id
left join VipunenTK.dbo.d_koulutussektori d8 on d8.id=f.koulutussektori_id
where tilastointivuosi>=2010 and aineisto='L'


UNION ALL

--tutkinnot
select 
Tilastovuosi = tilastointivuosi

--,Sukupuoli = d1.sukupuoli
,[Tutkijanuravaihe] = null

,[Sektori] = d8.koulutussektori
,[Koulutusala 02] = d4.koulutusala2002
,[Koulutusala 95] = d4.koulutusala1995
,[OKM ohjauksen ala] = d4.OKM_ohjauksen_ala
,[Koodit Koulutusaste02] = d4.koulutusaste2002_koodi

,Korkeakoulu = d7.oppilaitos
 

--mittarit
,[henkilotyovuosi] = null
,fte = null
,tutkinnot = tutkinnot

--järjestykset
,[Koulutusala 02 järj] = d4.jarjestys_koulutusala2002
,[Koulutusala 95 järj] = d4.jarjestys_koulutusala1995
,[OKM ohjauksen ala järj] = d4.jarjestys_OKM_ohjauksen_ala


from VipunenTK.dbo.[f_OTV_2_9_Korkeakoulututkinnot] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d7 on d7.id=f.oppilaitos_id
left join VipunenTK.dbo.d_koulutussektori d8 on d8.id=f.koulutussektori_id

where tilastointivuosi>=2010 and aineisto='L' and d4.koulutusaste2002_koodi in (62,71,72,82)

