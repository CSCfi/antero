USE [ANTERO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_haku_amk_yo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_haku_amk_yo] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_haku_amk_yo] AS

TRUNCATE TABLE dw.d_haku_amk_yo

SET IDENTITY_INSERT dw.d_haku_amk_yo ON
INSERT dw.d_haku_amk_yo (id, koodi, selite_fi, selite_sv, selite_en, jarjestys_koodi, loadtime, source, username)
VALUES
(-1, N'-1', N'Tieto puuttuu', N'Information saknas', N'Missing data', N'99', CAST(N'2018-01-03T00:00:00.000' AS DateTime), N'manual', N'DWI\pankalai'),
(1 ,N'1',  N'Hakenut vain yliopistokoulutukseen', N'Ansökte endast till universitet', N'Applied only to university', N'2', CAST(N'2018-01-03T08:00:33.513' AS DateTime), N'p_lataa_d_haku_amk_yo', N'DWI\pankalai'),
(2, N'2', N'Hakenut vain ammattikorkeakoulutukseen', N'Ansökte endast till yrkeshögskola', N'Applied only to UAS', N'1', CAST(N'2018-01-03T08:00:33.513' AS DateTime), N'p_lataa_d_haku_amk_yo', N'DWI\pankalai'),
(3, N'3', N'Hakenut ammattikorkea- ja yliopistokoulutukseen', N'Ansökte till yrkeshögskola och universitet', N'Applied to UAS and university', N'3', CAST(N'2018-01-03T08:00:33.513' AS DateTime), N'p_lataa_d_haku_amk_yo', N'DWI\pankalai')


SET IDENTITY_INSERT dw.d_haku_amk_yo OFF


