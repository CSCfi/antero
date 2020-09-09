USE [VipunenTK_lisatiedot]
GO

IF NOT EXISTS 
(
	SELECT * FROM [dbo].[Vipunen_aineisto_kuutio] 
	WHERE [kuutio_avain] IN (N'OPE_715_TAB',N'OPE_717_TAB',N'OPE_718_TAB',N'OPE_719_TAB')
)

BEGIN

	INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K7_15', N'OPE_715_TAB');
	INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_17', N'OPE_717_TAB');
	INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_18', N'OPE_718_TAB');
	INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_19', N'OPE_719_TAB');

END

GO
USE [ANTERO]