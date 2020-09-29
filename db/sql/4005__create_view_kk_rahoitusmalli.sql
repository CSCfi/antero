USE [ANTERO]
GO
/****** Object:  View [dw].[v_kk_rahoitusmalli]    Script Date: 29.9.2020 13:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_kk_rahoitusmalli]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dw].[v_kk_rahoitusmalli] AS
  

SELECT 

	--Rahoitusmalli
	 coalesce(d8a.taso1_fi,d8b.taso1_fi) as ''Rahoituksen kategoria''
	,coalesce(d8a.taso2_fi,d8b.taso2_fi) as ''Rahoituksen alakategoria''
	,coalesce(d8a.taso3_fi,d8b.taso3_fi) as ''Indikaattori''

	,Q.tilastovuosi as ''Tilastovuosi''
	,Q.rahoitusvuosi as ''Rahoitusvuosi''
	,concat(coalesce(d8a.alkaa,d8b.alkaa),''–'',coalesce(d8a.paattyy,d8b.paattyy)) as ''Rahoituskausi''
	,coalesce(d8a.rahoitusosuus,d8b.rahoitusosuus) as ''rahoitus_osuus''

	,sektori
	,d1.koulutusastetaso1_fi as ''Koulutusaste, taso 1''
	,d1.koulutusastetaso2_fi ''Koulutusaste,taso 2''
	,d1.koulutusalataso1_fi as ''Koulutusala,taso 1''
	,d1.koulutusalataso2_fi as ''Koulutusala,taso 2''
	,d1.koulutusalataso3_fi as ''Koulutusala,taso 3''
	--,d1.koulutusluokitus_fi as ''Koulutusnimike''
	,d2.ohjauksenala_nimi_fi as ''OKM ohjauksen ala''
	,coalesce(d4a.selite_fi,d4b.selite_fi) as ''Rahoitusmalliala''
	,d5.kytkin_fi as ''Tutkintojen rahoitusraja ylittyy''

	,case when Q.rahoitusvuosi > year(d3.loppupvm) then d3.organisaatio_fi else d3.organisaatio_vanha_fi end as ''Organisaatio''
      
	--lkm
	,mittari = lkm * (case when d5.kytkin_koodi = 1 then paino_tutkinnot_rahoitusraja * paino_rahoitusala_ka else paino end)
	,mittari_painottamaton = lkm
	,tutkintoraja

	--apusarake
	,rahoitusmalliala_tutkintotavoite =	case when Q.tutkintoraja_alakohtainen = 1 then coalesce(d4a.selite_fi,d4b.selite_fi) else '''' end

	--Koodit
	,d2.ohjauksenala_koodi as ''Koodit OKM ohjauksen ala''
	,d1.koulutusluokitus_koodi as ''Koodit Koulutusnimike''
	,case when Q.rahoitusvuosi > year(d3.loppupvm) then d3.organisaatio_nykyinen_koodi else d3.organisaatio_koodi end as ''Koodit Organisaatio''

	--Järjestykset
	,d1.jarjestys_koulutusastetaso1_koodi as ''jarjestys_koulutusaste_taso1''
	,d1.jarjestys_koulutusastetaso2_koodi as ''jarjestys_koulutusaste_taso2''
	,d1.jarjestys_koulutusalataso1_koodi as ''jarjestys_koulutusala_taso1''
	,d1.jarjestys_koulutusalataso2_koodi as ''jarjestys_koulutusala_taso2''
	,d1.jarjestys_koulutusalataso3_koodi as ''jarjestys_koulutusala_taso3''
	,d2.jarjestys_ohjauksenala_koodi as ''jarjestys_okmohjauksenala''
	,coalesce(d4a.jarjestys,d4b.jarjestys) as ''jarjestys_rahoitusmalliala''
	,coalesce(d8a.taso1_jarjestys,d8b.taso1_jarjestys) as ''jarjestys_rahoituskategoria1''
	,coalesce((select min(d.taso2_jarjestys) from dw.d_rahoitusmalli_amk d where d.taso2_fi=d8a.taso2_fi),(select min(d.taso2_jarjestys) from dw.d_rahoitusmalli_yo d where d.taso2_fi=d8b.taso2_fi)) as ''jarjestys_rahoituskategoria2''
	,coalesce((select min(d.taso3_jarjestys) from dw.d_rahoitusmalli_amk d where d.taso3_fi=d8a.taso3_fi),(select min(d.taso3_jarjestys) from dw.d_rahoitusmalli_yo d where d.taso3_fi=d8b.taso3_fi)) as ''jarjestys_rahoituskategoria3''


FROM (

	SELECT 
		 [rahoitusvuosi]
		,[tilastovuosi]
		,[d_rahoitusmalli_amk_id]
		,[d_rahoitusmalli_yo_id] = null
		,[d_koulutusluokitus_id]
		,[d_ohjauksenala_id]
		,[d_amk_rahoitusmalliala_id]
		,[d_yo_rahoitusmalliala_id] = null
		,[d_organisaatioluokitus_id]
		,[d_kytkin_tutkintojen_rahoitusraja_ylittyy_id]
		,[lkm]
		,[paino]
		,[paino_tutkinnot_rahoitusraja]
		,[paino_rahoitusala_ka]
		,[tutkintoraja]
		,[tutkintoraja_alakohtainen]
		,[sektori] = ''amk''
	FROM [dw].[f_rahoitusmalli_amk] 

	UNION ALL

	SELECT 
		 [rahoitusvuosi]
		,[tilastovuosi]
		,[d_rahoitusmalli_amk_id] = null
		,[d_rahoitusmalli_yo_id]
		,[d_koulutusluokitus_id]
		,[d_ohjauksenala_id]
		,[d_amk_rahoitusmalliala_id] = null
		,[d_yo_rahoitusmalliala_id]
		,[d_organisaatioluokitus_id]
		,[d_kytkin_tutkintojen_rahoitusraja_ylittyy_id]
		,[lkm]
		,[paino]
		,[paino_tutkinnot_rahoitusraja]
		,[paino_rahoitusala_ka]
		,[tutkintoraja]
		,[tutkintoraja_alakohtainen]
		,[sektori] = ''yo''
	FROM [dw].[f_rahoitusmalli_yo] 

) Q
	
left join dw.d_koulutusluokitus d1 on d1.id = Q.d_koulutusluokitus_id
left join dw.d_ohjauksenala d2 on d2.id = Q.d_ohjauksenala_id
left join dw.d_organisaatioluokitus d3 on d3.id = Q.d_organisaatioluokitus_id
left join dw.d_amk_rahoitusmalliala d4a on d4a.id = Q.d_amk_rahoitusmalliala_id
left join dw.d_yo_rahoitusmalliala d4b on d4b.id = Q.d_yo_rahoitusmalliala_id
left join dw.d_kytkin d5 on d5.id = Q.d_kytkin_tutkintojen_rahoitusraja_ylittyy_id
left join dw.d_rahoitusmalli_amk d8a on d8a.id = Q.d_rahoitusmalli_amk_id
left join dw.d_rahoitusmalli_yo d8b on d8b.id = Q.d_rahoitusmalli_yo_id

WHERE 1=1
and d3.organisaatio_koodi not in (''02358'', ''01740'', ''01742'', ''01717'') 
and d3.organisaatio_fi not in (''Poliisiammattikorkeakoulu'',''Högskolan på Åland'',''Maanpuolustuskorkeakoulu'')



' 
