IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_avoin_amk'))
EXEC dbo.sp_executesql @statement = N'create view dw.v_avoin_amk as select 1 as a'
GO

alter view [dw].[v_avoin_amk] as

select 

[Tilastovuosi] = vuosi

,[Sukupuoli] = d1.sukupuoli_fi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala] = d3.selite_fi

,[Ammattikorkeakoulu] = d6.amk_nimi_fi

--mittarit
,f.osallistuneet


--koodit
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Sukupuoli] = d1.sukupuoli_koodi
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Koulutusala] = d3.koodi


from [dw].[f_amk_avoimen_opiskelijat] f
join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_koulutusala_2002 d3 on d3.id=f.d_koulutusala_2002_id
join dw.d_amk d6 on d6.id=f.d_amk_id
