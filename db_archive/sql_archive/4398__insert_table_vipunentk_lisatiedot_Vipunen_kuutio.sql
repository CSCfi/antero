USE [VipunenTK_lisatiedot]
GO

IF NOT EXISTS 
(
	SELECT * FROM [dbo].[Vipunen_kuutio] 
	WHERE [kuutio_nimi] IN (N'Työvoimatutkimus työlliset',N'Työvoimatutkimus työlliset ja työttömät')
)

BEGIN

	INSERT [dbo].[Vipunen_kuutio] ([kuutio_nimi], [kuutio_avain], [kuutio_toteutustyyppi], [kuutio_projekti], [kuutio_prosessointiryhma], [ajotunnus]) VALUES (N'Työvoimatutkimus työlliset', N'TVT_T_TAB', N'tabular', N'Työvoimatutkimus', N'TK', N'vipunen');
	INSERT [dbo].[Vipunen_kuutio] ([kuutio_nimi], [kuutio_avain], [kuutio_toteutustyyppi], [kuutio_projekti], [kuutio_prosessointiryhma], [ajotunnus]) VALUES (N'Työvoimatutkimus työlliset ja työttömät', N'TVT_TT_TAB', N'tabular', N'Työvoimatutkimus', N'TK', N'vipunen');
	
END

GO
USE [ANTERO]