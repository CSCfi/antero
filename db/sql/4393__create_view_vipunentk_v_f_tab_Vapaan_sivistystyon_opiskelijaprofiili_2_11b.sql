USE [VipunenTK]
GO

DROP VIEW IF EXISTS [dbo].[v_f_tab_Vapaan_sivistystyon_opiskelijaprofiili_2_11b]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_f_tab_Vapaan_sivistystyon_opiskelijaprofiili_2_11b] as

SELECT 

	[Tilastovuosi] = f.tilv

	--org
	,[Oppilaitos] = d1.oppilaitos
    ,[Koulutuksen järjestäjä] = d2.koulutuksen_jarjestaja
  
	--koul
	,[Koulutustyyppi] = f.koultyp
	,[Taustamuuttuja] = f.muuttuja
	,[Taustamuuttujan arvo] = f.muuttuja_arvo   

	--lkm
    ,[lkm]

	--jarj
	,[Jarjestys_koulutustyyppi] = f.koultyp_jarjestys
    ,[Jarjestys_taustamuuttujan_arvo] = f.muuttuja_arvo_jarjestys

FROM dbo.f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili f

LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d1 on d1.id = f.tunn_id
LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d2 on d2.id = f.jarj_id

GO
use antero

