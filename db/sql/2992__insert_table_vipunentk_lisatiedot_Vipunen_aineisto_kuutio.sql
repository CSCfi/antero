USE [VipunenTK_lisatiedot]
GO

IF NOT EXISTS 
(
	SELECT * FROM [dbo].[Vipunen_aineisto_kuutio] 
	WHERE [kuutio_avain] = N'VAES_TAB'
)

BEGIN
	
	INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_9', N'VAES_TAB');
	
END

GO
USE [ANTERO]