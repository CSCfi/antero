USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_ammattisiirtymat_tyottomat_ja_tyovoiman_ulkopuoliset]    Script Date: 15.12.2023 13:16:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   VIEW [dbo].[v_f_tab_ammattisiirtymat_tyottomat_ja_tyovoiman_ulkopuoliset] AS

SELECT
	f.tilastovuosi as Tilastovuosi,
	f.[Ikäryhmä],
	f.[Ammattiala 1.taso] as 'Ammattiala 1.taso',
	f.[Ammattiala 2.taso] as 'Ammattiala 2.taso',
	f.[Suhteellinen ajankohta],
	SUM(ammattisiirtymat_alalta) as ammattisiirtymat_alalta,
	SUM(ammattisiirtymat_alalle) as ammattisiirtymat_alalle,
	SUM(siirtynyt_tyottomaksi) as siirtynyt_tyottomaksi,
	SUM(siirtynyt_tyottomasta_tyolliseksi) as siirtynyt_tyottomasta_tyolliseksi,
	SUM(siirtynyt_tyovoiman_ulkopuolelle) as siirtynyt_tyovoiman_ulkopuolelle,
	SUM(siirtynyt_tyovoiman_ulkopuolelta_tyolliseksi) as siirtynyt_tyovoiman_ulkopuolelta_tyolliseksi,
	SUM(siirtynyt_tuntemattomasta_tyolliseksi) as siirtynyt_tuntemattomasta_tyolliseksi,
	SUM(siirtynyt_tuntemattomaksi) as siirtynyt_tuntemattomaksi
