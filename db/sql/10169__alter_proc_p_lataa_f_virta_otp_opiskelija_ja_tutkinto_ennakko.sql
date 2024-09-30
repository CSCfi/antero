USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_opiskelija_ja_tutkinto_ennakko]    Script Date: 30.9.2024 9:18:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE [dw].[p_lataa_f_virta_otp_opiskelija_ja_tutkinto_ennakko] AS

DECLARE @alkuVuosi nvarchar(5)
DECLARE @sql nvarchar(max)
DECLARE @taulu nvarchar(max)

SET @alkuVuosi = '2018'

TRUNCATE TABLE [dw].[f_virta_otp_opiskelija_ja_tutkinto_ennakko]

WHILE cast(@alkuVuosi as int) <= YEAR(GETDATE())

BEGIN

	IF (SELECT COUNT(*) FROM ANTERO.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = concat('sa_virta_otp_tk_opisk_ennakko_', @alkuVuosi)) >= 1

	BEGIN 

	SET @taulu = concat('sa.sa_virta_otp_tk_opisk_ennakko_', @alkuVuosi)

	SET @sql =

	' INSERT INTO ANTERO.dw.f_virta_otp_opiskelija_ja_tutkinto_ennakko
	SELECT
		tilv as tilastovuosi,
		alvv as kirjoihintulovuosi,
		coalesce(d1.id, -1) as d_organisaatioluokitus_id,
		coalesce(d2.id, -1) as d_maatjavaltiot2_kansalaisuus_id,
		coalesce(d3.id, -1)as d_sukupuoli_id,
		coalesce(d4.id, -1) as d_koulutuksen_kieli_id,
		coalesce(d5.id, -1) as d_aidinkieli_id,
		coalesce(d6.id, -1) as d_koulutusluokitus_id,
		coalesce(d7.id, -1) as d_ika_id,
		coalesce(d8.id, -1) as d_alueluokitus_kotikunta_id,
		opiskelijat = cast((case when s.olosyys in (1,2) then s.lkm end) as int),
		opiskelijat_lasna = cast(( case when s.olosyys in (1) then s.lkm end) as int),
		opiskelijat_fte = cast((case
									when (s.fte = 1 or s.fte = 2) and s.olosyys = 1 and s.koultyp in (1,2,6) then s.fte/2.0 * s.lkm
									when s.lahde in (41,51) and s.fte in (1,2) and s.olosyys = 1 then (s.fte/2.0) * s.lkm
									else NULL end) as decimal(18,1)),
		aloittaneet = CAST((case
									when s.lahde = 41 and s.alvv = s.tilv and s.koultyp not in (6 ,7) and s.ensisop = 1 then s.lkm
									when s.alvv = s.tilv and s.koultyp in (6,7) and s.olosyys  IN (1,2) and s.ensisop = 1 then s.lkm
									when s.lahde = 51 and not (s.koulk like' + '''' + '8%' + '''' + ' or s.koulk in (775101, 775201)) and s.alvv = s.tilv and s.olosyys in (1,2) then s.lkm
									when s.lahde = 51 and (s.koulk like ' + '''' + '8%' + '''' + ' or s.koulk in (775101, 775201)) and s.opoikv = s.tilv and s.olosyys in (1,2) then s.lkm end) as int),
		s.op55,
		s.opyht0,
		s.opyht104,
		s.opyht119,
		s.opyht120,
		s.opyht14,
		s.opyht29,
		s.opyht44,
		s.opyht59,
		s.opyht74,
		s.opyht89,
		NULL as opyht,
		NULL as tutkinnot,
		koulutuslaji_OKM_avain =
		CASE
			WHEN s.koultyp = 1 THEN 13
			WHEN s.koultyp = 2 THEN 14
			WHEN s.koultyp = 6 THEN 15
			WHEN s.koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK].[dbo].[d_koulutusluokitus]
							where Koulutusaste_taso2_koodi = 63 or koulutusaste2002_koodi = 63
							)
			THEN 16
			WHEN s.koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK].[dbo].[d_koulutusluokitus]
							where Koulutusaste_taso2_koodi = 72 or koulutusaste2002_koodi = 72
							)
			THEN 17
			WHEN s.koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK].[dbo].[d_koulutusluokitus]
							where Koulutusaste_taso2_koodi = 73 or koulutusaste2002_koodi = 73
							)
				OR s.koulk in (775101,775201)
				THEN 18
			WHEN s.koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK].[dbo].[d_koulutusluokitus]
							where Koulutusaste_taso2_koodi = 81 or koulutusaste2002_koodi = 81
							)
				THEN 19
			WHEN s.koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK].[dbo].[d_koulutusluokitus]
							where Koulutusaste_taso2_koodi = 82 or koulutusaste2002_koodi = 82
							)
				THEN 20
			ELSE -1
		END,
		coalesce(d9.id, -1) as d_tk_koulutustyyppi_id
	FROM ' + @taulu + ' s
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = s.tunn
	LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d2 on d2.maatjavaltiot2_koodi = s.kansalr2
	LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.sukupuoli_koodi = s.sp
	LEFT JOIN ANTERO.dw.d_kieli d4 on d4.kieli_koodi = s.kkieli
	LEFT JOIN ANTERO.dw.d_kieli d5 on d5.kieli_koodi = s.aikielir1x
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d6 on d6.koulutusluokitus_koodi = case when s.koulk in (775101,775201) then 999999 when s.koulk = ' + '''' + '''' +' then -1 else coalesce(s.koulk,-1) end
	LEFT JOIN ANTERO.dw.d_ika d7 on d7.ika_avain = CAST(tilv as int) - cast(syntv as int)
	LEFT JOIN ANTERO.dw.d_alueluokitus d8 on d8.kunta_koodi = s.tilvaskunx
	LEFT JOIN VipunenTK.dbo.d_koulutustyyppi d9 ON d9.koulutustyyppi_koodi=s.koultyp'

	EXEC (@sql)
	END

	IF (SELECT COUNT(*) FROM ANTERO.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = concat('sa_virta_otp_tktutkintoennakko_', @alkuVuosi)) >= 1

	BEGIN
	
	SET @taulu = concat('sa.sa_virta_otp_tktutkintoennakko_', @alkuVuosi)

	SET @sql =

	' INSERT INTO ANTERO.dw.f_virta_otp_opiskelija_ja_tutkinto_ennakko
	SELECT
		tilv as tilastovuosi,
		alvv as kirjoihintulovuosi,
		coalesce(d1.id, -1) as d_organisaatioluokitus_id,
		coalesce(d2.id, -1) as d_maatjavaltiot2_kansalaisuus_id,
		coalesce(d3.id, -1)as d_sukupuoli_id,
		coalesce(d4.id, -1) as d_koulutuksen_kieli_id,
		coalesce(d5.id, -1) as d_aidinkieli_id,
		coalesce(d6.id, -1) as d_koulutusluokitus_id,
		coalesce(d7.id, -1) as d_ika_id,
		coalesce(d8.id, -1) as d_alueluokitus_kotikunta_id,
		NULL as opiskelijat,
		NULL as opiskelijat_lasna,
		NULL as opiskelijat_fte,
		NULL as aloittaneet,
		NULL as op55,
		NULL as opyht0,
		NULL as opyht104,
		NULL as opyht119,
		NULL as opyht120,
		NULL as opyht14,
		NULL as opyht29,
		NULL as opyht44,
		NULL as opyht59,
		NULL as opyht74,
		NULL as opyht89,
		coalesce(s.opyhtamk, s.opyhtyo) as opyht,
		s.lkm as tutkinnot,
		koulutuslaji_OKM_avain =
		CASE
			WHEN s.koultyp = 1 THEN 13
			WHEN s.koultyp = 2 THEN 14
			WHEN s.koultyp = 6 THEN 15
			WHEN s.koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK].[dbo].[d_koulutusluokitus]
							where Koulutusaste_taso2_koodi = 63 or koulutusaste2002_koodi = 63
							)
			THEN 16
			WHEN s.koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK].[dbo].[d_koulutusluokitus]
							where Koulutusaste_taso2_koodi = 72 or koulutusaste2002_koodi = 72
							)
			THEN 17
			WHEN s.koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK].[dbo].[d_koulutusluokitus]
							where Koulutusaste_taso2_koodi = 73 or koulutusaste2002_koodi = 73
							)
				OR s.koulk in (775101,775201)
				THEN 18
			WHEN s.koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK].[dbo].[d_koulutusluokitus]
							where Koulutusaste_taso2_koodi = 81 or koulutusaste2002_koodi = 81
							)
				THEN 19
			WHEN s.koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK].[dbo].[d_koulutusluokitus]
							where Koulutusaste_taso2_koodi = 82 or koulutusaste2002_koodi = 82
							)
				THEN 20
			ELSE -1
		END,
		coalesce(d9.id, -1) as d_tk_koulutustyyppi_id
	FROM ' + @taulu + ' s
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = s.tunn
	LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d2 on d2.maatjavaltiot2_koodi = s.kansalr2
	LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.sukupuoli_koodi = s.sp
	LEFT JOIN ANTERO.dw.d_kieli d4 on d4.kieli_koodi = s.kkieli
	LEFT JOIN ANTERO.dw.d_kieli d5 on d5.kieli_koodi = s.aikielir1x
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d6 on d6.koulutusluokitus_koodi = case when s.koulk in (775101,775201) then 999999 when s.koulk = ' + '''' + '''' +' then -1 else coalesce(s.koulk,-1) end
	LEFT JOIN ANTERO.dw.d_ika d7 on d7.ika_avain = CAST(tilv as int) - cast(syntv as int)
	LEFT JOIN ANTERO.dw.d_alueluokitus d8 on d8.kunta_koodi = s.tilvaskunx
	LEFT JOIN VipunenTK.dbo.d_koulutustyyppi d9 ON d9.koulutustyyppi_koodi=s.koultyp'

	EXEC (@sql)
	END

	SET @alkuVuosi = cast(cast(@alkuVuosi as int) + 1 as nvarchar)
END

GO

USE [ANTERO]