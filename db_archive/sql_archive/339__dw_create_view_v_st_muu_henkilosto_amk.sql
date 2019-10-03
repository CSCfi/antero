
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_st_muu_henkilosto_amk]'))
EXEC dbo.sp_executesql @statement = N'



create view [dw].[v_st_muu_henkilosto_amk] as

select 

[Tilastovuosi] = vuosi

,[Henkilöstöryhmä] = null

,Koulutusala = d2.selite_fi
,[OKM ohjauksen ala] = d3.ohjauksenala_nimi_fi

,[Ammattikorkeakoulu] = d6.amk_nimi_fi

--mittarit
,f.sivutoimisten_tuntiopettajien_opetustunnit
,f.ostopalveluna_hankittu_tuntiopetus
,null as henkilostoryhman_tunnit_lkm


--koodit
,[Koodit Koulutusala] = d2.koodi
,[Koodit OKM ohjauksen ala] = d3.ohjauksenala_koodi
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Henkilöstöryhmä] = null



from [dw].[f_amk_sivutoimiset_opettajat] f
join dw.d_koulutusala_2002 d2 on d2.id=f.d_koulutusala_id
join dw.d_ohjauksenala d3 on d3.id=f.d_ohjauksenala_id
join dw.d_amk d6 on d6.id=f.d_amk_id


union all

select 

[Tilastovuosi] = vuosi

,[Henkilöstöryhmä] = d1.selite_fi

,Koulutusala = null
,[OKM ohjauksen ala] = null

,[Ammattikorkeakoulu] = d6.amk_nimi_fi

--mittarit
,null
,null
,henkilostoryhman_tunnit_lkm


--koodit
,[Koodit Koulutusala] = null
,[Koodit OKM ohjauksen ala] = null
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Henkilöstöryhmä] = d1.koodi



from [dw].[f_amk_ostopalveluna_hankittu_tyo] f
join dw.d_amk_muun_henkilokunnan_henkilostoryhma d1 on d1.id=f.d_henkilostoryhma_id
join dw.d_amk d6 on d6.id=f.d_amk_id


'