FROM (
	SELECT
		  f1.tilastovuosi,
		  [Ikäryhmä] = d3.ika,
		  [Ammattiala 1.taso] = d5.oef_ammattiryhma1,
		  [Ammattiala 2.taso] = d5.oef_ammattiryhma2,
		  [Suhteellinen ajankohta] = d9.suhteellinen_ajankohta,
		  [lkm] as ammattisiirtymat_alalta,
		  NULL as ammattisiirtymat_alalle,
		  NULL as siirtynyt_tyottomaksi,
		  NULL as siirtynyt_tyottomasta_tyolliseksi,
		  NULL as siirtynyt_tyovoiman_ulkopuolelle,
		  NULL as siirtynyt_tyovoiman_ulkopuolelta_tyolliseksi,
		  NULL as siirtynyt_tuntemattomaksi,
		  NULL as siirtynyt_tuntemattomasta_tyolliseksi
	FROM [VipunenTK].[dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit] f1
	LEFT JOIN dbo.d_ika d3 on d3.id=f1.ika_id	
	LEFT JOIN dbo.d_oef_ammatti d5 on d5.id=f1.oef_ammatti_id
	LEFT JOIN dbo.d_oef_ammatti d8 on d8.id=f1.oef_ammatti_siirtyman_paassa_id
	LEFT JOIN dbo.d_suhteellinen_ajankohta d9 on d9.id=f1.suhteellinen_ajankohta_id
	WHERE ((d9.suhteellinen_ajankohta_avain  = 'tilv+1' and f1.tilastovuosi > 2014) OR (d9.suhteellinen_ajankohta_avain  = 'tilv+5' and f1.tilastovuosi > 2010)) and d8.oef_ammattiryhma2_koodi <> d5.oef_ammattiryhma2_koodi and d8.id <> -2 and d5.id <> -2

	UNION ALL

	SELECT
		  f1.tilastovuosi,
		  [Ikäryhmä] = d3.ika,
		  [Ammattiala 1.taso] = d8.oef_ammattiryhma1,
		  [Ammattiala 2.taso] = d8.oef_ammattiryhma2,
		  [Suhteellinen ajankohta] = d9.suhteellinen_ajankohta,
		  NULL as ammattisiirtymat_alalta,
		  [lkm] as ammattisiirtymat_alalle,
		  NULL as siirtynyt_tyottomaksi,
		  NULL as siirtynyt_tyottomasta_tyolliseksi,
		  NULL as siirtynyt_tyovoiman_ulkopuolelle,
		  NULL as siirtynyt_tyovoiman_ulkopuolelta_tyolliseksi,
		  NULL as siirtynyt_tuntemattomaksi,
		  NULL as siirtynyt_tuntemattomasta_tyolliseksi
	FROM [VipunenTK].[dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit] f1
	LEFT JOIN dbo.d_ika d3 on d3.id=f1.ika_id	
	LEFT JOIN dbo.d_oef_ammatti d5 on d5.id=f1.oef_ammatti_id
	LEFT JOIN dbo.d_oef_ammatti d8 on d8.id=f1.oef_ammatti_siirtyman_paassa_id
	LEFT JOIN dbo.d_suhteellinen_ajankohta d9 on d9.id=f1.suhteellinen_ajankohta_id
	WHERE ((d9.suhteellinen_ajankohta_avain  = 'tilv+1' and f1.tilastovuosi > 2014) OR (d9.suhteellinen_ajankohta_avain  = 'tilv+5' and f1.tilastovuosi > 2010)) and d8.oef_ammattiryhma2_koodi <> d5.oef_ammattiryhma2_koodi and d8.id <> -2 and d5.id <> -2

	UNION ALL

	SELECT
		  f1.tilastovuosi,
		  [Ikäryhmä] = d3.ika,
		  [Ammattiala 1.taso] = d5.oef_ammattiryhma1,
		  [Ammattiala 2.taso] = d5.oef_ammattiryhma2,
		  [Suhteellinen ajankohta] = d9.suhteellinen_ajankohta,
		  NULL as ammattisiirtymat_alalta,
		  NULL as ammattisiirtymat_alalle,
		  [lkm] as siirtynyt_tyottomaksi,
		  NULL as siirtynyt_tyottomasta_tyolliseksi,
		  NULL as siirtynyt_tyovoiman_ulkopuolelle,
		  NULL as siirtynyt_tyovoiman_ulkopuolelta_tyolliseksi,
		  NULL as siirtynyt_tuntemattomaksi,
		  NULL as siirtynyt_tuntemattomasta_tyolliseksi
	FROM [VipunenTK].[dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit] f1
	LEFT JOIN dbo.d_ika d3 on d3.id=f1.ika_id	
	LEFT JOIN dbo.d_oef_ammatti d5 on d5.id=f1.oef_ammatti_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta d6a on d6a.id=f1.paaasiallinen_toiminta_siirtyman_paassa_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6b on d6b.id=f1.paaasiallinen_toimintar9_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6c on d6c.id=f1.paaasiallinen_toimintar9_siirtyman_paassa_id
	LEFT JOIN dbo.d_oef_ammatti d8 on d8.id=f1.oef_ammatti_siirtyman_paassa_id
	LEFT JOIN dbo.d_suhteellinen_ajankohta d9 on d9.id=f1.suhteellinen_ajankohta_id
	WHERE ((d9.suhteellinen_ajankohta_avain  = 'tilv+1' and f1.tilastovuosi > 2014) OR (d9.suhteellinen_ajankohta_avain  = 'tilv+5' and f1.tilastovuosi > 2010)) and d6c.paaasiallinen_toiminta_versio9_koodi = '12' and d5.id <> -2

	UNION ALL

	SELECT
		  f1.tilastovuosi,
		  [Ikäryhmä] = d3.ika,
		  [Ammattiala 1.taso] = d8.oef_ammattiryhma1,
		  [Ammattiala 2.taso] = d8.oef_ammattiryhma2,
		  [Suhteellinen ajankohta] = d9.suhteellinen_ajankohta,
		  NULL as ammattisiirtymat_alalta,
		  NULL as ammattisiirtymat_alalle,
		  NULL as siirtynyt_tyottomaksi,
		  [lkm] as siirtynyt_tyottomasta_tyolliseksi,
		  NULL as siirtynyt_tyovoiman_ulkopuolelle,
		  NULL as siirtynyt_tyovoiman_ulkopuolelta_tyolliseksi,
		  NULL as siirtynyt_tuntemattomaksi,
		  NULL as siirtynyt_tuntemattomasta_tyolliseksi
	FROM [VipunenTK].[dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit] f1
	LEFT JOIN dbo.d_ika d3 on d3.id=f1.ika_id	
	LEFT JOIN dbo.d_oef_ammatti d5 on d5.id=f1.oef_ammatti_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta d6a on d6a.id=f1.paaasiallinen_toiminta_siirtyman_paassa_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6b on d6b.id=f1.paaasiallinen_toimintar9_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6c on d6c.id=f1.paaasiallinen_toimintar9_siirtyman_paassa_id
	LEFT JOIN dbo.d_oef_ammatti d8 on d8.id=f1.oef_ammatti_siirtyman_paassa_id
	LEFT JOIN dbo.d_suhteellinen_ajankohta d9 on d9.id=f1.suhteellinen_ajankohta_id
	WHERE ((d9.suhteellinen_ajankohta_avain  = 'tilv+1' and f1.tilastovuosi > 2014) OR (d9.suhteellinen_ajankohta_avain  = 'tilv+5' and f1.tilastovuosi > 2010)) and d6b.paaasiallinen_toiminta_versio9_koodi = '12' and d8.id <> -2

	UNION ALL

	SELECT
		  f1.tilastovuosi,
		  [Ikäryhmä] = d3.ika,
		  [Ammattiala 1.taso] = d5.oef_ammattiryhma1,
		  [Ammattiala 2.taso] = d5.oef_ammattiryhma2,
		  [Suhteellinen ajankohta] = d9.suhteellinen_ajankohta,
		  NULL as ammattisiirtymat_alalta,
		  NULL as ammattisiirtymat_alalle,
		  NULL as siirtynyt_tyottomaksi,
		  NULL as siirtynyt_tyottomasta_tyolliseksi,
		  [lkm] as siirtynyt_tyovoiman_ulkopuolelle,
		  NULL as siirtynyt_tyovoiman_ulkopuolelta_tyolliseksi,
		  NULL as siirtynyt_tuntemattomaksi,
		  NULL as siirtynyt_tuntemattomasta_tyolliseksi
	FROM [VipunenTK].[dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit] f1
	LEFT JOIN dbo.d_ika d3 on d3.id=f1.ika_id	
	LEFT JOIN dbo.d_oef_ammatti d5 on d5.id=f1.oef_ammatti_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6b on d6b.id=f1.paaasiallinen_toimintar9_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6c on d6c.id=f1.paaasiallinen_toimintar9_siirtyman_paassa_id
	LEFT JOIN dbo.d_oef_ammatti d8 on d8.id=f1.oef_ammatti_siirtyman_paassa_id
	LEFT JOIN dbo.d_suhteellinen_ajankohta d9 on d9.id=f1.suhteellinen_ajankohta_id
	WHERE ((d9.suhteellinen_ajankohta_avain  = 'tilv+1' and f1.tilastovuosi > 2014) OR (d9.suhteellinen_ajankohta_avain  = 'tilv+5' and f1.tilastovuosi > 2010)) and d6c.paaasiallinen_toiminta_versio9_koodi = '30' and d5.id <> -2

	UNION ALL

	SELECT
		  f1.tilastovuosi,
		  [Ikäryhmä] = d3.ika,
		  [Ammattiala 1.taso] = d8.oef_ammattiryhma1,
		  [Ammattiala 2.taso] = d8.oef_ammattiryhma2,
		  [Suhteellinen ajankohta] = d9.suhteellinen_ajankohta,
		  NULL as ammattisiirtymat_alalta,
		  NULL as ammattisiirtymat_alalle,
		  NULL as siirtynyt_tyottomaksi,
		  NULL as siirtynyt_tyottomasta_tyolliseksi,
		  NULL as siirtynyt_tyovoiman_ulkopuolelle,
		  [lkm] as siirtynyt_tyovoiman_ulkopuolelta_tyolliseksi,
		  NULL as siirtynyt_tuntemattomaksi,
		  NULL as siirtynyt_tuntemattomasta_tyolliseksi
	FROM [VipunenTK].[dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit] f1
	LEFT JOIN dbo.d_ika d3 on d3.id=f1.ika_id	
	LEFT JOIN dbo.d_oef_ammatti d5 on d5.id=f1.oef_ammatti_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6b on d6b.id=f1.paaasiallinen_toimintar9_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6c on d6c.id=f1.paaasiallinen_toimintar9_siirtyman_paassa_id
	LEFT JOIN dbo.d_oef_ammatti d8 on d8.id=f1.oef_ammatti_siirtyman_paassa_id
	LEFT JOIN dbo.d_suhteellinen_ajankohta d9 on d9.id=f1.suhteellinen_ajankohta_id
	WHERE ((d9.suhteellinen_ajankohta_avain  = 'tilv+1' and f1.tilastovuosi > 2014) OR (d9.suhteellinen_ajankohta_avain  = 'tilv+5' and f1.tilastovuosi > 2010)) and d6b.paaasiallinen_toiminta_versio9_koodi = '30' and d8.id <> -2

	UNION ALL

	SELECT
		  f1.tilastovuosi,
		  [Ikäryhmä] = d3.ika,
		  [Ammattiala 1.taso] = d5.oef_ammattiryhma1,
		  [Ammattiala 2.taso] = d5.oef_ammattiryhma2,
		  [Suhteellinen ajankohta] = d9.suhteellinen_ajankohta,
		  NULL as ammattisiirtymat_alalta,
		  NULL as ammattisiirtymat_alalle,
		  NULL as siirtynyt_tyottomaksi,
		  NULL as siirtynyt_tyottomasta_tyolliseksi,
		  NULL as siirtynyt_tyovoiman_ulkopuolelle,
		  NULL as siirtynyt_tyovoiman_ulkopuolelta_tyolliseksi,
		  [lkm] as siirtynyt_tuntemattomaksi,
		  NULL as siirtynyt_tuntemattomasta_tyolliseksi
	FROM [VipunenTK].[dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit] f1
	LEFT JOIN dbo.d_ika d3 on d3.id=f1.ika_id	
	LEFT JOIN dbo.d_oef_ammatti d5 on d5.id=f1.oef_ammatti_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6b on d6b.id=f1.paaasiallinen_toimintar9_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6c on d6c.id=f1.paaasiallinen_toimintar9_siirtyman_paassa_id
	LEFT JOIN dbo.d_oef_ammatti d8 on d8.id=f1.oef_ammatti_siirtyman_paassa_id
	LEFT JOIN dbo.d_suhteellinen_ajankohta d9 on d9.id=f1.suhteellinen_ajankohta_id
	WHERE ((d9.suhteellinen_ajankohta_avain  = 'tilv+1' and f1.tilastovuosi > 2014) OR (d9.suhteellinen_ajankohta_avain  = 'tilv+5' and f1.tilastovuosi > 2010)) and d6c.paaasiallinen_toiminta_versio9_koodi = '-1' and d5.id <> -2

	UNION ALL

	SELECT
		  f1.tilastovuosi,
		  [Ikäryhmä] = d3.ika,
		  [Ammattiala 1.taso] = d8.oef_ammattiryhma1,
		  [Ammattiala 2.taso] = d8.oef_ammattiryhma2,
		  [Suhteellinen ajankohta] = d9.suhteellinen_ajankohta,
		  NULL as ammattisiirtymat_alalta,
		  NULL as ammattisiirtymat_alalle,
		  NULL as siirtynyt_tyottomaksi,
		  NULL as siirtynyt_tyottomasta_tyolliseksi,
		  NULL as siirtynyt_tyovoiman_ulkopuolelle,
		  NULL as siirtynyt_tyovoiman_ulkopuolelta_tyolliseksi,
		  NULL as siirtynyt_tuntemattomaksi,
		  [lkm] as siirtynyt_tuntemattomasta_tyolliseksi
	FROM [VipunenTK].[dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit] f1
	LEFT JOIN dbo.d_ika d3 on d3.id=f1.ika_id	
	LEFT JOIN dbo.d_oef_ammatti d5 on d5.id=f1.oef_ammatti_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6b on d6b.id=f1.paaasiallinen_toimintar9_id
	LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6c on d6c.id=f1.paaasiallinen_toimintar9_siirtyman_paassa_id
	LEFT JOIN dbo.d_oef_ammatti d8 on d8.id=f1.oef_ammatti_siirtyman_paassa_id
	LEFT JOIN dbo.d_suhteellinen_ajankohta d9 on d9.id=f1.suhteellinen_ajankohta_id
	WHERE ((d9.suhteellinen_ajankohta_avain  = 'tilv+1' and f1.tilastovuosi > 2014) OR (d9.suhteellinen_ajankohta_avain  = 'tilv+5' and f1.tilastovuosi > 2010)) and d6b.paaasiallinen_toiminta_versio9_koodi = '-1' and d8.id <> -2
) f
GROUP BY f.tilastovuosi,f.[Ikäryhmä],f.[Ammattiala 1.taso],f.[Ammattiala 2.taso],f.[Suhteellinen ajankohta]


GO

USE [ANTERO]