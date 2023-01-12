USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_opettajakelpoisuudet_jaadytys]    Script Date: 12.1.2023 10:52:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_opettajakelpoisuudet_jaadytys] AS

DECLARE @alkuVuosi nvarchar(5)
DECLARE @sql1 nvarchar(max)
DECLARE @sql2 nvarchar(max)
DECLARE @sql3 nvarchar(max)
DECLARE @sql4 nvarchar(max)
DECLARE @sql5 nvarchar(max)
DECLARE @sql6 nvarchar(max)
DECLARE @sql7 nvarchar(max)
DECLARE @sql8 nvarchar(max)
DECLARE @sql9 nvarchar(max)

SET @alkuVuosi = '2021'

DROP TABLE IF EXISTS ANTERO.dbo.pat_temp_1
DROP TABLE IF EXISTS ANTERO.dbo.pat_temp_2
DROP TABLE IF EXISTS ANTERO.dbo.pat_temp_3
DROP TABLE IF EXISTS ANTERO.dbo.pat_temp_4
DROP TABLE IF EXISTS ANTERO.dbo.pat_temp_5

TRUNCATE TABLE [dw].[f_virta_otp_opettajakelpoisuudet_jaadytys]

WHILE cast(@alkuVuosi as int) < YEAR(GETDATE())

