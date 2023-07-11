USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_K3_16_Moninkertainen_haku]    Script Date: 11.7.2023 17:29:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dbo].[p_lataa_f_K3_16_Moninkertainen_haku] AS

/*
Poistettu aineistomuunnoksista, koska ei tule enää uusia tietoja. JS 11.7.2023
*/

TRUNCATE TABLE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku

INSERT INTO VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku

SELECT Tilastovuosi = [tilv]
      ,[tilv_date]
	  ,Koulutuksen_alkamislukukausi_avain = [tilv] + [allk]
      ,Koulutuksen_alkamislukukausi = [allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast_avain] = 'OPMAST' + [luammhaku1_opmast]
      ,[luammhaku2_opmast_avain] = 'OPMAST' + [luammhaku2_opmast]
      ,[luammhaku3_opmast_avain] = 'OPMAST' + [luammhaku3_opmast]
      ,[luammhaku4_opmast_avain] = 'OPMAST' + [luammhaku4_opmast]
      ,[luammhaku5_opmast_avain] = 'OPMAST' + [luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2_avain] = 'KASTET2' + [luammhaku1_kaste_t2]
	  ,[luammhaku2_kaste_t2_avain] = 'KASTET2' + [luammhaku2_kaste_t2]
	  ,[luammhaku3_kaste_t2_avain] = 'KASTET2' + [luammhaku3_kaste_t2]
	  ,[luammhaku4_kaste_t2_avain] = 'KASTET2' + [luammhaku4_kaste_t2]
	  ,[luammhaku5_kaste_t2_avain] = 'KASTET2' + [luammhaku5_kaste_t2]
	  ,[luammhaku1_iscfibroad2013_avain] = 'ISCFIBROAD' + [luammhaku1_iscfibroad2013]
	  ,[luammhaku2_iscfibroad2013_avain] = 'ISCFIBROAD' + [luammhaku2_iscfibroad2013]
	  ,[luammhaku3_iscfibroad2013_avain] = 'ISCFIBROAD' + [luammhaku3_iscfibroad2013]
	  ,[luammhaku4_iscfibroad2013_avain] = 'ISCFIBROAD' + [luammhaku4_iscfibroad2013]
	  ,[luammhaku5_iscfibroad2013_avain] = 'ISCFIBROAD' + [luammhaku5_iscfibroad2013]
      ,[luammhaku1_opmopa_avain] = 'OPMOPA' + [luammhaku1_opmopa]
      ,[luammhaku2_opmopa_avain] = 'OPMOPA' + [luammhaku2_opmopa]
      ,[luammhaku3_opmopa_avain] = 'OPMOPA' + [luammhaku3_opmopa]
      ,[luammhaku4_opmopa_avain] = 'OPMOPA' + [luammhaku4_opmopa]
      ,[luammhaku5_opmopa_avain] = 'OPMOPA' + [luammhaku5_opmopa]
      ,[luammhaku1_opm95opa_avain] = 'OPM95OPA' + [luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa_avain] = 'OPM95OPA' + [luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa_avain] = 'OPM95OPA' + [luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa_avain] = 'OPM95OPA' + [luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa_avain] = 'OPM95OPA' + [luammhaku5_opm95opa]
      ,[luammhaku1_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[luammhaku1_opmopa])
      ,[luammhaku2_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[luammhaku2_opmopa])
      ,[luammhaku3_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[luammhaku3_opmopa])
      ,[luammhaku4_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[luammhaku4_opmopa])
      ,[luammhaku5_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[luammhaku5_opmopa])
      ,[luammhaku1_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[luammhaku1_opm95opa])
      ,[luammhaku2_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[luammhaku2_opm95opa])
      ,[luammhaku3_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[luammhaku3_opm95opa])
      ,[luammhaku4_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[luammhaku4_opm95opa])
      ,[luammhaku5_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[luammhaku5_opm95opa])
      ,[luammhaku1_opmast] = [luammhaku1_opmast]
      ,[luammhaku2_opmast] = [luammhaku2_opmast]
      ,[luammhaku3_opmast] = [luammhaku3_opmast]
      ,[luammhaku4_opmast] = [luammhaku4_opmast]
      ,[luammhaku5_opmast] = [luammhaku5_opmast]
      ,[luammhaku1_opmopa] = [luammhaku1_opmopa]
      ,[luammhaku2_opmopa] = [luammhaku2_opmopa]
      ,[luammhaku3_opmopa] = [luammhaku3_opmopa]
      ,[luammhaku4_opmopa] = [luammhaku4_opmopa]
      ,[luammhaku5_opmopa] = [luammhaku5_opmopa]
      ,[luammhaku1_opm95opa] = [luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa] = [luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa] = [luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa] = [luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa] = [luammhaku5_opm95opa]
      ,[luammhaku1_opmala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[luammhaku1_opmopa])
      ,[luammhaku2_opmala] = Cast(NULL as nvarchar(2)) -- (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[luammhaku2_opmopa])
      ,[luammhaku3_opmala] = Cast(NULL as nvarchar(2)) -- (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[luammhaku3_opmopa])
      ,[luammhaku4_opmala] = Cast(NULL as nvarchar(2)) -- (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[luammhaku4_opmopa])
      ,[luammhaku5_opmala] = Cast(NULL as nvarchar(2)) -- (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[luammhaku5_opmopa])
      ,[luammhaku1_opm95ala] = Cast(NULL as nvarchar(2)) -- (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[luammhaku1_opm95opa])
      ,[luammhaku2_opm95ala] = Cast(NULL as nvarchar(2)) -- (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[luammhaku2_opm95opa])
      ,[luammhaku3_opm95ala] = Cast(NULL as nvarchar(2)) -- (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[luammhaku3_opm95opa])
      ,[luammhaku4_opm95ala] = Cast(NULL as nvarchar(2)) -- (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[luammhaku4_opm95opa])
      ,[luammhaku5_opm95ala] = Cast(NULL as nvarchar(2)) -- (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[luammhaku5_opm95opa])
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn]
	  ,[amkhaku5_tunn]
	  ,[amkhaku6_tunn]
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast_avain] = 'OPMAST' + [amkhaku1_opmast]
      ,[amkhaku2_opmast_avain] = 'OPMAST' + [amkhaku2_opmast]
      ,[amkhaku3_opmast_avain] = 'OPMAST' + [amkhaku3_opmast]
      ,[amkhaku4_opmast_avain] = 'OPMAST' + [amkhaku4_opmast]
	  ,[amkhaku5_opmast_avain] = 'OPMAST' + [amkhaku5_opmast]
	  ,[amkhaku6_opmast_avain] = 'OPMAST' + [amkhaku6_opmast]
      ,[amkhakum_opmast_avain] = 'OPMAST' + [amkhakum_opmast]
      ,[amkhaku1_opmopa_avain] = 'OPMOPA' + [amkhaku1_opmopa]
      ,[amkhaku2_opmopa_avain] = 'OPMOPA' + [amkhaku2_opmopa]
      ,[amkhaku3_opmopa_avain] = 'OPMOPA' + [amkhaku3_opmopa]
      ,[amkhaku4_opmopa_avain] = 'OPMOPA' + [amkhaku4_opmopa]
	  ,[amkhaku5_opmopa_avain] = 'OPMOPA' + [amkhaku5_opmopa]
	  ,[amkhaku6_opmopa_avain] = 'OPMOPA' + [amkhaku6_opmopa]
      ,[amkhakum_opmopa_avain] = 'OPMOPA' + [amkhakum_opmopa]
      ,[amkhaku1_opm95opa_avain] = 'OPM95OPA' + [amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa_avain] = 'OPM95OPA' + [amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa_avain] = 'OPM95OPA' + [amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa_avain] = 'OPM95OPA' + [amkhaku4_opm95opa]
	  ,[amkhaku5_opm95opa_avain] = 'OPM95OPA' + [amkhaku5_opm95opa]
	  ,[amkhaku6_opm95opa_avain] = 'OPM95OPA' + [amkhaku6_opm95opa]
      ,[amkhakum_opm95opa_avain] = 'OPM95OPA' + [amkhakum_opm95opa]
      ,[amkhaku1_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhaku1_opmopa])
      ,[amkhaku2_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhaku2_opmopa])
      ,[amkhaku3_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhaku3_opmopa])
      ,[amkhaku4_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhaku4_opmopa])
	  ,[amkhaku5_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhaku4_opmopa])
	  ,[amkhaku6_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhaku4_opmopa])
      ,[amkhakum_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhakum_opmopa])
      ,[amkhaku1_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhaku1_opm95opa])
      ,[amkhaku2_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhaku2_opm95opa])
      ,[amkhaku3_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhaku3_opm95opa])
      ,[amkhaku4_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhaku4_opm95opa])
	  ,[amkhaku5_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhaku4_opm95opa])
	  ,[amkhaku6_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhaku4_opm95opa])
      ,[amkhakum_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhakum_opm95opa])
      ,[amkhaku1_opmast] = [amkhaku1_opmast]
      ,[amkhaku2_opmast] = [amkhaku2_opmast]
      ,[amkhaku3_opmast] = [amkhaku3_opmast]
      ,[amkhaku4_opmast] = [amkhaku4_opmast]
	  ,[amkhaku5_opmast] = [amkhaku5_opmast]
	  ,[amkhaku6_opmast] = [amkhaku6_opmast]
      ,[amkhakum_opmast] = [amkhakum_opmast]
      ,[amkhaku1_opmopa] = [amkhaku1_opmopa]
      ,[amkhaku2_opmopa] = [amkhaku2_opmopa]
      ,[amkhaku3_opmopa] = [amkhaku3_opmopa]
      ,[amkhaku4_opmopa] = [amkhaku4_opmopa]
	  ,[amkhaku5_opmopa] = [amkhaku5_opmopa]
	  ,[amkhaku6_opmopa] = [amkhaku6_opmopa]
      ,[amkhakum_opmopa] = [amkhakum_opmopa]
      ,[amkhaku1_opm95opa] = [amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa] = [amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa] = [amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa] = [amkhaku4_opm95opa]
	  ,[amkhaku5_opm95opa] = [amkhaku5_opm95opa]
	  ,[amkhaku6_opm95opa] = [amkhaku6_opm95opa]
      ,[amkhakum_opm95opa] = [amkhakum_opm95opa]
      ,[amkhaku1_opmala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhaku1_opmopa])
      ,[amkhaku2_opmala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhaku2_opmopa])
      ,[amkhaku3_opmala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhaku3_opmopa])
      ,[amkhaku4_opmala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhaku4_opmopa])
	  ,[amkhaku5_opmala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhaku4_opmopa])
	  ,[amkhaku6_opmala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhaku4_opmopa])
      ,[amkhakum_opmala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[amkhakum_opmopa])
      ,[amkhaku1_opm95ala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhaku1_opm95opa])
      ,[amkhaku2_opm95ala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhaku2_opm95opa])
      ,[amkhaku3_opm95ala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhaku3_opm95opa])
      ,[amkhaku4_opm95ala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhaku4_opm95opa])
	  ,[amkhaku5_opm95ala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhaku4_opm95opa])
	  ,[amkhaku6_opm95ala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhaku4_opm95opa])
      ,[amkhakum_opm95ala] =Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[amkhakum_opm95opa])
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
	  ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli]
	  ,[amkhaku5_okieli]
	  ,[amkhaku6_okieli]
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv]
      ,[amkhaku2_hyv]
      ,[amkhaku3_hyv]
      ,[amkhaku4_hyv]
	  ,[amkhaku5_hyv]
	  ,[amkhaku6_hyv]
      ,[amkhakum_hyv]
      ,[amkhaku1_vastotto]
      ,[amkhaku2_vastotto]
      ,[amkhaku3_vastotto]
      ,[amkhaku4_vastotto]
	  ,[amkhaku5_vastotto]
	  ,[amkhaku6_vastotto]
      ,[amkhakum_vastotto]
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast_avain] = 'OPMAST' + [yohakua_opmast]
      ,[yohakub_opmast_avain] = 'OPMAST' + [yohakub_opmast]
      ,[yohakuc_opmast_avain] = 'OPMAST' + [yohakuc_opmast]
      ,[yohakud_opmast_avain] = 'OPMAST' + [yohakud_opmast]
      ,[yohakue_opmast_avain] = 'OPMAST' + [yohakue_opmast]
      ,[yohakuf_opmast_avain] = 'OPMAST' + [yohakuf_opmast]
      ,[yohakug_opmast_avain] = 'OPMAST' + [yohakug_opmast]
      ,[yohakuh_opmast_avain] = 'OPMAST' + [yohakuh_opmast]
      ,[yohakui_opmast_avain] = 'OPMAST' + [yohakui_opmast]
      ,[yohakua_opmopa_avain] = 'OPMOPA' + [yohakua_opmopa]
      ,[yohakub_opmopa_avain] = 'OPMOPA' + [yohakub_opmopa]
      ,[yohakuc_opmopa_avain] = 'OPMOPA' + [yohakuc_opmopa]
      ,[yohakud_opmopa_avain] = 'OPMOPA' + [yohakud_opmopa]
      ,[yohakue_opmopa_avain] = 'OPMOPA' + [yohakue_opmopa]
      ,[yohakuf_opmopa_avain] = 'OPMOPA' + [yohakuf_opmopa]
      ,[yohakug_opmopa_avain] = 'OPMOPA' + [yohakug_opmopa]
      ,[yohakuh_opmopa_avain] = 'OPMOPA' + [yohakuh_opmopa]
      ,[yohakui_opmopa_avain] = 'OPMOPA' + [yohakui_opmopa]
      ,[yohakua_opm95opa_avain] = 'OPM95OPA' + [yohakua_opm95opa]
      ,[yohakub_opm95opa_avain] = 'OPM95OPA' + [yohakub_opm95opa]
      ,[yohakuc_opm95opa_avain] = 'OPM95OPA' + [yohakuc_opm95opa]
      ,[yohakud_opm95opa_avain] = 'OPM95OPA' + [yohakud_opm95opa]
      ,[yohakue_opm95opa_avain] = 'OPM95OPA' + [yohakue_opm95opa]
      ,[yohakuf_opm95opa_avain] = 'OPM95OPA' + [yohakuf_opm95opa]
      ,[yohakug_opm95opa_avain] = 'OPM95OPA' + [yohakug_opm95opa]
      ,[yohakuh_opm95opa_avain] = 'OPM95OPA' + [yohakuh_opm95opa]
      ,[yohakui_opm95opa_avain] = 'OPM95OPA' + [yohakui_opm95opa]
      ,[yohakua_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakua_opmopa])
      ,[yohakub_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakub_opmopa])
      ,[yohakuc_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakuc_opmopa])
      ,[yohakud_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakud_opmopa])
      ,[yohakue_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakue_opmopa])
      ,[yohakuf_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakuf_opmopa])
      ,[yohakug_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakug_opmopa])
      ,[yohakuh_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakuh_opmopa])
      ,[yohakui_opmala_avain] = Cast(NULL as nvarchar(8)) --'OPMALA' + (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakui_opmopa])
      ,[yohakua_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakua_opm95opa])
      ,[yohakub_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakub_opm95opa])
      ,[yohakuc_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakuc_opm95opa])
      ,[yohakud_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakud_opm95opa])
      ,[yohakue_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakue_opm95opa])
      ,[yohakuf_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakuf_opm95opa])
      ,[yohakug_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakug_opm95opa])
      ,[yohakuh_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakuh_opm95opa])
      ,[yohakui_opm95ala_avain] = Cast(NULL as nvarchar(10)) --'OPM95ALA' + (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakui_opm95opa])
      ,[yohakua_opmast] = [yohakua_opmast]
      ,[yohakub_opmast] = [yohakub_opmast]
      ,[yohakuc_opmast] = [yohakuc_opmast]
      ,[yohakud_opmast] = [yohakud_opmast]
      ,[yohakue_opmast] = [yohakue_opmast]
      ,[yohakuf_opmast] = [yohakuf_opmast]
      ,[yohakug_opmast] = [yohakug_opmast]
      ,[yohakuh_opmast] = [yohakuh_opmast]
      ,[yohakui_opmast] = [yohakui_opmast]
      ,[yohakua_opmopa] = [yohakua_opmopa]
      ,[yohakub_opmopa] = [yohakub_opmopa]
      ,[yohakuc_opmopa] = [yohakuc_opmopa]
      ,[yohakud_opmopa] = [yohakud_opmopa]
      ,[yohakue_opmopa] = [yohakue_opmopa]
      ,[yohakuf_opmopa] = [yohakuf_opmopa]
      ,[yohakug_opmopa] = [yohakug_opmopa]
      ,[yohakuh_opmopa] = [yohakuh_opmopa]
      ,[yohakui_opmopa] = [yohakui_opmopa]
      ,[yohakua_opm95opa] = [yohakua_opm95opa]
      ,[yohakub_opm95opa] = [yohakub_opm95opa]
      ,[yohakuc_opm95opa] = [yohakuc_opm95opa]
      ,[yohakud_opm95opa] = [yohakud_opm95opa]
      ,[yohakue_opm95opa] = [yohakue_opm95opa]
      ,[yohakuf_opm95opa] = [yohakuf_opm95opa]
      ,[yohakug_opm95opa] = [yohakug_opm95opa]
      ,[yohakuh_opm95opa] = [yohakuh_opm95opa]
      ,[yohakui_opm95opa] = [yohakui_opm95opa]
      ,[yohakua_opmala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakua_opmopa])
      ,[yohakub_opmala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakub_opmopa])
      ,[yohakuc_opmala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakuc_opmopa])
      ,[yohakud_opmala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakud_opmopa])
      ,[yohakue_opmala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakue_opmopa])
      ,[yohakuf_opmala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakuf_opmopa])
      ,[yohakug_opmala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakug_opmopa])
      ,[yohakuh_opmala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakuh_opmopa])
      ,[yohakui_opmala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPMOPA'+[yohakui_opmopa])
      ,[yohakua_opm95ala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakua_opm95opa])
      ,[yohakub_opm95ala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakub_opm95opa])
      ,[yohakuc_opm95ala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakuc_opm95opa])
      ,[yohakud_opm95ala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakud_opm95opa])
      ,[yohakue_opm95ala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakue_opm95opa])
      ,[yohakuf_opm95ala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakuf_opm95opa])
      ,[yohakug_opm95ala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakug_opm95opa])
      ,[yohakuh_opm95ala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakuh_opm95opa])
      ,[yohakui_opm95ala] = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = 'OPM95OPA'+[yohakui_opm95opa])
      ,[yohakua_hyv]
      ,[yohakub_hyv]
      ,[yohakuc_hyv]
      ,[yohakud_hyv]
      ,[yohakue_hyv]
      ,[yohakuf_hyv]
      ,[yohakug_hyv]
      ,[yohakuh_hyv]
      ,[yohakui_hyv]
      ,[yohakua_vastotto]
      ,[yohakub_vastotto]
      ,[yohakuc_vastotto]
      ,[yohakud_vastotto]
      ,[yohakue_vastotto]
      ,[yohakuf_vastotto]
      ,[yohakug_vastotto]
      ,[yohakuh_vastotto]
      ,[yohakui_vastotto]
      ,[yohakua_harekast] = Case when yohakua_harekast <> '' then yohakua_harekast else '-1' end
      ,[yohakub_harekast] = Case when yohakub_harekast <> '' then yohakub_harekast else '-1' end
      ,[yohakuc_harekast] = Case when yohakuc_harekast <> '' then yohakuc_harekast else '-1' end
      ,[yohakud_harekast] = Case when yohakud_harekast <> '' then yohakud_harekast else '-1' end
      ,[yohakue_harekast] = Case when yohakue_harekast <> '' then yohakue_harekast else '-1' end
      ,[yohakuf_harekast] = Case when yohakuf_harekast <> '' then yohakuf_harekast else '-1' end
      ,[yohakug_harekast] = Case when yohakug_harekast <> '' then yohakug_harekast else '-1' end
      ,[yohakuh_harekast] = Case when yohakuh_harekast <> '' then yohakuh_harekast else '-1' end
      ,[yohakui_harekast] = Case when yohakui_harekast <> '' then yohakui_harekast else '-1' end
      ,[yohakua_ylempi] = Case when yohakua_ylempi = '1' then '1' else '2' end
      ,[yohakub_ylempi] = Case when yohakub_ylempi = '1' then '1' else '2' end
      ,[yohakuc_ylempi] = Case when yohakuc_ylempi = '1' then '1' else '2' end
      ,[yohakud_ylempi] = Case when yohakud_ylempi = '1' then '1' else '2' end
      ,[yohakue_ylempi] = Case when yohakue_ylempi = '1' then '1' else '2' end
      ,[yohakuf_ylempi] = Case when yohakuf_ylempi = '1' then '1' else '2' end
      ,[yohakug_ylempi] = Case when yohakug_ylempi = '1' then '1' else '2' end
      ,[yohakuh_ylempi] = Case when yohakuh_ylempi = '1' then '1' else '2' end
      ,[yohakui_ylempi] = Case when yohakui_ylempi = '1' then '1' else '2' end
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2_avain] = 'KASTET2' + [kkhaku1_kaste_t2]
	  ,[kkhaku2_kaste_t2_avain] = 'KASTET2' + [kkhaku2_kaste_t2]
	  ,[kkhaku3_kaste_t2_avain] = 'KASTET2' + [kkhaku3_kaste_t2]
	  ,[kkhaku4_kaste_t2_avain] = 'KASTET2' + [kkhaku4_kaste_t2]
	  ,[kkhaku5_kaste_t2_avain] = 'KASTET2' + [kkhaku5_kaste_t2]
	  ,[kkhaku6_kaste_t2_avain] = 'KASTET2' + [kkhaku6_kaste_t2]
	  ,[kkhaku1_iscfibroad2013_avain] = 'ISCFIBROAD' + [kkhaku1_iscfibroad2013]
	  ,[kkhaku2_iscfibroad2013_avain] = 'ISCFIBROAD' + [kkhaku2_iscfibroad2013]
	  ,[kkhaku3_iscfibroad2013_avain] = 'ISCFIBROAD' + [kkhaku3_iscfibroad2013]
	  ,[kkhaku4_iscfibroad2013_avain] = 'ISCFIBROAD' + [kkhaku4_iscfibroad2013]
	  ,[kkhaku5_iscfibroad2013_avain] = 'ISCFIBROAD' + [kkhaku5_iscfibroad2013]
	  ,[kkhaku6_iscfibroad2013_avain] = 'ISCFIBROAD' + [kkhaku6_iscfibroad2013]
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,Sukupuoli_avain = [sp]
      ,Aidinkielir1_avain = [aikielir1]
      ,Syntymavuosi = [syntv]
      ,Ika = Case when syntv<>'' then Cast(tilv as integer) - Cast(syntv as integer) else -1 end
      ,Kotikunta_vuotta_aiemmin_avain = [tilvaskunx]
      ,Kansalaisuusr1_avain = [kansalr1]
