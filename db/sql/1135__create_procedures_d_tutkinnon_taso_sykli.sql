USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_tutkinnon_aloitussykli_kk]    Script Date: 5.1.2018 14:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_tutkinnon_aloitussykli_kk]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_tutkinnon_aloitussykli_kk] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_tutkinnon_aloitussykli_kk] AS

TRUNCATE TABLE dw.d_tutkinnon_aloitussykli_kk

SET IDENTITY_INSERT dw.d_tutkinnon_aloitussykli_kk ON
INSERT dw.d_tutkinnon_aloitussykli_kk (id, koodi, selite_fi, selite_sv, selite_en, jarjestys_koodi, loadtime, source, username)
VALUES
(-1, N'-1', N'Tieto puuttuu', N'Information saknas', N'Missing data', N'99', CAST(N'2018-01-05T00:00:00.000' AS DateTime), N'manual', N'DWI\pankalai'),
(1 ,N'1',  N'I sykli', N'Cykeln I', N'Cycle I', N'1', CAST(N'2018-01-05T08:00:33.513' AS DateTime), N'p_lataa_d_tutkinnon_aloitussykli_kk', N'DWI\pankalai'),
(2, N'2', N'I sykli siirtohaku', N'Cykeln I ansökan om överflyttning', N'Cycle I transfer application', N'2', CAST(N'2018-01-05T08:00:33.513' AS DateTime), N'p_lataa_d_tutkinnon_aloitussykli_kk', N'DWI\pankalai'),
(3, N'3', N'II sykli', N'Cykeln II', N'Cycle II', N'3', CAST(N'2018-01-05T08:00:33.513' AS DateTime), N'p_lataa_d_tutkinnon_aloitussykli_kk', N'DWI\pankalai'),
(4, N'4', N'II sykli siirtohaku', N'Cykeln II ansökan om överflyttning', N'Cycle II transfer application', N'4', CAST(N'2018-01-05T08:00:33.513' AS DateTime), N'p_lataa_d_tutkinnon_aloitussykli_kk', N'DWI\pankalai'),
(5, N'5', N'III sykli', N'Cykeln III', N'Cycle III', N'5', CAST(N'2018-01-05T08:00:33.513' AS DateTime), N'p_lataa_d_tutkinnon_aloitussykli_kk', N'DWI\pankalai'),
(5, N'5', N'Tutkintoon johtamaton koulutus', N'Utbildning som inte leder till en examen', N'Education not leading to a qualification', N'6', CAST(N'2018-01-05T08:00:33.513' AS DateTime), N'p_lataa_d_tutkinnon_aloitussykli_kk', N'DWI\pankalai')


SET IDENTITY_INSERT dw.d_tutkinnon_aloitussykli_kk OFF




GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_tutkinnon_taso_kk]    Script Date: 5.1.2018 14:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_tutkinnon_taso_kk]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_tutkinnon_taso_kk] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_tutkinnon_taso_kk] AS

TRUNCATE TABLE dw.d_tutkinnon_taso_kk

SET IDENTITY_INSERT dw.d_tutkinnon_taso_kk ON
INSERT dw.d_tutkinnon_taso_kk (id, koodi, selite_fi, selite_sv, selite_en, jarjestys_koodi, loadtime, source, username)
VALUES
(-1, N'-1', N'Tieto puuttuu', N'Information saknas', N'Missing data', N'99', CAST(N'2018-01-05T00:00:00.000' AS DateTime), N'manual', N'DWI\pankalai'),
(1 ,N'1',  N'Alempi', N'Lägre', N'Bachelor''s degree', N'1', CAST(N'2018-01-05T08:00:33.513' AS DateTime), N'p_lataa_d_tutkinnon_taso_kk', N'DWI\pankalai'),
(2, N'2', N'Ylempi', N'Högre', N'Master''s degree', N'2', CAST(N'2018-01-05T08:00:33.513' AS DateTime), N'p_lataa_d_tutkinnon_taso_kk', N'DWI\pankalai'),
(3, N'3', N'Alempi ja ylempi', N'Lägre och högre', N'Bachelor''s and Master''s degree', N'3', CAST(N'2018-01-05T08:00:33.513' AS DateTime), N'p_lataa_d_tutkinnon_taso_kk', N'DWI\pankalai'),
(4, N'4', N'Jatkotutkinto', N'Forskarexamen', N'Doctoral degree', N'4', CAST(N'2018-01-05T08:00:33.513' AS DateTime), N'p_lataa_d_tutkinnon_taso_kk', N'DWI\pankalai'),
(5, N'5', N'Tutkintoon johtamaton koulutus', N'Utbildning som inte leder till en examen', N'Education not leading to a qualification', N'5', CAST(N'2018-01-05T08:00:33.513' AS DateTime), N'p_lataa_d_tutkinnon_taso_kk', N'DWI\pankalai')


SET IDENTITY_INSERT dw.d_tutkinnon_taso_kk OFF


