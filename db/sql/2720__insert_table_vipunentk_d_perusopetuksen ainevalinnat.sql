USE [VipunenTK]
GO

IF NOT EXISTS (SELECT * FROM [dbo].[d_perusopetuksen_ainevalinnat] WHERE id = 79)
BEGIN
	INSERT INTO [dbo].[d_perusopetuksen_ainevalinnat]
 
	([id], [luotu], [alkaa], [paattyy], [aineryhmä], [aineryhmä_SV], [aineryhmä_EN], [aine_koodi], [aine], [aine_SV], [aine_EN], [kielen_taso_koodi], [kielen_taso], [kielen_taso_SV], [kielen_taso_EN], [ainevalinta], [ainevalinta_SV], [ainevalinta_EN], [aineryhmä_jarjestys], [aine_jarjestys], [kielen_taso_jarjestys], [poistettu], [tietolahde], [kommentti]) 
	VALUES (79, CAST(N'2019-12-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'Muut valinnaisaineet', N'Övriga tillvalsämnen', N'Other optional subjects', N'kasityo', N'käsityö', N'slöjd', N'Crafts', N'0', N'Ei tasoa', N'Ingen nivå', N'No level', N'käsityö', N'slöjd', N'Crafts', N'40', N'4021', N'90', N' ', N'Manuaalinen', N'')
END
GO
USE [ANTERO]