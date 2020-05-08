USE [ANTERO]
GO
/****** Object:  View [sa].[v_virta_otp_opettajapatevyydet3]    Script Date: 8.5.2020 11:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_virta_otp_opettajapatevyydet1]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [sa].[v_virta_otp_opettajapatevyydet1] AS

--Pätevyydet yhteen sarakkeeseen

SELECT distinct
	 opiskelija_avain = organisaatiokoodi+opiskelija_avain
	,opiskelija = opiskelija_avain
	,vuosi
	,sukupuolikoodi
	,ika
	,organisaatiokoodi
	,patevyys_nro = RIGHT(patevyydet_selite,1)
	,patevyys_koodi
	,patevyys_selite
	,patevyys_vuosi
	,tutkinto_koodi
	,tutkinto_vuosi
	,tutkinto_organisaatio
	,tutkinnon_yhteydessa = case when patevyys_selite not like ''%erilliset%'' then 1 else 0 end
	,erillinen = case when patevyys_selite like ''%erilliset%'' then 1 else 0 end
FROM (

	SELECT 
		 sa1.vuosi
		,sa1.organisaatiokoodi
		,sa1.opiskelija_avain
		,sa1.sukupuolikoodi
		,sa1.ika
		,sa1.patevyyskoodi1
		,sa1.patevyyskoodi2
		,sa1.patevyyskoodi3
		,sa1.patevyyskoodi4
		,sa1.patevyyskoodi5
		,sa1.patevyysselite1
		,sa1.patevyysselite2
		,sa1.patevyysselite3
		,sa1.patevyysselite4
		,sa1.patevyysselite5
		,sa1.Patevyysmerk_vuosi1
		,sa1.Patevyysmerk_vuosi2
		,sa1.Patevyysmerk_vuosi3
		,sa1.Patevyysmerk_vuosi4
		,sa1.Patevyysmerk_vuosi5
		,tkkoodi1 = coalesce(sa1.tkkoodi1,sa2.tkkoodi1)
		,tkkoodi2 = coalesce(sa1.tkkoodi2,sa2.tkkoodi2)
		,tkkoodi3 = coalesce(sa1.tkkoodi3,sa2.tkkoodi3)
		,tkkoodi4 = coalesce(sa1.tkkoodi4,sa2.tkkoodi4)
		,tkkoodi5 = coalesce(sa1.tkkoodi5,sa2.tkkoodi5)
		,tv1 = coalesce(sa1.tv1,sa2.tv1)
		,tv2 = coalesce(sa1.tv2,sa2.tv2)
		,tv3 = coalesce(sa1.tv3,sa2.tv3)
		,tv4 = coalesce(sa1.tv4,sa2.tv4)
		,tv5 = coalesce(sa1.tv5,sa2.tv5)
		,toppilaitostunnus1 = coalesce(sa1.toppilaitostunnus1,sa2.toppilaitostunnus1)
		,toppilaitostunnus2 = coalesce(sa1.toppilaitostunnus2,sa2.toppilaitostunnus2)
		,toppilaitostunnus3 = coalesce(sa1.toppilaitostunnus3,sa2.toppilaitostunnus3)
		,toppilaitostunnus4 = coalesce(sa1.toppilaitostunnus4,sa2.toppilaitostunnus4)
		,toppilaitostunnus5 = coalesce(sa1.toppilaitostunnus5,sa2.toppilaitostunnus5)

	FROM [ANTERO].[sa].[sa_virta_otp_opettajapatevyydet] sa1
	--datassa henkilöitä joiden tiedot kahdella rivillä joista toiselta puuttuu pohjatutkintotiedot
	LEFT JOIN ANTERO.sa.sa_virta_otp_opettajapatevyydet sa2 on sa2.opiskelija_avain=sa1.opiskelija_avain 
														   and sa2.db=sa1.db 
														   and sa2.vuosi=sa1.vuosi 
														   and sa1.tkkoodi1 is null 
														   and sa2.tkkoodi1 is not null
	--WHERE sa1.opiskelija_avain in (''13893528'',''15822233'',''17552211'',''17590625'')

) Q
	
unpivot (
patevyys_koodi for patevyydet_koodi in ([patevyyskoodi1],[patevyyskoodi2],[patevyyskoodi3],[patevyyskoodi4],[patevyyskoodi5])
) unpvt1

unpivot (
patevyys_selite for patevyydet_selite in ([patevyysselite1],[patevyysselite2],[patevyysselite3],[patevyysselite4],[patevyysselite5])
) unpvt2

unpivot (
patevyys_vuosi for patevyydet_vuodet in ([Patevyysmerk_vuosi1],[Patevyysmerk_vuosi2],[Patevyysmerk_vuosi3],[Patevyysmerk_vuosi4],[Patevyysmerk_vuosi5])
) unpvt3

cross apply (
values  
	([tkkoodi1],''tkkoodi1''),
	([tkkoodi2],''tkkoodi2''),
	([tkkoodi3],''tkkoodi3''),
	([tkkoodi4],''tkkoodi4''),
	([tkkoodi5],''tkkoodi5'')
) ca1 (tutkinto_koodi, tutkinnot_koodi)
				 
cross apply (
values  
	([tv1],''tv1''),
	([tv2],''tv2''),
	([tv3],''tv3''),
	([tv4],''tv4''),
	([tv5],''tv5'')
) ca2 (tutkinto_vuosi, tutkinnot_vuosi)

cross apply (
values  
	([toppilaitostunnus1],''tunn1''),
	([toppilaitostunnus2],''tunn2''),
	([toppilaitostunnus3],''tunn3''),
	([toppilaitostunnus4],''tunn4''),
	([toppilaitostunnus5],''tunn5'')
) ca3 (tutkinto_organisaatio, tutkinnot_organisaatio)

WHERE RIGHT(patevyydet_selite,1) = RIGHT(patevyydet_koodi,1) 
AND RIGHT(patevyydet_koodi,1) = RIGHT(patevyydet_vuodet,1) 
AND RIGHT(tutkinnot_koodi,1) = RIGHT(tutkinnot_vuosi,1)
AND RIGHT(tutkinnot_vuosi,1) = RIGHT(tutkinnot_organisaatio,1)

' 


GO
/****** Object:  View [sa].[v_virta_otp_opettajapatevyydet2]    Script Date: 8.5.2020 11:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_virta_otp_opettajapatevyydet2]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [sa].[v_virta_otp_opettajapatevyydet2] AS

--Pätevyyksien ryhmittely

SELECT
	 opiskelija_avain
	,opiskelija
	,vuosi
	,sukupuoli_koodi = sukupuolikoodi
	,ika
	,organisaatio_koodi = organisaatiokoodi
	,patevyys_vuosi
	,[Varhaiskasvatuksen tehtäviin ammatillisia valmiuksia antavat opinnot] = case when [vo] is not null or [iq] is not null or [ke] is not null or [vs] is not null then 1 else 0 end
	,[Aineenopettajan pedagogiset opinnot] = case when [ik] is not null or [il] is not null or [im] is not null then 1 else 0 end
	,[Ammatillinen opettajakoulutus] = case when [ja] is not null or [jb] is not null or [ix] is not null then 1 else 0 end
	,[Perusopetuksessa opetettavien aineiden ja aihekokonaisuuksien monialaiset opinnot] = case when [in] is not null or [io] is not null or [ip] is not null then 1 else 0 end
	,[Erityisopettajan opinnot] = case when [is] is not null or [it] is not null or [iu] is not null then 1 else 0 end
	,[Opinto-ohjaajan opinnot] = case when [iv] is not null or [iw] is not null or [iy] is not null or [jc] is not null then 1 else 0 end
	,[Erityislastentarhanopettajan opinnot] = case when [ir] is not null then 1 else 0 end
	,tutkinto_koodi --= case when rnk_tutkinto_vuosi = 1 then tutkinto_koodi else null end
	,tutkinto_vuosi --= case when rnk_tutkinto_vuosi = 1 then tutkinto_vuosi else null end
	,tutkinto_organisaatio --= case when rnk_tutkinto_vuosi = 1 then tutkinto_organisaatio else null end
	,tutkinnon_yhteydessa
	,erillinen_eka = case when erillinen = 1 and rnk_patevyys_vuosi = 1 then 1 else 0 end
	,erillinen_tayd = case when erillinen = 1 and rnk_patevyys_vuosi != 1 then 1 else 0 end
	,rnk_tutkinto_vuosi
	,rnk_patevyys_vuosi
FROM (

	SELECT 
		 opiskelija_avain
		,opiskelija
		,vuosi
		,sukupuolikoodi
		,ika
		,organisaatiokoodi
		,patevyys_nro
		,q1.patevyys_koodi
		,d.patevyysryhma1_koodi
		,patevyys_selite
		,patevyys_vuosi
		,tutkinnon_yhteydessa
		,erillinen
		,tutkinto_koodi
		,tutkinto_vuosi
		,tutkinto_organisaatio
		,case 
			when d.patevyysryhma1_fi = ''opettajaaineet'' then null 
			else rank() over (partition by opiskelija_avain order by d.patevyysryhma1_fi, patevyys_vuosi, patevyys_nro, erillinen) 
		 end rnk_patevyys_vuosi
		,rank() over (partition by opiskelija_avain order by COALESCE(NULLIF(tutkinto_koodi,''999999''),''111111'') desc) rnk_tutkinto_vuosi
	FROM sa.v_virta_otp_opettajapatevyydet1 q1
	LEFT JOIN ANTERO.dw.d_virta_patevyydet d on d.patevyys_koodi = q1.patevyys_koodi
			
	
) q2


pivot (
		min(patevyys_koodi) for patevyys_koodi in (
			[vo],[iq],[ke],[vs],		--varhais
			[ik],[il],[im],				--aineen
			[ip],[in],[io],				--perusopetus
			[iu],[is],[it],				--erityis
			[iy],[iv],[iw],				--opo
			[ir],						--erityislastentarha
			[ja],[jb],[jc],[ix]			--ammatillinen
		)
) pvt

--vain uusin tutkinto
WHERE rnk_tutkinto_vuosi = 1

'




IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_virta_otp_opettajapatevyydet3]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [sa].[v_virta_otp_opettajapatevyydet3] AS

--Kelpoisuudet yksittäin ja kaikki yhdessä


SELECT 
	v2.opiskelija_avain
	,opiskelija
	,v2.vuosi
	,sukupuoli_koodi
	,ika
	,organisaatio_koodi
	--kelpoisuudet
	,varhais --= MAX([Varhaiskasvatuksen tehtäviin ammatillisia valmiuksia antavat opinnot])
	,perusop --= MAX([Perusopetuksessa opetettavien aineiden ja aihekokonaisuuksien monialaiset opinnot])
	,aineen_pedag --= MAX([Aineenopettajan pedagogiset opinnot])
	,erityis --= MAX([Erityisopettajan opinnot])
	,opo --= MAX([Opinto-ohjaajan opinnot])
	,erityis_lastentarha --= MAX([Erityislastentarhanopettajan opinnot])
	,amm --= MAX([Ammatillinen opettajakoulutus])
	,kelp_lkm = LEN(kelp_avain) / 2
	,kelp_avain
	,kelp_avain2 = 
		CONCAT(
				 CASE WHEN [Aineenopettajan pedagogiset opinnot] = 1 THEN ''AI'' ELSE '''' END
				,CASE WHEN [Ammatillinen opettajakoulutus] = 1 THEN ''AM'' ELSE '''' END
				,CASE WHEN [Erityislastentarhanopettajan opinnot] = 1 THEN ''EL'' ELSE '''' END
				,CASE WHEN [Erityisopettajan opinnot] = 1 THEN ''ER'' ELSE '''' END
				,CASE WHEN [Opinto-ohjaajan opinnot] = 1 THEN ''OP'' ELSE '''' END
				,CASE WHEN [Perusopetuksessa opetettavien aineiden ja aihekokonaisuuksien monialaiset opinnot] = 1 THEN ''PE'' ELSE '''' END
				,CASE WHEN [Varhaiskasvatuksen tehtäviin ammatillisia valmiuksia antavat opinnot] = 1 THEN ''VA'' ELSE '''' END
			)
	--
	,tutkinto_koodi
	,tutkinto_vuosi
	,tutkinto_organisaatio
	--mittarit
	,tutkinnon_yhteydessa = tutkinnon_yhteydessa
	,erillinen_eka = erillinen_eka
	,erillinen_taydentava = erillinen_tayd
FROM sa.sa_opettajapatevyys v2
--kaikki kelpoisuudet yhdistettynä
LEFT JOIN (

	SELECT 
		opiskelija_avain
		,vuosi
		,kelp_avain = 
			CONCAT(
				 CASE WHEN MAX([Aineenopettajan pedagogiset opinnot]) = 1 THEN ''AI'' ELSE '''' END
				,CASE WHEN MAX([Ammatillinen opettajakoulutus]) = 1 THEN ''AM'' ELSE '''' END
				,CASE WHEN MAX([Erityislastentarhanopettajan opinnot]) = 1 THEN ''EL'' ELSE '''' END
				,CASE WHEN MAX([Erityisopettajan opinnot]) = 1 THEN ''ER'' ELSE '''' END
				,CASE WHEN MAX([Opinto-ohjaajan opinnot]) = 1 THEN ''OP'' ELSE '''' END
				,CASE WHEN MAX([Perusopetuksessa opetettavien aineiden ja aihekokonaisuuksien monialaiset opinnot]) = 1 THEN ''PE'' ELSE '''' END
				,CASE WHEN MAX([Varhaiskasvatuksen tehtäviin ammatillisia valmiuksia antavat opinnot]) = 1 THEN ''VA'' ELSE '''' END
			)
		,varhais = MAX([Varhaiskasvatuksen tehtäviin ammatillisia valmiuksia antavat opinnot])
		,perusop = MAX([Perusopetuksessa opetettavien aineiden ja aihekokonaisuuksien monialaiset opinnot])
		,aineen_pedag = MAX([Aineenopettajan pedagogiset opinnot])
		,erityis = MAX([Erityisopettajan opinnot])
		,opo = MAX([Opinto-ohjaajan opinnot])
		,erityis_lastentarha = MAX([Erityislastentarhanopettajan opinnot])
		,amm = MAX([Ammatillinen opettajakoulutus])
	FROM sa.sa_opettajapatevyys
	GROUP BY opiskelija_avain,vuosi
	
) ka on ka.opiskelija_avain = v2.opiskelija_avain and ka.vuosi = v2.vuosi

--GROUP BY v2.opiskelija_avain
--		,opiskelija
--		,v2.vuosi
--		,sukupuoli_koodi
--		,ika
--		,organisaatio_koodi
--		,kelp_avain
--		,tutkinnon_yhteydessa
--		,erillinen_eka
--		,erillinen_tayd
--		,[Aineenopettajan pedagogiset opinnot] 
--		,[Ammatillinen opettajakoulutus] 
--		,[Erityislastentarhanopettajan opinnot] 
--		,[Erityisopettajan opinnot] 
--		,[Opinto-ohjaajan opinnot] 
--		,[Perusopetuksessa opetettavien aineiden ja aihekokonaisuuksien monialaiset opinnot] 
--		,[Varhaiskasvatuksen tehtäviin ammatillisia valmiuksia antavat opinnot] 
--		,tutkinto_koodi
--		,tutkinto_vuosi
--		,tutkinto_organisaatio

' 



GO

/****** Object:  View [sa].[v_virta_otp_opettajapatevyydet4]    Script Date: 8.5.2020 11:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_virta_otp_opettajapatevyydet4]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [sa].[v_virta_otp_opettajapatevyydet4] AS


--Suoritustapa yhteen sarakkeeseen
SELECT distinct
	[opiskelija_avain]
	,[opiskelija]
	,[vuosi]
	,[sukupuoli_koodi]
	,[ika]
	,[organisaatio_koodi]
	,[varhais]
	,[perusop]
	,[aineen_pedag]
	,[erityis]
	,[opo]
	,[erityis_lastentarha]
	,[amm]
	,[kelp_lkm]
	,[kelp_avain]
	,[kelp_avain2]
	,[tutkinto_koodi]
	,[tutkinto_vuosi]
	,[tutkinto_organisaatio]
	,[suor_tapa]
FROM (
	SELECT 
		[opiskelija_avain]
		,[opiskelija]
		,[vuosi]
		,[sukupuoli_koodi]
		,[ika]
		,[organisaatio_koodi]
		,[varhais]
		,[perusop]
		,[aineen_pedag]
		,[erityis]
		,[opo]
		,[erityis_lastentarha]
		,[amm]
		,[kelp_lkm]
		,[kelp_avain]
		,[kelp_avain2]
		,[tutkinto_koodi]
		,[tutkinto_vuosi]
		,[tutkinto_organisaatio]
		,[tutkinnon_yhteydessa]
		,[erillinen_eka]
		,[erillinen_taydentava]
	FROM [ANTERO].[sa].[v_virta_otp_opettajapatevyydet3]
) q


unpivot (
	arvo for suor_tapa in ([tutkinnon_yhteydessa],[erillinen_eka],[erillinen_taydentava])
) unpvt


WHERE 1=1
AND arvo = 1
--pois sellaiset pätevyydet (esim. tietyn aineen), joita ei haluta raportille
AND LEN(kelp_avain2) > 0



' 








