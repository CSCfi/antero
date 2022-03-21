USE [VipunenTK_lisatiedot]
GO

IF NOT EXISTS 
(
	SELECT * FROM [dbo].[Vipunen_aineisto_fakta_proseduuri] 
	WHERE [aineisto_avain] IN (N'TK_K7_15',N'TK_K7_16',N'TK_7_17',N'TK_7_18',N'TK_7_19')
)

BEGIN

	INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K7_15', N'f_Opettajat_taiteen_perusopetus_kelpoisuus_aine', N'p_lataa_OPE');
	INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K7_16', NULL, NULL);
	INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_17', N'f_Opettajat_taiteen_perusopetus_osallistuminen_taydennyskoulutukseen', N'p_lataa_OPE');
	INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_18', N'f_Opettajat_perus_ja_lukioaste_kelpoisuus_kokonaisaineisto', N'p_lataa_OPE');
	INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_19', N'f_Opettajat_ammatillinen_koulutus_kelpoisuus_kokonaisaineisto', N'p_lataa_OPE');

END

GO
USE [ANTERO]