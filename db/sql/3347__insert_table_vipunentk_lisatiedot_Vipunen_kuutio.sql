USE [VipunenTK_lisatiedot]
GO

IF NOT EXISTS 
(
	SELECT * FROM [dbo].[Vipunen_kuutio] 
	WHERE [kuutio_nimi] IN (N'Opettajatiedot_7_15',N'Opettajatiedot_7_17',N'Opettajatiedot_7_18',N'Opettajatiedot_7_19')
)

BEGIN

	INSERT [dbo].[Vipunen_kuutio] ([kuutio_nimi], [kuutio_avain], [kuutio_toteutustyyppi], [kuutio_projekti], [kuutio_prosessointiryhma], [ajotunnus]) VALUES (N'Opettajatiedot_7_15', N'OPE_715_TAB', N'tabular', N'Opettajatiedot', N'TK', N'vipunen');
	INSERT [dbo].[Vipunen_kuutio] ([kuutio_nimi], [kuutio_avain], [kuutio_toteutustyyppi], [kuutio_projekti], [kuutio_prosessointiryhma], [ajotunnus]) VALUES (N'Opettajatiedot_7_17', N'OPE_717_TAB', N'tabular', N'Opettajatiedot', N'TK', N'vipunen');
	INSERT [dbo].[Vipunen_kuutio] ([kuutio_nimi], [kuutio_avain], [kuutio_toteutustyyppi], [kuutio_projekti], [kuutio_prosessointiryhma], [ajotunnus]) VALUES (N'Opettajatiedot_7_18', N'OPE_718_TAB', N'tabular', N'Opettajatiedot', N'TK', N'vipunen');
	INSERT [dbo].[Vipunen_kuutio] ([kuutio_nimi], [kuutio_avain], [kuutio_toteutustyyppi], [kuutio_projekti], [kuutio_prosessointiryhma], [ajotunnus]) VALUES (N'Opettajatiedot_7_19', N'OPE_719_TAB', N'tabular', N'Opettajatiedot', N'TK', N'vipunen');
	
END

GO
USE [ANTERO]