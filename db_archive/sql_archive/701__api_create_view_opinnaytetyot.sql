IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.opinnaytetyot'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW api.opinnaytetyot AS
SELECT 1 AS a
'
GO

ALTER view api.opinnaytetyot as

select

[Tilastovuosi] = vuosi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 02] = d9.selite_fi
,[Koulutustyyppi] = d1.selite_fi
,Koulutusaste = case d1.selite_fi when 'Amk-tutkintoon johtava nuorten koulutus' then 'Ammattikorkeakoulututkinto' when 'Amk-tutkintoon johtava aikuiskoulutus' then 'Ammattikorkeakoulututkinto' when 'Ylempi ammattikorkeakoulututkinto' then 'Ylempi ammattikorkeakoulututkinto' else 'Tuntematon' end
,[Ammattikorkeakoulu] = d6.amk_nimi_fi

--mittarit
,[hankkeistetut_opinnaytetyot]
,[opinnaytetyot_ei_hankkeistetut]

--koodit
,[Koodit Koulutusala 2002] = case d9.koodi when -1 then 99 else d9.koodi end
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Koulutustyyppi] = d1.koodi

--oletussorttaus
,ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d2.id ASC, d6.id ASC, d9.id ASC) as defaultorder


from [dw].[f_amk_opinnaytetyot] f
join dw.d_amk_koulutustyyppi d1 on d1.id=f.d_koulutustyyppi_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksen_ala_id
join dw.d_amk d6 on d6.id=f.d_amk_id
join dw.d_koulutusala_2002 d9 on d9.id=f.d_koulutusala_id


GO

/* revert
drop view api.opinnaytetyot
--*/
