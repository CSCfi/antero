USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet_esilataus]    Script Date: 9.1.2026 8.51.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet_esilataus] AS

DECLARE @alkuVuosi int

DECLARE @sql nvarchar(max)

DECLARE @ColumnType nvarchar(10)

DECLARE @taulu nvarchar(max)

DECLARE @aineisto nvarchar(20)

 SET @alkuVuosi = 2023

TRUNCATE TABLE [AnteroAPI].[dw].[api_tavoiteajassa_tutkinnon_suorittaneet]

 WHILE @alkuVuosi <= YEAR(GETDATE())

 BEGIN

	IF (SELECT COUNT(*) FROM ANTERO.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = concat('sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_', cast(@alkuVuosi as nvarchar))) >= 1

	BEGIN

	SET @taulu = concat('ANTERO.sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_', cast(@alkuVuosi as nvarchar))

	SET @aineisto = 'Lopullinen'

	END

	ELSE 

	BEGIN

	SET @taulu = 'ANTERO.sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet'

	SET @aineisto = 'Live'

	END

	SET @sql = 
		'INSERT INTO [AnteroAPI].[dw].[api_tavoiteajassa_tutkinnon_suorittaneet]
		 SELECT
			[Tilastovuosi] = t.tutkintovuosi
			,[Kuukausi] = t.suorituskuukausi
			,[Sektori] = 
				case d1.oppilaitostyyppi_koodi
					when ' + '''' + '41' + '''' + ' then ' + '''' + 'Ammattikorkeakoulukoulutus' + '''' + '
					when ' + '''' + '42' + '''' + ' then ' + '''' + 'Yliopistokoulutus' + '''' + '
					else ' + '''' + 'Tuntematon' + '''' + '
				end
			, [Korkeakoulu] = COALESCE(d1.organisaatio_fi, ' + '''' + 'Tuntematon' + '''' + ')
			, [Koulutus] = COALESCE(d2.koulutusluokitus_fi, ' + '''' + 'Tuntematon' + '''' + ')
			, [Tutkinnot]
			, [Tavoiteajassa] = 
				case [Tavoiteajassa]+[Tavoiteaika ylitetty korkeintaan 12 kk]+[Tavoiteaika ylitetty yli 12 kk]
					when 0 then null
					else [Tavoiteajassa]
				end
			, [Tavoiteaika ylitetty korkeintaan 12 kk] = 
				case [Tavoiteajassa]+[Tavoiteaika ylitetty korkeintaan 12 kk]+[Tavoiteaika ylitetty yli 12 kk]
					when 0 then null
					else [Tavoiteaika ylitetty korkeintaan 12 kk]
				end
			, [Tavoiteaika ylitetty yli 12 kk] = 
				case [Tavoiteajassa]+[Tavoiteaika ylitetty korkeintaan 12 kk]+[Tavoiteaika ylitetty yli 12 kk]
					when 0 then null
					else [Tavoiteaika ylitetty yli 12 kk]
				end
			, [On aiempi korkeakoulututkinto]
			, [Tutkintopisteet]
			, [Tutkintopisteluokka]
			, [Koulutusaste taso 1] = COALESCE(d2.koulutusastetaso1_fi, ' + '''' + 'Tuntematon' + '''' + ')
			, [Koulutusaste taso 2] =	COALESCE(d2.Koulutusastetaso2_fi, ' + '''' + 'Tuntematon' + '''' + ')
			, [Koulutusala taso 1] = COALESCE(d2.koulutusalataso1_fi, ' + '''' + 'Tuntematon' + '''' + ')
			, [Koulutusala taso 2] = COALESCE(d2.koulutusalataso2_fi, ' + '''' + 'Tuntematon' + '''' + ')
			, [Koulutusala taso 3] = COALESCE(d2.koulutusalataso3_fi, ' + '''' + 'Tuntematon' + '''' + ')
			, [OKM ohjauksen ala] = COALESCE(d2.okmohjauksenala_fi, ' + '''' + 'Tuntematon' + '''' + ')
			, [Rahoitusmalliala amk 2017-2020] = COALESCE(d3.Ammattikorkeakoulut_tutkintotavoitteet, ' + '''' + 'Tuntematon' + '''' + ')
			, [Rahoitusmalliala amk 2021-2024] = COALESCE(d3.Ammattikorkeakoulut_tutkintotavoitteet, ' + '''' + 'Tuntematon' + '''' + ')
			, [Rahoitusmalliala yo 2017-2020] = COALESCE(d3.Yliopistot_tutkintotavoitteet, ' + '''' + 'Tuntematon' + '''' + ')
			, [Rahoitusmalliala yo 2021-2024] = COALESCE(d3.Yliopistot_tutkintotavoitteet2021, ' + '''' + 'Tuntematon' + '''' + ')
			, [koulutustyyppi]
			, [koulutuskieli] = COALESCE(d5.kieli_fi, ' + '''' + 'tuntematon' + '''' + ')
			, [rahoituslahde] = d4.rahoituslahde_nimi_fi
			, [Koodi Sektori] = 
				case d1.oppilaitostyyppi_koodi
					when ' + '''' + '41' + '''' + ' then ' + '''' + '4' + '''' + '
					when ' + '''' + '42' + '''' + ' then ' + '''' + '5' + '''' + '
					else ' + '''' + '-1' + '''' + '
				end
			, [Koodi Korkeakoulu]	= d1.organisaatio_nykyinen_koodi
			, [Koodi Koulutus] = t.tutkintokoodi
			, [Aineistotyyppi] = ' + '''' + @aineisto + '''' + '
			, [Tietojen ajankohta] = (SELECT max(cast(loadtime as date)) FROM ' + @taulu + ')
		FROM (
			SELECT tutkintovuosi
				, MONTH(f.[tutkinnonsuorituspvm]) as suorituskuukausi 
				, d1.organisaatio_nykyinen_koodi as oppilaitosnro
				, tutkintokoodi
				, xkoulutuskieli
				, koulutustyyppi = case f.xxlkoulutustyyppi when 1 then ' + '''' + 'Päivämuoto' + '''' + ' when 2 THEN ' + '''' + 'Monimuoto' + '''' + ' else ' + '''' + 'Yliopisto' + '''' + ' end
				, [Tutkinnot] = count(*)
				, [Tavoiteajassa] = sum(tavoiteajassavalmistunut)
				, [Tavoiteaika ylitetty korkeintaan 12 kk] = sum(xonenintaan12kk)
				, [Tavoiteaika ylitetty yli 12 kk] = sum(xonyli12kk)
				, [On aiempi korkeakoulututkinto] = sum(onaiempitutkinto)
				, [Tutkintopisteet] = sum(cast(tutkintokerroin as decimal(12,4)))
				, [Tutkintopisteluokka] = cast(tutkintokerroin as decimal(12,4))
				, [rahoituslahdekoodi] = coalesce(f.xxmrahoituslahde, ' + '''' + '-1' + '''' + ')
		FROM ' + @taulu + ' f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = f.oppilaitosnro
		GROUP BY tutkintovuosi
		, d1.organisaatio_nykyinen_koodi
		, tutkintokoodi
		, xxmrahoituslahde
		, xkoulutuskieli
		, xxlkoulutustyyppi
		, tavoiteajassavalmistunut
		, xonenintaan12kk
		, xonyli12kk
		, onaiempitutkinto
		, tutkintokerroin
		, MONTH(f.[tutkinnonsuorituspvm])
		) t
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = t.oppilaitosnro
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = t.tutkintokoodi
		LEFT JOIN VipunenTK_lisatiedot.dbo.isced_suomi_ohjauksenala d3 on d3.iscfi2013_koodi = d2.koulutusalataso3_koodi
		LEFT JOIN ANTERO.dw.d_virta_rahoituslahde d4 ON d4.rahoituslahde_koodi  = t.rahoituslahdekoodi
		LEFT JOIN ANTERO.dw.d_kieli d5 on d5.kieli_koodi = t.xkoulutuskieli
		WHERE d1.oppilaitostyyppi_koodi in (' + '''' + '41' + '''' + ',' + '''' + '42' + '''' +') and (cast(' + cast(@alkuVuosi as nvarchar(4)) + ' as int) = 2023 or cast(' + cast(@alkuVuosi as nvarchar(4)) + ' as int) = t.tutkintovuosi) and cast(' + cast(@alkuVuosi as nvarchar(4)) + ' as int) >= t.tutkintovuosi'

	EXEC (@sql)

	SET @alkuVuosi = @alkuVuosi + 1

END

GO