BEGIN

	IF (SELECT COUNT(*) FROM ANTERO.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = concat('sa_virta_otp_ope_patevyydet_', @alkuVuosi)) >= 1

	BEGIN

	SET @sql1 =
	' select' +
		' pat.henkilo,' +
		' map.kelpoisuuskoodi as kelpoisuuskoodi1,' +
		' map2.kelpoisuuskoodi as kelpoisuuskoodi2,' +
		' pat.paivamaara as pvm1,' +
		' pat2.paivamaara as pvm2,' +
		' pat.organisaatiokoodi as organisaatiokoodi1,' +
		' pat2.organisaatiokoodi as organisaatiokoodi2,' +
		' aine.patevyyskoodi as ainepatevyys,' +
		' aine.organisaatiokoodi as aine_organisaatiokoodi,' +
		' aine.paivamaara as aine_pvm,' +
		' pat.patevyyskoodi,' +
		' pat2.patevyyskoodi as patevyyskoodi2' +
	' into ANTERO.dbo.pat_temp_1' +
	' from [sa].[sa_virta_otp_ope_patevyydet_' + @alkuVuosi + '] pat' +
	' left join [dw].[d_virta_patevyydet] d on d.patevyys_koodi = pat.patevyyskoodi' +
	' left join [sa].[virta_opettajapatevyys_mappaus] map on map.patevyyskoodi = pat.patevyyskoodi' +
	' left join (' +
		' select henkilo, patevyyskoodi, patevyysnimi, organisaatiokoodi, paivamaara' +
		' from [sa].[sa_virta_otp_ope_patevyydet_' + @alkuVuosi + '] s' +
		' left join [dw].[d_virta_patevyydet] d on d.patevyys_koodi = s.patevyyskoodi' +
		' where d.patevyysryhma1_fi = ' + '''' + 'opettaja' + '''' +
	' ) pat2 on pat2.henkilo = pat.henkilo and pat2.patevyyskoodi <> pat.patevyyskoodi' +
	' left join (' +
		' select henkilo, patevyyskoodi , organisaatiokoodi, paivamaara' +
		' from [sa].[sa_virta_otp_ope_patevyydet_' + @alkuVuosi + '] s' +
		' left join [dw].[d_virta_patevyydet] d on d.patevyys_koodi = s.patevyyskoodi' +
		' where d.patevyysryhma1_fi = ' + '''' + 'opettajaaineet' + '''' +
	' ) aine on aine.henkilo = pat.henkilo' +
	' left join [sa].[virta_opettajapatevyys_mappaus] map2 on map2.patevyyskoodi = pat2.patevyyskoodi' +
	' where d.patevyysryhma1_fi = ' + '''' + 'opettaja' + ''''

	SET @sql2 =
	' SELECT' + 
		' f.henkilo,' +  
		' f.kelpoisuus,' + 
		' f.organisaatiokoodi,' + 
		' YEAR(f.pvm) as vuosi,' + 
		' pvm,' + 
		' patevyyskoodi as patevyyskoodi1,' + 
		' patevyyskoodi2,' + 
		' aine_patevyyskoodi,' + 
		' organisaatiokoodi1,' + 
		' organisaatiokoodi2,' + 
		' aine_organisaatiokoodi,' + 
		' pvm1,' + 
		' pvm2,' + 
		' aine_pvm,' + 
		' yksi_org' + 
	' into ANTERO.dbo.pat_temp_2' + 
	' FROM (' + 
		' SELECT DISTINCT' + 
			' henkilo,' + 
			' CASE' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'OP' + '''' + ' AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') THEN ' + '''' + 'OP' + '''' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'ER' + '''' + ' AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') THEN ' + '''' + 'ER' + '''' +
				' WHEN kelpoisuuskoodi1 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') AND ainepatevyys is not null AND ainepatevyys not in (' + '''' + 'gf' + '''' + ',' + '''' + 'ms' + '''' + ') THEN ' + '''' + 'AI' + '''' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'PE' + '''' + ' AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') THEN ' + '''' + 'PE' + '''' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'EL' + '''' + ' AND kelpoisuuskoodi2 = ' + '''' + 'VA' + '''' + ' THEN ' + '''' + 'EL' + '''' +  
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'VA' + '''' + ' THEN ' + '''' + 'VA' + '''' +  
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'VS' + '''' + ' THEN ' + '''' + 'VS' + '''' +
			' END as kelpoisuus,' + 
			' CASE' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'OP' + '''' + ' AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') THEN' + 
					' CASE WHEN pvm1 < pvm2 THEN pvm2 ELSE pvm1 END' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'ER' + '''' + ' AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') THEN' + 
					' CASE WHEN pvm1 < pvm2 THEN pvm2 ELSE pvm1 END' + 
				' WHEN kelpoisuuskoodi1 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') AND ainepatevyys is not null AND ainepatevyys not in (' + '''' + 'gf' + '''' + ',' + '''' + 'ms' + '''' + ') THEN' + 
					' CASE WHEN pvm1 < aine_pvm THEN aine_pvm ELSE pvm1 END' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'PE' + '''' + ' AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') THEN' + 
					' CASE WHEN pvm1 < pvm2 THEN pvm2 ELSE pvm1 END' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'EL' + '''' + ' AND kelpoisuuskoodi2 = ' + '''' + 'VA' + '''' + ' THEN' + 
					' CASE WHEN pvm1 < pvm2 THEN pvm2 ELSE pvm1 END' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'VA' + '''' + ' THEN pvm1' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'VS' + '''' + ' THEN pvm1' +  
			' END as pvm,' + 
			' CASE' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'OP' + '''' + ' AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') THEN' + 
					' CASE WHEN pvm1 < pvm2 THEN organisaatiokoodi2 ELSE organisaatiokoodi1 END' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'ER' + '''' + ' AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') THEN' + 
					' CASE WHEN pvm1 < pvm2 THEN organisaatiokoodi2 ELSE organisaatiokoodi1 END' +  
				' WHEN kelpoisuuskoodi1 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') AND ainepatevyys is not null AND ainepatevyys not in (' + '''' + 'gf' + '''' + ',' + '''' + 'ms' + '''' + ') THEN' + 
					' CASE WHEN pvm1 < aine_pvm THEN aine_organisaatiokoodi ELSE organisaatiokoodi1 END' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'PE' + '''' + ' AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') THEN' + 
					' CASE WHEN pvm1 < pvm2 THEN organisaatiokoodi2 ELSE organisaatiokoodi1 END' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'EL' + '''' + ' AND kelpoisuuskoodi2 = ' + '''' + 'VA' + '''' + ' THEN' + 
					' CASE WHEN pvm1 < pvm2 THEN organisaatiokoodi2 ELSE organisaatiokoodi1 END' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'VA' + '''' + ' THEN organisaatiokoodi1' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'VS' + '''' + ' THEN organisaatiokoodi1' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'IX' + '''' + ' THEN organisaatiokoodi1' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'AI' + '''' + ' AND ainepatevyys is null THEN organisaatiokoodi1' + 
			' END as organisaatiokoodi,' + 
			' CASE' +  
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'OP' + '''' + ' AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') THEN' + 
					' CASE WHEN organisaatiokoodi1 <> organisaatiokoodi2 THEN 0 ELSE 1 END' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'ER' + '''' + ' AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') THEN' + 
					' CASE WHEN organisaatiokoodi1 <> organisaatiokoodi2 THEN 0 ELSE 1 END' + 
				' WHEN kelpoisuuskoodi1 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') AND ainepatevyys is not null AND ainepatevyys not in (' + '''' + 'gf' + '''' + ',' + '''' + 'ms' + '''' + ') THEN' + 
					' CASE WHEN organisaatiokoodi1 <> aine_organisaatiokoodi THEN 0 ELSE 1 END' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'PE' + '''' + ' AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') THEN' + 
					' CASE WHEN organisaatiokoodi1 <> organisaatiokoodi2 THEN 0 ELSE 1 END' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'EL' + '''' + ' AND kelpoisuuskoodi2 = ' + '''' + 'VA' + '''' + ' THEN' + 
					' CASE WHEN organisaatiokoodi1 <> organisaatiokoodi2 THEN 0 ELSE 1 END' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'VA' + '''' + ' THEN 1' + 
				' WHEN kelpoisuuskoodi1 = ' + '''' + 'VS' + '''' + ' THEN 1' + 
			' END as yksi_org,' + 
			' pvm1,' + 
			' pvm2,' + 
			' aine_pvm,' + 
			' organisaatiokoodi1,' + 
			' organisaatiokoodi2,' + 
			' aine_organisaatiokoodi,' + 
			' patevyyskoodi,' + 
			' patevyyskoodi2,' + 
			' ainepatevyys as aine_patevyyskoodi' + 
		' FROM ANTERO.dbo.pat_temp_1' + 
		' UNION' + 
		' SELECT DISTINCT' + 
			' henkilo,' + 
			' ' + '''' + 'PD' + '''' + ' as kelpoisuus,' + 
			' pvm1 as pvm,' + 
			' organisaatiokoodi1 as organisaatiokoodi,' + 
			' 1 as yksi_org,' + 
			' pvm1,' + 
			' NULL,' + 
			' NULL,' + 
			' organisaatiokoodi1,' + 
			' NULL,' + 
			' NULL,' + 
			' patevyyskoodi,' + 
			' NULL,' + 
			' NULL' + 
		' FROM ANTERO.dbo.pat_temp_1' + 
		' WHERE kelpoisuuskoodi1 in (' + '''' + 'AI' + '''' + ', ' + '''' + 'EL' + '''' + ', ' + '''' + 'JA' + '''' + ', ' + '''' + 'JB' + '''' + ', ' + '''' + 'JC' + '''' + ', ' + '''' + 'IX' + '''' + ') and ((ainepatevyys is not null and YEAR(aine_pvm) > YEAR(pvm1)) or ainepatevyys is null)' + 
		' UNION' + 
		' SELECT DISTINCT' + 
			' henkilo,' + 
			' kelpoisuuskoodi1 as kelpoisuus,' + 
			' pvm1 as pvm,' + 
			' organisaatiokoodi1 as organisaatiokoodi,' + 
			' 1 as yksi_org,' + 
			' pvm1,' + 
			' NULL,' + 
			' NULL,' + 
			' organisaatiokoodi1,' + 
			' NULL,' + 
			' NULL,' + 
			' patevyyskoodi,' + 
			' NULL,' + 
			' NULL' + 
		' FROM ANTERO.dbo.pat_temp_1' + 
		' WHERE kelpoisuuskoodi1 in (' + '''' + 'JA' + '''' + ', ' + '''' + 'JB' + '''' + ', ' + '''' + 'JC' + '''' + ', ' + '''' + 'IX' + '''' + ')' + 
		' UNION' +
		' SELECT DISTINCT' +
			' henkilo,' +
			' ' + '''' + 'ER' + '''' + ' as kelpoisuus,' +
			' pvm1 as pvm,' +
			' organisaatiokoodi1 as organisaatiokoodi,' +
			' 1 as yksi_org,' +
			' pvm1,' +
			' NULL,' +
			' NULL,' +
			' organisaatiokoodi1,' +
			' NULL,' +
			' NULL,' +
			' patevyyskoodi,' +
			' NULL,' +
			' NULL' +
		' FROM ANTERO.dbo.pat_temp_1' +
		' WHERE kelpoisuuskoodi1 in (' + '''' + 'EL' + '''' + ')' +
		' UNION' +
		' SELECT DISTINCT' +
			' henkilo,' +
			' ' + '''' + 'ER2' + '''' + ' as kelpoisuus,' +
			' CASE WHEN pvm1 < pvm2 THEN pvm2 ELSE pvm1 END as pvm,' +
			' CASE WHEN pvm1 < pvm2 THEN organisaatiokoodi2 ELSE organisaatiokoodi1 END as organisaatiokoodi,' +
			' CASE WHEN organisaatiokoodi1 = organisaatiokoodi2 THEN 1 ELSE 0 END as yksi_org,' +
			' pvm1,' +
			' pvm2,' +
			' NULL,' +
			' organisaatiokoodi1,' +
			' organisaatiokoodi2,' +
			' NULL,' +
			' patevyyskoodi,' +
			' patevyyskoodi2,' +
			' NULL' +
		' FROM ANTERO.dbo.pat_temp_1' +
		' WHERE kelpoisuuskoodi1 in (' + '''' + 'ER' + '''' + ') AND kelpoisuuskoodi2 in (' + '''' + 'AI' + '''' + ', ' + '''' + 'JA' + '''' + ', ' + '''' + 'JB' + '''' + ', ' + '''' + 'JC' + '''' + ', ' + '''' + 'IX' + '''' + ', ' + '''' + 'EL' + '''' + ')' +
		' UNION' + 
		' SELECT DISTINCT' + 
			' henkilo,' + 
			' ' + '''' + 'LA' + '''' + ' as kelpoisuus,' + 
			' CASE WHEN aine_pvm < pvm1 THEN pvm1 ELSE aine_pvm END as pvm,' + 
			' CASE WHEN aine_pvm < pvm1 THEN organisaatiokoodi1 ELSE aine_organisaatiokoodi END as organisaatiokoodi,' + 
			' CASE WHEN organisaatiokoodi1 <> aine_organisaatiokoodi THEN 0 ELSE 1 END as yksi_org,' + 
			' pvm1,' + 
			' NULL,' + 
			' aine_pvm,' + 
			' organisaatiokoodi1,' + 
			' NULL,' + 
			' aine_organisaatiokoodi,' + 
			' patevyyskoodi,' + 
			' NULL,' + 
			' ainepatevyys' + 
		' FROM ANTERO.dbo.pat_temp_1' + 
		' LEFT JOIN ANTERO.dw.d_organisaatioluokitus d on d.organisaatio_koodi = ANTERO.dbo.pat_temp_1.aine_organisaatiokoodi' + 
		' WHERE ainepatevyys in (' + '''' + 'gf' + '''' + ',' + '''' + 'ms' + '''' + ') and kelpoisuuskoodi1 in (' + '''' + 'AI' + '''' + ', ' + '''' + 'JA' + '''' + ', ' + '''' + 'JB' + '''' + ', ' + '''' + 'JC' + '''' + ', ' + '''' + 'EL' + '''' + ', ' + '''' + 'IX' + '''' + ')) f' + 
	' WHERE f.kelpoisuus is not null and henkilo is not null'

	SET @sql3 =
	' UPDATE ANTERO.dbo.pat_temp_2' +
	' SET aine_organisaatiokoodi = NULL, aine_pvm = NULL, aine_patevyyskoodi = NULL' +
	' WHERE kelpoisuus not in (' + '''' + 'AI' + '''' + ', ' + '''' + 'LA' + '''' + ')'

	SET @sql4 =
	' UPDATE ANTERO.dbo.pat_temp_2' +
	' SET organisaatiokoodi2 = NULL, pvm2 = NULL, patevyyskoodi2 = NULL' +
	' WHERE kelpoisuus in (' + '''' + 'AI' + '''' + ', ' + '''' + 'LA' + '''' + ')' 

	SET @sql5 =
	' UPDATE ANTERO.dbo.pat_temp_2' +
	' SET aine_organisaatiokoodi = NULL, aine_pvm = NULL, aine_patevyyskoodi = NULL, organisaatiokoodi2 = NULL, pvm2 = NULL, patevyyskoodi2 = NULL' +
	' WHERE kelpoisuus in (' + '''' + 'VA' + '''' + ', ' + '''' + 'VS' + '''' + ', ' + '''' + 'IX' + '''' + ')' 

	SET @sql6 = 
	' SELECT DISTINCT' +
		' p.henkilo,' +
		' p.kelpoisuus,' +
		' p.organisaatiokoodi,' +
		' ot.koulutuskoodi,' +
		' tutk.paivamaara as tutk_pvm,' +
		' ot.organisaatiokoodi as tutk_organisaatiokoodi,' +
		' case when p.yksi_org = 1 and ot.organisaatiokoodi = p.organisaatiokoodi then 1 else 0 end as yksi_org,' +
		' case when p.pvm < tutk.paivamaara then tutk.paivamaara else p.pvm end as pvm,' +
		' case when p.pvm1 > p.pvm2 and d1a.patevyys_fi like ' + '''' + '%erilliset%' + '''' + ' THEN 2 when p.pvm2 >= p.pvm1 and d1b.patevyys_fi like ' + '''' + '%erilliset%' + '''' + ' then 2 else 1 end as suoritustapa,' +
		' kork_tutk.koulutuskoodi as koulutuskoodi_korkein_tutkinto,' +
		' kork_tutk.organisaatio_koodi as organisaatiokoodi_korkein_tutkinto,' +
		' kork_tutk.vuosi as vuosi_korkein_tutkinto,' +
		' p.aine_patevyyskoodi,' +
		' p.aine_organisaatiokoodi,' +
		' p.aine_pvm,' +
		' p.patevyyskoodi1,' +
		' p.organisaatiokoodi1,' +
		' p.pvm1,' +
		' p.patevyyskoodi2,' +
		' p.organisaatiokoodi2,' +
		' p.pvm2,' +
		' p.pvm as kelp_pvm' +
	' INTO ANTERO.dbo.pat_temp_3' +
	' FROM ANTERO.dbo.pat_temp_2 p' +
	' left join sa.sa_virta_otp_ope_henkilotiedot_' + @alkuVuosi + ' h on h.henkilo=p.henkilo' +
	' left join dw.d_organisaatioluokitus ol on ol.organisaatio_koodi = p.organisaatiokoodi' +
	' left join (' +
		' select' +
			' henkilo' +
			' ,amk = min(case when kl.koulutusaste2002_koodi in (62,63,71,72,81,82) or kl.koulutusastetaso2_koodi in (62,63,71,72,81,82) then t.suorituspaivamaara end)' +
			' ,alempi_kk = min(case when kl.koulutusaste2002_koodi in (63,72,81,82) or kl.koulutusastetaso2_koodi in (63,72,81,82) then t.suorituspaivamaara end)' +
			' ,ylempi_kk = min(case when kl.koulutusaste2002_koodi in (72,81,82) or kl.koulutusastetaso2_koodi in (72,81,82) then t.suorituspaivamaara end)' +
		' from [sa].[sa_virta_otp_ope_tutkinnot_' + @alkuVuosi + '] t' +
		' left join dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi=t.koulutuskoodi' +
		' where t.koulutuskoodi <> ' + '''' + '999999' + '''' + 
		' group by henkilo' +
	' ) tutk_tyypit on tutk_tyypit.henkilo = p.henkilo' +
	' cross apply (' +
		' select' +
			' paivamaara =' +
				' case' +
					' when kelpoisuus in (' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ', ' + '''' + 'JC' + '''' + ', ' + '''' + 'LA' + '''' + ', ' + '''' + 'VS' + '''' + ') then tutk_tyypit.amk' +
					' when kelpoisuus = ' + '''' + 'VA' + '''' + ' and ol.oppilaitostyyppi_koodi = 41 then tutk_tyypit.amk' +
					' when kelpoisuus in (' + '''' + 'VA' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ',' + '''' + 'ER2' + '''' + ') then tutk_tyypit.alempi_kk' +
					' else tutk_tyypit.ylempi_kk' +
				' end' +		
	' ) tutk' +
	' LEFT JOIN [sa].[sa_virta_otp_ope_tutkinnot_' + @alkuVuosi + '] ot on ot.henkilo = p.henkilo and ot.suorituspaivamaara = tutk.paivamaara' +
	' LEFT JOIN [dw].[d_virta_patevyydet] d1a on d1a.patevyys_koodi = p.patevyyskoodi1' +
	' LEFT JOIN [dw].[d_virta_patevyydet] d1b on d1b.patevyys_koodi = p.patevyyskoodi2' +
	' OUTER APPLY (' +
		' select' +
			' vuosi' +
			' ,koulutuskoodi' +
			' ,organisaatio_koodi' +
		' from (' +
			' select' +
				' vuosi,' +
				' koulutuskoodi' +
				' ,t2.organisaatiokoodi as organisaatio_koodi' +
				' ,rnk = row_number() over (order by kl.koulutusastetaso2_koodi desc, t2.vuosi desc)' +
			' from [sa].[sa_virta_otp_ope_tutkinnot_' + @alkuVuosi + '] t2' +
			' left join dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi=t2.koulutuskoodi' +
			' where t2.suorituspaivamaara <= case when p.pvm < tutk.paivamaara then tutk.paivamaara else p.pvm end and t2.henkilo=p.henkilo and (kl.koulutusaste2002_koodi in (62,63,71,72,81,82) or kl.koulutusastetaso2_koodi in (62,63,71,72,81,82))' +
		' ) q' +
		' where rnk=1' +
	' ) kork_tutk' +
	' WHERE tutk.paivamaara is not null'

	SET @sql7 =
	' SELECT * INTO ANTERO.dbo.pat_temp_4 FROM (' +
	' SELECT' +
		' p.*,' +
		' rnk2 = row_number() over (' +
				' partition by henkilo, YEAR(pvm)' +
				' order by pri.sija)' +
	' FROM (' +
		' SELECT' +
			' p.*,' +
			' rnk = row_number() over (' +
					' partition by henkilo, case when kelpoisuus = ' + '''' + 'LA' + '''' + ' THEN ' + '''' + 'AI' + '''' + ' when kelpoisuus = ' + '''' + 'VA_ER' + '''' + ' then ' + '''' + 'EL' + '''' + ' else kelpoisuus end' +
					' order by case when kelpoisuus = ' + '''' + 'AI' + '''' + ' and kelpoisuudet_vuosi.kelpoisuudet like ' + '''' + '%LA%' + '''' + ' then 0 when kelpoisuus = ' + '''' + 'LA' + '''' + ' and kelpoisuudet_vuosi.kelpoisuudet like ' + '''' + '%AI%' + '''' + ' then 1 else 0 end, pvm, kelp_pvm, pvm1, pvm2, pvm3, pvm4, pvm5)' +
		' FROM (' + 
			' SELECT DISTINCT' +
			' p.henkilo,' +
			' p.kelpoisuus,' +
			' p.organisaatiokoodi,' +
			' p.tutk_organisaatiokoodi,' +
			' p.koulutuskoodi,' +
			' p.suoritustapa,' +
			' p.koulutuskoodi_korkein_tutkinto,' +
			' p.organisaatiokoodi_korkein_tutkinto,' +
			' p.vuosi_korkein_tutkinto,' +
			' p.yksi_org,' +
			' p.tutk_pvm,' +
			' p.kelp_pvm,' +
			' p.pvm,' +
			' p.aine_patevyyskoodi,' +
			' p.aine_organisaatiokoodi,' +
			' p.aine_pvm,' +
			' p.patevyyskoodi1,' +
			' p.organisaatiokoodi1,' +
			' p.pvm1,' +
			' p.patevyyskoodi2,' +
			' p.organisaatiokoodi2,' +
			' p.pvm2,' +
			' NULL as patevyyskoodi3,' +
			' NULL as patevyyskoodi4,' +
			' NULL as patevyyskoodi5,' +
			' NULL as pvm3,' +
			' NULL as pvm4,' +
			' NULL as pvm5,' +
			' NULL as organisaatiokoodi3,' +
			' NULL as organisaatiokoodi4,' +
			' NULL as organisaatiokoodi5' +
		' FROM ANTERO.dbo.pat_temp_3 p' +
		' WHERE p.kelpoisuus <> ' + '''' + 'ER2' + '''' +
		' UNION ALL' +
		' SELECT DISTINCT' +
			' p1.henkilo,' +
			' CASE WHEN p2.kelpoisuus = ' + '''' + 'PE' + '''' + ' THEN CASE WHEN p1.kelpoisuus = ' + '''' + 'AI' + '''' + ' THEN ' + '''' + 'AI_PE' + '''' + ' WHEN p1.kelpoisuus = ' + '''' + 'ER' + '''' + ' THEN ' + '''' + 'ER_PE' + '''' + ' ELSE ' + '''' + 'VA_PE' + '''' + ' END ELSE ' + '''' + 'VA_ER' + '''' + ' END as kelpoisuus,' +
			' CASE WHEN p1.pvm < p2.pvm THEN p2.organisaatiokoodi ELSE p1.organisaatiokoodi END as organisaatiokoodi,' +
			' CASE WHEN LEFT(p1.koulutuskoodi,1) > LEFT(p2.koulutuskoodi,1) THEN p1.tutk_organisaatiokoodi ELSE p2.tutk_organisaatiokoodi END as tutk_organisaatiokoodi,' +
			' CASE WHEN LEFT(p1.koulutuskoodi,1) > LEFT(p2.koulutuskoodi,1) THEN p1.koulutuskoodi ELSE p2.koulutuskoodi END as koulutuskoodi,' +
			' CASE WHEN p1.pvm < p2.pvm THEN p2.suoritustapa ELSE p1.suoritustapa END as suoritustapa,' +
			' CASE WHEN p1.pvm < p2.pvm THEN p2.koulutuskoodi_korkein_tutkinto ELSE p1.koulutuskoodi_korkein_tutkinto END as koulutuskoodi_korkein_tutkinto,' +
			' CASE WHEN p1.pvm < p2.pvm THEN p2.organisaatiokoodi_korkein_tutkinto ELSE p1.organisaatiokoodi_korkein_tutkinto END as organisaatiokoodi_korkein_tutkinto,' +
			' CASE WHEN p1.pvm < p2.pvm THEN p2.vuosi_korkein_tutkinto ELSE p1.vuosi_korkein_tutkinto END as vuosi_korkein_tutkinto,' +
			' CASE WHEN p1.organisaatiokoodi = p2.organisaatiokoodi and p1.yksi_org = 1 and p2.yksi_org = 1 THEN 1 ELSE 0 END as yksi_org,' +
			' CASE WHEN LEFT(p1.koulutuskoodi,1) > LEFT(p2.koulutuskoodi,1) THEN p1.tutk_pvm ELSE p2.tutk_pvm END as tutk_pvm,' +
			' CASE WHEN p1.pvm < p2.pvm THEN p2.kelp_pvm ELSE p1.kelp_pvm END as kelp_pvm,' +
			' CASE WHEN p1.pvm < p2.pvm THEN p2.pvm ELSE p1.pvm END AS pvm,' +
			' p1.aine_patevyyskoodi,' +
			' p1.aine_organisaatiokoodi,' +
			' p1.aine_pvm,' +
			' p1.patevyyskoodi1,' +
			' p1.organisaatiokoodi1,' +
			' p1.pvm1,' +
			' p1.patevyyskoodi2,' +
			' p1.organisaatiokoodi2,' +
			' p1.pvm2,' +
			' p2.patevyyskoodi1 as patevyyskoodi3,' +
			' p1.patevyyskoodi2 as patevyyskoodi4,' +
			' p2.patevyyskoodi2 as patevyyskoodi5,' +
			' p2.pvm1 as pvm3,' +
			' p1.pvm2 as pvm4,' +
			' p2.pvm2 as pvm5,' +
			' p2.organisaatiokoodi1 as organisaatiokoodi3,' +
			' p1.organisaatiokoodi2 as organisaatiokoodi4,' +
			' p2.organisaatiokoodi2 as organisaatiokoodi5' +
		' FROM ANTERO.dbo.pat_temp_3 p1' +
		' INNER JOIN ANTERO.dbo.pat_temp_3 p2 on p2.kelpoisuus in (' + '''' + 'PE' + '''' + ', ' + '''' + 'ER' + '''' + ', ' + '''' + 'ER2' + '''' + ') and p1.henkilo = p2.henkilo' +
		' WHERE (p2.kelpoisuus in (' + '''' + 'ER' + '''' + ',' + '''' + 'ER2' + '''' + ') and p1.kelpoisuus = ' + '''' + 'VA' + '''' + ') or (p1.kelpoisuus in (' + '''' + 'AI' + '''' + ', ' + '''' + 'ER' + '''' + ', ' + '''' + 'VA' + '''' + ') and p2.kelpoisuus = ' + '''' + 'PE' + '''' + ')) p' +	
		' OUTER APPLY (' +
			' SELECT REPLACE((SUBSTRING((SELECT DISTINCT ' + '''' + '_' + '''' + ' + kelpoisuus AS ' + '''' + 'data()' + '''' + ' FROM ANTERO.dbo.pat_temp_3 p0 WHERE p.henkilo = p0.henkilo and year(p.pvm) = year(p0.pvm) FOR XML PATH(' + '''' + '''' + ')  ), 2 , 9999)),' + '''' + ' ' + '''' + ', ' + '''' + '''' + ') as kelpoisuudet' +
		' ) kelpoisuudet_vuosi' +
	' ) p' +
	' LEFT JOIN ANTERO.sa.virta_opettajakelpoisuus_priorisointi pri on pri.koodi = p.kelpoisuus' +
	' WHERE YEAR(p.pvm) > 2015 and p.rnk = 1' +
	' ) p' 

	SET @sql8 =
	' SELECT' +
		' ROW_NUMBER() OVER (ORDER BY CAST(GETDATE() AS TIMESTAMP)) AS KelpoisuusID,' +
		' p.henkilo,' +
		' p.pvm,' +
		' p.kelpoisuus,' +
		' p.suoritustapa,' +
		' cast(concat(p.aine_patevyyskoodi, ' + '''' + '|' + '''' + ', p.aine_pvm, ' + '''' + '|' + '''' + ', p.aine_organisaatiokoodi) as varchar) as patevyys_aine,' +
		' cast(concat(p.patevyyskoodi1, ' + '''' + '|' + '''' + ', p.pvm1, ' + '''' + '|' + '''' + ', p.organisaatiokoodi1) as varchar) as patevyys_1,' +
		' cast(concat(p.patevyyskoodi2, ' + '''' + '|' + '''' + ', p.pvm2, ' + '''' + '|' + '''' + ', p.organisaatiokoodi2) as varchar) as patevyys_2,' +
		' cast(concat(p.patevyyskoodi3, ' + '''' + '|' + '''' + ', p.pvm3, ' + '''' + '|' + '''' + ', p.organisaatiokoodi3) as varchar) as patevyys_3,' +
		' cast(concat(p.patevyyskoodi4, ' + '''' + '|' + '''' + ', p.pvm4, ' + '''' + '|' + '''' + ', p.organisaatiokoodi4) as varchar) as patevyys_4,' +
		' cast(concat(p.patevyyskoodi5, ' + '''' + '|' + '''' + ', p.pvm5, ' + '''' + '|' + '''' + ', p.organisaatiokoodi5) as varchar) as patevyys_5,' +
		' cast(concat(p.koulutuskoodi, ' + '''' + '|' + '''' + ', p.tutk_pvm, ' + '''' + '|' + '''' + ', p.tutk_organisaatiokoodi) as varchar) as tutkinto,' +
		' CASE' +
			' WHEN p.rnk2 > 1 THEN ' + '''' + 'Toinen kelpoisuus priorisoitu edelle' + '''' + 
			' ELSE ' + '''' + 'Raportilla näkyvä kelpoisuus' + '''' +
		' END as ' + '''' + 'Status' + '''' + ',' +
		' p.rnk,' +
		' p.rnk2,' +
		' p.organisaatiokoodi,' +
		' p.koulutuskoodi_korkein_tutkinto,' +
		' p.organisaatiokoodi_korkein_tutkinto,' +
		' YEAR(p.pvm) as Vuosi,' +
		' vuosi_korkein_tutkinto,' +
		' ya.ya,' +
		' p.yksi_org' +
	' INTO ANTERO.dbo.pat_temp_5' +
	' FROM ANTERO.dbo.pat_temp_4 p' + 
	' OUTER APPLY (' +
		' Select' +
			' CASE' + 
				' WHEN p.kelpoisuus = ' + '''' + 'VA_PE' + '''' + ' THEN REPLACE((SUBSTRING((SELECT ' + '''' + '_' + '''' + ' + patevyyskoodi AS ' + '''' + 'data()' + '''' + ' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in (' + '''' + 'VA' + '''' + ',' + '''' + 'PE' + '''' + ',' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') FOR XML PATH(' + '''' + '''' + ')  ), 2 , 9999)),' + '''' + ' ' + '''' + ', ' + '''' + '''' + ')' +
				' WHEN p.kelpoisuus = ' + '''' + 'AI_PE' + '''' + ' THEN REPLACE((SUBSTRING((SELECT ' + '''' + '_' + '''' + ' + patevyyskoodi AS ' + '''' + 'data()' + '''' + ' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in (' + '''' + 'PE' + '''' + ',' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') FOR XML PATH(' + '''' + '''' + ')  ), 2 , 9999)),' + '''' + ' ' + '''' + ', ' + '''' + '''' + ')' +
				' WHEN p.kelpoisuus = ' + '''' + 'ER_PE' + '''' + ' THEN REPLACE((SUBSTRING((SELECT ' + '''' + '_' + '''' + ' + patevyyskoodi AS ' + '''' + 'data()' + '''' + ' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in (' + '''' + 'PE' + '''' + ',' + '''' + 'AI' + '''' + ',' + '''' + 'ER' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') FOR XML PATH(' + '''' + '''' + ')  ), 2 , 9999)),' + '''' + ' ' + '''' + ', ' + '''' + '''' + ')' +
				' WHEN p.kelpoisuus = ' + '''' + 'VA_ER' + '''' + ' THEN REPLACE((SUBSTRING((SELECT ' + '''' + '_' + '''' + ' + patevyyskoodi AS ' + '''' + 'data()' + '''' + ' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in (' + '''' + 'EL' + '''' + ',' + '''' + 'VA' + '''' + ', ' + '''' + 'ER' + '''' + ') FOR XML PATH(' + '''' + '''' + ')  ), 2 , 9999)),' + '''' + ' ' + '''' + ', ' + '''' + '''' + ')' +
				' WHEN p.kelpoisuus = ' + '''' + 'EL' + '''' + ' THEN REPLACE((SUBSTRING((SELECT ' + '''' + '_' + '''' + ' + patevyyskoodi AS ' + '''' + 'data()' + '''' + ' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in (' + '''' + 'EL' + '''' + ',' + '''' + 'VA' + '''' + ', ' + '''' + 'ER' + '''' + ') FOR XML PATH(' + '''' + '''' + ')  ), 2 , 9999)),' + '''' + ' ' + '''' + ', ' + '''' + '''' + ')' +
				' WHEN p.kelpoisuus = ' + '''' + 'OP' + '''' + ' THEN REPLACE((SUBSTRING((SELECT ' + '''' + '_' + '''' + ' + patevyyskoodi AS ' + '''' + 'data()' + '''' + ' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in (' + '''' + 'OP' + '''' + ',' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') FOR XML PATH(' + '''' + '''' + ')  ), 2 , 9999)),' + '''' + ' ' + '''' + ', ' + '''' + '''' + ')' +
				' WHEN p.kelpoisuus = ' + '''' + 'ER' + '''' + ' THEN REPLACE((SUBSTRING((SELECT ' + '''' + '_' + '''' + ' + patevyyskoodi AS ' + '''' + 'data()' + '''' + ' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in (' + '''' + 'ER' + '''' + ',' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') FOR XML PATH(' + '''' + '''' + ')  ), 2 , 9999)),' + '''' + ' ' + '''' + ', ' + '''' + '''' + ')' +
				' WHEN p.kelpoisuus = ' + '''' + 'PE' + '''' + ' THEN REPLACE((SUBSTRING((SELECT ' + '''' + '_' + '''' + ' + patevyyskoodi AS ' + '''' + 'data()' + '''' + ' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in (' + '''' + 'PE' + '''' + ',' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ',' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') FOR XML PATH(' + '''' + '''' + ')  ), 2 , 9999)),' + '''' + ' ' + '''' + ', ' + '''' + '''' + ')' +
				' WHEN p.kelpoisuus in(' + '''' + 'AI' + '''' + ', ' + '''' + 'PD' + '''' + ', ' + '''' + 'LA' + '''' + ') THEN REPLACE((SUBSTRING((SELECT ' + '''' + '_' + '''' + ' + patevyyskoodi AS ' + '''' + 'data()' + '''' + ' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi in (' + '''' + 'AI' + '''' + ',' + '''' + 'JA' + '''' + ',' + '''' + 'JB' + '''' + ',' + '''' + 'JC' + '''' + ', ' + '''' + 'EL' + '''' + ',' + '''' + 'IX' + '''' + ') FOR XML PATH(' + '''' + '''' + ')  ), 2 , 9999)),' + '''' + ' ' + '''' + ', ' + '''' + '''' + ')' +
				' ELSE REPLACE((SUBSTRING((SELECT ' + '''' + '_' + '''' + ' + patevyyskoodi AS ' + '''' + 'data()' + '''' + ' FROM ANTERO.sa.virta_opettajapatevyys_mappaus WHERE kelpoisuuskoodi = p.kelpoisuus FOR XML PATH(' + '''' + '''' + ')  ), 2 , 9999)),' + '''' + ' ' + '''' + ', ' + '''' + '''' + ')' +
			' END as patevyyskoodit' +
	' ) pat_koodit' +
	' OUTER APPLY (' +
		' SELECT MAX(f.ya) as ya' +
		' FROM (' +
			' SELECT' +
				' CASE' + 
					' WHEN pat_koodit.patevyyskoodit not like concat(' + '''' + '%' + '''' + ',ya_pat.patevyyskoodi, ' + '''' + '%' + '''' + ') THEN 1' +
					' ELSE 0' +
				' END as ya' +
			' FROM ANTERO.sa.sa_virta_otp_ope_patevyydet_' + @alkuVuosi + ' ya_pat' +
			' LEFT JOIN ANTERO.dw.d_virta_patevyydet d on d.patevyys_koodi = ya_pat.patevyyskoodi' +
			' WHERE d.patevyysryhma1_fi = ' + '''' + 'opettaja' + '''' + ' and ya_pat.henkilo = p.henkilo and ya_pat.paivamaara <= p.pvm' +
		' ) f' +
	' ) ya'

	SET @sql9 =
	' INSERT INTO ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys' +
	' SELECT DISTINCT' +
		' KelpoisuusID,' +
		' p.henkilo,' +
		' d8.id as d_kelpoisuus_id,' +
		' d1.id as d_sukupuoli_id,' +
		' d2.id as d_ika_id,' +
		' d3.id as d_koulutusluokitus_korkein_tutkinto_id,' +
		' d4.id as d_organisaatioluokitus_kelpoisuus_id,' +
		' d5.id as d_organisaatioluokitus_korkein_tutkinto_id,' +
		' d6.id as d_organisaatioluokitus_suoritus_id,' +
		' d7.id as d_kytkin_yli_asetuksen_id,' +
		' d9.id as d_kalenteri_suoritus_pvm_id,' + 
		' d10.id as d_kytkin_yksi_org_id,' +
		' suoritustapa,' +
		' suorituksen_koodi,' +
		' p.Vuosi,' +
		' p.vuosi_korkein_tutkinto,' +
		' [Status]' +
	' FROM (' +
		' SELECT' +
			' KelpoisuusID,' +
			' henkilo,' +
			' kelpoisuus,' +
			' [Status],' +
			' organisaatiokoodi,' +
			' suoritustapa,' +
			' organisaatiokoodi_korkein_tutkinto,' +
			' koulutuskoodi_korkein_tutkinto,' +
			' Vuosi,' +
			' vuosi_korkein_tutkinto,' +
			' SUBSTRING(Koodi,0, CHARINDEX(' + '''' + '|' + '''' + ',Koodi)) as suorituksen_koodi,' +
			' SUBSTRING(Koodi, CHARINDEX(' + '''' + '|' + '''' + ', Koodi) + LEN(' + '''' + '|' + '''' + '), CHARINDEX(' + '''' + '|' + '''' + ', Koodi, CHARINDEX(' + '''' + '|' + '''' + ', Koodi) + LEN(' + '''' + '|' + '''' + ')) - LEN(' + '''' + '|' + '''' + ') - CHARINDEX(' + '''' + '|' + '''' + ', Koodi)) AS suorituksen_pvm,' +
			' right(Koodi, charindex(' + '''' + '|' + '''' + ', reverse(Koodi)) - 1) as suorituksen_organisaatiokoodi,' +
			' ya,' +
			' yksi_org' +
		' FROM ANTERO.dbo.pat_temp_5 p' +
		' UNPIVOT' +  
		   ' (Koodi FOR Suoritus IN' +   
			  ' (patevyys_aine, patevyys_1, patevyys_2, patevyys_3, patevyys_4, patevyys_5, tutkinto)' +
		' )AS unpvt' +
		' WHERE Koodi <> ' + '''' + '||' + '''' + 
	' ) p' +
	' LEFT JOIN ANTERO.sa.sa_virta_otp_ope_henkilotiedot_' + @alkuVuosi + ' s on s.henkilo = p.henkilo' +
	' LEFT JOIN ANTERO.dw.d_sukupuoli d1 on d1.sukupuoli_koodi = s.sukupuoli' +
	' LEFT JOIN ANTERO.dw.d_ika d2 on d2.ika_avain = p.Vuosi - year(s.syntymaaika)' +
	' LEFT JOIN ANTERO.dw.d_koulutusluokitus d3 on d3.koulutusluokitus_koodi = p.koulutuskoodi_korkein_tutkinto' +
	' LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi = p.organisaatiokoodi' +
	' LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 on d5.organisaatio_koodi = p.organisaatiokoodi_korkein_tutkinto' +
	' LEFT JOIN ANTERO.dw.d_organisaatioluokitus d6 on d6.organisaatio_koodi = p.suorituksen_organisaatiokoodi' +
	' LEFT JOIN ANTERO.dw.d_kytkin d7 on d7.kytkin_koodi = coalesce(ya,0)' +
	' LEFT JOIN ANTERO.dw.d_opettajapatevyys d8 on d8.koodi = p.kelpoisuus' +
	' LEFT JOIN ANTERO.dw.d_kalenteri d9 on d9.kalenteri_avain = p.suorituksen_pvm' +
	' LEFT JOIN ANTERO.dw.d_kytkin d10 on d10.kytkin_koodi = p.yksi_org' +
	' WHERE p.Vuosi = ' + @alkuVuosi + ' or (' + @alkuVuosi + ' = 2021 and p.Vuosi > 2015)'

	EXEC (@sql1)
	EXEC (@sql2)
	EXEC (@sql3)
	EXEC (@sql4)
	EXEC (@sql5)
	EXEC (@sql6)
	EXEC (@sql7)
	EXEC (@sql8)
	EXEC (@sql9)

	DROP TABLE IF EXISTS ANTERO.dbo.pat_temp_1
	DROP TABLE IF EXISTS ANTERO.dbo.pat_temp_2
	DROP TABLE IF EXISTS ANTERO.dbo.pat_temp_3
	DROP TABLE IF EXISTS ANTERO.dbo.pat_temp_4
	DROP TABLE IF EXISTS ANTERO.dbo.pat_temp_5

	END

	SET @alkuVuosi = cast(cast(@alkuVuosi as int) + 1 as nvarchar)

END

GO

USE [ANTERO]