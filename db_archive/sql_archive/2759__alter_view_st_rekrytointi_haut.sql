USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_rekrytointi_haut]    Script Date: 14.1.2020 14:18:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dw].[v_st_rekrytointi_haut] AS

 SELECT 
	 [Tilastovuosi] = f1.vuosi
	 
	,[Sektori] = 'Ammattikorkeakoulu'
	,[Korkeakoulu] = d1.amk_nimi_fi

	,[Kansainvälinen haku] = d2.kytkin_fi
	,[Kutsuhaku] = d6.kytkin_fi
	,[Yhteisprofessuuri] = d7.kytkin_fi
	
	,[Sukupuoli] = d5.sukupuoli_fi
	,[Kansalaisuus Suomi] = d3.kytkin_fi
	,[Kansalaisuus (maanosa)] = 
		case
			when d3.kytkin_koodi=1 then 'Suomi'
			when d4.maanosat0_koodi = 1 then 'Eurooppa (pl. Suomi)'
			else d4.maanosat0_fi
		end

	,f1.[hakunumero]
	,[Hakuavain] = CONCAT(f1.hakunumero, d1.amk_nykyinen_tunnus, vuosi) --, sukupuoli_koodi) --, d3.kytkin_koodi, coalesce(nullif(d4.maanosat0_koodi, -1),1))

	,sum([hakijat_lkm]) as hakijat_lkm

	--järjestys
	,[jarjestys kansainvalinen haku] = d2.jarjestys_kytkin_koodi
	,[jarjestys kutsuhaku] = d6.jarjestys_kytkin_koodi
	,[jarjestys yhteisprofessuuri] = d7.jarjestys_kytkin_koodi
	,[jarjestys sukupuoli] = d5.jarjestys_sukupuoli_koodi
	,[jarjestys kansalaisuus suomi] = d3.jarjestys_kytkin_koodi
	,[jarjestys kansalaisuus maanosa] = 
		case
			when d3.kytkin_koodi=1 then 0
			when d4.maanosat0_koodi = 1 then 1
			else d4.jarjestys_maanosat0_koodi
		end

 FROM dw.f_amk_rekrytointihaut f1
 JOIN dw.d_amk d1 ON d1.id=f1.d_korkeakoulu_id
 JOIN dw.d_kytkin d2 ON d2.id=f1.d_kytkin_haun_kansainvalisyys_id
 JOIN dw.d_kytkin d3 ON d3.id=f1.d_kytkin_kansalaisuus_suomi_id
 JOIN dw.d_rekrytointi_maanosat d4 ON d4.id=f1.d_rekrytointi_maanosa_id
 JOIN dw.d_sukupuoli d5 ON d5.id=f1.d_sukupuoli_id
 JOIN dw.d_kytkin d6 ON d6.id='-1'
 JOIN dw.d_kytkin d7 ON d7.id='-1'
 --WHERE --hakijat_lkm > 0
 --Hakunumero+amk_tunnus IN (SELECT DISTINCT Hakunumero+amk_tunnus FROM ANTERO.dw.f_amk_rekrytointi_valitut JOIN dw.d_amk d1 ON d1.id=d_korkeakoulu_id)

 GROUP BY f1.vuosi,d1.amk_nimi_fi,d2.kytkin_fi,d6.kytkin_fi,d7.kytkin_fi,d5.sukupuoli_fi,d3.kytkin_fi,d4.maanosat0_fi,f1.hakunumero,d1.amk_nykyinen_tunnus,d2.jarjestys_kytkin_koodi,d6.jarjestys_kytkin_koodi,d7.jarjestys_kytkin_koodi,d5.jarjestys_sukupuoli_koodi,d3.jarjestys_kytkin_koodi,d3.kytkin_koodi,d4.jarjestys_maanosat0_koodi,d4.maanosat0_koodi
 ,sukupuoli_koodi


 UNION ALL

 SELECT
	 [Tilastovuosi] = f2.vuosi

	,[Sektori] = 'Yliopisto'
	,[Korkeakoulu] = d1.yo_nimi_fi

	,[Kansainvälinen haku] = d2.kytkin_fi
	,[Kutsuhaku] = d6.kytkin_fi
	,[Yhteisprofessuuri] = d7.kytkin_fi

	,[Sukupuoli] = d5.sukupuoli_fi
	,[Kansalaisuus Suomi] = d3.kytkin_fi
	,[Kansalaisuus (maanosa)] = 
		case
			when d3.kytkin_koodi=1 then 'Suomi'
			when d4.maanosat0_koodi = 1 then 'Eurooppa (pl. Suomi)'
			else d4.maanosat0_fi
		end

	,f2.[hakunumero]
	,[Hakuavain] = CONCAT(f2.hakunumero, d1.yo_nykyinen_tunnus, vuosi) --, sukupuoli_koodi) --, d3.kytkin_koodi, coalesce(nullif(d4.maanosat0_koodi, -1),1))

	,sum([hakijat_lkm]) as hakijat_lkm

	--järjestys
	,[jarjestys kansainvalinen haku] = d2.jarjestys_kytkin_koodi
	,[jarjestys kutsuhaku] = d6.jarjestys_kytkin_koodi
	,[jarjestys yhteisprofessuuri] = d7.jarjestys_kytkin_koodi
	,[jarjestys sukupuoli] = d5.jarjestys_sukupuoli_koodi
	,[jarjestys kansalaisuus suomi] = d3.jarjestys_kytkin_koodi
	,[jarjestys kansalaisuus maanosa] = 
		case
			when d3.kytkin_koodi=1 then 0
			when d4.maanosat0_koodi = 1 then 1
			else d4.jarjestys_maanosat0_koodi
		end

 FROM dw.f_yo_rekrytointihaut f2
 JOIN dw.d_yo d1 ON d1.id=f2.d_yliopisto_id
 JOIN dw.d_kytkin d2 ON d2.id=f2.d_kytkin_haun_kansainvalisyys_id
 JOIN dw.d_kytkin d3 ON d3.id=f2.d_kytkin_kansalaisuus_suomi_id
 JOIN dw.d_rekrytointi_maanosat d4 ON d4.id=f2.d_rekrytointi_maanosa_id
 JOIN dw.d_sukupuoli d5 ON d5.id=f2.d_sukupuoli_id
 JOIN dw.d_kytkin d6 ON d6.id=f2.d_kytkin_kutsuhaku_id
 JOIN dw.d_kytkin d7 ON d7.id=f2.d_kytkin_yhteisprofessuuri_id
 --WHERE --hakijat_lkm > 0
 --hakunumero+yo_tunnus IN (SELECT DISTINCT Hakunumero+yo_tunnus FROM ANTERO.dw.f_yo_rekrytointi_valitut JOIN dw.d_yo d1 ON d1.id=d_yliopisto_id
 --)
 GROUP BY f2.vuosi,d1.yo_nimi_fi,d2.kytkin_fi,d6.kytkin_fi,d7.kytkin_fi,d5.sukupuoli_fi,d3.kytkin_fi,d4.maanosat0_fi,f2.hakunumero,d1.yo_nykyinen_tunnus,d2.jarjestys_kytkin_koodi,d6.jarjestys_kytkin_koodi,d7.jarjestys_kytkin_koodi,d5.jarjestys_sukupuoli_koodi,d3.jarjestys_kytkin_koodi,d3.kytkin_koodi,d4.maanosat0_koodi,d4.jarjestys_maanosat0_koodi
 ,sukupuoli_koodi







