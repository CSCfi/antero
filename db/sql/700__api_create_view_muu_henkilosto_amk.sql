IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.muu_henkilosto_amk'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW api.muu_henkilosto_amk AS
SELECT 1 AS a
'
GO

ALTER view api.muu_henkilosto_amk as

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

--oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset

,1000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d2.id ASC, d3.id ASC, d6.id ASC) as defaultorder

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

--oletusjärjestys sorttausta varten, 2000000000+ lajittelee alikyselyn tulokset

,2000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d6.id ASC) as defaultorder


from [dw].[f_amk_ostopalveluna_hankittu_tyo] f
join dw.d_amk_muun_henkilokunnan_henkilostoryhma d1 on d1.id=f.d_henkilostoryhma_id
join dw.d_amk d6 on d6.id=f.d_amk_id

order by defaultorder ASC
GO


/* revert
drop view api.muu_henkilosto_amk
--*/
