USE [VipunenTK_lisatiedot]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DECLARE @lkm int;

SET @lkm = (SELECT count(*) FROM [dbo].[yosairaala] WHERE [yosairaala_avain] = '90007');

IF @lkm = 0
  INSERT [dbo].[yosairaala] ([id], [luotu], [yosairaala_avain], [yosairaala_lyhenne], [yosairaala], [yosairaala_SV], [yosairaala_EN], [jarjestys_yosairaala], [yosairaala_lyhenne_historia], [yosairaala_historia], [yosairaala_historia_SV], [yosairaala_historia_EN], [jarjestys_yosairaala_historia], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2025-01-17' AS Date), N'90007', N'Fimlab', N'Fimlab laboratoriot Oy', N'Fimlab laboratoriot Oy', N'Fimlab laboratoriot Oy', N'70', N'Fimlab', N'Fimlab laboratoriot Oy', N'Fimlab laboratoriot Oy', N'Fimlab laboratoriot Oy', N'70', N'E', N'0', N'Tilastokeskus 5.4', N'CSC Mika')

GO