--Aiempi tutkinto
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,aikyotutkkoulk_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikyotutkkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,aikyotutkkoulk_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikyotutkkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,aikyotutkkoulk_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikyotutkkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,aikyotutkkoulk_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikyotutkkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,aikyotutkkoulk_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikyotutkkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,aikammkoulk_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikammkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,aikammkoulk_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikammkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,aikammkoulk_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikammkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,aikammkoulk_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikammkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,aikammkoulk_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikammkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,aikamkkoulk_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikamkkoulk and Cast(suvuosiamk+'0101' as date) between alkaa and paattyy)
      ,aikamkkoulk_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikamkkoulk and Cast(suvuosiamk+'0101' as date) between alkaa and paattyy)
      ,aikamkkoulk_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikamkkoulk and Cast(suvuosiamk+'0101' as date) between alkaa and paattyy)
      ,aikamkkoulk_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikamkkoulk and Cast(suvuosiamk+'0101' as date) between alkaa and paattyy)
      ,aikamkkoulk_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikamkkoulk and Cast(suvuosiamk+'0101' as date) between alkaa and paattyy)
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,aikylamkkoulk_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylamkkoulk and Cast(suvuosiylamk+'0101' as date) between alkaa and paattyy)
      ,aikylamkkoulk_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylamkkoulk and Cast(suvuosiylamk+'0101' as date) between alkaa and paattyy)
      ,aikylamkkoulk_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylamkkoulk and Cast(suvuosiylamk+'0101' as date) between alkaa and paattyy)
      ,aikylamkkoulk_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylamkkoulk and Cast(suvuosiylamk+'0101' as date) between alkaa and paattyy)
      ,aikylamkkoulk_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylamkkoulk and Cast(suvuosiylamk+'0101' as date) between alkaa and paattyy)
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,aikalkkkoulk_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikalkkkoulk and Cast(suvuosialkk+'0101' as date) between alkaa and paattyy)
      ,aikalkkkoulk_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikalkkkoulk and Cast(suvuosialkk+'0101' as date) between alkaa and paattyy)
      ,aikalkkkoulk_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikalkkkoulk and Cast(suvuosialkk+'0101' as date) between alkaa and paattyy)
      ,aikalkkkoulk_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikalkkkoulk and Cast(suvuosialkk+'0101' as date) between alkaa and paattyy)
      ,aikalkkkoulk_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikalkkkoulk and Cast(suvuosialkk+'0101' as date) between alkaa and paattyy)
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,aikylkkkoulk_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylkkkoulk and Cast(suvuosiylkk+'0101' as date) between alkaa and paattyy)
      ,aikylkkkoulk_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylkkkoulk and Cast(suvuosiylkk+'0101' as date) between alkaa and paattyy)
      ,aikylkkkoulk_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylkkkoulk and Cast(suvuosiylkk+'0101' as date) between alkaa and paattyy)
      ,aikylkkkoulk_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylkkkoulk and Cast(suvuosiylkk+'0101' as date) between alkaa and paattyy)
      ,aikylkkkoulk_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylkkkoulk and Cast(suvuosiylkk+'0101' as date) between alkaa and paattyy)
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,aiklistrikoulk_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aiklistrikoulk and Cast(suvuosilistri+'0101' as date) between alkaa and paattyy)
      ,aiklistrikoulk_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aiklistrikoulk and Cast(suvuosilistri+'0101' as date) between alkaa and paattyy)
      ,aiklistrikoulk_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aiklistrikoulk and Cast(suvuosilistri+'0101' as date) between alkaa and paattyy)
      ,aiklistrikoulk_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aiklistrikoulk and Cast(suvuosilistri+'0101' as date) between alkaa and paattyy)
      ,aiklistrikoulk_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aiklistrikoulk and Cast(suvuosilistri+'0101' as date) between alkaa and paattyy)
      ,[suvuosilistri]
      ,[tunnlistri]
