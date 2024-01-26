USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_suorituksen_tyyppi]    Script Date: 3.5.2023 22:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_d_suorituksen_tyyppi] AS

TRUNCATE TABLE dw.d_suorituksen_tyyppi

SET IDENTITY_INSERT dw.d_suorituksen_tyyppi ON
INSERT dw.d_suorituksen_tyyppi (id, koodi, selite_fi, selite_sv, selite_en,  jarjestys, source)

VALUES 
(-1,-1,'Tieto puuttuu','Information saknas','Missing data','999','manuaalinen'),
(1,1,'Koko tutkinto','Hela examen','Qualification in full','1','manuaalinen'),
(2,2,'Tutkinnon osa/osia','En del eller delar av examen','Only module(s) of the qualification (not the full qualification)','2','manuaalinen'),
(3,3,'Tutkinnon osaa pienempi kokonaisuus','En mindre helhet än en yrkesexamensdel','A module smaller than vocational education qualification unit','3','manuaalinen')


GO


