USE [VipunenTK_lisatiedot]
GO

IF NOT EXISTS 
(
	SELECT * FROM [dbo].[Vipunen_aineisto_kuutio] 
	WHERE [aineisto_avain] IN (N'TK_R4_5', N'TK_R4_6a', N'TK_R4_6b')
)

BEGIN

	INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_R4_5', N'TVT_T_TAB');
	INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_R4_6a', N'TVT_TT_TAB');
	INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_R4_6b', N'TVT_TT_TAB');
END

GO
USE [ANTERO]