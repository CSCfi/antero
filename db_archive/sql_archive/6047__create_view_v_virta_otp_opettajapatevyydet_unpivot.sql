USE [ANTERO]
GO

DROP VIEW IF EXISTS [sa].[v_virta_otp_opettajapatevyydet_unpivot]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [sa].[v_virta_otp_opettajapatevyydet_unpivot] AS

--Pätevyydet yhteen sarakkeeseen
SELECT
	Q.*
	,vp.patevyysryhma1_koodi
	,vp.patevyysryhma1_fi
	,d.organisaatio_fi
	,patevyys_hyvaksytaan = 
		case 
			when d.oppilaitostyyppi_koodi=41 and Q.patevyys_koodi in ('ik','il','im','ip','in','io','iu','is','it','ir')  then 0
			else 1
		end
	--,alempi_kk = case when kl.koulutusastetaso2_koodi='63' then 1 else 0 end
	--,ylempi_kk = case when kl.koulutusastetaso2_koodi='72' then 1 else 0 end
FROM (
	SELECT distinct
		 opiskelija_avain_org
		,opiskelija_avain
		,vuosi
		,sukupuolikoodi
		,ika
		,organisaatiokoodi
		,patevyys_nro = RIGHT(patevyydet_selite,1)
		,patevyys_koodi
		,patevyys_selite
		,patevyys_vuosi
		,patevyys_oppilaitos
		,tutkinto_koodi
		,tutkinto_vuosi
		,tutkinto_oppilaitos
		,tutkinnon_yhteydessa = case when patevyys_selite not like '%erilliset%' and patevyys_koodi != 'ja' then 1 else 0 end
		,erillinen = case when patevyys_selite like '%erilliset%' or patevyys_koodi = 'ja' then 1 else 0 end
		,rnk_tutkinto = dense_rank() over (partition by opiskelija_avain_org,vuosi order by left(coalesce(tutkinto_koodi,'111111'),1) desc,tutkinto_vuosi desc)
		,rnk_patevyys = dense_rank() over (partition by opiskelija_avain_org order by patevyys_vuosi)
	FROM (

		SELECT 
			 sa1.vuosi
			,sa1.organisaatiokoodi
			,sa1.opiskelija_avain
			,opiskelija_avain_org = concat(sa1.organisaatiokoodi,sa1.opiskelija_avain)
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
			,sa1.oppilaitostunnus1
			,sa1.oppilaitostunnus2
			,sa1.oppilaitostunnus3
			,sa1.oppilaitostunnus4
			,sa1.oppilaitostunnus5
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
		--WHERE sa1.opiskelija_avain in ('13893528','15822233','17552211','17590625')

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

	unpivot (
	patevyys_oppilaitos for patevyydet_oppilaitos in ([oppilaitostunnus1],[oppilaitostunnus2],[oppilaitostunnus3],[oppilaitostunnus4],[oppilaitostunnus5])
	) unpvt4

	cross apply (
	values  
		([tkkoodi1],'tkkoodi1'),
		([tkkoodi2],'tkkoodi2'),
		([tkkoodi3],'tkkoodi3'),
		([tkkoodi4],'tkkoodi4'),
		([tkkoodi5],'tkkoodi5')
	) ca1 (tutkinto_koodi, tutkinnot_koodi)
				 
	cross apply (
	values  
		([tv1],'tv1'),
		([tv2],'tv2'),
		([tv3],'tv3'),
		([tv4],'tv4'),
		([tv5],'tv5')
	) ca2 (tutkinto_vuosi, tutkinnot_vuosi)

	cross apply (
	values  
		([toppilaitostunnus1],'tunn1'),
		([toppilaitostunnus2],'tunn2'),
		([toppilaitostunnus3],'tunn3'),
		([toppilaitostunnus4],'tunn4'),
		([toppilaitostunnus5],'tunn5')
	) ca3 (tutkinto_oppilaitos, tutkinnot_oppilaitos)

	WHERE RIGHT(patevyydet_selite,1) = RIGHT(patevyydet_koodi,1) 
	AND RIGHT(patevyydet_koodi,1) = RIGHT(patevyydet_vuodet,1) 
	AND RIGHT(tutkinnot_koodi,1) = RIGHT(tutkinnot_vuosi,1)
	AND RIGHT(tutkinnot_vuosi,1) = RIGHT(tutkinnot_oppilaitos,1)

) Q
LEFT JOIN dw.d_organisaatioluokitus d on d.organisaatio_koodi = Q.patevyys_oppilaitos
LEFT JOIN dw.d_virta_patevyydet vp on vp.patevyys_koodi=Q.patevyys_koodi
LEFT JOIN dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi=Q.tutkinto_koodi
WHERE rnk_tutkinto=1

GO

USE [ANTERO]
