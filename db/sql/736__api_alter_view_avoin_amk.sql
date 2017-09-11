IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.avoin_amk'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW api.avoin_amk AS
SELECT 1 AS a
'
GO

ALTER view api.avoin_amk as
select
[Tilastovuosi] = vuosi
,[Sukupuoli] = d1.sukupuoli_fi
,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala] = d3.selite_fi
,[Ammattikorkeakoulu] = d6.amk_nimi_fi
--mittarit
,f.osallistuneet
,null as opintopisteet_yht
,null as opintopisteet_amk
,null as opintopisteet_kansalaisopistot
,null as opintopisteet_kansanopistot
,null as opintopisteet_kesayo
,null as opintopisteet_muut
,null as opintopisteet_yo
,[Sektori] = 'Avoin amk'
--koodit
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Sukupuoli] = d1.sukupuoli_koodi
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Koulutusala] = d3.koodi

--oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset
,1000000000+ ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d2.id ASC, d3.id ASC, d6.id ASC) as defaultorder

from [dw].[f_amk_avoimen_opiskelijat] f
join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_koulutusala_2002 d3 on d3.id=f.d_koulutusala_2002_id
join dw.d_amk d6 on d6.id=f.d_amk_id

UNION ALL

select
[Tilastovuosi] = vuosi
,[Sukupuoli] = null
,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala] = d3.selite_fi
,[Ammattikorkeakoulu] = d6.amk_nimi_fi
--mittarit
,null
,f.avoinamk_op_lkm
,f.avoinamk_op_amk_lkm
,f.avoinamk_op_kansal_lkm
,f.avoinamk_op_kansan_lkm
,f.avoinamk_op_kesa_lkm
,f.avoinamk_op_muut_lkm
,f.avoinamk_op_yliop_lkm
,[Sektori] = 'Avoin amk'
--koodit
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Sukupuoli] = null
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Koulutusala] = d3.koodi

--oletusjärjestys sorttausta varten, 2000000000+ lajittelee alikyselyn tulokset
,2000000000+ ROW_NUMBER() OVER(ORDER BY f.id ASC, d2.id ASC, d3.id ASC, d6.id ASC) as defaultorder

from [dw].[f_amk_opintopisteet] f
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_koulutusala_2002 d3 on d3.id=f.d_koulutusala_2002_id
join dw.d_amk d6 on d6.id=f.d_amk_id


UNION ALL

select
[Tilastovuosi] = vuosi
,[Sukupuoli] = d1.sukupuoli_fi
,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala] = d3.selite_fi
,[Ammattikorkeakoulu] = d6.amk_nimi_fi
--mittarit
,osallistuneet
,null
,null
,null
,null
,null
,null
,null
,[Sektori] = 'Maahanmuuttajat'
--koodit
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Sukupuoli] = d1.sukupuoli_koodi
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Koulutusala] = d3.koodi

--oletusjärjestys sorttausta varten, 3000000000+ lajittelee alikyselyn tulokset
,3000000000+ ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d2.id ASC, d3.id ASC, d6.id ASC) as defaultorder

from [dw].[f_amk_maahanmuuttajien_valmentava_koulutus] f
join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_koulutusala_2002 d3 on d3.id=f.d_koulutusala_2002_id
join dw.d_amk d6 on d6.id=f.d_amk_id

UNION ALL

select
[Tilastovuosi] = vuosi
,[Sukupuoli] = null
,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala] = d3.selite_fi
,[Ammattikorkeakoulu] = d6.amk_nimi_fi
--mittarit
,null
,mamu_op_lkm
,null
,null
,null
,null
,null
,null
,[Sektori] = 'Maahanmuuttajat'
--koodit
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Sukupuoli] = null
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Koulutusala] = d3.koodi

--oletusjärjestys sorttausta varten, 3000000000+ lajittelee alikyselyn tulokset
,3000000000+ ROW_NUMBER() OVER(ORDER BY f.id ASC, d2.id ASC, d3.id ASC, d6.id ASC) as defaultorder

from [dw].[f_amk_opintopisteet] f
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_koulutusala_2002 d3 on d3.id=f.d_koulutusala_2002_id
join dw.d_amk d6 on d6.id=f.d_amk_id




GO
/* revert
drop view api.avoin_amk
--*/
