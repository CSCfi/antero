USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_jarjestajankoko]    Script Date: 12.1.2021 6:30:30 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_jarjestajankoko]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_jarjestajankoko]    Script Date: 12.1.2021 6:30:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_d_jarjestajankoko]
AS

truncate table [ANTERO].[dw].[d_jarjestajankoko];
insert into [ANTERO].[dw].[d_jarjestajankoko] 
select * from VipunenTK_SA.dbo.v_sa_6_3_Koulutuksen_jarjestajan_koko 


GO