--Edellisen vuoden opiskelu
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,yotutkopisxkoulk_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yotutkopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yotutkopisxkoulk_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yotutkopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yotutkopisxkoulk_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yotutkopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yotutkopisxkoulk_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yotutkopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yotutkopisxkoulk_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yotutkopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,ammopisxkoulk_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = ammopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,ammopisxkoulk_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = ammopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,ammopisxkoulk_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = ammopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,ammopisxkoulk_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = ammopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,ammopisxkoulk_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = ammopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,amkopisxkoulk1_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk1_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk1_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk1_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk1_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,amkopisxkoulk2_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk2_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk2_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk2_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk2_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,amkopisxkoulk3_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk3_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk3_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk3_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk3_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,yoopisxkoulk1_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk1_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk1_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk1_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk1_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,yoopisxkoulk2_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk2_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk2_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk2_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk2_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,yoopisxkoulk3_opmast = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk3_opm95opa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk3_opmopa = Cast(NULL as nvarchar(3)) --(Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk3_opm95ala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk3_opmala = Cast(NULL as nvarchar(2)) --(Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]
      ,[rivinumero]
  FROM [VipunenTK_DW].dbo.sa_K3_16_Moninkertainen_haku

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       [luammhaku1_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [luammhaku1_opmopa_avain])
      ,[luammhaku2_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [luammhaku2_opmopa_avain])
      ,[luammhaku3_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [luammhaku3_opmopa_avain])
      ,[luammhaku4_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [luammhaku4_opmopa_avain])
      ,[luammhaku5_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [luammhaku5_opmopa_avain])
      ,[luammhaku1_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [luammhaku1_opm95opa_avain])
      ,[luammhaku2_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [luammhaku2_opm95opa_avain])
      ,[luammhaku3_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [luammhaku3_opm95opa_avain])
      ,[luammhaku4_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [luammhaku4_opm95opa_avain])
      ,[luammhaku5_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [luammhaku5_opm95opa_avain])
  
UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       [luammhaku1_opmala_avain] = 'OPMALA' + [luammhaku1_opmala]
      ,[luammhaku2_opmala_avain] = 'OPMALA' + [luammhaku2_opmala]
      ,[luammhaku3_opmala_avain] = 'OPMALA' + [luammhaku3_opmala]
      ,[luammhaku4_opmala_avain] = 'OPMALA' + [luammhaku4_opmala]
      ,[luammhaku5_opmala_avain] = 'OPMALA' + [luammhaku5_opmala]
      ,[luammhaku1_opm95ala_avain] = 'OPM95ALA' + [luammhaku1_opm95ala]
      ,[luammhaku2_opm95ala_avain] = 'OPM95ALA' + [luammhaku2_opm95ala]
      ,[luammhaku3_opm95ala_avain] = 'OPM95ALA' + [luammhaku3_opm95ala]
      ,[luammhaku4_opm95ala_avain] = 'OPM95ALA' + [luammhaku4_opm95ala]
      ,[luammhaku5_opm95ala_avain] = 'OPM95ALA' + [luammhaku5_opm95ala]

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       [amkhaku1_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhaku1_opmopa_avain])
      ,[amkhaku2_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhaku2_opmopa_avain])
      ,[amkhaku3_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhaku3_opmopa_avain])
      ,[amkhaku4_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhaku4_opmopa_avain])
	  ,[amkhaku5_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhaku5_opmopa_avain])
	  ,[amkhaku6_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhaku6_opmopa_avain])
      ,[amkhakum_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhakum_opmopa_avain])
      ,[amkhaku1_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhaku1_opm95opa_avain])
      ,[amkhaku2_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhaku2_opm95opa_avain])
      ,[amkhaku3_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhaku3_opm95opa_avain])
      ,[amkhaku4_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhaku4_opm95opa_avain])
	  ,[amkhaku5_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhaku5_opm95opa_avain])
	  ,[amkhaku6_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhaku6_opm95opa_avain])
      ,[amkhakum_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [amkhakum_opm95opa_avain])

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       [amkhaku1_opmala_avain] = 'OPMALA' + [amkhaku1_opmala]
      ,[amkhaku2_opmala_avain] = 'OPMALA' + [amkhaku2_opmala]
      ,[amkhaku3_opmala_avain] = 'OPMALA' + [amkhaku3_opmala]
      ,[amkhaku4_opmala_avain] = 'OPMALA' + [amkhaku4_opmala]
	  ,[amkhaku5_opmala_avain] = 'OPMALA' + [amkhaku5_opmala]
	  ,[amkhaku6_opmala_avain] = 'OPMALA' + [amkhaku6_opmala]
      ,[amkhakum_opmala_avain] = 'OPMALA' + [amkhakum_opmala]
      ,[amkhaku1_opm95ala_avain] = 'OPM95ALA' + [amkhaku1_opm95ala]
      ,[amkhaku2_opm95ala_avain] = 'OPM95ALA' + [amkhaku2_opm95ala]
      ,[amkhaku3_opm95ala_avain] = 'OPM95ALA' + [amkhaku3_opm95ala]
      ,[amkhaku4_opm95ala_avain] = 'OPM95ALA' + [amkhaku4_opm95ala]
	  ,[amkhaku5_opm95ala_avain] = 'OPM95ALA' + [amkhaku5_opm95ala]
	  ,[amkhaku6_opm95ala_avain] = 'OPM95ALA' + [amkhaku6_opm95ala]
      ,[amkhakum_opm95ala_avain] = 'OPM95ALA' + [amkhakum_opm95ala]

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       [yohakua_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakua_opmopa_avain])
      ,[yohakub_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakub_opmopa_avain])
      ,[yohakuc_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakuc_opmopa_avain])
      ,[yohakud_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakud_opmopa_avain])
      ,[yohakue_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakue_opmopa_avain])
      ,[yohakuf_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakuf_opmopa_avain])
      ,[yohakug_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakug_opmopa_avain])
      ,[yohakuh_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakuh_opmopa_avain])
      ,[yohakui_opmala] = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakui_opmopa_avain])
      ,[yohakua_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakua_opm95opa_avain])
      ,[yohakub_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakub_opm95opa_avain])
      ,[yohakuc_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakuc_opm95opa_avain])
      ,[yohakud_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakud_opm95opa_avain])
      ,[yohakue_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakue_opm95opa_avain])
      ,[yohakuf_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakuf_opm95opa_avain])
      ,[yohakug_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakug_opm95opa_avain])
      ,[yohakuh_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakuh_opm95opa_avain])
      ,[yohakui_opm95ala] = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = [yohakui_opm95opa_avain])

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       [yohakua_opmala_avain] = 'OPMALA' + [yohakua_opmala]
      ,[yohakub_opmala_avain] = 'OPMALA' + [yohakub_opmala]
      ,[yohakuc_opmala_avain] = 'OPMALA' + [yohakuc_opmala]
      ,[yohakud_opmala_avain] = 'OPMALA' + [yohakud_opmala]
      ,[yohakue_opmala_avain] = 'OPMALA' + [yohakue_opmala]
      ,[yohakuf_opmala_avain] = 'OPMALA' + [yohakuf_opmala]
      ,[yohakug_opmala_avain] = 'OPMALA' + [yohakug_opmala]
      ,[yohakuh_opmala_avain] = 'OPMALA' + [yohakuh_opmala]
      ,[yohakui_opmala_avain] = 'OPMALA' + [yohakui_opmala]
      ,[yohakua_opm95ala_avain] = 'OPM95ALA' + [yohakua_opm95ala]
      ,[yohakub_opm95ala_avain] = 'OPM95ALA' + [yohakub_opm95ala]
      ,[yohakuc_opm95ala_avain] = 'OPM95ALA' + [yohakuc_opm95ala]
      ,[yohakud_opm95ala_avain] = 'OPM95ALA' + [yohakud_opm95ala]
      ,[yohakue_opm95ala_avain] = 'OPM95ALA' + [yohakue_opm95ala]
      ,[yohakuf_opm95ala_avain] = 'OPM95ALA' + [yohakuf_opm95ala]
      ,[yohakug_opm95ala_avain] = 'OPM95ALA' + [yohakug_opm95ala]
      ,[yohakuh_opm95ala_avain] = 'OPM95ALA' + [yohakuh_opm95ala]
      ,[yohakui_opm95ala_avain] = 'OPM95ALA' + [yohakui_opm95ala]

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       aikyotutkkoulk_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikyotutkkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,aikyotutkkoulk_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikyotutkkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,aikyotutkkoulk_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikyotutkkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,aikyotutkkoulk_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikyotutkkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)
      ,aikyotutkkoulk_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikyotutkkoulk and Cast(suvuosiyotutk+'0101' as date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       aikammkoulk_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikammkoulk and Cast(suvuosiamm+'0101' as date) between alkaa and paattyy)
      ,aikammkoulk_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikammkoulk and Cast(suvuosiamm+'0101' as date) between alkaa and paattyy)
      ,aikammkoulk_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikammkoulk and Cast(suvuosiamm+'0101' as date) between alkaa and paattyy)
      ,aikammkoulk_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikammkoulk and Cast(suvuosiamm+'0101' as date) between alkaa and paattyy)
      ,aikammkoulk_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikammkoulk and Cast(suvuosiamm+'0101' as date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       amkopisxkoulk1_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk1_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk1_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk1_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk1_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       aikylamkkoulk_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylamkkoulk and Cast(suvuosiylamk+'0101' as date) between alkaa and paattyy)
      ,aikylamkkoulk_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylamkkoulk and Cast(suvuosiylamk+'0101' as date) between alkaa and paattyy)
      ,aikylamkkoulk_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylamkkoulk and Cast(suvuosiylamk+'0101' as date) between alkaa and paattyy)
      ,aikylamkkoulk_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylamkkoulk and Cast(suvuosiylamk+'0101' as date) between alkaa and paattyy)
      ,aikylamkkoulk_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylamkkoulk and Cast(suvuosiylamk+'0101' as date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       aikalkkkoulk_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikalkkkoulk and Cast(suvuosialkk+'0101' as date) between alkaa and paattyy)
      ,aikalkkkoulk_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikalkkkoulk and Cast(suvuosialkk+'0101' as date) between alkaa and paattyy)
      ,aikalkkkoulk_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikalkkkoulk and Cast(suvuosialkk+'0101' as date) between alkaa and paattyy)
      ,aikalkkkoulk_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikalkkkoulk and Cast(suvuosialkk+'0101' as date) between alkaa and paattyy)
      ,aikalkkkoulk_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikalkkkoulk and Cast(suvuosialkk+'0101' as date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       aikylkkkoulk_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylkkkoulk and Cast(suvuosiylkk+'0101' as date) between alkaa and paattyy)
      ,aikylkkkoulk_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylkkkoulk and Cast(suvuosiylkk+'0101' as date) between alkaa and paattyy)
      ,aikylkkkoulk_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylkkkoulk and Cast(suvuosiylkk+'0101' as date) between alkaa and paattyy)
      ,aikylkkkoulk_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylkkkoulk and Cast(suvuosiylkk+'0101' as date) between alkaa and paattyy)
      ,aikylkkkoulk_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aikylkkkoulk and Cast(suvuosiylkk+'0101' as date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       aiklistrikoulk_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aiklistrikoulk and Cast(suvuosilistri+'0101' as date) between alkaa and paattyy)
      ,aiklistrikoulk_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aiklistrikoulk and Cast(suvuosilistri+'0101' as date) between alkaa and paattyy)
      ,aiklistrikoulk_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aiklistrikoulk and Cast(suvuosilistri+'0101' as date) between alkaa and paattyy)
      ,aiklistrikoulk_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aiklistrikoulk and Cast(suvuosilistri+'0101' as date) between alkaa and paattyy)
      ,aiklistrikoulk_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = aiklistrikoulk and Cast(suvuosilistri+'0101' as date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       yotutkopisxkoulk_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yotutkopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yotutkopisxkoulk_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yotutkopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yotutkopisxkoulk_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yotutkopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yotutkopisxkoulk_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yotutkopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yotutkopisxkoulk_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yotutkopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       ammopisxkoulk_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = ammopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,ammopisxkoulk_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = ammopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,ammopisxkoulk_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = ammopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,ammopisxkoulk_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = ammopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,ammopisxkoulk_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = ammopisxkoulk and Dateadd(y,-1,tilv_date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       amkopisxkoulk1_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk1_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk1_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk1_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk1_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       amkopisxkoulk2_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk2_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk2_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk2_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk2_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       amkopisxkoulk3_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk3_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk3_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk3_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,amkopisxkoulk3_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = amkopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       yoopisxkoulk1_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk1_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk1_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk1_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk1_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk1 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       yoopisxkoulk2_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk2_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk2_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk2_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk2_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk2 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)

UPDATE VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
SET 
       yoopisxkoulk3_opmast = (Select top 1 koulutusaste2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk3_opm95opa = (Select top 1 opintoala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk3_opmopa = (Select top 1 opintoala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk3_opm95ala = (Select top 1 koulutusala1995_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)
      ,yoopisxkoulk3_opmala = (Select top 1 koulutusala2002_koodi from VipunenTK_DW.dbo.d_koulutusluokitus where koulutusluokitus_avain = yoopisxkoulk3 and Dateadd(y,-1,tilv_date) between alkaa and paattyy)




GO


