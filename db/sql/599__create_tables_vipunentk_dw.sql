USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[_aloittaneiden_lapaisy_avaimet]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_aloittaneiden_lapaisy_avaimet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_aloittaneiden_lapaisy_avaimet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tyyppi] [varchar](100) NULL,
	[tilv] [varchar](100) NULL,
	[lahde] [varchar](100) NULL,
	[suorv] [varchar](100) NULL,
	[suorlk] [varchar](100) NULL,
	[tutkmaak] [varchar](100) NULL,
	[tutkjarj] [varchar](100) NULL,
	[tutkkoulk] [varchar](100) NULL,
	[opiskkoulk] [varchar](100) NULL,
	[opiskjarj] [varchar](100) NULL,
	[kmaak] [varchar](100) NULL,
	[opiskkoulk_2] [varchar](100) NULL,
	[opiskjarj_2] [varchar](100) NULL,
	[kmaak_2] [varchar](100) NULL,
	[olotamm_2] [varchar](100) NULL,
	[olosyys_2] [varchar](100) NULL,
	[ptoim1r5] [varchar](100) NULL,
	[amas] [varchar](100) NULL,
	[opp] [varchar](100) NULL,
	[opmala] [varchar](100) NULL,
	[opmopa] [varchar](100) NULL,
	[opmast] [varchar](100) NULL,
	[opm95opa] [varchar](100) NULL,
	[koulutussektori] [varchar](100) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_aloittaneiden_lapaisy_lasketut_sarakkeet]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_aloittaneiden_lapaisy_lasketut_sarakkeet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_aloittaneiden_lapaisy_lasketut_sarakkeet](
	[rivinumero] [int] NOT NULL,
	[saavutettu_suorv] [varchar](255) NULL,
	[saavutettu_suorlk] [varchar](255) NULL,
	[saavutettu_tutkmaak] [varchar](255) NULL,
	[saavutettu_tutkjarj] [varchar](255) NULL,
	[saavutettu_tutkopp] [varchar](255) NULL,
	[saavutettu_tutkkoulk] [varchar](255) NULL,
	[saavutettu_tutkopmala] [varchar](255) NULL,
	[saavutettu_tutkopmopa] [varchar](255) NULL,
	[saavutettu_tutkopmast] [varchar](255) NULL,
	[saavutettu_tutkopm95opa] [varchar](255) NULL,
	[saavutettu_tutkkoulutussektori] [varchar](255) NULL,
	[1a_tutkinto_alkuperaisessa_tutkintolajissa] [int] NULL,
	[1a_tutkinto_kandi_tutkintolajissa] [int] NULL,
	[1a_tutkinto_muussa_tutkintolajissa] [int] NULL,
	[1a_opiskelee_alkuperaisessa_tutkintolajissa] [int] NULL,
	[1a_opiskelee_muussa_tutkintolajissa] [int] NULL,
	[1a_keskeyttanyt_tyollinen] [int] NULL,
	[1a_keskeyttanyt_ei_tyollinen] [int] NULL,
	[1b_tutkinto_alkuperaisessa_tutkintolajissa] [int] NULL,
	[1b_opiskelee_alkuperaisessa_tutkintolajissa] [int] NULL,
	[1b_tutkinto_kandi_tutkintolajissa] [int] NULL,
	[1b_tutkinto_muussa_tutkintolajissa] [int] NULL,
	[1b_opiskelee_muussa_tutkintolajissa] [int] NULL,
	[1b_keskeyttanyt_tyollinen] [int] NULL,
	[1b_keskeyttanyt_ei_tyollinen] [int] NULL,
	[1c_tutkinto_lukiokoulutuksesta] [int] NULL,
	[1c_ammatillinen_perustutkinto] [int] NULL,
	[1c_ammatillinen_lisakoulutus_ammattitutkinto_tai_erikoisammattitutkinto] [int] NULL,
	[1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_korkeakoulututkinto] [int] NULL,
	[1c_ammattikorkeakoulututkinto] [int] NULL,
	[1c_alempi_korkeakoulututkinto] [int] NULL,
	[1c_ylempi_ammattikorkeakoulututkinto] [int] NULL,
	[1c_ylempi_korkeakoulututkinto] [int] NULL,
	[1c_tutkijakoulutusasteen_tutkinto] [int] NULL,
	[1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_toinen_aste] [int] NULL,
	[1c_ei_tutkintoa] [int] NULL,
	[1d_opiskelee_lukiokoulutuksessa] [int] NULL,
	[1d_opiskelee_ammatillista_perustutkintoa] [int] NULL,
	[1d_opiskelee_ammatillisessa_lisakoulutuksessa] [int] NULL,
	[1d_opiskelee_muussa_koulutuksessa_korkeakoulututkinto] [int] NULL,
	[1d_opiskelee_ammattikorkeakoulututkintoa] [int] NULL,
	[1d_opiskelee_alempaa_korkeakoulututkintoa] [int] NULL,
	[1d_opiskelee_ylempaa_ammattikorkeakoulututkintoa] [int] NULL,
	[1d_opiskelee_ylempaa_korkeakoulututkintoa] [int] NULL,
	[1d_opiskelee_tieteellista_jatkotutkintoa] [int] NULL,
	[1d_opiskelu_muuhun_kuin_korkeakoulututkintoon_johtavassa_koulutuksessa_toisen_asteen_opiskelu_ammatillinen_poimitaan_ensisij] [int] NULL,
	[1d_ei_opiskele] [int] NULL,
	[1e_kylla] [int] NULL,
	[1e_ei] [int] NULL,
	[1f_kylla] [int] NULL,
	[1f_ei] [int] NULL,
	[1g_kylla] [int] NULL,
	[1g_ei] [int] NULL,
	[1h_kylla] [int] NULL,
	[1h_ei] [int] NULL,
	[2a_tutkinto_alkuperaisella_koulutusalalla_2002] [int] NULL,
	[2a_tutkinto_muulla_koulutusalalla_2002] [int] NULL,
	[2a_opiskelee_alkuperaisella_koulutusalalla_2002] [int] NULL,
	[2a_opiskelee_muulla_koulutusalalla_2002] [int] NULL,
	[2a_keskeyttanyt_tyollinen] [int] NULL,
	[2a_keskeyttanyt_ei_tyollinen] [int] NULL,
	[2b_tutkinto_alkuperaisella_koulutusalalla_2002] [int] NULL,
	[2b_opiskelee_alkuperaisella_koulutusalalla_2002] [int] NULL,
	[2b_tutkinto_muulla_koulutusalalla_2002] [int] NULL,
	[2b_opiskelee_muulla_koulutusalalla_2002] [int] NULL,
	[2b_keskeyttanyt_tyollinen] [int] NULL,
	[2b_keskeyttanyt_ei_tyollinen] [int] NULL,
	[2e_kylla] [int] NULL,
	[2e_ei] [int] NULL,
	[2f_kylla] [int] NULL,
	[2f_ei] [int] NULL,
	[2g_kylla] [int] NULL,
	[2g_ei] [int] NULL,
	[2h_kylla] [int] NULL,
	[2h_ei] [int] NULL,
	[3a_tutkinto_alkuperaisella_opintoalalla_2002] [int] NULL,
	[3a_tutkinto_muulla_opintoalalla_2002] [int] NULL,
	[3a_opiskelee_alkuperaisella_opintoalalla_2002] [int] NULL,
	[3a_opiskelee_muulla_opintoalalla_2002] [int] NULL,
	[3a_keskeyttanyt_tyollinen] [int] NULL,
	[3a_keskeyttanyt_ei_tyollinen] [int] NULL,
	[3b_tutkinto_alkuperaisella_opintoalalla_2002] [int] NULL,
	[3b_opiskelee_alkuperaisella_opintoalalla_2002] [int] NULL,
	[3b_tutkinto_muulla_opintoalalla_2002] [int] NULL,
	[3b_opiskelee_muulla_opintoalalla_2002] [int] NULL,
	[3b_keskeyttanyt_tyollinen] [int] NULL,
	[3b_keskeyttanyt_ei_tyollinen] [int] NULL,
	[3e_kylla] [int] NULL,
	[3e_ei] [int] NULL,
	[3f_kylla] [int] NULL,
	[3f_ei] [int] NULL,
	[3g_kylla] [int] NULL,
	[3g_ei] [int] NULL,
	[3h_kylla] [int] NULL,
	[3h_ei] [int] NULL,
	[4a_tutkinto_alkuperaisella_jarjestajalla] [int] NULL,
	[4a_tutkinto_muulla_jarjestajalla] [int] NULL,
	[4a_opiskelee_alkuperaisella_jarjestajalla] [int] NULL,
	[4a_opiskelee_muulla_jarjestajalla] [int] NULL,
	[4a_keskeyttanyt_tyollinen] [int] NULL,
	[4a_keskeyttanyt_ei_tyollinen] [int] NULL,
	[4b_tutkinto_alkuperaisella_jarjestajalla] [int] NULL,
	[4b_opiskelee_alkuperaisella_jarjestajalla] [int] NULL,
	[4b_tutkinto_muulla_jarjestajalla] [int] NULL,
	[4b_opiskelee_muulla_jarjestajalla] [int] NULL,
	[4b_keskeyttanyt_tyollinen] [int] NULL,
	[4b_keskeyttanyt_ei_tyollinen] [int] NULL,
	[4e_kylla] [int] NULL,
	[4e_ei] [int] NULL,
	[4f_kylla] [int] NULL,
	[4f_ei] [int] NULL,
	[4g_kylla] [int] NULL,
	[4g_ei] [int] NULL,
	[4h_kylla] [int] NULL,
	[4h_ei] [int] NULL,
	[5a_tutkinto_alkuperaisessa_oppilaitoksessa] [int] NULL,
	[5a_tutkinto_muussa_oppilaitoksessa] [int] NULL,
	[5a_opiskelee_alkuperaisessa_oppilaitoksessa] [int] NULL,
	[5a_opiskelee_muussa_oppilaitoksessa] [int] NULL,
	[5a_keskeyttanyt_tyollinen] [int] NULL,
	[5a_keskeyttanyt_ei_tyollinen] [int] NULL,
	[5b_tutkinto_alkuperaisessa_oppilaitoksessa] [int] NULL,
	[5b_opiskelee_alkuperaisessa_oppilaitoksessa] [int] NULL,
	[5b_tutkinto_muussa_oppilaitoksessa] [int] NULL,
	[5b_opiskelee_muussa_oppilaitoksessa] [int] NULL,
	[5b_keskeyttanyt_tyollinen] [int] NULL,
	[5b_keskeyttanyt_ei_tyollinen] [int] NULL,
	[5e_kylla] [int] NULL,
	[5e_ei] [int] NULL,
	[5f_kylla] [int] NULL,
	[5f_ei] [int] NULL,
	[5g_kylla] [int] NULL,
	[5g_ei] [int] NULL,
	[5h_kylla] [int] NULL,
	[5h_ei] [int] NULL,
	[6a_tutkinto_alkuperaisessa_maakunnassa] [int] NULL,
	[6a_tutkinto_muussa_maakunnassa] [int] NULL,
	[6a_opiskelee_alkuperaisessa_maakunnassa] [int] NULL,
	[6a_opiskelee_muussa_maakunnassa] [int] NULL,
	[6a_keskeyttanyt_tyollinen] [int] NULL,
	[6a_keskeyttanyt_ei_tyollinen] [int] NULL,
	[6b_tutkinto_alkuperaisessa_maakunnassa] [int] NULL,
	[6b_opiskelee_alkuperaisessa_maakunnassa] [int] NULL,
	[6b_tutkinto_muussa_maakunnassa] [int] NULL,
	[6b_opiskelee_muussa_maakunnassa] [int] NULL,
	[6b_keskeyttanyt_tyollinen] [int] NULL,
	[6b_keskeyttanyt_ei_tyollinen] [int] NULL,
	[6e_kylla] [int] NULL,
	[6e_ei] [int] NULL,
	[6f_kylla] [int] NULL,
	[6f_ei] [int] NULL,
	[6g_kylla] [int] NULL,
	[6g_ei] [int] NULL,
	[6h_kylla] [int] NULL,
	[6h_ei] [int] NULL,
	[7a_tutkinto_alkuperaisella_koulutussektorilla] [int] NULL,
	[7a_tutkinto_muulla_koulutussektorilla] [int] NULL,
	[7a_opiskelee_alkuperaisella_koulutussektorilla] [int] NULL,
	[7a_opiskelee_muulla_koulutussektorilla] [int] NULL,
	[7a_keskeyttanyt_tyollinen] [int] NULL,
	[7a_keskeyttanyt_ei_tyollinen] [int] NULL,
	[7b_tutkinto_alkuperaisella_koulutussektorilla] [int] NULL,
	[7b_opiskelee_alkuperaisella_koulutussektorilla] [int] NULL,
	[7b_tutkinto_muulla_koulutussektorilla] [int] NULL,
	[7b_opiskelee_muulla_koulutussektorilla] [int] NULL,
	[7b_keskeyttanyt_tyollinen] [int] NULL,
	[7b_keskeyttanyt_ei_tyollinen] [int] NULL,
	[7e_kylla] [int] NULL,
	[7e_ei] [int] NULL,
	[7f_kylla] [int] NULL,
	[7f_ei] [int] NULL,
	[7g_kylla] [int] NULL,
	[7g_ei] [int] NULL,
	[7h_kylla] [int] NULL,
	[7h_ei] [int] NULL,
	[8a_tutkinto_alkuperaisella_opintoalalla_1995] [int] NULL,
	[8a_tutkinto_muulla_opintoalalla_1995] [int] NULL,
	[8a_opiskelee_alkuperaisella_opintoalalla_1995] [int] NULL,
	[8a_opiskelee_muulla_opintoalalla_1995] [int] NULL,
	[8a_keskeyttanyt_tyollinen] [int] NULL,
	[8a_keskeyttanyt_ei_tyollinen] [int] NULL,
	[8b_tutkinto_alkuperaisella_opintoalalla_1995] [int] NULL,
	[8b_opiskelee_alkuperaisella_opintoalalla_1995] [int] NULL,
	[8b_tutkinto_muulla_opintoalalla_1995] [int] NULL,
	[8b_opiskelee_muulla_opintoalalla_1995] [int] NULL,
	[8b_keskeyttanyt_tyollinen] [int] NULL,
	[8b_keskeyttanyt_ei_tyollinen] [int] NULL,
	[8e_kylla] [int] NULL,
	[8e_ei] [int] NULL,
	[8f_kylla] [int] NULL,
	[8f_ei] [int] NULL,
	[8g_kylla] [int] NULL,
	[8g_ei] [int] NULL,
	[8h_kylla] [int] NULL,
	[8h_ei] [int] NULL,
	[lkm] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_aloittaneiden_lapaisy_sarakeryhmat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_aloittaneiden_lapaisy_sarakeryhmat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_aloittaneiden_lapaisy_sarakeryhmat](
	[tilv] [varchar](255) NULL,
	[lahde] [varchar](255) NULL,
	[opp] [nvarchar](5) NULL,
	[sp] [varchar](255) NULL,
	[syntv] [varchar](255) NULL,
	[aikielir1] [varchar](255) NULL,
	[alvv] [varchar](255) NULL,
	[allk] [varchar](255) NULL,
	[klaji] [varchar](255) NULL,
	[ophal] [varchar](255) NULL,
	[jarj] [varchar](255) NULL,
	[kkun] [varchar](255) NULL,
	[maak] [varchar](2) NOT NULL,
	[koulk] [varchar](255) NULL,
	[opmala] [nvarchar](2) NOT NULL,
	[opmopa] [nvarchar](3) NOT NULL,
	[opmast] [nvarchar](2) NOT NULL,
	[opm95opa] [nvarchar](3) NOT NULL,
	[koulutussektori] [varchar](26) NULL,
	[pohjkoulk] [varchar](255) NULL,
	[alvv_kk] [varchar](255) NULL,
	[allk_kk] [varchar](255) NULL,
	[ololk] [varchar](255) NULL,
	[rahlahde] [varchar](255) NULL,
	[koulutuslaji2] [varchar](255) NULL,
	[tutkintolaji] [varchar](5) NOT NULL,
	[tietolahde] [varchar](255) NULL,
	[aineistorivinumero] [numeric](18, 0) NULL,
	[lkm_int] [int] NULL,
	[Sarakeryhma1_ID] [nvarchar](128) NULL,
	[Sarakeryhma1_tyyppi] [varchar](100) NULL,
	[Sarakeryhma1_opp] [varchar](100) NULL,
	[Sarakeryhma1_opmala] [varchar](100) NULL,
	[Sarakeryhma1_opmopa] [varchar](100) NULL,
	[Sarakeryhma1_opmast] [varchar](100) NULL,
	[Sarakeryhma1_opm95opa] [varchar](100) NULL,
	[Sarakeryhma1_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma1_suorv] [varchar](100) NULL,
	[Sarakeryhma1_suorlk] [varchar](100) NULL,
	[Sarakeryhma1_kmaak] [varchar](100) NULL,
	[Sarakeryhma1_olotamm] [varchar](100) NULL,
	[Sarakeryhma1_olosyys] [varchar](100) NULL,
	[Sarakeryhma1_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma1_amas] [varchar](100) NULL,
	[Sarakeryhma1_koulk] [varchar](100) NULL,
	[Sarakeryhma1_jarj] [varchar](100) NULL,
	[Sarakeryhma1_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma2_ID] [nvarchar](128) NULL,
	[Sarakeryhma2_tyyppi] [varchar](100) NULL,
	[Sarakeryhma2_opp] [varchar](100) NULL,
	[Sarakeryhma2_opmala] [varchar](100) NULL,
	[Sarakeryhma2_opmopa] [varchar](100) NULL,
	[Sarakeryhma2_opmast] [varchar](100) NULL,
	[Sarakeryhma2_opm95opa] [varchar](100) NULL,
	[Sarakeryhma2_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma2_suorv] [varchar](100) NULL,
	[Sarakeryhma2_suorlk] [varchar](100) NULL,
	[Sarakeryhma2_kmaak] [varchar](100) NULL,
	[Sarakeryhma2_olotamm] [varchar](100) NULL,
	[Sarakeryhma2_olosyys] [varchar](100) NULL,
	[Sarakeryhma2_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma2_amas] [varchar](100) NULL,
	[Sarakeryhma2_koulk] [varchar](100) NULL,
	[Sarakeryhma2_jarj] [varchar](100) NULL,
	[Sarakeryhma2_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma3_ID] [nvarchar](128) NULL,
	[Sarakeryhma3_tyyppi] [varchar](100) NULL,
	[Sarakeryhma3_opp] [varchar](100) NULL,
	[Sarakeryhma3_opmala] [varchar](100) NULL,
	[Sarakeryhma3_opmopa] [varchar](100) NULL,
	[Sarakeryhma3_opmast] [varchar](100) NULL,
	[Sarakeryhma3_opm95opa] [varchar](100) NULL,
	[Sarakeryhma3_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma3_suorv] [varchar](100) NULL,
	[Sarakeryhma3_suorlk] [varchar](100) NULL,
	[Sarakeryhma3_kmaak] [varchar](100) NULL,
	[Sarakeryhma3_olotamm] [varchar](100) NULL,
	[Sarakeryhma3_olosyys] [varchar](100) NULL,
	[Sarakeryhma3_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma3_amas] [varchar](100) NULL,
	[Sarakeryhma3_koulk] [varchar](100) NULL,
	[Sarakeryhma3_jarj] [varchar](100) NULL,
	[Sarakeryhma3_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma4_ID] [nvarchar](128) NULL,
	[Sarakeryhma4_tyyppi] [varchar](100) NULL,
	[Sarakeryhma4_opp] [varchar](100) NULL,
	[Sarakeryhma4_opmala] [varchar](100) NULL,
	[Sarakeryhma4_opmopa] [varchar](100) NULL,
	[Sarakeryhma4_opmast] [varchar](100) NULL,
	[Sarakeryhma4_opm95opa] [varchar](100) NULL,
	[Sarakeryhma4_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma4_suorv] [varchar](100) NULL,
	[Sarakeryhma4_suorlk] [varchar](100) NULL,
	[Sarakeryhma4_kmaak] [varchar](100) NULL,
	[Sarakeryhma4_olotamm] [varchar](100) NULL,
	[Sarakeryhma4_olosyys] [varchar](100) NULL,
	[Sarakeryhma4_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma4_amas] [varchar](100) NULL,
	[Sarakeryhma4_koulk] [varchar](100) NULL,
	[Sarakeryhma4_jarj] [varchar](100) NULL,
	[Sarakeryhma4_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma5_ID] [nvarchar](128) NULL,
	[Sarakeryhma5_tyyppi] [varchar](100) NULL,
	[Sarakeryhma5_opp] [varchar](100) NULL,
	[Sarakeryhma5_opmala] [varchar](100) NULL,
	[Sarakeryhma5_opmopa] [varchar](100) NULL,
	[Sarakeryhma5_opmast] [varchar](100) NULL,
	[Sarakeryhma5_opm95opa] [varchar](100) NULL,
	[Sarakeryhma5_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma5_suorv] [varchar](100) NULL,
	[Sarakeryhma5_suorlk] [varchar](100) NULL,
	[Sarakeryhma5_kmaak] [varchar](100) NULL,
	[Sarakeryhma5_olotamm] [varchar](100) NULL,
	[Sarakeryhma5_olosyys] [varchar](100) NULL,
	[Sarakeryhma5_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma5_amas] [varchar](100) NULL,
	[Sarakeryhma5_koulk] [varchar](100) NULL,
	[Sarakeryhma5_jarj] [varchar](100) NULL,
	[Sarakeryhma5_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma6_ID] [nvarchar](128) NULL,
	[Sarakeryhma6_tyyppi] [varchar](100) NULL,
	[Sarakeryhma6_opp] [varchar](100) NULL,
	[Sarakeryhma6_opmala] [varchar](100) NULL,
	[Sarakeryhma6_opmopa] [varchar](100) NULL,
	[Sarakeryhma6_opmast] [varchar](100) NULL,
	[Sarakeryhma6_opm95opa] [varchar](100) NULL,
	[Sarakeryhma6_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma6_suorv] [varchar](100) NULL,
	[Sarakeryhma6_suorlk] [varchar](100) NULL,
	[Sarakeryhma6_kmaak] [varchar](100) NULL,
	[Sarakeryhma6_olotamm] [varchar](100) NULL,
	[Sarakeryhma6_olosyys] [varchar](100) NULL,
	[Sarakeryhma6_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma6_amas] [varchar](100) NULL,
	[Sarakeryhma6_koulk] [varchar](100) NULL,
	[Sarakeryhma6_jarj] [varchar](100) NULL,
	[Sarakeryhma6_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma7_ID] [nvarchar](128) NULL,
	[Sarakeryhma7_tyyppi] [varchar](100) NULL,
	[Sarakeryhma7_opp] [varchar](100) NULL,
	[Sarakeryhma7_opmala] [varchar](100) NULL,
	[Sarakeryhma7_opmopa] [varchar](100) NULL,
	[Sarakeryhma7_opmast] [varchar](100) NULL,
	[Sarakeryhma7_opm95opa] [varchar](100) NULL,
	[Sarakeryhma7_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma7_suorv] [varchar](100) NULL,
	[Sarakeryhma7_suorlk] [varchar](100) NULL,
	[Sarakeryhma7_kmaak] [varchar](100) NULL,
	[Sarakeryhma7_olotamm] [varchar](100) NULL,
	[Sarakeryhma7_olosyys] [varchar](100) NULL,
	[Sarakeryhma7_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma7_amas] [varchar](100) NULL,
	[Sarakeryhma7_koulk] [varchar](100) NULL,
	[Sarakeryhma7_jarj] [varchar](100) NULL,
	[Sarakeryhma7_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma8_ID] [nvarchar](128) NULL,
	[Sarakeryhma8_tyyppi] [varchar](100) NULL,
	[Sarakeryhma8_opp] [varchar](100) NULL,
	[Sarakeryhma8_opmala] [varchar](100) NULL,
	[Sarakeryhma8_opmopa] [varchar](100) NULL,
	[Sarakeryhma8_opmast] [varchar](100) NULL,
	[Sarakeryhma8_opm95opa] [varchar](100) NULL,
	[Sarakeryhma8_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma8_suorv] [varchar](100) NULL,
	[Sarakeryhma8_suorlk] [varchar](100) NULL,
	[Sarakeryhma8_kmaak] [varchar](100) NULL,
	[Sarakeryhma8_olotamm] [varchar](100) NULL,
	[Sarakeryhma8_olosyys] [varchar](100) NULL,
	[Sarakeryhma8_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma8_amas] [varchar](100) NULL,
	[Sarakeryhma8_koulk] [varchar](100) NULL,
	[Sarakeryhma8_jarj] [varchar](100) NULL,
	[Sarakeryhma8_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma9_ID] [nvarchar](128) NULL,
	[Sarakeryhma9_tyyppi] [varchar](100) NULL,
	[Sarakeryhma9_opp] [varchar](100) NULL,
	[Sarakeryhma9_opmala] [varchar](100) NULL,
	[Sarakeryhma9_opmopa] [varchar](100) NULL,
	[Sarakeryhma9_opmast] [varchar](100) NULL,
	[Sarakeryhma9_opm95opa] [varchar](100) NULL,
	[Sarakeryhma9_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma9_suorv] [varchar](100) NULL,
	[Sarakeryhma9_suorlk] [varchar](100) NULL,
	[Sarakeryhma9_kmaak] [varchar](100) NULL,
	[Sarakeryhma9_olotamm] [varchar](100) NULL,
	[Sarakeryhma9_olosyys] [varchar](100) NULL,
	[Sarakeryhma9_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma9_amas] [varchar](100) NULL,
	[Sarakeryhma9_koulk] [varchar](100) NULL,
	[Sarakeryhma9_jarj] [varchar](100) NULL,
	[Sarakeryhma9_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma10_ID] [nvarchar](128) NULL,
	[Sarakeryhma10_tyyppi] [varchar](100) NULL,
	[Sarakeryhma10_opp] [varchar](100) NULL,
	[Sarakeryhma10_opmala] [varchar](100) NULL,
	[Sarakeryhma10_opmopa] [varchar](100) NULL,
	[Sarakeryhma10_opmast] [varchar](100) NULL,
	[Sarakeryhma10_opm95opa] [varchar](100) NULL,
	[Sarakeryhma10_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma10_suorv] [varchar](100) NULL,
	[Sarakeryhma10_suorlk] [varchar](100) NULL,
	[Sarakeryhma10_kmaak] [varchar](100) NULL,
	[Sarakeryhma10_olotamm] [varchar](100) NULL,
	[Sarakeryhma10_olosyys] [varchar](100) NULL,
	[Sarakeryhma10_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma10_amas] [varchar](100) NULL,
	[Sarakeryhma10_koulk] [varchar](100) NULL,
	[Sarakeryhma10_jarj] [varchar](100) NULL,
	[Sarakeryhma10_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma11_ID] [nvarchar](128) NULL,
	[Sarakeryhma11_tyyppi] [varchar](100) NULL,
	[Sarakeryhma11_opp] [varchar](100) NULL,
	[Sarakeryhma11_opmala] [varchar](100) NULL,
	[Sarakeryhma11_opmopa] [varchar](100) NULL,
	[Sarakeryhma11_opmast] [varchar](100) NULL,
	[Sarakeryhma11_opm95opa] [varchar](100) NULL,
	[Sarakeryhma11_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma11_suorv] [varchar](100) NULL,
	[Sarakeryhma11_suorlk] [varchar](100) NULL,
	[Sarakeryhma11_kmaak] [varchar](100) NULL,
	[Sarakeryhma11_olotamm] [varchar](100) NULL,
	[Sarakeryhma11_olosyys] [varchar](100) NULL,
	[Sarakeryhma11_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma11_amas] [varchar](100) NULL,
	[Sarakeryhma11_koulk] [varchar](100) NULL,
	[Sarakeryhma11_jarj] [varchar](100) NULL,
	[Sarakeryhma11_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma12_ID] [nvarchar](128) NULL,
	[Sarakeryhma12_tyyppi] [varchar](100) NULL,
	[Sarakeryhma12_opp] [varchar](100) NULL,
	[Sarakeryhma12_opmala] [varchar](100) NULL,
	[Sarakeryhma12_opmopa] [varchar](100) NULL,
	[Sarakeryhma12_opmast] [varchar](100) NULL,
	[Sarakeryhma12_opm95opa] [varchar](100) NULL,
	[Sarakeryhma12_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma12_suorv] [varchar](100) NULL,
	[Sarakeryhma12_suorlk] [varchar](100) NULL,
	[Sarakeryhma12_kmaak] [varchar](100) NULL,
	[Sarakeryhma12_olotamm] [varchar](100) NULL,
	[Sarakeryhma12_olosyys] [varchar](100) NULL,
	[Sarakeryhma12_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma12_amas] [varchar](100) NULL,
	[Sarakeryhma12_koulk] [varchar](100) NULL,
	[Sarakeryhma12_jarj] [varchar](100) NULL,
	[Sarakeryhma12_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma13_ID] [nvarchar](128) NULL,
	[Sarakeryhma13_tyyppi] [varchar](100) NULL,
	[Sarakeryhma13_opp] [varchar](100) NULL,
	[Sarakeryhma13_opmala] [varchar](100) NULL,
	[Sarakeryhma13_opmopa] [varchar](100) NULL,
	[Sarakeryhma13_opmast] [varchar](100) NULL,
	[Sarakeryhma13_opm95opa] [varchar](100) NULL,
	[Sarakeryhma13_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma13_suorv] [varchar](100) NULL,
	[Sarakeryhma13_suorlk] [varchar](100) NULL,
	[Sarakeryhma13_kmaak] [varchar](100) NULL,
	[Sarakeryhma13_olotamm] [varchar](100) NULL,
	[Sarakeryhma13_olosyys] [varchar](100) NULL,
	[Sarakeryhma13_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma13_amas] [varchar](100) NULL,
	[Sarakeryhma13_koulk] [varchar](100) NULL,
	[Sarakeryhma13_jarj] [varchar](100) NULL,
	[Sarakeryhma13_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma14_ID] [nvarchar](128) NULL,
	[Sarakeryhma14_tyyppi] [varchar](100) NULL,
	[Sarakeryhma14_opp] [varchar](100) NULL,
	[Sarakeryhma14_opmala] [varchar](100) NULL,
	[Sarakeryhma14_opmopa] [varchar](100) NULL,
	[Sarakeryhma14_opmast] [varchar](100) NULL,
	[Sarakeryhma14_opm95opa] [varchar](100) NULL,
	[Sarakeryhma14_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma14_suorv] [varchar](100) NULL,
	[Sarakeryhma14_suorlk] [varchar](100) NULL,
	[Sarakeryhma14_kmaak] [varchar](100) NULL,
	[Sarakeryhma14_olotamm] [varchar](100) NULL,
	[Sarakeryhma14_olosyys] [varchar](100) NULL,
	[Sarakeryhma14_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma14_amas] [varchar](100) NULL,
	[Sarakeryhma14_koulk] [varchar](100) NULL,
	[Sarakeryhma14_jarj] [varchar](100) NULL,
	[Sarakeryhma14_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma15_ID] [nvarchar](128) NULL,
	[Sarakeryhma15_tyyppi] [varchar](100) NULL,
	[Sarakeryhma15_opp] [varchar](100) NULL,
	[Sarakeryhma15_opmala] [varchar](100) NULL,
	[Sarakeryhma15_opmopa] [varchar](100) NULL,
	[Sarakeryhma15_opmast] [varchar](100) NULL,
	[Sarakeryhma15_opm95opa] [varchar](100) NULL,
	[Sarakeryhma15_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma15_suorv] [varchar](100) NULL,
	[Sarakeryhma15_suorlk] [varchar](100) NULL,
	[Sarakeryhma15_kmaak] [varchar](100) NULL,
	[Sarakeryhma15_olotamm] [varchar](100) NULL,
	[Sarakeryhma15_olosyys] [varchar](100) NULL,
	[Sarakeryhma15_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma15_amas] [varchar](100) NULL,
	[Sarakeryhma15_koulk] [varchar](100) NULL,
	[Sarakeryhma15_jarj] [varchar](100) NULL,
	[Sarakeryhma15_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma16_ID] [nvarchar](128) NULL,
	[Sarakeryhma16_tyyppi] [varchar](100) NULL,
	[Sarakeryhma16_opp] [varchar](100) NULL,
	[Sarakeryhma16_opmala] [varchar](100) NULL,
	[Sarakeryhma16_opmopa] [varchar](100) NULL,
	[Sarakeryhma16_opmast] [varchar](100) NULL,
	[Sarakeryhma16_opm95opa] [varchar](100) NULL,
	[Sarakeryhma16_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma16_suorv] [varchar](100) NULL,
	[Sarakeryhma16_suorlk] [varchar](100) NULL,
	[Sarakeryhma16_kmaak] [varchar](100) NULL,
	[Sarakeryhma16_olotamm] [varchar](100) NULL,
	[Sarakeryhma16_olosyys] [varchar](100) NULL,
	[Sarakeryhma16_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma16_amas] [varchar](100) NULL,
	[Sarakeryhma16_koulk] [varchar](100) NULL,
	[Sarakeryhma16_jarj] [varchar](100) NULL,
	[Sarakeryhma16_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma17_ID] [nvarchar](128) NULL,
	[Sarakeryhma17_tyyppi] [varchar](100) NULL,
	[Sarakeryhma17_opp] [varchar](100) NULL,
	[Sarakeryhma17_opmala] [varchar](100) NULL,
	[Sarakeryhma17_opmopa] [varchar](100) NULL,
	[Sarakeryhma17_opmast] [varchar](100) NULL,
	[Sarakeryhma17_opm95opa] [varchar](100) NULL,
	[Sarakeryhma17_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma17_suorv] [varchar](100) NULL,
	[Sarakeryhma17_suorlk] [varchar](100) NULL,
	[Sarakeryhma17_kmaak] [varchar](100) NULL,
	[Sarakeryhma17_olotamm] [varchar](100) NULL,
	[Sarakeryhma17_olosyys] [varchar](100) NULL,
	[Sarakeryhma17_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma17_amas] [varchar](100) NULL,
	[Sarakeryhma17_koulk] [varchar](100) NULL,
	[Sarakeryhma17_jarj] [varchar](100) NULL,
	[Sarakeryhma17_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma18_ID] [nvarchar](128) NULL,
	[Sarakeryhma18_tyyppi] [varchar](100) NULL,
	[Sarakeryhma18_opp] [varchar](100) NULL,
	[Sarakeryhma18_opmala] [varchar](100) NULL,
	[Sarakeryhma18_opmopa] [varchar](100) NULL,
	[Sarakeryhma18_opmast] [varchar](100) NULL,
	[Sarakeryhma18_opm95opa] [varchar](100) NULL,
	[Sarakeryhma18_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma18_suorv] [varchar](100) NULL,
	[Sarakeryhma18_suorlk] [varchar](100) NULL,
	[Sarakeryhma18_kmaak] [varchar](100) NULL,
	[Sarakeryhma18_olotamm] [varchar](100) NULL,
	[Sarakeryhma18_olosyys] [varchar](100) NULL,
	[Sarakeryhma18_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma18_amas] [varchar](100) NULL,
	[Sarakeryhma18_koulk] [varchar](100) NULL,
	[Sarakeryhma18_jarj] [varchar](100) NULL,
	[Sarakeryhma18_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma19_ID] [nvarchar](128) NULL,
	[Sarakeryhma19_tyyppi] [varchar](100) NULL,
	[Sarakeryhma19_opp] [varchar](100) NULL,
	[Sarakeryhma19_opmala] [varchar](100) NULL,
	[Sarakeryhma19_opmopa] [varchar](100) NULL,
	[Sarakeryhma19_opmast] [varchar](100) NULL,
	[Sarakeryhma19_opm95opa] [varchar](100) NULL,
	[Sarakeryhma19_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma19_suorv] [varchar](100) NULL,
	[Sarakeryhma19_suorlk] [varchar](100) NULL,
	[Sarakeryhma19_kmaak] [varchar](100) NULL,
	[Sarakeryhma19_olotamm] [varchar](100) NULL,
	[Sarakeryhma19_olosyys] [varchar](100) NULL,
	[Sarakeryhma19_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma19_amas] [varchar](100) NULL,
	[Sarakeryhma19_koulk] [varchar](100) NULL,
	[Sarakeryhma19_jarj] [varchar](100) NULL,
	[Sarakeryhma19_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma20_ID] [nvarchar](128) NULL,
	[Sarakeryhma20_tyyppi] [varchar](100) NULL,
	[Sarakeryhma20_opp] [varchar](100) NULL,
	[Sarakeryhma20_opmala] [varchar](100) NULL,
	[Sarakeryhma20_opmopa] [varchar](100) NULL,
	[Sarakeryhma20_opmast] [varchar](100) NULL,
	[Sarakeryhma20_opm95opa] [varchar](100) NULL,
	[Sarakeryhma20_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma20_suorv] [varchar](100) NULL,
	[Sarakeryhma20_suorlk] [varchar](100) NULL,
	[Sarakeryhma20_kmaak] [varchar](100) NULL,
	[Sarakeryhma20_olotamm] [varchar](100) NULL,
	[Sarakeryhma20_olosyys] [varchar](100) NULL,
	[Sarakeryhma20_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma20_amas] [varchar](100) NULL,
	[Sarakeryhma20_koulk] [varchar](100) NULL,
	[Sarakeryhma20_jarj] [varchar](100) NULL,
	[Sarakeryhma20_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma21_ID] [nvarchar](128) NULL,
	[Sarakeryhma21_tyyppi] [varchar](100) NULL,
	[Sarakeryhma21_opp] [varchar](100) NULL,
	[Sarakeryhma21_opmala] [varchar](100) NULL,
	[Sarakeryhma21_opmopa] [varchar](100) NULL,
	[Sarakeryhma21_opmast] [varchar](100) NULL,
	[Sarakeryhma21_opm95opa] [varchar](100) NULL,
	[Sarakeryhma21_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma21_suorv] [varchar](100) NULL,
	[Sarakeryhma21_suorlk] [varchar](100) NULL,
	[Sarakeryhma21_kmaak] [varchar](100) NULL,
	[Sarakeryhma21_olotamm] [varchar](100) NULL,
	[Sarakeryhma21_olosyys] [varchar](100) NULL,
	[Sarakeryhma21_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma21_amas] [varchar](100) NULL,
	[Sarakeryhma21_koulk] [varchar](100) NULL,
	[Sarakeryhma21_jarj] [varchar](100) NULL,
	[Sarakeryhma21_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma22_ID] [nvarchar](128) NULL,
	[Sarakeryhma22_tyyppi] [varchar](100) NULL,
	[Sarakeryhma22_opp] [varchar](100) NULL,
	[Sarakeryhma22_opmala] [varchar](100) NULL,
	[Sarakeryhma22_opmopa] [varchar](100) NULL,
	[Sarakeryhma22_opmast] [varchar](100) NULL,
	[Sarakeryhma22_opm95opa] [varchar](100) NULL,
	[Sarakeryhma22_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma22_suorv] [varchar](100) NULL,
	[Sarakeryhma22_suorlk] [varchar](100) NULL,
	[Sarakeryhma22_kmaak] [varchar](100) NULL,
	[Sarakeryhma22_olotamm] [varchar](100) NULL,
	[Sarakeryhma22_olosyys] [varchar](100) NULL,
	[Sarakeryhma22_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma22_amas] [varchar](100) NULL,
	[Sarakeryhma22_koulk] [varchar](100) NULL,
	[Sarakeryhma22_jarj] [varchar](100) NULL,
	[Sarakeryhma22_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma23_ID] [nvarchar](128) NULL,
	[Sarakeryhma23_tyyppi] [varchar](100) NULL,
	[Sarakeryhma23_opp] [varchar](100) NULL,
	[Sarakeryhma23_opmala] [varchar](100) NULL,
	[Sarakeryhma23_opmopa] [varchar](100) NULL,
	[Sarakeryhma23_opmast] [varchar](100) NULL,
	[Sarakeryhma23_opm95opa] [varchar](100) NULL,
	[Sarakeryhma23_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma23_suorv] [varchar](100) NULL,
	[Sarakeryhma23_suorlk] [varchar](100) NULL,
	[Sarakeryhma23_kmaak] [varchar](100) NULL,
	[Sarakeryhma23_olotamm] [varchar](100) NULL,
	[Sarakeryhma23_olosyys] [varchar](100) NULL,
	[Sarakeryhma23_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma23_amas] [varchar](100) NULL,
	[Sarakeryhma23_koulk] [varchar](100) NULL,
	[Sarakeryhma23_jarj] [varchar](100) NULL,
	[Sarakeryhma23_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma24_ID] [nvarchar](128) NULL,
	[Sarakeryhma24_tyyppi] [varchar](100) NULL,
	[Sarakeryhma24_opp] [varchar](100) NULL,
	[Sarakeryhma24_opmala] [varchar](100) NULL,
	[Sarakeryhma24_opmopa] [varchar](100) NULL,
	[Sarakeryhma24_opmast] [varchar](100) NULL,
	[Sarakeryhma24_opm95opa] [varchar](100) NULL,
	[Sarakeryhma24_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma24_suorv] [varchar](100) NULL,
	[Sarakeryhma24_suorlk] [varchar](100) NULL,
	[Sarakeryhma24_kmaak] [varchar](100) NULL,
	[Sarakeryhma24_olotamm] [varchar](100) NULL,
	[Sarakeryhma24_olosyys] [varchar](100) NULL,
	[Sarakeryhma24_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma24_amas] [varchar](100) NULL,
	[Sarakeryhma24_koulk] [varchar](100) NULL,
	[Sarakeryhma24_jarj] [varchar](100) NULL,
	[Sarakeryhma24_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma25_ID] [nvarchar](128) NULL,
	[Sarakeryhma25_tyyppi] [varchar](100) NULL,
	[Sarakeryhma25_opp] [varchar](100) NULL,
	[Sarakeryhma25_opmala] [varchar](100) NULL,
	[Sarakeryhma25_opmopa] [varchar](100) NULL,
	[Sarakeryhma25_opmast] [varchar](100) NULL,
	[Sarakeryhma25_opm95opa] [varchar](100) NULL,
	[Sarakeryhma25_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma25_suorv] [varchar](100) NULL,
	[Sarakeryhma25_suorlk] [varchar](100) NULL,
	[Sarakeryhma25_kmaak] [varchar](100) NULL,
	[Sarakeryhma25_olotamm] [varchar](100) NULL,
	[Sarakeryhma25_olosyys] [varchar](100) NULL,
	[Sarakeryhma25_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma25_amas] [varchar](100) NULL,
	[Sarakeryhma25_koulk] [varchar](100) NULL,
	[Sarakeryhma25_jarj] [varchar](100) NULL,
	[Sarakeryhma25_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma26_ID] [nvarchar](128) NULL,
	[Sarakeryhma26_tyyppi] [varchar](100) NULL,
	[Sarakeryhma26_opp] [varchar](100) NULL,
	[Sarakeryhma26_opmala] [varchar](100) NULL,
	[Sarakeryhma26_opmopa] [varchar](100) NULL,
	[Sarakeryhma26_opmast] [varchar](100) NULL,
	[Sarakeryhma26_opm95opa] [varchar](100) NULL,
	[Sarakeryhma26_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma26_suorv] [varchar](100) NULL,
	[Sarakeryhma26_suorlk] [varchar](100) NULL,
	[Sarakeryhma26_kmaak] [varchar](100) NULL,
	[Sarakeryhma26_olotamm] [varchar](100) NULL,
	[Sarakeryhma26_olosyys] [varchar](100) NULL,
	[Sarakeryhma26_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma26_amas] [varchar](100) NULL,
	[Sarakeryhma26_koulk] [varchar](100) NULL,
	[Sarakeryhma26_jarj] [varchar](100) NULL,
	[Sarakeryhma26_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma27_ID] [nvarchar](128) NULL,
	[Sarakeryhma27_tyyppi] [varchar](100) NULL,
	[Sarakeryhma27_opp] [varchar](100) NULL,
	[Sarakeryhma27_opmala] [varchar](100) NULL,
	[Sarakeryhma27_opmopa] [varchar](100) NULL,
	[Sarakeryhma27_opmast] [varchar](100) NULL,
	[Sarakeryhma27_opm95opa] [varchar](100) NULL,
	[Sarakeryhma27_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma27_suorv] [varchar](100) NULL,
	[Sarakeryhma27_suorlk] [varchar](100) NULL,
	[Sarakeryhma27_kmaak] [varchar](100) NULL,
	[Sarakeryhma27_olotamm] [varchar](100) NULL,
	[Sarakeryhma27_olosyys] [varchar](100) NULL,
	[Sarakeryhma27_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma27_amas] [varchar](100) NULL,
	[Sarakeryhma27_koulk] [varchar](100) NULL,
	[Sarakeryhma27_jarj] [varchar](100) NULL,
	[Sarakeryhma27_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma28_ID] [nvarchar](128) NULL,
	[Sarakeryhma28_tyyppi] [varchar](100) NULL,
	[Sarakeryhma28_opp] [varchar](100) NULL,
	[Sarakeryhma28_opmala] [varchar](100) NULL,
	[Sarakeryhma28_opmopa] [varchar](100) NULL,
	[Sarakeryhma28_opmast] [varchar](100) NULL,
	[Sarakeryhma28_opm95opa] [varchar](100) NULL,
	[Sarakeryhma28_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma28_suorv] [varchar](100) NULL,
	[Sarakeryhma28_suorlk] [varchar](100) NULL,
	[Sarakeryhma28_kmaak] [varchar](100) NULL,
	[Sarakeryhma28_olotamm] [varchar](100) NULL,
	[Sarakeryhma28_olosyys] [varchar](100) NULL,
	[Sarakeryhma28_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma28_amas] [varchar](100) NULL,
	[Sarakeryhma28_koulk] [varchar](100) NULL,
	[Sarakeryhma28_jarj] [varchar](100) NULL,
	[Sarakeryhma28_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma29_ID] [nvarchar](128) NULL,
	[Sarakeryhma29_tyyppi] [varchar](100) NULL,
	[Sarakeryhma29_opp] [varchar](100) NULL,
	[Sarakeryhma29_opmala] [varchar](100) NULL,
	[Sarakeryhma29_opmopa] [varchar](100) NULL,
	[Sarakeryhma29_opmast] [varchar](100) NULL,
	[Sarakeryhma29_opm95opa] [varchar](100) NULL,
	[Sarakeryhma29_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma29_suorv] [varchar](100) NULL,
	[Sarakeryhma29_suorlk] [varchar](100) NULL,
	[Sarakeryhma29_kmaak] [varchar](100) NULL,
	[Sarakeryhma29_olotamm] [varchar](100) NULL,
	[Sarakeryhma29_olosyys] [varchar](100) NULL,
	[Sarakeryhma29_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma29_amas] [varchar](100) NULL,
	[Sarakeryhma29_koulk] [varchar](100) NULL,
	[Sarakeryhma29_jarj] [varchar](100) NULL,
	[Sarakeryhma29_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma30_ID] [nvarchar](128) NULL,
	[Sarakeryhma30_tyyppi] [varchar](100) NULL,
	[Sarakeryhma30_opp] [varchar](100) NULL,
	[Sarakeryhma30_opmala] [varchar](100) NULL,
	[Sarakeryhma30_opmopa] [varchar](100) NULL,
	[Sarakeryhma30_opmast] [varchar](100) NULL,
	[Sarakeryhma30_opm95opa] [varchar](100) NULL,
	[Sarakeryhma30_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma30_suorv] [varchar](100) NULL,
	[Sarakeryhma30_suorlk] [varchar](100) NULL,
	[Sarakeryhma30_kmaak] [varchar](100) NULL,
	[Sarakeryhma30_olotamm] [varchar](100) NULL,
	[Sarakeryhma30_olosyys] [varchar](100) NULL,
	[Sarakeryhma30_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma30_amas] [varchar](100) NULL,
	[Sarakeryhma30_koulk] [varchar](100) NULL,
	[Sarakeryhma30_jarj] [varchar](100) NULL,
	[Sarakeryhma30_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma31_ID] [nvarchar](128) NULL,
	[Sarakeryhma31_tyyppi] [varchar](100) NULL,
	[Sarakeryhma31_opp] [varchar](100) NULL,
	[Sarakeryhma31_opmala] [varchar](100) NULL,
	[Sarakeryhma31_opmopa] [varchar](100) NULL,
	[Sarakeryhma31_opmast] [varchar](100) NULL,
	[Sarakeryhma31_opm95opa] [varchar](100) NULL,
	[Sarakeryhma31_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma31_suorv] [varchar](100) NULL,
	[Sarakeryhma31_suorlk] [varchar](100) NULL,
	[Sarakeryhma31_kmaak] [varchar](100) NULL,
	[Sarakeryhma31_olotamm] [varchar](100) NULL,
	[Sarakeryhma31_olosyys] [varchar](100) NULL,
	[Sarakeryhma31_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma31_amas] [varchar](100) NULL,
	[Sarakeryhma31_koulk] [varchar](100) NULL,
	[Sarakeryhma31_jarj] [varchar](100) NULL,
	[Sarakeryhma31_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma32_ID] [nvarchar](128) NULL,
	[Sarakeryhma32_tyyppi] [varchar](100) NULL,
	[Sarakeryhma32_opp] [varchar](100) NULL,
	[Sarakeryhma32_opmala] [varchar](100) NULL,
	[Sarakeryhma32_opmopa] [varchar](100) NULL,
	[Sarakeryhma32_opmast] [varchar](100) NULL,
	[Sarakeryhma32_opm95opa] [varchar](100) NULL,
	[Sarakeryhma32_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma32_suorv] [varchar](100) NULL,
	[Sarakeryhma32_suorlk] [varchar](100) NULL,
	[Sarakeryhma32_kmaak] [varchar](100) NULL,
	[Sarakeryhma32_olotamm] [varchar](100) NULL,
	[Sarakeryhma32_olosyys] [varchar](100) NULL,
	[Sarakeryhma32_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma32_amas] [varchar](100) NULL,
	[Sarakeryhma32_koulk] [varchar](100) NULL,
	[Sarakeryhma32_jarj] [varchar](100) NULL,
	[Sarakeryhma32_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma33_ID] [nvarchar](128) NULL,
	[Sarakeryhma33_tyyppi] [varchar](100) NULL,
	[Sarakeryhma33_opp] [varchar](100) NULL,
	[Sarakeryhma33_opmala] [varchar](100) NULL,
	[Sarakeryhma33_opmopa] [varchar](100) NULL,
	[Sarakeryhma33_opmast] [varchar](100) NULL,
	[Sarakeryhma33_opm95opa] [varchar](100) NULL,
	[Sarakeryhma33_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma33_suorv] [varchar](100) NULL,
	[Sarakeryhma33_suorlk] [varchar](100) NULL,
	[Sarakeryhma33_kmaak] [varchar](100) NULL,
	[Sarakeryhma33_olotamm] [varchar](100) NULL,
	[Sarakeryhma33_olosyys] [varchar](100) NULL,
	[Sarakeryhma33_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma33_amas] [varchar](100) NULL,
	[Sarakeryhma33_koulk] [varchar](100) NULL,
	[Sarakeryhma33_jarj] [varchar](100) NULL,
	[Sarakeryhma33_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma34_ID] [nvarchar](128) NULL,
	[Sarakeryhma34_tyyppi] [varchar](100) NULL,
	[Sarakeryhma34_opp] [varchar](100) NULL,
	[Sarakeryhma34_opmala] [varchar](100) NULL,
	[Sarakeryhma34_opmopa] [varchar](100) NULL,
	[Sarakeryhma34_opmast] [varchar](100) NULL,
	[Sarakeryhma34_opm95opa] [varchar](100) NULL,
	[Sarakeryhma34_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma34_suorv] [varchar](100) NULL,
	[Sarakeryhma34_suorlk] [varchar](100) NULL,
	[Sarakeryhma34_kmaak] [varchar](100) NULL,
	[Sarakeryhma34_olotamm] [varchar](100) NULL,
	[Sarakeryhma34_olosyys] [varchar](100) NULL,
	[Sarakeryhma34_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma34_amas] [varchar](100) NULL,
	[Sarakeryhma34_koulk] [varchar](100) NULL,
	[Sarakeryhma34_jarj] [varchar](100) NULL,
	[Sarakeryhma34_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma35_ID] [nvarchar](128) NULL,
	[Sarakeryhma35_tyyppi] [varchar](100) NULL,
	[Sarakeryhma35_opp] [varchar](100) NULL,
	[Sarakeryhma35_opmala] [varchar](100) NULL,
	[Sarakeryhma35_opmopa] [varchar](100) NULL,
	[Sarakeryhma35_opmast] [varchar](100) NULL,
	[Sarakeryhma35_opm95opa] [varchar](100) NULL,
	[Sarakeryhma35_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma35_suorv] [varchar](100) NULL,
	[Sarakeryhma35_suorlk] [varchar](100) NULL,
	[Sarakeryhma35_kmaak] [varchar](100) NULL,
	[Sarakeryhma35_olotamm] [varchar](100) NULL,
	[Sarakeryhma35_olosyys] [varchar](100) NULL,
	[Sarakeryhma35_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma35_amas] [varchar](100) NULL,
	[Sarakeryhma35_koulk] [varchar](100) NULL,
	[Sarakeryhma35_jarj] [varchar](100) NULL,
	[Sarakeryhma35_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma36_ID] [nvarchar](128) NULL,
	[Sarakeryhma36_tyyppi] [varchar](100) NULL,
	[Sarakeryhma36_opp] [varchar](100) NULL,
	[Sarakeryhma36_opmala] [varchar](100) NULL,
	[Sarakeryhma36_opmopa] [varchar](100) NULL,
	[Sarakeryhma36_opmast] [varchar](100) NULL,
	[Sarakeryhma36_opm95opa] [varchar](100) NULL,
	[Sarakeryhma36_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma36_suorv] [varchar](100) NULL,
	[Sarakeryhma36_suorlk] [varchar](100) NULL,
	[Sarakeryhma36_kmaak] [varchar](100) NULL,
	[Sarakeryhma36_olotamm] [varchar](100) NULL,
	[Sarakeryhma36_olosyys] [varchar](100) NULL,
	[Sarakeryhma36_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma36_amas] [varchar](100) NULL,
	[Sarakeryhma36_koulk] [varchar](100) NULL,
	[Sarakeryhma36_jarj] [varchar](100) NULL,
	[Sarakeryhma36_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma37_ID] [nvarchar](128) NULL,
	[Sarakeryhma37_tyyppi] [varchar](100) NULL,
	[Sarakeryhma37_opp] [varchar](100) NULL,
	[Sarakeryhma37_opmala] [varchar](100) NULL,
	[Sarakeryhma37_opmopa] [varchar](100) NULL,
	[Sarakeryhma37_opmast] [varchar](100) NULL,
	[Sarakeryhma37_opm95opa] [varchar](100) NULL,
	[Sarakeryhma37_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma37_suorv] [varchar](100) NULL,
	[Sarakeryhma37_suorlk] [varchar](100) NULL,
	[Sarakeryhma37_kmaak] [varchar](100) NULL,
	[Sarakeryhma37_olotamm] [varchar](100) NULL,
	[Sarakeryhma37_olosyys] [varchar](100) NULL,
	[Sarakeryhma37_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma37_amas] [varchar](100) NULL,
	[Sarakeryhma37_koulk] [varchar](100) NULL,
	[Sarakeryhma37_jarj] [varchar](100) NULL,
	[Sarakeryhma37_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma38_ID] [nvarchar](128) NULL,
	[Sarakeryhma38_tyyppi] [varchar](100) NULL,
	[Sarakeryhma38_opp] [varchar](100) NULL,
	[Sarakeryhma38_opmala] [varchar](100) NULL,
	[Sarakeryhma38_opmopa] [varchar](100) NULL,
	[Sarakeryhma38_opmast] [varchar](100) NULL,
	[Sarakeryhma38_opm95opa] [varchar](100) NULL,
	[Sarakeryhma38_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma38_suorv] [varchar](100) NULL,
	[Sarakeryhma38_suorlk] [varchar](100) NULL,
	[Sarakeryhma38_kmaak] [varchar](100) NULL,
	[Sarakeryhma38_olotamm] [varchar](100) NULL,
	[Sarakeryhma38_olosyys] [varchar](100) NULL,
	[Sarakeryhma38_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma38_amas] [varchar](100) NULL,
	[Sarakeryhma38_koulk] [varchar](100) NULL,
	[Sarakeryhma38_jarj] [varchar](100) NULL,
	[Sarakeryhma38_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma39_ID] [nvarchar](128) NULL,
	[Sarakeryhma39_tyyppi] [varchar](100) NULL,
	[Sarakeryhma39_opp] [varchar](100) NULL,
	[Sarakeryhma39_opmala] [varchar](100) NULL,
	[Sarakeryhma39_opmopa] [varchar](100) NULL,
	[Sarakeryhma39_opmast] [varchar](100) NULL,
	[Sarakeryhma39_opm95opa] [varchar](100) NULL,
	[Sarakeryhma39_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma39_suorv] [varchar](100) NULL,
	[Sarakeryhma39_suorlk] [varchar](100) NULL,
	[Sarakeryhma39_kmaak] [varchar](100) NULL,
	[Sarakeryhma39_olotamm] [varchar](100) NULL,
	[Sarakeryhma39_olosyys] [varchar](100) NULL,
	[Sarakeryhma39_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma39_amas] [varchar](100) NULL,
	[Sarakeryhma39_koulk] [varchar](100) NULL,
	[Sarakeryhma39_jarj] [varchar](100) NULL,
	[Sarakeryhma39_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma40_ID] [nvarchar](128) NULL,
	[Sarakeryhma40_tyyppi] [varchar](100) NULL,
	[Sarakeryhma40_opp] [varchar](100) NULL,
	[Sarakeryhma40_opmala] [varchar](100) NULL,
	[Sarakeryhma40_opmopa] [varchar](100) NULL,
	[Sarakeryhma40_opmast] [varchar](100) NULL,
	[Sarakeryhma40_opm95opa] [varchar](100) NULL,
	[Sarakeryhma40_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma40_suorv] [varchar](100) NULL,
	[Sarakeryhma40_suorlk] [varchar](100) NULL,
	[Sarakeryhma40_kmaak] [varchar](100) NULL,
	[Sarakeryhma40_olotamm] [varchar](100) NULL,
	[Sarakeryhma40_olosyys] [varchar](100) NULL,
	[Sarakeryhma40_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma40_amas] [varchar](100) NULL,
	[Sarakeryhma40_koulk] [varchar](100) NULL,
	[Sarakeryhma40_jarj] [varchar](100) NULL,
	[Sarakeryhma40_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma41_ID] [nvarchar](128) NULL,
	[Sarakeryhma41_tyyppi] [varchar](100) NULL,
	[Sarakeryhma41_opp] [varchar](100) NULL,
	[Sarakeryhma41_opmala] [varchar](100) NULL,
	[Sarakeryhma41_opmopa] [varchar](100) NULL,
	[Sarakeryhma41_opmast] [varchar](100) NULL,
	[Sarakeryhma41_opm95opa] [varchar](100) NULL,
	[Sarakeryhma41_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma41_suorv] [varchar](100) NULL,
	[Sarakeryhma41_suorlk] [varchar](100) NULL,
	[Sarakeryhma41_kmaak] [varchar](100) NULL,
	[Sarakeryhma41_olotamm] [varchar](100) NULL,
	[Sarakeryhma41_olosyys] [varchar](100) NULL,
	[Sarakeryhma41_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma41_amas] [varchar](100) NULL,
	[Sarakeryhma41_koulk] [varchar](100) NULL,
	[Sarakeryhma41_jarj] [varchar](100) NULL,
	[Sarakeryhma41_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma42_ID] [nvarchar](128) NULL,
	[Sarakeryhma42_tyyppi] [varchar](100) NULL,
	[Sarakeryhma42_opp] [varchar](100) NULL,
	[Sarakeryhma42_opmala] [varchar](100) NULL,
	[Sarakeryhma42_opmopa] [varchar](100) NULL,
	[Sarakeryhma42_opmast] [varchar](100) NULL,
	[Sarakeryhma42_opm95opa] [varchar](100) NULL,
	[Sarakeryhma42_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma42_suorv] [varchar](100) NULL,
	[Sarakeryhma42_suorlk] [varchar](100) NULL,
	[Sarakeryhma42_kmaak] [varchar](100) NULL,
	[Sarakeryhma42_olotamm] [varchar](100) NULL,
	[Sarakeryhma42_olosyys] [varchar](100) NULL,
	[Sarakeryhma42_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma42_amas] [varchar](100) NULL,
	[Sarakeryhma42_koulk] [varchar](100) NULL,
	[Sarakeryhma42_jarj] [varchar](100) NULL,
	[Sarakeryhma42_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma43_ID] [nvarchar](128) NULL,
	[Sarakeryhma43_tyyppi] [varchar](100) NULL,
	[Sarakeryhma43_opp] [varchar](100) NULL,
	[Sarakeryhma43_opmala] [varchar](100) NULL,
	[Sarakeryhma43_opmopa] [varchar](100) NULL,
	[Sarakeryhma43_opmast] [varchar](100) NULL,
	[Sarakeryhma43_opm95opa] [varchar](100) NULL,
	[Sarakeryhma43_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma43_suorv] [varchar](100) NULL,
	[Sarakeryhma43_suorlk] [varchar](100) NULL,
	[Sarakeryhma43_kmaak] [varchar](100) NULL,
	[Sarakeryhma43_olotamm] [varchar](100) NULL,
	[Sarakeryhma43_olosyys] [varchar](100) NULL,
	[Sarakeryhma43_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma43_amas] [varchar](100) NULL,
	[Sarakeryhma43_koulk] [varchar](100) NULL,
	[Sarakeryhma43_jarj] [varchar](100) NULL,
	[Sarakeryhma43_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma44_ID] [nvarchar](128) NULL,
	[Sarakeryhma44_tyyppi] [varchar](100) NULL,
	[Sarakeryhma44_opp] [varchar](100) NULL,
	[Sarakeryhma44_opmala] [varchar](100) NULL,
	[Sarakeryhma44_opmopa] [varchar](100) NULL,
	[Sarakeryhma44_opmast] [varchar](100) NULL,
	[Sarakeryhma44_opm95opa] [varchar](100) NULL,
	[Sarakeryhma44_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma44_suorv] [varchar](100) NULL,
	[Sarakeryhma44_suorlk] [varchar](100) NULL,
	[Sarakeryhma44_kmaak] [varchar](100) NULL,
	[Sarakeryhma44_olotamm] [varchar](100) NULL,
	[Sarakeryhma44_olosyys] [varchar](100) NULL,
	[Sarakeryhma44_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma44_amas] [varchar](100) NULL,
	[Sarakeryhma44_koulk] [varchar](100) NULL,
	[Sarakeryhma44_jarj] [varchar](100) NULL,
	[Sarakeryhma44_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma45_ID] [nvarchar](128) NULL,
	[Sarakeryhma45_tyyppi] [varchar](100) NULL,
	[Sarakeryhma45_opp] [varchar](100) NULL,
	[Sarakeryhma45_opmala] [varchar](100) NULL,
	[Sarakeryhma45_opmopa] [varchar](100) NULL,
	[Sarakeryhma45_opmast] [varchar](100) NULL,
	[Sarakeryhma45_opm95opa] [varchar](100) NULL,
	[Sarakeryhma45_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma45_suorv] [varchar](100) NULL,
	[Sarakeryhma45_suorlk] [varchar](100) NULL,
	[Sarakeryhma45_kmaak] [varchar](100) NULL,
	[Sarakeryhma45_olotamm] [varchar](100) NULL,
	[Sarakeryhma45_olosyys] [varchar](100) NULL,
	[Sarakeryhma45_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma45_amas] [varchar](100) NULL,
	[Sarakeryhma45_koulk] [varchar](100) NULL,
	[Sarakeryhma45_jarj] [varchar](100) NULL,
	[Sarakeryhma45_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma46_ID] [nvarchar](128) NULL,
	[Sarakeryhma46_tyyppi] [varchar](100) NULL,
	[Sarakeryhma46_opp] [varchar](100) NULL,
	[Sarakeryhma46_opmala] [varchar](100) NULL,
	[Sarakeryhma46_opmopa] [varchar](100) NULL,
	[Sarakeryhma46_opmast] [varchar](100) NULL,
	[Sarakeryhma46_opm95opa] [varchar](100) NULL,
	[Sarakeryhma46_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma46_suorv] [varchar](100) NULL,
	[Sarakeryhma46_suorlk] [varchar](100) NULL,
	[Sarakeryhma46_kmaak] [varchar](100) NULL,
	[Sarakeryhma46_olotamm] [varchar](100) NULL,
	[Sarakeryhma46_olosyys] [varchar](100) NULL,
	[Sarakeryhma46_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma46_amas] [varchar](100) NULL,
	[Sarakeryhma46_koulk] [varchar](100) NULL,
	[Sarakeryhma46_jarj] [varchar](100) NULL,
	[Sarakeryhma46_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma47_ID] [nvarchar](128) NULL,
	[Sarakeryhma47_tyyppi] [varchar](100) NULL,
	[Sarakeryhma47_opp] [varchar](100) NULL,
	[Sarakeryhma47_opmala] [varchar](100) NULL,
	[Sarakeryhma47_opmopa] [varchar](100) NULL,
	[Sarakeryhma47_opmast] [varchar](100) NULL,
	[Sarakeryhma47_opm95opa] [varchar](100) NULL,
	[Sarakeryhma47_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma47_suorv] [varchar](100) NULL,
	[Sarakeryhma47_suorlk] [varchar](100) NULL,
	[Sarakeryhma47_kmaak] [varchar](100) NULL,
	[Sarakeryhma47_olotamm] [varchar](100) NULL,
	[Sarakeryhma47_olosyys] [varchar](100) NULL,
	[Sarakeryhma47_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma47_amas] [varchar](100) NULL,
	[Sarakeryhma47_koulk] [varchar](100) NULL,
	[Sarakeryhma47_jarj] [varchar](100) NULL,
	[Sarakeryhma47_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma48_ID] [nvarchar](128) NULL,
	[Sarakeryhma48_tyyppi] [varchar](100) NULL,
	[Sarakeryhma48_opp] [varchar](100) NULL,
	[Sarakeryhma48_opmala] [varchar](100) NULL,
	[Sarakeryhma48_opmopa] [varchar](100) NULL,
	[Sarakeryhma48_opmast] [varchar](100) NULL,
	[Sarakeryhma48_opm95opa] [varchar](100) NULL,
	[Sarakeryhma48_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma48_suorv] [varchar](100) NULL,
	[Sarakeryhma48_suorlk] [varchar](100) NULL,
	[Sarakeryhma48_kmaak] [varchar](100) NULL,
	[Sarakeryhma48_olotamm] [varchar](100) NULL,
	[Sarakeryhma48_olosyys] [varchar](100) NULL,
	[Sarakeryhma48_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma48_amas] [varchar](100) NULL,
	[Sarakeryhma48_koulk] [varchar](100) NULL,
	[Sarakeryhma48_jarj] [varchar](100) NULL,
	[Sarakeryhma48_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma49_ID] [nvarchar](128) NULL,
	[Sarakeryhma49_tyyppi] [varchar](100) NULL,
	[Sarakeryhma49_opp] [varchar](100) NULL,
	[Sarakeryhma49_opmala] [varchar](100) NULL,
	[Sarakeryhma49_opmopa] [varchar](100) NULL,
	[Sarakeryhma49_opmast] [varchar](100) NULL,
	[Sarakeryhma49_opm95opa] [varchar](100) NULL,
	[Sarakeryhma49_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma49_suorv] [varchar](100) NULL,
	[Sarakeryhma49_suorlk] [varchar](100) NULL,
	[Sarakeryhma49_kmaak] [varchar](100) NULL,
	[Sarakeryhma49_olotamm] [varchar](100) NULL,
	[Sarakeryhma49_olosyys] [varchar](100) NULL,
	[Sarakeryhma49_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma49_amas] [varchar](100) NULL,
	[Sarakeryhma49_koulk] [varchar](100) NULL,
	[Sarakeryhma49_jarj] [varchar](100) NULL,
	[Sarakeryhma49_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma50_ID] [nvarchar](128) NULL,
	[Sarakeryhma50_tyyppi] [varchar](100) NULL,
	[Sarakeryhma50_opp] [varchar](100) NULL,
	[Sarakeryhma50_opmala] [varchar](100) NULL,
	[Sarakeryhma50_opmopa] [varchar](100) NULL,
	[Sarakeryhma50_opmast] [varchar](100) NULL,
	[Sarakeryhma50_opm95opa] [varchar](100) NULL,
	[Sarakeryhma50_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma50_suorv] [varchar](100) NULL,
	[Sarakeryhma50_suorlk] [varchar](100) NULL,
	[Sarakeryhma50_kmaak] [varchar](100) NULL,
	[Sarakeryhma50_olotamm] [varchar](100) NULL,
	[Sarakeryhma50_olosyys] [varchar](100) NULL,
	[Sarakeryhma50_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma50_amas] [varchar](100) NULL,
	[Sarakeryhma50_koulk] [varchar](100) NULL,
	[Sarakeryhma50_jarj] [varchar](100) NULL,
	[Sarakeryhma50_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma51_ID] [nvarchar](128) NULL,
	[Sarakeryhma51_tyyppi] [varchar](100) NULL,
	[Sarakeryhma51_opp] [varchar](100) NULL,
	[Sarakeryhma51_opmala] [varchar](100) NULL,
	[Sarakeryhma51_opmopa] [varchar](100) NULL,
	[Sarakeryhma51_opmast] [varchar](100) NULL,
	[Sarakeryhma51_opm95opa] [varchar](100) NULL,
	[Sarakeryhma51_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma51_suorv] [varchar](100) NULL,
	[Sarakeryhma51_suorlk] [varchar](100) NULL,
	[Sarakeryhma51_kmaak] [varchar](100) NULL,
	[Sarakeryhma51_olotamm] [varchar](100) NULL,
	[Sarakeryhma51_olosyys] [varchar](100) NULL,
	[Sarakeryhma51_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma51_amas] [varchar](100) NULL,
	[Sarakeryhma51_koulk] [varchar](100) NULL,
	[Sarakeryhma51_jarj] [varchar](100) NULL,
	[Sarakeryhma51_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma52_ID] [nvarchar](128) NULL,
	[Sarakeryhma52_tyyppi] [varchar](100) NULL,
	[Sarakeryhma52_opp] [varchar](100) NULL,
	[Sarakeryhma52_opmala] [varchar](100) NULL,
	[Sarakeryhma52_opmopa] [varchar](100) NULL,
	[Sarakeryhma52_opmast] [varchar](100) NULL,
	[Sarakeryhma52_opm95opa] [varchar](100) NULL,
	[Sarakeryhma52_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma52_suorv] [varchar](100) NULL,
	[Sarakeryhma52_suorlk] [varchar](100) NULL,
	[Sarakeryhma52_kmaak] [varchar](100) NULL,
	[Sarakeryhma52_olotamm] [varchar](100) NULL,
	[Sarakeryhma52_olosyys] [varchar](100) NULL,
	[Sarakeryhma52_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma52_amas] [varchar](100) NULL,
	[Sarakeryhma52_koulk] [varchar](100) NULL,
	[Sarakeryhma52_jarj] [varchar](100) NULL,
	[Sarakeryhma52_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma53_ID] [nvarchar](128) NULL,
	[Sarakeryhma53_tyyppi] [varchar](100) NULL,
	[Sarakeryhma53_opp] [varchar](100) NULL,
	[Sarakeryhma53_opmala] [varchar](100) NULL,
	[Sarakeryhma53_opmopa] [varchar](100) NULL,
	[Sarakeryhma53_opmast] [varchar](100) NULL,
	[Sarakeryhma53_opm95opa] [varchar](100) NULL,
	[Sarakeryhma53_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma53_suorv] [varchar](100) NULL,
	[Sarakeryhma53_suorlk] [varchar](100) NULL,
	[Sarakeryhma53_kmaak] [varchar](100) NULL,
	[Sarakeryhma53_olotamm] [varchar](100) NULL,
	[Sarakeryhma53_olosyys] [varchar](100) NULL,
	[Sarakeryhma53_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma53_amas] [varchar](100) NULL,
	[Sarakeryhma53_koulk] [varchar](100) NULL,
	[Sarakeryhma53_jarj] [varchar](100) NULL,
	[Sarakeryhma53_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma54_ID] [nvarchar](128) NULL,
	[Sarakeryhma54_tyyppi] [varchar](100) NULL,
	[Sarakeryhma54_opp] [varchar](100) NULL,
	[Sarakeryhma54_opmala] [varchar](100) NULL,
	[Sarakeryhma54_opmopa] [varchar](100) NULL,
	[Sarakeryhma54_opmast] [varchar](100) NULL,
	[Sarakeryhma54_opm95opa] [varchar](100) NULL,
	[Sarakeryhma54_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma54_suorv] [varchar](100) NULL,
	[Sarakeryhma54_suorlk] [varchar](100) NULL,
	[Sarakeryhma54_kmaak] [varchar](100) NULL,
	[Sarakeryhma54_olotamm] [varchar](100) NULL,
	[Sarakeryhma54_olosyys] [varchar](100) NULL,
	[Sarakeryhma54_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma54_amas] [varchar](100) NULL,
	[Sarakeryhma54_koulk] [varchar](100) NULL,
	[Sarakeryhma54_jarj] [varchar](100) NULL,
	[Sarakeryhma54_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma55_ID] [nvarchar](128) NULL,
	[Sarakeryhma55_tyyppi] [varchar](100) NULL,
	[Sarakeryhma55_opp] [varchar](100) NULL,
	[Sarakeryhma55_opmala] [varchar](100) NULL,
	[Sarakeryhma55_opmopa] [varchar](100) NULL,
	[Sarakeryhma55_opmast] [varchar](100) NULL,
	[Sarakeryhma55_opm95opa] [varchar](100) NULL,
	[Sarakeryhma55_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma55_suorv] [varchar](100) NULL,
	[Sarakeryhma55_suorlk] [varchar](100) NULL,
	[Sarakeryhma55_kmaak] [varchar](100) NULL,
	[Sarakeryhma55_olotamm] [varchar](100) NULL,
	[Sarakeryhma55_olosyys] [varchar](100) NULL,
	[Sarakeryhma55_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma55_amas] [varchar](100) NULL,
	[Sarakeryhma55_koulk] [varchar](100) NULL,
	[Sarakeryhma55_jarj] [varchar](100) NULL,
	[Sarakeryhma55_tutkintolaji] [varchar](5) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_aloittaneiden_lapaisy_tiivistetty]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_aloittaneiden_lapaisy_tiivistetty]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_aloittaneiden_lapaisy_tiivistetty](
	[rivinumero] [int] IDENTITY(1,1) NOT NULL,
	[tarkasteluperiodi] [nvarchar](20) NOT NULL,
	[tilv] [varchar](255) NULL,
	[lahde] [varchar](255) NULL,
	[opp] [varchar](5) NULL,
	[sp] [varchar](255) NULL,
	[syntv] [varchar](255) NULL,
	[aikielir1] [varchar](255) NULL,
	[alvv] [varchar](255) NULL,
	[allk] [varchar](255) NULL,
	[klaji] [varchar](255) NULL,
	[ophal] [varchar](255) NULL,
	[jarj] [varchar](255) NULL,
	[kkun] [varchar](255) NULL,
	[maak] [varchar](2) NOT NULL,
	[koulk] [varchar](255) NULL,
	[opmala] [varchar](2) NULL,
	[opmopa] [varchar](3) NULL,
	[opmast] [varchar](2) NULL,
	[opm95opa] [varchar](3) NULL,
	[koulutussektori] [varchar](26) NULL,
	[pohjkoulk] [varchar](255) NULL,
	[alvv_kk] [varchar](255) NULL,
	[allk_kk] [varchar](255) NULL,
	[ololk] [varchar](255) NULL,
	[rahlahde] [varchar](255) NULL,
	[koulutuslaji2] [varchar](255) NULL,
	[tutkintolaji] [varchar](5) NULL,
	[tietolahde] [varchar](255) NULL,
	[aineistorivinumero] [numeric](18, 0) NULL,
	[lkm_int] [int] NULL,
	[Sarakeryhma1_ID] [nvarchar](128) NULL,
	[Sarakeryhma1_tyyppi] [varchar](100) NULL,
	[Sarakeryhma1_opp] [varchar](100) NULL,
	[Sarakeryhma1_opmala] [varchar](100) NULL,
	[Sarakeryhma1_opmopa] [varchar](100) NULL,
	[Sarakeryhma1_opmast] [varchar](100) NULL,
	[Sarakeryhma1_opm95opa] [varchar](100) NULL,
	[Sarakeryhma1_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma1_suorv] [varchar](100) NULL,
	[Sarakeryhma1_suorlk] [varchar](100) NULL,
	[Sarakeryhma1_kmaak] [varchar](100) NULL,
	[Sarakeryhma1_olotamm] [varchar](100) NULL,
	[Sarakeryhma1_olosyys] [varchar](100) NULL,
	[Sarakeryhma1_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma1_amas] [varchar](100) NULL,
	[Sarakeryhma1_koulk] [varchar](100) NULL,
	[Sarakeryhma1_jarj] [varchar](100) NULL,
	[Sarakeryhma1_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma2_ID] [nvarchar](128) NULL,
	[Sarakeryhma2_tyyppi] [varchar](100) NULL,
	[Sarakeryhma2_opp] [varchar](100) NULL,
	[Sarakeryhma2_opmala] [varchar](100) NULL,
	[Sarakeryhma2_opmopa] [varchar](100) NULL,
	[Sarakeryhma2_opmast] [varchar](100) NULL,
	[Sarakeryhma2_opm95opa] [varchar](100) NULL,
	[Sarakeryhma2_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma2_suorv] [varchar](100) NULL,
	[Sarakeryhma2_suorlk] [varchar](100) NULL,
	[Sarakeryhma2_kmaak] [varchar](100) NULL,
	[Sarakeryhma2_olotamm] [varchar](100) NULL,
	[Sarakeryhma2_olosyys] [varchar](100) NULL,
	[Sarakeryhma2_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma2_amas] [varchar](100) NULL,
	[Sarakeryhma2_koulk] [varchar](100) NULL,
	[Sarakeryhma2_jarj] [varchar](100) NULL,
	[Sarakeryhma2_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma3_ID] [nvarchar](128) NULL,
	[Sarakeryhma3_tyyppi] [varchar](100) NULL,
	[Sarakeryhma3_opp] [varchar](100) NULL,
	[Sarakeryhma3_opmala] [varchar](100) NULL,
	[Sarakeryhma3_opmopa] [varchar](100) NULL,
	[Sarakeryhma3_opmast] [varchar](100) NULL,
	[Sarakeryhma3_opm95opa] [varchar](100) NULL,
	[Sarakeryhma3_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma3_suorv] [varchar](100) NULL,
	[Sarakeryhma3_suorlk] [varchar](100) NULL,
	[Sarakeryhma3_kmaak] [varchar](100) NULL,
	[Sarakeryhma3_olotamm] [varchar](100) NULL,
	[Sarakeryhma3_olosyys] [varchar](100) NULL,
	[Sarakeryhma3_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma3_amas] [varchar](100) NULL,
	[Sarakeryhma3_koulk] [varchar](100) NULL,
	[Sarakeryhma3_jarj] [varchar](100) NULL,
	[Sarakeryhma3_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma4_ID] [nvarchar](128) NULL,
	[Sarakeryhma4_tyyppi] [varchar](100) NULL,
	[Sarakeryhma4_opp] [varchar](100) NULL,
	[Sarakeryhma4_opmala] [varchar](100) NULL,
	[Sarakeryhma4_opmopa] [varchar](100) NULL,
	[Sarakeryhma4_opmast] [varchar](100) NULL,
	[Sarakeryhma4_opm95opa] [varchar](100) NULL,
	[Sarakeryhma4_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma4_suorv] [varchar](100) NULL,
	[Sarakeryhma4_suorlk] [varchar](100) NULL,
	[Sarakeryhma4_kmaak] [varchar](100) NULL,
	[Sarakeryhma4_olotamm] [varchar](100) NULL,
	[Sarakeryhma4_olosyys] [varchar](100) NULL,
	[Sarakeryhma4_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma4_amas] [varchar](100) NULL,
	[Sarakeryhma4_koulk] [varchar](100) NULL,
	[Sarakeryhma4_jarj] [varchar](100) NULL,
	[Sarakeryhma4_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma5_ID] [nvarchar](128) NULL,
	[Sarakeryhma5_tyyppi] [varchar](100) NULL,
	[Sarakeryhma5_opp] [varchar](100) NULL,
	[Sarakeryhma5_opmala] [varchar](100) NULL,
	[Sarakeryhma5_opmopa] [varchar](100) NULL,
	[Sarakeryhma5_opmast] [varchar](100) NULL,
	[Sarakeryhma5_opm95opa] [varchar](100) NULL,
	[Sarakeryhma5_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma5_suorv] [varchar](100) NULL,
	[Sarakeryhma5_suorlk] [varchar](100) NULL,
	[Sarakeryhma5_kmaak] [varchar](100) NULL,
	[Sarakeryhma5_olotamm] [varchar](100) NULL,
	[Sarakeryhma5_olosyys] [varchar](100) NULL,
	[Sarakeryhma5_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma5_amas] [varchar](100) NULL,
	[Sarakeryhma5_koulk] [varchar](100) NULL,
	[Sarakeryhma5_jarj] [varchar](100) NULL,
	[Sarakeryhma5_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma6_ID] [nvarchar](128) NULL,
	[Sarakeryhma6_tyyppi] [varchar](100) NULL,
	[Sarakeryhma6_opp] [varchar](100) NULL,
	[Sarakeryhma6_opmala] [varchar](100) NULL,
	[Sarakeryhma6_opmopa] [varchar](100) NULL,
	[Sarakeryhma6_opmast] [varchar](100) NULL,
	[Sarakeryhma6_opm95opa] [varchar](100) NULL,
	[Sarakeryhma6_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma6_suorv] [varchar](100) NULL,
	[Sarakeryhma6_suorlk] [varchar](100) NULL,
	[Sarakeryhma6_kmaak] [varchar](100) NULL,
	[Sarakeryhma6_olotamm] [varchar](100) NULL,
	[Sarakeryhma6_olosyys] [varchar](100) NULL,
	[Sarakeryhma6_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma6_amas] [varchar](100) NULL,
	[Sarakeryhma6_koulk] [varchar](100) NULL,
	[Sarakeryhma6_jarj] [varchar](100) NULL,
	[Sarakeryhma6_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma7_ID] [nvarchar](128) NULL,
	[Sarakeryhma7_tyyppi] [varchar](100) NULL,
	[Sarakeryhma7_opp] [varchar](100) NULL,
	[Sarakeryhma7_opmala] [varchar](100) NULL,
	[Sarakeryhma7_opmopa] [varchar](100) NULL,
	[Sarakeryhma7_opmast] [varchar](100) NULL,
	[Sarakeryhma7_opm95opa] [varchar](100) NULL,
	[Sarakeryhma7_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma7_suorv] [varchar](100) NULL,
	[Sarakeryhma7_suorlk] [varchar](100) NULL,
	[Sarakeryhma7_kmaak] [varchar](100) NULL,
	[Sarakeryhma7_olotamm] [varchar](100) NULL,
	[Sarakeryhma7_olosyys] [varchar](100) NULL,
	[Sarakeryhma7_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma7_amas] [varchar](100) NULL,
	[Sarakeryhma7_koulk] [varchar](100) NULL,
	[Sarakeryhma7_jarj] [varchar](100) NULL,
	[Sarakeryhma7_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma8_ID] [nvarchar](128) NULL,
	[Sarakeryhma8_tyyppi] [varchar](100) NULL,
	[Sarakeryhma8_opp] [varchar](100) NULL,
	[Sarakeryhma8_opmala] [varchar](100) NULL,
	[Sarakeryhma8_opmopa] [varchar](100) NULL,
	[Sarakeryhma8_opmast] [varchar](100) NULL,
	[Sarakeryhma8_opm95opa] [varchar](100) NULL,
	[Sarakeryhma8_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma8_suorv] [varchar](100) NULL,
	[Sarakeryhma8_suorlk] [varchar](100) NULL,
	[Sarakeryhma8_kmaak] [varchar](100) NULL,
	[Sarakeryhma8_olotamm] [varchar](100) NULL,
	[Sarakeryhma8_olosyys] [varchar](100) NULL,
	[Sarakeryhma8_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma8_amas] [varchar](100) NULL,
	[Sarakeryhma8_koulk] [varchar](100) NULL,
	[Sarakeryhma8_jarj] [varchar](100) NULL,
	[Sarakeryhma8_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma9_ID] [nvarchar](128) NULL,
	[Sarakeryhma9_tyyppi] [varchar](100) NULL,
	[Sarakeryhma9_opp] [varchar](100) NULL,
	[Sarakeryhma9_opmala] [varchar](100) NULL,
	[Sarakeryhma9_opmopa] [varchar](100) NULL,
	[Sarakeryhma9_opmast] [varchar](100) NULL,
	[Sarakeryhma9_opm95opa] [varchar](100) NULL,
	[Sarakeryhma9_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma9_suorv] [varchar](100) NULL,
	[Sarakeryhma9_suorlk] [varchar](100) NULL,
	[Sarakeryhma9_kmaak] [varchar](100) NULL,
	[Sarakeryhma9_olotamm] [varchar](100) NULL,
	[Sarakeryhma9_olosyys] [varchar](100) NULL,
	[Sarakeryhma9_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma9_amas] [varchar](100) NULL,
	[Sarakeryhma9_koulk] [varchar](100) NULL,
	[Sarakeryhma9_jarj] [varchar](100) NULL,
	[Sarakeryhma9_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma10_ID] [nvarchar](128) NULL,
	[Sarakeryhma10_tyyppi] [varchar](100) NULL,
	[Sarakeryhma10_opp] [varchar](100) NULL,
	[Sarakeryhma10_opmala] [varchar](100) NULL,
	[Sarakeryhma10_opmopa] [varchar](100) NULL,
	[Sarakeryhma10_opmast] [varchar](100) NULL,
	[Sarakeryhma10_opm95opa] [varchar](100) NULL,
	[Sarakeryhma10_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma10_suorv] [varchar](100) NULL,
	[Sarakeryhma10_suorlk] [varchar](100) NULL,
	[Sarakeryhma10_kmaak] [varchar](100) NULL,
	[Sarakeryhma10_olotamm] [varchar](100) NULL,
	[Sarakeryhma10_olosyys] [varchar](100) NULL,
	[Sarakeryhma10_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma10_amas] [varchar](100) NULL,
	[Sarakeryhma10_koulk] [varchar](100) NULL,
	[Sarakeryhma10_jarj] [varchar](100) NULL,
	[Sarakeryhma10_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma11_ID] [nvarchar](128) NULL,
	[Sarakeryhma11_tyyppi] [varchar](100) NULL,
	[Sarakeryhma11_opp] [varchar](100) NULL,
	[Sarakeryhma11_opmala] [varchar](100) NULL,
	[Sarakeryhma11_opmopa] [varchar](100) NULL,
	[Sarakeryhma11_opmast] [varchar](100) NULL,
	[Sarakeryhma11_opm95opa] [varchar](100) NULL,
	[Sarakeryhma11_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma11_suorv] [varchar](100) NULL,
	[Sarakeryhma11_suorlk] [varchar](100) NULL,
	[Sarakeryhma11_kmaak] [varchar](100) NULL,
	[Sarakeryhma11_olotamm] [varchar](100) NULL,
	[Sarakeryhma11_olosyys] [varchar](100) NULL,
	[Sarakeryhma11_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma11_amas] [varchar](100) NULL,
	[Sarakeryhma11_koulk] [varchar](100) NULL,
	[Sarakeryhma11_jarj] [varchar](100) NULL,
	[Sarakeryhma11_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma12_ID] [nvarchar](128) NULL,
	[Sarakeryhma12_tyyppi] [varchar](100) NULL,
	[Sarakeryhma12_opp] [varchar](100) NULL,
	[Sarakeryhma12_opmala] [varchar](100) NULL,
	[Sarakeryhma12_opmopa] [varchar](100) NULL,
	[Sarakeryhma12_opmast] [varchar](100) NULL,
	[Sarakeryhma12_opm95opa] [varchar](100) NULL,
	[Sarakeryhma12_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma12_suorv] [varchar](100) NULL,
	[Sarakeryhma12_suorlk] [varchar](100) NULL,
	[Sarakeryhma12_kmaak] [varchar](100) NULL,
	[Sarakeryhma12_olotamm] [varchar](100) NULL,
	[Sarakeryhma12_olosyys] [varchar](100) NULL,
	[Sarakeryhma12_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma12_amas] [varchar](100) NULL,
	[Sarakeryhma12_koulk] [varchar](100) NULL,
	[Sarakeryhma12_jarj] [varchar](100) NULL,
	[Sarakeryhma12_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma13_ID] [nvarchar](128) NULL,
	[Sarakeryhma13_tyyppi] [varchar](100) NULL,
	[Sarakeryhma13_opp] [varchar](100) NULL,
	[Sarakeryhma13_opmala] [varchar](100) NULL,
	[Sarakeryhma13_opmopa] [varchar](100) NULL,
	[Sarakeryhma13_opmast] [varchar](100) NULL,
	[Sarakeryhma13_opm95opa] [varchar](100) NULL,
	[Sarakeryhma13_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma13_suorv] [varchar](100) NULL,
	[Sarakeryhma13_suorlk] [varchar](100) NULL,
	[Sarakeryhma13_kmaak] [varchar](100) NULL,
	[Sarakeryhma13_olotamm] [varchar](100) NULL,
	[Sarakeryhma13_olosyys] [varchar](100) NULL,
	[Sarakeryhma13_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma13_amas] [varchar](100) NULL,
	[Sarakeryhma13_koulk] [varchar](100) NULL,
	[Sarakeryhma13_jarj] [varchar](100) NULL,
	[Sarakeryhma13_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma14_ID] [nvarchar](128) NULL,
	[Sarakeryhma14_tyyppi] [varchar](100) NULL,
	[Sarakeryhma14_opp] [varchar](100) NULL,
	[Sarakeryhma14_opmala] [varchar](100) NULL,
	[Sarakeryhma14_opmopa] [varchar](100) NULL,
	[Sarakeryhma14_opmast] [varchar](100) NULL,
	[Sarakeryhma14_opm95opa] [varchar](100) NULL,
	[Sarakeryhma14_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma14_suorv] [varchar](100) NULL,
	[Sarakeryhma14_suorlk] [varchar](100) NULL,
	[Sarakeryhma14_kmaak] [varchar](100) NULL,
	[Sarakeryhma14_olotamm] [varchar](100) NULL,
	[Sarakeryhma14_olosyys] [varchar](100) NULL,
	[Sarakeryhma14_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma14_amas] [varchar](100) NULL,
	[Sarakeryhma14_koulk] [varchar](100) NULL,
	[Sarakeryhma14_jarj] [varchar](100) NULL,
	[Sarakeryhma14_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma15_ID] [nvarchar](128) NULL,
	[Sarakeryhma15_tyyppi] [varchar](100) NULL,
	[Sarakeryhma15_opp] [varchar](100) NULL,
	[Sarakeryhma15_opmala] [varchar](100) NULL,
	[Sarakeryhma15_opmopa] [varchar](100) NULL,
	[Sarakeryhma15_opmast] [varchar](100) NULL,
	[Sarakeryhma15_opm95opa] [varchar](100) NULL,
	[Sarakeryhma15_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma15_suorv] [varchar](100) NULL,
	[Sarakeryhma15_suorlk] [varchar](100) NULL,
	[Sarakeryhma15_kmaak] [varchar](100) NULL,
	[Sarakeryhma15_olotamm] [varchar](100) NULL,
	[Sarakeryhma15_olosyys] [varchar](100) NULL,
	[Sarakeryhma15_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma15_amas] [varchar](100) NULL,
	[Sarakeryhma15_koulk] [varchar](100) NULL,
	[Sarakeryhma15_jarj] [varchar](100) NULL,
	[Sarakeryhma15_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma16_ID] [nvarchar](128) NULL,
	[Sarakeryhma16_tyyppi] [varchar](100) NULL,
	[Sarakeryhma16_opp] [varchar](100) NULL,
	[Sarakeryhma16_opmala] [varchar](100) NULL,
	[Sarakeryhma16_opmopa] [varchar](100) NULL,
	[Sarakeryhma16_opmast] [varchar](100) NULL,
	[Sarakeryhma16_opm95opa] [varchar](100) NULL,
	[Sarakeryhma16_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma16_suorv] [varchar](100) NULL,
	[Sarakeryhma16_suorlk] [varchar](100) NULL,
	[Sarakeryhma16_kmaak] [varchar](100) NULL,
	[Sarakeryhma16_olotamm] [varchar](100) NULL,
	[Sarakeryhma16_olosyys] [varchar](100) NULL,
	[Sarakeryhma16_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma16_amas] [varchar](100) NULL,
	[Sarakeryhma16_koulk] [varchar](100) NULL,
	[Sarakeryhma16_jarj] [varchar](100) NULL,
	[Sarakeryhma16_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma17_ID] [nvarchar](128) NULL,
	[Sarakeryhma17_tyyppi] [varchar](100) NULL,
	[Sarakeryhma17_opp] [varchar](100) NULL,
	[Sarakeryhma17_opmala] [varchar](100) NULL,
	[Sarakeryhma17_opmopa] [varchar](100) NULL,
	[Sarakeryhma17_opmast] [varchar](100) NULL,
	[Sarakeryhma17_opm95opa] [varchar](100) NULL,
	[Sarakeryhma17_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma17_suorv] [varchar](100) NULL,
	[Sarakeryhma17_suorlk] [varchar](100) NULL,
	[Sarakeryhma17_kmaak] [varchar](100) NULL,
	[Sarakeryhma17_olotamm] [varchar](100) NULL,
	[Sarakeryhma17_olosyys] [varchar](100) NULL,
	[Sarakeryhma17_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma17_amas] [varchar](100) NULL,
	[Sarakeryhma17_koulk] [varchar](100) NULL,
	[Sarakeryhma17_jarj] [varchar](100) NULL,
	[Sarakeryhma17_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma18_ID] [nvarchar](128) NULL,
	[Sarakeryhma18_tyyppi] [varchar](100) NULL,
	[Sarakeryhma18_opp] [varchar](100) NULL,
	[Sarakeryhma18_opmala] [varchar](100) NULL,
	[Sarakeryhma18_opmopa] [varchar](100) NULL,
	[Sarakeryhma18_opmast] [varchar](100) NULL,
	[Sarakeryhma18_opm95opa] [varchar](100) NULL,
	[Sarakeryhma18_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma18_suorv] [varchar](100) NULL,
	[Sarakeryhma18_suorlk] [varchar](100) NULL,
	[Sarakeryhma18_kmaak] [varchar](100) NULL,
	[Sarakeryhma18_olotamm] [varchar](100) NULL,
	[Sarakeryhma18_olosyys] [varchar](100) NULL,
	[Sarakeryhma18_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma18_amas] [varchar](100) NULL,
	[Sarakeryhma18_koulk] [varchar](100) NULL,
	[Sarakeryhma18_jarj] [varchar](100) NULL,
	[Sarakeryhma18_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma19_ID] [nvarchar](128) NULL,
	[Sarakeryhma19_tyyppi] [varchar](100) NULL,
	[Sarakeryhma19_opp] [varchar](100) NULL,
	[Sarakeryhma19_opmala] [varchar](100) NULL,
	[Sarakeryhma19_opmopa] [varchar](100) NULL,
	[Sarakeryhma19_opmast] [varchar](100) NULL,
	[Sarakeryhma19_opm95opa] [varchar](100) NULL,
	[Sarakeryhma19_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma19_suorv] [varchar](100) NULL,
	[Sarakeryhma19_suorlk] [varchar](100) NULL,
	[Sarakeryhma19_kmaak] [varchar](100) NULL,
	[Sarakeryhma19_olotamm] [varchar](100) NULL,
	[Sarakeryhma19_olosyys] [varchar](100) NULL,
	[Sarakeryhma19_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma19_amas] [varchar](100) NULL,
	[Sarakeryhma19_koulk] [varchar](100) NULL,
	[Sarakeryhma19_jarj] [varchar](100) NULL,
	[Sarakeryhma19_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma20_ID] [nvarchar](128) NULL,
	[Sarakeryhma20_tyyppi] [varchar](100) NULL,
	[Sarakeryhma20_opp] [varchar](100) NULL,
	[Sarakeryhma20_opmala] [varchar](100) NULL,
	[Sarakeryhma20_opmopa] [varchar](100) NULL,
	[Sarakeryhma20_opmast] [varchar](100) NULL,
	[Sarakeryhma20_opm95opa] [varchar](100) NULL,
	[Sarakeryhma20_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma20_suorv] [varchar](100) NULL,
	[Sarakeryhma20_suorlk] [varchar](100) NULL,
	[Sarakeryhma20_kmaak] [varchar](100) NULL,
	[Sarakeryhma20_olotamm] [varchar](100) NULL,
	[Sarakeryhma20_olosyys] [varchar](100) NULL,
	[Sarakeryhma20_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma20_amas] [varchar](100) NULL,
	[Sarakeryhma20_koulk] [varchar](100) NULL,
	[Sarakeryhma20_jarj] [varchar](100) NULL,
	[Sarakeryhma20_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma21_ID] [nvarchar](128) NULL,
	[Sarakeryhma21_tyyppi] [varchar](100) NULL,
	[Sarakeryhma21_opp] [varchar](100) NULL,
	[Sarakeryhma21_opmala] [varchar](100) NULL,
	[Sarakeryhma21_opmopa] [varchar](100) NULL,
	[Sarakeryhma21_opmast] [varchar](100) NULL,
	[Sarakeryhma21_opm95opa] [varchar](100) NULL,
	[Sarakeryhma21_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma21_suorv] [varchar](100) NULL,
	[Sarakeryhma21_suorlk] [varchar](100) NULL,
	[Sarakeryhma21_kmaak] [varchar](100) NULL,
	[Sarakeryhma21_olotamm] [varchar](100) NULL,
	[Sarakeryhma21_olosyys] [varchar](100) NULL,
	[Sarakeryhma21_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma21_amas] [varchar](100) NULL,
	[Sarakeryhma21_koulk] [varchar](100) NULL,
	[Sarakeryhma21_jarj] [varchar](100) NULL,
	[Sarakeryhma21_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma22_ID] [nvarchar](128) NULL,
	[Sarakeryhma22_tyyppi] [varchar](100) NULL,
	[Sarakeryhma22_opp] [varchar](100) NULL,
	[Sarakeryhma22_opmala] [varchar](100) NULL,
	[Sarakeryhma22_opmopa] [varchar](100) NULL,
	[Sarakeryhma22_opmast] [varchar](100) NULL,
	[Sarakeryhma22_opm95opa] [varchar](100) NULL,
	[Sarakeryhma22_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma22_suorv] [varchar](100) NULL,
	[Sarakeryhma22_suorlk] [varchar](100) NULL,
	[Sarakeryhma22_kmaak] [varchar](100) NULL,
	[Sarakeryhma22_olotamm] [varchar](100) NULL,
	[Sarakeryhma22_olosyys] [varchar](100) NULL,
	[Sarakeryhma22_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma22_amas] [varchar](100) NULL,
	[Sarakeryhma22_koulk] [varchar](100) NULL,
	[Sarakeryhma22_jarj] [varchar](100) NULL,
	[Sarakeryhma22_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma23_ID] [nvarchar](128) NULL,
	[Sarakeryhma23_tyyppi] [varchar](100) NULL,
	[Sarakeryhma23_opp] [varchar](100) NULL,
	[Sarakeryhma23_opmala] [varchar](100) NULL,
	[Sarakeryhma23_opmopa] [varchar](100) NULL,
	[Sarakeryhma23_opmast] [varchar](100) NULL,
	[Sarakeryhma23_opm95opa] [varchar](100) NULL,
	[Sarakeryhma23_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma23_suorv] [varchar](100) NULL,
	[Sarakeryhma23_suorlk] [varchar](100) NULL,
	[Sarakeryhma23_kmaak] [varchar](100) NULL,
	[Sarakeryhma23_olotamm] [varchar](100) NULL,
	[Sarakeryhma23_olosyys] [varchar](100) NULL,
	[Sarakeryhma23_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma23_amas] [varchar](100) NULL,
	[Sarakeryhma23_koulk] [varchar](100) NULL,
	[Sarakeryhma23_jarj] [varchar](100) NULL,
	[Sarakeryhma23_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma24_ID] [nvarchar](128) NULL,
	[Sarakeryhma24_tyyppi] [varchar](100) NULL,
	[Sarakeryhma24_opp] [varchar](100) NULL,
	[Sarakeryhma24_opmala] [varchar](100) NULL,
	[Sarakeryhma24_opmopa] [varchar](100) NULL,
	[Sarakeryhma24_opmast] [varchar](100) NULL,
	[Sarakeryhma24_opm95opa] [varchar](100) NULL,
	[Sarakeryhma24_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma24_suorv] [varchar](100) NULL,
	[Sarakeryhma24_suorlk] [varchar](100) NULL,
	[Sarakeryhma24_kmaak] [varchar](100) NULL,
	[Sarakeryhma24_olotamm] [varchar](100) NULL,
	[Sarakeryhma24_olosyys] [varchar](100) NULL,
	[Sarakeryhma24_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma24_amas] [varchar](100) NULL,
	[Sarakeryhma24_koulk] [varchar](100) NULL,
	[Sarakeryhma24_jarj] [varchar](100) NULL,
	[Sarakeryhma24_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma25_ID] [nvarchar](128) NULL,
	[Sarakeryhma25_tyyppi] [varchar](100) NULL,
	[Sarakeryhma25_opp] [varchar](100) NULL,
	[Sarakeryhma25_opmala] [varchar](100) NULL,
	[Sarakeryhma25_opmopa] [varchar](100) NULL,
	[Sarakeryhma25_opmast] [varchar](100) NULL,
	[Sarakeryhma25_opm95opa] [varchar](100) NULL,
	[Sarakeryhma25_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma25_suorv] [varchar](100) NULL,
	[Sarakeryhma25_suorlk] [varchar](100) NULL,
	[Sarakeryhma25_kmaak] [varchar](100) NULL,
	[Sarakeryhma25_olotamm] [varchar](100) NULL,
	[Sarakeryhma25_olosyys] [varchar](100) NULL,
	[Sarakeryhma25_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma25_amas] [varchar](100) NULL,
	[Sarakeryhma25_koulk] [varchar](100) NULL,
	[Sarakeryhma25_jarj] [varchar](100) NULL,
	[Sarakeryhma25_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma26_ID] [nvarchar](128) NULL,
	[Sarakeryhma26_tyyppi] [varchar](100) NULL,
	[Sarakeryhma26_opp] [varchar](100) NULL,
	[Sarakeryhma26_opmala] [varchar](100) NULL,
	[Sarakeryhma26_opmopa] [varchar](100) NULL,
	[Sarakeryhma26_opmast] [varchar](100) NULL,
	[Sarakeryhma26_opm95opa] [varchar](100) NULL,
	[Sarakeryhma26_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma26_suorv] [varchar](100) NULL,
	[Sarakeryhma26_suorlk] [varchar](100) NULL,
	[Sarakeryhma26_kmaak] [varchar](100) NULL,
	[Sarakeryhma26_olotamm] [varchar](100) NULL,
	[Sarakeryhma26_olosyys] [varchar](100) NULL,
	[Sarakeryhma26_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma26_amas] [varchar](100) NULL,
	[Sarakeryhma26_koulk] [varchar](100) NULL,
	[Sarakeryhma26_jarj] [varchar](100) NULL,
	[Sarakeryhma26_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma27_ID] [nvarchar](128) NULL,
	[Sarakeryhma27_tyyppi] [varchar](100) NULL,
	[Sarakeryhma27_opp] [varchar](100) NULL,
	[Sarakeryhma27_opmala] [varchar](100) NULL,
	[Sarakeryhma27_opmopa] [varchar](100) NULL,
	[Sarakeryhma27_opmast] [varchar](100) NULL,
	[Sarakeryhma27_opm95opa] [varchar](100) NULL,
	[Sarakeryhma27_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma27_suorv] [varchar](100) NULL,
	[Sarakeryhma27_suorlk] [varchar](100) NULL,
	[Sarakeryhma27_kmaak] [varchar](100) NULL,
	[Sarakeryhma27_olotamm] [varchar](100) NULL,
	[Sarakeryhma27_olosyys] [varchar](100) NULL,
	[Sarakeryhma27_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma27_amas] [varchar](100) NULL,
	[Sarakeryhma27_koulk] [varchar](100) NULL,
	[Sarakeryhma27_jarj] [varchar](100) NULL,
	[Sarakeryhma27_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma28_ID] [nvarchar](128) NULL,
	[Sarakeryhma28_tyyppi] [varchar](100) NULL,
	[Sarakeryhma28_opp] [varchar](100) NULL,
	[Sarakeryhma28_opmala] [varchar](100) NULL,
	[Sarakeryhma28_opmopa] [varchar](100) NULL,
	[Sarakeryhma28_opmast] [varchar](100) NULL,
	[Sarakeryhma28_opm95opa] [varchar](100) NULL,
	[Sarakeryhma28_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma28_suorv] [varchar](100) NULL,
	[Sarakeryhma28_suorlk] [varchar](100) NULL,
	[Sarakeryhma28_kmaak] [varchar](100) NULL,
	[Sarakeryhma28_olotamm] [varchar](100) NULL,
	[Sarakeryhma28_olosyys] [varchar](100) NULL,
	[Sarakeryhma28_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma28_amas] [varchar](100) NULL,
	[Sarakeryhma28_koulk] [varchar](100) NULL,
	[Sarakeryhma28_jarj] [varchar](100) NULL,
	[Sarakeryhma28_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma29_ID] [nvarchar](128) NULL,
	[Sarakeryhma29_tyyppi] [varchar](100) NULL,
	[Sarakeryhma29_opp] [varchar](100) NULL,
	[Sarakeryhma29_opmala] [varchar](100) NULL,
	[Sarakeryhma29_opmopa] [varchar](100) NULL,
	[Sarakeryhma29_opmast] [varchar](100) NULL,
	[Sarakeryhma29_opm95opa] [varchar](100) NULL,
	[Sarakeryhma29_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma29_suorv] [varchar](100) NULL,
	[Sarakeryhma29_suorlk] [varchar](100) NULL,
	[Sarakeryhma29_kmaak] [varchar](100) NULL,
	[Sarakeryhma29_olotamm] [varchar](100) NULL,
	[Sarakeryhma29_olosyys] [varchar](100) NULL,
	[Sarakeryhma29_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma29_amas] [varchar](100) NULL,
	[Sarakeryhma29_koulk] [varchar](100) NULL,
	[Sarakeryhma29_jarj] [varchar](100) NULL,
	[Sarakeryhma29_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma30_ID] [nvarchar](128) NULL,
	[Sarakeryhma30_tyyppi] [varchar](100) NULL,
	[Sarakeryhma30_opp] [varchar](100) NULL,
	[Sarakeryhma30_opmala] [varchar](100) NULL,
	[Sarakeryhma30_opmopa] [varchar](100) NULL,
	[Sarakeryhma30_opmast] [varchar](100) NULL,
	[Sarakeryhma30_opm95opa] [varchar](100) NULL,
	[Sarakeryhma30_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma30_suorv] [varchar](100) NULL,
	[Sarakeryhma30_suorlk] [varchar](100) NULL,
	[Sarakeryhma30_kmaak] [varchar](100) NULL,
	[Sarakeryhma30_olotamm] [varchar](100) NULL,
	[Sarakeryhma30_olosyys] [varchar](100) NULL,
	[Sarakeryhma30_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma30_amas] [varchar](100) NULL,
	[Sarakeryhma30_koulk] [varchar](100) NULL,
	[Sarakeryhma30_jarj] [varchar](100) NULL,
	[Sarakeryhma30_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma31_ID] [nvarchar](128) NULL,
	[Sarakeryhma31_tyyppi] [varchar](100) NULL,
	[Sarakeryhma31_opp] [varchar](100) NULL,
	[Sarakeryhma31_opmala] [varchar](100) NULL,
	[Sarakeryhma31_opmopa] [varchar](100) NULL,
	[Sarakeryhma31_opmast] [varchar](100) NULL,
	[Sarakeryhma31_opm95opa] [varchar](100) NULL,
	[Sarakeryhma31_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma31_suorv] [varchar](100) NULL,
	[Sarakeryhma31_suorlk] [varchar](100) NULL,
	[Sarakeryhma31_kmaak] [varchar](100) NULL,
	[Sarakeryhma31_olotamm] [varchar](100) NULL,
	[Sarakeryhma31_olosyys] [varchar](100) NULL,
	[Sarakeryhma31_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma31_amas] [varchar](100) NULL,
	[Sarakeryhma31_koulk] [varchar](100) NULL,
	[Sarakeryhma31_jarj] [varchar](100) NULL,
	[Sarakeryhma31_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma32_ID] [nvarchar](128) NULL,
	[Sarakeryhma32_tyyppi] [varchar](100) NULL,
	[Sarakeryhma32_opp] [varchar](100) NULL,
	[Sarakeryhma32_opmala] [varchar](100) NULL,
	[Sarakeryhma32_opmopa] [varchar](100) NULL,
	[Sarakeryhma32_opmast] [varchar](100) NULL,
	[Sarakeryhma32_opm95opa] [varchar](100) NULL,
	[Sarakeryhma32_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma32_suorv] [varchar](100) NULL,
	[Sarakeryhma32_suorlk] [varchar](100) NULL,
	[Sarakeryhma32_kmaak] [varchar](100) NULL,
	[Sarakeryhma32_olotamm] [varchar](100) NULL,
	[Sarakeryhma32_olosyys] [varchar](100) NULL,
	[Sarakeryhma32_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma32_amas] [varchar](100) NULL,
	[Sarakeryhma32_koulk] [varchar](100) NULL,
	[Sarakeryhma32_jarj] [varchar](100) NULL,
	[Sarakeryhma32_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma33_ID] [nvarchar](128) NULL,
	[Sarakeryhma33_tyyppi] [varchar](100) NULL,
	[Sarakeryhma33_opp] [varchar](100) NULL,
	[Sarakeryhma33_opmala] [varchar](100) NULL,
	[Sarakeryhma33_opmopa] [varchar](100) NULL,
	[Sarakeryhma33_opmast] [varchar](100) NULL,
	[Sarakeryhma33_opm95opa] [varchar](100) NULL,
	[Sarakeryhma33_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma33_suorv] [varchar](100) NULL,
	[Sarakeryhma33_suorlk] [varchar](100) NULL,
	[Sarakeryhma33_kmaak] [varchar](100) NULL,
	[Sarakeryhma33_olotamm] [varchar](100) NULL,
	[Sarakeryhma33_olosyys] [varchar](100) NULL,
	[Sarakeryhma33_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma33_amas] [varchar](100) NULL,
	[Sarakeryhma33_koulk] [varchar](100) NULL,
	[Sarakeryhma33_jarj] [varchar](100) NULL,
	[Sarakeryhma33_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma34_ID] [nvarchar](128) NULL,
	[Sarakeryhma34_tyyppi] [varchar](100) NULL,
	[Sarakeryhma34_opp] [varchar](100) NULL,
	[Sarakeryhma34_opmala] [varchar](100) NULL,
	[Sarakeryhma34_opmopa] [varchar](100) NULL,
	[Sarakeryhma34_opmast] [varchar](100) NULL,
	[Sarakeryhma34_opm95opa] [varchar](100) NULL,
	[Sarakeryhma34_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma34_suorv] [varchar](100) NULL,
	[Sarakeryhma34_suorlk] [varchar](100) NULL,
	[Sarakeryhma34_kmaak] [varchar](100) NULL,
	[Sarakeryhma34_olotamm] [varchar](100) NULL,
	[Sarakeryhma34_olosyys] [varchar](100) NULL,
	[Sarakeryhma34_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma34_amas] [varchar](100) NULL,
	[Sarakeryhma34_koulk] [varchar](100) NULL,
	[Sarakeryhma34_jarj] [varchar](100) NULL,
	[Sarakeryhma34_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma35_ID] [nvarchar](128) NULL,
	[Sarakeryhma35_tyyppi] [varchar](100) NULL,
	[Sarakeryhma35_opp] [varchar](100) NULL,
	[Sarakeryhma35_opmala] [varchar](100) NULL,
	[Sarakeryhma35_opmopa] [varchar](100) NULL,
	[Sarakeryhma35_opmast] [varchar](100) NULL,
	[Sarakeryhma35_opm95opa] [varchar](100) NULL,
	[Sarakeryhma35_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma35_suorv] [varchar](100) NULL,
	[Sarakeryhma35_suorlk] [varchar](100) NULL,
	[Sarakeryhma35_kmaak] [varchar](100) NULL,
	[Sarakeryhma35_olotamm] [varchar](100) NULL,
	[Sarakeryhma35_olosyys] [varchar](100) NULL,
	[Sarakeryhma35_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma35_amas] [varchar](100) NULL,
	[Sarakeryhma35_koulk] [varchar](100) NULL,
	[Sarakeryhma35_jarj] [varchar](100) NULL,
	[Sarakeryhma35_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma36_ID] [nvarchar](128) NULL,
	[Sarakeryhma36_tyyppi] [varchar](100) NULL,
	[Sarakeryhma36_opp] [varchar](100) NULL,
	[Sarakeryhma36_opmala] [varchar](100) NULL,
	[Sarakeryhma36_opmopa] [varchar](100) NULL,
	[Sarakeryhma36_opmast] [varchar](100) NULL,
	[Sarakeryhma36_opm95opa] [varchar](100) NULL,
	[Sarakeryhma36_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma36_suorv] [varchar](100) NULL,
	[Sarakeryhma36_suorlk] [varchar](100) NULL,
	[Sarakeryhma36_kmaak] [varchar](100) NULL,
	[Sarakeryhma36_olotamm] [varchar](100) NULL,
	[Sarakeryhma36_olosyys] [varchar](100) NULL,
	[Sarakeryhma36_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma36_amas] [varchar](100) NULL,
	[Sarakeryhma36_koulk] [varchar](100) NULL,
	[Sarakeryhma36_jarj] [varchar](100) NULL,
	[Sarakeryhma36_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma37_ID] [nvarchar](128) NULL,
	[Sarakeryhma37_tyyppi] [varchar](100) NULL,
	[Sarakeryhma37_opp] [varchar](100) NULL,
	[Sarakeryhma37_opmala] [varchar](100) NULL,
	[Sarakeryhma37_opmopa] [varchar](100) NULL,
	[Sarakeryhma37_opmast] [varchar](100) NULL,
	[Sarakeryhma37_opm95opa] [varchar](100) NULL,
	[Sarakeryhma37_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma37_suorv] [varchar](100) NULL,
	[Sarakeryhma37_suorlk] [varchar](100) NULL,
	[Sarakeryhma37_kmaak] [varchar](100) NULL,
	[Sarakeryhma37_olotamm] [varchar](100) NULL,
	[Sarakeryhma37_olosyys] [varchar](100) NULL,
	[Sarakeryhma37_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma37_amas] [varchar](100) NULL,
	[Sarakeryhma37_koulk] [varchar](100) NULL,
	[Sarakeryhma37_jarj] [varchar](100) NULL,
	[Sarakeryhma37_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma38_ID] [nvarchar](128) NULL,
	[Sarakeryhma38_tyyppi] [varchar](100) NULL,
	[Sarakeryhma38_opp] [varchar](100) NULL,
	[Sarakeryhma38_opmala] [varchar](100) NULL,
	[Sarakeryhma38_opmopa] [varchar](100) NULL,
	[Sarakeryhma38_opmast] [varchar](100) NULL,
	[Sarakeryhma38_opm95opa] [varchar](100) NULL,
	[Sarakeryhma38_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma38_suorv] [varchar](100) NULL,
	[Sarakeryhma38_suorlk] [varchar](100) NULL,
	[Sarakeryhma38_kmaak] [varchar](100) NULL,
	[Sarakeryhma38_olotamm] [varchar](100) NULL,
	[Sarakeryhma38_olosyys] [varchar](100) NULL,
	[Sarakeryhma38_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma38_amas] [varchar](100) NULL,
	[Sarakeryhma38_koulk] [varchar](100) NULL,
	[Sarakeryhma38_jarj] [varchar](100) NULL,
	[Sarakeryhma38_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma39_ID] [nvarchar](128) NULL,
	[Sarakeryhma39_tyyppi] [varchar](100) NULL,
	[Sarakeryhma39_opp] [varchar](100) NULL,
	[Sarakeryhma39_opmala] [varchar](100) NULL,
	[Sarakeryhma39_opmopa] [varchar](100) NULL,
	[Sarakeryhma39_opmast] [varchar](100) NULL,
	[Sarakeryhma39_opm95opa] [varchar](100) NULL,
	[Sarakeryhma39_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma39_suorv] [varchar](100) NULL,
	[Sarakeryhma39_suorlk] [varchar](100) NULL,
	[Sarakeryhma39_kmaak] [varchar](100) NULL,
	[Sarakeryhma39_olotamm] [varchar](100) NULL,
	[Sarakeryhma39_olosyys] [varchar](100) NULL,
	[Sarakeryhma39_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma39_amas] [varchar](100) NULL,
	[Sarakeryhma39_koulk] [varchar](100) NULL,
	[Sarakeryhma39_jarj] [varchar](100) NULL,
	[Sarakeryhma39_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma40_ID] [nvarchar](128) NULL,
	[Sarakeryhma40_tyyppi] [varchar](100) NULL,
	[Sarakeryhma40_opp] [varchar](100) NULL,
	[Sarakeryhma40_opmala] [varchar](100) NULL,
	[Sarakeryhma40_opmopa] [varchar](100) NULL,
	[Sarakeryhma40_opmast] [varchar](100) NULL,
	[Sarakeryhma40_opm95opa] [varchar](100) NULL,
	[Sarakeryhma40_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma40_suorv] [varchar](100) NULL,
	[Sarakeryhma40_suorlk] [varchar](100) NULL,
	[Sarakeryhma40_kmaak] [varchar](100) NULL,
	[Sarakeryhma40_olotamm] [varchar](100) NULL,
	[Sarakeryhma40_olosyys] [varchar](100) NULL,
	[Sarakeryhma40_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma40_amas] [varchar](100) NULL,
	[Sarakeryhma40_koulk] [varchar](100) NULL,
	[Sarakeryhma40_jarj] [varchar](100) NULL,
	[Sarakeryhma40_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma41_ID] [nvarchar](128) NULL,
	[Sarakeryhma41_tyyppi] [varchar](100) NULL,
	[Sarakeryhma41_opp] [varchar](100) NULL,
	[Sarakeryhma41_opmala] [varchar](100) NULL,
	[Sarakeryhma41_opmopa] [varchar](100) NULL,
	[Sarakeryhma41_opmast] [varchar](100) NULL,
	[Sarakeryhma41_opm95opa] [varchar](100) NULL,
	[Sarakeryhma41_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma41_suorv] [varchar](100) NULL,
	[Sarakeryhma41_suorlk] [varchar](100) NULL,
	[Sarakeryhma41_kmaak] [varchar](100) NULL,
	[Sarakeryhma41_olotamm] [varchar](100) NULL,
	[Sarakeryhma41_olosyys] [varchar](100) NULL,
	[Sarakeryhma41_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma41_amas] [varchar](100) NULL,
	[Sarakeryhma41_koulk] [varchar](100) NULL,
	[Sarakeryhma41_jarj] [varchar](100) NULL,
	[Sarakeryhma41_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma42_ID] [nvarchar](128) NULL,
	[Sarakeryhma42_tyyppi] [varchar](100) NULL,
	[Sarakeryhma42_opp] [varchar](100) NULL,
	[Sarakeryhma42_opmala] [varchar](100) NULL,
	[Sarakeryhma42_opmopa] [varchar](100) NULL,
	[Sarakeryhma42_opmast] [varchar](100) NULL,
	[Sarakeryhma42_opm95opa] [varchar](100) NULL,
	[Sarakeryhma42_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma42_suorv] [varchar](100) NULL,
	[Sarakeryhma42_suorlk] [varchar](100) NULL,
	[Sarakeryhma42_kmaak] [varchar](100) NULL,
	[Sarakeryhma42_olotamm] [varchar](100) NULL,
	[Sarakeryhma42_olosyys] [varchar](100) NULL,
	[Sarakeryhma42_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma42_amas] [varchar](100) NULL,
	[Sarakeryhma42_koulk] [varchar](100) NULL,
	[Sarakeryhma42_jarj] [varchar](100) NULL,
	[Sarakeryhma42_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma43_ID] [nvarchar](128) NULL,
	[Sarakeryhma43_tyyppi] [varchar](100) NULL,
	[Sarakeryhma43_opp] [varchar](100) NULL,
	[Sarakeryhma43_opmala] [varchar](100) NULL,
	[Sarakeryhma43_opmopa] [varchar](100) NULL,
	[Sarakeryhma43_opmast] [varchar](100) NULL,
	[Sarakeryhma43_opm95opa] [varchar](100) NULL,
	[Sarakeryhma43_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma43_suorv] [varchar](100) NULL,
	[Sarakeryhma43_suorlk] [varchar](100) NULL,
	[Sarakeryhma43_kmaak] [varchar](100) NULL,
	[Sarakeryhma43_olotamm] [varchar](100) NULL,
	[Sarakeryhma43_olosyys] [varchar](100) NULL,
	[Sarakeryhma43_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma43_amas] [varchar](100) NULL,
	[Sarakeryhma43_koulk] [varchar](100) NULL,
	[Sarakeryhma43_jarj] [varchar](100) NULL,
	[Sarakeryhma43_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma44_ID] [nvarchar](128) NULL,
	[Sarakeryhma44_tyyppi] [varchar](100) NULL,
	[Sarakeryhma44_opp] [varchar](100) NULL,
	[Sarakeryhma44_opmala] [varchar](100) NULL,
	[Sarakeryhma44_opmopa] [varchar](100) NULL,
	[Sarakeryhma44_opmast] [varchar](100) NULL,
	[Sarakeryhma44_opm95opa] [varchar](100) NULL,
	[Sarakeryhma44_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma44_suorv] [varchar](100) NULL,
	[Sarakeryhma44_suorlk] [varchar](100) NULL,
	[Sarakeryhma44_kmaak] [varchar](100) NULL,
	[Sarakeryhma44_olotamm] [varchar](100) NULL,
	[Sarakeryhma44_olosyys] [varchar](100) NULL,
	[Sarakeryhma44_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma44_amas] [varchar](100) NULL,
	[Sarakeryhma44_koulk] [varchar](100) NULL,
	[Sarakeryhma44_jarj] [varchar](100) NULL,
	[Sarakeryhma44_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma45_ID] [nvarchar](128) NULL,
	[Sarakeryhma45_tyyppi] [varchar](100) NULL,
	[Sarakeryhma45_opp] [varchar](100) NULL,
	[Sarakeryhma45_opmala] [varchar](100) NULL,
	[Sarakeryhma45_opmopa] [varchar](100) NULL,
	[Sarakeryhma45_opmast] [varchar](100) NULL,
	[Sarakeryhma45_opm95opa] [varchar](100) NULL,
	[Sarakeryhma45_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma45_suorv] [varchar](100) NULL,
	[Sarakeryhma45_suorlk] [varchar](100) NULL,
	[Sarakeryhma45_kmaak] [varchar](100) NULL,
	[Sarakeryhma45_olotamm] [varchar](100) NULL,
	[Sarakeryhma45_olosyys] [varchar](100) NULL,
	[Sarakeryhma45_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma45_amas] [varchar](100) NULL,
	[Sarakeryhma45_koulk] [varchar](100) NULL,
	[Sarakeryhma45_jarj] [varchar](100) NULL,
	[Sarakeryhma45_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma46_ID] [nvarchar](128) NULL,
	[Sarakeryhma46_tyyppi] [varchar](100) NULL,
	[Sarakeryhma46_opp] [varchar](100) NULL,
	[Sarakeryhma46_opmala] [varchar](100) NULL,
	[Sarakeryhma46_opmopa] [varchar](100) NULL,
	[Sarakeryhma46_opmast] [varchar](100) NULL,
	[Sarakeryhma46_opm95opa] [varchar](100) NULL,
	[Sarakeryhma46_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma46_suorv] [varchar](100) NULL,
	[Sarakeryhma46_suorlk] [varchar](100) NULL,
	[Sarakeryhma46_kmaak] [varchar](100) NULL,
	[Sarakeryhma46_olotamm] [varchar](100) NULL,
	[Sarakeryhma46_olosyys] [varchar](100) NULL,
	[Sarakeryhma46_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma46_amas] [varchar](100) NULL,
	[Sarakeryhma46_koulk] [varchar](100) NULL,
	[Sarakeryhma46_jarj] [varchar](100) NULL,
	[Sarakeryhma46_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma47_ID] [nvarchar](128) NULL,
	[Sarakeryhma47_tyyppi] [varchar](100) NULL,
	[Sarakeryhma47_opp] [varchar](100) NULL,
	[Sarakeryhma47_opmala] [varchar](100) NULL,
	[Sarakeryhma47_opmopa] [varchar](100) NULL,
	[Sarakeryhma47_opmast] [varchar](100) NULL,
	[Sarakeryhma47_opm95opa] [varchar](100) NULL,
	[Sarakeryhma47_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma47_suorv] [varchar](100) NULL,
	[Sarakeryhma47_suorlk] [varchar](100) NULL,
	[Sarakeryhma47_kmaak] [varchar](100) NULL,
	[Sarakeryhma47_olotamm] [varchar](100) NULL,
	[Sarakeryhma47_olosyys] [varchar](100) NULL,
	[Sarakeryhma47_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma47_amas] [varchar](100) NULL,
	[Sarakeryhma47_koulk] [varchar](100) NULL,
	[Sarakeryhma47_jarj] [varchar](100) NULL,
	[Sarakeryhma47_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma48_ID] [nvarchar](128) NULL,
	[Sarakeryhma48_tyyppi] [varchar](100) NULL,
	[Sarakeryhma48_opp] [varchar](100) NULL,
	[Sarakeryhma48_opmala] [varchar](100) NULL,
	[Sarakeryhma48_opmopa] [varchar](100) NULL,
	[Sarakeryhma48_opmast] [varchar](100) NULL,
	[Sarakeryhma48_opm95opa] [varchar](100) NULL,
	[Sarakeryhma48_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma48_suorv] [varchar](100) NULL,
	[Sarakeryhma48_suorlk] [varchar](100) NULL,
	[Sarakeryhma48_kmaak] [varchar](100) NULL,
	[Sarakeryhma48_olotamm] [varchar](100) NULL,
	[Sarakeryhma48_olosyys] [varchar](100) NULL,
	[Sarakeryhma48_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma48_amas] [varchar](100) NULL,
	[Sarakeryhma48_koulk] [varchar](100) NULL,
	[Sarakeryhma48_jarj] [varchar](100) NULL,
	[Sarakeryhma48_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma49_ID] [nvarchar](128) NULL,
	[Sarakeryhma49_tyyppi] [varchar](100) NULL,
	[Sarakeryhma49_opp] [varchar](100) NULL,
	[Sarakeryhma49_opmala] [varchar](100) NULL,
	[Sarakeryhma49_opmopa] [varchar](100) NULL,
	[Sarakeryhma49_opmast] [varchar](100) NULL,
	[Sarakeryhma49_opm95opa] [varchar](100) NULL,
	[Sarakeryhma49_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma49_suorv] [varchar](100) NULL,
	[Sarakeryhma49_suorlk] [varchar](100) NULL,
	[Sarakeryhma49_kmaak] [varchar](100) NULL,
	[Sarakeryhma49_olotamm] [varchar](100) NULL,
	[Sarakeryhma49_olosyys] [varchar](100) NULL,
	[Sarakeryhma49_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma49_amas] [varchar](100) NULL,
	[Sarakeryhma49_koulk] [varchar](100) NULL,
	[Sarakeryhma49_jarj] [varchar](100) NULL,
	[Sarakeryhma49_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma50_ID] [nvarchar](128) NULL,
	[Sarakeryhma50_tyyppi] [varchar](100) NULL,
	[Sarakeryhma50_opp] [varchar](100) NULL,
	[Sarakeryhma50_opmala] [varchar](100) NULL,
	[Sarakeryhma50_opmopa] [varchar](100) NULL,
	[Sarakeryhma50_opmast] [varchar](100) NULL,
	[Sarakeryhma50_opm95opa] [varchar](100) NULL,
	[Sarakeryhma50_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma50_suorv] [varchar](100) NULL,
	[Sarakeryhma50_suorlk] [varchar](100) NULL,
	[Sarakeryhma50_kmaak] [varchar](100) NULL,
	[Sarakeryhma50_olotamm] [varchar](100) NULL,
	[Sarakeryhma50_olosyys] [varchar](100) NULL,
	[Sarakeryhma50_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma50_amas] [varchar](100) NULL,
	[Sarakeryhma50_koulk] [varchar](100) NULL,
	[Sarakeryhma50_jarj] [varchar](100) NULL,
	[Sarakeryhma50_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma51_ID] [nvarchar](128) NULL,
	[Sarakeryhma51_tyyppi] [varchar](100) NULL,
	[Sarakeryhma51_opp] [varchar](100) NULL,
	[Sarakeryhma51_opmala] [varchar](100) NULL,
	[Sarakeryhma51_opmopa] [varchar](100) NULL,
	[Sarakeryhma51_opmast] [varchar](100) NULL,
	[Sarakeryhma51_opm95opa] [varchar](100) NULL,
	[Sarakeryhma51_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma51_suorv] [varchar](100) NULL,
	[Sarakeryhma51_suorlk] [varchar](100) NULL,
	[Sarakeryhma51_kmaak] [varchar](100) NULL,
	[Sarakeryhma51_olotamm] [varchar](100) NULL,
	[Sarakeryhma51_olosyys] [varchar](100) NULL,
	[Sarakeryhma51_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma51_amas] [varchar](100) NULL,
	[Sarakeryhma51_koulk] [varchar](100) NULL,
	[Sarakeryhma51_jarj] [varchar](100) NULL,
	[Sarakeryhma51_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma52_ID] [nvarchar](128) NULL,
	[Sarakeryhma52_tyyppi] [varchar](100) NULL,
	[Sarakeryhma52_opp] [varchar](100) NULL,
	[Sarakeryhma52_opmala] [varchar](100) NULL,
	[Sarakeryhma52_opmopa] [varchar](100) NULL,
	[Sarakeryhma52_opmast] [varchar](100) NULL,
	[Sarakeryhma52_opm95opa] [varchar](100) NULL,
	[Sarakeryhma52_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma52_suorv] [varchar](100) NULL,
	[Sarakeryhma52_suorlk] [varchar](100) NULL,
	[Sarakeryhma52_kmaak] [varchar](100) NULL,
	[Sarakeryhma52_olotamm] [varchar](100) NULL,
	[Sarakeryhma52_olosyys] [varchar](100) NULL,
	[Sarakeryhma52_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma52_amas] [varchar](100) NULL,
	[Sarakeryhma52_koulk] [varchar](100) NULL,
	[Sarakeryhma52_jarj] [varchar](100) NULL,
	[Sarakeryhma52_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma53_ID] [nvarchar](128) NULL,
	[Sarakeryhma53_tyyppi] [varchar](100) NULL,
	[Sarakeryhma53_opp] [varchar](100) NULL,
	[Sarakeryhma53_opmala] [varchar](100) NULL,
	[Sarakeryhma53_opmopa] [varchar](100) NULL,
	[Sarakeryhma53_opmast] [varchar](100) NULL,
	[Sarakeryhma53_opm95opa] [varchar](100) NULL,
	[Sarakeryhma53_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma53_suorv] [varchar](100) NULL,
	[Sarakeryhma53_suorlk] [varchar](100) NULL,
	[Sarakeryhma53_kmaak] [varchar](100) NULL,
	[Sarakeryhma53_olotamm] [varchar](100) NULL,
	[Sarakeryhma53_olosyys] [varchar](100) NULL,
	[Sarakeryhma53_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma53_amas] [varchar](100) NULL,
	[Sarakeryhma53_koulk] [varchar](100) NULL,
	[Sarakeryhma53_jarj] [varchar](100) NULL,
	[Sarakeryhma53_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma54_ID] [nvarchar](128) NULL,
	[Sarakeryhma54_tyyppi] [varchar](100) NULL,
	[Sarakeryhma54_opp] [varchar](100) NULL,
	[Sarakeryhma54_opmala] [varchar](100) NULL,
	[Sarakeryhma54_opmopa] [varchar](100) NULL,
	[Sarakeryhma54_opmast] [varchar](100) NULL,
	[Sarakeryhma54_opm95opa] [varchar](100) NULL,
	[Sarakeryhma54_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma54_suorv] [varchar](100) NULL,
	[Sarakeryhma54_suorlk] [varchar](100) NULL,
	[Sarakeryhma54_kmaak] [varchar](100) NULL,
	[Sarakeryhma54_olotamm] [varchar](100) NULL,
	[Sarakeryhma54_olosyys] [varchar](100) NULL,
	[Sarakeryhma54_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma54_amas] [varchar](100) NULL,
	[Sarakeryhma54_koulk] [varchar](100) NULL,
	[Sarakeryhma54_jarj] [varchar](100) NULL,
	[Sarakeryhma54_tutkintolaji] [varchar](5) NULL,
	[Sarakeryhma55_ID] [nvarchar](128) NULL,
	[Sarakeryhma55_tyyppi] [varchar](100) NULL,
	[Sarakeryhma55_opp] [varchar](100) NULL,
	[Sarakeryhma55_opmala] [varchar](100) NULL,
	[Sarakeryhma55_opmopa] [varchar](100) NULL,
	[Sarakeryhma55_opmast] [varchar](100) NULL,
	[Sarakeryhma55_opm95opa] [varchar](100) NULL,
	[Sarakeryhma55_koulutussektori] [varchar](100) NULL,
	[Sarakeryhma55_suorv] [varchar](100) NULL,
	[Sarakeryhma55_suorlk] [varchar](100) NULL,
	[Sarakeryhma55_kmaak] [varchar](100) NULL,
	[Sarakeryhma55_olotamm] [varchar](100) NULL,
	[Sarakeryhma55_olosyys] [varchar](100) NULL,
	[Sarakeryhma55_ptoim1r5] [varchar](100) NULL,
	[Sarakeryhma55_amas] [varchar](100) NULL,
	[Sarakeryhma55_koulk] [varchar](100) NULL,
	[Sarakeryhma55_jarj] [varchar](100) NULL,
	[Sarakeryhma55_tutkintolaji] [varchar](5) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet](
	[rivinumero] [int] NOT NULL,
	[tilv] [varchar](255) NULL,
	[tilv_date] [date] NULL,
	[lahde] [varchar](255) NULL,
	[opp] [nvarchar](5) NULL,
	[sp] [varchar](255) NULL,
	[syntv] [varchar](255) NULL,
	[aikielir1] [varchar](255) NULL,
	[alvv] [varchar](255) NULL,
	[allk] [varchar](255) NULL,
	[klaji] [varchar](255) NULL,
	[ophal] [varchar](255) NULL,
	[jarj] [varchar](255) NULL,
	[kkun] [varchar](255) NULL,
	[maak] [varchar](2) NOT NULL,
	[koulk] [varchar](255) NULL,
	[opmala] [varchar](2) NULL,
	[opmopa] [varchar](3) NULL,
	[opmast] [varchar](2) NULL,
	[opm95opa] [varchar](2) NULL,
	[koulutussektori] [varchar](26) NULL,
	[pohjkoulk] [varchar](255) NULL,
	[alvv_kk] [varchar](255) NULL,
	[allk_kk] [varchar](255) NULL,
	[ololk] [varchar](255) NULL,
	[rahlahde] [varchar](255) NULL,
	[koulutuslaji2] [varchar](255) NULL,
	[saavutettu_suorv] [varchar](255) NULL,
	[saavutettu_suorlk] [varchar](255) NULL,
	[saavutettu_tutkmaak] [varchar](255) NULL,
	[saavutettu_tutkjarj] [varchar](255) NULL,
	[saavutettu_tutkopp] [varchar](255) NULL,
	[saavutettu_tutkkoulk] [varchar](255) NULL,
	[saavutettu_tutkopmala] [varchar](255) NULL,
	[saavutettu_tutkopmopa] [varchar](255) NULL,
	[saavutettu_tutkopmast] [varchar](255) NULL,
	[saavutettu_tutkopm95opa] [varchar](255) NULL,
	[saavutettu_tutkkoulutussektori] [varchar](255) NULL,
	[tarkasteluperiodi] [nvarchar](20) NOT NULL,
	[tarkasteluperiodi_char] [nvarchar](20) NOT NULL,
	[tietolahde] [varchar](255) NULL,
	[aineistorivinumero] [numeric](18, 0) NULL,
	[lkm_int] [int] NULL,
	[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](255) NOT NULL,
	[1a_jarjestys] [nvarchar](255) NOT NULL,
	[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa] [nvarchar](255) NOT NULL,
	[1b_jarjestys] [nvarchar](255) NOT NULL,
	[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1c_jarjestys] [nvarchar](255) NOT NULL,
	[1d Aloittaneista ilman tutkintoa opiskelua jatkavat koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1d_jarjestys] [nvarchar](255) NOT NULL,
	[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1e_jarjestys] [nvarchar](255) NOT NULL,
	[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1f_jarjestys] [nvarchar](255) NOT NULL,
	[1g Aloittaneista alkuperäisen tutkintolajin opiskelua jatkavat koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1g_jarjestys] [nvarchar](255) NOT NULL,
	[1h Aloittaneista muun tutkintolajin opiskelua jatkavat koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1h_jarjestys] [nvarchar](255) NOT NULL,
	[2a Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](255) NOT NULL,
	[2a_jarjestys] [nvarchar](255) NOT NULL,
	[2b Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[2b_jarjestys] [nvarchar](255) NOT NULL,
	[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan] [nvarchar](255) NOT NULL,
	[2e_jarjestys] [nvarchar](255) NOT NULL,
	[2f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[2f_jarjestys] [nvarchar](255) NOT NULL,
	[2g Aloittaneista alkuperäisellä koulutusalalla opiskelua jatkavat koulutusalan mukaan] [nvarchar](255) NOT NULL,
	[2g_jarjestys] [nvarchar](255) NOT NULL,
	[2h Aloittaneista muulla koulutusalalla opiskelua jatkavat koulutusalan mukaan] [nvarchar](255) NOT NULL,
	[2h_jarjestys] [nvarchar](255) NOT NULL,
	[3a Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](255) NOT NULL,
	[3a_jarjestys] [nvarchar](255) NOT NULL,
	[3b Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[3b_jarjestys] [nvarchar](255) NOT NULL,
	[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](255) NOT NULL,
	[3e_jarjestys] [nvarchar](255) NOT NULL,
	[3f Aloittaneista muun opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](255) NOT NULL,
	[3f_jarjestys] [nvarchar](255) NOT NULL,
	[3g Aloittaneista alkuperäisellä opintoalalla (2002) opiskelua jatkavat opintoalan mukaan] [nvarchar](255) NOT NULL,
	[3g_jarjestys] [nvarchar](255) NOT NULL,
	[3h Aloittaneista muulla opintoalalla (2002) opiskelua jatkavat opintoalan mukaan] [nvarchar](255) NOT NULL,
	[3h_jarjestys] [nvarchar](255) NOT NULL,
	[4a Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto missä tahansa] [nvarchar](255) NOT NULL,
	[4a_jarjestys] [nvarchar](255) NOT NULL,
	[4b Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[4b_jarjestys] [nvarchar](255) NOT NULL,
	[4e Aloittaneista alkuperäisen koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan] [nvarchar](255) NOT NULL,
	[4e_jarjestys] [nvarchar](255) NOT NULL,
	[4f Aloittaneista muun koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan] [nvarchar](255) NOT NULL,
	[4f_jarjestys] [nvarchar](255) NOT NULL,
	[4g Aloittaneista alkuperäisellä järjestäjällä opiskelua jatkavat järjestäjän mukaan] [nvarchar](255) NOT NULL,
	[4g_jarjestys] [nvarchar](255) NOT NULL,
	[4h Aloittaneista muulla järjestäjällä opiskelua jatkavat järjestäjän mukaan] [nvarchar](255) NOT NULL,
	[4h_jarjestys] [nvarchar](255) NOT NULL,
	[5a Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto missä tahansa] [nvarchar](255) NOT NULL,
	[5a_jarjestys] [nvarchar](255) NOT NULL,
	[5b Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä] [nvarchar](255) NOT NULL,
	[5b_jarjestys] [nvarchar](255) NOT NULL,
	[5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] [nvarchar](255) NOT NULL,
	[5e_jarjestys] [nvarchar](255) NOT NULL,
	[5f Aloittaneista muussa oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] [nvarchar](255) NOT NULL,
	[5f_jarjestys] [nvarchar](255) NOT NULL,
	[5g Aloittaneista alkuperäisessä oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan] [nvarchar](255) NOT NULL,
	[5g_jarjestys] [nvarchar](255) NOT NULL,
	[5h Aloittaneista muussa oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan] [nvarchar](255) NOT NULL,
	[5h_jarjestys] [nvarchar](255) NOT NULL,
	[6a Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto missä tahansa] [nvarchar](255) NOT NULL,
	[6a_jarjestys] [nvarchar](255) NOT NULL,
	[6b Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä] [nvarchar](255) NOT NULL,
	[6b_jarjestys] [nvarchar](255) NOT NULL,
	[6e Aloittaneista alkuperäisessä maakunnassa tutkinnon suorittaneet maakunnan mukaan] [nvarchar](255) NOT NULL,
	[6e_jarjestys] [nvarchar](255) NOT NULL,
	[6f Aloittaneista muussa maakunnassa tutkinnon suorittaneet maakunnan mukaan] [nvarchar](255) NOT NULL,
	[6f_jarjestys] [nvarchar](255) NOT NULL,
	[6g Aloittaneista alkuperäisessä maakunnassa opiskelua jatkavat maakunnan mukaan] [nvarchar](255) NOT NULL,
	[6g_jarjestys] [nvarchar](255) NOT NULL,
	[6h Aloittaneista muussa maakunnassa opiskelua jatkavat maakunnan mukaan] [nvarchar](255) NOT NULL,
	[6h_jarjestys] [nvarchar](255) NOT NULL,
	[7a Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto missä tahansa] [nvarchar](255) NOT NULL,
	[7a_jarjestys] [nvarchar](255) NOT NULL,
	[7b Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[7b_jarjestys] [nvarchar](255) NOT NULL,
	[7e Aloittaneista alkuperäisen koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan] [nvarchar](255) NOT NULL,
	[7e_jarjestys] [nvarchar](255) NOT NULL,
	[7f Aloittaneista muun koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan] [nvarchar](255) NOT NULL,
	[7f_jarjestys] [nvarchar](255) NOT NULL,
	[7g Aloittaneista alkuperäisellä koulutussektorilla opiskelua jatkavat koulutussektorin mukaan] [nvarchar](255) NOT NULL,
	[7g_jarjestys] [nvarchar](255) NOT NULL,
	[7h Aloittaneista muulla koulutussektorilla opiskelua jatkavat koulutussektorin mukaan] [nvarchar](255) NOT NULL,
	[7h_jarjestys] [nvarchar](255) NOT NULL,
	[8a Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](255) NOT NULL,
	[8a_jarjestys] [nvarchar](255) NOT NULL,
	[8b Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[8b_jarjestys] [nvarchar](255) NOT NULL,
	[8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](255) NOT NULL,
	[8e_jarjestys] [nvarchar](255) NOT NULL,
	[8f Aloittaneista muun opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](255) NOT NULL,
	[8f_jarjestys] [nvarchar](255) NOT NULL,
	[8g Aloittaneista alkuperäisellä opintoalalla (1995) opiskelua jatkavat opintoalan mukaan] [nvarchar](255) NOT NULL,
	[8g_jarjestys] [nvarchar](255) NOT NULL,
	[8h Aloittaneista muulla opintoalalla (1995) opiskelua jatkavat opintoalan mukaan] [nvarchar](255) NOT NULL,
	[8h_jarjestys] [nvarchar](255) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_f_koulutukseen_sijoittuneet_2v_tarkastelu]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_f_koulutukseen_sijoittuneet_2v_tarkastelu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_f_koulutukseen_sijoittuneet_2v_tarkastelu](
	[aineistorivinumero] [int] NOT NULL,
	[tarkastelujakso] [nvarchar](20) NOT NULL,
	[tilv] [nvarchar](4) NOT NULL,
	[tilv_date] [date] NULL,
	[tutkryh] [nvarchar](10) NOT NULL,
	[suorv] [nvarchar](4) NOT NULL,
	[suorlk] [nvarchar](6) NOT NULL,
	[sp] [int] NOT NULL,
	[syntv] [nvarchar](8) NOT NULL,
	[aikielir1] [nvarchar](2) NOT NULL,
	[tutkkaskun] [nvarchar](3) NOT NULL,
	[kansalr1] [int] NOT NULL,
	[pohjmaa] [int] NOT NULL,
	[eumaa] [nvarchar](2) NOT NULL,
	[etamaa] [nvarchar](2) NOT NULL,
	[tunn] [nvarchar](10) NOT NULL,
	[jarj] [nvarchar](10) NOT NULL,
	[kkielir1] [nvarchar](4) NOT NULL,
	[tutklaja] [int] NOT NULL,
	[tutktav] [int] NOT NULL,
	[aikoul] [int] NOT NULL,
	[tutkmaak] [nvarchar](2) NOT NULL,
	[koulutus] [nvarchar](6) NULL,
	[oppilaitos] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_maakunta] [nvarchar](2) NULL,
	[monihaku] [int] NOT NULL,
	[paaasiallinen_toiminta] [int] NULL,
	[ammattiasema] [int] NULL,
	[lkm] [int] NOT NULL,
	[pohjkoulk] [nvarchar](6) NOT NULL,
	[tietolahde] [varchar](255) NOT NULL,
	[aineisto] [nvarchar](8) NOT NULL,
	[lukiokoulutuksessa] [int] NOT NULL,
	[ammatillisessa_koulutuksessa] [int] NOT NULL,
	[ammattikorkeakoulutuksessa] [int] NOT NULL,
	[yliopistokoulutuksessa] [int] NOT NULL,
	[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa] [int] NOT NULL,
	[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa] [int] NOT NULL,
	[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa] [int] NOT NULL,
	[koulutuksen_paattaneiden_toiminta] [int] NOT NULL,
	[rivinumero] [int] NOT NULL,
	[ika_1v] [nvarchar](10) NOT NULL,
	[ika_5v] [nvarchar](10) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu](
	[aineistorivinumero] [int] NOT NULL,
	[tarkastelujakso] [nvarchar](20) NOT NULL,
	[tilv] [nvarchar](4) NOT NULL,
	[tilv_date] [date] NULL,
	[tutkryh] [nvarchar](10) NOT NULL,
	[suorv] [nvarchar](4) NOT NULL,
	[suorlk] [nvarchar](6) NOT NULL,
	[sp] [int] NOT NULL,
	[syntv] [nvarchar](8) NOT NULL,
	[aikielir1] [nvarchar](2) NOT NULL,
	[tutkkaskun] [nvarchar](3) NOT NULL,
	[kansalr1] [int] NOT NULL,
	[pohjmaa] [int] NOT NULL,
	[eumaa] [nvarchar](2) NOT NULL,
	[etamaa] [nvarchar](2) NOT NULL,
	[tunn] [nvarchar](10) NOT NULL,
	[jarj] [nvarchar](10) NOT NULL,
	[kkielir1] [nvarchar](4) NOT NULL,
	[tutklaja] [int] NOT NULL,
	[tutktav] [int] NOT NULL,
	[aikoul] [int] NOT NULL,
	[tutkmaak] [nvarchar](2) NOT NULL,
	[koulutus] [nvarchar](6) NULL,
	[oppilaitos] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_maakunta] [nvarchar](2) NULL,
	[monihaku] [int] NOT NULL,
	[paaasiallinen_toiminta] [int] NULL,
	[ammattiasema] [int] NULL,
	[lkm] [int] NOT NULL,
	[pohjkoulk] [nvarchar](6) NOT NULL,
	[tietolahde] [varchar](255) NOT NULL,
	[aineisto] [nvarchar](8) NOT NULL,
	[lukiokoulutuksessa] [int] NOT NULL,
	[ammatillisessa_koulutuksessa] [int] NOT NULL,
	[ammattikorkeakoulutuksessa] [int] NOT NULL,
	[yliopistokoulutuksessa] [int] NOT NULL,
	[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa] [int] NOT NULL,
	[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa] [int] NOT NULL,
	[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa] [int] NOT NULL,
	[koulutuksen_paattaneiden_toiminta] [int] NOT NULL,
	[rivinumero] [int] NOT NULL,
	[ika_1v] [nvarchar](10) NOT NULL,
	[ika_5v] [nvarchar](10) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sukupuoli_koodi] [nvarchar](10) NULL,
	[aidinkieli_versio1_koodi] [nvarchar](2) NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[koulutusluokitus_avain] [nvarchar](6) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[oppisopimuskoulutus_koodi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_koodi] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] [nvarchar](2) NULL,
	[ammatillinen_koulutus_ryhma] [nvarchar](10) NULL,
	[ammatillinen_koulutus_ryhma_avain] [nvarchar](10) NULL,
	[nuorten_aikuisten_koulutus_amm_koodi] [nvarchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[ika_avain] [nvarchar](10) NULL,
	[henkiloiden_lkm] [int] NULL,
	[lulkm] [int] NULL,
	[lukoulk] [varchar](6) NULL,
	[lusuorv] [varchar](4) NULL,
	[luaikoul] [varchar](1) NULL,
	[lu_ika] [int] NULL,
	[lu_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammlkm] [int] NULL,
	[ammkoulk] [varchar](6) NULL,
	[ammsuorv] [varchar](4) NULL,
	[ammoppis] [varchar](1) NULL,
	[ammtutklaja] [varchar](1) NULL,
	[ammtutktav] [varchar](1) NULL,
	[amm_ika] [int] NULL,
	[amm_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[opistlkm] [int] NULL,
	[opistkoulk] [varchar](6) NULL,
	[opistsuorv] [varchar](4) NULL,
	[opist_ika] [int] NULL,
	[opist_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammkalkm] [int] NULL,
	[ammkakoulk] [varchar](6) NULL,
	[ammkasuorv] [varchar](4) NULL,
	[ammka_ika] [int] NULL,
	[ammka_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[amklkm] [int] NULL,
	[amkkoulk] [varchar](6) NULL,
	[amksuorv] [varchar](4) NULL,
	[amkaikoul] [varchar](1) NULL,
	[amk_ika] [int] NULL,
	[amk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[akklkm] [int] NULL,
	[akkkoulk] [varchar](6) NULL,
	[akksuorv] [varchar](4) NULL,
	[akk_ika] [int] NULL,
	[akk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ylamklkm] [int] NULL,
	[ylamkkoulk] [varchar](6) NULL,
	[ylamksuorv] [varchar](4) NULL,
	[ylamk_ika] [int] NULL,
	[ylamk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ykklkm] [int] NULL,
	[ykkkoulk] [varchar](6) NULL,
	[ykksuorv] [varchar](4) NULL,
	[ykk_ika] [int] NULL,
	[ykk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[laakerlkm] [int] NULL,
	[laakerkoulk] [varchar](6) NULL,
	[laakersuorv] [varchar](4) NULL,
	[laaker_ika] [int] NULL,
	[laaker_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[lislkm] [int] NULL,
	[liskoulk] [varchar](6) NULL,
	[lissuorv] [varchar](4) NULL,
	[lis_ika] [int] NULL,
	[lis_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[tohtlkm] [int] NULL,
	[tohtkoulk] [varchar](6) NULL,
	[tohtsuorv] [varchar](4) NULL,
	[toht_ika] [int] NULL,
	[toht_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[tarkastelujakso_koodi] [nvarchar](20) NOT NULL,
	[tutkintojen_maara_amm_avain] [nvarchar](11) NULL,
	[tutkintojen_maara_amk_avain] [nvarchar](11) NULL,
	[tutkintojen_maara_akk_avain] [nvarchar](11) NULL,
	[tutkintojen_maara_ykk_avain] [nvarchar](11) NULL,
	[tutkinto_suoritettu_lu_avain] [varchar](9) NOT NULL,
	[tutkinto_suoritettu_amm_avain] [varchar](10) NOT NULL,
	[tutkinto_suoritettu_opisto_avain] [varchar](13) NOT NULL,
	[tutkinto_suoritettu_ammka_avain] [varchar](12) NOT NULL,
	[tutkinto_suoritettu_amk_avain] [varchar](10) NOT NULL,
	[tutkinto_suoritettu_akk_avain] [varchar](10) NOT NULL,
	[tutkinto_suoritettu_ylamk_avain] [varchar](11) NOT NULL,
	[tutkinto_suoritettu_ykk_avain] [varchar](10) NOT NULL,
	[tutkinto_suoritettu_laaker_avain] [varchar](13) NOT NULL,
	[tutkinto_suoritettu_lis_avain] [varchar](10) NOT NULL,
	[tutkinto_suoritettu_toht_avain] [varchar](11) NOT NULL,
	[yliopistotutkinto_myohempi_suoritettu] [varchar](1) NULL,
	[yo_jatkotutkinto_myohempi_suoritettu] [varchar](1) NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_myohempi_suoritettu] [varchar](1) NULL,
	[korkeakoulututkinto_myohempi_suoritettu] [varchar](1) NULL,
	[toisen_asteen_tutkinto_myohempi_suoritettu] [varchar](1) NULL,
	[ammatillisen_tutkinto_myohempi_suoritettu_ryhma1] [varchar](1) NOT NULL,
	[ammatillisen_tutkinto_myohempi_suoritettu_ryhma2] [varchar](1) NOT NULL,
	[ammatillisen_tutkinto_myohempi_suoritettu_ryhma3] [varchar](1) NOT NULL,
	[lu_sama_myohempi_koulutusala2002_avain] [varchar](34) NOT NULL,
	[amm_sama_myohempi_koulutusala2002_avain] [varchar](35) NOT NULL,
	[opist_sama_myohempi_koulutusala2002_avain] [varchar](37) NOT NULL,
	[ammka_sama_myohempi_koulutusala2002_avain] [varchar](37) NOT NULL,
	[akk_sama_myohempi_koulutusala2002_avain] [varchar](35) NOT NULL,
	[amk_sama_myohempi_koulutusala2002_avain] [varchar](35) NOT NULL,
	[ylamk_sama_myohempi_koulutusala2002_avain] [varchar](37) NOT NULL,
	[ykk_sama_myohempi_koulutusala2002_avain] [varchar](35) NOT NULL,
	[laaker_sama_myohempi_koulutusala2002_avain] [varchar](38) NOT NULL,
	[lis_sama_myohempi_koulutusala2002_avain] [varchar](35) NOT NULL,
	[toht_sama_myohempi_koulutusala2002_avain] [varchar](36) NOT NULL,
	[yliopistotutkinto_sama_myohempi_koulutusala2002_avain] [varchar](49) NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_koulutusala2002_avain] [varchar](48) NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002_avain] [varchar](78) NOT NULL,
	[korkeakoulututkinto_sama_myohempi_koulutusala2002_avain] [varchar](51) NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_koulutusala2002_avain] [varchar](54) NOT NULL,
	[lu_sama_myohempi_opintoala2002_avain] [varchar](32) NOT NULL,
	[amm_sama_myohempi_opintoala2002_avain] [varchar](33) NOT NULL,
	[opist_sama_myohempi_opintoala2002_avain] [varchar](35) NOT NULL,
	[ammka_sama_myohempi_opintoala2002_avain] [varchar](35) NOT NULL,
	[akk_sama_myohempi_opintoala2002_avain] [varchar](33) NOT NULL,
	[amk_sama_myohempi_opintoala2002_avain] [varchar](33) NOT NULL,
	[ylamk_sama_myohempi_opintoala2002_avain] [varchar](35) NOT NULL,
	[ykk_sama_myohempi_opintoala2002_avain] [varchar](33) NOT NULL,
	[laaker_sama_myohempi_opintoala2002_avain] [varchar](36) NOT NULL,
	[lis_sama_myohempi_opintoala2002_avain] [varchar](33) NOT NULL,
	[toht_sama_myohempi_opintoala2002_avain] [varchar](34) NOT NULL,
	[yliopistotutkinto_sama_myohempi_opintoala2002_avain] [varchar](47) NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_opintoala2002_avain] [varchar](46) NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002_avain] [varchar](76) NOT NULL,
	[korkeakoulututkinto_sama_myohempi_opintoala2002_avain] [varchar](49) NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_opintoala2002_avain] [varchar](52) NOT NULL,
	[lu_sama_myohempi_opintoala1995_avain] [varchar](32) NOT NULL,
	[amm_sama_myohempi_opintoala1995_avain] [varchar](33) NOT NULL,
	[opist_sama_myohempi_opintoala1995_avain] [varchar](35) NOT NULL,
	[ammka_sama_myohempi_opintoala1995_avain] [varchar](35) NOT NULL,
	[akk_sama_myohempi_opintoala1995_avain] [varchar](33) NOT NULL,
	[amk_sama_myohempi_opintoala1995_avain] [varchar](33) NOT NULL,
	[ylamk_sama_myohempi_opintoala1995_avain] [varchar](35) NOT NULL,
	[ykk_sama_myohempi_opintoala1995_avain] [varchar](33) NOT NULL,
	[laaker_sama_myohempi_opintoala1995_avain] [varchar](36) NOT NULL,
	[lis_sama_myohempi_opintoala1995_avain] [varchar](33) NOT NULL,
	[toht_sama_myohempi_opintoala1995_avain] [varchar](34) NOT NULL,
	[yliopistotutkinto_sama_myohempi_opintoala1995_avain] [varchar](47) NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_opintoala1995_avain] [varchar](46) NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995_avain] [varchar](76) NOT NULL,
	[korkeakoulututkinto_sama_myohempi_opintoala1995_avain] [varchar](49) NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_opintoala1995_avain] [varchar](52) NOT NULL,
	[lu_sama_myohempi_iscfibroad2013_avain] [varchar](33) NOT NULL,
	[amm_sama_myohempi_iscfibroad2013_avain] [varchar](34) NOT NULL,
	[opist_sama_myohempi_iscfibroad2013_avain] [varchar](36) NOT NULL,
	[ammka_sama_myohempi_iscfibroad2013_avain] [varchar](36) NOT NULL,
	[akk_sama_myohempi_iscfibroad2013_avain] [varchar](34) NOT NULL,
	[amk_sama_myohempi_iscfibroad2013_avain] [varchar](34) NOT NULL,
	[ylamk_sama_myohempi_iscfibroad2013_avain] [varchar](36) NOT NULL,
	[ykk_sama_myohempi_iscfibroad2013_avain] [varchar](34) NOT NULL,
	[laaker_sama_myohempi_iscfibroad2013_avain] [varchar](37) NOT NULL,
	[lis_sama_myohempi_iscfibroad2013_avain] [varchar](34) NOT NULL,
	[toht_sama_myohempi_iscfibroad2013_avain] [varchar](35) NOT NULL,
	[yliopistotutkinto_sama_myohempi_iscfibroad2013_avain] [varchar](48) NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_iscfibroad2013_avain] [varchar](47) NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_avain] [varchar](77) NOT NULL,
	[korkeakoulututkinto_sama_myohempi_iscfibroad2013_avain] [varchar](50) NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_avain] [varchar](53) NOT NULL,
	[lu_sama_myohempi_iscfinarrow2013_avain] [varchar](34) NOT NULL,
	[amm_sama_myohempi_iscfinarrow2013_avain] [varchar](35) NOT NULL,
	[opist_sama_myohempi_iscfinarrow2013_avain] [varchar](37) NOT NULL,
	[ammka_sama_myohempi_iscfinarrow2013_avain] [varchar](37) NOT NULL,
	[akk_sama_myohempi_iscfinarrow2013_avain] [varchar](35) NOT NULL,
	[amk_sama_myohempi_iscfinarrow2013_avain] [varchar](35) NOT NULL,
	[ylamk_sama_myohempi_iscfinarrow2013_avain] [varchar](37) NOT NULL,
	[ykk_sama_myohempi_iscfinarrow2013_avain] [varchar](35) NOT NULL,
	[laaker_sama_myohempi_iscfinarrow2013_avain] [varchar](38) NOT NULL,
	[lis_sama_myohempi_iscfinarrow2013_avain] [varchar](35) NOT NULL,
	[toht_sama_myohempi_iscfinarrow2013_avain] [varchar](36) NOT NULL,
	[yliopistotutkinto_sama_myohempi_iscfinarrow2013_avain] [varchar](49) NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_avain] [varchar](48) NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_avain] [varchar](78) NOT NULL,
	[korkeakoulututkinto_sama_myohempi_iscfinarrow2013_avain] [varchar](51) NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_avain] [varchar](54) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_koulutukseen_sijoittuneet_2v_tarkastelu]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_koulutukseen_sijoittuneet_2v_tarkastelu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_koulutukseen_sijoittuneet_2v_tarkastelu](
	[rivinumero] [int] NOT NULL,
	[tarkastelujakso] [nvarchar](20) NOT NULL,
	[tilv] [nvarchar](4) NOT NULL,
	[tilv_date] [date] NULL,
	[tutkryh] [int] NOT NULL,
	[suorv] [nvarchar](4) NOT NULL,
	[suorlk] [nvarchar](6) NOT NULL,
	[sp] [int] NOT NULL,
	[syntv] [nvarchar](8) NOT NULL,
	[aikielir1] [nvarchar](2) NOT NULL,
	[tutkkaskun] [nvarchar](3) NOT NULL,
	[kansalr1] [int] NOT NULL,
	[pohjmaa] [int] NOT NULL,
	[eumaa] [int] NOT NULL,
	[etamaa] [int] NOT NULL,
	[tunn] [nvarchar](10) NOT NULL,
	[jarj] [nvarchar](10) NOT NULL,
	[kkielir1] [nvarchar](4) NOT NULL,
	[tutklaja] [int] NOT NULL,
	[tutktav] [int] NOT NULL,
	[aikoul] [int] NOT NULL,
	[tutkmaak] [nvarchar](2) NOT NULL,
	[koulutus_1] [nvarchar](6) NULL,
	[oppilaitos_1] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_1] [nvarchar](10) NULL,
	[koulutuksen_maakunta_1] [nvarchar](2) NULL,
	[koulutus_2] [nvarchar](6) NULL,
	[oppilaitos_2] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja_2] [nvarchar](10) NULL,
	[koulutuksen_maakunta_2] [nvarchar](2) NULL,
	[monihaku] [int] NOT NULL,
	[paaasiallinen_toiminta] [int] NULL,
	[ammattiasema] [int] NULL,
	[lkm] [int] NOT NULL,
	[pohjkoulk] [nvarchar](6) NOT NULL,
	[tietolahde] [varchar](255) NOT NULL,
	[aineisto] [nvarchar](8) NOT NULL,
	[lukiokoulutuksessa] [int] NOT NULL,
	[ammatillisessa_koulutuksessa] [int] NOT NULL,
	[ammattikorkeakoulutuksessa] [int] NOT NULL,
	[yliopistokoulutuksessa] [int] NOT NULL,
	[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa] [int] NOT NULL,
	[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa] [int] NOT NULL,
	[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa] [int] NOT NULL,
	[koulutuksen_paattaneiden_toiminta] [int] NOT NULL,
	[ika_1v] [nvarchar](10) NOT NULL,
	[ika_5v] [nvarchar](10) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_koulutukseen_sijoittuneet_6v_tarkastelu]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_koulutukseen_sijoittuneet_6v_tarkastelu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_koulutukseen_sijoittuneet_6v_tarkastelu](
	[rivinumero] [int] NOT NULL,
	[tarkastelujakso] [nvarchar](20) NOT NULL,
	[tilv] [nvarchar](4) NOT NULL,
	[tilv_date] [date] NULL,
	[tutkryh] [int] NOT NULL,
	[suorv] [nvarchar](4) NOT NULL,
	[suorlk] [nvarchar](6) NOT NULL,
	[sp] [int] NOT NULL,
	[syntv] [nvarchar](8) NOT NULL,
	[aikielir1] [nvarchar](2) NOT NULL,
	[tutkkaskun] [nvarchar](3) NOT NULL,
	[kansalr1] [int] NOT NULL,
	[pohjmaa] [int] NOT NULL,
	[eumaa] [int] NOT NULL,
	[etamaa] [int] NOT NULL,
	[tunn] [nvarchar](10) NOT NULL,
	[jarj] [nvarchar](10) NOT NULL,
	[kkielir1] [nvarchar](4) NOT NULL,
	[tutklaja] [int] NOT NULL,
	[tutktav] [int] NOT NULL,
	[aikoul] [int] NOT NULL,
	[tutkmaak] [nvarchar](2) NOT NULL,
	[koulutus_1] [nvarchar](6) NULL,
	[oppilaitos_1] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_1] [nvarchar](10) NULL,
	[koulutuksen_maakunta_1] [nvarchar](2) NULL,
	[koulutus_2] [nvarchar](6) NULL,
	[oppilaitos_2] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja_2] [nvarchar](10) NULL,
	[koulutuksen_maakunta_2] [nvarchar](2) NULL,
	[monihaku] [int] NOT NULL,
	[paaasiallinen_toiminta] [int] NULL,
	[ammattiasema] [int] NULL,
	[lkm] [int] NOT NULL,
	[pohjkoulk] [nvarchar](6) NOT NULL,
	[tietolahde] [varchar](255) NOT NULL,
	[aineisto] [nvarchar](8) NOT NULL,
	[lukiokoulutuksessa] [int] NOT NULL,
	[ammatillisessa_koulutuksessa] [int] NOT NULL,
	[ammattikorkeakoulutuksessa] [int] NOT NULL,
	[yliopistokoulutuksessa] [int] NOT NULL,
	[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa] [int] NOT NULL,
	[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa] [int] NOT NULL,
	[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa] [int] NOT NULL,
	[koulutuksen_paattaneiden_toiminta] [int] NOT NULL,
	[ika_1v] [nvarchar](10) NOT NULL,
	[ika_5v] [nvarchar](10) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila](
	[tilv] [varchar](4) NULL,
	[lahde] [varchar](2) NULL,
	[sp] [varchar](1) NULL,
	[syntv] [varchar](4) NULL,
	[aikielir1] [varchar](2) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[alvv_kk] [varchar](4) NULL,
	[allk_kk] [varchar](1) NULL,
	[ololk] [varchar](1) NULL,
	[klaji] [varchar](2) NULL,
	[jarj] [varchar](10) NULL,
	[kkun] [varchar](3) NULL,
	[koulk] [varchar](6) NULL,
	[pohjkoulk] [varchar](6) NULL,
	[rahlahde] [varchar](1) NULL,
	[amksuorv_2000] [varchar](4) NULL,
	[amksuorlk_2000] [varchar](1) NULL,
	[amktutkkmaak_2000] [varchar](2) NULL,
	[amktutkjarj_2000] [varchar](10) NULL,
	[amktutkkoulk_2000] [varchar](6) NULL,
	[ylamksuorv_2000] [varchar](4) NULL,
	[ylamksuorlk_2000] [varchar](1) NULL,
	[ylamktutkkmaak_2000] [varchar](2) NULL,
	[ylamktutkjarj_2000] [varchar](10) NULL,
	[ylamktutkkoulk_2000] [varchar](6) NULL,
	[alkksuorv_2000] [varchar](4) NULL,
	[alkksuorlk_2000] [varchar](1) NULL,
	[alkktutkkmaak_2000] [varchar](2) NULL,
	[alkktutkjarj_2000] [varchar](10) NULL,
	[alkktutkkoulk_2000] [varchar](6) NULL,
	[ylkksuorv_2000] [varchar](4) NULL,
	[ylkksuorlk_2000] [varchar](1) NULL,
	[ylkktutkkmaak_2000] [varchar](2) NULL,
	[ylkktutkjarj_2000] [varchar](10) NULL,
	[ylkktutkkoulk_2000] [varchar](6) NULL,
	[tksuorv_2000] [varchar](4) NULL,
	[tksuorlk_2000] [varchar](1) NULL,
	[tktutkkmaak_2000] [varchar](2) NULL,
	[tktutkjarj_2000] [varchar](10) NULL,
	[tktutkkoulk_2000] [varchar](6) NULL,
	[muutasuorv_2000] [varchar](4) NULL,
	[muutasuorlk_2000] [varchar](1) NULL,
	[muutatutkkmaak_2000] [varchar](2) NULL,
	[muutatutkjarj_2000] [varchar](10) NULL,
	[muutatutkkoulk_2000] [varchar](6) NULL,
	[amksuorv_2001] [varchar](4) NULL,
	[amksuorlk_2001] [varchar](1) NULL,
	[amktutkkmaak_2001] [varchar](2) NULL,
	[amktutkjarj_2001] [varchar](10) NULL,
	[amktutkkoulk_2001] [varchar](6) NULL,
	[ylamksuorv_2001] [varchar](4) NULL,
	[ylamksuorlk_2001] [varchar](1) NULL,
	[ylamktutkkmaak_2001] [varchar](2) NULL,
	[ylamktutkjarj_2001] [varchar](10) NULL,
	[ylamktutkkoulk_2001] [varchar](6) NULL,
	[alkksuorv_2001] [varchar](4) NULL,
	[alkksuorlk_2001] [varchar](1) NULL,
	[alkktutkkmaak_2001] [varchar](2) NULL,
	[alkktutkjarj_2001] [varchar](10) NULL,
	[alkktutkkoulk_2001] [varchar](6) NULL,
	[ylkksuorv_2001] [varchar](4) NULL,
	[ylkksuorlk_2001] [varchar](1) NULL,
	[ylkktutkkmaak_2001] [varchar](2) NULL,
	[ylkktutkjarj_2001] [varchar](10) NULL,
	[ylkktutkkoulk_2001] [varchar](6) NULL,
	[tksuorv_2001] [varchar](4) NULL,
	[tksuorlk_2001] [varchar](1) NULL,
	[tktutkkmaak_2001] [varchar](2) NULL,
	[tktutkjarj_2001] [varchar](10) NULL,
	[tktutkkoulk_2001] [varchar](6) NULL,
	[muutasuorv_2001] [varchar](4) NULL,
	[muutasuorlk_2001] [varchar](1) NULL,
	[muutatutkkmaak_2001] [varchar](2) NULL,
	[muutatutkjarj_2001] [varchar](10) NULL,
	[muutatutkkoulk_2001] [varchar](6) NULL,
	[amksuorv_2002] [varchar](4) NULL,
	[amksuorlk_2002] [varchar](1) NULL,
	[amktutkkmaak_2002] [varchar](2) NULL,
	[amktutkjarj_2002] [varchar](10) NULL,
	[amktutkkoulk_2002] [varchar](6) NULL,
	[ylamksuorv_2002] [varchar](4) NULL,
	[ylamksuorlk_2002] [varchar](1) NULL,
	[ylamktutkkmaak_2002] [varchar](2) NULL,
	[ylamktutkjarj_2002] [varchar](10) NULL,
	[ylamktutkkoulk_2002] [varchar](6) NULL,
	[alkksuorv_2002] [varchar](4) NULL,
	[alkksuorlk_2002] [varchar](1) NULL,
	[alkktutkkmaak_2002] [varchar](2) NULL,
	[alkktutkjarj_2002] [varchar](10) NULL,
	[alkktutkkoulk_2002] [varchar](6) NULL,
	[ylkksuorv_2002] [varchar](4) NULL,
	[ylkksuorlk_2002] [varchar](1) NULL,
	[ylkktutkkmaak_2002] [varchar](2) NULL,
	[ylkktutkjarj_2002] [varchar](10) NULL,
	[ylkktutkkoulk_2002] [varchar](6) NULL,
	[tksuorv_2002] [varchar](4) NULL,
	[tksuorlk_2002] [varchar](1) NULL,
	[tktutkkmaak_2002] [varchar](2) NULL,
	[tktutkjarj_2002] [varchar](10) NULL,
	[tktutkkoulk_2002] [varchar](6) NULL,
	[muutasuorv_2002] [varchar](4) NULL,
	[muutasuorlk_2002] [varchar](1) NULL,
	[muutatutkkmaak_2002] [varchar](2) NULL,
	[muutatutkjarj_2002] [varchar](10) NULL,
	[muutatutkkoulk_2002] [varchar](6) NULL,
	[amksuorv_2003] [varchar](4) NULL,
	[amksuorlk_2003] [varchar](1) NULL,
	[amktutkkmaak_2003] [varchar](2) NULL,
	[amktutkjarj_2003] [varchar](10) NULL,
	[amktutkkoulk_2003] [varchar](6) NULL,
	[ylamksuorv_2003] [varchar](4) NULL,
	[ylamksuorlk_2003] [varchar](1) NULL,
	[ylamktutkkmaak_2003] [varchar](2) NULL,
	[ylamktutkjarj_2003] [varchar](10) NULL,
	[ylamktutkkoulk_2003] [varchar](6) NULL,
	[alkksuorv_2003] [varchar](4) NULL,
	[alkksuorlk_2003] [varchar](1) NULL,
	[alkktutkkmaak_2003] [varchar](2) NULL,
	[alkktutkjarj_2003] [varchar](10) NULL,
	[alkktutkkoulk_2003] [varchar](6) NULL,
	[ylkksuorv_2003] [varchar](4) NULL,
	[ylkksuorlk_2003] [varchar](1) NULL,
	[ylkktutkkmaak_2003] [varchar](2) NULL,
	[ylkktutkjarj_2003] [varchar](10) NULL,
	[ylkktutkkoulk_2003] [varchar](6) NULL,
	[tksuorv_2003] [varchar](4) NULL,
	[tksuorlk_2003] [varchar](1) NULL,
	[tktutkkmaak_2003] [varchar](2) NULL,
	[tktutkjarj_2003] [varchar](10) NULL,
	[tktutkkoulk_2003] [varchar](6) NULL,
	[muutasuorv_2003] [varchar](4) NULL,
	[muutasuorlk_2003] [varchar](1) NULL,
	[muutatutkkmaak_2003] [varchar](2) NULL,
	[muutatutkjarj_2003] [varchar](10) NULL,
	[muutatutkkoulk_2003] [varchar](6) NULL,
	[amksuorv_2004] [varchar](4) NULL,
	[amksuorlk_2004] [varchar](1) NULL,
	[amktutkkmaak_2004] [varchar](2) NULL,
	[amktutkjarj_2004] [varchar](10) NULL,
	[amktutkkoulk_2004] [varchar](6) NULL,
	[ylamksuorv_2004] [varchar](4) NULL,
	[ylamksuorlk_2004] [varchar](1) NULL,
	[ylamktutkkmaak_2004] [varchar](2) NULL,
	[ylamktutkjarj_2004] [varchar](10) NULL,
	[ylamktutkkoulk_2004] [varchar](6) NULL,
	[alkksuorv_2004] [varchar](4) NULL,
	[alkksuorlk_2004] [varchar](1) NULL,
	[alkktutkkmaak_2004] [varchar](2) NULL,
	[alkktutkjarj_2004] [varchar](10) NULL,
	[alkktutkkoulk_2004] [varchar](6) NULL,
	[ylkksuorv_2004] [varchar](4) NULL,
	[ylkksuorlk_2004] [varchar](1) NULL,
	[ylkktutkkmaak_2004] [varchar](2) NULL,
	[ylkktutkjarj_2004] [varchar](10) NULL,
	[ylkktutkkoulk_2004] [varchar](6) NULL,
	[tksuorv_2004] [varchar](4) NULL,
	[tksuorlk_2004] [varchar](1) NULL,
	[tktutkkmaak_2004] [varchar](2) NULL,
	[tktutkjarj_2004] [varchar](10) NULL,
	[tktutkkoulk_2004] [varchar](6) NULL,
	[muutasuorv_2004] [varchar](4) NULL,
	[muutasuorlk_2004] [varchar](1) NULL,
	[muutatutkkmaak_2004] [varchar](2) NULL,
	[muutatutkjarj_2004] [varchar](10) NULL,
	[muutatutkkoulk_2004] [varchar](6) NULL,
	[amksuorv_2005] [varchar](4) NULL,
	[amksuorlk_2005] [varchar](1) NULL,
	[amktutkkmaak_2005] [varchar](2) NULL,
	[amktutkjarj_2005] [varchar](10) NULL,
	[amktutkkoulk_2005] [varchar](6) NULL,
	[ylamksuorv_2005] [varchar](4) NULL,
	[ylamksuorlk_2005] [varchar](1) NULL,
	[ylamktutkkmaak_2005] [varchar](2) NULL,
	[ylamktutkjarj_2005] [varchar](10) NULL,
	[ylamktutkkoulk_2005] [varchar](6) NULL,
	[alkksuorv_2005] [varchar](4) NULL,
	[alkksuorlk_2005] [varchar](1) NULL,
	[alkktutkkmaak_2005] [varchar](2) NULL,
	[alkktutkjarj_2005] [varchar](10) NULL,
	[alkktutkkoulk_2005] [varchar](6) NULL,
	[ylkksuorv_2005] [varchar](4) NULL,
	[ylkksuorlk_2005] [varchar](1) NULL,
	[ylkktutkkmaak_2005] [varchar](2) NULL,
	[ylkktutkjarj_2005] [varchar](10) NULL,
	[ylkktutkkoulk_2005] [varchar](6) NULL,
	[tksuorv_2005] [varchar](4) NULL,
	[tksuorlk_2005] [varchar](1) NULL,
	[tktutkkmaak_2005] [varchar](2) NULL,
	[tktutkjarj_2005] [varchar](10) NULL,
	[tktutkkoulk_2005] [varchar](6) NULL,
	[muutasuorv_2005] [varchar](4) NULL,
	[muutasuorlk_2005] [varchar](1) NULL,
	[muutatutkkmaak_2005] [varchar](2) NULL,
	[muutatutkjarj_2005] [varchar](10) NULL,
	[muutatutkkoulk_2005] [varchar](6) NULL,
	[amksuorv_2006] [varchar](4) NULL,
	[amksuorlk_2006] [varchar](1) NULL,
	[amktutkkmaak_2006] [varchar](2) NULL,
	[amktutkjarj_2006] [varchar](10) NULL,
	[amktutkkoulk_2006] [varchar](6) NULL,
	[ylamksuorv_2006] [varchar](4) NULL,
	[ylamksuorlk_2006] [varchar](1) NULL,
	[ylamktutkkmaak_2006] [varchar](2) NULL,
	[ylamktutkjarj_2006] [varchar](10) NULL,
	[ylamktutkkoulk_2006] [varchar](6) NULL,
	[alkksuorv_2006] [varchar](4) NULL,
	[alkksuorlk_2006] [varchar](1) NULL,
	[alkktutkkmaak_2006] [varchar](2) NULL,
	[alkktutkjarj_2006] [varchar](10) NULL,
	[alkktutkkoulk_2006] [varchar](6) NULL,
	[ylkksuorv_2006] [varchar](4) NULL,
	[ylkksuorlk_2006] [varchar](1) NULL,
	[ylkktutkkmaak_2006] [varchar](2) NULL,
	[ylkktutkjarj_2006] [varchar](10) NULL,
	[ylkktutkkoulk_2006] [varchar](6) NULL,
	[tksuorv_2006] [varchar](4) NULL,
	[tksuorlk_2006] [varchar](1) NULL,
	[tktutkkmaak_2006] [varchar](2) NULL,
	[tktutkjarj_2006] [varchar](10) NULL,
	[tktutkkoulk_2006] [varchar](6) NULL,
	[muutasuorv_2006] [varchar](4) NULL,
	[muutasuorlk_2006] [varchar](1) NULL,
	[muutatutkkmaak_2006] [varchar](2) NULL,
	[muutatutkjarj_2006] [varchar](10) NULL,
	[muutatutkkoulk_2006] [varchar](6) NULL,
	[amksuorv_2007] [varchar](4) NULL,
	[amksuorlk_2007] [varchar](1) NULL,
	[amktutkkmaak_2007] [varchar](2) NULL,
	[amktutkjarj_2007] [varchar](10) NULL,
	[amktutkkoulk_2007] [varchar](6) NULL,
	[ylamksuorv_2007] [varchar](4) NULL,
	[ylamksuorlk_2007] [varchar](1) NULL,
	[ylamktutkkmaak_2007] [varchar](2) NULL,
	[ylamktutkjarj_2007] [varchar](10) NULL,
	[ylamktutkkoulk_2007] [varchar](6) NULL,
	[alkksuorv_2007] [varchar](4) NULL,
	[alkksuorlk_2007] [varchar](1) NULL,
	[alkktutkkmaak_2007] [varchar](2) NULL,
	[alkktutkjarj_2007] [varchar](10) NULL,
	[alkktutkkoulk_2007] [varchar](6) NULL,
	[ylkksuorv_2007] [varchar](4) NULL,
	[ylkksuorlk_2007] [varchar](1) NULL,
	[ylkktutkkmaak_2007] [varchar](2) NULL,
	[ylkktutkjarj_2007] [varchar](10) NULL,
	[ylkktutkkoulk_2007] [varchar](6) NULL,
	[tksuorv_2007] [varchar](4) NULL,
	[tksuorlk_2007] [varchar](1) NULL,
	[tktutkkmaak_2007] [varchar](2) NULL,
	[tktutkjarj_2007] [varchar](10) NULL,
	[tktutkkoulk_2007] [varchar](6) NULL,
	[muutasuorv_2007] [varchar](4) NULL,
	[muutasuorlk_2007] [varchar](1) NULL,
	[muutatutkkmaak_2007] [varchar](2) NULL,
	[muutatutkjarj_2007] [varchar](10) NULL,
	[muutatutkkoulk_2007] [varchar](6) NULL,
	[amksuorv_2008] [varchar](4) NULL,
	[amksuorlk_2008] [varchar](1) NULL,
	[amktutkkmaak_2008] [varchar](2) NULL,
	[amktutkjarj_2008] [varchar](10) NULL,
	[amktutkkoulk_2008] [varchar](6) NULL,
	[ylamksuorv_2008] [varchar](4) NULL,
	[ylamksuorlk_2008] [varchar](1) NULL,
	[ylamktutkkmaak_2008] [varchar](2) NULL,
	[ylamktutkjarj_2008] [varchar](10) NULL,
	[ylamktutkkoulk_2008] [varchar](6) NULL,
	[alkksuorv_2008] [varchar](4) NULL,
	[alkksuorlk_2008] [varchar](1) NULL,
	[alkktutkkmaak_2008] [varchar](2) NULL,
	[alkktutkjarj_2008] [varchar](10) NULL,
	[alkktutkkoulk_2008] [varchar](6) NULL,
	[ylkksuorv_2008] [varchar](4) NULL,
	[ylkksuorlk_2008] [varchar](1) NULL,
	[ylkktutkkmaak_2008] [varchar](2) NULL,
	[ylkktutkjarj_2008] [varchar](10) NULL,
	[ylkktutkkoulk_2008] [varchar](6) NULL,
	[tksuorv_2008] [varchar](4) NULL,
	[tksuorlk_2008] [varchar](1) NULL,
	[tktutkkmaak_2008] [varchar](2) NULL,
	[tktutkjarj_2008] [varchar](10) NULL,
	[tktutkkoulk_2008] [varchar](6) NULL,
	[muutasuorv_2008] [varchar](4) NULL,
	[muutasuorlk_2008] [varchar](1) NULL,
	[muutatutkkmaak_2008] [varchar](2) NULL,
	[muutatutkjarj_2008] [varchar](10) NULL,
	[muutatutkkoulk_2008] [varchar](6) NULL,
	[amksuorv_2009] [varchar](4) NULL,
	[amksuorlk_2009] [varchar](1) NULL,
	[amktutkkmaak_2009] [varchar](2) NULL,
	[amktutkjarj_2009] [varchar](10) NULL,
	[amktutkkoulk_2009] [varchar](6) NULL,
	[ylamksuorv_2009] [varchar](4) NULL,
	[ylamksuorlk_2009] [varchar](1) NULL,
	[ylamktutkkmaak_2009] [varchar](2) NULL,
	[ylamktutkjarj_2009] [varchar](10) NULL,
	[ylamktutkkoulk_2009] [varchar](6) NULL,
	[alkksuorv_2009] [varchar](4) NULL,
	[alkksuorlk_2009] [varchar](1) NULL,
	[alkktutkkmaak_2009] [varchar](2) NULL,
	[alkktutkjarj_2009] [varchar](10) NULL,
	[alkktutkkoulk_2009] [varchar](6) NULL,
	[ylkksuorv_2009] [varchar](4) NULL,
	[ylkksuorlk_2009] [varchar](1) NULL,
	[ylkktutkkmaak_2009] [varchar](2) NULL,
	[ylkktutkjarj_2009] [varchar](10) NULL,
	[ylkktutkkoulk_2009] [varchar](6) NULL,
	[tksuorv_2009] [varchar](4) NULL,
	[tksuorlk_2009] [varchar](1) NULL,
	[tktutkkmaak_2009] [varchar](2) NULL,
	[tktutkjarj_2009] [varchar](10) NULL,
	[tktutkkoulk_2009] [varchar](6) NULL,
	[muutasuorv_2009] [varchar](4) NULL,
	[muutasuorlk_2009] [varchar](1) NULL,
	[muutatutkkmaak_2009] [varchar](2) NULL,
	[muutatutkjarj_2009] [varchar](10) NULL,
	[muutatutkkoulk_2009] [varchar](6) NULL,
	[amkopiskkoulk_2000] [varchar](6) NULL,
	[amkopiskjarj_2000] [varchar](10) NULL,
	[amkkmaak_2000] [varchar](2) NULL,
	[amkolotamm_2000] [varchar](1) NULL,
	[amkolosyys_2000] [varchar](1) NULL,
	[ylamkopiskkoulk_2000] [varchar](6) NULL,
	[ylamkopiskjarj_2000] [varchar](10) NULL,
	[ylamkkmaak_2000] [varchar](2) NULL,
	[ylamkolotamm_2000] [varchar](1) NULL,
	[ylamkolosyys_2000] [varchar](1) NULL,
	[alkkopiskkoulk_2000] [varchar](6) NULL,
	[alkkopiskjarj_2000] [varchar](10) NULL,
	[alkkkmaak_2000] [varchar](2) NULL,
	[alkkolotamm_2000] [varchar](1) NULL,
	[alkkolosyys_2000] [varchar](1) NULL,
	[ylkkopiskkoulk_2000] [varchar](6) NULL,
	[ylkkopiskjarj_2000] [varchar](10) NULL,
	[ylkkkmaak_2000] [varchar](2) NULL,
	[ylkkolotamm_2000] [varchar](1) NULL,
	[ylkkolosyys_2000] [varchar](1) NULL,
	[tkopiskkoulk_2000] [varchar](6) NULL,
	[tkopiskjarj_2000] [varchar](10) NULL,
	[tkkmaak_2000] [varchar](2) NULL,
	[tkolotamm_2000] [varchar](1) NULL,
	[tkolosyys_2000] [varchar](1) NULL,
	[muutaopiskkoulk_2000] [varchar](6) NULL,
	[muutaopiskjarj_2000] [varchar](10) NULL,
	[muutakmaak_2000] [varchar](2) NULL,
	[muutaolotamm_2000] [varchar](1) NULL,
	[muutaolosyys_2000] [varchar](1) NULL,
	[amkopiskkoulk_2001] [varchar](6) NULL,
	[amkopiskjarj_2001] [varchar](10) NULL,
	[amkkmaak_2001] [varchar](2) NULL,
	[amkolotamm_2001] [varchar](1) NULL,
	[amkolosyys_2001] [varchar](1) NULL,
	[ylamkopiskkoulk_2001] [varchar](6) NULL,
	[ylamkopiskjarj_2001] [varchar](10) NULL,
	[ylamkkmaak_2001] [varchar](2) NULL,
	[ylamkolotamm_2001] [varchar](1) NULL,
	[ylamkolosyys_2001] [varchar](1) NULL,
	[alkkopiskkoulk_2001] [varchar](6) NULL,
	[alkkopiskjarj_2001] [varchar](10) NULL,
	[alkkkmaak_2001] [varchar](2) NULL,
	[alkkolotamm_2001] [varchar](1) NULL,
	[alkkolosyys_2001] [varchar](1) NULL,
	[ylkkopiskkoulk_2001] [varchar](6) NULL,
	[ylkkopiskjarj_2001] [varchar](10) NULL,
	[ylkkkmaak_2001] [varchar](2) NULL,
	[ylkkolotamm_2001] [varchar](1) NULL,
	[ylkkolosyys_2001] [varchar](1) NULL,
	[tkopiskkoulk_2001] [varchar](6) NULL,
	[tkopiskjarj_2001] [varchar](10) NULL,
	[tkkmaak_2001] [varchar](2) NULL,
	[tkolotamm_2001] [varchar](1) NULL,
	[tkolosyys_2001] [varchar](1) NULL,
	[muutaopiskkoulk_2001] [varchar](6) NULL,
	[muutaopiskjarj_2001] [varchar](10) NULL,
	[muutakmaak_2001] [varchar](2) NULL,
	[muutaolotamm_2001] [varchar](1) NULL,
	[muutaolosyys_2001] [varchar](1) NULL,
	[amkopiskkoulk_2002] [varchar](6) NULL,
	[amkopiskjarj_2002] [varchar](10) NULL,
	[amkkmaak_2002] [varchar](2) NULL,
	[amkolotamm_2002] [varchar](1) NULL,
	[amkolosyys_2002] [varchar](1) NULL,
	[ylamkopiskkoulk_2002] [varchar](6) NULL,
	[ylamkopiskjarj_2002] [varchar](10) NULL,
	[ylamkkmaak_2002] [varchar](2) NULL,
	[ylamkolotamm_2002] [varchar](1) NULL,
	[ylamkolosyys_2002] [varchar](1) NULL,
	[alkkopiskkoulk_2002] [varchar](6) NULL,
	[alkkopiskjarj_2002] [varchar](10) NULL,
	[alkkkmaak_2002] [varchar](2) NULL,
	[alkkolotamm_2002] [varchar](1) NULL,
	[alkkolosyys_2002] [varchar](1) NULL,
	[ylkkopiskkoulk_2002] [varchar](6) NULL,
	[ylkkopiskjarj_2002] [varchar](10) NULL,
	[ylkkkmaak_2002] [varchar](2) NULL,
	[ylkkolotamm_2002] [varchar](1) NULL,
	[ylkkolosyys_2002] [varchar](1) NULL,
	[tkopiskkoulk_2002] [varchar](6) NULL,
	[tkopiskjarj_2002] [varchar](10) NULL,
	[tkkmaak_2002] [varchar](2) NULL,
	[tkolotamm_2002] [varchar](1) NULL,
	[tkolosyys_2002] [varchar](1) NULL,
	[muutaopiskkoulk_2002] [varchar](6) NULL,
	[muutaopiskjarj_2002] [varchar](10) NULL,
	[muutakmaak_2002] [varchar](2) NULL,
	[muutaolotamm_2002] [varchar](1) NULL,
	[muutaolosyys_2002] [varchar](1) NULL,
	[amkopiskkoulk_2003] [varchar](6) NULL,
	[amkopiskjarj_2003] [varchar](10) NULL,
	[amkkmaak_2003] [varchar](2) NULL,
	[amkolotamm_2003] [varchar](1) NULL,
	[amkolosyys_2003] [varchar](1) NULL,
	[ylamkopiskkoulk_2003] [varchar](6) NULL,
	[ylamkopiskjarj_2003] [varchar](10) NULL,
	[ylamkkmaak_2003] [varchar](2) NULL,
	[ylamkolotamm_2003] [varchar](1) NULL,
	[ylamkolosyys_2003] [varchar](1) NULL,
	[alkkopiskkoulk_2003] [varchar](6) NULL,
	[alkkopiskjarj_2003] [varchar](10) NULL,
	[alkkkmaak_2003] [varchar](2) NULL,
	[alkkolotamm_2003] [varchar](1) NULL,
	[alkkolosyys_2003] [varchar](1) NULL,
	[ylkkopiskkoulk_2003] [varchar](6) NULL,
	[ylkkopiskjarj_2003] [varchar](10) NULL,
	[ylkkkmaak_2003] [varchar](2) NULL,
	[ylkkolotamm_2003] [varchar](1) NULL,
	[ylkkolosyys_2003] [varchar](1) NULL,
	[tkopiskkoulk_2003] [varchar](6) NULL,
	[tkopiskjarj_2003] [varchar](10) NULL,
	[tkkmaak_2003] [varchar](2) NULL,
	[tkolotamm_2003] [varchar](1) NULL,
	[tkolosyys_2003] [varchar](1) NULL,
	[muutaopiskkoulk_2003] [varchar](6) NULL,
	[muutaopiskjarj_2003] [varchar](10) NULL,
	[muutakmaak_2003] [varchar](2) NULL,
	[muutaolotamm_2003] [varchar](1) NULL,
	[muutaolosyys_2003] [varchar](1) NULL,
	[amkopiskkoulk_2004] [varchar](6) NULL,
	[amkopiskjarj_2004] [varchar](10) NULL,
	[amkkmaak_2004] [varchar](2) NULL,
	[amkolotamm_2004] [varchar](1) NULL,
	[amkolosyys_2004] [varchar](1) NULL,
	[ylamkopiskkoulk_2004] [varchar](6) NULL,
	[ylamkopiskjarj_2004] [varchar](10) NULL,
	[ylamkkmaak_2004] [varchar](2) NULL,
	[ylamkolotamm_2004] [varchar](1) NULL,
	[ylamkolosyys_2004] [varchar](1) NULL,
	[alkkopiskkoulk_2004] [varchar](6) NULL,
	[alkkopiskjarj_2004] [varchar](10) NULL,
	[alkkkmaak_2004] [varchar](2) NULL,
	[alkkolotamm_2004] [varchar](1) NULL,
	[alkkolosyys_2004] [varchar](1) NULL,
	[ylkkopiskkoulk_2004] [varchar](6) NULL,
	[ylkkopiskjarj_2004] [varchar](10) NULL,
	[ylkkkmaak_2004] [varchar](2) NULL,
	[ylkkolotamm_2004] [varchar](1) NULL,
	[ylkkolosyys_2004] [varchar](1) NULL,
	[tkopiskkoulk_2004] [varchar](6) NULL,
	[tkopiskjarj_2004] [varchar](10) NULL,
	[tkkmaak_2004] [varchar](2) NULL,
	[tkolotamm_2004] [varchar](1) NULL,
	[tkolosyys_2004] [varchar](1) NULL,
	[muutaopiskkoulk_2004] [varchar](6) NULL,
	[muutaopiskjarj_2004] [varchar](10) NULL,
	[muutakmaak_2004] [varchar](2) NULL,
	[muutaolotamm_2004] [varchar](1) NULL,
	[muutaolosyys_2004] [varchar](1) NULL,
	[amkopiskkoulk_2005] [varchar](6) NULL,
	[amkopiskjarj_2005] [varchar](10) NULL,
	[amkkmaak_2005] [varchar](2) NULL,
	[amkolotamm_2005] [varchar](1) NULL,
	[amkolosyys_2005] [varchar](1) NULL,
	[ylamkopiskkoulk_2005] [varchar](6) NULL,
	[ylamkopiskjarj_2005] [varchar](10) NULL,
	[ylamkkmaak_2005] [varchar](2) NULL,
	[ylamkolotamm_2005] [varchar](1) NULL,
	[ylamkolosyys_2005] [varchar](1) NULL,
	[alkkopiskkoulk_2005] [varchar](6) NULL,
	[alkkopiskjarj_2005] [varchar](10) NULL,
	[alkkkmaak_2005] [varchar](2) NULL,
	[alkkolotamm_2005] [varchar](1) NULL,
	[alkkolosyys_2005] [varchar](1) NULL,
	[ylkkopiskkoulk_2005] [varchar](6) NULL,
	[ylkkopiskjarj_2005] [varchar](10) NULL,
	[ylkkkmaak_2005] [varchar](2) NULL,
	[ylkkolotamm_2005] [varchar](1) NULL,
	[ylkkolosyys_2005] [varchar](1) NULL,
	[tkopiskkoulk_2005] [varchar](6) NULL,
	[tkopiskjarj_2005] [varchar](10) NULL,
	[tkkmaak_2005] [varchar](2) NULL,
	[tkolotamm_2005] [varchar](1) NULL,
	[tkolosyys_2005] [varchar](1) NULL,
	[muutaopiskkoulk_2005] [varchar](6) NULL,
	[muutaopiskjarj_2005] [varchar](10) NULL,
	[muutakmaak_2005] [varchar](2) NULL,
	[muutaolotamm_2005] [varchar](1) NULL,
	[muutaolosyys_2005] [varchar](1) NULL,
	[amkopiskkoulk_2006] [varchar](6) NULL,
	[amkopiskjarj_2006] [varchar](10) NULL,
	[amkkmaak_2006] [varchar](2) NULL,
	[amkolotamm_2006] [varchar](1) NULL,
	[amkolosyys_2006] [varchar](1) NULL,
	[ylamkopiskkoulk_2006] [varchar](6) NULL,
	[ylamkopiskjarj_2006] [varchar](10) NULL,
	[ylamkkmaak_2006] [varchar](2) NULL,
	[ylamkolotamm_2006] [varchar](1) NULL,
	[ylamkolosyys_2006] [varchar](1) NULL,
	[alkkopiskkoulk_2006] [varchar](6) NULL,
	[alkkopiskjarj_2006] [varchar](10) NULL,
	[alkkkmaak_2006] [varchar](2) NULL,
	[alkkolotamm_2006] [varchar](1) NULL,
	[alkkolosyys_2006] [varchar](1) NULL,
	[ylkkopiskkoulk_2006] [varchar](6) NULL,
	[ylkkopiskjarj_2006] [varchar](10) NULL,
	[ylkkkmaak_2006] [varchar](2) NULL,
	[ylkkolotamm_2006] [varchar](1) NULL,
	[ylkkolosyys_2006] [varchar](1) NULL,
	[tkopiskkoulk_2006] [varchar](6) NULL,
	[tkopiskjarj_2006] [varchar](10) NULL,
	[tkkmaak_2006] [varchar](2) NULL,
	[tkolotamm_2006] [varchar](1) NULL,
	[tkolosyys_2006] [varchar](1) NULL,
	[muutaopiskkoulk_2006] [varchar](6) NULL,
	[muutaopiskjarj_2006] [varchar](10) NULL,
	[muutakmaak_2006] [varchar](2) NULL,
	[muutaolotamm_2006] [varchar](1) NULL,
	[muutaolosyys_2006] [varchar](1) NULL,
	[amkopiskkoulk_2007] [varchar](6) NULL,
	[amkopiskjarj_2007] [varchar](10) NULL,
	[amkkmaak_2007] [varchar](2) NULL,
	[amkolotamm_2007] [varchar](1) NULL,
	[amkolosyys_2007] [varchar](1) NULL,
	[ylamkopiskkoulk_2007] [varchar](6) NULL,
	[ylamkopiskjarj_2007] [varchar](10) NULL,
	[ylamkkmaak_2007] [varchar](2) NULL,
	[ylamkolotamm_2007] [varchar](1) NULL,
	[ylamkolosyys_2007] [varchar](1) NULL,
	[alkkopiskkoulk_2007] [varchar](6) NULL,
	[alkkopiskjarj_2007] [varchar](10) NULL,
	[alkkkmaak_2007] [varchar](2) NULL,
	[alkkolotamm_2007] [varchar](1) NULL,
	[alkkolosyys_2007] [varchar](1) NULL,
	[ylkkopiskkoulk_2007] [varchar](6) NULL,
	[ylkkopiskjarj_2007] [varchar](10) NULL,
	[ylkkkmaak_2007] [varchar](2) NULL,
	[ylkkolotamm_2007] [varchar](1) NULL,
	[ylkkolosyys_2007] [varchar](1) NULL,
	[tkopiskkoulk_2007] [varchar](6) NULL,
	[tkopiskjarj_2007] [varchar](10) NULL,
	[tkkmaak_2007] [varchar](2) NULL,
	[tkolotamm_2007] [varchar](1) NULL,
	[tkolosyys_2007] [varchar](1) NULL,
	[muutaopiskkoulk_2007] [varchar](6) NULL,
	[muutaopiskjarj_2007] [varchar](10) NULL,
	[muutakmaak_2007] [varchar](2) NULL,
	[muutaolotamm_2007] [varchar](1) NULL,
	[muutaolosyys_2007] [varchar](1) NULL,
	[amkopiskkoulk_2008] [varchar](6) NULL,
	[amkopiskjarj_2008] [varchar](10) NULL,
	[amkkmaak_2008] [varchar](2) NULL,
	[amkolotamm_2008] [varchar](1) NULL,
	[amkolosyys_2008] [varchar](1) NULL,
	[ylamkopiskkoulk_2008] [varchar](6) NULL,
	[ylamkopiskjarj_2008] [varchar](10) NULL,
	[ylamkkmaak_2008] [varchar](2) NULL,
	[ylamkolotamm_2008] [varchar](1) NULL,
	[ylamkolosyys_2008] [varchar](1) NULL,
	[alkkopiskkoulk_2008] [varchar](6) NULL,
	[alkkopiskjarj_2008] [varchar](10) NULL,
	[alkkkmaak_2008] [varchar](2) NULL,
	[alkkolotamm_2008] [varchar](1) NULL,
	[alkkolosyys_2008] [varchar](1) NULL,
	[ylkkopiskkoulk_2008] [varchar](6) NULL,
	[ylkkopiskjarj_2008] [varchar](10) NULL,
	[ylkkkmaak_2008] [varchar](2) NULL,
	[ylkkolotamm_2008] [varchar](1) NULL,
	[ylkkolosyys_2008] [varchar](1) NULL,
	[tkopiskkoulk_2008] [varchar](6) NULL,
	[tkopiskjarj_2008] [varchar](10) NULL,
	[tkkmaak_2008] [varchar](2) NULL,
	[tkolotamm_2008] [varchar](1) NULL,
	[tkolosyys_2008] [varchar](1) NULL,
	[muutaopiskkoulk_2008] [varchar](6) NULL,
	[muutaopiskjarj_2008] [varchar](10) NULL,
	[muutakmaak_2008] [varchar](2) NULL,
	[muutaolotamm_2008] [varchar](1) NULL,
	[muutaolosyys_2008] [varchar](1) NULL,
	[amkopiskkoulk_2009] [varchar](6) NULL,
	[amkopiskjarj_2009] [varchar](10) NULL,
	[amkkmaak_2009] [varchar](2) NULL,
	[amkolotamm_2009] [varchar](1) NULL,
	[amkolosyys_2009] [varchar](1) NULL,
	[ylamkopiskkoulk_2009] [varchar](6) NULL,
	[ylamkopiskjarj_2009] [varchar](10) NULL,
	[ylamkkmaak_2009] [varchar](2) NULL,
	[ylamkolotamm_2009] [varchar](1) NULL,
	[ylamkolosyys_2009] [varchar](1) NULL,
	[alkkopiskkoulk_2009] [varchar](6) NULL,
	[alkkopiskjarj_2009] [varchar](10) NULL,
	[alkkkmaak_2009] [varchar](2) NULL,
	[alkkolotamm_2009] [varchar](1) NULL,
	[alkkolosyys_2009] [varchar](1) NULL,
	[ylkkopiskkoulk_2009] [varchar](6) NULL,
	[ylkkopiskjarj_2009] [varchar](10) NULL,
	[ylkkkmaak_2009] [varchar](2) NULL,
	[ylkkolotamm_2009] [varchar](1) NULL,
	[ylkkolosyys_2009] [varchar](1) NULL,
	[tkopiskkoulk_2009] [varchar](6) NULL,
	[tkopiskjarj_2009] [varchar](10) NULL,
	[tkkmaak_2009] [varchar](2) NULL,
	[tkolotamm_2009] [varchar](1) NULL,
	[tkolosyys_2009] [varchar](1) NULL,
	[muutaopiskkoulk_2009] [varchar](6) NULL,
	[muutaopiskjarj_2009] [varchar](10) NULL,
	[muutakmaak_2009] [varchar](2) NULL,
	[muutaolotamm_2009] [varchar](1) NULL,
	[muutaolosyys_2009] [varchar](1) NULL,
	[ptoim1r5_2000] [varchar](2) NULL,
	[amas_2000] [varchar](1) NULL,
	[ptoim1r5_2001] [varchar](2) NULL,
	[amas_2001] [varchar](1) NULL,
	[ptoim1r5_2002] [varchar](2) NULL,
	[amas_2002] [varchar](1) NULL,
	[ptoim1r5_2003] [varchar](2) NULL,
	[amas_2003] [varchar](1) NULL,
	[ptoim1r5_2004] [varchar](2) NULL,
	[amas_2004] [varchar](1) NULL,
	[ptoim1r5_2005] [varchar](2) NULL,
	[amas_2005] [varchar](1) NULL,
	[ptoim1r5_2006] [varchar](2) NULL,
	[amas_2006] [varchar](1) NULL,
	[ptoim1r5_2007] [varchar](2) NULL,
	[amas_2007] [varchar](1) NULL,
	[ptoim1r5_2008] [varchar](2) NULL,
	[amas_2008] [varchar](1) NULL,
	[ptoim1r5_2009] [varchar](2) NULL,
	[amas_2009] [varchar](1) NULL,
	[amksuorv_2010] [varchar](4) NULL,
	[amksuorlk_2010] [varchar](1) NULL,
	[amktutkkmaak_2010] [varchar](2) NULL,
	[amktutkjarj_2010] [varchar](10) NULL,
	[amktutkkoulk_2010] [varchar](6) NULL,
	[ylamksuorv_2010] [varchar](4) NULL,
	[ylamksuorlk_2010] [varchar](1) NULL,
	[ylamktutkkmaak_2010] [varchar](2) NULL,
	[ylamktutkjarj_2010] [varchar](10) NULL,
	[ylamktutkkoulk_2010] [varchar](6) NULL,
	[alkksuorv_2010] [varchar](4) NULL,
	[alkksuorlk_2010] [varchar](1) NULL,
	[alkktutkkmaak_2010] [varchar](2) NULL,
	[alkktutkjarj_2010] [varchar](10) NULL,
	[alkktutkkoulk_2010] [varchar](6) NULL,
	[ylkksuorv_2010] [varchar](4) NULL,
	[ylkksuorlk_2010] [varchar](1) NULL,
	[ylkktutkkmaak_2010] [varchar](2) NULL,
	[ylkktutkjarj_2010] [varchar](10) NULL,
	[ylkktutkkoulk_2010] [varchar](6) NULL,
	[tksuorv_2010] [varchar](4) NULL,
	[tksuorlk_2010] [varchar](1) NULL,
	[tktutkkmaak_2010] [varchar](2) NULL,
	[tktutkjarj_2010] [varchar](10) NULL,
	[tktutkkoulk_2010] [varchar](6) NULL,
	[muutasuorv_2010] [varchar](4) NULL,
	[muutasuorlk_2010] [varchar](1) NULL,
	[muutatutkkmaak_2010] [varchar](2) NULL,
	[muutatutkjarj_2010] [varchar](10) NULL,
	[muutatutkkoulk_2010] [varchar](6) NULL,
	[amkopiskkoulk_2010] [varchar](6) NULL,
	[amkopiskjarj_2010] [varchar](10) NULL,
	[amkkmaak_2010] [varchar](2) NULL,
	[amkolotamm_2010] [varchar](1) NULL,
	[amkolosyys_2010] [varchar](1) NULL,
	[ylamkopiskkoulk_2010] [varchar](6) NULL,
	[ylamkopiskjarj_2010] [varchar](10) NULL,
	[ylamkkmaak_2010] [varchar](2) NULL,
	[ylamkolotamm_2010] [varchar](1) NULL,
	[ylamkolosyys_2010] [varchar](1) NULL,
	[alkkopiskkoulk_2010] [varchar](6) NULL,
	[alkkopiskjarj_2010] [varchar](10) NULL,
	[alkkkmaak_2010] [varchar](2) NULL,
	[alkkolotamm_2010] [varchar](1) NULL,
	[alkkolosyys_2010] [varchar](1) NULL,
	[ylkkopiskkoulk_2010] [varchar](6) NULL,
	[ylkkopiskjarj_2010] [varchar](10) NULL,
	[ylkkkmaak_2010] [varchar](2) NULL,
	[ylkkolotamm_2010] [varchar](1) NULL,
	[ylkkolosyys_2010] [varchar](1) NULL,
	[tkopiskkoulk_2010] [varchar](6) NULL,
	[tkopiskjarj_2010] [varchar](10) NULL,
	[tkkmaak_2010] [varchar](2) NULL,
	[tkolotamm_2010] [varchar](1) NULL,
	[tkolosyys_2010] [varchar](1) NULL,
	[muutaopiskkoulk_2010] [varchar](6) NULL,
	[muutaopiskjarj_2010] [varchar](10) NULL,
	[muutakmaak_2010] [varchar](2) NULL,
	[muutaolotamm_2010] [varchar](1) NULL,
	[muutaolosyys_2010] [varchar](1) NULL,
	[ptoim1r5_2010] [varchar](2) NULL,
	[amas_2010] [varchar](1) NULL,
	[amksuorv_2011] [varchar](4) NULL,
	[amksuorlk_2011] [varchar](1) NULL,
	[amktutkkmaak_2011] [varchar](2) NULL,
	[amktutkjarj_2011] [varchar](10) NULL,
	[amktutkkoulk_2011] [varchar](6) NULL,
	[ylamksuorv_2011] [varchar](4) NULL,
	[ylamksuorlk_2011] [varchar](1) NULL,
	[ylamktutkkmaak_2011] [varchar](2) NULL,
	[ylamktutkjarj_2011] [varchar](10) NULL,
	[ylamktutkkoulk_2011] [varchar](6) NULL,
	[alkksuorv_2011] [varchar](4) NULL,
	[alkksuorlk_2011] [varchar](1) NULL,
	[alkktutkkmaak_2011] [varchar](2) NULL,
	[alkktutkjarj_2011] [varchar](10) NULL,
	[alkktutkkoulk_2011] [varchar](6) NULL,
	[ylkksuorv_2011] [varchar](4) NULL,
	[ylkksuorlk_2011] [varchar](1) NULL,
	[ylkktutkkmaak_2011] [varchar](2) NULL,
	[ylkktutkjarj_2011] [varchar](10) NULL,
	[ylkktutkkoulk_2011] [varchar](6) NULL,
	[tksuorv_2011] [varchar](4) NULL,
	[tksuorlk_2011] [varchar](1) NULL,
	[tktutkkmaak_2011] [varchar](2) NULL,
	[tktutkjarj_2011] [varchar](10) NULL,
	[tktutkkoulk_2011] [varchar](6) NULL,
	[muutasuorv_2011] [varchar](4) NULL,
	[muutasuorlk_2011] [varchar](1) NULL,
	[muutatutkkmaak_2011] [varchar](2) NULL,
	[muutatutkjarj_2011] [varchar](10) NULL,
	[muutatutkkoulk_2011] [varchar](6) NULL,
	[amkopiskkoulk_2011] [varchar](6) NULL,
	[amkopiskjarj_2011] [varchar](10) NULL,
	[amkkmaak_2011] [varchar](2) NULL,
	[amkolotamm_2011] [varchar](1) NULL,
	[amkolosyys_2011] [varchar](1) NULL,
	[ylamkopiskkoulk_2011] [varchar](6) NULL,
	[ylamkopiskjarj_2011] [varchar](10) NULL,
	[ylamkkmaak_2011] [varchar](2) NULL,
	[ylamkolotamm_2011] [varchar](1) NULL,
	[ylamkolosyys_2011] [varchar](1) NULL,
	[alkkopiskkoulk_2011] [varchar](6) NULL,
	[alkkopiskjarj_2011] [varchar](10) NULL,
	[alkkkmaak_2011] [varchar](2) NULL,
	[alkkolotamm_2011] [varchar](1) NULL,
	[alkkolosyys_2011] [varchar](1) NULL,
	[ylkkopiskkoulk_2011] [varchar](6) NULL,
	[ylkkopiskjarj_2011] [varchar](10) NULL,
	[ylkkkmaak_2011] [varchar](2) NULL,
	[ylkkolotamm_2011] [varchar](1) NULL,
	[ylkkolosyys_2011] [varchar](1) NULL,
	[tkopiskkoulk_2011] [varchar](6) NULL,
	[tkopiskjarj_2011] [varchar](10) NULL,
	[tkkmaak_2011] [varchar](2) NULL,
	[tkolotamm_2011] [varchar](1) NULL,
	[tkolosyys_2011] [varchar](1) NULL,
	[muutaopiskkoulk_2011] [varchar](6) NULL,
	[muutaopiskjarj_2011] [varchar](10) NULL,
	[muutakmaak_2011] [varchar](2) NULL,
	[muutaolotamm_2011] [varchar](1) NULL,
	[muutaolosyys_2011] [varchar](1) NULL,
	[ptoim1r5_2011] [varchar](2) NULL,
	[amas_2011] [varchar](1) NULL,
	[amksuorv_2012] [varchar](4) NULL,
	[amksuorlk_2012] [varchar](1) NULL,
	[amktutkkmaak_2012] [varchar](2) NULL,
	[amktutkjarj_2012] [varchar](10) NULL,
	[amktutkkoulk_2012] [varchar](6) NULL,
	[ylamksuorv_2012] [varchar](4) NULL,
	[ylamksuorlk_2012] [varchar](1) NULL,
	[ylamktutkkmaak_2012] [varchar](2) NULL,
	[ylamktutkjarj_2012] [varchar](10) NULL,
	[ylamktutkkoulk_2012] [varchar](6) NULL,
	[alkksuorv_2012] [varchar](4) NULL,
	[alkksuorlk_2012] [varchar](1) NULL,
	[alkktutkkmaak_2012] [varchar](2) NULL,
	[alkktutkjarj_2012] [varchar](10) NULL,
	[alkktutkkoulk_2012] [varchar](6) NULL,
	[ylkksuorv_2012] [varchar](4) NULL,
	[ylkksuorlk_2012] [varchar](1) NULL,
	[ylkktutkkmaak_2012] [varchar](2) NULL,
	[ylkktutkjarj_2012] [varchar](10) NULL,
	[ylkktutkkoulk_2012] [varchar](6) NULL,
	[tksuorv_2012] [varchar](4) NULL,
	[tksuorlk_2012] [varchar](1) NULL,
	[tktutkkmaak_2012] [varchar](2) NULL,
	[tktutkjarj_2012] [varchar](10) NULL,
	[tktutkkoulk_2012] [varchar](6) NULL,
	[muutasuorv_2012] [varchar](4) NULL,
	[muutasuorlk_2012] [varchar](1) NULL,
	[muutatutkkmaak_2012] [varchar](2) NULL,
	[muutatutkjarj_2012] [varchar](10) NULL,
	[muutatutkkoulk_2012] [varchar](6) NULL,
	[amkopiskkoulk_2012] [varchar](6) NULL,
	[amkopiskjarj_2012] [varchar](10) NULL,
	[amkkmaak_2012] [varchar](2) NULL,
	[amkolotamm_2012] [varchar](1) NULL,
	[amkolosyys_2012] [varchar](1) NULL,
	[ylamkopiskkoulk_2012] [varchar](6) NULL,
	[ylamkopiskjarj_2012] [varchar](10) NULL,
	[ylamkkmaak_2012] [varchar](2) NULL,
	[ylamkolotamm_2012] [varchar](1) NULL,
	[ylamkolosyys_2012] [varchar](1) NULL,
	[alkkopiskkoulk_2012] [varchar](6) NULL,
	[alkkopiskjarj_2012] [varchar](10) NULL,
	[alkkkmaak_2012] [varchar](2) NULL,
	[alkkolotamm_2012] [varchar](1) NULL,
	[alkkolosyys_2012] [varchar](1) NULL,
	[ylkkopiskkoulk_2012] [varchar](6) NULL,
	[ylkkopiskjarj_2012] [varchar](10) NULL,
	[ylkkkmaak_2012] [varchar](2) NULL,
	[ylkkolotamm_2012] [varchar](1) NULL,
	[ylkkolosyys_2012] [varchar](1) NULL,
	[tkopiskkoulk_2012] [varchar](6) NULL,
	[tkopiskjarj_2012] [varchar](10) NULL,
	[tkkmaak_2012] [varchar](2) NULL,
	[tkolotamm_2012] [varchar](1) NULL,
	[tkolosyys_2012] [varchar](1) NULL,
	[muutaopiskkoulk_2012] [varchar](6) NULL,
	[muutaopiskjarj_2012] [varchar](10) NULL,
	[muutakmaak_2012] [varchar](2) NULL,
	[muutaolotamm_2012] [varchar](1) NULL,
	[muutaolosyys_2012] [varchar](1) NULL,
	[ptoim1r5_2012] [varchar](2) NULL,
	[amas_2012] [varchar](1) NULL,
	[amksuorv_2013] [varchar](4) NULL,
	[amksuorlk_2013] [varchar](1) NULL,
	[amktutkkmaak_2013] [varchar](2) NULL,
	[amktutkjarj_2013] [varchar](10) NULL,
	[amktutkkoulk_2013] [varchar](6) NULL,
	[ylamksuorv_2013] [varchar](4) NULL,
	[ylamksuorlk_2013] [varchar](1) NULL,
	[ylamktutkkmaak_2013] [varchar](2) NULL,
	[ylamktutkjarj_2013] [varchar](10) NULL,
	[ylamktutkkoulk_2013] [varchar](6) NULL,
	[alkksuorv_2013] [varchar](4) NULL,
	[alkksuorlk_2013] [varchar](1) NULL,
	[alkktutkkmaak_2013] [varchar](2) NULL,
	[alkktutkjarj_2013] [varchar](10) NULL,
	[alkktutkkoulk_2013] [varchar](6) NULL,
	[ylkksuorv_2013] [varchar](4) NULL,
	[ylkksuorlk_2013] [varchar](1) NULL,
	[ylkktutkkmaak_2013] [varchar](2) NULL,
	[ylkktutkjarj_2013] [varchar](10) NULL,
	[ylkktutkkoulk_2013] [varchar](6) NULL,
	[tksuorv_2013] [varchar](4) NULL,
	[tksuorlk_2013] [varchar](1) NULL,
	[tktutkkmaak_2013] [varchar](2) NULL,
	[tktutkjarj_2013] [varchar](10) NULL,
	[tktutkkoulk_2013] [varchar](6) NULL,
	[muutasuorv_2013] [varchar](4) NULL,
	[muutasuorlk_2013] [varchar](1) NULL,
	[muutatutkkmaak_2013] [varchar](2) NULL,
	[muutatutkjarj_2013] [varchar](10) NULL,
	[muutatutkkoulk_2013] [varchar](6) NULL,
	[amkopiskkoulk_2013] [varchar](6) NULL,
	[amkopiskjarj_2013] [varchar](10) NULL,
	[amkkmaak_2013] [varchar](2) NULL,
	[amkolotamm_2013] [varchar](1) NULL,
	[amkolosyys_2013] [varchar](1) NULL,
	[ylamkopiskkoulk_2013] [varchar](6) NULL,
	[ylamkopiskjarj_2013] [varchar](10) NULL,
	[ylamkkmaak_2013] [varchar](2) NULL,
	[ylamkolotamm_2013] [varchar](1) NULL,
	[ylamkolosyys_2013] [varchar](1) NULL,
	[alkkopiskkoulk_2013] [varchar](6) NULL,
	[alkkopiskjarj_2013] [varchar](10) NULL,
	[alkkkmaak_2013] [varchar](2) NULL,
	[alkkolotamm_2013] [varchar](1) NULL,
	[alkkolosyys_2013] [varchar](1) NULL,
	[ylkkopiskkoulk_2013] [varchar](6) NULL,
	[ylkkopiskjarj_2013] [varchar](10) NULL,
	[ylkkkmaak_2013] [varchar](2) NULL,
	[ylkkolotamm_2013] [varchar](1) NULL,
	[ylkkolosyys_2013] [varchar](1) NULL,
	[tkopiskkoulk_2013] [varchar](6) NULL,
	[tkopiskjarj_2013] [varchar](10) NULL,
	[tkkmaak_2013] [varchar](2) NULL,
	[tkolotamm_2013] [varchar](1) NULL,
	[tkolosyys_2013] [varchar](1) NULL,
	[muutaopiskkoulk_2013] [varchar](6) NULL,
	[muutaopiskjarj_2013] [varchar](10) NULL,
	[muutakmaak_2013] [varchar](2) NULL,
	[muutaolotamm_2013] [varchar](1) NULL,
	[muutaolosyys_2013] [varchar](1) NULL,
	[ptoim1r5_2013] [varchar](2) NULL,
	[amas_2013] [varchar](1) NULL,
	[amksuorv_2014] [varchar](4) NULL,
	[amksuorlk_2014] [varchar](1) NULL,
	[amktutkkmaak_2014] [varchar](2) NULL,
	[amktutkjarj_2014] [varchar](10) NULL,
	[amktutkkoulk_2014] [varchar](6) NULL,
	[ylamksuorv_2014] [varchar](4) NULL,
	[ylamksuorlk_2014] [varchar](1) NULL,
	[ylamktutkkmaak_2014] [varchar](2) NULL,
	[ylamktutkjarj_2014] [varchar](10) NULL,
	[ylamktutkkoulk_2014] [varchar](6) NULL,
	[alkksuorv_2014] [varchar](4) NULL,
	[alkksuorlk_2014] [varchar](1) NULL,
	[alkktutkkmaak_2014] [varchar](2) NULL,
	[alkktutkjarj_2014] [varchar](10) NULL,
	[alkktutkkoulk_2014] [varchar](6) NULL,
	[ylkksuorv_2014] [varchar](4) NULL,
	[ylkksuorlk_2014] [varchar](1) NULL,
	[ylkktutkkmaak_2014] [varchar](2) NULL,
	[ylkktutkjarj_2014] [varchar](10) NULL,
	[ylkktutkkoulk_2014] [varchar](6) NULL,
	[tksuorv_2014] [varchar](4) NULL,
	[tksuorlk_2014] [varchar](1) NULL,
	[tktutkkmaak_2014] [varchar](2) NULL,
	[tktutkjarj_2014] [varchar](10) NULL,
	[tktutkkoulk_2014] [varchar](6) NULL,
	[muutasuorv_2014] [varchar](4) NULL,
	[muutasuorlk_2014] [varchar](1) NULL,
	[muutatutkkmaak_2014] [varchar](2) NULL,
	[muutatutkjarj_2014] [varchar](10) NULL,
	[muutatutkkoulk_2014] [varchar](6) NULL,
	[amkopiskkoulk_2014] [varchar](6) NULL,
	[amkopiskjarj_2014] [varchar](10) NULL,
	[amkkmaak_2014] [varchar](2) NULL,
	[amkolotamm_2014] [varchar](1) NULL,
	[amkolosyys_2014] [varchar](1) NULL,
	[ylamkopiskkoulk_2014] [varchar](6) NULL,
	[ylamkopiskjarj_2014] [varchar](10) NULL,
	[ylamkkmaak_2014] [varchar](2) NULL,
	[ylamkolotamm_2014] [varchar](1) NULL,
	[ylamkolosyys_2014] [varchar](1) NULL,
	[alkkopiskkoulk_2014] [varchar](6) NULL,
	[alkkopiskjarj_2014] [varchar](10) NULL,
	[alkkkmaak_2014] [varchar](2) NULL,
	[alkkolotamm_2014] [varchar](1) NULL,
	[alkkolosyys_2014] [varchar](1) NULL,
	[ylkkopiskkoulk_2014] [varchar](6) NULL,
	[ylkkopiskjarj_2014] [varchar](10) NULL,
	[ylkkkmaak_2014] [varchar](2) NULL,
	[ylkkolotamm_2014] [varchar](1) NULL,
	[ylkkolosyys_2014] [varchar](1) NULL,
	[tkopiskkoulk_2014] [varchar](6) NULL,
	[tkopiskjarj_2014] [varchar](10) NULL,
	[tkkmaak_2014] [varchar](2) NULL,
	[tkolotamm_2014] [varchar](1) NULL,
	[tkolosyys_2014] [varchar](1) NULL,
	[muutaopiskkoulk_2014] [varchar](6) NULL,
	[muutaopiskjarj_2014] [varchar](10) NULL,
	[muutakmaak_2014] [varchar](2) NULL,
	[muutaolotamm_2014] [varchar](1) NULL,
	[muutaolosyys_2014] [varchar](1) NULL,
	[ptoim1r5_2014] [varchar](2) NULL,
	[amas_2014] [varchar](1) NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](13) NOT NULL,
	[rivinumero] [bigint] NULL,
	[aineistorivinumero] [bigint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_surrogaattiavaimet]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_surrogaattiavaimet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_surrogaattiavaimet](
	[tilv] [varchar](4) NULL,
	[lahde] [varchar](2) NULL,
	[sp] [varchar](1) NULL,
	[syntv] [varchar](4) NULL,
	[aikielir1] [varchar](2) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[alvv_kk] [varchar](4) NULL,
	[allk_kk] [varchar](1) NULL,
	[ololk] [varchar](1) NULL,
	[klaji] [varchar](2) NULL,
	[jarj] [varchar](10) NULL,
	[kkun] [varchar](3) NULL,
	[koulk] [varchar](6) NULL,
	[pohjkoulk] [varchar](6) NULL,
	[rahlahde] [varchar](1) NULL,
	[tietolahde] [varchar](13) NOT NULL,
	[rivinumero] [bigint] NULL,
	[aineistorivinumero] [bigint] NULL,
	[lkm] [int] NULL,
	[amk_2000] [int] NULL,
	[ylamk_2000] [int] NULL,
	[alkk_2000] [int] NULL,
	[ylkk_2000] [int] NULL,
	[tk_2000] [int] NULL,
	[muuta_2000] [int] NULL,
	[amk_2001] [int] NULL,
	[ylamk_2001] [int] NULL,
	[alkk_2001] [int] NULL,
	[ylkk_2001] [int] NULL,
	[tk_2001] [int] NULL,
	[muuta_2001] [int] NULL,
	[amk_2002] [int] NULL,
	[ylamk_2002] [int] NULL,
	[alkk_2002] [int] NULL,
	[ylkk_2002] [int] NULL,
	[tk_2002] [int] NULL,
	[muuta_2002] [int] NULL,
	[amk_2003] [int] NULL,
	[ylamk_2003] [int] NULL,
	[alkk_2003] [int] NULL,
	[ylkk_2003] [int] NULL,
	[tk_2003] [int] NULL,
	[muuta_2003] [int] NULL,
	[amk_2004] [int] NULL,
	[ylamk_2004] [int] NULL,
	[alkk_2004] [int] NULL,
	[ylkk_2004] [int] NULL,
	[tk_2004] [int] NULL,
	[muuta_2004] [int] NULL,
	[amk_2005] [int] NULL,
	[ylamk_2005] [int] NULL,
	[alkk_2005] [int] NULL,
	[ylkk_2005] [int] NULL,
	[tk_2005] [int] NULL,
	[muuta_2005] [int] NULL,
	[amk_2006] [int] NULL,
	[ylamk_2006] [int] NULL,
	[alkk_2006] [int] NULL,
	[ylkk_2006] [int] NULL,
	[tk_2006] [int] NULL,
	[muuta_2006] [int] NULL,
	[amk_2007] [int] NULL,
	[ylamk_2007] [int] NULL,
	[alkk_2007] [int] NULL,
	[ylkk_2007] [int] NULL,
	[tk_2007] [int] NULL,
	[muuta_2007] [int] NULL,
	[amk_2008] [int] NULL,
	[ylamk_2008] [int] NULL,
	[alkk_2008] [int] NULL,
	[ylkk_2008] [int] NULL,
	[tk_2008] [int] NULL,
	[muuta_2008] [int] NULL,
	[amkopisk_2000] [int] NULL,
	[ylamkopisk_2000] [int] NULL,
	[alkkopisk_2000] [int] NULL,
	[ylkkopisk_2000] [int] NULL,
	[tkopisk_2000] [int] NULL,
	[muutaopisk_2000] [int] NULL,
	[amkopisk_2001] [int] NULL,
	[ylamkopisk_2001] [int] NULL,
	[alkkopisk_2001] [int] NULL,
	[ylkkopisk_2001] [int] NULL,
	[tkopisk_2001] [int] NULL,
	[muutaopisk_2001] [int] NULL,
	[amkopisk_2002] [int] NULL,
	[ylamkopisk_2002] [int] NULL,
	[alkkopisk_2002] [int] NULL,
	[ylkkopisk_2002] [int] NULL,
	[tkopisk_2002] [int] NULL,
	[muutaopisk_2002] [int] NULL,
	[amkopisk_2003] [int] NULL,
	[ylamkopisk_2003] [int] NULL,
	[alkkopisk_2003] [int] NULL,
	[ylkkopisk_2003] [int] NULL,
	[tkopisk_2003] [int] NULL,
	[muutaopisk_2003] [int] NULL,
	[amkopisk_2004] [int] NULL,
	[ylamkopisk_2004] [int] NULL,
	[alkkopisk_2004] [int] NULL,
	[ylkkopisk_2004] [int] NULL,
	[tkopisk_2004] [int] NULL,
	[muutaopisk_2004] [int] NULL,
	[amkopisk_2005] [int] NULL,
	[ylamkopisk_2005] [int] NULL,
	[alkkopisk_2005] [int] NULL,
	[ylkkopisk_2005] [int] NULL,
	[tkopisk_2005] [int] NULL,
	[muutaopisk_2005] [int] NULL,
	[amkopisk_2006] [int] NULL,
	[ylamkopisk_2006] [int] NULL,
	[alkkopisk_2006] [int] NULL,
	[ylkkopisk_2006] [int] NULL,
	[tkopisk_2006] [int] NULL,
	[muutaopisk_2006] [int] NULL,
	[amkopisk_2007] [int] NULL,
	[ylamkopisk_2007] [int] NULL,
	[alkkopisk_2007] [int] NULL,
	[ylkkopisk_2007] [int] NULL,
	[tkopisk_2007] [int] NULL,
	[muutaopisk_2007] [int] NULL,
	[amkopisk_2008] [int] NULL,
	[ylamkopisk_2008] [int] NULL,
	[alkkopisk_2008] [int] NULL,
	[ylkkopisk_2008] [int] NULL,
	[tkopisk_2008] [int] NULL,
	[muutaopisk_2008] [int] NULL,
	[ptoim1r5_2000] [int] NULL,
	[ptoim1r5_2001] [int] NULL,
	[ptoim1r5_2002] [int] NULL,
	[ptoim1r5_2003] [int] NULL,
	[ptoim1r5_2004] [int] NULL,
	[ptoim1r5_2005] [int] NULL,
	[ptoim1r5_2006] [int] NULL,
	[ptoim1r5_2007] [int] NULL,
	[ptoim1r5_2008] [int] NULL,
	[amk_2009] [int] NULL,
	[ylamk_2009] [int] NULL,
	[alkk_2009] [int] NULL,
	[ylkk_2009] [int] NULL,
	[tk_2009] [int] NULL,
	[muuta_2009] [int] NULL,
	[amkopisk_2009] [int] NULL,
	[ylamkopisk_2009] [int] NULL,
	[alkkopisk_2009] [int] NULL,
	[ylkkopisk_2009] [int] NULL,
	[tkopisk_2009] [int] NULL,
	[muutaopisk_2009] [int] NULL,
	[ptoim1r5_2009] [int] NULL,
	[amk_2010] [int] NULL,
	[ylamk_2010] [int] NULL,
	[alkk_2010] [int] NULL,
	[ylkk_2010] [int] NULL,
	[tk_2010] [int] NULL,
	[muuta_2010] [int] NULL,
	[amkopisk_2010] [int] NULL,
	[ylamkopisk_2010] [int] NULL,
	[alkkopisk_2010] [int] NULL,
	[ylkkopisk_2010] [int] NULL,
	[tkopisk_2010] [int] NULL,
	[muutaopisk_2010] [int] NULL,
	[ptoim1r5_2010] [int] NULL,
	[amk_2011] [int] NULL,
	[ylamk_2011] [int] NULL,
	[alkk_2011] [int] NULL,
	[ylkk_2011] [int] NULL,
	[tk_2011] [int] NULL,
	[muuta_2011] [int] NULL,
	[amkopisk_2011] [int] NULL,
	[ylamkopisk_2011] [int] NULL,
	[alkkopisk_2011] [int] NULL,
	[ylkkopisk_2011] [int] NULL,
	[tkopisk_2011] [int] NULL,
	[muutaopisk_2011] [int] NULL,
	[ptoim1r5_2011] [int] NULL,
	[amk_2012] [int] NULL,
	[ylamk_2012] [int] NULL,
	[alkk_2012] [int] NULL,
	[ylkk_2012] [int] NULL,
	[tk_2012] [int] NULL,
	[muuta_2012] [int] NULL,
	[amkopisk_2012] [int] NULL,
	[ylamkopisk_2012] [int] NULL,
	[alkkopisk_2012] [int] NULL,
	[ylkkopisk_2012] [int] NULL,
	[tkopisk_2012] [int] NULL,
	[muutaopisk_2012] [int] NULL,
	[ptoim1r5_2012] [int] NULL,
	[amk_2013] [int] NULL,
	[ylamk_2013] [int] NULL,
	[alkk_2013] [int] NULL,
	[ylkk_2013] [int] NULL,
	[tk_2013] [int] NULL,
	[muuta_2013] [int] NULL,
	[amkopisk_2013] [int] NULL,
	[ylamkopisk_2013] [int] NULL,
	[alkkopisk_2013] [int] NULL,
	[ylkkopisk_2013] [int] NULL,
	[tkopisk_2013] [int] NULL,
	[muutaopisk_2013] [int] NULL,
	[ptoim1r5_2013] [int] NULL,
	[amk_2014] [int] NULL,
	[ylamk_2014] [int] NULL,
	[alkk_2014] [int] NULL,
	[ylkk_2014] [int] NULL,
	[tk_2014] [int] NULL,
	[muuta_2014] [int] NULL,
	[amkopisk_2014] [int] NULL,
	[ylamkopisk_2014] [int] NULL,
	[alkkopisk_2014] [int] NULL,
	[ylkkopisk_2014] [int] NULL,
	[tkopisk_2014] [int] NULL,
	[muutaopisk_2014] [int] NULL,
	[ptoim1r5_2014] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_surrogaattiavaimet_UNPIVOT]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_surrogaattiavaimet_UNPIVOT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_surrogaattiavaimet_UNPIVOT](
	[tilv] [varchar](255) NULL,
	[lahde] [varchar](255) NULL,
	[sp] [varchar](255) NULL,
	[syntv] [varchar](255) NULL,
	[aikielir1] [varchar](255) NULL,
	[alvv] [varchar](255) NULL,
	[allk] [varchar](255) NULL,
	[alvv_kk] [varchar](255) NULL,
	[allk_kk] [varchar](255) NULL,
	[ololk] [varchar](255) NULL,
	[klaji] [varchar](255) NULL,
	[jarj] [varchar](255) NULL,
	[kkun] [varchar](255) NULL,
	[koulk] [varchar](255) NULL,
	[pohjkoulk] [varchar](255) NULL,
	[rahlahde] [varchar](255) NULL,
	[tietolahde] [varchar](255) NULL,
	[rivinumero] [varchar](255) NULL,
	[aineistorivinumero] [numeric](18, 0) NULL,
	[sarakeryhma_id] [nvarchar](128) NULL,
	[sarakeryhma_arvo] [int] NULL,
	[lkm] [varchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_sa_K3_9_ja_K3_10_surrogaattiavaimet_PIVOT]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_sa_K3_9_ja_K3_10_surrogaattiavaimet_PIVOT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_sa_K3_9_ja_K3_10_surrogaattiavaimet_PIVOT](
	[tilv] [varchar](255) NULL,
	[lahde] [varchar](255) NULL,
	[sp] [varchar](255) NULL,
	[syntv] [varchar](255) NULL,
	[aikielir1] [varchar](255) NULL,
	[alvv] [varchar](255) NULL,
	[allk] [varchar](255) NULL,
	[alvv_kk] [varchar](255) NULL,
	[allk_kk] [varchar](255) NULL,
	[ololk] [varchar](255) NULL,
	[klaji] [varchar](255) NULL,
	[ophal] [varchar](255) NULL,
	[jarj] [varchar](255) NULL,
	[kkun] [varchar](255) NULL,
	[koulk] [varchar](255) NULL,
	[pohjkoulk] [varchar](255) NULL,
	[rahlahde] [varchar](255) NULL,
	[tietolahde] [varchar](255) NULL,
	[rivinumero] [varchar](255) NULL,
	[aineistorivinumero] [numeric](18, 0) NULL,
	[lkm_int] [int] NULL,
	[Sarakeryhma_ID1] [nvarchar](128) NULL,
	[Sarakeryhma_arvo1] [int] NULL,
	[Sarakeryhma_ID2] [nvarchar](128) NULL,
	[Sarakeryhma_arvo2] [int] NULL,
	[Sarakeryhma_ID3] [nvarchar](128) NULL,
	[Sarakeryhma_arvo3] [int] NULL,
	[Sarakeryhma_ID4] [nvarchar](128) NULL,
	[Sarakeryhma_arvo4] [int] NULL,
	[Sarakeryhma_ID5] [nvarchar](128) NULL,
	[Sarakeryhma_arvo5] [int] NULL,
	[Sarakeryhma_ID6] [nvarchar](128) NULL,
	[Sarakeryhma_arvo6] [int] NULL,
	[Sarakeryhma_ID7] [nvarchar](128) NULL,
	[Sarakeryhma_arvo7] [int] NULL,
	[Sarakeryhma_ID8] [nvarchar](128) NULL,
	[Sarakeryhma_arvo8] [int] NULL,
	[Sarakeryhma_ID9] [nvarchar](128) NULL,
	[Sarakeryhma_arvo9] [int] NULL,
	[Sarakeryhma_ID10] [nvarchar](128) NULL,
	[Sarakeryhma_arvo10] [int] NULL,
	[Sarakeryhma_ID11] [nvarchar](128) NULL,
	[Sarakeryhma_arvo11] [int] NULL,
	[Sarakeryhma_ID12] [nvarchar](128) NULL,
	[Sarakeryhma_arvo12] [int] NULL,
	[Sarakeryhma_ID13] [nvarchar](128) NULL,
	[Sarakeryhma_arvo13] [int] NULL,
	[Sarakeryhma_ID14] [nvarchar](128) NULL,
	[Sarakeryhma_arvo14] [int] NULL,
	[Sarakeryhma_ID15] [nvarchar](128) NULL,
	[Sarakeryhma_arvo15] [int] NULL,
	[Sarakeryhma_ID16] [nvarchar](128) NULL,
	[Sarakeryhma_arvo16] [int] NULL,
	[Sarakeryhma_ID17] [nvarchar](128) NULL,
	[Sarakeryhma_arvo17] [int] NULL,
	[Sarakeryhma_ID18] [nvarchar](128) NULL,
	[Sarakeryhma_arvo18] [int] NULL,
	[Sarakeryhma_ID19] [nvarchar](128) NULL,
	[Sarakeryhma_arvo19] [int] NULL,
	[Sarakeryhma_ID20] [nvarchar](128) NULL,
	[Sarakeryhma_arvo20] [int] NULL,
	[Sarakeryhma_ID21] [nvarchar](128) NULL,
	[Sarakeryhma_arvo21] [int] NULL,
	[Sarakeryhma_ID22] [nvarchar](128) NULL,
	[Sarakeryhma_arvo22] [int] NULL,
	[Sarakeryhma_ID23] [nvarchar](128) NULL,
	[Sarakeryhma_arvo23] [int] NULL,
	[Sarakeryhma_ID24] [nvarchar](128) NULL,
	[Sarakeryhma_arvo24] [int] NULL,
	[Sarakeryhma_ID25] [nvarchar](128) NULL,
	[Sarakeryhma_arvo25] [int] NULL,
	[Sarakeryhma_ID26] [nvarchar](128) NULL,
	[Sarakeryhma_arvo26] [int] NULL,
	[Sarakeryhma_ID27] [nvarchar](128) NULL,
	[Sarakeryhma_arvo27] [int] NULL,
	[Sarakeryhma_ID28] [nvarchar](128) NULL,
	[Sarakeryhma_arvo28] [int] NULL,
	[Sarakeryhma_ID29] [nvarchar](128) NULL,
	[Sarakeryhma_arvo29] [int] NULL,
	[Sarakeryhma_ID30] [nvarchar](128) NULL,
	[Sarakeryhma_arvo30] [int] NULL,
	[Sarakeryhma_ID31] [nvarchar](128) NULL,
	[Sarakeryhma_arvo31] [int] NULL,
	[Sarakeryhma_ID32] [nvarchar](128) NULL,
	[Sarakeryhma_arvo32] [int] NULL,
	[Sarakeryhma_ID33] [nvarchar](128) NULL,
	[Sarakeryhma_arvo33] [int] NULL,
	[Sarakeryhma_ID34] [nvarchar](128) NULL,
	[Sarakeryhma_arvo34] [int] NULL,
	[Sarakeryhma_ID35] [nvarchar](128) NULL,
	[Sarakeryhma_arvo35] [int] NULL,
	[Sarakeryhma_ID36] [nvarchar](128) NULL,
	[Sarakeryhma_arvo36] [int] NULL,
	[Sarakeryhma_ID37] [nvarchar](128) NULL,
	[Sarakeryhma_arvo37] [int] NULL,
	[Sarakeryhma_ID38] [nvarchar](128) NULL,
	[Sarakeryhma_arvo38] [int] NULL,
	[Sarakeryhma_ID39] [nvarchar](128) NULL,
	[Sarakeryhma_arvo39] [int] NULL,
	[Sarakeryhma_ID40] [nvarchar](128) NULL,
	[Sarakeryhma_arvo40] [int] NULL,
	[Sarakeryhma_ID41] [nvarchar](128) NULL,
	[Sarakeryhma_arvo41] [int] NULL,
	[Sarakeryhma_ID42] [nvarchar](128) NULL,
	[Sarakeryhma_arvo42] [int] NULL,
	[Sarakeryhma_ID43] [nvarchar](128) NULL,
	[Sarakeryhma_arvo43] [int] NULL,
	[Sarakeryhma_ID44] [nvarchar](128) NULL,
	[Sarakeryhma_arvo44] [int] NULL,
	[Sarakeryhma_ID45] [nvarchar](128) NULL,
	[Sarakeryhma_arvo45] [int] NULL,
	[Sarakeryhma_ID46] [nvarchar](128) NULL,
	[Sarakeryhma_arvo46] [int] NULL,
	[Sarakeryhma_ID47] [nvarchar](128) NULL,
	[Sarakeryhma_arvo47] [int] NULL,
	[Sarakeryhma_ID48] [nvarchar](128) NULL,
	[Sarakeryhma_arvo48] [int] NULL,
	[Sarakeryhma_ID49] [nvarchar](128) NULL,
	[Sarakeryhma_arvo49] [int] NULL,
	[Sarakeryhma_ID50] [nvarchar](128) NULL,
	[Sarakeryhma_arvo50] [int] NULL,
	[Sarakeryhma_ID51] [nvarchar](128) NULL,
	[Sarakeryhma_arvo51] [int] NULL,
	[Sarakeryhma_ID52] [nvarchar](128) NULL,
	[Sarakeryhma_arvo52] [int] NULL,
	[Sarakeryhma_ID53] [nvarchar](128) NULL,
	[Sarakeryhma_arvo53] [int] NULL,
	[Sarakeryhma_ID54] [nvarchar](128) NULL,
	[Sarakeryhma_arvo54] [int] NULL,
	[Sarakeryhma_ID55] [nvarchar](128) NULL,
	[Sarakeryhma_arvo55] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_sa_K3_9_ja_K3_10_surrogaattiavaimet_UNPIVOT]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_sa_K3_9_ja_K3_10_surrogaattiavaimet_UNPIVOT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_sa_K3_9_ja_K3_10_surrogaattiavaimet_UNPIVOT](
	[aineisto] [varchar](5) NOT NULL,
	[tilv] [varchar](255) NULL,
	[lahde] [varchar](255) NULL,
	[sp] [varchar](255) NULL,
	[syntv] [varchar](255) NULL,
	[aikielir1] [varchar](255) NULL,
	[alvv] [varchar](255) NULL,
	[allk] [varchar](255) NULL,
	[alvv_kk] [varchar](255) NULL,
	[allk_kk] [varchar](255) NULL,
	[ololk] [varchar](255) NULL,
	[klaji] [varchar](255) NULL,
	[ophal] [varchar](255) NULL,
	[jarj] [varchar](255) NULL,
	[kkun] [varchar](255) NULL,
	[koulk] [varchar](255) NULL,
	[pohjkoulk] [varchar](255) NULL,
	[rahlahde] [varchar](255) NULL,
	[tietolahde] [varchar](255) NULL,
	[rivinumero] [varchar](255) NULL,
	[aineistorivinumero] [numeric](18, 0) NULL,
	[sarakeryhma_id] [nvarchar](128) NULL,
	[sarakeryhma_arvo] [int] NULL,
	[lkm] [varchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila](
	[tilv] [varchar](4) NULL,
	[lahde] [varchar](2) NULL,
	[sp] [varchar](1) NULL,
	[syntv] [varchar](4) NULL,
	[aikielir1] [varchar](2) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[klaji] [varchar](2) NULL,
	[ophal] [varchar](1) NULL,
	[jarj] [varchar](10) NULL,
	[kkun] [varchar](10) NULL,
	[koulk] [varchar](10) NULL,
	[pohjkoulk] [varchar](10) NULL,
	[lusuorv_2004] [varchar](4) NULL,
	[lusuorlk_2004] [varchar](1) NULL,
	[lututkmaak_2004] [varchar](10) NULL,
	[lututkjarj_2004] [varchar](10) NULL,
	[lututkkoulk_2004] [varchar](10) NULL,
	[amptsuorv_2004] [varchar](4) NULL,
	[amptsuorlk_2004] [varchar](1) NULL,
	[ampttutkmaak_2004] [varchar](10) NULL,
	[ampttutkjarj_2004] [varchar](10) NULL,
	[ampttutkkoulk_2004] [varchar](10) NULL,
	[amlksuorv_2004] [varchar](4) NULL,
	[amlksuorlk_2004] [varchar](1) NULL,
	[amlktutkmaak_2004] [varchar](10) NULL,
	[amlktutkjarj_2004] [varchar](10) NULL,
	[amlktutkkoulk_2004] [varchar](10) NULL,
	[muukksuorv_2004] [varchar](4) NULL,
	[muukksuorlk_2004] [varchar](1) NULL,
	[muukktutkmaak_2004] [varchar](10) NULL,
	[muukktutkjarj_2004] [varchar](10) NULL,
	[muukktutkkoulk_2004] [varchar](10) NULL,
	[lusuorv_2005] [varchar](4) NULL,
	[lusuorlk_2005] [varchar](1) NULL,
	[lututkmaak_2005] [varchar](10) NULL,
	[lututkjarj_2005] [varchar](10) NULL,
	[lututkkoulk_2005] [varchar](10) NULL,
	[amptsuorv_2005] [varchar](4) NULL,
	[amptsuorlk_2005] [varchar](1) NULL,
	[ampttutkmaak_2005] [varchar](10) NULL,
	[ampttutkjarj_2005] [varchar](10) NULL,
	[ampttutkkoulk_2005] [varchar](10) NULL,
	[amlksuorv_2005] [varchar](4) NULL,
	[amlksuorlk_2005] [varchar](1) NULL,
	[amlktutkmaak_2005] [varchar](10) NULL,
	[amlktutkjarj_2005] [varchar](10) NULL,
	[amlktutkkoulk_2005] [varchar](10) NULL,
	[muukksuorv_2005] [varchar](4) NULL,
	[muukksuorlk_2005] [varchar](1) NULL,
	[muukktutkmaak_2005] [varchar](10) NULL,
	[muukktutkjarj_2005] [varchar](10) NULL,
	[muukktutkkoulk_2005] [varchar](10) NULL,
	[lusuorv_2006] [varchar](4) NULL,
	[lusuorlk_2006] [varchar](1) NULL,
	[lututkmaak_2006] [varchar](10) NULL,
	[lututkjarj_2006] [varchar](10) NULL,
	[lututkkoulk_2006] [varchar](10) NULL,
	[amptsuorv_2006] [varchar](4) NULL,
	[amptsuorlk_2006] [varchar](1) NULL,
	[ampttutkmaak_2006] [varchar](10) NULL,
	[ampttutkjarj_2006] [varchar](10) NULL,
	[ampttutkkoulk_2006] [varchar](10) NULL,
	[amlksuorv_2006] [varchar](4) NULL,
	[amlksuorlk_2006] [varchar](1) NULL,
	[amlktutkmaak_2006] [varchar](10) NULL,
	[amlktutkjarj_2006] [varchar](10) NULL,
	[amlktutkkoulk_2006] [varchar](10) NULL,
	[muukksuorv_2006] [varchar](4) NULL,
	[muukksuorlk_2006] [varchar](1) NULL,
	[muukktutkmaak_2006] [varchar](10) NULL,
	[muukktutkjarj_2006] [varchar](10) NULL,
	[muukktutkkoulk_2006] [varchar](10) NULL,
	[lusuorv_2007] [varchar](4) NULL,
	[lusuorlk_2007] [varchar](1) NULL,
	[lututkmaak_2007] [varchar](10) NULL,
	[lututkjarj_2007] [varchar](10) NULL,
	[lututkkoulk_2007] [varchar](10) NULL,
	[amptsuorv_2007] [varchar](4) NULL,
	[amptsuorlk_2007] [varchar](1) NULL,
	[ampttutkmaak_2007] [varchar](10) NULL,
	[ampttutkjarj_2007] [varchar](10) NULL,
	[ampttutkkoulk_2007] [varchar](10) NULL,
	[amlksuorv_2007] [varchar](4) NULL,
	[amlksuorlk_2007] [varchar](1) NULL,
	[amlktutkmaak_2007] [varchar](10) NULL,
	[amlktutkjarj_2007] [varchar](10) NULL,
	[amlktutkkoulk_2007] [varchar](10) NULL,
	[muukksuorv_2007] [varchar](4) NULL,
	[muukksuorlk_2007] [varchar](1) NULL,
	[muukktutkmaak_2007] [varchar](10) NULL,
	[muukktutkjarj_2007] [varchar](10) NULL,
	[muukktutkkoulk_2007] [varchar](10) NULL,
	[lusuorv_2008] [varchar](4) NULL,
	[lusuorlk_2008] [varchar](1) NULL,
	[lututkmaak_2008] [varchar](10) NULL,
	[lututkjarj_2008] [varchar](10) NULL,
	[lututkkoulk_2008] [varchar](10) NULL,
	[amptsuorv_2008] [varchar](4) NULL,
	[amptsuorlk_2008] [varchar](1) NULL,
	[ampttutkmaak_2008] [varchar](10) NULL,
	[ampttutkjarj_2008] [varchar](10) NULL,
	[ampttutkkoulk_2008] [varchar](10) NULL,
	[amlksuorv_2008] [varchar](4) NULL,
	[amlksuorlk_2008] [varchar](1) NULL,
	[amlktutkmaak_2008] [varchar](10) NULL,
	[amlktutkjarj_2008] [varchar](10) NULL,
	[amlktutkkoulk_2008] [varchar](10) NULL,
	[muukksuorv_2008] [varchar](4) NULL,
	[muukksuorlk_2008] [varchar](1) NULL,
	[muukktutkmaak_2008] [varchar](10) NULL,
	[muukktutkjarj_2008] [varchar](10) NULL,
	[muukktutkkoulk_2008] [varchar](10) NULL,
	[lusuorv_2009] [varchar](4) NULL,
	[lusuorlk_2009] [varchar](1) NULL,
	[lututkmaak_2009] [varchar](10) NULL,
	[lututkjarj_2009] [varchar](10) NULL,
	[lututkkoulk_2009] [varchar](10) NULL,
	[amptsuorv_2009] [varchar](4) NULL,
	[amptsuorlk_2009] [varchar](1) NULL,
	[ampttutkmaak_2009] [varchar](10) NULL,
	[ampttutkjarj_2009] [varchar](10) NULL,
	[ampttutkkoulk_2009] [varchar](10) NULL,
	[amlksuorv_2009] [varchar](4) NULL,
	[amlksuorlk_2009] [varchar](1) NULL,
	[amlktutkmaak_2009] [varchar](10) NULL,
	[amlktutkjarj_2009] [varchar](10) NULL,
	[amlktutkkoulk_2009] [varchar](10) NULL,
	[muukksuorv_2009] [varchar](4) NULL,
	[muukksuorlk_2009] [varchar](1) NULL,
	[muukktutkmaak_2009] [varchar](10) NULL,
	[muukktutkjarj_2009] [varchar](10) NULL,
	[muukktutkkoulk_2009] [varchar](10) NULL,
	[luopiskkoulk_2004] [varchar](10) NULL,
	[luopiskjarj_2004] [varchar](10) NULL,
	[lukmaak_2004] [varchar](10) NULL,
	[amptopiskkoulk_2004] [varchar](10) NULL,
	[amptopiskjarj_2004] [varchar](10) NULL,
	[amptkmaak_2004] [varchar](10) NULL,
	[amlkopiskkoulk_2004] [varchar](10) NULL,
	[amlkopiskjarj_2004] [varchar](10) NULL,
	[amlkkmaak_2004] [varchar](10) NULL,
	[muukkopiskkoulk_2004] [varchar](10) NULL,
	[muukkopiskjarj_2004] [varchar](10) NULL,
	[muukkkmaak_2004] [varchar](10) NULL,
	[luopiskkoulk_2005] [varchar](10) NULL,
	[luopiskjarj_2005] [varchar](10) NULL,
	[lukmaak_2005] [varchar](10) NULL,
	[amptopiskkoulk_2005] [varchar](10) NULL,
	[amptopiskjarj_2005] [varchar](10) NULL,
	[amptkmaak_2005] [varchar](10) NULL,
	[amlkopiskkoulk_2005] [varchar](10) NULL,
	[amlkopiskjarj_2005] [varchar](10) NULL,
	[amlkkmaak_2005] [varchar](10) NULL,
	[muukkopiskkoulk_2005] [varchar](10) NULL,
	[muukkopiskjarj_2005] [varchar](10) NULL,
	[muukkkmaak_2005] [varchar](10) NULL,
	[luopiskkoulk_2006] [varchar](10) NULL,
	[luopiskjarj_2006] [varchar](10) NULL,
	[lukmaak_2006] [varchar](10) NULL,
	[amptopiskkoulk_2006] [varchar](10) NULL,
	[amptopiskjarj_2006] [varchar](10) NULL,
	[amptkmaak_2006] [varchar](10) NULL,
	[amlkopiskkoulk_2006] [varchar](10) NULL,
	[amlkopiskjarj_2006] [varchar](10) NULL,
	[amlkkmaak_2006] [varchar](10) NULL,
	[muukkopiskkoulk_2006] [varchar](10) NULL,
	[muukkopiskjarj_2006] [varchar](10) NULL,
	[muukkkmaak_2006] [varchar](10) NULL,
	[luopiskkoulk_2007] [varchar](10) NULL,
	[luopiskjarj_2007] [varchar](10) NULL,
	[lukmaak_2007] [varchar](10) NULL,
	[amptopiskkoulk_2007] [varchar](10) NULL,
	[amptopiskjarj_2007] [varchar](10) NULL,
	[amptkmaak_2007] [varchar](10) NULL,
	[amlkopiskkoulk_2007] [varchar](10) NULL,
	[amlkopiskjarj_2007] [varchar](10) NULL,
	[amlkkmaak_2007] [varchar](10) NULL,
	[muukkopiskkoulk_2007] [varchar](10) NULL,
	[muukkopiskjarj_2007] [varchar](10) NULL,
	[muukkkmaak_2007] [varchar](10) NULL,
	[luopiskkoulk_2008] [varchar](10) NULL,
	[luopiskjarj_2008] [varchar](10) NULL,
	[lukmaak_2008] [varchar](10) NULL,
	[amptopiskkoulk_2008] [varchar](10) NULL,
	[amptopiskjarj_2008] [varchar](10) NULL,
	[amptkmaak_2008] [varchar](10) NULL,
	[amlkopiskkoulk_2008] [varchar](10) NULL,
	[amlkopiskjarj_2008] [varchar](10) NULL,
	[amlkkmaak_2008] [varchar](10) NULL,
	[muukkopiskkoulk_2008] [varchar](10) NULL,
	[muukkopiskjarj_2008] [varchar](10) NULL,
	[muukkkmaak_2008] [varchar](10) NULL,
	[luopiskkoulk_2009] [varchar](10) NULL,
	[luopiskjarj_2009] [varchar](10) NULL,
	[lukmaak_2009] [varchar](10) NULL,
	[amptopiskkoulk_2009] [varchar](10) NULL,
	[amptopiskjarj_2009] [varchar](10) NULL,
	[amptkmaak_2009] [varchar](10) NULL,
	[amlkopiskkoulk_2009] [varchar](10) NULL,
	[amlkopiskjarj_2009] [varchar](10) NULL,
	[amlkkmaak_2009] [varchar](10) NULL,
	[muukkopiskkoulk_2009] [varchar](10) NULL,
	[muukkopiskjarj_2009] [varchar](10) NULL,
	[muukkkmaak_2009] [varchar](10) NULL,
	[ptoim1r5_2004] [varchar](2) NULL,
	[amas_2004] [varchar](1) NULL,
	[ptoim1r5_2005] [varchar](2) NULL,
	[amas_2005] [varchar](1) NULL,
	[ptoim1r5_2006] [varchar](2) NULL,
	[amas_2006] [varchar](1) NULL,
	[ptoim1r5_2007] [varchar](2) NULL,
	[amas_2007] [varchar](1) NULL,
	[ptoim1r5_2008] [varchar](2) NULL,
	[amas_2008] [varchar](1) NULL,
	[ptoim1r5_2009] [varchar](2) NULL,
	[amas_2009] [varchar](1) NULL,
	[lusuorv_2010] [varchar](4) NULL,
	[lusuorlk_2010] [varchar](1) NULL,
	[lututkmaak_2010] [varchar](10) NULL,
	[lututkjarj_2010] [varchar](10) NULL,
	[lututkkoulk_2010] [varchar](10) NULL,
	[amptsuorv_2010] [varchar](4) NULL,
	[amptsuorlk_2010] [varchar](1) NULL,
	[ampttutkmaak_2010] [varchar](10) NULL,
	[ampttutkjarj_2010] [varchar](10) NULL,
	[ampttutkkoulk_2010] [varchar](10) NULL,
	[amlksuorv_2010] [varchar](4) NULL,
	[amlksuorlk_2010] [varchar](1) NULL,
	[amlktutkmaak_2010] [varchar](10) NULL,
	[amlktutkjarj_2010] [varchar](10) NULL,
	[amlktutkkoulk_2010] [varchar](10) NULL,
	[muukksuorv_2010] [varchar](4) NULL,
	[muukksuorlk_2010] [varchar](1) NULL,
	[muukktutkmaak_2010] [varchar](10) NULL,
	[muukktutkjarj_2010] [varchar](10) NULL,
	[muukktutkkoulk_2010] [varchar](10) NULL,
	[luopiskkoulk_2010] [varchar](10) NULL,
	[luopiskjarj_2010] [varchar](10) NULL,
	[lukmaak_2010] [varchar](10) NULL,
	[amptopiskkoulk_2010] [varchar](10) NULL,
	[amptopiskjarj_2010] [varchar](10) NULL,
	[amptkmaak_2010] [varchar](10) NULL,
	[amlkopiskkoulk_2010] [varchar](10) NULL,
	[amlkopiskjarj_2010] [varchar](10) NULL,
	[amlkkmaak_2010] [varchar](10) NULL,
	[muukkopiskkoulk_2010] [varchar](10) NULL,
	[muukkopiskjarj_2010] [varchar](10) NULL,
	[muukkkmaak_2010] [varchar](10) NULL,
	[ptoim1r5_2010] [varchar](2) NULL,
	[amas_2010] [varchar](1) NULL,
	[lusuorv_2011] [varchar](4) NULL,
	[lusuorlk_2011] [varchar](1) NULL,
	[lututkmaak_2011] [varchar](10) NULL,
	[lututkjarj_2011] [varchar](10) NULL,
	[lututkkoulk_2011] [varchar](10) NULL,
	[amptsuorv_2011] [varchar](4) NULL,
	[amptsuorlk_2011] [varchar](1) NULL,
	[ampttutkmaak_2011] [varchar](10) NULL,
	[ampttutkjarj_2011] [varchar](10) NULL,
	[ampttutkkoulk_2011] [varchar](10) NULL,
	[amlksuorv_2011] [varchar](4) NULL,
	[amlksuorlk_2011] [varchar](1) NULL,
	[amlktutkmaak_2011] [varchar](10) NULL,
	[amlktutkjarj_2011] [varchar](10) NULL,
	[amlktutkkoulk_2011] [varchar](10) NULL,
	[muukksuorv_2011] [varchar](4) NULL,
	[muukksuorlk_2011] [varchar](1) NULL,
	[muukktutkmaak_2011] [varchar](10) NULL,
	[muukktutkjarj_2011] [varchar](10) NULL,
	[muukktutkkoulk_2011] [varchar](10) NULL,
	[luopiskkoulk_2011] [varchar](10) NULL,
	[luopiskjarj_2011] [varchar](10) NULL,
	[lukmaak_2011] [varchar](10) NULL,
	[amptopiskkoulk_2011] [varchar](10) NULL,
	[amptopiskjarj_2011] [varchar](10) NULL,
	[amptkmaak_2011] [varchar](10) NULL,
	[amlkopiskkoulk_2011] [varchar](10) NULL,
	[amlkopiskjarj_2011] [varchar](10) NULL,
	[amlkkmaak_2011] [varchar](10) NULL,
	[muukkopiskkoulk_2011] [varchar](10) NULL,
	[muukkopiskjarj_2011] [varchar](10) NULL,
	[muukkkmaak_2011] [varchar](10) NULL,
	[ptoim1r5_2011] [varchar](2) NULL,
	[amas_2011] [varchar](1) NULL,
	[lusuorv_2012] [varchar](4) NULL,
	[lusuorlk_2012] [varchar](1) NULL,
	[lututkmaak_2012] [varchar](10) NULL,
	[lututkjarj_2012] [varchar](10) NULL,
	[lututkkoulk_2012] [varchar](10) NULL,
	[amptsuorv_2012] [varchar](4) NULL,
	[amptsuorlk_2012] [varchar](1) NULL,
	[ampttutkmaak_2012] [varchar](10) NULL,
	[ampttutkjarj_2012] [varchar](10) NULL,
	[ampttutkkoulk_2012] [varchar](10) NULL,
	[amlksuorv_2012] [varchar](4) NULL,
	[amlksuorlk_2012] [varchar](1) NULL,
	[amlktutkmaak_2012] [varchar](10) NULL,
	[amlktutkjarj_2012] [varchar](10) NULL,
	[amlktutkkoulk_2012] [varchar](10) NULL,
	[muukksuorv_2012] [varchar](4) NULL,
	[muukksuorlk_2012] [varchar](1) NULL,
	[muukktutkmaak_2012] [varchar](10) NULL,
	[muukktutkjarj_2012] [varchar](10) NULL,
	[muukktutkkoulk_2012] [varchar](10) NULL,
	[luopiskkoulk_2012] [varchar](10) NULL,
	[luopiskjarj_2012] [varchar](10) NULL,
	[lukmaak_2012] [varchar](10) NULL,
	[amptopiskkoulk_2012] [varchar](10) NULL,
	[amptopiskjarj_2012] [varchar](10) NULL,
	[amptkmaak_2012] [varchar](10) NULL,
	[amlkopiskkoulk_2012] [varchar](10) NULL,
	[amlkopiskjarj_2012] [varchar](10) NULL,
	[amlkkmaak_2012] [varchar](10) NULL,
	[muukkopiskkoulk_2012] [varchar](10) NULL,
	[muukkopiskjarj_2012] [varchar](10) NULL,
	[muukkkmaak_2012] [varchar](10) NULL,
	[ptoim1r5_2012] [varchar](2) NULL,
	[amas_2012] [varchar](1) NULL,
	[lusuorv_2013] [varchar](4) NULL,
	[lusuorlk_2013] [varchar](1) NULL,
	[lututkmaak_2013] [varchar](10) NULL,
	[lututkjarj_2013] [varchar](10) NULL,
	[lututkkoulk_2013] [varchar](10) NULL,
	[amptsuorv_2013] [varchar](4) NULL,
	[amptsuorlk_2013] [varchar](1) NULL,
	[ampttutkmaak_2013] [varchar](10) NULL,
	[ampttutkjarj_2013] [varchar](10) NULL,
	[ampttutkkoulk_2013] [varchar](10) NULL,
	[amlksuorv_2013] [varchar](4) NULL,
	[amlksuorlk_2013] [varchar](1) NULL,
	[amlktutkmaak_2013] [varchar](10) NULL,
	[amlktutkjarj_2013] [varchar](10) NULL,
	[amlktutkkoulk_2013] [varchar](10) NULL,
	[muukksuorv_2013] [varchar](4) NULL,
	[muukksuorlk_2013] [varchar](1) NULL,
	[muukktutkmaak_2013] [varchar](10) NULL,
	[muukktutkjarj_2013] [varchar](10) NULL,
	[muukktutkkoulk_2013] [varchar](10) NULL,
	[luopiskkoulk_2013] [varchar](10) NULL,
	[luopiskjarj_2013] [varchar](10) NULL,
	[lukmaak_2013] [varchar](10) NULL,
	[amptopiskkoulk_2013] [varchar](10) NULL,
	[amptopiskjarj_2013] [varchar](10) NULL,
	[amptkmaak_2013] [varchar](10) NULL,
	[amlkopiskkoulk_2013] [varchar](10) NULL,
	[amlkopiskjarj_2013] [varchar](10) NULL,
	[amlkkmaak_2013] [varchar](10) NULL,
	[muukkopiskkoulk_2013] [varchar](10) NULL,
	[muukkopiskjarj_2013] [varchar](10) NULL,
	[muukkkmaak_2013] [varchar](10) NULL,
	[ptoim1r5_2013] [varchar](2) NULL,
	[amas_2013] [varchar](1) NULL,
	[lusuorv_2014] [varchar](4) NULL,
	[lusuorlk_2014] [varchar](1) NULL,
	[lututkmaak_2014] [varchar](10) NULL,
	[lututkjarj_2014] [varchar](10) NULL,
	[lututkkoulk_2014] [varchar](10) NULL,
	[amptsuorv_2014] [varchar](4) NULL,
	[amptsuorlk_2014] [varchar](1) NULL,
	[ampttutkmaak_2014] [varchar](10) NULL,
	[ampttutkjarj_2014] [varchar](10) NULL,
	[ampttutkkoulk_2014] [varchar](10) NULL,
	[amlksuorv_2014] [varchar](4) NULL,
	[amlksuorlk_2014] [varchar](1) NULL,
	[amlktutkmaak_2014] [varchar](10) NULL,
	[amlktutkjarj_2014] [varchar](10) NULL,
	[amlktutkkoulk_2014] [varchar](10) NULL,
	[muukksuorv_2014] [varchar](4) NULL,
	[muukksuorlk_2014] [varchar](1) NULL,
	[muukktutkmaak_2014] [varchar](10) NULL,
	[muukktutkjarj_2014] [varchar](10) NULL,
	[muukktutkkoulk_2014] [varchar](10) NULL,
	[luopiskkoulk_2014] [varchar](10) NULL,
	[luopiskjarj_2014] [varchar](10) NULL,
	[lukmaak_2014] [varchar](10) NULL,
	[amptopiskkoulk_2014] [varchar](10) NULL,
	[amptopiskjarj_2014] [varchar](10) NULL,
	[amptkmaak_2014] [varchar](10) NULL,
	[amlkopiskkoulk_2014] [varchar](10) NULL,
	[amlkopiskjarj_2014] [varchar](10) NULL,
	[amlkkmaak_2014] [varchar](10) NULL,
	[muukkopiskkoulk_2014] [varchar](10) NULL,
	[muukkopiskjarj_2014] [varchar](10) NULL,
	[muukkkmaak_2014] [varchar](10) NULL,
	[ptoim1r5_2014] [varchar](2) NULL,
	[amas_2014] [varchar](1) NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](12) NOT NULL,
	[rivinumero] [bigint] NULL,
	[aineistorivinumero] [bigint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_surrogaattiavaimet]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_surrogaattiavaimet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_surrogaattiavaimet](
	[tilv] [varchar](4) NULL,
	[lahde] [varchar](2) NULL,
	[sp] [varchar](1) NULL,
	[syntv] [varchar](4) NULL,
	[aikielir1] [varchar](2) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[klaji] [varchar](2) NULL,
	[ophal] [varchar](1) NULL,
	[jarj] [varchar](10) NULL,
	[kkun] [varchar](10) NULL,
	[koulk] [varchar](10) NULL,
	[pohjkoulk] [varchar](10) NULL,
	[tietolahde] [varchar](12) NOT NULL,
	[rivinumero] [bigint] NULL,
	[aineistorivinumero] [bigint] NULL,
	[lkm] [int] NULL,
	[lu_2004] [int] NULL,
	[ampt_2004] [int] NULL,
	[amlk_2004] [int] NULL,
	[muukk_2004] [int] NULL,
	[lu_2005] [int] NULL,
	[ampt_2005] [int] NULL,
	[amlk_2005] [int] NULL,
	[muukk_2005] [int] NULL,
	[lu_2006] [int] NULL,
	[ampt_2006] [int] NULL,
	[amlk_2006] [int] NULL,
	[muukk_2006] [int] NULL,
	[lu_2007] [int] NULL,
	[ampt_2007] [int] NULL,
	[amlk_2007] [int] NULL,
	[muukk_2007] [int] NULL,
	[lu_2008] [int] NULL,
	[ampt_2008] [int] NULL,
	[amlk_2008] [int] NULL,
	[muukk_2008] [int] NULL,
	[luopisk_2004] [int] NULL,
	[amptopisk_2004] [int] NULL,
	[amlkopisk_2004] [int] NULL,
	[muukkopisk_2004] [int] NULL,
	[luopisk_2005] [int] NULL,
	[amptopisk_2005] [int] NULL,
	[amlkopisk_2005] [int] NULL,
	[muukkopisk_2005] [int] NULL,
	[luopisk_2006] [int] NULL,
	[amptopisk_2006] [int] NULL,
	[amlkopisk_2006] [int] NULL,
	[muukkopisk_2006] [int] NULL,
	[luopisk_2007] [int] NULL,
	[amptopisk_2007] [int] NULL,
	[amlkopisk_2007] [int] NULL,
	[muukkopisk_2007] [int] NULL,
	[luopisk_2008] [int] NULL,
	[amptopisk_2008] [int] NULL,
	[amlkopisk_2008] [int] NULL,
	[muukkopisk_2008] [int] NULL,
	[ptoim1r5_2004] [int] NULL,
	[ptoim1r5_2005] [int] NULL,
	[ptoim1r5_2006] [int] NULL,
	[ptoim1r5_2007] [int] NULL,
	[ptoim1r5_2008] [int] NULL,
	[lu_2009] [int] NULL,
	[ampt_2009] [int] NULL,
	[amlk_2009] [int] NULL,
	[muukk_2009] [int] NULL,
	[luopisk_2009] [int] NULL,
	[amptopisk_2009] [int] NULL,
	[amlkopisk_2009] [int] NULL,
	[muukkopisk_2009] [int] NULL,
	[ptoim1r5_2009] [int] NULL,
	[lu_2010] [int] NULL,
	[ampt_2010] [int] NULL,
	[amlk_2010] [int] NULL,
	[muukk_2010] [int] NULL,
	[luopisk_2010] [int] NULL,
	[amptopisk_2010] [int] NULL,
	[amlkopisk_2010] [int] NULL,
	[muukkopisk_2010] [int] NULL,
	[ptoim1r5_2010] [int] NULL,
	[lu_2011] [int] NULL,
	[ampt_2011] [int] NULL,
	[amlk_2011] [int] NULL,
	[muukk_2011] [int] NULL,
	[luopisk_2011] [int] NULL,
	[amptopisk_2011] [int] NULL,
	[amlkopisk_2011] [int] NULL,
	[muukkopisk_2011] [int] NULL,
	[ptoim1r5_2011] [int] NULL,
	[lu_2012] [int] NULL,
	[ampt_2012] [int] NULL,
	[amlk_2012] [int] NULL,
	[muukk_2012] [int] NULL,
	[luopisk_2012] [int] NULL,
	[amptopisk_2012] [int] NULL,
	[amlkopisk_2012] [int] NULL,
	[muukkopisk_2012] [int] NULL,
	[ptoim1r5_2012] [int] NULL,
	[lu_2013] [int] NULL,
	[ampt_2013] [int] NULL,
	[amlk_2013] [int] NULL,
	[muukk_2013] [int] NULL,
	[luopisk_2013] [int] NULL,
	[amptopisk_2013] [int] NULL,
	[amlkopisk_2013] [int] NULL,
	[muukkopisk_2013] [int] NULL,
	[ptoim1r5_2013] [int] NULL,
	[lu_2014] [int] NULL,
	[ampt_2014] [int] NULL,
	[amlk_2014] [int] NULL,
	[muukk_2014] [int] NULL,
	[luopisk_2014] [int] NULL,
	[amptopisk_2014] [int] NULL,
	[amlkopisk_2014] [int] NULL,
	[muukkopisk_2014] [int] NULL,
	[ptoim1r5_2014] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_surrogaattiavaimet_UNPIVOT]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_surrogaattiavaimet_UNPIVOT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_surrogaattiavaimet_UNPIVOT](
	[tilv] [varchar](255) NULL,
	[lahde] [varchar](255) NULL,
	[sp] [varchar](255) NULL,
	[syntv] [varchar](255) NULL,
	[aikielir1] [varchar](255) NULL,
	[alvv] [varchar](255) NULL,
	[allk] [varchar](255) NULL,
	[klaji] [varchar](255) NULL,
	[ophal] [varchar](255) NULL,
	[jarj] [varchar](255) NULL,
	[kkun] [varchar](255) NULL,
	[koulk] [varchar](255) NULL,
	[pohjkoulk] [varchar](255) NULL,
	[tietolahde] [varchar](255) NULL,
	[rivinumero] [varchar](255) NULL,
	[aineistorivinumero] [numeric](18, 0) NULL,
	[sarakeryhma_id] [nvarchar](128) NULL,
	[sarakeryhma_arvo] [int] NULL,
	[lkm] [varchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_VipunenTK_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_VipunenTK_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_VipunenTK_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[tarkastelujakso_koodi] [nvarchar](20) NOT NULL,
	[tarkastelujakso_id] [int] NOT NULL,
	[sukupuoli_koodi] [nvarchar](10) NULL,
	[sukupuoli_id] [int] NOT NULL,
	[aidinkieli_versio1_koodi] [nvarchar](2) NULL,
	[aidinkieli_id] [int] NOT NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[suorituskausi_id] [nvarchar](10) NOT NULL,
	[koulutusluokitus_avain] [nvarchar](6) NULL,
	[koulutusluokitus_id] [int] NOT NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[aloituskausi_id] [nvarchar](10) NOT NULL,
	[oppisopimuskoulutus_koodi] [nvarchar](2) NULL,
	[oppisopimuskoulutus_id] [int] NOT NULL,
	[ammatillisen_koulutuksen_koulutuslaji_koodi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_id] [int] NOT NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id] [int] NOT NULL,
	[nuorten_aikuisten_koulutus_amm_koodi] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus_amm_id] [int] NOT NULL,
	[syntv] [varchar](4) NULL,
	[ika_avain] [nvarchar](10) NULL,
	[ika_id] [int] NOT NULL,
	[henkiloiden_lkm] [int] NULL,
	[lu_henkiloiden_lkm] [int] NULL,
	[lukoulk] [varchar](6) NULL,
	[lu_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[lusuorv] [varchar](4) NULL,
	[luaikoul] [varchar](1) NULL,
	[lu_nuorten_aikuisten_koulutus_amm_id] [int] NOT NULL,
	[lu_ika] [int] NULL,
	[lu_ika_id] [int] NOT NULL,
	[lu_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[lu_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[ammlkm_id] [int] NOT NULL,
	[amm_henkiloiden_lkm] [int] NULL,
	[ammkoulk] [varchar](6) NULL,
	[amm_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[ammsuorv] [varchar](4) NULL,
	[ammoppis] [varchar](1) NULL,
	[ammoppis_id] [int] NOT NULL,
	[ammtutklaja] [varchar](1) NULL,
	[ammtutklaja_id] [int] NOT NULL,
	[ammtutktav] [varchar](1) NULL,
	[ammtutktav_id] [int] NOT NULL,
	[ammatillinen_koulutus_ryhma] [nvarchar](10) NULL,
	[ammatillinen_koulutus_ryhma_id] [int] NOT NULL,
	[amm_ika] [int] NULL,
	[amm_ika_id] [int] NOT NULL,
	[amm_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[amm_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[opist_henkiloiden_lkm] [int] NULL,
	[opistkoulk] [varchar](6) NULL,
	[opist_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[opistsuorv] [varchar](4) NULL,
	[opist_ika] [int] NULL,
	[opist_ika_id] [int] NOT NULL,
	[opist_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[opist_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[ammka_henkiloiden_lkm] [int] NULL,
	[ammkakoulk] [varchar](6) NULL,
	[ammka_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[ammkasuorv] [varchar](4) NULL,
	[ammka_ika] [int] NULL,
	[ammka_ika_id] [int] NOT NULL,
	[ammka_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammka_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[amklkm_id] [int] NOT NULL,
	[amk_henkiloiden_lkm] [int] NULL,
	[amkkoulk] [varchar](6) NULL,
	[amk_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[amksuorv] [varchar](4) NULL,
	[amkaikoul] [varchar](1) NULL,
	[amkaikoul_id] [int] NOT NULL,
	[amk_ika] [int] NULL,
	[amk_ika_id] [int] NOT NULL,
	[amk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[amk_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[akklkm_id] [int] NOT NULL,
	[akk_henkiloiden_lkm] [int] NULL,
	[akkkoulk] [varchar](6) NULL,
	[akk_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[akksuorv] [varchar](4) NULL,
	[akk_ika] [int] NULL,
	[akk_ika_id] [int] NOT NULL,
	[akk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[akk_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[ylamklkm_henkiloiden_lkm] [int] NULL,
	[ylamkkoulk] [varchar](6) NULL,
	[ylamk_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[ylamksuorv] [varchar](4) NULL,
	[ylamk_ika] [int] NULL,
	[ylamk_ika_id] [int] NOT NULL,
	[ylamk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ylamk_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[ykklkm_id] [int] NOT NULL,
	[ykk_henkiloiden_lkm] [int] NULL,
	[ykkkoulk] [varchar](6) NULL,
	[ykk_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[ykksuorv] [varchar](4) NULL,
	[ykk_ika] [int] NULL,
	[ykk_ika_id] [int] NOT NULL,
	[ykk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ykk_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[laaker_henkiloiden_lkm] [int] NULL,
	[laakerkoulk] [varchar](6) NULL,
	[laaker_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[laakersuorv] [varchar](4) NULL,
	[laaker_ika] [int] NULL,
	[laaker_ika_id] [int] NOT NULL,
	[laaker_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[laaker_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[lis_henkiloiden_lkm] [int] NULL,
	[liskoulk] [varchar](6) NULL,
	[lis_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[lissuorv] [varchar](4) NULL,
	[lis_ika] [int] NULL,
	[lis_ika_id] [int] NOT NULL,
	[lis_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[lis_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[toht_henkiloiden_lkm] [int] NULL,
	[tohtkoulk] [varchar](6) NULL,
	[toht_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[tohtsuorv] [varchar](4) NULL,
	[toht_ika] [int] NULL,
	[toht_ika_id] [int] NOT NULL,
	[toht_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[toht_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[yliopistotutkinto_myohempi_suoritettu_id] [int] NOT NULL,
	[yo_jatkotutkinto_myohempi_suoritettu_id] [int] NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_myohempi_suoritettu_id] [int] NOT NULL,
	[korkeakoulututkinto_myohempi_suoritettu_id] [int] NOT NULL,
	[toisen_asteen_tutkinto_myohempi_suoritettu_id] [int] NOT NULL,
	[ammatillisen_tutkinto_myohempi_suoritettu_ryhma1_id] [int] NOT NULL,
	[ammatillisen_tutkinto_myohempi_suoritettu_ryhma2_id] [int] NOT NULL,
	[ammatillisen_tutkinto_myohempi_suoritettu_ryhma3_id] [int] NOT NULL,
	[myohemman_yliopistotutkinnon_suorittaneiden_lkm] [int] NULL,
	[myohemman_yo_jatkotutkinnon_suorittaneiden_lkm] [int] NULL,
	[myohemman_opisto_tai_ammatillisen_korkea_asteen_tutkinnon_suorittaneiden_lkm] [int] NULL,
	[myohemman_korkeakoulututkinnon_suorittaneiden_lkm] [int] NULL,
	[myohemman_toisen_asteen_tutkinnon_suorittaneiden_lkm] [int] NULL,
	[myohemman_ammatillisen_tutkinnon_ryhma1_suorittaneiden_lkm] [int] NULL,
	[myohemman_ammatillisen_tutkinnon_ryhma2_suorittaneiden_lkm] [int] NULL,
	[myohemman_ammatillisen_tutkinnon_ryhma3_suorittaneiden_lkm] [int] NULL,
	[lu_sama_myohempi_koulutusala2002_avain] [varchar](34) NOT NULL,
	[amm_sama_myohempi_koulutusala2002_avain] [varchar](35) NOT NULL,
	[opist_sama_myohempi_koulutusala2002_avain] [varchar](37) NOT NULL,
	[ammka_sama_myohempi_koulutusala2002_avain] [varchar](37) NOT NULL,
	[akk_sama_myohempi_koulutusala2002_avain] [varchar](35) NOT NULL,
	[amk_sama_myohempi_koulutusala2002_avain] [varchar](35) NOT NULL,
	[ylamk_sama_myohempi_koulutusala2002_avain] [varchar](37) NOT NULL,
	[ykk_sama_myohempi_koulutusala2002_avain] [varchar](35) NOT NULL,
	[laaker_sama_myohempi_koulutusala2002_avain] [varchar](38) NOT NULL,
	[lis_sama_myohempi_koulutusala2002_avain] [varchar](35) NOT NULL,
	[toht_sama_myohempi_koulutusala2002_avain] [varchar](36) NOT NULL,
	[yliopistotutkinto_sama_myohempi_koulutusala2002_avain] [varchar](49) NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_koulutusala2002_avain] [varchar](48) NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002_avain] [varchar](78) NOT NULL,
	[korkeakoulututkinto_sama_myohempi_koulutusala2002_avain] [varchar](51) NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_koulutusala2002_avain] [varchar](54) NOT NULL,
	[lu_sama_myohempi_opintoala2002_avain] [varchar](32) NOT NULL,
	[amm_sama_myohempi_opintoala2002_avain] [varchar](33) NOT NULL,
	[opist_sama_myohempi_opintoala2002_avain] [varchar](35) NOT NULL,
	[ammka_sama_myohempi_opintoala2002_avain] [varchar](35) NOT NULL,
	[akk_sama_myohempi_opintoala2002_avain] [varchar](33) NOT NULL,
	[amk_sama_myohempi_opintoala2002_avain] [varchar](33) NOT NULL,
	[ylamk_sama_myohempi_opintoala2002_avain] [varchar](35) NOT NULL,
	[ykk_sama_myohempi_opintoala2002_avain] [varchar](33) NOT NULL,
	[laaker_sama_myohempi_opintoala2002_avain] [varchar](36) NOT NULL,
	[lis_sama_myohempi_opintoala2002_avain] [varchar](33) NOT NULL,
	[toht_sama_myohempi_opintoala2002_avain] [varchar](34) NOT NULL,
	[yliopistotutkinto_sama_myohempi_opintoala2002_avain] [varchar](47) NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_opintoala2002_avain] [varchar](46) NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002_avain] [varchar](76) NOT NULL,
	[korkeakoulututkinto_sama_myohempi_opintoala2002_avain] [varchar](49) NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_opintoala2002_avain] [varchar](52) NOT NULL,
	[lu_sama_myohempi_opintoala1995_avain] [varchar](32) NOT NULL,
	[amm_sama_myohempi_opintoala1995_avain] [varchar](33) NOT NULL,
	[opist_sama_myohempi_opintoala1995_avain] [varchar](35) NOT NULL,
	[ammka_sama_myohempi_opintoala1995_avain] [varchar](35) NOT NULL,
	[akk_sama_myohempi_opintoala1995_avain] [varchar](33) NOT NULL,
	[amk_sama_myohempi_opintoala1995_avain] [varchar](33) NOT NULL,
	[ylamk_sama_myohempi_opintoala1995_avain] [varchar](35) NOT NULL,
	[ykk_sama_myohempi_opintoala1995_avain] [varchar](33) NOT NULL,
	[laaker_sama_myohempi_opintoala1995_avain] [varchar](36) NOT NULL,
	[lis_sama_myohempi_opintoala1995_avain] [varchar](33) NOT NULL,
	[toht_sama_myohempi_opintoala1995_avain] [varchar](34) NOT NULL,
	[yliopistotutkinto_sama_myohempi_opintoala1995_avain] [varchar](47) NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_opintoala1995_avain] [varchar](46) NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995_avain] [varchar](76) NOT NULL,
	[korkeakoulututkinto_sama_myohempi_opintoala1995_avain] [varchar](49) NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_opintoala1995_avain] [varchar](52) NOT NULL,
	[lu_sama_myohempi_iscfibroad2013_avain] [varchar](33) NOT NULL,
	[amm_sama_myohempi_iscfibroad2013_avain] [varchar](34) NOT NULL,
	[opist_sama_myohempi_iscfibroad2013_avain] [varchar](36) NOT NULL,
	[ammka_sama_myohempi_iscfibroad2013_avain] [varchar](36) NOT NULL,
	[akk_sama_myohempi_iscfibroad2013_avain] [varchar](34) NOT NULL,
	[amk_sama_myohempi_iscfibroad2013_avain] [varchar](34) NOT NULL,
	[ylamk_sama_myohempi_iscfibroad2013_avain] [varchar](36) NOT NULL,
	[ykk_sama_myohempi_iscfibroad2013_avain] [varchar](34) NOT NULL,
	[laaker_sama_myohempi_iscfibroad2013_avain] [varchar](37) NOT NULL,
	[lis_sama_myohempi_iscfibroad2013_avain] [varchar](34) NOT NULL,
	[toht_sama_myohempi_iscfibroad2013_avain] [varchar](35) NOT NULL,
	[yliopistotutkinto_sama_myohempi_iscfibroad2013_avain] [varchar](48) NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_iscfibroad2013_avain] [varchar](47) NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_avain] [varchar](77) NOT NULL,
	[korkeakoulututkinto_sama_myohempi_iscfibroad2013_avain] [varchar](50) NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_avain] [varchar](53) NOT NULL,
	[lu_sama_myohempi_iscfinarrow2013_avain] [varchar](34) NOT NULL,
	[amm_sama_myohempi_iscfinarrow2013_avain] [varchar](35) NOT NULL,
	[opist_sama_myohempi_iscfinarrow2013_avain] [varchar](37) NOT NULL,
	[ammka_sama_myohempi_iscfinarrow2013_avain] [varchar](37) NOT NULL,
	[akk_sama_myohempi_iscfinarrow2013_avain] [varchar](35) NOT NULL,
	[amk_sama_myohempi_iscfinarrow2013_avain] [varchar](35) NOT NULL,
	[ylamk_sama_myohempi_iscfinarrow2013_avain] [varchar](37) NOT NULL,
	[ykk_sama_myohempi_iscfinarrow2013_avain] [varchar](35) NOT NULL,
	[laaker_sama_myohempi_iscfinarrow2013_avain] [varchar](38) NOT NULL,
	[lis_sama_myohempi_iscfinarrow2013_avain] [varchar](35) NOT NULL,
	[toht_sama_myohempi_iscfinarrow2013_avain] [varchar](36) NOT NULL,
	[yliopistotutkinto_sama_myohempi_iscfinarrow2013_avain] [varchar](49) NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_avain] [varchar](48) NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_avain] [varchar](78) NOT NULL,
	[korkeakoulututkinto_sama_myohempi_iscfinarrow2013_avain] [varchar](51) NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_avain] [varchar](54) NOT NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_aidinkieli_versio1]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_aidinkieli_versio1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_aidinkieli_versio1](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aidinkieli_versio1_koodi] [nvarchar](2) NULL,
	[aidinkieli_versio1] [nvarchar](50) NULL,
	[aidinkieli_versio1_SV] [nvarchar](50) NULL,
	[aidinkieli_versio1_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_aidinkieli_versio2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_aidinkieli_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_aidinkieli_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aidinkieli_versio2_koodi] [nvarchar](2) NULL,
	[aidinkieli_versio2] [nvarchar](50) NULL,
	[aidinkieli_versio2_SV] [nvarchar](50) NULL,
	[aidinkieli_versio2_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_aidinkieli_versio3]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_aidinkieli_versio3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_aidinkieli_versio3](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aidinkieli_versio3_koodi] [nvarchar](2) NULL,
	[aidinkieli_versio3] [nvarchar](50) NULL,
	[aidinkieli_versio3_SV] [nvarchar](50) NULL,
	[aidinkieli_versio3_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_aikaisemmat_tutkinnot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_aikaisemmat_tutkinnot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_aikaisemmat_tutkinnot](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikaisemmat_tutkinnot_koodi] [nvarchar](2) NULL,
	[aikaisemmat_tutkinnot] [nvarchar](100) NULL,
	[aikaisemmat_tutkinnot_SV] [nvarchar](120) NULL,
	[aikaisemmat_tutkinnot_EN] [nvarchar](120) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_aikaisempi_korkein_tutkinto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_aikaisempi_korkein_tutkinto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_aikaisempi_korkein_tutkinto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikaisempi_korkein_tutkinto_koodi] [nvarchar](2) NULL,
	[aikaisempi_korkein_tutkinto] [nvarchar](100) NULL,
	[aikaisempi_korkein_tutkinto_SV] [nvarchar](100) NULL,
	[aikaisempi_korkein_tutkinto_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_aikalkk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_aikalkk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_aikalkk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikalkk_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_aikuisopiskelija]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_aikuisopiskelija]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_aikuisopiskelija](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikuisopiskelija_koodi] [nvarchar](10) NULL,
	[aikuisopiskelija] [nvarchar](250) NULL,
	[aikuisopiskelija_SV] [nvarchar](250) NULL,
	[aikuisopiskelija_EN] [nvarchar](250) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_aineisto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_aineisto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_aineisto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aineisto_koodi] [nvarchar](2) NULL,
	[aineisto] [nvarchar](50) NULL,
	[aineisto_SV] [nvarchar](50) NULL,
	[aineisto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_aineisto_OTV]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_aineisto_OTV]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_aineisto_OTV](
	[id] [int] NOT NULL,
	[aineisto_koodi] [nvarchar](8) NOT NULL,
	[tilastointivuosi] [nvarchar](4) NOT NULL,
	[alkaa] [datetime2](7) NOT NULL,
	[paattyy] [datetime2](7) NOT NULL,
	[aineisto] [nvarchar](150) NULL,
	[aineisto_SV] [nvarchar](150) NULL,
	[aineisto_EN] [nvarchar](150) NULL,
	[jarjestys] [smallint] NULL,
	[toisen_asteen_koulutus] [nchar](2) NULL,
	[kaikkien_asteiden_koulutus] [nchar](2) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_alueluokitus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_alueluokitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_alueluokitus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[alueluokitus_avain] [nvarchar](10) NOT NULL,
	[kunta_koodi] [nvarchar](3) NOT NULL,
	[viimeisin_tilv] [nvarchar](4) NOT NULL,
	[liitoskunta_koodi] [nvarchar](3) NULL,
	[kunta] [nvarchar](255) NOT NULL,
	[kunta_SV] [nvarchar](255) NOT NULL,
	[kunta_EN] [nvarchar](255) NOT NULL,
	[maakunta_koodi] [nvarchar](2) NOT NULL,
	[maakunta] [nvarchar](255) NOT NULL,
	[maakunta_SV] [nvarchar](255) NOT NULL,
	[maakunta_EN] [nvarchar](255) NOT NULL,
	[avi_koodi] [nvarchar](2) NOT NULL,
	[avi] [nvarchar](255) NOT NULL,
	[avi_SV] [nvarchar](255) NOT NULL,
	[avi_EN] [nvarchar](255) NOT NULL,
	[ely_koodi] [nvarchar](2) NOT NULL,
	[ely] [nvarchar](255) NOT NULL,
	[ely_SV] [nvarchar](255) NOT NULL,
	[ely_EN] [nvarchar](255) NOT NULL,
	[seutukunta_koodi] [nvarchar](3) NOT NULL,
	[seutukunta] [nvarchar](255) NOT NULL,
	[seutukunta_SV] [nvarchar](255) NOT NULL,
	[seutukunta_EN] [nvarchar](255) NOT NULL,
	[suuralue_koodi] [nvarchar](2) NOT NULL,
	[suuralue] [nvarchar](255) NOT NULL,
	[suuralue_SV] [nvarchar](255) NOT NULL,
	[suuralue_EN] [nvarchar](255) NOT NULL,
	[kuntaryhma_koodi] [nvarchar](2) NOT NULL,
	[kuntaryhma] [nvarchar](255) NOT NULL,
	[kuntaryhma_SV] [nvarchar](255) NOT NULL,
	[kuntaryhma_EN] [nvarchar](255) NOT NULL,
	[laani_koodi] [nvarchar](2) NOT NULL,
	[laani] [nvarchar](255) NOT NULL,
	[laani_SV] [nvarchar](255) NOT NULL,
	[laani_EN] [nvarchar](255) NOT NULL,
	[tyovoima_elinkeinokeskus_koodi] [nvarchar](2) NOT NULL,
	[tyovoima_elinkeinokeskus] [nvarchar](255) NOT NULL,
	[tyovoima_elinkeinokeskus_SV] [nvarchar](255) NOT NULL,
	[tyovoima_elinkeinokeskus_EN] [nvarchar](255) NOT NULL,
	[kielisuhde_koodi] [nvarchar](2) NOT NULL,
	[kielisuhde] [nvarchar](255) NOT NULL,
	[kielisuhde_SV] [nvarchar](255) NOT NULL,
	[kielisuhde_EN] [nvarchar](255) NOT NULL,
	[mannersuomi_ahvenanmaa_koodi] [nvarchar](2) NOT NULL,
	[mannersuomi_ahvenanmaa] [nvarchar](255) NOT NULL,
	[mannersuomi_ahvenanmaa_SV] [nvarchar](255) NOT NULL,
	[mannersuomi_ahvenanmaa_EN] [nvarchar](255) NOT NULL,
	[SCD_alkaa] [datetime2](7) NULL,
	[SCD_paattyy] [datetime2](7) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[jarjestys_maakunta] [nvarchar](10) NULL,
	[jarjestys_avi] [nvarchar](10) NULL,
	[jarjestys_ely] [nvarchar](10) NULL,
	[jarjestys_seutukunta] [nvarchar](10) NULL,
	[jarjestys_suuralue] [nvarchar](10) NULL,
	[jarjestys_kuntaryhma] [nvarchar](10) NULL,
	[jarjestys_laani] [nvarchar](10) NULL,
	[jarjestys_tyovoima_elinkeinokeskus] [nvarchar](10) NULL,
	[jarjestys_kielisuhde] [nvarchar](10) NULL,
	[jarjestys_mannersuomi_ahvenanmaa] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_ammatillinen_koulutus_luokittelu]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_ammatillinen_koulutus_luokittelu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_ammatillinen_koulutus_luokittelu](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[ammatillisen_koulutuksen_luokittelu_avain] [nvarchar](10) NOT NULL,
	[oppisopimuskoulutus_koodi] [nvarchar](2) NOT NULL,
	[ammatillisen_koulutuksen_koulutuslaji_koodi] [nvarchar](2) NOT NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] [nvarchar](2) NOT NULL,
	[ammatillisen_koulutuksen_luokittelu_4_7_4_8_avain] [nvarchar](10) NOT NULL,
	[ammatillisen_koulutuksen_luokittelu_4_7_4_8] [nvarchar](100) NULL,
	[ammatillisen_koulutuksen_luokittelu_4_7_4_8_SV] [nvarchar](100) NULL,
	[ammatillisen_koulutuksen_luokittelu_4_7_4_8_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_ammatillinen_peruskoulutus_lisakoulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_ammatillinen_peruskoulutus_lisakoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_ammatillinen_peruskoulutus_lisakoulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[ammatillinen_peruskoulutus_lisakoulutus_koodi] [nvarchar](2) NOT NULL,
	[ammatillinen_peruskoulutus_lisakoulutus] [nvarchar](50) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus_SV] [nvarchar](50) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_ammatillisen_koulutuksen_koulutuslaji]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_ammatillisen_koulutuksen_koulutuslaji]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_ammatillisen_koulutuksen_koulutuslaji](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammatillisen_koulutuksen_koulutuslaji_koodi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](50) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_SV] [nvarchar](50) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_koodi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] [nvarchar](300) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_SV] [nvarchar](300) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_EN] [nvarchar](300) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_ammattiasema]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_ammattiasema]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_ammattiasema](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammattiasema_koodi] [nvarchar](10) NULL,
	[ammattiasema] [nvarchar](50) NULL,
	[ammattiasema_SV] [nvarchar](50) NULL,
	[ammattiasema_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_ammattiluokitus_2001]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_ammattiluokitus_2001]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_ammattiluokitus_2001](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammattiluokitus_2001_avain] [nvarchar](10) NULL,
	[ammattiluokitus_2001_koodi] [nvarchar](5) NULL,
	[ammattiluokitus_2001] [nvarchar](100) NULL,
	[ammattiluokitus_2001_SV] [nvarchar](100) NULL,
	[ammattiluokitus_2001_EN] [nvarchar](100) NULL,
	[taso] [nvarchar](1) NULL,
	[jarjestys] [smallint] NULL,
	[jarjestys_taso] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_ammattiluokitus_2010]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_ammattiluokitus_2010]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_ammattiluokitus_2010](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[ammattiluokitus_2010_avain] [nvarchar](10) NULL,
	[ammattiluokitus_2010_5_taso_koodi] [nvarchar](10) NULL,
	[ammattiluokitus_2010_5_taso] [nvarchar](150) NULL,
	[ammattiluokitus_2010_5_taso_SV] [nvarchar](150) NULL,
	[ammattiluokitus_2010_5_taso_EN] [nvarchar](150) NULL,
	[ammattiluokitus_2010_4_taso_koodi] [nvarchar](10) NULL,
	[ammattiluokitus_2010_4_taso] [nvarchar](150) NULL,
	[ammattiluokitus_2010_4_taso_SV] [nvarchar](150) NULL,
	[ammattiluokitus_2010_4_taso_EN] [nvarchar](150) NULL,
	[ammattiluokitus_2010_3_taso_koodi] [nvarchar](10) NULL,
	[ammattiluokitus_2010_3_taso] [nvarchar](150) NULL,
	[ammattiluokitus_2010_3_taso_SV] [nvarchar](150) NULL,
	[ammattiluokitus_2010_3_taso_EN] [nvarchar](150) NULL,
	[ammattiluokitus_2010_2_taso_koodi] [nvarchar](10) NULL,
	[ammattiluokitus_2010_2_taso] [nvarchar](150) NULL,
	[ammattiluokitus_2010_2_taso_SV] [nvarchar](150) NULL,
	[ammattiluokitus_2010_2_taso_EN] [nvarchar](150) NULL,
	[ammattiluokitus_2010_1_taso_koodi] [nvarchar](10) NULL,
	[ammattiluokitus_2010_1_taso] [nvarchar](150) NULL,
	[ammattiluokitus_2010_1_taso_SV] [nvarchar](150) NULL,
	[ammattiluokitus_2010_1_taso_EN] [nvarchar](150) NULL,
	[taso] [nvarchar](2) NULL,
	[jarjestys_ammattiluokitus_2010_taso5] [nvarchar](10) NULL,
	[jarjestys_ammattiluokitus_2010_taso4] [nvarchar](10) NULL,
	[jarjestys_ammattiluokitus_2010_taso3] [nvarchar](10) NULL,
	[jarjestys_ammattiluokitus_2010_taso2] [nvarchar](10) NULL,
	[jarjestys_ammattiluokitus_2010_taso1] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_ammattiluokitus_2010_talteen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_ammattiluokitus_2010_talteen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_ammattiluokitus_2010_talteen](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammattiluokitus_2010_avain] [nvarchar](10) NULL,
	[ammattiluokitus_2010_koodi] [nvarchar](5) NULL,
	[ammattiluokitus_2010] [nvarchar](150) NULL,
	[ammattiluokitus_2010_SV] [nvarchar](150) NULL,
	[ammattiluokitus_2010_EN] [nvarchar](150) NULL,
	[taso] [nvarchar](1) NULL,
	[jarjestys] [smallint] NULL,
	[jarjestys_taso] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_asuinkunta_sama_vai_eri_kuin_aiemmin]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_asuinkunta_sama_vai_eri_kuin_aiemmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_asuinkunta_sama_vai_eri_kuin_aiemmin](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[asuinkunta_sama_vai_eri_kuin_aiemmin_koodi] [nvarchar](2) NULL,
	[asuinkunta_sama_vai_eri_kuin_aiemmin] [nvarchar](100) NULL,
	[asuinkunta_sama_vai_eri_kuin_aiemmin_SV] [nvarchar](100) NULL,
	[asuinkunta_sama_vai_eri_kuin_aiemmin_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_asuinmaakunta_sama_kuin_tyopaikan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_asuinmaakunta_sama_kuin_tyopaikan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_asuinmaakunta_sama_kuin_tyopaikan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[asuinmaakunta_sama_kuin_tyopaikan_avain] [nvarchar](2) NULL,
	[asuinmaakunta_sama_kuin_tyopaikan] [nvarchar](255) NULL,
	[asuinmaakunta_sama_kuin_tyopaikan_SV] [nvarchar](255) NULL,
	[asuinmaakunta_sama_kuin_tyopaikan_EN] [nvarchar](255) NULL,
	[jarjestys] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_avoinvayla]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_avoinvayla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_avoinvayla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[avoinvayla_koodi] [nvarchar](2) NULL,
	[avoinvayla] [nvarchar](50) NULL,
	[avoinvayla_SV] [nvarchar](50) NULL,
	[avoinvayla_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_edellisen_vuoden_opiskelu]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_edellisen_vuoden_opiskelu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_edellisen_vuoden_opiskelu](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[edellisen_vuoden_opiskelu_avain] [nvarchar](10) NULL,
	[edellisen_vuoden_opiskelu_koulutus] [nvarchar](100) NULL,
	[edellisen_vuoden_opiskelu_koulutus_SV] [nvarchar](100) NULL,
	[edellisen_vuoden_opiskelu_koulutus_EN] [nvarchar](100) NULL,
	[edellisen_vuoden_opiskelu_tarkennus] [nvarchar](100) NULL,
	[edellisen_vuoden_opiskelu_tarkennus_SV] [nvarchar](100) NULL,
	[edellisen_vuoden_opiskelu_tarkennus_EN] [nvarchar](100) NULL,
	[jarjestys_koulutus] [nvarchar](10) NULL,
	[jarjestys_tarkennus] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_edeltavan_vuoden_asuinpaikka]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_edeltavan_vuoden_asuinpaikka]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_edeltavan_vuoden_asuinpaikka](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[edeltavan_vuoden_asuinpaikka_koodi] [nvarchar](2) NULL,
	[edeltavan_vuoden_asuinpaikka] [nvarchar](30) NULL,
	[edeltavan_vuoden_asuinpaikka_SV] [nvarchar](30) NULL,
	[edeltavan_vuoden_asuinpaikka_EN] [nvarchar](30) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_elakkeelle_siirtynyt_tai_kuollut]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_elakkeelle_siirtynyt_tai_kuollut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_elakkeelle_siirtynyt_tai_kuollut](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[elakkeelle_siirtynyt_tai_kuollut_koodi] [nvarchar](10) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_ryhma] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_ryhma_SV] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_ryhma_EN] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_SV] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_ensisijainen_opintooikeus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_ensisijainen_opintooikeus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_ensisijainen_opintooikeus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ensisijainen_opintooikeus_koodi] [nvarchar](2) NULL,
	[ensisijainen_opintooikeus] [nvarchar](50) NULL,
	[ensisijainen_opintooikeus_SV] [nvarchar](100) NULL,
	[ensisijainen_opintooikeus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_erityisopetuksen_peruste]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_erityisopetuksen_peruste]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_erityisopetuksen_peruste](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[erityisopetuksen_peruste_avain] [nvarchar](10) NULL,
	[erityisopetuksen_peruste] [nvarchar](250) NULL,
	[erityisopetuksen_peruste_SV] [nvarchar](250) NULL,
	[erityisopetuksen_peruste_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_erityisoppilaan_opetusryhma]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_erityisoppilaan_opetusryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_erityisoppilaan_opetusryhma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[erityisoppilaan_opetusryhma_avain] [nvarchar](10) NULL,
	[erityisoppilaan_opetusryhma] [nvarchar](250) NULL,
	[erityisoppilaan_opetusryhma_SV] [nvarchar](250) NULL,
	[erityisoppilaan_opetusryhma_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_eu_etamaat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_eu_etamaat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_eu_etamaat](
	[id] [int] NOT NULL,
	[eu_etamaat_avain] [nvarchar](10) NULL,
	[eu_etamaat] [nvarchar](100) NULL,
	[eu_etamaat_SV] [nvarchar](100) NULL,
	[eu_etamaat_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nvarchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_hakukohde]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_hakukohde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_hakukohde](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hakukohde_avain] [nvarchar](10) NULL,
	[hakukohde] [nvarchar](250) NULL,
	[hakukohde_SV] [nvarchar](250) NULL,
	[hakukohde_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_hakukohde_erillisvalinta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_hakukohde_erillisvalinta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_hakukohde_erillisvalinta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hakukohde_erillisvalinta_avain] [nvarchar](10) NULL,
	[hakukohde_erillisvalinta] [nvarchar](250) NULL,
	[hakukohde_erillisvalinta_SV] [nvarchar](250) NULL,
	[hakukohde_erillisvalinta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_hakukohteen_prioriteetti]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_hakukohteen_prioriteetti]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_hakukohteen_prioriteetti](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hakukohteen_prioriteetti_avain] [nvarchar](10) NULL,
	[hakukohteen_prioriteetti] [nvarchar](250) NULL,
	[hakukohteen_prioriteetti_SV] [nvarchar](250) NULL,
	[hakukohteen_prioriteetti_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_hakukohteen_tulos]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_hakukohteen_tulos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_hakukohteen_tulos](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hakukohde_hyvaksytty_koodi] [nvarchar](10) NULL,
	[hakukohde_hyvaksytty] [nvarchar](50) NULL,
	[hakukohde_hyvaksytty_SV] [nvarchar](50) NULL,
	[hakukohde_hyvaksytty_EN] [nvarchar](50) NULL,
	[jarjestys_hyvaksytty] [nvarchar](10) NULL,
	[hakukohde_vastaanotettu_koodi] [nvarchar](10) NULL,
	[hakukohde_vastaanotettu] [nvarchar](50) NULL,
	[hakukohde_vastaanotettu_SV] [nvarchar](50) NULL,
	[hakukohde_vastaanotettu_EN] [nvarchar](50) NULL,
	[jarjestys_vastaanotettu] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_hakukohteen_tutkinnon_taso]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_hakukohteen_tutkinnon_taso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_hakukohteen_tutkinnon_taso](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hakukohde_tutkinnon_taso_koodi] [nvarchar](10) NULL,
	[hakukohde_tutkinnon_taso] [nvarchar](100) NULL,
	[hakukohde_tutkinnon_taso_SV] [nvarchar](100) NULL,
	[hakukohde_tutkinnon_taso_EN] [nvarchar](100) NULL,
	[jarjestys_hakukohde_tutkinnon_taso] [nvarchar](10) NULL,
	[hakukohde_tutkinnon_taso_tarkennus_koodi] [nvarchar](10) NULL,
	[hakukohde_tutkinnon_taso_tarkennus] [nvarchar](100) NULL,
	[hakukohde_tutkinnon_taso_tarkennus_SV] [nvarchar](100) NULL,
	[hakukohde_tutkinnon_taso_tarkennus_EN] [nvarchar](100) NULL,
	[jarjestys_hakukohde_tutkinnon_taso_tarkennus] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_hallinnonala]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_hallinnonala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_hallinnonala](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[hallinnonala_koodi] [nvarchar](2) NOT NULL,
	[hallinnonala] [nvarchar](200) NULL,
	[hallinnonala_SV] [nvarchar](200) NULL,
	[hallinnonala_EN] [nvarchar](200) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_hallinnonala2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_hallinnonala2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_hallinnonala2](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[hallinnonala_koodi] [nvarchar](2) NOT NULL,
	[hallinnonala] [nvarchar](200) NULL,
	[hallinnonala_SV] [nvarchar](200) NULL,
	[hallinnonala_EN] [nvarchar](200) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_hetu_ok]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_hetu_ok]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_hetu_ok](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hetu_ok_avain] [nvarchar](10) NULL,
	[hetu_ok] [nvarchar](50) NULL,
	[hetu_ok_SV] [nvarchar](50) NULL,
	[hetu_ok_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_ika]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_ika]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_ika](
	[id] [int] NULL,
	[luotu] [date] NULL,
	[ika_avain] [nvarchar](10) NOT NULL,
	[ika_int] [int] NULL,
	[ika] [nvarchar](50) NULL,
	[ika_SV] [nvarchar](50) NULL,
	[ika_EN] [nvarchar](50) NULL,
	[ika5v_int] [int] NULL,
	[ika5v] [nvarchar](50) NULL,
	[ika5v_SV] [nvarchar](50) NULL,
	[ika5v_EN] [nvarchar](50) NULL,
	[jarjestys_ika] [nvarchar](50) NULL,
	[jarjestys_ika5v] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_EN] [nvarchar](100) NULL,
	[jarjestys_4e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_2e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_EN] [nvarchar](100) NULL,
	[jarjestys_1e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutussektorilla]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutussektorilla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutussektorilla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutussektorilla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutussektorilla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutussektorilla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutussektorilla_EN] [nvarchar](100) NULL,
	[jarjestys_7e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_3e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisessa_maakunnassa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_alkuperaisessa_maakunnassa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisessa_maakunnassa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisessa_maakunnassa_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisessa_maakunnassa] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisessa_maakunnassa_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisessa_maakunnassa_EN] [nvarchar](100) NULL,
	[jarjestys_6e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_EN] [nvarchar](100) NULL,
	[jarjestys_5e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_EN] [nvarchar](100) NULL,
	[jarjestys_4f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_koulutusalalla_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_muulla_koulutusalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_muulla_koulutusalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_koulutusalalla_2002_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_koulutusalalla_2002] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutusalalla_2002_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutusalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_2f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_koulutusasteella_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_muulla_koulutusasteella_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_muulla_koulutusasteella_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_koulutusasteella_2002_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_koulutusasteella_2002] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutusasteella_2002_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutusasteella_2002_EN] [nvarchar](100) NULL,
	[jarjestys_1f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_koulutussektorilla]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_muulla_koulutussektorilla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_muulla_koulutussektorilla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_koulutussektorilla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_koulutussektorilla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutussektorilla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutussektorilla_EN] [nvarchar](100) NULL,
	[jarjestys_7f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_opintoalalla_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_muulla_opintoalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_muulla_opintoalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_opintoalalla_2002_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_opintoalalla_2002] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_opintoalalla_2002_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_opintoalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_3f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muussa_maakunnassa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_muussa_maakunnassa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_muussa_maakunnassa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muussa_maakunnassa_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muussa_maakunnassa] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muussa_maakunnassa_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muussa_maakunnassa_EN] [nvarchar](100) NULL,
	[jarjestys_6f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muussa_oppilaitoksessa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatkaa_opiskelua_muussa_oppilaitoksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatkaa_opiskelua_muussa_oppilaitoksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muussa_oppilaitoksessa_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muussa_oppilaitoksessa] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muussa_oppilaitoksessa_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muussa_oppilaitoksessa_EN] [nvarchar](100) NULL,
	[jarjestys_5f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_jatko_opiskelu]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_jatko_opiskelu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_jatko_opiskelu](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatko_opiskelu_koodi] [nvarchar](2) NULL,
	[jatko_opiskelu] [nvarchar](50) NULL,
	[jatko_opiskelu_SV] [nvarchar](50) NULL,
	[jatko_opiskelu_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_joustava_perusopetus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_joustava_perusopetus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_joustava_perusopetus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[joustava_perusopetus_koodi] [nchar](2) NULL,
	[joustava_perusopetus] [nvarchar](50) NULL,
	[joustava_perusopetus_SV] [nvarchar](50) NULL,
	[joustava_perusopetus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_kansalaisuus_versio1]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_kansalaisuus_versio1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_kansalaisuus_versio1](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kansalaisuus_versio1_koodi] [nvarchar](2) NULL,
	[kansalaisuus_versio1] [nvarchar](50) NULL,
	[kansalaisuus_versio1_SV] [nvarchar](50) NULL,
	[kansalaisuus_versio1_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_kansalaisuus_versio2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_kansalaisuus_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_kansalaisuus_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kansalaisuus_versio2_koodi] [nvarchar](2) NULL,
	[kansalaisuus_versio2] [nvarchar](50) NULL,
	[kansalaisuus_versio2_SV] [nvarchar](50) NULL,
	[kansalaisuus_versio2_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_kausi]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_kausi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_kausi](
	[kausi_id] [nvarchar](10) NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[vuosi] [int] NULL,
	[vuosiselite] [nvarchar](20) NULL,
	[vuosiselite_SV] [nvarchar](20) NULL,
	[vuosiselite_EN] [nvarchar](20) NULL,
	[lukukausi] [int] NULL,
	[lukukausiselite] [nvarchar](20) NULL,
	[lukukausiselite_SV] [nvarchar](20) NULL,
	[lukukausiselite_EN] [nvarchar](20) NULL,
	[kuukausi] [int] NULL,
	[kuukausiselite] [nvarchar](20) NULL,
	[kuukausiselite_SV] [nvarchar](20) NULL,
	[kuukausiselite_EN] [nvarchar](20) NULL,
	[paiva] [int] NULL,
	[lukuvuosi] [nvarchar](20) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](15) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_kieli]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_kieli]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_kieli](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kieli_avain] [nvarchar](10) NULL,
	[kieli_koodi] [nvarchar](2) NULL,
	[kieli] [nvarchar](50) NULL,
	[kieli_SV] [nvarchar](50) NULL,
	[kieli_EN] [nvarchar](50) NULL,
	[iso3kirjainta_koodi] [nvarchar](3) NULL,
	[jarjestys] [smallint] NULL,
	[jarjestys_iso3kirjainta] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_kieli2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_kieli2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_kieli2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[kieli_koodi] [nchar](2) NULL,
	[kieli] [nvarchar](50) NULL,
	[kieli_SV] [nvarchar](50) NULL,
	[kieli_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutuksen_jarjestaja]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutuksen_jarjestaja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutuksen_jarjestaja](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koulutuksen_jarjestajakoodi] [varchar](10) NOT NULL,
	[korvaavakoodi] [varchar](10) NULL,
	[alkaa] [datetime2](7) NULL,
	[paattyy] [datetime2](7) NULL,
	[viimeisin_tilv] [nvarchar](4) NOT NULL,
	[koulutuksen_jarjestajaselite_FI] [nvarchar](255) NOT NULL,
	[koulutuksen_jarjestajaselite_SV] [nvarchar](255) NOT NULL,
	[koulutuksen_jarjestajaselite_EN] [nvarchar](255) NOT NULL,
	[omistajatyyppikoodi] [varchar](2) NOT NULL,
	[omistajatyyppiselite_FI] [nvarchar](255) NOT NULL,
	[omistajatyyppiselite_SV] [nvarchar](255) NOT NULL,
	[omistajatyyppiselite_EN] [nvarchar](255) NOT NULL,
	[koulutuksen_jarjestajan_kielikoodi] [varchar](2) NOT NULL,
	[koulutuksen_jarjestajan_kieliselite_FI] [nvarchar](255) NOT NULL,
	[koulutuksen_jarjestajan_kieliselite_SV] [nvarchar](255) NOT NULL,
	[koulutuksen_jarjestajan_kieliselite_EN] [nvarchar](255) NOT NULL,
	[sijaintikuntakoodi] [varchar](3) NOT NULL,
	[sijaintikuntaselite_FI] [nvarchar](255) NOT NULL,
	[sijaintikuntaselite_SV] [nvarchar](255) NOT NULL,
	[sijaintikuntaselite_EN] [nvarchar](255) NOT NULL,
	[SCD_alkaa] [datetime2](7) NULL,
	[SCD_paattyy] [datetime2](7) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[jarjestys_omistajatyyppi] [nvarchar](10) NULL,
	[jarjestys_koulutuksen_jarjestajan_kieli] [nvarchar](10) NULL,
	[jarjestys_sijaintikunta] [nvarchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutuksen_jarjestajan_koko]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutuksen_jarjestajan_koko]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutuksen_jarjestajan_koko](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koko_koodi] [nchar](2) NULL,
	[koko] [nvarchar](50) NULL,
	[koko_SV] [nvarchar](50) NULL,
	[koko_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutuksen_jarjestamismuoto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutuksen_jarjestamismuoto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutuksen_jarjestamismuoto](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koulutuksen_jarjestamismuoto_koodi] [nvarchar](2) NOT NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](50) NULL,
	[koulutuksen_jarjestamismuoto_SV] [nvarchar](50) NULL,
	[koulutuksen_jarjestamismuoto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutuksen_kesto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutuksen_kesto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutuksen_kesto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutuksen_kesto_koodi] [varchar](2) NULL,
	[koulutuksen_kesto] [nvarchar](50) NULL,
	[koulutuksen_kesto_SV] [nvarchar](50) NULL,
	[koulutuksen_kesto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutuksen_kieli_versio1]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutuksen_kieli_versio1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutuksen_kieli_versio1](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutuksen_kieli_versio1_koodi] [nvarchar](3) NULL,
	[koulutuksen_kieli_versio1] [nvarchar](250) NULL,
	[koulutuksen_kieli_versio1_SV] [nvarchar](250) NULL,
	[koulutuksen_kieli_versio1_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutuksen_paattaneiden_toiminta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutuksen_paattaneiden_toiminta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutuksen_paattaneiden_toiminta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutuksen_paattaneiden_toiminta_koodi] [nvarchar](2) NULL,
	[koulutuksen_paattaneiden_toiminta] [nvarchar](250) NULL,
	[koulutuksen_paattaneiden_toiminta_SV] [nvarchar](250) NULL,
	[koulutuksen_paattaneiden_toiminta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutuksen_tavoite_toteuma]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutuksen_tavoite_toteuma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutuksen_tavoite_toteuma](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koulutuksen_tavoite_toteuma_koodi] [nvarchar](2) NOT NULL,
	[koulutuksen_tavoite_toteuma] [nvarchar](50) NULL,
	[koulutuksen_tavoite_toteuma_SV] [nvarchar](50) NULL,
	[koulutuksen_tavoite_toteuma_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutuksesta_kulunut_aika]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutuksesta_kulunut_aika]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutuksesta_kulunut_aika](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koulutuksesta_kulunut_aika_koodi] [nvarchar](20) NOT NULL,
	[koulutuksesta_kulunut_aika] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_SV] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_5v] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_5v_SV] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_5v_EN] [nvarchar](100) NULL,
	[jarjestys_5v] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_tthv] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_tthv_SV] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_tthv_EN] [nvarchar](100) NULL,
	[jarjestys_tthv] [nvarchar](100) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutusaste_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutusaste_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutusaste_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koulutusaste_2002koodi] [nvarchar](10) NOT NULL,
	[koulutusaste_2002] [nvarchar](250) NULL,
	[koulutusaste_2002_SV] [nvarchar](250) NULL,
	[koulutusaste_2002_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutuslaji]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutuslaji]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutuslaji](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutuslaji_koodi] [nvarchar](10) NULL,
	[koulutuslaji] [nvarchar](150) NULL,
	[koulutuslaji_SV] [nvarchar](150) NULL,
	[koulutuslaji_EN] [nvarchar](150) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutuslaji_okm]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutuslaji_okm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutuslaji_okm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutuslaji_okm_avain] [nvarchar](10) NULL,
	[koulutuslaji_okm] [nvarchar](100) NULL,
	[koulutuslaji_okm_SV] [nvarchar](100) NULL,
	[koulutuslaji_okm_EN] [nvarchar](100) NULL,
	[koulutuslaji_okm2] [nvarchar](100) NULL,
	[koulutuslaji_okm2_SV] [nvarchar](100) NULL,
	[koulutuslaji_okm2_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[jarjestys2] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutuslaji2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutuslaji2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutuslaji2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutuslaji2_koodi] [nvarchar](10) NULL,
	[koulutuslaji2] [nvarchar](250) NULL,
	[koulutuslaji2_SV] [nvarchar](250) NULL,
	[koulutuslaji2_EN] [nvarchar](250) NULL,
	[jarjestys_koulutuslaji2] [nvarchar](50) NULL,
	[jarjestamistapa] [nvarchar](250) NULL,
	[jarjestamistapa_SV] [nvarchar](250) NULL,
	[jarjestamistapa_EN] [nvarchar](250) NULL,
	[jarjestys_jarjestamistapa] [nvarchar](50) NULL,
	[jarjestamismuoto] [nvarchar](250) NULL,
	[jarjestamismuoto_SV] [nvarchar](250) NULL,
	[jarjestamismuoto_EN] [nvarchar](250) NULL,
	[jarjestys_jarjestamismuoto] [nvarchar](50) NULL,
	[tutkintotyyppi] [nvarchar](250) NULL,
	[tutkintotyyppi_SV] [nvarchar](250) NULL,
	[tutkintotyyppi_EN] [nvarchar](250) NULL,
	[jarjestys_tutkintotyyppi] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutuslaji3]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutuslaji3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutuslaji3](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutuslaji3_koodi] [nvarchar](10) NULL,
	[koulutuslaji3] [nvarchar](250) NULL,
	[koulutuslaji3_SV] [nvarchar](250) NULL,
	[koulutuslaji3_EN] [nvarchar](250) NULL,
	[jarjestys_koulutuslaji3] [nvarchar](50) NULL,
	[jarjestamistapa] [nvarchar](250) NULL,
	[jarjestamistapa_SV] [nvarchar](250) NULL,
	[jarjestamistapa_EN] [nvarchar](250) NULL,
	[jarjestys_jarjestamistapa] [nvarchar](50) NULL,
	[jarjestamismuoto] [nvarchar](250) NULL,
	[jarjestamismuoto_SV] [nvarchar](250) NULL,
	[jarjestamismuoto_EN] [nvarchar](250) NULL,
	[jarjestys_jarjestamismuoto] [nvarchar](50) NULL,
	[tutkintotyyppi] [nvarchar](250) NULL,
	[tutkintotyyppi_SV] [nvarchar](250) NULL,
	[tutkintotyyppi_EN] [nvarchar](250) NULL,
	[jarjestys_tutkintotyyppi] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutusluokitus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutusluokitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutusluokitus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NULL,
	[koulutusluokitus_avain] [nvarchar](10) NOT NULL,
	[koulutus_koodi] [nvarchar](6) NOT NULL,
	[viimeisin_tilv] [nvarchar](4) NOT NULL,
	[koulutus] [nvarchar](255) NOT NULL,
	[koulutus_SV] [nvarchar](255) NOT NULL,
	[koulutus_EN] [nvarchar](255) NOT NULL,
	[koulutuslyhyt] [nvarchar](50) NOT NULL,
	[koulutuslyhyt_SV] [nvarchar](50) NOT NULL,
	[koulutuslyhyt_EN] [nvarchar](50) NOT NULL,
	[taso_koodi] [nvarchar](5) NOT NULL,
	[koulutusala_koodi] [nvarchar](2) NOT NULL,
	[koulutusala] [nvarchar](255) NOT NULL,
	[koulutusala_SV] [nvarchar](255) NOT NULL,
	[koulutusala_EN] [nvarchar](255) NOT NULL,
	[koulutusaste_koodi] [nvarchar](2) NOT NULL,
	[koulutusaste] [nvarchar](255) NOT NULL,
	[koulutusaste_SV] [nvarchar](255) NOT NULL,
	[koulutusaste_EN] [nvarchar](255) NOT NULL,
	[koulutusala2002_koodi] [nvarchar](2) NOT NULL,
	[koulutusala2002] [nvarchar](255) NOT NULL,
	[koulutusala2002_SV] [nvarchar](255) NOT NULL,
	[koulutusala2002_EN] [nvarchar](255) NOT NULL,
	[opintoala2002_koodi] [nvarchar](3) NOT NULL,
	[opintoala2002] [nvarchar](255) NOT NULL,
	[opintoala2002_SV] [nvarchar](255) NOT NULL,
	[opintoala2002_EN] [nvarchar](255) NOT NULL,
	[koulutusaste2002_koodi] [nvarchar](2) NOT NULL,
	[koulutusaste2002] [nvarchar](255) NOT NULL,
	[koulutusaste2002_SV] [nvarchar](255) NOT NULL,
	[koulutusaste2002_EN] [nvarchar](255) NOT NULL,
	[koulutusala1995_koodi] [nvarchar](2) NOT NULL,
	[koulutusala1995] [nvarchar](255) NOT NULL,
	[koulutusala1995_SV] [nvarchar](255) NOT NULL,
	[koulutusala1995_EN] [nvarchar](255) NOT NULL,
	[opintoala1995_koodi] [nvarchar](3) NOT NULL,
	[opintoala1995] [nvarchar](255) NOT NULL,
	[opintoala1995_SV] [nvarchar](255) NOT NULL,
	[opintoala1995_EN] [nvarchar](255) NOT NULL,
	[koulutusaste1995_koodi] [nvarchar](2) NOT NULL,
	[koulutusaste1995] [nvarchar](255) NOT NULL,
	[koulutusaste1995_SV] [nvarchar](255) NOT NULL,
	[koulutusaste1995_EN] [nvarchar](255) NOT NULL,
	[isclek_koodi] [nvarchar](2) NOT NULL,
	[isclek] [nvarchar](255) NOT NULL,
	[isclek_SV] [nvarchar](255) NOT NULL,
	[isclek_EN] [nvarchar](255) NOT NULL,
	[iscle_koodi] [nvarchar](2) NOT NULL,
	[iscle] [nvarchar](255) NOT NULL,
	[iscle_SV] [nvarchar](255) NOT NULL,
	[iscle_EN] [nvarchar](255) NOT NULL,
	[iscfik_koodi] [nvarchar](3) NOT NULL,
	[iscfik] [nvarchar](255) NOT NULL,
	[iscfik_SV] [nvarchar](255) NOT NULL,
	[iscfik_EN] [nvarchar](255) NOT NULL,
	[iscde_koodi] [nvarchar](2) NOT NULL,
	[iscde] [nvarchar](255) NOT NULL,
	[iscde_SV] [nvarchar](255) NOT NULL,
	[iscde_EN] [nvarchar](255) NOT NULL,
	[iscor_koodi] [nvarchar](2) NOT NULL,
	[iscor] [nvarchar](255) NOT NULL,
	[iscor_SV] [nvarchar](255) NOT NULL,
	[iscor_EN] [nvarchar](255) NOT NULL,
	[iscst_koodi] [nvarchar](2) NOT NULL,
	[iscst] [nvarchar](255) NOT NULL,
	[iscst_SV] [nvarchar](255) NOT NULL,
	[iscst_EN] [nvarchar](255) NOT NULL,
	[iscdu_koodi] [nvarchar](2) NOT NULL,
	[iscdu] [nvarchar](255) NOT NULL,
	[iscdu_SV] [nvarchar](255) NOT NULL,
	[iscdu_EN] [nvarchar](255) NOT NULL,
	[iscle2011_koodi] [nvarchar](10) NOT NULL,
	[iscle2011] [nvarchar](255) NOT NULL,
	[iscle2011_SV] [nvarchar](255) NOT NULL,
	[iscle2011_EN] [nvarchar](255) NOT NULL,
	[isccat2011_koodi] [nvarchar](10) NOT NULL,
	[isccat2011] [nvarchar](255) NOT NULL,
	[isccat2011_SV] [nvarchar](255) NOT NULL,
	[isccat2011_EN] [nvarchar](255) NOT NULL,
	[iscsubcat2011_koodi] [nvarchar](10) NOT NULL,
	[iscsubcat2011] [nvarchar](255) NOT NULL,
	[iscsubcat2011_SV] [nvarchar](255) NOT NULL,
	[iscsubcat2011_EN] [nvarchar](255) NOT NULL,
	[iscfi2013_koodi] [nvarchar](10) NOT NULL,
	[iscfi2013] [nvarchar](255) NOT NULL,
	[iscfi2013_SV] [nvarchar](255) NOT NULL,
	[iscfi2013_EN] [nvarchar](255) NOT NULL,
	[iscfinarrow2013_koodi] [nvarchar](10) NOT NULL,
	[iscfinarrow2013] [nvarchar](255) NOT NULL,
	[iscfinarrow2013_SV] [nvarchar](255) NOT NULL,
	[iscfinarrow2013_EN] [nvarchar](255) NOT NULL,
	[iscfibroad2013_koodi] [nvarchar](10) NOT NULL,
	[iscfibroad2013] [nvarchar](255) NOT NULL,
	[iscfibroad2013_SV] [nvarchar](255) NOT NULL,
	[iscfibroad2013_EN] [nvarchar](255) NOT NULL,
	[koulutusaste_taso2_koodi] [nvarchar](10) NOT NULL,
	[koulutusaste_taso2] [nvarchar](255) NOT NULL,
	[koulutusaste_taso2_SV] [nvarchar](255) NOT NULL,
	[koulutusaste_taso2_EN] [nvarchar](255) NOT NULL,
	[SCD_alkaa] [datetime2](7) NULL,
	[SCD_paattyy] [datetime2](7) NULL,
	[olo_koodi] [nvarchar](20) NULL,
	[lakkautusvuosi] [nvarchar](20) NULL,
	[korvaava_koulutus_koodi] [nvarchar](6) NULL,
	[muutosvuosi] [nvarchar](20) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[jarjestys_taso] [nvarchar](10) NULL,
	[jarjestys_koulutusala] [nvarchar](10) NULL,
	[jarjestys_koulutusaste] [nvarchar](10) NULL,
	[jarjestys_koulutusala2002] [nvarchar](10) NULL,
	[jarjestys_opintoala2002] [nvarchar](10) NULL,
	[jarjestys_koulutusaste2002] [nvarchar](10) NULL,
	[jarjestys_koulutusala1995] [nvarchar](10) NULL,
	[jarjestys_opintoala1995] [nvarchar](10) NULL,
	[jarjestys_koulutusaste1995] [nvarchar](10) NULL,
	[jarjestys_isclek] [nvarchar](10) NULL,
	[jarjestys_iscle] [nvarchar](10) NULL,
	[jarjestys_iscfik] [nvarchar](10) NULL,
	[jarjestys_iscde] [nvarchar](10) NULL,
	[jarjestys_iscor] [nvarchar](10) NULL,
	[jarjestys_iscst] [nvarchar](10) NULL,
	[jarjestys_iscdu] [nvarchar](10) NULL,
	[jarjestys_iscle2011] [nvarchar](10) NULL,
	[jarjestys_isccat2011] [nvarchar](10) NULL,
	[jarjestys_iscsubcat2011] [nvarchar](10) NULL,
	[jarjestys_iscfi2013] [nvarchar](10) NULL,
	[jarjestys_iscfinarrow2013] [nvarchar](10) NULL,
	[jarjestys_iscfibroad2013] [nvarchar](10) NULL,
	[jarjestys_koulutusaste_taso2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutusluokitus_TEST_20160205_JN]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutusluokitus_TEST_20160205_JN]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutusluokitus_TEST_20160205_JN](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NULL,
	[koulutusluokitus_avain] [nvarchar](10) NOT NULL,
	[koulutus_koodi] [nvarchar](6) NOT NULL,
	[viimeisin_tilv] [nvarchar](4) NOT NULL,
	[koulutus] [nvarchar](255) NOT NULL,
	[koulutus_SV] [nvarchar](255) NOT NULL,
	[koulutus_EN] [nvarchar](255) NOT NULL,
	[koulutuslyhyt] [nvarchar](50) NOT NULL,
	[koulutuslyhyt_SV] [nvarchar](50) NOT NULL,
	[koulutuslyhyt_EN] [nvarchar](50) NOT NULL,
	[taso_koodi] [nvarchar](5) NOT NULL,
	[koulutusala_koodi] [nvarchar](2) NOT NULL,
	[koulutusala] [nvarchar](255) NOT NULL,
	[koulutusala_SV] [nvarchar](255) NOT NULL,
	[koulutusala_EN] [nvarchar](255) NOT NULL,
	[koulutusaste_koodi] [nvarchar](2) NOT NULL,
	[koulutusaste] [nvarchar](255) NOT NULL,
	[koulutusaste_SV] [nvarchar](255) NOT NULL,
	[koulutusaste_EN] [nvarchar](255) NOT NULL,
	[koulutusala2002_koodi] [nvarchar](2) NOT NULL,
	[koulutusala2002] [nvarchar](255) NOT NULL,
	[koulutusala2002_SV] [nvarchar](255) NOT NULL,
	[koulutusala2002_EN] [nvarchar](255) NOT NULL,
	[opintoala2002_koodi] [nvarchar](3) NOT NULL,
	[opintoala2002] [nvarchar](255) NOT NULL,
	[opintoala2002_SV] [nvarchar](255) NOT NULL,
	[opintoala2002_EN] [nvarchar](255) NOT NULL,
	[koulutusaste2002_koodi] [nvarchar](2) NOT NULL,
	[koulutusaste2002] [nvarchar](255) NOT NULL,
	[koulutusaste2002_SV] [nvarchar](255) NOT NULL,
	[koulutusaste2002_EN] [nvarchar](255) NOT NULL,
	[koulutusala1995_koodi] [nvarchar](2) NOT NULL,
	[koulutusala1995] [nvarchar](255) NOT NULL,
	[koulutusala1995_SV] [nvarchar](255) NOT NULL,
	[koulutusala1995_EN] [nvarchar](255) NOT NULL,
	[opintoala1995_koodi] [nvarchar](3) NOT NULL,
	[opintoala1995] [nvarchar](255) NOT NULL,
	[opintoala1995_SV] [nvarchar](255) NOT NULL,
	[opintoala1995_EN] [nvarchar](255) NOT NULL,
	[koulutusaste1995_koodi] [nvarchar](2) NOT NULL,
	[koulutusaste1995] [nvarchar](255) NOT NULL,
	[koulutusaste1995_SV] [nvarchar](255) NOT NULL,
	[koulutusaste1995_EN] [nvarchar](255) NOT NULL,
	[isclek_koodi] [nvarchar](2) NOT NULL,
	[isclek] [nvarchar](255) NOT NULL,
	[isclek_SV] [nvarchar](255) NOT NULL,
	[isclek_EN] [nvarchar](255) NOT NULL,
	[iscle_koodi] [nvarchar](2) NOT NULL,
	[iscle] [nvarchar](255) NOT NULL,
	[iscle_SV] [nvarchar](255) NOT NULL,
	[iscle_EN] [nvarchar](255) NOT NULL,
	[iscfik_koodi] [nvarchar](3) NOT NULL,
	[iscfik] [nvarchar](255) NOT NULL,
	[iscfik_SV] [nvarchar](255) NOT NULL,
	[iscfik_EN] [nvarchar](255) NOT NULL,
	[iscde_koodi] [nvarchar](2) NOT NULL,
	[iscde] [nvarchar](255) NOT NULL,
	[iscde_SV] [nvarchar](255) NOT NULL,
	[iscde_EN] [nvarchar](255) NOT NULL,
	[iscor_koodi] [nvarchar](2) NOT NULL,
	[iscor] [nvarchar](255) NOT NULL,
	[iscor_SV] [nvarchar](255) NOT NULL,
	[iscor_EN] [nvarchar](255) NOT NULL,
	[iscst_koodi] [nvarchar](2) NOT NULL,
	[iscst] [nvarchar](255) NOT NULL,
	[iscst_SV] [nvarchar](255) NOT NULL,
	[iscst_EN] [nvarchar](255) NOT NULL,
	[iscdu_koodi] [nvarchar](2) NOT NULL,
	[iscdu] [nvarchar](255) NOT NULL,
	[iscdu_SV] [nvarchar](255) NOT NULL,
	[iscdu_EN] [nvarchar](255) NOT NULL,
	[iscle2011_koodi] [nvarchar](10) NOT NULL,
	[iscle2011] [nvarchar](255) NOT NULL,
	[iscle2011_SV] [nvarchar](255) NOT NULL,
	[iscle2011_EN] [nvarchar](255) NOT NULL,
	[isccat2011_koodi] [nvarchar](10) NOT NULL,
	[isccat2011] [nvarchar](255) NOT NULL,
	[isccat2011_SV] [nvarchar](255) NOT NULL,
	[isccat2011_EN] [nvarchar](255) NOT NULL,
	[iscsubcat2011_koodi] [nvarchar](10) NOT NULL,
	[iscsubcat2011] [nvarchar](255) NOT NULL,
	[iscsubcat2011_SV] [nvarchar](255) NOT NULL,
	[iscsubcat2011_EN] [nvarchar](255) NOT NULL,
	[iscfi2013_koodi] [nvarchar](10) NOT NULL,
	[iscfi2013] [nvarchar](255) NOT NULL,
	[iscfi2013_SV] [nvarchar](255) NOT NULL,
	[iscfi2013_EN] [nvarchar](255) NOT NULL,
	[iscfinarrow2013_koodi] [nvarchar](10) NOT NULL,
	[iscfinarrow2013] [nvarchar](255) NOT NULL,
	[iscfinarrow2013_SV] [nvarchar](255) NOT NULL,
	[iscfinarrow2013_EN] [nvarchar](255) NOT NULL,
	[iscfibroad2013_koodi] [nvarchar](10) NOT NULL,
	[iscfibroad2013] [nvarchar](255) NOT NULL,
	[iscfibroad2013_SV] [nvarchar](255) NOT NULL,
	[iscfibroad2013_EN] [nvarchar](255) NOT NULL,
	[SCD_alkaa] [datetime2](7) NULL,
	[SCD_paattyy] [datetime2](7) NULL,
	[olo_koodi] [nvarchar](20) NULL,
	[lakkautusvuosi] [nvarchar](20) NULL,
	[korvaava_koulutus_koodi] [nvarchar](6) NULL,
	[muutosvuosi] [nvarchar](20) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[jarjestys_taso] [nvarchar](10) NULL,
	[jarjestys_koulutusala] [nvarchar](10) NULL,
	[jarjestys_koulutusaste] [nvarchar](10) NULL,
	[jarjestys_koulutusala2002] [nvarchar](10) NULL,
	[jarjestys_opintoala2002] [nvarchar](10) NULL,
	[jarjestys_koulutusaste2002] [nvarchar](10) NULL,
	[jarjestys_koulutusala1995] [nvarchar](10) NULL,
	[jarjestys_opintoala1995] [nvarchar](10) NULL,
	[jarjestys_koulutusaste1995] [nvarchar](10) NULL,
	[jarjestys_isclek] [nvarchar](10) NULL,
	[jarjestys_iscle] [nvarchar](10) NULL,
	[jarjestys_iscfik] [nvarchar](10) NULL,
	[jarjestys_iscde] [nvarchar](10) NULL,
	[jarjestys_iscor] [nvarchar](10) NULL,
	[jarjestys_iscst] [nvarchar](10) NULL,
	[jarjestys_iscdu] [nvarchar](10) NULL,
	[jarjestys_iscle2011] [nvarchar](10) NULL,
	[jarjestys_isccat2011] [nvarchar](10) NULL,
	[jarjestys_iscsubcat2011] [nvarchar](10) NULL,
	[jarjestys_iscfi2013] [nvarchar](10) NULL,
	[jarjestys_iscfinarrow2013] [nvarchar](10) NULL,
	[jarjestys_iscfibroad2013] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutusmuoto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutusmuoto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutusmuoto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutusmuoto_koodi] [nvarchar](2) NULL,
	[koulutusmuoto] [nvarchar](350) NULL,
	[koulutusmuoto_SV] [nvarchar](350) NULL,
	[koulutusmuoto_EN] [nvarchar](350) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutusohjelma_amk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutusohjelma_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutusohjelma_amk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutusohjelma_amk_koodi] [nvarchar](4) NULL,
	[koulutusohjelma_amk] [nvarchar](150) NULL,
	[koulutusohjelma_amk_SV] [nvarchar](150) NULL,
	[koulutusohjelma_amk_EN] [nvarchar](150) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutusohjelma_ammpk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutusohjelma_ammpk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutusohjelma_ammpk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutusohjelma_ammpk_koodi] [nvarchar](4) NULL,
	[koulutusohjelma_ammpk] [nvarchar](100) NULL,
	[koulutusohjelma_ammpk_SV] [nvarchar](100) NULL,
	[koulutusohjelma_ammpk_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutusryhma]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutusryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutusryhma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutusryhma_koodi] [nvarchar](2) NULL,
	[koulutusryhma] [nvarchar](255) NULL,
	[koulutusryhma_SV] [nvarchar](255) NULL,
	[koulutusryhma_EN] [nvarchar](255) NULL,
	[koulutusryhma2] [nvarchar](255) NULL,
	[koulutusryhma2_SV] [nvarchar](255) NULL,
	[koulutusryhma2_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutussektori]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutussektori]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutussektori](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koulutussektori_koodi] [nvarchar](2) NOT NULL,
	[koulutussektori] [nvarchar](50) NULL,
	[koulutussektori_SV] [nvarchar](50) NULL,
	[koulutussektori_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_koulutustyyppi]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutustyyppi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_koulutustyyppi](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutustyyppi_koodi] [nvarchar](2) NULL,
	[koulutustyyppi] [nvarchar](50) NULL,
	[koulutustyyppi_SV] [nvarchar](50) NULL,
	[koulutustyyppi_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_kylla_ei]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_kylla_ei]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_kylla_ei](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[kylla_ei_koodi] [nchar](2) NULL,
	[kylla_ei] [nvarchar](20) NULL,
	[kylla_ei_SV] [nvarchar](20) NULL,
	[kylla_ei_EN] [nvarchar](20) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_lahde]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_lahde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_lahde](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[lahde_koodi] [nvarchar](10) NULL,
	[lahde] [nvarchar](250) NULL,
	[lahde_SV] [nvarchar](250) NULL,
	[lahde_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_lukiokoulutuksen_koulutuslaji]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_lukiokoulutuksen_koulutuslaji]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_lukiokoulutuksen_koulutuslaji](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[lukiokoulutuksen_koulutuslaji_koodi] [nvarchar](2) NULL,
	[lukiokoulutuksen_koulutuslaji] [nvarchar](100) NULL,
	[lukiokoulutuksen_koulutuslaji_SV] [nvarchar](100) NULL,
	[lukiokoulutuksen_koulutuslaji_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_lukion_ainevalinnat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_lukion_ainevalinnat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_lukion_ainevalinnat](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[avain_aine] [nvarchar](50) NULL,
	[avain_laajuus] [nvarchar](50) NULL,
	[aineryhmä_jarjestys] [nvarchar](50) NULL,
	[aineryhmä] [nvarchar](50) NULL,
	[aineryhmä_SV] [nvarchar](50) NULL,
	[aineryhmä_EN] [nvarchar](50) NULL,
	[aine_jarjestys] [nvarchar](50) NULL,
	[aine] [nvarchar](50) NULL,
	[aine_SV] [nvarchar](50) NULL,
	[aine_EN] [nvarchar](50) NULL,
	[laajuus_jarjestys] [nvarchar](50) NULL,
	[laajuus] [nvarchar](50) NULL,
	[laajuus_SV] [nvarchar](50) NULL,
	[laajuus_EN] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_lukion_kieltenmaara]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_lukion_kieltenmaara]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_lukion_kieltenmaara](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[kieltenmaara_koodi] [nvarchar](10) NULL,
	[kieltenmaara] [nvarchar](50) NULL,
	[kieltenmaara_SV] [nvarchar](50) NULL,
	[kieltenmaara_EN] [nvarchar](50) NULL,
	[kieltenmaara_jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_maahantulo_ja_opiskelun_aloittaminen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_maahantulo_ja_opiskelun_aloittaminen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_maahantulo_ja_opiskelun_aloittaminen](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[maahantulo_ja_opiskelun_aloittaminen_koodi] [nvarchar](2) NULL,
	[maahantulo_ja_opiskelun_aloittaminen] [nvarchar](255) NULL,
	[maahantulo_ja_opiskelun_aloittaminen_SV] [nvarchar](255) NULL,
	[maahantulo_ja_opiskelun_aloittaminen_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_maassaolo]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_maassaolo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_maassaolo](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[maassaolo_koodi] [nvarchar](10) NULL,
	[maassaolo] [nvarchar](60) NULL,
	[maassaolo_SV] [nvarchar](60) NULL,
	[maassaolo_EN] [nvarchar](60) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_mitenna_ammatti]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_mitenna_ammatti]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_mitenna_ammatti](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[mitenna_ammattiryhma1_koodi] [nvarchar](20) NULL,
	[mitenna_ammattiryhma1] [nvarchar](250) NULL,
	[mitenna_ammattiryhma1_SV] [nvarchar](250) NULL,
	[mitenna_ammattiryhma1_EN] [nvarchar](250) NULL,
	[mitenna_ammattiryhma2_koodi] [nvarchar](20) NULL,
	[mitenna_ammattiryhma2] [nvarchar](250) NULL,
	[mitenna_ammattiryhma2_SV] [nvarchar](250) NULL,
	[mitenna_ammattiryhma2_EN] [nvarchar](250) NULL,
	[mitenna_ammatti_koodi] [nvarchar](20) NULL,
	[mitenna_ammatti] [nvarchar](250) NULL,
	[mitenna_ammatti_SV] [nvarchar](250) NULL,
	[mitenna_ammatti_EN] [nvarchar](250) NULL,
	[jarjestys_ammattiryhma1] [nvarchar](50) NULL,
	[jarjestys_ammattiryhma2] [nvarchar](50) NULL,
	[jarjestys_ammatti] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_mitenna_toimiala]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_mitenna_toimiala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_mitenna_toimiala](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[mitenna_toimiala1_koodi] [nvarchar](20) NULL,
	[mitenna_toimiala1] [nvarchar](250) NULL,
	[mitenna_toimiala1_SV] [nvarchar](250) NULL,
	[mitenna_toimiala1_EN] [nvarchar](250) NULL,
	[mitenna_toimiala2_koodi] [nvarchar](20) NULL,
	[mitenna_toimiala2] [nvarchar](250) NULL,
	[mitenna_toimiala2_SV] [nvarchar](250) NULL,
	[mitenna_toimiala2_EN] [nvarchar](250) NULL,
	[tol_koodi] [nvarchar](20) NULL,
	[tol] [nvarchar](250) NULL,
	[tol_SV] [nvarchar](250) NULL,
	[tol_EN] [nvarchar](250) NULL,
	[jarjestys_mitenna_toimiala1] [nvarchar](50) NULL,
	[jarjestys_mitenna_toimiala2] [nvarchar](50) NULL,
	[jarjestys_tol] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_moninkertainen_haku]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_moninkertainen_haku]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_moninkertainen_haku](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[moninkertainen_haku_koodi] [nvarchar](2) NULL,
	[moninkertainen_haku] [nvarchar](250) NULL,
	[moninkertainen_haku_SV] [nvarchar](250) NULL,
	[moninkertainen_haku_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_nuorten_aikuisten_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_nuorten_aikuisten_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_nuorten_aikuisten_koulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[nuorten_aikuisten_koulutus_koodi] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](50) NULL,
	[nuorten_aikuisten_koulutus_SV] [nvarchar](50) NULL,
	[nuorten_aikuisten_koulutus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_nuorten_aikuisten_koulutus_amm]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_nuorten_aikuisten_koulutus_amm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_nuorten_aikuisten_koulutus_amm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[nuorten_aikuisten_koulutus_amm_koodi] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus_amm] [nvarchar](50) NULL,
	[nuorten_aikuisten_koulutus_amm_SV] [nvarchar](50) NULL,
	[nuorten_aikuisten_koulutus_amm_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tehtavatyyppi_koodi] [nvarchar](2) NULL,
	[tehtavatyyppi] [nvarchar](255) NULL,
	[tehtavatyyppi_SV] [nvarchar](255) NULL,
	[tehtavatyyppi_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajan_tehtavatyyppi_lukiokoulutuksessa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajan_tehtavatyyppi_lukiokoulutuksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajan_tehtavatyyppi_lukiokoulutuksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tehtavatyyppi_koodi] [nvarchar](2) NULL,
	[tehtavatyyppi] [nvarchar](255) NULL,
	[tehtavatyyppi_SV] [nvarchar](255) NULL,
	[tehtavatyyppi_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajan_tehtavatyyppi_perusopetuksessa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajan_tehtavatyyppi_perusopetuksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajan_tehtavatyyppi_perusopetuksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tehtavatyyppi_koodi] [nvarchar](2) NULL,
	[tehtavatyyppi] [nvarchar](255) NULL,
	[tehtavatyyppi_SV] [nvarchar](255) NULL,
	[tehtavatyyppi_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tehtavatyyppi_koodi] [nvarchar](2) NULL,
	[tehtavatyyppi] [nvarchar](255) NULL,
	[tehtavatyyppi_SV] [nvarchar](255) NULL,
	[tehtavatyyppi_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajankelpoisuus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajankelpoisuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajankelpoisuus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opettajankelpoisuus_koodi] [nvarchar](2) NULL,
	[opettajankelpoisuus] [nvarchar](50) NULL,
	[opettajankelpoisuus_SV] [nvarchar](50) NULL,
	[opettajankelpoisuus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajankelpoisuus2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajankelpoisuus2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajankelpoisuus2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[opettajankelpoisuus_koodi] [nvarchar](2) NULL,
	[opettajankelpoisuus] [nvarchar](50) NULL,
	[opettajankelpoisuus_SV] [nvarchar](50) NULL,
	[opettajankelpoisuus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajat_aine]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajat_aine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajat_aine](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aine_koodi] [nvarchar](2) NULL,
	[aine] [nvarchar](255) NULL,
	[aine_SV] [nvarchar](255) NULL,
	[aine_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajat_aine_2016]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajat_aine_2016]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajat_aine_2016](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aine_koodi] [nvarchar](2) NULL,
	[aine] [nvarchar](255) NULL,
	[aine_SV] [nvarchar](255) NULL,
	[aine_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajat_aine_2016_lukio]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajat_aine_2016_lukio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajat_aine_2016_lukio](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aine_koodi] [nvarchar](2) NULL,
	[aine] [nvarchar](255) NULL,
	[aine_SV] [nvarchar](255) NULL,
	[aine_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajat_aine_amm]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajat_aine_amm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajat_aine_amm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aine_koodi] [nvarchar](3) NULL,
	[aine] [nvarchar](255) NULL,
	[aine_SV] [nvarchar](255) NULL,
	[aine_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajat_aine_vst]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajat_aine_vst]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajat_aine_vst](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aine_koodi] [nvarchar](3) NULL,
	[aine] [nvarchar](255) NULL,
	[aine_SV] [nvarchar](255) NULL,
	[aine_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajat_koko_osa_aikainen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajat_koko_osa_aikainen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajat_koko_osa_aikainen](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koko_osa_aikainen_koodi] [nvarchar](2) NULL,
	[koko_osa_aikainen] [nvarchar](255) NULL,
	[koko_osa_aikainen_SV] [nvarchar](255) NULL,
	[koko_osa_aikainen_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajat_koulutusaste]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajat_koulutusaste]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajat_koulutusaste](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutusaste_koodi] [nvarchar](2) NULL,
	[koulutusaste] [nvarchar](255) NULL,
	[koulutusaste_SV] [nvarchar](255) NULL,
	[koulutusaste_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajat_koulutusaste_amm]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajat_koulutusaste_amm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajat_koulutusaste_amm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutusaste_koodi] [nvarchar](2) NULL,
	[koulutusaste] [nvarchar](255) NULL,
	[koulutusaste_SV] [nvarchar](255) NULL,
	[koulutusaste_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajat_luokka_aste]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajat_luokka_aste]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajat_luokka_aste](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[luokka_aste_koodi] [nvarchar](2) NULL,
	[luokka_aste] [nvarchar](255) NULL,
	[luokka_aste_SV] [nvarchar](255) NULL,
	[luokka_aste_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajat_osa_aikaisuuden_syy]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajat_osa_aikaisuuden_syy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajat_osa_aikaisuuden_syy](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[syy_koodi] [nvarchar](2) NULL,
	[syy] [nvarchar](255) NULL,
	[syy_SV] [nvarchar](255) NULL,
	[syy_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opettajat_tyosuhteen_luonne]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opettajat_tyosuhteen_luonne]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opettajat_tyosuhteen_luonne](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tyosuhteen_luonne_koodi] [nvarchar](2) NULL,
	[tyosuhteen_luonne] [nvarchar](255) NULL,
	[tyosuhteen_luonne_SV] [nvarchar](255) NULL,
	[tyosuhteen_luonne_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opetuksen_jarjestajan_tiedoantajatyyppi]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opetuksen_jarjestajan_tiedoantajatyyppi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opetuksen_jarjestajan_tiedoantajatyyppi](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tiedonantajatyyppi_koodi] [nvarchar](10) NULL,
	[tiedonantajatyyppi] [nvarchar](250) NULL,
	[tiedonantajatyyppi_SV] [nvarchar](250) NULL,
	[tiedonantajatyyppi_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opetushallinnon_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opetushallinnon_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opetushallinnon_koulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opetushallinnon_koulutus_koodi] [nvarchar](2) NULL,
	[opetushallinnon_koulutus] [nvarchar](50) NULL,
	[opetushallinnon_koulutus_SV] [nvarchar](100) NULL,
	[opetushallinnon_koulutus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opetushallinnon_koulutusala]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opetushallinnon_koulutusala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opetushallinnon_koulutusala](
	[id] [int] NULL,
	[luotu] [date] NULL,
	[koulutusala_koodi] [nvarchar](2) NULL,
	[koulutusala] [nvarchar](100) NULL,
	[koulutusala_SV] [nvarchar](100) NULL,
	[koulutusala_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolähde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opetuskieli]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opetuskieli]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opetuskieli](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[opetuskieli_koodi] [nchar](2) NULL,
	[opetuskieli] [nvarchar](50) NULL,
	[opetuskieli_SV] [nvarchar](50) NULL,
	[opetuskieli_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opetuskieli2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opetuskieli2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opetuskieli2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[opetuskieli_koodi] [nchar](2) NULL,
	[opetuskieli] [nvarchar](50) NULL,
	[opetuskieli_SV] [nvarchar](50) NULL,
	[opetuskieli_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](50) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_SV] [nvarchar](100) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opetustuntien_sisalto_ja_tavoiteluokitus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opetustuntien_sisalto_ja_tavoiteluokitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opetustuntien_sisalto_ja_tavoiteluokitus](
	[id] [int] NOT NULL,
	[Opetustuntikoodi] [varchar](10) NULL,
	[Koulutusala_lajittelu] [int] NULL,
	[Koulutusala] [varchar](150) NULL,
	[Koulutusala_SV] [varchar](150) NULL,
	[Koulutusala_EN] [varchar](150) NULL,
	[Opintoala_lajittelu] [int] NULL,
	[Opintoala] [varchar](150) NULL,
	[Opintoala_SV] [varchar](150) NULL,
	[Opintoala_EN] [varchar](150) NULL,
	[Koulutustyyppi_lajittelu] [int] NULL,
	[Koulutustyyppi] [varchar](150) NULL,
	[Koulutustyyppi_SV] [varchar](150) NULL,
	[Koulutustyyppi_EN] [varchar](150) NULL,
	[Opetustunti_lajittelu] [int] NULL,
	[Opetustunti] [varchar](150) NULL,
	[Opetustunti_SV] [varchar](150) NULL,
	[Opetustunti_EN] [varchar](150) NULL,
	[virhetilanne] [nchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opintoala2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opintoala2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opintoala2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintoala2002_koodi] [nvarchar](3) NULL,
	[opintoala2002] [nvarchar](250) NULL,
	[opintoala2002_SV] [nvarchar](250) NULL,
	[opintoala2002_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_4a] [nvarchar](10) NULL,
	[jarjestys_4b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN] [nvarchar](100) NULL,
	[jarjestys_4bb] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_2a] [nvarchar](10) NULL,
	[jarjestys_2b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan_versio2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_versio2_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_versio2] [nvarchar](100) NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_versio2_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_versio2_EN] [nvarchar](100) NULL,
	[jarjestys_2bb] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_koulutusasteen_2002_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opintojen_kulku_koulutusasteen_2002_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opintojen_kulku_koulutusasteen_2002_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutusasteen_2002_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutusasteen_2002_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_koulutusasteen_2002_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutusasteen_2002_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_1a] [nvarchar](10) NULL,
	[jarjestys_1b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_koulutussektorin_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opintojen_kulku_koulutussektorin_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opintojen_kulku_koulutussektorin_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutussektorin_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutussektorin_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_koulutussektorin_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutussektorin_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_7a] [nvarchar](10) NULL,
	[jarjestys_7b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_maakunnan_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opintojen_kulku_maakunnan_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opintojen_kulku_maakunnan_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_maakunnan_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_maakunnan_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_maakunnan_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_maakunnan_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_6a] [nvarchar](10) NULL,
	[jarjestys_6b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_opintoalan_2002_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opintojen_kulku_opintoalan_2002_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opintojen_kulku_opintoalan_2002_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_opintoala_2002_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_opintoala_2002_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_opintoala_2002_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_opintoala_2002_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_3a] [nvarchar](10) NULL,
	[jarjestys_3b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_opintoalan_2002_mukaan_versio2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opintojen_kulku_opintoalan_2002_mukaan_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opintojen_kulku_opintoalan_2002_mukaan_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_opintoala_2002_mukaan_versio2_koodi] [nchar](2) NULL,
	[opintojen_kulku_opintoala_2002_mukaan_versio2] [nvarchar](100) NULL,
	[opintojen_kulku_opintoala_2002_mukaan_versio2_SV] [nvarchar](100) NULL,
	[opintojen_kulku_opintoala_2002_mukaan_versio2_EN] [nvarchar](100) NULL,
	[jarjestys_3bb] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_oppilaitoksen_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opintojen_kulku_oppilaitoksen_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opintojen_kulku_oppilaitoksen_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_oppilaitoksen_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_5a] [nvarchar](10) NULL,
	[jarjestys_5b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_oppilaitoksen_mukaan_versio2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opintojen_kulku_oppilaitoksen_mukaan_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opintojen_kulku_oppilaitoksen_mukaan_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_versio2_koodi] [nchar](2) NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_versio2] [nvarchar](100) NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_versio2_SV] [nvarchar](100) NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_versio2_EN] [nvarchar](100) NULL,
	[jarjestys_5bb] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opiskelijan_aikaisempi_yleissivistava_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opiskelijan_aikaisempi_yleissivistava_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opiskelijan_aikaisempi_yleissivistava_koulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opiskelijan_aikaisempi_yleissivistava_koulutus_koodi] [nvarchar](10) NULL,
	[opiskelijan_aikaisempi_yleissivistava_koulutus] [nvarchar](250) NULL,
	[opiskelijan_aikaisempi_yleissivistava_koulutus_SV] [nvarchar](250) NULL,
	[opiskelijan_aikaisempi_yleissivistava_koulutus_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opiskelijan_fte_tieto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opiskelijan_fte_tieto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opiskelijan_fte_tieto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opiskelijan_fte_tieto_koodi] [nvarchar](2) NULL,
	[opiskelijan_fte_tieto] [nvarchar](50) NULL,
	[opiskelijan_fte_tieto_SV] [nvarchar](50) NULL,
	[opiskelijan_fte_tieto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opiskelijan_olo]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opiskelijan_olo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opiskelijan_olo](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opiskelijan_olo_koodi] [nvarchar](10) NULL,
	[opiskelijan_olo] [nvarchar](250) NULL,
	[opiskelijan_olo_SV] [nvarchar](250) NULL,
	[opiskelijan_olo_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opiskelijan_olo_tamm]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opiskelijan_olo_tamm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opiskelijan_olo_tamm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opiskelijan_olo_tamm_koodi] [nvarchar](10) NULL,
	[opiskelijan_olo_tamm] [nvarchar](250) NULL,
	[opiskelijan_olo_tamm_SV] [nvarchar](250) NULL,
	[opiskelijan_olo_tamm_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opiskelu_toiminta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opiskelu_toiminta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opiskelu_toiminta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[opiskelu_toiminta_koodi] [nvarchar](10) NULL,
	[opiskelu_toiminta] [nvarchar](250) NULL,
	[opiskelu_toiminta_SV] [nvarchar](250) NULL,
	[opiskelu_toiminta_EN] [nvarchar](250) NULL,
	[jarjestys_opiskelu_toiminta] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_opiskelumuoto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_opiskelumuoto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_opiskelumuoto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opiskelumuoto_koodi] [nvarchar](2) NULL,
	[opiskelumuoto] [nvarchar](50) NULL,
	[opiskelumuoto_SV] [nvarchar](50) NULL,
	[opiskelumuoto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_oppilaitos]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_oppilaitos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_oppilaitos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oppilaitos_avain] [nvarchar](10) NULL,
	[oppilaitoskoodi] [nvarchar](5) NOT NULL,
	[korvaavakoodi] [nvarchar](5) NULL,
	[alkaa] [datetime2](7) NULL,
	[paattyy] [datetime2](7) NULL,
	[viimeisin_tilv] [nvarchar](4) NOT NULL,
	[oppilaitosselite_FI] [nvarchar](255) NOT NULL,
	[oppilaitosselite_SV] [nvarchar](255) NOT NULL,
	[oppilaitosselite_EN] [nvarchar](255) NOT NULL,
	[sairaalakoulukoodi] [nvarchar](2) NOT NULL,
	[sairaalakouluselite_FI] [nvarchar](255) NOT NULL,
	[sairaalakouluselite_SV] [nvarchar](255) NOT NULL,
	[sairaalakouluselite_EN] [nvarchar](255) NOT NULL,
	[oppilaitostyyppikoodi] [nvarchar](2) NOT NULL,
	[oppilaitostyyppiselite_FI] [nvarchar](255) NOT NULL,
	[oppilaitostyyppiselite_SV] [nvarchar](255) NOT NULL,
	[oppilaitostyyppiselite_EN] [nvarchar](255) NOT NULL,
	[peruskoulujen_ryhmityskoodi] [nvarchar](2) NOT NULL,
	[peruskoulujen_ryhmitysselite_FI] [nvarchar](255) NOT NULL,
	[peruskoulujen_ryhmitysselite_SV] [nvarchar](255) NOT NULL,
	[peruskoulujen_ryhmitysselite_EN] [nvarchar](255) NOT NULL,
	[peruskoulujen_vuosilkskoodi] [nvarchar](2) NOT NULL,
	[peruskoulujen_vuosilksselite_FI] [nvarchar](255) NOT NULL,
	[peruskoulujen_vuosilksselite_SV] [nvarchar](255) NOT NULL,
	[peruskoulujen_vuosilksselite_EN] [nvarchar](255) NOT NULL,
	[omistajatyyppikoodi] [nvarchar](2) NOT NULL,
	[omistajatyyppiselite_FI] [nvarchar](255) NOT NULL,
	[omistajatyyppiselite_SV] [nvarchar](255) NOT NULL,
	[omistajatyyppiselite_EN] [nvarchar](255) NOT NULL,
	[opetuskielikoodi] [nvarchar](2) NOT NULL,
	[opetuskieliselite_FI] [nvarchar](255) NOT NULL,
	[opetuskieliselite_SV] [nvarchar](255) NOT NULL,
	[opetuskieliselite_EN] [nvarchar](255) NOT NULL,
	[koulutuksen_jarjestajakoodi] [nvarchar](9) NOT NULL,
	[koulutuksen_jarjestajaselite_FI] [nvarchar](255) NOT NULL,
	[koulutuksen_jarjestajaselite_SV] [nvarchar](255) NOT NULL,
	[koulutuksen_jarjestajaselite_EN] [nvarchar](255) NOT NULL,
	[sijaintikuntakoodi] [nvarchar](3) NOT NULL,
	[sijaintikuntaselite_FI] [nvarchar](255) NOT NULL,
	[sijaintikuntaselite_SV] [nvarchar](255) NOT NULL,
	[sijaintikuntaselite_EN] [nvarchar](255) NOT NULL,
	[koordinaatti_itakoodi] [nvarchar](10) NOT NULL,
	[koordinaatti_pohjoiskoodi] [nvarchar](10) NOT NULL,
	[postinumerokoodi] [nvarchar](5) NOT NULL,
	[SCD_alkaa] [datetime2](7) NULL,
	[SCD_paattyy] [datetime2](7) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[jarjestys_sairaalakoulu] [nvarchar](10) NULL,
	[jarjestys_oppilaitostyyppi] [nvarchar](10) NULL,
	[jarjestys_peruskoulujen_ryhmitys] [nvarchar](10) NULL,
	[jarjestys_peruskoulujen_vuosilks] [nvarchar](10) NULL,
	[jarjestys_omistajatyyppi] [nvarchar](10) NULL,
	[jarjestys_opetuskieli] [nvarchar](10) NULL,
	[jarjestys_koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[jarjestys_sijaintikunta] [nvarchar](10) NULL,
	[jarjestys_koordinaatti_ita] [nvarchar](10) NULL,
	[jarjestys_koordinaatti_pohjois] [nvarchar](10) NULL,
	[jarjestys_postinumero] [nvarchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_oppilaitostyyppi]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_oppilaitostyyppi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_oppilaitostyyppi](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[oppilaitostyyppi_koodi] [nchar](2) NULL,
	[oppilaitostyyppi] [nvarchar](150) NULL,
	[oppilaitostyyppi_SV] [nvarchar](150) NULL,
	[oppilaitostyyppi_EN] [nvarchar](150) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_oppisopimus_purkautunut]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_oppisopimus_purkautunut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_oppisopimus_purkautunut](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oppisopimus_purkautunut_koodi] [nvarchar](2) NULL,
	[oppisopimus_purkautunut] [nvarchar](50) NULL,
	[oppisopimus_purkautunut_SV] [nvarchar](50) NULL,
	[oppisopimus_purkautunut_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_oppisopimus_yrityksen_koko]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_oppisopimus_yrityksen_koko]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_oppisopimus_yrityksen_koko](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oppisopimus_yrityksen_koko_koodi] [nvarchar](2) NULL,
	[oppisopimus_yrityksen_koko] [nvarchar](50) NULL,
	[oppisopimus_yrityksen_koko_SV] [nvarchar](50) NULL,
	[oppisopimus_yrityksen_koko_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_oppisopimuskoulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_oppisopimuskoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_oppisopimuskoulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oppisopimuskoulutus_koodi] [nvarchar](2) NULL,
	[oppisopimuskoulutus] [nvarchar](50) NULL,
	[oppisopimuskoulutus_SV] [nvarchar](100) NULL,
	[oppisopimuskoulutus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oppis_osallis_ja_tutk_suor_koodi] [varchar](8) NULL,
	[oppis_osallis_ja_tutk_suor] [nvarchar](60) NULL,
	[oppis_osallis_ja_tutk_suor_SV] [nvarchar](60) NULL,
	[oppis_osallis_ja_tutk_suor_EN] [nvarchar](60) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_osatutkinto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_osatutkinto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_osatutkinto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[osatutkinto_koodi] [nvarchar](10) NULL,
	[osatutkinto] [nvarchar](50) NULL,
	[osatutkinto_SV] [nvarchar](50) NULL,
	[osatutkinto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_paaasiallinen_toiminta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_paaasiallinen_toiminta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_paaasiallinen_toiminta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[paaasiallinen_toiminta_koodi] [nvarchar](10) NULL,
	[paaasiallinen_toiminta] [nvarchar](250) NULL,
	[paaasiallinen_toiminta_SV] [nvarchar](250) NULL,
	[paaasiallinen_toiminta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_paaasiallinen_toiminta_ja_maasta_muuttaneet]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_paaasiallinen_toiminta_ja_maasta_muuttaneet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_paaasiallinen_toiminta_ja_maasta_muuttaneet](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet_koodi] [nvarchar](10) NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet] [nvarchar](250) NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet_SV] [nvarchar](250) NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_paaasiallinen_toiminta_okm]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_paaasiallinen_toiminta_okm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_paaasiallinen_toiminta_okm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[paaasiallinen_toiminta_okm_koodi] [nvarchar](10) NULL,
	[paaasiallinen_toiminta_okm] [nvarchar](250) NULL,
	[paaasiallinen_toiminta_okm_SV] [nvarchar](250) NULL,
	[paaasiallinen_toiminta_okm_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_paaasiallinen_toiminta_versio2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_paaasiallinen_toiminta_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_paaasiallinen_toiminta_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[paaasiallinen_toiminta_versio2_koodi] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio2] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio2_SV] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio2_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_paaasiallinen_toiminta_versio3]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_paaasiallinen_toiminta_versio3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_paaasiallinen_toiminta_versio3](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[paaasiallinen_toiminta_versio3_avain] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio3] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_SV] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_EN] [nvarchar](50) NULL,
	[jarjestys_paaasiallinen_toiminta_versio3] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_TTHV] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_TTHV_SV] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_TTHV_EN] [nvarchar](50) NULL,
	[jarjestys_paaasiallinen_toiminta_versio3_TTHV] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusjoukko]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusjoukko]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusjoukko](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusjoukko_avain] [nvarchar](10) NULL,
	[perusjoukko] [nvarchar](250) NULL,
	[perusjoukko_SV] [nvarchar](250) NULL,
	[perusjoukko_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusjoukko_tyolliset]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusjoukko_tyolliset]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusjoukko_tyolliset](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusjoukko_tyolliset_avain] [nvarchar](10) NULL,
	[perusjoukko_tyolliset] [nvarchar](250) NULL,
	[perusjoukko_tyolliset_SV] [nvarchar](250) NULL,
	[perusjoukko_tyolliset_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusopetuksen_ainevalinnat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusopetuksen_ainevalinnat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusopetuksen_ainevalinnat](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aineryhmä] [nvarchar](50) NULL,
	[aineryhmä_SV] [nvarchar](50) NULL,
	[aineryhmä_EN] [nvarchar](50) NULL,
	[aine_koodi] [nvarchar](10) NULL,
	[aine] [nvarchar](250) NULL,
	[aine_SV] [nvarchar](250) NULL,
	[aine_EN] [nvarchar](250) NULL,
	[kielen_taso_koodi] [nvarchar](10) NULL,
	[kielen_taso] [nvarchar](250) NULL,
	[kielen_taso_SV] [nvarchar](250) NULL,
	[kielen_taso_EN] [nvarchar](250) NULL,
	[ainevalinta] [nvarchar](250) NULL,
	[ainevalinta_SV] [nvarchar](250) NULL,
	[ainevalinta_EN] [nvarchar](250) NULL,
	[aineryhmä_jarjestys] [nvarchar](50) NULL,
	[aine_jarjestys] [nvarchar](50) NULL,
	[kielen_taso_jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusopetuksen_aloitusika]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusopetuksen_aloitusika]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusopetuksen_aloitusika](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_aloitusika_koodi] [nchar](10) NULL,
	[perusopetuksen_aloitusika] [nvarchar](50) NULL,
	[perusopetuksen_aloitusika_SV] [nvarchar](50) NULL,
	[perusopetuksen_aloitusika_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusopetuksen_erityisen_tuen_paatos]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusopetuksen_erityisen_tuen_paatos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusopetuksen_erityisen_tuen_paatos](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_erityisen_tuen_paatos_koodi] [nchar](2) NULL,
	[perusopetuksen_erityisen_tuen_paatos] [nvarchar](50) NULL,
	[perusopetuksen_erityisen_tuen_paatos_SV] [nvarchar](50) NULL,
	[perusopetuksen_erityisen_tuen_paatos_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusopetuksen_kieltenmaara]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusopetuksen_kieltenmaara]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusopetuksen_kieltenmaara](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kieltenmäärä_koodi] [nvarchar](10) NULL,
	[kieltenmäärä] [nvarchar](250) NULL,
	[kieltenmäärä_SV] [nvarchar](250) NULL,
	[kieltenmäärä_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusopetuksen_kuljetusetuus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusopetuksen_kuljetusetuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusopetuksen_kuljetusetuus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_kuljetusetuus_koodi] [nchar](2) NULL,
	[perusopetuksen_kuljetusetuus] [nvarchar](50) NULL,
	[perusopetuksen_kuljetusetuus_SV] [nvarchar](50) NULL,
	[perusopetuksen_kuljetusetuus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusopetuksen_majoitusetuus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusopetuksen_majoitusetuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusopetuksen_majoitusetuus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_majoitusetuus_koodi] [nchar](2) NULL,
	[perusopetuksen_majoitusetuus] [nvarchar](50) NULL,
	[perusopetuksen_majoitusetuus_SV] [nvarchar](50) NULL,
	[perusopetuksen_majoitusetuus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusopetuksen_oppimaaran_yksilollistaminen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusopetuksen_oppimaaran_yksilollistaminen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusopetuksen_oppimaaran_yksilollistaminen](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_oppimaaran_yksilollistaminen_koodi] [nchar](10) NULL,
	[perusopetuksen_oppimaaran_yksilollistaminen] [nvarchar](100) NULL,
	[perusopetuksen_oppimaaran_yksilollistaminen_SV] [nvarchar](100) NULL,
	[perusopetuksen_oppimaaran_yksilollistaminen_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusopetuksen_pidennetty_oppivelvollisuus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusopetuksen_pidennetty_oppivelvollisuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusopetuksen_pidennetty_oppivelvollisuus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_pidennetty_oppivelvollisuus_koodi] [nchar](2) NULL,
	[perusopetuksen_pidennetty_oppivelvollisuus] [nvarchar](50) NULL,
	[perusopetuksen_pidennetty_oppivelvollisuus_SV] [nvarchar](50) NULL,
	[perusopetuksen_pidennetty_oppivelvollisuus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusopetuksen_tehostettu_tuki]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusopetuksen_tehostettu_tuki]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusopetuksen_tehostettu_tuki](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_tehostettu_tuki_koodi] [nchar](10) NULL,
	[perusopetuksen_tehostettu_tuki] [nvarchar](50) NULL,
	[perusopetuksen_tehostettu_tuki_SV] [nvarchar](100) NULL,
	[perusopetuksen_tehostettu_tuki_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusopetuksen_tukimuoto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusopetuksen_tukimuoto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusopetuksen_tukimuoto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_tukimuoto_koodi] [nchar](10) NULL,
	[perusopetuksen_tukimuoto] [nvarchar](50) NULL,
	[perusopetuksen_tukimuoto_SV] [nvarchar](50) NULL,
	[perusopetuksen_tukimuoto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusopetuksen_vuosiluokat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusopetuksen_vuosiluokat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusopetuksen_vuosiluokat](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[vuosiluokka_koodi] [nvarchar](10) NULL,
	[vuosiluokka] [nvarchar](250) NULL,
	[vuosiluokka_SV] [nvarchar](250) NULL,
	[vuosiluokka_EN] [nvarchar](250) NULL,
	[luokkajako_12_36_7_89] [nvarchar](250) NULL,
	[luokkajako_12_36_7_89_SV] [nvarchar](250) NULL,
	[luokkajako_12_36_7_89_EN] [nvarchar](250) NULL,
	[luokkajako_16_79] [nvarchar](250) NULL,
	[luokkajako_16_79_SV] [nvarchar](250) NULL,
	[luokkajako_16_79_EN] [nvarchar](250) NULL,
	[luokkajako_16_710] [nvarchar](250) NULL,
	[luokkajako_16_710_SV] [nvarchar](250) NULL,
	[luokkajako_16_710_EN] [nvarchar](250) NULL,
	[luokkajako_0_19_10] [nvarchar](250) NULL,
	[luokkajako_0_19_10_SV] [nvarchar](250) NULL,
	[luokkajako_0_19_10_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[luokkajako_12_36_7_89_jarjestys] [nvarchar](50) NULL,
	[luokkajako_16_79_jarjestys] [nvarchar](50) NULL,
	[luokkajako_16_710_jarjestys] [nvarchar](50) NULL,
	[luokkajako_0_19_10_jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_perusopetuksen_yleisopetuksen_osuus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_perusopetuksen_yleisopetuksen_osuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_perusopetuksen_yleisopetuksen_osuus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_yleisopetuksen_osuus_koodi] [nchar](10) NULL,
	[perusopetuksen_yleisopetuksen_osuus] [nvarchar](100) NULL,
	[perusopetuksen_yleisopetuksen_osuus_SV] [nvarchar](100) NULL,
	[perusopetuksen_yleisopetuksen_osuus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_pohjakoulutuksen_tila]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_pohjakoulutuksen_tila]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_pohjakoulutuksen_tila](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[pohjakoulutuksen_tila_koodi] [nvarchar](10) NULL,
	[pohjakoulutuksen_tila] [nvarchar](250) NULL,
	[pohjakoulutuksen_tila_SV] [nvarchar](250) NULL,
	[pohjakoulutuksen_tila_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_pohjoismaa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_pohjoismaa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_pohjoismaa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[pohjoismaa_koodi] [nvarchar](2) NULL,
	[pohjoismaa] [nvarchar](50) NULL,
	[pohjoismaa_SV] [nvarchar](50) NULL,
	[pohjoismaa_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_rahoituslahde]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_rahoituslahde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_rahoituslahde](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[rahoituslahde_koodi] [nvarchar](10) NULL,
	[rahoituslahde] [nvarchar](250) NULL,
	[rahoituslahde_SV] [nvarchar](250) NULL,
	[rahoituslahde_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_rahoituslahde_amm]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_rahoituslahde_amm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_rahoituslahde_amm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[rahoituslahde_amm_koodi] [nvarchar](2) NULL,
	[rahoituslahde_amm] [nvarchar](100) NULL,
	[rahoituslahde_amm_SV] [nvarchar](100) NULL,
	[rahoituslahde_amm_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_sama_koulutusala]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_sama_koulutusala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_sama_koulutusala](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[sama_koulutusala_avain] [nvarchar](100) NULL,
	[sama_koulutusala] [nvarchar](100) NULL,
	[sama_koulutusala_SV] [nvarchar](100) NULL,
	[sama_koulutusala_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_sektoritutkimuslaitos]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_sektoritutkimuslaitos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_sektoritutkimuslaitos](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[sektoritutkimuslaitos_avain] [nvarchar](10) NULL,
	[sektoritutkimuslaitos_lyhenne] [nvarchar](20) NULL,
	[sektoritutkimuslaitos] [nvarchar](250) NULL,
	[sektoritutkimuslaitos_SV] [nvarchar](250) NULL,
	[sektoritutkimuslaitos_EN] [nvarchar](250) NULL,
	[jarjestys_sektoritutkimuslaitos] [nvarchar](50) NULL,
	[sektoritutkimuslaitos_lyhenne_historia] [nvarchar](20) NULL,
	[sektoritutkimuslaitos_historia] [nvarchar](250) NULL,
	[sektoritutkimuslaitos_historia_SV] [nvarchar](250) NULL,
	[sektoritutkimuslaitos_historia_EN] [nvarchar](250) NULL,
	[jarjestys_sektoritutkimuslaitos_historia] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_siirtyman_tarkastelusuunta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_siirtyman_tarkastelusuunta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_siirtyman_tarkastelusuunta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[siirtyman_tarkastelusuunta_avain] [nvarchar](10) NULL,
	[siirtyman_tarkastelusuunta] [nvarchar](250) NULL,
	[siirtyman_tarkastelusuunta_SV] [nvarchar](250) NULL,
	[siirtyman_tarkastelusuunta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_sosioekonominen_asema]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_sosioekonominen_asema]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_sosioekonominen_asema](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[sosioekonominen_asema_koodi] [nvarchar](10) NULL,
	[sosioekonominen_asema_ryhma] [nvarchar](250) NULL,
	[sosioekonominen_asema_ryhma_SV] [nvarchar](250) NULL,
	[sosioekonominen_asema_ryhma_EN] [nvarchar](250) NULL,
	[sosioekonominen_asema] [nvarchar](250) NULL,
	[sosioekonominen_asema_SV] [nvarchar](250) NULL,
	[sosioekonominen_asema_EN] [nvarchar](250) NULL,
	[jarjestys_ryhma] [nvarchar](50) NULL,
	[jarjestys_asema] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_suhteellinen_ajankohta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_suhteellinen_ajankohta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_suhteellinen_ajankohta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[suhteellinen_ajankohta_avain] [nvarchar](10) NULL,
	[suhteellinen_ajankohta] [nvarchar](250) NULL,
	[suhteellinen_ajankohta_SV] [nvarchar](250) NULL,
	[suhteellinen_ajankohta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_sukupuoli]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_sukupuoli]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_sukupuoli](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[sukupuoli_koodi] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](50) NULL,
	[sukupuoli_SV] [nvarchar](50) NULL,
	[sukupuoli_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_suoritettu_tutkinto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_suoritettu_tutkinto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_suoritettu_tutkinto](
	[id] [int] NULL,
	[luotu] [date] NULL,
	[suoritettu_tutkinto_koodi] [nvarchar](2) NULL,
	[suoritettu_tutkinto] [nvarchar](100) NULL,
	[suoritettu_tutkinto_SV] [nvarchar](100) NULL,
	[suoritettu_tutkinto_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolähde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_suorlk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_suorlk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_suorlk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[suorlk_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_suuntautumisvaihtoehto_amk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_suuntautumisvaihtoehto_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_suuntautumisvaihtoehto_amk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[suuntautumisvaihtoehto_amk_koodi] [varchar](5) NULL,
	[suuntautumisvaihtoehto_amk] [nvarchar](100) NULL,
	[suuntautumisvaihtoehto_amk_SV] [nvarchar](100) NULL,
	[suuntautumisvaihtoehto_amk_EN] [nvarchar](100) NULL,
	[jarjestys] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tarkastelujakso]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tarkastelujakso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tarkastelujakso](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[tarkastelujakso_koodi] [nvarchar](20) NOT NULL,
	[tarkastelujakso] [nvarchar](100) NULL,
	[tarkastelujakso_SV] [nvarchar](100) NULL,
	[tarkastelujakso_EN] [nvarchar](100) NULL,
	[jaksovuosi] [int] NULL,
	[jaksokausi] [int] NULL,
	[jarjestys] [nvarchar](100) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
	[sijoittuminen 0_5 - 5_0 vuotta] [nvarchar](100) NULL,
	[sijoittuminen 1_0 - 5_5 vuotta] [nvarchar](100) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tiedekunta_yo]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tiedekunta_yo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tiedekunta_yo](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tiedekunta_yo_koodi] [nvarchar](2) NULL,
	[tiedekunta_yo] [nvarchar](50) NULL,
	[tiedekunta_yo_SV] [nvarchar](50) NULL,
	[tiedekunta_yo_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tieteenala]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tieteenala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tieteenala](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tieteenala_avain] [nvarchar](10) NULL,
	[tieteenala2007] [nvarchar](100) NULL,
	[tieteenala2007_SV] [nvarchar](100) NULL,
	[tieteenala2007_EN] [nvarchar](100) NULL,
	[jarjestys_tieteenala2007] [nvarchar](50) NULL,
	[tieteenala2010] [nvarchar](100) NULL,
	[tieteenala2010_SV] [nvarchar](100) NULL,
	[tieteenala2010_EN] [nvarchar](100) NULL,
	[jarjestys_tieteenala2010] [nvarchar](50) NULL,
	[paatieteenala2007] [nvarchar](100) NULL,
	[paatieteenala2007_SV] [nvarchar](100) NULL,
	[paatieteenala2007_EN] [nvarchar](100) NULL,
	[jarjestys_paatieteenala2007] [nvarchar](50) NULL,
	[paatieteenala2010] [nvarchar](100) NULL,
	[paatieteenala2010_SV] [nvarchar](100) NULL,
	[paatieteenala2010_EN] [nvarchar](100) NULL,
	[jarjestys_paatieteenala2010] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tietojen_ajankohta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tietojen_ajankohta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tietojen_ajankohta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tietojen_ajankohta_koodi] [nvarchar](10) NULL,
	[tietojen_ajankohta] [nvarchar](250) NULL,
	[tietojen_ajankohta_SV] [nvarchar](250) NULL,
	[tietojen_ajankohta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tilauskoulutuksen_sijaintimaa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tilauskoulutuksen_sijaintimaa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tilauskoulutuksen_sijaintimaa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tilauskoulutuksen_sijaintimaa_koodi] [nvarchar](2) NULL,
	[tilauskoulutuksen_sijaintimaa] [nvarchar](50) NULL,
	[tilauskoulutuksen_sijaintimaa_SV] [nvarchar](50) NULL,
	[tilauskoulutuksen_sijaintimaa_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_todistus_oppisopimuskoulutuksen_suorittamisesta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_todistus_oppisopimuskoulutuksen_suorittamisesta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_todistus_oppisopimuskoulutuksen_suorittamisesta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta_koodi] [nvarchar](2) NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta] [nvarchar](50) NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta_SV] [nvarchar](50) NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_toimiala_2008]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_toimiala_2008]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_toimiala_2008](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[toimiala_2008_avain] [nvarchar](10) NULL,
	[toimiala_2008_koodi] [nvarchar](5) NULL,
	[toimiala_2008] [nvarchar](150) NULL,
	[toimiala_2008_SV] [nvarchar](150) NULL,
	[toimiala_2008_EN] [nvarchar](150) NULL,
	[taso] [varchar](1) NULL,
	[taso1] [varchar](1) NULL,
	[jarjestys] [smallint] NULL,
	[jarjestys_taso] [smallint] NULL,
	[jarjestys_taso1] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_toimiala_tk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_toimiala_tk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_toimiala_tk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tol2008] [nvarchar](20) NULL,
	[toimiala1] [nvarchar](250) NULL,
	[toimiala1_SV] [nvarchar](250) NULL,
	[toimiala1_EN] [nvarchar](250) NULL,
	[toimiala2_koodi] [nvarchar](20) NULL,
	[toimiala2] [nvarchar](250) NULL,
	[toimiala2_SV] [nvarchar](250) NULL,
	[toimiala2_EN] [nvarchar](250) NULL,
	[toimiala3_koodi] [nvarchar](20) NULL,
	[toimiala3] [nvarchar](250) NULL,
	[toimiala3_SV] [nvarchar](250) NULL,
	[toimiala3_EN] [nvarchar](250) NULL,
	[toimiala4_koodi] [nvarchar](20) NULL,
	[toimiala4] [nvarchar](250) NULL,
	[toimiala4_SV] [nvarchar](250) NULL,
	[toimiala4_EN] [nvarchar](250) NULL,
	[toimiala5_koodi] [nvarchar](20) NULL,
	[toimiala5] [nvarchar](250) NULL,
	[toimiala5_SV] [nvarchar](250) NULL,
	[toimiala5_EN] [nvarchar](250) NULL,
	[toimiala6_koodi] [nvarchar](20) NULL,
	[toimiala6] [nvarchar](250) NULL,
	[toimiala6_SV] [nvarchar](250) NULL,
	[toimiala6_EN] [nvarchar](250) NULL,
	[jarjestys_toimiala1] [nvarchar](50) NULL,
	[jarjestys_toimiala2] [nvarchar](50) NULL,
	[jarjestys_toimiala3] [nvarchar](50) NULL,
	[jarjestys_toimiala4] [nvarchar](50) NULL,
	[jarjestys_toimiala5] [nvarchar](50) NULL,
	[jarjestys_toimiala6] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_toimiala_tthv]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_toimiala_tthv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_toimiala_tthv](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[toimiala_tthv_avain] [nvarchar](2) NULL,
	[toimiala_tthv] [nvarchar](255) NULL,
	[toimiala_tthv_SV] [nvarchar](255) NULL,
	[toimiala_tthv_EN] [nvarchar](255) NULL,
	[toimiala_ja_tol_tthv] [nvarchar](255) NULL,
	[toimiala_ja_tol_tthv_SV] [nvarchar](255) NULL,
	[toimiala_ja_tol_tthv_EN] [nvarchar](255) NULL,
	[jarjestys_toimiala_tthv] [smallint] NULL,
	[paatoimiala_tthv] [nvarchar](255) NULL,
	[paatoimiala_tthv_SV] [nvarchar](255) NULL,
	[paatoimiala_tthv_EN] [nvarchar](255) NULL,
	[jarjestys_paatoimiala_tthv] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_toimiala_tthv1_sama_kuin_ed_vuonna]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_toimiala_tthv1_sama_kuin_ed_vuonna]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_toimiala_tthv1_sama_kuin_ed_vuonna](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[toimiala_tthv1_sama_kuin_ed_vuonna_koodi] [nvarchar](2) NULL,
	[toimiala_tthv1_sama_kuin_ed_vuonna] [nvarchar](100) NULL,
	[toimiala_tthv1_sama_kuin_ed_vuonna_SV] [nvarchar](100) NULL,
	[toimiala_tthv1_sama_kuin_ed_vuonna_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_toimiala_tthv2_sama_kuin_ed_vuonna]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_toimiala_tthv2_sama_kuin_ed_vuonna]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_toimiala_tthv2_sama_kuin_ed_vuonna](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[toimiala_tthv2_sama_kuin_ed_vuonna_koodi] [nvarchar](2) NULL,
	[toimiala_tthv2_sama_kuin_ed_vuonna] [nvarchar](100) NULL,
	[toimiala_tthv2_sama_kuin_ed_vuonna_SV] [nvarchar](100) NULL,
	[toimiala_tthv2_sama_kuin_ed_vuonna_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tulodesiili]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tulodesiili]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tulodesiili](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tulodesiili_koodi] [nvarchar](2) NULL,
	[tulodesiili] [nvarchar](100) NULL,
	[tulodesiili_SV] [nvarchar](100) NULL,
	[tulodesiili_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkimuksen_rahoituslahde]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkimuksen_rahoituslahde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkimuksen_rahoituslahde](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[rahoituslahde_avain] [nvarchar](10) NULL,
	[rahoituslahdetarkennus] [nvarchar](50) NULL,
	[rahoituslahdetarkennus_SV] [nvarchar](100) NULL,
	[rahoituslahdetarkennus_EN] [nvarchar](100) NULL,
	[jarjestys_rahoituslahdetarkennus] [nvarchar](50) NULL,
	[rahoituslahde] [nvarchar](50) NULL,
	[rahoituslahde_SV] [nvarchar](100) NULL,
	[rahoituslahde_EN] [nvarchar](100) NULL,
	[jarjestys_rahoituslahde] [nvarchar](50) NULL,
	[ulkopuolisen_rahoituksen_kansainvalisyys] [nvarchar](50) NULL,
	[ulkopuolisen_rahoituksen_kansainvalisyys_SV] [nvarchar](100) NULL,
	[ulkopuolisen_rahoituksen_kansainvalisyys_EN] [nvarchar](100) NULL,
	[jarjestys_ulkopuolisen_rahoituksen_kansainvalisyys] [nvarchar](50) NULL,
	[rahoituslahteen_tyyppi] [nvarchar](50) NULL,
	[rahoituslahteen_tyyppi_SV] [nvarchar](100) NULL,
	[rahoituslahteen_tyyppi_EN] [nvarchar](100) NULL,
	[jarjestys_rahoituslahteen_tyyppi] [nvarchar](50) NULL,
	[rahoituksen_laatu] [nvarchar](50) NULL,
	[rahoituksen_laatu_SV] [nvarchar](100) NULL,
	[rahoituksen_laatu_EN] [nvarchar](100) NULL,
	[jarjestys_rahoituksen_laatu] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkimus_tehtava]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkimus_tehtava]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkimus_tehtava](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tutkimus_tehtava_avain] [nvarchar](10) NULL,
	[tutkimus_tehtava] [nvarchar](250) NULL,
	[tutkimus_tehtava_SV] [nvarchar](250) NULL,
	[tutkimus_tehtava_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkimusmenojen_kohde]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkimusmenojen_kohde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkimusmenojen_kohde](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[menokohde_avain] [nvarchar](10) NULL,
	[menokohde] [nvarchar](50) NULL,
	[menokohde_SV] [nvarchar](50) NULL,
	[menokohde_EN] [nvarchar](50) NULL,
	[jarjestys_menokohde] [nvarchar](50) NULL,
	[menotyyppi] [nvarchar](50) NULL,
	[menotyyppi_SV] [nvarchar](50) NULL,
	[menotyyppi_EN] [nvarchar](50) NULL,
	[jarjestys_menotyyppi] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinnon_tavoite]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinnon_tavoite]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinnon_tavoite](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinnon_tavoite_koodi] [nvarchar](2) NULL,
	[tutkinnon_tavoite] [nvarchar](50) NULL,
	[tutkinnon_tavoite_SV] [nvarchar](50) NULL,
	[tutkinnon_tavoite_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinnon_toteuma]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinnon_toteuma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinnon_toteuma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinnon_toteuma_koodi] [nvarchar](2) NULL,
	[tutkinnon_toteuma] [nvarchar](100) NULL,
	[tutkinnon_toteuma_SV] [nvarchar](100) NULL,
	[tutkinnon_toteuma_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_avain] [nvarchar](10) NULL,
	[tutkinto] [nvarchar](250) NULL,
	[tutkinto_SV] [nvarchar](250) NULL,
	[tutkinto_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_koulutuksen_jarjestajalla_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_koulutuksen_jarjestajalla] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutuksen_jarjestajalla_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutuksen_jarjestajalla_EN] [nvarchar](100) NULL,
	[jarjestys_4c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_koulutusalalla_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_alkuperaisella_koulutusalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_alkuperaisella_koulutusalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_koulutusalalla_2002_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_koulutusalalla_2002] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutusalalla_2002_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutusalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_2c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_koulutusasteella_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_alkuperaisella_koulutusasteella_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_alkuperaisella_koulutusasteella_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_koulutusasteella_2002_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_koulutusasteella_2002] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutusasteella_2002_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutusasteella_2002_EN] [nvarchar](100) NULL,
	[jarjestys_1c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_koulutussektorilla]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_alkuperaisella_koulutussektorilla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_alkuperaisella_koulutussektorilla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_koulutussektorilla_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_koulutussektroilla] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutussektorilla_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutussektorilla_EN] [nvarchar](100) NULL,
	[jarjestys_7c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_opintoalalla_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_alkuperaisella_opintoalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_alkuperaisella_opintoalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_opintoalalla_2002_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_opintoalalla_2002] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_opintoalalla_2002_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_opintoalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_3c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisessa_maakunnassa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_alkuperaisessa_maakunnassa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_alkuperaisessa_maakunnassa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisessa_maakunnassa_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisessa_maakunnassa] [nvarchar](100) NULL,
	[tutkinto_alkuperaisessa_maakunnassa_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisessa_maakunnassa_EN] [nvarchar](100) NULL,
	[jarjestys_6c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisessa_oppilaitoksessa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_alkuperaisessa_oppilaitoksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_alkuperaisessa_oppilaitoksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisessa_oppilaitoksessa_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisessa_oppilaitoksessa] [nvarchar](100) NULL,
	[tutkinto_alkuperaisessa_oppilaitoksessa_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisessa_oppilaitoksessa_EN] [nvarchar](100) NULL,
	[jarjestys_5c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_amk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_amk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_amk_koodi] [nvarchar](3) NULL,
	[tutkinto_amk] [nvarchar](100) NULL,
	[tutkinto_amk_SV] [nvarchar](100) NULL,
	[tutkinto_amk_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_koulutuksen_jarjestajalla]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_muulla_koulutuksen_jarjestajalla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_muulla_koulutuksen_jarjestajalla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_koulutuksen_jarjestajalla_koodi] [nchar](2) NULL,
	[tutkinto_muulla_koulutuksen_jarjestajalla] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutuksen_jarjestajalla_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutuksen_jarjestajalla_EN] [nvarchar](100) NULL,
	[jarjestys_4d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_koulutusalalla_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_muulla_koulutusalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_muulla_koulutusalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_koulutusalalla_2002_koodi] [nchar](2) NULL,
	[tutkinto_muulla_koulutusalalla_2002] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutusalalla_2002_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutusalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_2d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_koulutusasteella_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_muulla_koulutusasteella_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_muulla_koulutusasteella_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_koulutusasteella_2002_koodi] [nchar](2) NULL,
	[tutkinto_muulla_koulutusasteella_2002] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutusasteella_2002_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutusasteella_2002_EN] [nvarchar](100) NULL,
	[jarjestys_1d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_koulutussektorilla]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_muulla_koulutussektorilla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_muulla_koulutussektorilla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_koulutussektorilla_koodi] [nchar](2) NULL,
	[tutkinto_muulla_koulutussektroilla] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutussektorilla_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutussektorilla_EN] [nvarchar](100) NULL,
	[jarjestys_7d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_opintoalalla_2002]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_muulla_opintoalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_muulla_opintoalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_opintoalalla_2002_koodi] [nchar](2) NULL,
	[tutkinto_muulla_opintoalalla_2002] [nvarchar](100) NULL,
	[tutkinto_muulla_opintoalalla_2002_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_opintoalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_3d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_muussa_maakunnassa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_muussa_maakunnassa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_muussa_maakunnassa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muussa_maakunnassa_koodi] [nchar](2) NULL,
	[tutkinto_muussa_maakunnassa] [nvarchar](100) NULL,
	[tutkinto_muussa_maakunnassa_SV] [nvarchar](100) NULL,
	[tutkinto_muussa_maakunnassa_EN] [nvarchar](100) NULL,
	[jarjestys_6d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_muussa_oppilaitoksessa]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_muussa_oppilaitoksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_muussa_oppilaitoksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muussa_oppilaitoksessa_koodi] [nchar](2) NULL,
	[tutkinto_muussa_oppilaitoksessa] [nvarchar](100) NULL,
	[tutkinto_muussa_oppilaitoksessa_SV] [nvarchar](100) NULL,
	[tutkinto_muussa_oppilaitoksessa_EN] [nvarchar](100) NULL,
	[jarjestys_5d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_suoritettu]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_suoritettu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_suoritettu](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[tutkinto_suoritettu_avain] [nvarchar](20) NULL,
	[tutkinto_suoritettu] [nvarchar](100) NULL,
	[tutkinto_suoritettu_SV] [nvarchar](100) NULL,
	[tutkinto_suoritettu_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkinto_yo]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkinto_yo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkinto_yo](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_yo_koodi] [nvarchar](3) NULL,
	[tutkinto_yo] [nvarchar](50) NULL,
	[tutkinto_yo_SV] [nvarchar](100) NULL,
	[tutkinto_yo_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkintoasetus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkintoasetus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkintoasetus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkintoasetus_koodi] [nvarchar](10) NULL,
	[tutkintoasetus] [nvarchar](100) NULL,
	[tutkintoasetus_SV] [nvarchar](100) NULL,
	[tutkintoasetus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkintojen_maara]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkintojen_maara]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkintojen_maara](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[tutkintojen_maara_avain] [nvarchar](20) NULL,
	[tutkintojen_maara] [nvarchar](100) NULL,
	[tutkintojen_maara_SV] [nvarchar](100) NULL,
	[tutkintojen_maara_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkintolaji_tyollistymiseen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkintolaji_tyollistymiseen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkintolaji_tyollistymiseen](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkintolaji_tyollistymiseen_koodi] [nvarchar](2) NULL,
	[tutkintolaji_tyollistymiseen] [nvarchar](350) NULL,
	[tutkintolaji_tyollistymiseen_SV] [nvarchar](350) NULL,
	[tutkintolaji_tyollistymiseen_EN] [nvarchar](350) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkintonimike_ammpk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkintonimike_ammpk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkintonimike_ammpk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkintonimike_ammpk_koodi] [nvarchar](5) NULL,
	[tutkintonimike_ammpk] [nvarchar](50) NULL,
	[tutkintonimike_ammpk_SV] [nvarchar](50) NULL,
	[tutkintonimike_ammpk_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkintoryhma]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkintoryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkintoryhma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkintoryhma_koodi] [nvarchar](10) NULL,
	[tutkintoryhma] [nvarchar](100) NULL,
	[tutkintoryhma_SV] [nvarchar](100) NULL,
	[tutkintoryhma_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tutkintotaso]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tutkintotaso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tutkintotaso](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tutkintotaso_koodi] [nvarchar](10) NULL,
	[tutkintotaso] [nvarchar](100) NULL,
	[tutkintotaso_SV] [nvarchar](100) NULL,
	[tutkintotaso_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[tutkintotaso_tk_henkilokunta] [nvarchar](100) NULL,
	[tutkintotaso_tk_henkilokunta_SV] [nvarchar](100) NULL,
	[tutkintotaso_tk_henkilokunta_EN] [nvarchar](100) NULL,
	[jarjestys_tk_henkilokunta] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tyonantajasektori]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tyonantajasektori]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tyonantajasektori](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tyonantajasektori_koodi] [nvarchar](10) NOT NULL,
	[tyonantajasektori] [nvarchar](250) NULL,
	[tyonantajasektori_SV] [nvarchar](250) NULL,
	[tyonantajasektori_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tyonantajasektori_sama_kuin_ed_vuonna]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tyonantajasektori_sama_kuin_ed_vuonna]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tyonantajasektori_sama_kuin_ed_vuonna](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tyonantajasektori_sama_kuin_ed_vuonna_koodi] [nvarchar](2) NULL,
	[tyonantajasektori_sama_kuin_ed_vuonna] [nvarchar](100) NULL,
	[tyonantajasektori_sama_kuin_ed_vuonna_SV] [nvarchar](100) NULL,
	[tyonantajasektori_sama_kuin_ed_vuonna_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tyonantajasektori2]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tyonantajasektori2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tyonantajasektori2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tyonantajasektori2_avain] [nvarchar](2) NULL,
	[tyonantajasektori2] [nvarchar](255) NULL,
	[tyonantajasektori2_SV] [nvarchar](255) NULL,
	[tyonantajasektori2_EN] [nvarchar](255) NULL,
	[jarjestys] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tyopaikan_sijainti_v_tilastovuonna]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tyopaikan_sijainti_v_tilastovuonna]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tyopaikan_sijainti_v_tilastovuonna](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tyopaikan_sijainti_v_tilastovuonna_avain] [nvarchar](10) NULL,
	[tyopaikan_sijainti_v_tilastovuonna] [nvarchar](250) NULL,
	[tyopaikan_sijainti_v_tilastovuonna_SV] [nvarchar](250) NULL,
	[tyopaikan_sijainti_v_tilastovuonna_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tyossakayntitilaston_tyonantajasektori]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tyossakayntitilaston_tyonantajasektori]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tyossakayntitilaston_tyonantajasektori](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tyossakayntitilaston_tyonantajasektori_koodi] [nvarchar](10) NULL,
	[tyossakayntitilaston_tyonantajasektori] [nvarchar](50) NULL,
	[tyossakayntitilaston_tyonantajasektori_SV] [nvarchar](50) NULL,
	[tyossakayntitilaston_tyonantajasektori_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tyovoimapoliittinen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tyovoimapoliittinen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tyovoimapoliittinen](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[tyovoimapoliittinen_koodi] [nvarchar](2) NOT NULL,
	[tyovoimapoliittinen] [nvarchar](50) NULL,
	[tyovoimapoliittinen_SV] [nvarchar](50) NULL,
	[tyovoimapoliittinen_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_tyovoimapoliittinen_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tyovoimapoliittinen_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tyovoimapoliittinen_koulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tyovoimapoliittinen_koulutus_koodi] [nvarchar](2) NULL,
	[tyovoimapoliittinen_koulutus] [nvarchar](50) NULL,
	[tyovoimapoliittinen_koulutus_SV] [nvarchar](50) NULL,
	[tyovoimapoliittinen_koulutus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_uusi_vanha_opiskelija]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_uusi_vanha_opiskelija]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_uusi_vanha_opiskelija](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[uusi_vanha_opiskelija_koodi] [nvarchar](2) NULL,
	[uusi_vanha_opiskelija] [nvarchar](100) NULL,
	[uusi_vanha_opiskelija_SV] [nvarchar](100) NULL,
	[uusi_vanha_opiskelija_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_vahintaan_45_op_suorittanut]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_vahintaan_45_op_suorittanut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_vahintaan_45_op_suorittanut](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[vahintaan_45_op_suorittanut_koodi] [varchar](2) NULL,
	[vahintaan_45_op_suorittanut] [nvarchar](50) NULL,
	[vahintaan_45_op_suorittanut_SV] [nvarchar](50) NULL,
	[vahintaan_45_op_suorittanut_EN] [nvarchar](50) NULL,
	[jarjestys] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_vahintaan_55_op_suorittanut]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_vahintaan_55_op_suorittanut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_vahintaan_55_op_suorittanut](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[vahintaan_55_op_suorittanut_koodi] [varchar](2) NULL,
	[vahintaan_55_op_suorittanut] [nvarchar](50) NULL,
	[vahintaan_55_op_suorittanut_SV] [nvarchar](50) NULL,
	[vahintaan_55_op_suorittanut_EN] [nvarchar](50) NULL,
	[jarjestys] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_valiaikainen_amk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_valiaikainen_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_valiaikainen_amk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[valiaikainen_amk_koodi] [nvarchar](2) NULL,
	[valiaikainen_amk] [nvarchar](70) NULL,
	[valiaikainen_amk_SV] [nvarchar](70) NULL,
	[valiaikainen_amk_EN] [nvarchar](70) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_valtio]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_valtio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_valtio](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[valtio_avain] [nvarchar](10) NULL,
	[maa_koodi] [nvarchar](3) NULL,
	[maa] [nvarchar](100) NULL,
	[maa_SV] [nvarchar](100) NULL,
	[maa_EN] [nvarchar](100) NULL,
	[eumaa_koodi] [nvarchar](2) NULL,
	[eumaa] [nvarchar](50) NULL,
	[eumaa_SV] [nvarchar](50) NULL,
	[eumaa_EN] [nvarchar](50) NULL,
	[etamaa_koodi] [nvarchar](2) NULL,
	[etamaa] [nvarchar](50) NULL,
	[etamaa_SV] [nvarchar](50) NULL,
	[etamaa_EN] [nvarchar](50) NULL,
	[maanosa_koodi] [nvarchar](2) NULL,
	[maanosa] [nvarchar](50) NULL,
	[maanosa_SV] [nvarchar](50) NULL,
	[maanosa_EN] [nvarchar](50) NULL,
	[maanosa2_koodi] [nvarchar](2) NULL,
	[maanosa2] [nvarchar](50) NULL,
	[maanosa2_SV] [nvarchar](50) NULL,
	[maanosa2_EN] [nvarchar](50) NULL,
	[maanosa3_koodi] [nvarchar](3) NULL,
	[maanosa3] [nvarchar](50) NULL,
	[maanosa3_SV] [nvarchar](50) NULL,
	[maanosa3_EN] [nvarchar](50) NULL,
	[jarjestys] [smallint] NULL,
	[jarjestys_eumaa] [smallint] NULL,
	[jarjestys_etamaa] [smallint] NULL,
	[jarjestys_maanosa] [smallint] NULL,
	[jarjestys_maanosa2] [smallint] NULL,
	[jarjestys_maanosa3] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_vayla_nayttotutkintoon]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_vayla_nayttotutkintoon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_vayla_nayttotutkintoon](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[vayla_nayttotutkintoon_koodi] [nvarchar](2) NULL,
	[vayla_nayttotutkintoon] [nvarchar](70) NULL,
	[vayla_nayttotutkintoon_SV] [nvarchar](70) NULL,
	[vayla_nayttotutkintoon_EN] [nvarchar](70) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_vieraskielisyys]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_vieraskielisyys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_vieraskielisyys](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[vieraskielisyys_koodi] [nchar](2) NULL,
	[vieraskielisyys] [nvarchar](100) NULL,
	[vieraskielisyys_SV] [nvarchar](100) NULL,
	[vieraskielisyys_EN] [nvarchar](100) NULL,
	[vieraskielisyys_lyhyt] [nvarchar](50) NULL,
	[vieraskielisyys_lyhyt_SV] [nvarchar](50) NULL,
	[vieraskielisyys_lyhyt_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_virkaryhma]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_virkaryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_virkaryhma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[virkaryhma_koodi] [nvarchar](10) NULL,
	[virkaryhma] [nvarchar](50) NULL,
	[virkaryhma_SV] [nvarchar](50) NULL,
	[virkaryhma_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_yliopisto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_yliopisto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_yliopisto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[yliopisto_koodi] [nvarchar](2) NULL,
	[yliopisto] [nvarchar](50) NULL,
	[yliopisto_SV] [nvarchar](50) NULL,
	[yliopisto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_yllapitajan_kieli]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_yllapitajan_kieli]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_yllapitajan_kieli](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[yllapitajan_kieli_koodi] [nchar](2) NULL,
	[yllapitajan_kieli] [nvarchar](50) NULL,
	[yllapitajan_kieli_SV] [nvarchar](50) NULL,
	[yllapitajan_kieli_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_yosairaala]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_yosairaala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_yosairaala](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[yosairaala_avain] [nvarchar](10) NULL,
	[yosairaala_lyhenne] [nvarchar](20) NULL,
	[yosairaala] [nvarchar](250) NULL,
	[yosairaala_SV] [nvarchar](250) NULL,
	[yosairaala_EN] [nvarchar](250) NULL,
	[jarjestys_yosairaala] [nvarchar](50) NULL,
	[yosairaala_lyhenne_historia] [nvarchar](20) NULL,
	[yosairaala_historia] [nvarchar](250) NULL,
	[yosairaala_historia_SV] [nvarchar](250) NULL,
	[yosairaala_historia_EN] [nvarchar](250) NULL,
	[jarjestys_yosairaala_historia] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_yrittajan_oppisopimuskoulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_yrittajan_oppisopimuskoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_yrittajan_oppisopimuskoulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[yrittajan_oppisopimuskoulutus_koodi] [nvarchar](2) NULL,
	[yrittajan_oppisopimuskoulutus] [nvarchar](50) NULL,
	[yrittajan_oppisopimuskoulutus_SV] [nvarchar](50) NULL,
	[yrittajan_oppisopimuskoulutus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[d_yrityksen_koko_tthv]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_yrityksen_koko_tthv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_yrityksen_koko_tthv](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[yrityksen_koko_koodi] [nvarchar](10) NULL,
	[yrityksen_koko] [nvarchar](250) NULL,
	[yrityksen_koko_SV] [nvarchar](250) NULL,
	[yrityksen_koko_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_1_Peruskoulutiedosto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_1_Peruskoulutiedosto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_1_Peruskoulutiedosto](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[jarj] [nvarchar](10) NULL,
	[tunn] [nvarchar](5) NULL,
	[kev1] [int] NULL,
	[kev1n] [int] NULL,
	[kev2] [int] NULL,
	[kev2n] [int] NULL,
	[kev3] [int] NULL,
	[kev3n] [int] NULL,
	[kev4] [int] NULL,
	[kev4n] [int] NULL,
	[kev5] [int] NULL,
	[kev5n] [int] NULL,
	[kev6] [int] NULL,
	[kev6n] [int] NULL,
	[kev7] [int] NULL,
	[kev7n] [int] NULL,
	[kev8] [int] NULL,
	[kev8n] [int] NULL,
	[kev9] [int] NULL,
	[kev9n] [int] NULL,
	[kev] [int] NULL,
	[kevn] [int] NULL,
	[luok1] [int] NULL,
	[luok1n] [int] NULL,
	[luok2] [int] NULL,
	[luok2n] [int] NULL,
	[luok3] [int] NULL,
	[luok3n] [int] NULL,
	[luok4] [int] NULL,
	[luok4n] [int] NULL,
	[luok5] [int] NULL,
	[luok5n] [int] NULL,
	[luok6] [int] NULL,
	[luok6n] [int] NULL,
	[luok7] [int] NULL,
	[luok7n] [int] NULL,
	[luok8] [int] NULL,
	[luok8n] [int] NULL,
	[luok9] [int] NULL,
	[luok9n] [int] NULL,
	[luok] [int] NULL,
	[luokn] [int] NULL,
	[laim] [int] NULL,
	[laimn] [int] NULL,
	[erotod] [int] NULL,
	[erotodn] [int] NULL,
	[eitod] [int] NULL,
	[eitodn] [int] NULL,
	[tod] [int] NULL,
	[todn] [int] NULL,
	[tutkt] [int] NULL,
	[tutktn] [int] NULL,
	[suor10] [int] NULL,
	[suor10n] [int] NULL,
	[ove] [int] NULL,
	[oven] [int] NULL,
	[ov1] [int] NULL,
	[ov1n] [int] NULL,
	[ov2] [int] NULL,
	[ov2n] [int] NULL,
	[ov3] [int] NULL,
	[ov3n] [int] NULL,
	[ov4] [int] NULL,
	[ov4n] [int] NULL,
	[ov5] [int] NULL,
	[ov5n] [int] NULL,
	[ov6] [int] NULL,
	[ov6n] [int] NULL,
	[ov7] [int] NULL,
	[ov7n] [int] NULL,
	[ov8] [int] NULL,
	[ov8n] [int] NULL,
	[ov9] [int] NULL,
	[ov9n] [int] NULL,
	[ov10] [int] NULL,
	[ov10n] [int] NULL,
	[ovy] [int] NULL,
	[ovyn] [int] NULL,
	[eroppe] [int] NULL,
	[eropp1] [int] NULL,
	[eropp2] [int] NULL,
	[eropp3] [int] NULL,
	[eropp4] [int] NULL,
	[eropp5] [int] NULL,
	[eropp6] [int] NULL,
	[eropp7] [int] NULL,
	[eropp8] [int] NULL,
	[eropp9] [int] NULL,
	[eropp0] [int] NULL,
	[eropp] [int] NULL,
	[vaikvame] [int] NULL,
	[vaikvam1] [int] NULL,
	[vaikvam2] [int] NULL,
	[vaikvam3] [int] NULL,
	[vaikvam4] [int] NULL,
	[vaikvam5] [int] NULL,
	[vaikvam6] [int] NULL,
	[vaikvam7] [int] NULL,
	[vaikvam8] [int] NULL,
	[vaikvam9] [int] NULL,
	[vaikvam0] [int] NULL,
	[vaikvam] [int] NULL,
	[muuvame] [int] NULL,
	[muuvam1] [int] NULL,
	[muuvam2] [int] NULL,
	[muuvam3] [int] NULL,
	[muuvam4] [int] NULL,
	[muuvam5] [int] NULL,
	[muuvam6] [int] NULL,
	[muuvam7] [int] NULL,
	[muuvam8] [int] NULL,
	[muuvam9] [int] NULL,
	[muuvam0] [int] NULL,
	[muuvam] [int] NULL,
	[opksu] [int] NULL,
	[opkru] [int] NULL,
	[opksaa] [int] NULL,
	[opkmuu] [int] NULL,
	[opky] [int] NULL,
	[kiele] [int] NULL,
	[kiele9] [int] NULL,
	[kiele11v] [int] NULL,
	[kiele11m] [int] NULL,
	[kielk] [int] NULL,
	[kielk9] [int] NULL,
	[kielk11v] [int] NULL,
	[kielk11m] [int] NULL,
	[kulje] [int] NULL,
	[kulje9] [int] NULL,
	[kulje11v] [int] NULL,
	[kulje11m] [int] NULL,
	[kuljk] [int] NULL,
	[kuljk9] [int] NULL,
	[kuljk11v] [int] NULL,
	[kuljk11m] [int] NULL,
	[maje] [int] NULL,
	[maje9] [int] NULL,
	[maje11v] [int] NULL,
	[maje11m] [int] NULL,
	[majk] [int] NULL,
	[majk9] [int] NULL,
	[majk11v] [int] NULL,
	[majk11m] [int] NULL,
	[lykk] [int] NULL,
	[lykkn] [int] NULL,
	[kotona] [int] NULL,
	[kotonan] [int] NULL,
	[ulkom] [int] NULL,
	[ulkomn] [int] NULL,
	[ika5e] [int] NULL,
	[ika5en] [int] NULL,
	[ika6e] [int] NULL,
	[ika6en] [int] NULL,
	[ika61] [int] NULL,
	[ika61n] [int] NULL,
	[ika7e] [int] NULL,
	[ika7en] [int] NULL,
	[ika71] [int] NULL,
	[ika71n] [int] NULL,
	[ika81] [int] NULL,
	[ika81n] [int] NULL,
	[ika91] [int] NULL,
	[ika91n] [int] NULL,
	[ikae] [int] NULL,
	[ikaen] [int] NULL,
	[ika1] [int] NULL,
	[ika1n] [int] NULL,
	[oeriy] [int] NULL,
	[kokint0] [int] NULL,
	[kokint1] [int] NULL,
	[kokint2] [int] NULL,
	[kokint3] [int] NULL,
	[kokint4] [int] NULL,
	[kokint5] [int] NULL,
	[kokint6] [int] NULL,
	[kokint7] [int] NULL,
	[kokint8] [int] NULL,
	[kokint9] [int] NULL,
	[kokint10] [int] NULL,
	[kokint] [int] NULL,
	[kokintn] [int] NULL,
	[osint0] [int] NULL,
	[osint1] [int] NULL,
	[osint2] [int] NULL,
	[osint3] [int] NULL,
	[osint4] [int] NULL,
	[osint5] [int] NULL,
	[osint6] [int] NULL,
	[osint7] [int] NULL,
	[osint8] [int] NULL,
	[osint9] [int] NULL,
	[osint10] [int] NULL,
	[osint] [int] NULL,
	[osintn] [int] NULL,
	[eritlk0] [int] NULL,
	[eritlk1] [int] NULL,
	[eritlk2] [int] NULL,
	[eritlk3] [int] NULL,
	[eritlk4] [int] NULL,
	[eritlk5] [int] NULL,
	[eritlk6] [int] NULL,
	[eritlk7] [int] NULL,
	[eritlk8] [int] NULL,
	[eritlk9] [int] NULL,
	[eritlk10] [int] NULL,
	[eritlk] [int] NULL,
	[eritlkn] [int] NULL,
	[int0] [int] NULL,
	[int1] [int] NULL,
	[int2] [int] NULL,
	[int3] [int] NULL,
	[int4] [int] NULL,
	[int5] [int] NULL,
	[int6] [int] NULL,
	[int7] [int] NULL,
	[int8] [int] NULL,
	[int9] [int] NULL,
	[int10] [int] NULL,
	[inty] [int] NULL,
	[intyn] [int] NULL,
	[int0n] [int] NULL,
	[int1n] [int] NULL,
	[int2n] [int] NULL,
	[int3n] [int] NULL,
	[int4n] [int] NULL,
	[int5n] [int] NULL,
	[int6n] [int] NULL,
	[int7n] [int] NULL,
	[int8n] [int] NULL,
	[int9n] [int] NULL,
	[int10n] [int] NULL,
	[intn] [int] NULL,
	[aev] [int] NULL,
	[yev] [int] NULL,
	[ev] [int] NULL,
	[aort] [int] NULL,
	[yort] [int] NULL,
	[ort] [int] NULL,
	[aet] [int] NULL,
	[yet] [int] NULL,
	[et] [int] NULL,
	[amu] [int] NULL,
	[ymu] [int] NULL,
	[mu] [int] NULL,
	[aeos] [int] NULL,
	[yeos] [int] NULL,
	[eos] [int] NULL,
	[akay] [int] NULL,
	[ykay] [int] NULL,
	[kay] [int] NULL,
	[asv] [int] NULL,
	[ysv] [int] NULL,
	[sv] [int] NULL,
	[arv] [int] NULL,
	[yrv] [int] NULL,
	[rv] [int] NULL,
	[asvrv] [int] NULL,
	[ysvrv] [int] NULL,
	[svrv] [int] NULL,
	[eng1] [int] NULL,
	[eng2] [int] NULL,
	[eng3] [int] NULL,
	[eng4] [int] NULL,
	[eng5] [int] NULL,
	[eng6] [int] NULL,
	[eny] [int] NULL,
	[enn] [int] NULL,
	[ru1] [int] NULL,
	[ru2] [int] NULL,
	[ru3] [int] NULL,
	[ru4] [int] NULL,
	[ru5] [int] NULL,
	[ru6] [int] NULL,
	[ruy] [int] NULL,
	[run] [int] NULL,
	[su1] [int] NULL,
	[su2] [int] NULL,
	[su3] [int] NULL,
	[su4] [int] NULL,
	[su5] [int] NULL,
	[su6] [int] NULL,
	[suy] [int] NULL,
	[sun] [int] NULL,
	[ra1] [int] NULL,
	[ra2] [int] NULL,
	[ra3] [int] NULL,
	[ra4] [int] NULL,
	[ra5] [int] NULL,
	[ra6] [int] NULL,
	[ray] [int] NULL,
	[ran] [int] NULL,
	[sa1] [int] NULL,
	[sa2] [int] NULL,
	[sa3] [int] NULL,
	[sa4] [int] NULL,
	[sa5] [int] NULL,
	[sa6] [int] NULL,
	[say] [int] NULL,
	[san] [int] NULL,
	[ve1] [int] NULL,
	[ve2] [int] NULL,
	[ve3] [int] NULL,
	[ve4] [int] NULL,
	[ve5] [int] NULL,
	[ve6] [int] NULL,
	[vey] [int] NULL,
	[ven] [int] NULL,
	[saa1] [int] NULL,
	[saa2] [int] NULL,
	[saa3] [int] NULL,
	[saa4] [int] NULL,
	[saa5] [int] NULL,
	[saa6] [int] NULL,
	[saay] [int] NULL,
	[saan] [int] NULL,
	[mu1] [int] NULL,
	[mu2] [int] NULL,
	[mu3] [int] NULL,
	[mu4] [int] NULL,
	[mu5] [int] NULL,
	[mu6] [int] NULL,
	[muy] [int] NULL,
	[mun] [int] NULL,
	[eopis1] [int] NULL,
	[eopis2] [int] NULL,
	[eopis3] [int] NULL,
	[eopis4] [int] NULL,
	[eopis5] [int] NULL,
	[eopis6] [int] NULL,
	[eopisy] [int] NULL,
	[eopisn] [int] NULL,
	[yht1] [int] NULL,
	[yht2] [int] NULL,
	[yht3] [int] NULL,
	[yht4] [int] NULL,
	[yht5] [int] NULL,
	[yht6] [int] NULL,
	[yht] [int] NULL,
	[tyt] [int] NULL,
	[ven1] [int] NULL,
	[ven2] [int] NULL,
	[ven3] [int] NULL,
	[ven4] [int] NULL,
	[ven5] [int] NULL,
	[ven6] [int] NULL,
	[veny] [int] NULL,
	[venn] [int] NULL,
	[vru1] [int] NULL,
	[vru2] [int] NULL,
	[vru3] [int] NULL,
	[vru4] [int] NULL,
	[vru5] [int] NULL,
	[vru6] [int] NULL,
	[vruy] [int] NULL,
	[vsu1] [int] NULL,
	[vsu2] [int] NULL,
	[vsu3] [int] NULL,
	[vsu4] [int] NULL,
	[vsu5] [int] NULL,
	[vsu6] [int] NULL,
	[vsuy] [int] NULL,
	[vsun] [int] NULL,
	[vrun] [int] NULL,
	[vra1] [int] NULL,
	[vra2] [int] NULL,
	[vra3] [int] NULL,
	[vra4] [int] NULL,
	[vra5] [int] NULL,
	[vra6] [int] NULL,
	[vray] [int] NULL,
	[vran] [int] NULL,
	[vsa1] [int] NULL,
	[vsa2] [int] NULL,
	[vsa3] [int] NULL,
	[vsa4] [int] NULL,
	[vsa5] [int] NULL,
	[vsa6] [int] NULL,
	[vsay] [int] NULL,
	[vsan] [int] NULL,
	[vve1] [int] NULL,
	[vve2] [int] NULL,
	[vve3] [int] NULL,
	[vve4] [int] NULL,
	[vve5] [int] NULL,
	[vve6] [int] NULL,
	[vvey] [int] NULL,
	[vven] [int] NULL,
	[vsaa1] [int] NULL,
	[vsaa2] [int] NULL,
	[vsaa3] [int] NULL,
	[vsaa4] [int] NULL,
	[vsaa5] [int] NULL,
	[vsaa6] [int] NULL,
	[vsaay] [int] NULL,
	[vsaan] [int] NULL,
	[vmu1] [int] NULL,
	[vmu2] [int] NULL,
	[vmu3] [int] NULL,
	[vmu4] [int] NULL,
	[vmu5] [int] NULL,
	[vmu6] [int] NULL,
	[vmuy] [int] NULL,
	[vmun] [int] NULL,
	[vyht1] [int] NULL,
	[vyht2] [int] NULL,
	[vyht3] [int] NULL,
	[vyht4] [int] NULL,
	[vyht5] [int] NULL,
	[vyht6] [int] NULL,
	[vyht] [int] NULL,
	[vtyt] [int] NULL,
	[kieli0] [int] NULL,
	[kieli1] [int] NULL,
	[kieli2] [int] NULL,
	[kieli3] [int] NULL,
	[kieli4] [int] NULL,
	[kieliy] [int] NULL,
	[yaen1m] [int] NULL,
	[yyenm] [int] NULL,
	[yenm] [int] NULL,
	[yaen2m] [int] NULL,
	[enmm] [int] NULL,
	[yaen1n] [int] NULL,
	[yyenn] [int] NULL,
	[yenn] [int] NULL,
	[yaen2n] [int] NULL,
	[ennn] [int] NULL,
	[yaru1m] [int] NULL,
	[yyrum] [int] NULL,
	[yrum] [int] NULL,
	[yaru2m] [int] NULL,
	[rumm] [int] NULL,
	[yaru1n] [int] NULL,
	[yyrun] [int] NULL,
	[yrun] [int] NULL,
	[yaru2n] [int] NULL,
	[runn] [int] NULL,
	[yasu1m] [int] NULL,
	[yysum] [int] NULL,
	[ysum] [int] NULL,
	[yasu2m] [int] NULL,
	[summ] [int] NULL,
	[yasu1n] [int] NULL,
	[yysun] [int] NULL,
	[ysun] [int] NULL,
	[yasu2n] [int] NULL,
	[sunn] [int] NULL,
	[yara1m] [int] NULL,
	[yyram] [int] NULL,
	[yram] [int] NULL,
	[yara2m] [int] NULL,
	[ramm] [int] NULL,
	[yara1n] [int] NULL,
	[yyran] [int] NULL,
	[yran] [int] NULL,
	[yara2n] [int] NULL,
	[rann] [int] NULL,
	[yasa1m] [int] NULL,
	[yysam] [int] NULL,
	[ysam] [int] NULL,
	[yasa2m] [int] NULL,
	[samm] [int] NULL,
	[yasa1n] [int] NULL,
	[yysan] [int] NULL,
	[ysan] [int] NULL,
	[yasa2n] [int] NULL,
	[sann] [int] NULL,
	[yave1m] [int] NULL,
	[yvem] [int] NULL,
	[yave2m] [int] NULL,
	[vemm] [int] NULL,
	[yave1n] [int] NULL,
	[yven] [int] NULL,
	[yave2n] [int] NULL,
	[vennn] [int] NULL,
	[yasaa1m] [int] NULL,
	[ysaam] [int] NULL,
	[yasaa2m] [int] NULL,
	[saamm] [int] NULL,
	[yasaa1n] [int] NULL,
	[ysaan] [int] NULL,
	[yasaa2n] [int] NULL,
	[saann] [int] NULL,
	[yalat1m] [int] NULL,
	[ylatm] [int] NULL,
	[yalat2m] [int] NULL,
	[lamm] [int] NULL,
	[yalat1n] [int] NULL,
	[ylatn] [int] NULL,
	[yalat2n] [int] NULL,
	[lann] [int] NULL,
	[yamuu1m] [int] NULL,
	[ymuum] [int] NULL,
	[yamuu2m] [int] NULL,
	[mumm] [int] NULL,
	[yamuu1n] [int] NULL,
	[ymuun] [int] NULL,
	[yamuu2n] [int] NULL,
	[munn] [int] NULL,
	[yaei1m] [int] NULL,
	[yyeim] [int] NULL,
	[eimm] [int] NULL,
	[yaei1n] [int] NULL,
	[yyein] [int] NULL,
	[einn] [int] NULL,
	[ma14m] [int] NULL,
	[ma14n] [int] NULL,
	[ma12m] [int] NULL,
	[ma12n] [int] NULL,
	[ma1m] [int] NULL,
	[ma1n] [int] NULL,
	[ma2m] [int] NULL,
	[ma2n] [int] NULL,
	[ma3m] [int] NULL,
	[ma3n] [int] NULL,
	[fy14m] [int] NULL,
	[fy14n] [int] NULL,
	[fy12m] [int] NULL,
	[fy12n] [int] NULL,
	[fy1m] [int] NULL,
	[fy1n] [int] NULL,
	[fy2m] [int] NULL,
	[fy2n] [int] NULL,
	[fy3m] [int] NULL,
	[fy3n] [int] NULL,
	[ke14m] [int] NULL,
	[ke14n] [int] NULL,
	[ke12m] [int] NULL,
	[ke12n] [int] NULL,
	[ke1m] [int] NULL,
	[ke1n] [int] NULL,
	[ke2m] [int] NULL,
	[ke2n] [int] NULL,
	[ke3m] [int] NULL,
	[ke3n] [int] NULL,
	[bi14m] [int] NULL,
	[bi14n] [int] NULL,
	[bi12m] [int] NULL,
	[bi12n] [int] NULL,
	[bi1m] [int] NULL,
	[bi1n] [int] NULL,
	[bi2m] [int] NULL,
	[bi2n] [int] NULL,
	[bi3m] [int] NULL,
	[bi3n] [int] NULL,
	[mt14m] [int] NULL,
	[mt14n] [int] NULL,
	[mt12m] [int] NULL,
	[mt12n] [int] NULL,
	[mt1m] [int] NULL,
	[mt1n] [int] NULL,
	[mt2m] [int] NULL,
	[mt2n] [int] NULL,
	[mt3m] [int] NULL,
	[mt3n] [int] NULL,
	[ttek14m] [int] NULL,
	[ttek14n] [int] NULL,
	[ttek12m] [int] NULL,
	[ttek12n] [int] NULL,
	[ttek1m] [int] NULL,
	[ttek1n] [int] NULL,
	[ttek2m] [int] NULL,
	[ttek2n] [int] NULL,
	[ttek3m] [int] NULL,
	[ttek3n] [int] NULL,
	[tt14m] [int] NULL,
	[tt14n] [int] NULL,
	[tt12m] [int] NULL,
	[tt12n] [int] NULL,
	[tt1m] [int] NULL,
	[tt1n] [int] NULL,
	[tt2m] [int] NULL,
	[tt2n] [int] NULL,
	[tt3m] [int] NULL,
	[tt3n] [int] NULL,
	[ts14m] [int] NULL,
	[ts14n] [int] NULL,
	[ts12m] [int] NULL,
	[ts12n] [int] NULL,
	[ts1m] [int] NULL,
	[ts1n] [int] NULL,
	[ts2m] [int] NULL,
	[ts2n] [int] NULL,
	[ts3m] [int] NULL,
	[ts3n] [int] NULL,
	[tietolahde] [varchar](255) NULL,
	[rivinumero] [varchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitoksen_taustatiedot] [nvarchar](5) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](10) NULL,
	[ika_5v] [nvarchar](10) NULL,
	[ika_14_65] [nvarchar](10) NULL,
	[kotikunta] [nvarchar](3) NULL,
	[kansalaisuus_versio2] [nvarchar](1) NULL,
	[opiskelijan_olo_tamm] [nvarchar](1) NULL,
	[opiskelijan_olo_syys] [nvarchar](1) NULL,
	[rahoituslahde] [nvarchar](1) NULL,
	[opiskelijan_fte_tieto] [nvarchar](1) NULL,
	[vahintaan_45_op_suorittanut] [nvarchar](1) NULL,
	[vahintaan_55_op_suorittanut] [nvarchar](1) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulolukukausi] [nvarchar](1) NULL,
	[kirjoihintulovuosi_korkeakoulusektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva] [nvarchar](4) NULL,
	[koulutustyyppi] [nvarchar](1) NULL,
	[opiskelumuoto] [nvarchar](1) NULL,
	[avoinvayla] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_yotutk] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_yotutk_tarkempi] [nvarchar](100) NULL,
	[yotutk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemmin_suoritetun_yotutk_koulutustiedot] [nvarchar](6) NULL,
	[aikaisemmin_suoritetun_yotutk_suoritusvuosi] [nvarchar](4) NULL,
	[aikaisemmin_suoritetun_yotutk_oppilaitostiedot] [nvarchar](5) NULL,
	[aikaisemmin_suoritettu_ammtutk] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_ammtutk_tarkempi] [nvarchar](100) NULL,
	[ammtutk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemmin_suoritetun_ammtutk_koulutustiedot] [nvarchar](6) NULL,
	[aikaisemmin_suoritetun_ammtutk_suoritusvuosi] [nvarchar](4) NULL,
	[aikaisemmin_suoritetun_ammtutk_oppilaitostiedot] [nvarchar](5) NULL,
	[aikaisemmin_suoritettu_amktutk] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_amktutk_tarkempi] [nvarchar](100) NULL,
	[amktutk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemmin_suoritetun_amktutk_koulutustiedot] [nvarchar](6) NULL,
	[aikaisemmin_suoritetun_amktutk_suoritusvuosi] [nvarchar](4) NULL,
	[aikaisemmin_suoritetun_amktutk_oppilaitostiedot] [nvarchar](5) NULL,
	[aikaisemmin_suoritettu_ylempiamktutk] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_ylempiamktutk_tarkempi] [nvarchar](100) NULL,
	[ylempiamktutk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemmin_suoritetun_ylempiamktutk_koulutustiedot] [nvarchar](6) NULL,
	[aikaisemmin_suoritetun_ylempiamktutk_suoritusvuosi] [nvarchar](4) NULL,
	[aikaisemmin_suoritetun_ylempiamktutk_oppilaitostiedot] [nvarchar](5) NULL,
	[aikaisemmin_suoritettu_alempikktutk] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_alempikktutk_tarkempi] [nvarchar](100) NULL,
	[alempikktutk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemmin_suoritetun_alempikktutk_koulutustiedot] [nvarchar](6) NULL,
	[aikaisemmin_suoritetun_alempikktutk_suoritusvuosi] [nvarchar](4) NULL,
	[aikaisemmin_suoritetun_alempikktutk_oppilaitostiedot] [nvarchar](5) NULL,
	[aikaisemmin_suoritettu_ylempikktutk] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_ylempikktutk_tarkempi] [nvarchar](100) NULL,
	[ylempikktutk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemmin_suoritetun_ylempikktutk_koulutustiedot] [nvarchar](6) NULL,
	[aikaisemmin_suoritetun_ylempikktutk_suoritusvuosi] [nvarchar](4) NULL,
	[aikaisemmin_suoritetun_ylempikktutk_oppilaitostiedot] [nvarchar](5) NULL,
	[opiskelijan_koulutus_edellisvuonna] [nvarchar](6) NULL,
	[opiskelijan_opintoala2002_edellisvuonna] [nvarchar](3) NULL,
	[opiskelijan_opintoala1995_edellisvuonna] [nvarchar](2) NULL,
	[aikaisemmasta_koulutuksesta_yotutk_kulunut_aika] [nvarchar](10) NULL,
	[aikaisemmasta_koulutuksesta_ammtutk_kulunut_aika] [nvarchar](10) NULL,
	[aikaisemmasta_koulutuksesta_amktutk_kulunut_aika] [nvarchar](10) NULL,
	[aikaisemmasta_koulutuksesta_ylamktutk_kulunut_aika] [nvarchar](10) NULL,
	[aikaisemmasta_koulutuksesta_alkktutk_kulunut_aika] [nvarchar](10) NULL,
	[aikaisemmasta_koulutuksesta_ylkktutk_kulunut_aika] [nvarchar](10) NULL,
	[aiemman_tutkinnon_yotutk_opintoala1995_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_yotutk_opintoala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_yotutk_koulutusala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_yotutk_koulutusaste2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammtutk_opintoala1995_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammtutk_opintoala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammtutk_koulutusala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammtutk_koulutusaste2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_amktutk_opintoala1995_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_amktutk_opintoala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_amktutk_koulutusala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_amktutk_koulutusaste2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempiamktutk_opintoala1995_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempiamktutk_opintoala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempiamktutk_koulutusala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempiamktutk_koulutusaste2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_alempikktutk_opintoala1995_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_alempikktutk_opintoala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_alempikktutk_koulutusala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_alempikktutk_koulutusaste2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempikktutk_opintoala1995_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempikktutk_opintoala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempikktutk_koulutusala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempikktutk_koulutusaste2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_opintoala1995_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_opintoala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_koulutusala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_koulutusaste2002_sama] [nvarchar](100) NULL,
	[pohjakoulutuksen_tila] [nvarchar](1) NULL,
	[lukumaara] [int] NULL,
	[aloittaneet] [int] NULL,
	[aikaisempi_korkein_tutkinto] [nvarchar](2) NULL,
	[ika_18_65] [nvarchar](10) NULL,
	[ylempi_korkeakoulututkinto] [int] NULL,
	[ylempi_amk_tutkinto] [int] NULL,
	[alempi_korkeakoulututkinto] [int] NULL,
	[amk_tutkinto] [int] NULL,
	[ammatillinen_perustutkinto] [int] NULL,
	[ylioppilastutkinto] [int] NULL,
	[ei_perusasteen_jalkeista_koulutusta] [int] NULL,
	[opiskelijat] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot](
	[tilastointivuosi] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[mittari_nimi] [nvarchar](128) NULL,
	[mittari_arvo] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[koulutuksen_opetuskieli] [nvarchar](10) NULL,
	[nuorten_aikuisten_koulutus_amm] [nvarchar](2) NULL,
	[koulutuksen_sijaintimaakunta] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aikuisopiskelija] [nvarchar](2) NULL,
	[koulutuksen_aloittamislukuvuosi] [nvarchar](4) NULL,
	[koulutuksen_aloittamislukukausi] [nvarchar](1) NULL,
	[kirjoillaolo_tammikuu] [nvarchar](10) NULL,
	[kirjoillaolo_syyskuu] [nvarchar](10) NULL,
	[kotikunnan_kuntaryhma] [nvarchar](2) NULL,
	[koulutusryhma_koulutuslaji3] [nvarchar](2) NULL,
	[kansalaisuus_maa] [nvarchar](3) NULL,
	[kansalaisuus_versio1] [nvarchar](2) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[opiskelijoiden_lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[koulutuksen_opetuskieli] [nvarchar](10) NULL,
	[nuorten_aikuisten_koulutus_amm] [nvarchar](2) NULL,
	[koulutuksen_sijaintimaakunta] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aikuisopiskelija] [nvarchar](2) NULL,
	[koulutuksen_aloittamislukuvuosi] [nvarchar](4) NULL,
	[koulutuksen_aloittamislukukausi] [nvarchar](1) NULL,
	[kirjoillaolo_tammikuu] [nvarchar](10) NULL,
	[kirjoillaolo_syyskuu] [nvarchar](10) NULL,
	[kotikunnan_kuntaryhma] [nvarchar](2) NULL,
	[koulutusryhma_koulutuslaji3] [nvarchar](2) NULL,
	[syntymavaltio_maa] [nvarchar](3) NULL,
	[syntymavaltio_kansalaisuus_versio1] [nvarchar](2) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[opiskelijoiden_lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[koulutuksen_opetuskieli] [nvarchar](10) NULL,
	[nuorten_aikuisten_koulutus_amm] [nvarchar](2) NULL,
	[koulutuksen_sijaintimaakunta] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aikuisopiskelija] [nvarchar](2) NULL,
	[koulutuksen_aloittamislukuvuosi] [nvarchar](4) NULL,
	[koulutuksen_aloittamislukukausi] [nvarchar](1) NULL,
	[kirjoillaolo_tammikuu] [nvarchar](10) NULL,
	[kirjoillaolo_syyskuu] [nvarchar](10) NULL,
	[kotikunnan_kuntaryhma] [nvarchar](2) NULL,
	[koulutusryhma_koulutuslaji3] [nvarchar](2) NULL,
	[aidinkieli_kieli] [nvarchar](10) NULL,
	[aidinkieli_versio3] [nvarchar](2) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[opiskelijoiden_lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitoksen_oppilaitostyyppi] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](1) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](1) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](1) NULL,
	[opetushallinnon_koulutus] [nvarchar](1) NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[rahoituslahde] [nvarchar](1) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulolukukausi] [nvarchar](1) NULL,
	[opiskelijan_olo_syys] [nvarchar](1) NULL,
	[aikaisempi_ylsk_koulutus] [nvarchar](1) NULL,
	[aikaisempi_ammpk] [nvarchar](1) NULL,
	[aikaisempi_ammpk_tarkempi] [nvarchar](100) NULL,
	[ammpk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemman_ammpk_opintoala1995] [nvarchar](2) NULL,
	[aikaisemman_ammpk_koulutusala1995] [nvarchar](1) NULL,
	[aikaisemman_ammpk_koulutusaste1995] [nvarchar](1) NULL,
	[aikaisemman_ammpk_opintoala2002] [nvarchar](3) NULL,
	[aikaisemman_ammpk_koulutusala2002] [nvarchar](1) NULL,
	[aikaisemman_ammpk_koulutusaste2002] [nvarchar](2) NULL,
	[aikaisemman_ammpk_suoritusvuosi] [nvarchar](4) NULL,
	[aikaisempi_ammpk_nayttotutkintona] [nvarchar](1) NULL,
	[aikaisempi_ammpk_nayttotutkintona_tarkempi] [nvarchar](100) NULL,
	[aikaisempi_ammpk_oppisopimuskoulutuksena] [nvarchar](1) NULL,
	[aikaisempi_ammpk_oppisopimuskoulutuksena_tarkempi] [nvarchar](100) NULL,
	[aikaisempi_ammlisa] [nvarchar](1) NULL,
	[aikaisempi_ammlisa_tarkempi] [nvarchar](100) NULL,
	[ammlisa_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemman_ammlisa_opintoala1995] [nvarchar](2) NULL,
	[aikaisemman_ammlisa_koulutusala1995] [nvarchar](1) NULL,
	[aikaisemman_ammlisa_koulutusaste1995] [nvarchar](1) NULL,
	[aikaisemman_ammlisa_opintoala2002] [nvarchar](3) NULL,
	[aikaisemman_ammlisa_koulutusala2002] [nvarchar](1) NULL,
	[aikaisemman_ammlisa_koulutusaste2002] [nvarchar](2) NULL,
	[aikaisemman_ammlisa_suoritusvuosi] [nvarchar](4) NULL,
	[aikaisempi_ammlisa_oppisopimuskoulutuksena] [nvarchar](1) NULL,
	[aikaisempi_ammlisa_oppisopimuskoulutuksena_tarkempi] [nvarchar](100) NULL,
	[aikaisempi_alempi_kk] [nvarchar](1) NULL,
	[aikaisempi_alempi_kk_tarkempi] [nvarchar](100) NULL,
	[alempi_kk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemman_alemman_kk_opintoala1995] [nvarchar](2) NULL,
	[aikaisemman_alemman_kk_koulutusala1995] [nvarchar](1) NULL,
	[aikaisemman_alemman_kk_koulutusaste1995] [nvarchar](1) NULL,
	[aikaisemman_alemman_kk_opintoala2002] [nvarchar](3) NULL,
	[aikaisemman_alemman_kk_koulutusala2002] [nvarchar](1) NULL,
	[aikaisemman_alemman_kk_koulutusaste2002] [nvarchar](2) NULL,
	[aikaisemman_alemman_kk_suoritusvuosi] [nvarchar](4) NULL,
	[aikaisempi_ylempi_kk] [nvarchar](1) NULL,
	[aikaisempi_ylempi_kk_tarkempi] [nvarchar](100) NULL,
	[ylempi_kk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikasemman_ylemman_kk_opintoala1995] [nvarchar](2) NULL,
	[aikasemman_ylemman_kk_koulutusala1995] [nvarchar](1) NULL,
	[aikasemman_ylemman_kk_koulutusaste1995] [nvarchar](1) NULL,
	[aikasemman_ylemman_kk_opintoala2002] [nvarchar](3) NULL,
	[aikasemman_ylemman_kk_koulutusala2002] [nvarchar](1) NULL,
	[aikasemman_ylemman_kk_koulutusaste2002] [nvarchar](2) NULL,
	[aikaisemman_ylemman_kk_suoritusvuosi] [nvarchar](4) NULL,
	[opiskelijan_asuinkunta] [nvarchar](3) NULL,
	[syntymavuosi] [nvarchar](10) NULL,
	[lukumaara] [int] NULL,
	[tietolahde] [nvarchar](100) NULL,
	[rivinumero] [int] NULL,
	[ika_1v] [nvarchar](10) NULL,
	[ika_5v] [nvarchar](10) NULL,
	[ika_14_65] [nvarchar](10) NULL,
	[aikaisemmasta_koulutuksesta_ammpk_kulunut_aika] [nvarchar](10) NULL,
	[aikaisemmasta_koulutuksesta_ammlisa_kulunut_aika] [nvarchar](10) NULL,
	[aikaisemmasta_koulutuksesta_alempi_kk_kulunut_aika] [nvarchar](10) NULL,
	[aikaisemmasta_koulutuksesta_ylempi_kk_kulunut_aika] [nvarchar](10) NULL,
	[aiemman_tutkinnon_ammpk_opintoala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammpk_koulutusala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammpk_koulutusaste_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammlisa_opintoala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammlisa_koulutusala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammlisa_koulutusaste_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_alempi_kk_opintoala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_alempi_kk_koulutusala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_alempi_kk_koulutusaste_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempi_kk_opintoala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempi_kk_koulutusala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempi_kk_koulutusaste_sama] [nvarchar](100) NULL,
	[aikaisempi_korkein_tutkinto] [nvarchar](2) NULL,
	[aiemman_tutkinnon_opintoala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_koulutusaste2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_koulutusala2002_sama] [nvarchar](100) NULL,
	[nuorten_aikuisten_koulutus_amm] [nvarchar](2) NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](2) NULL,
	[aloittaneet] [int] NULL,
	[viimeisimman_koulutuksen_suorituvuosi] [nvarchar](4) NULL,
	[viimeisimmasta_koulutuksesta_kulunut_aika] [nvarchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_23_Opisk_ja_tutksuor_vanh_aseman_muk](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[aidinkieli_versio1x] [nvarchar](2) NULL,
	[kotikunta] [nvarchar](3) NULL,
	[kotikunta1x] [nvarchar](3) NULL,
	[sosioekonominen_asema_1_isa] [nvarchar](1) NULL,
	[sosioekonominen_asema_1_aiti] [nvarchar](1) NULL,
	[sosioekonominen_asema_2_isa] [nvarchar](2) NULL,
	[sosioekonominen_asema_2_aiti] [nvarchar](2) NULL,
	[koulutusluokitus_isa] [nvarchar](10) NULL,
	[koulutusluokitus_aiti] [nvarchar](10) NULL,
	[tulodesiili_isa] [nvarchar](2) NULL,
	[tulodesiili_aiti] [nvarchar](2) NULL,
	[koulutuslaji] [nvarchar](2) NULL,
	[opetushallinnon_koulutus] [nvarchar](1) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_maakunta] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[opiskelijan_olo_syys] [nvarchar](1) NULL,
	[opetushallinnon_koulutus2] [nvarchar](1) NULL,
	[uudet_opiskelijat] [int] NULL,
	[opiskelijat] [int] NULL,
	[tutkinnot] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[ika_1v] [nvarchar](10) NULL,
	[ika_5v] [nvarchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppisopimuskoulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](10) NULL,
	[jarjestys_kirjoihintulovuosi] [int] NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[opiskelijan_olo_tamm] [nvarchar](2) NULL,
	[opiskelijan_olo_syys] [nvarchar](2) NULL,
	[aikuisopiskelija] [nvarchar](2) NULL,
	[ika_5v] [nvarchar](2) NULL,
	[lukumaara] [int] NULL,
	[lukiokoulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](2) NULL,
	[koulutuksen_tutkinnon_aloitusvuosi] [nvarchar](4) NULL,
	[koulutuksen_tutkinnon_aloituskausi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[tutkintonimike_ammpk] [nvarchar](5) NULL,
	[koulutusohjelma_ammpk] [nvarchar](4) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[tyovoimapoliittinen_koulutus] [nvarchar](2) NULL,
	[rahoituslahde_amm] [nvarchar](2) NULL,
	[alkamispaivamaara] [nvarchar](8) NULL,
	[paattymispaivamaara] [nvarchar](8) NULL,
	[tutkinnon_tavoite] [nvarchar](2) NULL,
	[yrittajan_oppisopimuskoulutus] [nvarchar](2) NULL,
	[oppisopimus_purkautunut] [nvarchar](2) NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta] [nvarchar](2) NULL,
	[toimiala_2008] [nvarchar](5) NULL,
	[oppisopimus_yrityksen_koko] [nvarchar](2) NULL,
	[tyonantajasektori] [nvarchar](2) NULL,
	[asuinmaakunta] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[hallinnonala] [nvarchar](2) NULL,
	[hallinnonala2] [nvarchar](2) NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](2) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus] [nvarchar](2) NULL,
	[koulutuksen_tavoite_toteuma] [nvarchar](2) NULL,
	[tyovoimapoliittinen] [nvarchar](2) NULL,
	[aloittaneet] [int] NULL,
	[opiskelijat] [int] NULL,
	[opiskelijat_lasna] [int] NULL,
	[nuorten_aikuisten_koulutus_amm] [nvarchar](2) NULL,
	[koulutuslaji_OKM_avain] [nvarchar](2) NULL,
	[yhtjarj] [nvarchar](10) NULL,
	[yhtoppilaitos] [nvarchar](10) NULL,
	[yht_koulutuksen_kunta] [nvarchar](3) NULL,
	[koulutusryhma_avain] [varchar](2) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppisopimuskoulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusaste] [nvarchar](6) NULL,
	[koulutusala] [nvarchar](6) NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[kotikunta] [nvarchar](3) NULL,
	[kotikunta_ed] [nvarchar](3) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[opiskelijan_olo_syys] [nvarchar](1) NULL,
	[ika_5v] [nvarchar](2) NULL,
	[lukumaara] [int] NULL,
	[lukiokoulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[tyovoimapoliittinen_koulutus] [nvarchar](2) NULL,
	[rahoituslahde_amm] [nvarchar](2) NULL,
	[tutkinnon_tavoite] [nvarchar](2) NULL,
	[yrittajan_oppisopimuskoulutus] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [nvarchar](10) NULL,
	[aineistotunnus] [varchar](4) NOT NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[hallinnonala] [nvarchar](2) NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](2) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus] [nvarchar](2) NULL,
	[koulutuksen_tavoite_toteuma] [nvarchar](2) NULL,
	[tyovoimapoliittinen] [nvarchar](2) NULL,
	[aloittaneet] [int] NULL,
	[opiskelijat] [int] NULL,
	[opiskelijat_lasna] [int] NULL,
	[nuorten_aikuisten_koulutus_amm] [nvarchar](2) NULL,
	[koulutuslaji_OKM_avain] [int] NOT NULL,
	[yhtjarj] [nvarchar](10) NULL,
	[yhtoppilaitos] [nvarchar](5) NULL,
	[yht_koulutuksen_kunta] [nvarchar](3) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_4_Ammatillisen_koulutuksen_tutkinnot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_4_Ammatillisen_koulutuksen_tutkinnot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_4_Ammatillisen_koulutuksen_tutkinnot](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppisopimuskoulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[tutkintonimike_ammpk] [nvarchar](5) NULL,
	[koulutusohjelma_ammpk] [nvarchar](4) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](10) NULL,
	[jarjestys_kirjoihintulovuosi] [int] NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[aikuisopiskelija] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](2) NULL,
	[ika_5v] [nvarchar](2) NULL,
	[suorituspaivamaara] [nvarchar](8) NULL,
	[lukumaara] [int] NULL,
	[koulutuksen_tutkinnon_aloitusvuosi] [nvarchar](4) NULL,
	[koulutuksen_tutkinnon_aloituskausi] [nvarchar](2) NULL,
	[ov_hyvaksiluettu_ennen] [int] NULL,
	[ov_hyvaksiluettu_aikana] [int] NULL,
	[ov_suoritettu_koulutuksen_aikana] [int] NULL,
	[ov_yhteensa] [int] NULL,
	[ov_tyossaoppiminen] [int] NULL,
	[lkm_ammattiosaaminen] [int] NULL,
	[lkm_opintokokonaisuus] [int] NULL,
	[tyovoimapoliittinen_koulutus] [nvarchar](2) NULL,
	[rahoituslahde_amm] [nvarchar](2) NULL,
	[vayla_nayttotutkintoon] [nvarchar](2) NULL,
	[alkamispaivamaara] [nvarchar](8) NULL,
	[paattymispaivamaara] [nvarchar](8) NULL,
	[tutkinnon_tavoite] [nvarchar](2) NULL,
	[tutkinnon_toteuma] [nvarchar](2) NULL,
	[yrittajan_oppisopimuskoulutus] [nvarchar](2) NULL,
	[oppisopimus_purkautunut] [nvarchar](2) NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta] [nvarchar](2) NULL,
	[toimiala_2008] [nvarchar](5) NULL,
	[oppisopimus_yrityksen_koko] [nvarchar](2) NULL,
	[tyonantajasektori] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[hallinnonala] [nvarchar](2) NULL,
	[hallinnonala2] [nvarchar](2) NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](2) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus] [nvarchar](2) NULL,
	[koulutuksen_tavoite_toteuma] [nvarchar](2) NULL,
	[tyovoimapoliittinen] [nvarchar](2) NULL,
	[tutkinnot] [int] NULL,
	[nuorten_aikuisten_koulutus_amm] [nvarchar](2) NULL,
	[koulutuslaji_OKM_avain] [nvarchar](2) NULL,
	[yhtjarj] [nvarchar](10) NULL,
	[yhtoppilaitos] [nvarchar](10) NULL,
	[yht_koulutuksen_kunta] [nvarchar](3) NULL,
	[koulutusryhma_avain] [varchar](2) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_5_Lukiokoulutuksen_ainevalinnat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_5_Lukiokoulutuksen_ainevalinnat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_5_Lukiokoulutuksen_ainevalinnat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[nukevy] [int] NULL,
	[aikevy] [int] NULL,
	[kev] [int] NULL,
	[nukevyn] [int] NULL,
	[aikevyn] [int] NULL,
	[kevn] [int] NULL,
	[nukev1] [int] NULL,
	[nukev2] [int] NULL,
	[nukev3] [int] NULL,
	[nukev4] [int] NULL,
	[nukev] [int] NULL,
	[nukev1n] [int] NULL,
	[nukev2n] [int] NULL,
	[nukev3n] [int] NULL,
	[nukev4n] [int] NULL,
	[nukevn] [int] NULL,
	[aikev1] [int] NULL,
	[aikev2] [int] NULL,
	[aikev3] [int] NULL,
	[aikev4] [int] NULL,
	[aikev] [int] NULL,
	[aikev1n] [int] NULL,
	[aikev2n] [int] NULL,
	[aikev3n] [int] NULL,
	[aikev4n] [int] NULL,
	[aikevn] [int] NULL,
	[nuvary] [int] NULL,
	[aivary] [int] NULL,
	[var] [int] NULL,
	[nuvaryn] [int] NULL,
	[aivaryn] [int] NULL,
	[varn] [int] NULL,
	[nuyks] [int] NULL,
	[aiyks] [int] NULL,
	[yksy] [int] NULL,
	[nuvar2] [int] NULL,
	[nuvar25] [int] NULL,
	[nuvar3] [int] NULL,
	[nuvar35] [int] NULL,
	[nuvar4] [int] NULL,
	[nuvar45] [int] NULL,
	[nuvar5] [int] NULL,
	[nuvar] [int] NULL,
	[nuvar2n] [int] NULL,
	[nuvar25n] [int] NULL,
	[nuvar3n] [int] NULL,
	[nuvar35n] [int] NULL,
	[nuvar4n] [int] NULL,
	[nuvar45n] [int] NULL,
	[nuvar5n] [int] NULL,
	[nuvarn] [int] NULL,
	[aivar2] [int] NULL,
	[aivar25] [int] NULL,
	[aivar3] [int] NULL,
	[aivar35] [int] NULL,
	[aivar4] [int] NULL,
	[aivar45] [int] NULL,
	[aivar5] [int] NULL,
	[aivar] [int] NULL,
	[aivar2n] [int] NULL,
	[aivar25n] [int] NULL,
	[aivar3n] [int] NULL,
	[aivar35n] [int] NULL,
	[aivar4n] [int] NULL,
	[aivar45n] [int] NULL,
	[aivar5n] [int] NULL,
	[aivarn] [int] NULL,
	[ev] [int] NULL,
	[ort] [int] NULL,
	[et] [int] NULL,
	[mu] [int] NULL,
	[eos] [int] NULL,
	[kay] [int] NULL,
	[kieli1] [int] NULL,
	[kieli2] [int] NULL,
	[kieli3] [int] NULL,
	[kieli4] [int] NULL,
	[kieli5] [int] NULL,
	[kieli6] [int] NULL,
	[kieliy] [int] NULL,
	[sv] [int] NULL,
	[rv] [int] NULL,
	[svrv] [int] NULL,
	[svnn] [int] NULL,
	[rvnn] [int] NULL,
	[svrvn] [int] NULL,
	[yaenm] [int] NULL,
	[yyenm] [int] NULL,
	[yen6m] [int] NULL,
	[len6m] [int] NULL,
	[alen6m] [int] NULL,
	[enmm] [int] NULL,
	[yaenn] [int] NULL,
	[yyenn] [int] NULL,
	[yen6n] [int] NULL,
	[len6n] [int] NULL,
	[alen6n] [int] NULL,
	[ennn] [int] NULL,
	[yarum] [int] NULL,
	[yyrum] [int] NULL,
	[yru6m] [int] NULL,
	[lru6m] [int] NULL,
	[alru6m] [int] NULL,
	[rumm] [int] NULL,
	[yarun] [int] NULL,
	[yyrun] [int] NULL,
	[yru6n] [int] NULL,
	[lru6n] [int] NULL,
	[alru6n] [int] NULL,
	[runn] [int] NULL,
	[yasum] [int] NULL,
	[yysum] [int] NULL,
	[ysu6m] [int] NULL,
	[lsu6m] [int] NULL,
	[alsu6m] [int] NULL,
	[summ] [int] NULL,
	[yasun] [int] NULL,
	[yysun] [int] NULL,
	[ysu6n] [int] NULL,
	[lsu6n] [int] NULL,
	[alsu6n] [int] NULL,
	[sunn] [int] NULL,
	[yaram] [int] NULL,
	[yyram] [int] NULL,
	[yra6m] [int] NULL,
	[lra6m] [int] NULL,
	[alra6m] [int] NULL,
	[ramm] [int] NULL,
	[yaran] [int] NULL,
	[yyran] [int] NULL,
	[yra6n] [int] NULL,
	[lra6n] [int] NULL,
	[alra6n] [int] NULL,
	[rann] [int] NULL,
	[yasam] [int] NULL,
	[yysam] [int] NULL,
	[ysa6m] [int] NULL,
	[lsa6m] [int] NULL,
	[alsa6m] [int] NULL,
	[samm] [int] NULL,
	[yasan] [int] NULL,
	[yysan] [int] NULL,
	[ysa6n] [int] NULL,
	[lsa6n] [int] NULL,
	[alsa6n] [int] NULL,
	[sann] [int] NULL,
	[yavem] [int] NULL,
	[yyvem] [int] NULL,
	[yve6m] [int] NULL,
	[lve6m] [int] NULL,
	[alve6m] [int] NULL,
	[vemm] [int] NULL,
	[yaven] [int] NULL,
	[yyven] [int] NULL,
	[yve6n] [int] NULL,
	[lve6n] [int] NULL,
	[alve6n] [int] NULL,
	[vennn] [int] NULL,
	[yasaam] [int] NULL,
	[ysaa6m] [int] NULL,
	[lsaa6m] [int] NULL,
	[alsaa6m] [int] NULL,
	[saamm] [int] NULL,
	[yasaan] [int] NULL,
	[ysaa6n] [int] NULL,
	[lsaa6n] [int] NULL,
	[alsaa6n] [int] NULL,
	[saann] [int] NULL,
	[yalatm] [int] NULL,
	[ylat6m] [int] NULL,
	[lla6m] [int] NULL,
	[alla6m] [int] NULL,
	[lamm] [int] NULL,
	[yalan] [int] NULL,
	[ylat6n] [int] NULL,
	[lla6n] [int] NULL,
	[alla6n] [int] NULL,
	[lann] [int] NULL,
	[yaesm] [int] NULL,
	[yes6m] [int] NULL,
	[les6m] [int] NULL,
	[ales6m] [int] NULL,
	[esmm] [int] NULL,
	[yaesn] [int] NULL,
	[yes6n] [int] NULL,
	[les6n] [int] NULL,
	[ales6n] [int] NULL,
	[esnn] [int] NULL,
	[yaitm] [int] NULL,
	[yit6m] [int] NULL,
	[lit6m] [int] NULL,
	[alit6m] [int] NULL,
	[itmm] [int] NULL,
	[yaitn] [int] NULL,
	[yit6n] [int] NULL,
	[lit6n] [int] NULL,
	[alit6n] [int] NULL,
	[itnn] [int] NULL,
	[yamum] [int] NULL,
	[yymum] [int] NULL,
	[ymu6m] [int] NULL,
	[lmu6m] [int] NULL,
	[almu6m] [int] NULL,
	[mumm] [int] NULL,
	[yamun] [int] NULL,
	[yymun] [int] NULL,
	[ymu6n] [int] NULL,
	[lmu6n] [int] NULL,
	[almu6n] [int] NULL,
	[munn] [int] NULL,
	[yyvam] [int] NULL,
	[vamm] [int] NULL,
	[yyvan] [int] NULL,
	[vann] [int] NULL,
	[pmatm] [int] NULL,
	[pmatn] [int] NULL,
	[pmaty] [int] NULL,
	[lmatm] [int] NULL,
	[lmatn] [int] NULL,
	[lmaty] [int] NULL,
	[matm] [int] NULL,
	[matn] [int] NULL,
	[maty] [int] NULL,
	[pma1m] [int] NULL,
	[pma1n] [int] NULL,
	[pma2m] [int] NULL,
	[pma2n] [int] NULL,
	[pma3m] [int] NULL,
	[pma3n] [int] NULL,
	[pma45m] [int] NULL,
	[pma45n] [int] NULL,
	[pma6m] [int] NULL,
	[pma6n] [int] NULL,
	[pma7m] [int] NULL,
	[pma7n] [int] NULL,
	[lma1m] [int] NULL,
	[lma1n] [int] NULL,
	[lma2m] [int] NULL,
	[lma2n] [int] NULL,
	[lma3m] [int] NULL,
	[lma3n] [int] NULL,
	[lma45m] [int] NULL,
	[lma45n] [int] NULL,
	[lma6m] [int] NULL,
	[lma6n] [int] NULL,
	[lma7m] [int] NULL,
	[lma7n] [int] NULL,
	[fy1m] [int] NULL,
	[fy1n] [int] NULL,
	[fy2m] [int] NULL,
	[fy2n] [int] NULL,
	[fy3m] [int] NULL,
	[fy3n] [int] NULL,
	[fy45m] [int] NULL,
	[fy45n] [int] NULL,
	[fy6m] [int] NULL,
	[fy6n] [int] NULL,
	[fy7m] [int] NULL,
	[fy7n] [int] NULL,
	[ke1m] [int] NULL,
	[ke1n] [int] NULL,
	[ke2m] [int] NULL,
	[ke2n] [int] NULL,
	[ke3m] [int] NULL,
	[ke3n] [int] NULL,
	[ke45m] [int] NULL,
	[ke45n] [int] NULL,
	[ke6m] [int] NULL,
	[ke6n] [int] NULL,
	[ke7m] [int] NULL,
	[ke7n] [int] NULL,
	[bi1m] [int] NULL,
	[bi1n] [int] NULL,
	[bi2m] [int] NULL,
	[bi2n] [int] NULL,
	[bi3m] [int] NULL,
	[bi3n] [int] NULL,
	[bi45m] [int] NULL,
	[bi45n] [int] NULL,
	[bi6m] [int] NULL,
	[bi6n] [int] NULL,
	[bi7m] [int] NULL,
	[bi7n] [int] NULL,
	[mt1m] [int] NULL,
	[mt1n] [int] NULL,
	[mt2m] [int] NULL,
	[mt2n] [int] NULL,
	[mt3m] [int] NULL,
	[mt3n] [int] NULL,
	[mt45m] [int] NULL,
	[mt45n] [int] NULL,
	[mt6m] [int] NULL,
	[mt6n] [int] NULL,
	[mt7m] [int] NULL,
	[mt7n] [int] NULL,
	[soma2m] [int] NULL,
	[soma2n] [int] NULL,
	[soma3m] [int] NULL,
	[soma3n] [int] NULL,
	[sofy2m] [int] NULL,
	[sofy2n] [int] NULL,
	[sofy3m] [int] NULL,
	[sofy3n] [int] NULL,
	[soke2m] [int] NULL,
	[soke2n] [int] NULL,
	[soke3m] [int] NULL,
	[soke3n] [int] NULL,
	[sobi2m] [int] NULL,
	[sobi2n] [int] NULL,
	[sobi3m] [int] NULL,
	[sobi3n] [int] NULL,
	[somt2m] [int] NULL,
	[somt2n] [int] NULL,
	[somt3m] [int] NULL,
	[somt3n] [int] NULL,
	[sotek2m] [int] NULL,
	[sotek2n] [int] NULL,
	[sotek3m] [int] NULL,
	[sotek3n] [int] NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [varchar](3) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_8_Korkeakouluopiskelijat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_8_Korkeakouluopiskelijat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aidinkieli_versio1x] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[kotikunta] [nvarchar](6) NULL,
	[kotikunta1x] [nvarchar](3) NULL,
	[kotikunta2x] [nvarchar](3) NULL,
	[kansalaisuus_versio2] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](10) NULL,
	[jarjestys_kirjoihintulovuosi] [int] NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[opiskelijan_olo_tamm] [nvarchar](2) NULL,
	[opiskelijan_olo_syys] [nvarchar](2) NULL,
	[rahoituslahde] [nvarchar](2) NULL,
	[opiskelijan_fte_tieto] [nvarchar](2) NULL,
	[kirjoihintulovuosi_korkeakoulusektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva] [nvarchar](4) NULL,
	[lukumaara] [int] NULL,
	[lkm_op0] [int] NULL,
	[lkm_op1_14] [int] NULL,
	[lkm_op15_29] [int] NULL,
	[lkm_op30_44] [int] NULL,
	[lkm_op45_59] [int] NULL,
	[lkm_op60_74] [int] NULL,
	[lkm_op75_89] [int] NULL,
	[lkm_op90_104] [int] NULL,
	[lkm_op105_119] [int] NULL,
	[lkm_op120_] [int] NULL,
	[vahintaan_55_op_suorittanut] [nvarchar](2) NULL,
	[op_edellinen_syksy] [int] NULL,
	[op_edellinen_kevat] [int] NULL,
	[op_kertyma_edel_lkv_loppu] [int] NULL,
	[tutkinto_amk] [nvarchar](3) NULL,
	[koulutusohjelma_amk] [nvarchar](4) NULL,
	[suuntautumisvaihtoehto_amk] [nvarchar](5) NULL,
	[koulutustyyppi] [nvarchar](2) NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[lkm_lasnalk] [int] NULL,
	[lkm_poissalk] [int] NULL,
	[op_suoritettavien_laajuus] [int] NULL,
	[kirjoihintulovuosi_tutkinto] [nvarchar](4) NULL,
	[kirjoihintulokausi_tutkinto] [nvarchar](2) NULL,
	[ensisijainen_opintooikeus] [nvarchar](2) NULL,
	[tilauskoulutuksen_sijaintimaa] [nvarchar](2) NULL,
	[tutkinto_yo] [nvarchar](3) NULL,
	[koulutusohjelma_yo] [nvarchar](4) NULL,
	[paaaine_yo] [nvarchar](4) NULL,
	[yliopisto] [nvarchar](2) NULL,
	[tiedekunta_yo] [nvarchar](2) NULL,
	[uusi_vanha_opiskelija] [nvarchar](2) NULL,
	[tutkintooikeusvuosi] [nvarchar](4) NULL,
	[opiskelumuoto] [nvarchar](2) NULL,
	[opettajankelpoisuus] [nvarchar](2) NULL,
	[avoinvayla] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](4) NULL,
	[aloittaneet] [int] NULL,
	[aloittaneet_kirjoihintulovuosi] [int] NULL,
	[aloittaneet_korkeakoulusektori] [int] NULL,
	[aloittaneet_korkeakoulusektori_lasnaoleva] [int] NULL,
	[aloittaneet_sektori] [int] NULL,
	[aloittaneet_sektori_lasnaoleva] [int] NULL,
	[aloittaneet_korkeakoulu] [int] NULL,
	[aloittaneet_korkeakoulu_lasnaoleva] [int] NULL,
	[aloittaneet_opintoala] [int] NULL,
	[aloittaneet_opintoala_lasnaoleva] [int] NULL,
	[opiskelijat] [int] NULL,
	[opiskelijat_lasna] [int] NULL,
	[opiskelijat_fte] [decimal](18, 1) NULL,
	[koulutuslaji_OKM_avain] [nvarchar](2) NULL,
	[koulutusryhma_avain] [varchar](2) NULL,
	[ikaryhma1_avain] [varchar](10) NULL,
	[ikaryhma2_avain] [varchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_8_Korkeakouluopiskelijat_joinavaimet]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_8_Korkeakouluopiskelijat_joinavaimet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_8_Korkeakouluopiskelijat_joinavaimet](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[oppilaitos_sijaintikuntakoodi_join] [nvarchar](3) NULL,
	[oppilaitos_sijaintikuntakoodi_historia_join] [nvarchar](3) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_sijaintikuntakoodi_join] [nvarchar](3) NULL,
	[koulutuksen_jarjestaja_sijaintikuntakoodi_historia_join] [nvarchar](3) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aidinkieli_versio1x] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymavuosi_join] [nvarchar](4) NULL,
	[kotikunta] [nvarchar](6) NULL,
	[kotikunta1x] [nvarchar](3) NULL,
	[kotikunta2x] [nvarchar](3) NULL,
	[kansalaisuus_versio2] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](10) NULL,
	[jarjestys_kirjoihintulovuosi] [int] NULL,
	[kirjoihintulovuosi_join] [nvarchar](10) NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[kirjoihintulokausi_join] [nvarchar](6) NULL,
	[opiskelijan_olo_tamm] [nvarchar](2) NULL,
	[opiskelijan_olo_syys] [nvarchar](2) NULL,
	[rahoituslahde] [nvarchar](2) NULL,
	[opiskelijan_fte_tieto] [nvarchar](2) NULL,
	[kirjoihintulovuosi_korkeakoulusektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva_join] [nvarchar](4) NULL,
	[lukumaara] [int] NULL,
	[lkm_op0] [int] NULL,
	[lkm_op1_14] [int] NULL,
	[lkm_op15_29] [int] NULL,
	[lkm_op30_44] [int] NULL,
	[lkm_op45_59] [int] NULL,
	[lkm_op60_74] [int] NULL,
	[lkm_op75_89] [int] NULL,
	[lkm_op90_104] [int] NULL,
	[lkm_op105_119] [int] NULL,
	[lkm_op120_] [int] NULL,
	[vahintaan_55_op_suorittanut] [nvarchar](2) NULL,
	[op_edellinen_syksy] [int] NULL,
	[op_edellinen_kevat] [int] NULL,
	[op_kertyma_edel_lkv_loppu] [int] NULL,
	[tutkinto_amk] [nvarchar](3) NULL,
	[koulutusohjelma_amk] [nvarchar](4) NULL,
	[suuntautumisvaihtoehto_amk] [nvarchar](5) NULL,
	[koulutustyyppi] [nvarchar](2) NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[lkm_lasnalk] [int] NULL,
	[lkm_poissalk] [int] NULL,
	[op_suoritettavien_laajuus] [int] NULL,
	[kirjoihintulovuosi_tutkinto] [nvarchar](4) NULL,
	[kirjoihintulovuosi_tutkinto_join] [nvarchar](4) NULL,
	[kirjoihintulokausi_tutkinto] [nvarchar](2) NULL,
	[kirjoihintulokausi_tutkinto_join] [nvarchar](6) NULL,
	[ensisijainen_opintooikeus] [nvarchar](2) NULL,
	[tilauskoulutuksen_sijaintimaa] [nvarchar](2) NULL,
	[tutkinto_yo] [nvarchar](3) NULL,
	[koulutusohjelma_yo] [nvarchar](4) NULL,
	[paaaine_yo] [nvarchar](4) NULL,
	[yliopisto] [nvarchar](2) NULL,
	[tiedekunta_yo] [nvarchar](2) NULL,
	[uusi_vanha_opiskelija] [nvarchar](2) NULL,
	[tutkintooikeusvuosi] [nvarchar](4) NULL,
	[tutkintooikeusvuosi_join] [nvarchar](4) NULL,
	[opiskelumuoto] [nvarchar](2) NULL,
	[opettajankelpoisuus] [nvarchar](2) NULL,
	[avoinvayla] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](4) NULL,
	[aloittaneet] [int] NULL,
	[aloittaneet_kirjoihintulovuosi] [int] NULL,
	[aloittaneet_korkeakoulusektori] [int] NULL,
	[aloittaneet_korkeakoulusektori_lasnaoleva] [int] NULL,
	[aloittaneet_sektori] [int] NULL,
	[aloittaneet_sektori_lasnaoleva] [int] NULL,
	[aloittaneet_korkeakoulu] [int] NULL,
	[aloittaneet_korkeakoulu_lasnaoleva] [int] NULL,
	[aloittaneet_opintoala] [int] NULL,
	[aloittaneet_opintoala_lasnaoleva] [int] NULL,
	[opiskelijat] [int] NULL,
	[opiskelijat_lasna] [int] NULL,
	[opiskelijat_fte] [decimal](18, 1) NULL,
	[koulutuslaji_OKM_avain] [nvarchar](2) NULL,
	[koulutusryhma_avain] [varchar](2) NULL,
	[ikaryhma1_avain] [varchar](10) NULL,
	[ikaryhma2_avain] [varchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_9_Korkeakoulututkinnot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_9_Korkeakoulututkinnot](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[opintoala1995] [nvarchar](2) NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aidinkieli_versio1x] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[kotikunta] [nvarchar](3) NULL,
	[kotikunta1x] [nvarchar](3) NULL,
	[kansalaisuus_versio2] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](10) NULL,
	[jarjestys_kirjoihintulovuosi] [int] NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suorituslukukausi] [nvarchar](2) NULL,
	[rahoituslahde] [nvarchar](2) NULL,
	[kirjoihintulovuosi_korkeakoulusektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva] [nvarchar](4) NULL,
	[lukumaara] [int] NULL,
	[tutkinto_amk] [nvarchar](3) NULL,
	[koulutusohjelma_amk] [nvarchar](4) NULL,
	[suuntautumisvaihtoehto_amk] [nvarchar](5) NULL,
	[koulutustyyppi] [nvarchar](2) NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[lkm_lasnalk] [int] NULL,
	[lkm_poissalk] [int] NULL,
	[op_suoritettavien_laajuus] [int] NULL,
	[kirjoihintulovuosi_tutkinto] [nvarchar](4) NULL,
	[kirjoihintulokausi_tutkinto] [nvarchar](2) NULL,
	[op_amk_yhteensa] [int] NULL,
	[op_amk_yleissiv_amm_opplait] [int] NULL,
	[op_amk_muualla] [int] NULL,
	[op_amk_oma_amk] [int] NULL,
	[op_amk_muu_amk] [int] NULL,
	[op_amk_yliopistoissa] [int] NULL,
	[op_amk_ulkomailla] [int] NULL,
	[tilauskoulutuksen_sijaintimaa] [nvarchar](2) NULL,
	[tutkinto_yo] [nvarchar](3) NULL,
	[koulutusohjelma_yo] [nvarchar](4) NULL,
	[paaaine_yo] [nvarchar](4) NULL,
	[tiedekunta_yo] [nvarchar](2) NULL,
	[opiskelumuoto] [nvarchar](2) NULL,
	[opettajankelpoisuus] [nvarchar](2) NULL,
	[op_yo_yhteensa] [int] NULL,
	[op_yo_ulkomailla] [int] NULL,
	[op_yo_muualla] [int] NULL,
	[op_yo_oma_yo] [int] NULL,
	[op_yo_avoimessa] [int] NULL,
	[op_yo_muu_yo] [int] NULL,
	[op_yo_ammattikorkeakouluissa] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](4) NULL,
	[tutkinnot] [int] NULL,
	[koulutuslaji_OKM_avain] [nvarchar](2) NULL,
	[koulutusryhma_avain] [varchar](2) NULL,
	[ikaryhma1_avain] [varchar](10) NULL,
	[ikaryhma2_avain] [varchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_2_9_Korkeakoulututkinnot_joinavaimet]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_9_Korkeakoulututkinnot_joinavaimet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_2_9_Korkeakoulututkinnot_joinavaimet](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[oppilaitos_sijaintikuntakoodi_join] [nvarchar](3) NULL,
	[oppilaitos_sijaintikuntakoodi_historia_join] [nvarchar](3) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_sijaintikuntakoodi_join] [nvarchar](3) NULL,
	[koulutuksen_jarjestaja_sijaintikuntakoodi_historia_join] [nvarchar](3) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusluokitus_join] [nvarchar](10) NULL,
	[opintoala1995] [nvarchar](2) NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aidinkieli_versio1x] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymavuosi_join] [nvarchar](4) NULL,
	[kotikunta] [nvarchar](3) NULL,
	[kotikunta1x] [nvarchar](3) NULL,
	[kansalaisuus_versio2] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](10) NULL,
	[jarjestys_kirjoihintulovuosi] [int] NULL,
	[kirjoihintulovuosi_join] [nvarchar](10) NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[kirjoihintulokausi_join] [nvarchar](12) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suoritusvuosi_join] [nvarchar](4) NULL,
	[tutkinnon_suorituslukukausi] [nvarchar](2) NULL,
	[tutkinnon_suorituslukukausi_join] [nvarchar](6) NULL,
	[rahoituslahde] [nvarchar](2) NULL,
	[kirjoihintulovuosi_korkeakoulusektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_join] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva_join] [nvarchar](4) NULL,
	[lukumaara] [int] NULL,
	[tutkinto_amk] [nvarchar](3) NULL,
	[koulutusohjelma_amk] [nvarchar](4) NULL,
	[suuntautumisvaihtoehto_amk] [nvarchar](5) NULL,
	[koulutustyyppi] [nvarchar](2) NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[lkm_lasnalk] [int] NULL,
	[lkm_poissalk] [int] NULL,
	[op_suoritettavien_laajuus] [int] NULL,
	[kirjoihintulovuosi_tutkinto] [nvarchar](4) NULL,
	[kirjoihintulovuosi_tutkinto_join] [nvarchar](4) NULL,
	[kirjoihintulokausi_tutkinto] [nvarchar](2) NULL,
	[kirjoihintulokausi_tutkinto_join] [nvarchar](6) NULL,
	[op_amk_yhteensa] [int] NULL,
	[op_amk_yleissiv_amm_opplait] [int] NULL,
	[op_amk_muualla] [int] NULL,
	[op_amk_oma_amk] [int] NULL,
	[op_amk_muu_amk] [int] NULL,
	[op_amk_yliopistoissa] [int] NULL,
	[op_amk_ulkomailla] [int] NULL,
	[tilauskoulutuksen_sijaintimaa] [nvarchar](2) NULL,
	[tutkinto_yo] [nvarchar](3) NULL,
	[koulutusohjelma_yo] [nvarchar](4) NULL,
	[paaaine_yo] [nvarchar](4) NULL,
	[tiedekunta_yo] [nvarchar](2) NULL,
	[opiskelumuoto] [nvarchar](2) NULL,
	[opettajankelpoisuus] [nvarchar](2) NULL,
	[op_yo_yhteensa] [int] NULL,
	[op_yo_ulkomailla] [int] NULL,
	[op_yo_muualla] [int] NULL,
	[op_yo_oma_yo] [int] NULL,
	[op_yo_avoimessa] [int] NULL,
	[op_yo_muu_yo] [int] NULL,
	[op_yo_ammattikorkeakouluissa] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](4) NULL,
	[tutkinnot] [int] NULL,
	[koulutuslaji_OKM_avain] [nvarchar](2) NULL,
	[koulutusryhma_avain] [varchar](2) NULL,
	[ikaryhma1_avain] [varchar](10) NULL,
	[ikaryhma2_avain] [varchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppisopimuskoulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymakuukausi] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[lukumaara] [int] NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](2) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](4) NULL,
	[aloittaneet] [int] NULL,
	[opiskelijat] [int] NULL,
	[koulutuslaji_OKM_avain] [nvarchar](2) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppisopimuskoulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymakuukausi] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suorituskuukausi] [nvarchar](2) NULL,
	[lukumaara] [int] NULL,
	[tutkinnon_toteuma] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](4) NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](2) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus] [nvarchar](2) NULL,
	[suoritusika] [decimal](18, 6) NULL,
	[jarjestys_suoritusika] [int] NULL,
	[suoritusaika] [decimal](18, 6) NULL,
	[jarjestys_suoritusaika] [int] NULL,
	[tutkinnot] [int] NULL,
	[koulutuslaji_OKM_avain] [nvarchar](2) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppisryh] [nvarchar](8) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](10) NULL,
	[ika] [nvarchar](7) NULL,
	[opetushallinnon_koulutusala] [nvarchar](1) NULL,
	[opetushallinnon_koulutusaste] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](1) NULL,
	[koulutuksen_sijaintimaakunta] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio3] [nvarchar](2) NULL,
	[ammattiasema] [nvarchar](1) NULL,
	[opiskelijat] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_3_1b_Oppisopimus_koulutuksen_kesto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_3_1b_Oppisopimus_koulutuksen_kesto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_3_1b_Oppisopimus_koulutuksen_kesto](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppisryh] [nvarchar](8) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](10) NULL,
	[ika] [nvarchar](7) NULL,
	[opetushallinnon_koulutusala] [nvarchar](1) NULL,
	[opetushallinnon_koulutusaste] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](1) NULL,
	[koulutuksen_sijaintimaakunta] [nvarchar](2) NULL,
	[koulutuksen_arvioitu_kesto] [nvarchar](2) NULL,
	[koulutuksen_toteutunut_kesto] [nvarchar](2) NULL,
	[opiskelijat] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_3_2_Oppisopimus_jatko_opinnot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_3_2_Oppisopimus_jatko_opinnot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_3_2_Oppisopimus_jatko_opinnot](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppisryh] [nvarchar](8) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](10) NULL,
	[ika] [nvarchar](7) NULL,
	[opetushallinnon_koulutusala] [nvarchar](1) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](1) NULL,
	[koulutuksen_sijaintimaakunta] [nvarchar](2) NULL,
	[jatko_opintojen_koulutusaste] [nvarchar](2) NULL,
	[opiskelijat] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[jatko_opiskelu] [nvarchar](2) NULL,
	[koulutusaste2002] [nvarchar](2) NULL,
	[jatko_opiskelun_koulutusala] [nvarchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutustyyppi] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymakuukausi] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[kirjoihintulovuosi_korkeakoulu] [nvarchar](4) NULL,
	[kirjoihintulokausi_korkeakoulu] [nvarchar](2) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suorituskuukausi] [nvarchar](2) NULL,
	[lukumaara] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](4) NULL,
	[suoritusika] [decimal](18, 6) NULL,
	[jarjestys_suoritusika] [int] NULL,
	[suoritusaika] [decimal](18, 6) NULL,
	[jarjestys_suoritusaika] [int] NULL,
	[suoritusaika_kk] [decimal](18, 6) NULL,
	[jarjestys_suoritusaika_kk] [int] NULL,
	[tutkinnot] [int] NULL,
	[koulutuslaji_OKM_avain] [nvarchar](2) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[asuinmaakunta] [nvarchar](2) NULL,
	[kansalaisuus_versio1] [nvarchar](1) NULL,
	[pohjoismaa] [nvarchar](1) NULL,
	[eumaa] [nvarchar](1) NULL,
	[etamaa] [nvarchar](1) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suoritusmaakunta] [nvarchar](2) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusmuoto] [nvarchar](1) NULL,
	[oppisopimuskoulutus] [nvarchar](1) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] [nvarchar](1) NULL,
	[paaasiallinen_toiminta_versio6] [nvarchar](2) NULL,
	[ammattiluokitus_2001] [nvarchar](2) NULL,
	[ammattiluokitus_2010] [nvarchar](2) NULL,
	[tyossakayntitilaston_tyonantajasektori] [nvarchar](2) NULL,
	[lukumaara] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[vaeston_ika_1v] [nvarchar](10) NULL,
	[vaeston_ika_5v] [nvarchar](10) NULL,
	[tutkinnon_suoritusika_1v] [nvarchar](10) NULL,
	[tutkinnon_ika_1v] [nvarchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_4_21_Vaestoennuste]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_4_21_Vaestoennuste]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_4_21_Vaestoennuste](
	[ennv] [varchar](4) NULL,
	[tilvaskun] [varchar](3) NULL,
	[sp] [varchar](1) NULL,
	[ika2] [varchar](3) NULL,
	[lkm] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[asuinmaakunta] [nvarchar](2) NULL,
	[aikuisopiskelija] [nvarchar](2) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suorittamismaakunta] [nvarchar](2) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[valiaikainen_amk] [nvarchar](2) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusmuoto] [nvarchar](2) NULL,
	[oppisopimuskoulutus] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio2] [nvarchar](2) NULL,
	[maassaolo] [nvarchar](2) NULL,
	[ammattiasema] [nvarchar](2) NULL,
	[ammattiluokitus_2010] [nvarchar](5) NULL,
	[lukumaara] [int] NULL,
	[eu_etamaat_avain] [nvarchar](2) NULL,
	[aikielir1_avain] [nvarchar](2) NULL,
	[kansalaisuus_maanosa_avain] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[tutkintolaji_tyollistymiseen] [nvarchar](2) NULL,
	[sijoittuminen_1v_tutkinnon_jalkeen] [int] NULL,
	[sijoittuminen_3v_tutkinnon_jalkeen] [int] NULL,
	[sijoittuminen_5v_tutkinnon_jalkeen] [int] NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_okm] [nvarchar](2) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sukupuoli_koodi] [nvarchar](10) NULL,
	[aidinkieli_versio1_koodi] [nvarchar](2) NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[koulutusluokitus_avain] [nvarchar](6) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[oppisopimuskoulutus_koodi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_koodi] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus_amm_koodi] [nvarchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[ika_avain] [nvarchar](10) NULL,
	[henkiloiden_lkm] [int] NULL,
	[lulkm] [int] NULL,
	[lukoulk] [varchar](6) NULL,
	[lusuorv] [varchar](4) NULL,
	[luaikoul] [varchar](1) NULL,
	[lu_ika] [int] NULL,
	[lu_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammlkm] [int] NULL,
	[ammkoulk] [varchar](6) NULL,
	[ammsuorv] [varchar](4) NULL,
	[ammoppis] [varchar](1) NULL,
	[ammtutklaja] [varchar](1) NULL,
	[ammtutktav] [varchar](1) NULL,
	[amm_ika] [int] NULL,
	[amm_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[opistlkm] [int] NULL,
	[opistkoulk] [varchar](6) NULL,
	[opistsuorv] [varchar](4) NULL,
	[opist_ika] [int] NULL,
	[opist_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammkalkm] [int] NULL,
	[ammkakoulk] [varchar](6) NULL,
	[ammkasuorv] [varchar](4) NULL,
	[ammka_ika] [int] NULL,
	[ammka_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[amklkm] [int] NULL,
	[amkkoulk] [varchar](6) NULL,
	[amksuorv] [varchar](4) NULL,
	[amkaikoul] [varchar](1) NULL,
	[amk_ika] [int] NULL,
	[amk_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[akklkm] [int] NULL,
	[akkkoulk] [varchar](6) NULL,
	[akksuorv] [varchar](4) NULL,
	[akk_ika] [int] NULL,
	[akk_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ylamklkm] [int] NULL,
	[ylamkkoulk] [varchar](6) NULL,
	[ylamksuorv] [varchar](4) NULL,
	[ylamk_ika] [int] NULL,
	[ylamk_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ykklkm] [int] NULL,
	[ykkkoulk] [varchar](6) NULL,
	[ykksuorv] [varchar](4) NULL,
	[ykk_ika] [int] NULL,
	[ykk_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[laakerlkm] [int] NULL,
	[laakerkoulk] [varchar](6) NULL,
	[laakersuorv] [varchar](4) NULL,
	[laaker_ika] [int] NULL,
	[laaker_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[lislkm] [int] NULL,
	[liskoulk] [varchar](6) NULL,
	[lissuorv] [varchar](4) NULL,
	[lis_ika] [int] NULL,
	[lis_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[tohtlkm] [int] NULL,
	[tohtkoulk] [varchar](6) NULL,
	[tohtsuorv] [varchar](4) NULL,
	[toht_ika] [int] NULL,
	[toht_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sukupuoli_koodi] [nvarchar](10) NULL,
	[aidinkieli_versio1_koodi] [nvarchar](2) NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[koulutusluokitus_avain] [nvarchar](6) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[oppisopimuskoulutus_koodi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_koodi] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus_amm_koodi] [nvarchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[ika_avain] [nvarchar](10) NULL,
	[henkiloiden_lkm] [int] NULL,
	[lulkm] [varchar](2) NULL,
	[lukoulk] [varchar](6) NULL,
	[lusuorv] [varchar](4) NULL,
	[luaikoul] [varchar](1) NULL,
	[lu_ika] [int] NULL,
	[lu_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammlkm] [int] NULL,
	[ammkoulk] [varchar](6) NULL,
	[ammsuorv] [varchar](4) NULL,
	[ammoppis] [varchar](1) NULL,
	[ammtutklaja] [varchar](1) NULL,
	[ammtutktav] [varchar](1) NULL,
	[amm_ika] [int] NULL,
	[amm_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[opistlkm] [int] NULL,
	[opistkoulk] [varchar](6) NULL,
	[opistsuorv] [varchar](4) NULL,
	[opist_ika] [int] NULL,
	[opist_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammkalkm] [int] NULL,
	[ammkakoulk] [varchar](6) NULL,
	[ammkasuorv] [varchar](4) NULL,
	[ammka_ika] [int] NULL,
	[ammka_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[amklkm] [int] NULL,
	[amkkoulk] [varchar](6) NULL,
	[amksuorv] [varchar](4) NULL,
	[amkaikoul] [varchar](1) NULL,
	[amk_ika] [int] NULL,
	[amk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[akklkm] [int] NULL,
	[akkkoulk] [varchar](6) NULL,
	[akksuorv] [varchar](4) NULL,
	[akk_ika] [int] NULL,
	[akk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ylamklkm] [int] NULL,
	[ylamkkoulk] [varchar](6) NULL,
	[ylamksuorv] [varchar](4) NULL,
	[ylamk_ika] [int] NULL,
	[ylamk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ykklkm] [int] NULL,
	[ykkkoulk] [varchar](6) NULL,
	[ykksuorv] [varchar](4) NULL,
	[ykk_ika] [int] NULL,
	[ykk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[laakerlkm] [int] NULL,
	[laakerkoulk] [varchar](6) NULL,
	[laakersuorv] [varchar](4) NULL,
	[laaker_ika] [int] NULL,
	[laaker_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[lislkm] [int] NULL,
	[liskoulk] [varchar](6) NULL,
	[lissuorv] [varchar](4) NULL,
	[lis_ika] [int] NULL,
	[lis_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[tohtlkm] [int] NULL,
	[tohtkoulk] [varchar](6) NULL,
	[tohtsuorv] [varchar](4) NULL,
	[toht_ika] [int] NULL,
	[toht_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_4_9_Vaestorakenne_kunnittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_4_9_Vaestorakenne_kunnittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_4_9_Vaestorakenne_kunnittain](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[kotikunta] [nvarchar](3) NULL,
	[aidinkieli_versio2] [nvarchar](2) NULL,
	[kansalaisuus_versio1] [nvarchar](2) NULL,
	[maanosa] [nvarchar](2) NULL,
	[pohjoismaa] [nvarchar](2) NULL,
	[eumaa] [nvarchar](2) NULL,
	[etamaa] [nvarchar](2) NULL,
	[lkm_0v] [int] NULL,
	[lkm_1v] [int] NULL,
	[lkm_2v] [int] NULL,
	[lkm_3v] [int] NULL,
	[lkm_4v] [int] NULL,
	[lkm_5v] [int] NULL,
	[lkm_6v] [int] NULL,
	[lkm_7v] [int] NULL,
	[lkm_8v] [int] NULL,
	[lkm_9v] [int] NULL,
	[lkm_10v] [int] NULL,
	[lkm_11v] [int] NULL,
	[lkm_12v] [int] NULL,
	[lkm_13v] [int] NULL,
	[lkm_14v] [int] NULL,
	[lkm_15v] [int] NULL,
	[lkm_16v] [int] NULL,
	[lkm_17v] [int] NULL,
	[lkm_18v] [int] NULL,
	[lkm_19v] [int] NULL,
	[lkm_20v] [int] NULL,
	[lkm_21v] [int] NULL,
	[lkm_22v] [int] NULL,
	[lkm_23v] [int] NULL,
	[lkm_24v] [int] NULL,
	[lkm_25v] [int] NULL,
	[lkm_26v] [int] NULL,
	[lkm_27v] [int] NULL,
	[lkm_28v] [int] NULL,
	[lkm_29v] [int] NULL,
	[lkm_30v] [int] NULL,
	[lkm_31v] [int] NULL,
	[lkm_32v] [int] NULL,
	[lkm_33v] [int] NULL,
	[lkm_34v] [int] NULL,
	[lkm_35v] [int] NULL,
	[lkm_36v] [int] NULL,
	[lkm_37v] [int] NULL,
	[lkm_38v] [int] NULL,
	[lkm_39v] [int] NULL,
	[lkm_40v] [int] NULL,
	[lkm_41v] [int] NULL,
	[lkm_42v] [int] NULL,
	[lkm_43v] [int] NULL,
	[lkm_44v] [int] NULL,
	[lkm_45v] [int] NULL,
	[lkm_46v] [int] NULL,
	[lkm_47v] [int] NULL,
	[lkm_48v] [int] NULL,
	[lkm_49v] [int] NULL,
	[lkm_50v] [int] NULL,
	[lkm_51v] [int] NULL,
	[lkm_52v] [int] NULL,
	[lkm_53v] [int] NULL,
	[lkm_54v] [int] NULL,
	[lkm_55v] [int] NULL,
	[lkm_56v] [int] NULL,
	[lkm_57v] [int] NULL,
	[lkm_58v] [int] NULL,
	[lkm_59v] [int] NULL,
	[lkm_60v] [int] NULL,
	[lkm_61v] [int] NULL,
	[lkm_62v] [int] NULL,
	[lkm_63v] [int] NULL,
	[lkm_64v] [int] NULL,
	[lkm_65v] [int] NULL,
	[lkm_66v] [int] NULL,
	[lkm_67v] [int] NULL,
	[lkm_68v] [int] NULL,
	[lkm_69v] [int] NULL,
	[lkm_70v] [int] NULL,
	[lkm_71v] [int] NULL,
	[lkm_72v] [int] NULL,
	[lkm_73v] [int] NULL,
	[lkm_74v] [int] NULL,
	[lkm_75v] [int] NULL,
	[lkm_76v] [int] NULL,
	[lkm_77v] [int] NULL,
	[lkm_78v] [int] NULL,
	[lkm_79v] [int] NULL,
	[lkm_80v] [int] NULL,
	[lkm_81v] [int] NULL,
	[lkm_82v] [int] NULL,
	[lkm_83v] [int] NULL,
	[lkm_84v] [int] NULL,
	[lkm_85v] [int] NULL,
	[lkm_86v] [int] NULL,
	[lkm_87v] [int] NULL,
	[lkm_88v] [int] NULL,
	[lkm_89v] [int] NULL,
	[lkm_90v] [int] NULL,
	[lkm_91v] [int] NULL,
	[lkm_92v] [int] NULL,
	[lkm_93v] [int] NULL,
	[lkm_94v] [int] NULL,
	[lkm_95v] [int] NULL,
	[lkm_96v] [int] NULL,
	[lkm_97v] [int] NULL,
	[lkm_98v] [int] NULL,
	[lkm_99v] [int] NULL,
	[lkm_100v_ja_vanh] [int] NULL,
	[lukumaara] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[aidinkieli] [nvarchar](2) NULL,
	[ika0_24_lkm] [decimal](38, 0) NULL,
	[ika0_24_ka] [decimal](38, 6) NULL,
	[ika0_100_lkm] [decimal](38, 0) NULL,
	[ika0_100_ka] [decimal](38, 6) NULL,
	[ika6_lkm] [decimal](18, 0) NULL,
	[ika6_ka] [decimal](24, 6) NULL,
	[ika7_lkm] [decimal](18, 0) NULL,
	[ika7_ka] [decimal](24, 6) NULL,
	[ika7_12_lkm] [decimal](23, 0) NULL,
	[ika7_12_ka] [decimal](29, 6) NULL,
	[ika13_15_lkm] [decimal](20, 0) NULL,
	[ika13_15_ka] [decimal](26, 6) NULL,
	[ika15_64_lkm] [decimal](38, 0) NULL,
	[ika15_64_ka] [decimal](38, 6) NULL,
	[ika15_100_lkm] [decimal](38, 0) NULL,
	[ika15_100_ka] [decimal](38, 6) NULL,
	[ika16_lkm] [decimal](18, 0) NULL,
	[ika16_ka] [decimal](24, 6) NULL,
	[ika16_18_lkm] [decimal](20, 0) NULL,
	[ika16_18_ka] [decimal](26, 6) NULL,
	[ika16_19_lkm] [decimal](21, 0) NULL,
	[ika16_19_ka] [decimal](27, 6) NULL,
	[ika16_21_lkm] [decimal](23, 0) NULL,
	[ika16_21_ka] [decimal](29, 6) NULL,
	[ika19_lkm] [decimal](18, 0) NULL,
	[ika19_ka] [decimal](24, 6) NULL,
	[ika19_20_lkm] [decimal](19, 0) NULL,
	[ika19_20_ka] [decimal](25, 6) NULL,
	[ika19_21_lkm] [decimal](20, 0) NULL,
	[ika19_21_ka] [decimal](26, 6) NULL,
	[ika20_24_lkm] [decimal](22, 0) NULL,
	[ika20_24_ka] [decimal](28, 6) NULL,
	[ika20_29_lkm] [decimal](27, 0) NULL,
	[ika20_29_ka] [decimal](33, 6) NULL,
	[ika25_lkm] [decimal](18, 0) NULL,
	[ika25_ka] [decimal](24, 6) NULL,
	[ika25_34_lkm] [decimal](27, 0) NULL,
	[ika25_34_ka] [decimal](33, 6) NULL,
	[ika25_64_lkm] [decimal](38, 0) NULL,
	[ika25_64_ka] [decimal](38, 6) NULL,
	[ika25_100_lkm] [decimal](38, 0) NULL,
	[ika25_100_ka] [decimal](38, 6) NULL,
	[ika30_lkm] [decimal](18, 0) NULL,
	[ika30_ka] [decimal](24, 6) NULL,
	[ika30_34_lkm] [decimal](22, 0) NULL,
	[ika30_34_ka] [decimal](28, 6) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [nvarchar](10) NULL,
	[tieteenala_avain] [nvarchar](10) NULL,
	[virkaryhma_avain] [nvarchar](10) NULL,
	[ika_avain] [nvarchar](10) NULL,
	[sukupuoli_avain] [nvarchar](10) NULL,
	[tutkintotaso_avain] [nvarchar](10) NULL,
	[lkm_tutkimushenkilokunta] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [nvarchar](10) NULL,
	[tieteenala_avain] [nvarchar](10) NULL,
	[virkaryhma_avain] [nvarchar](10) NULL,
	[ika_avain] [nvarchar](10) NULL,
	[sukupuoli_avain] [nvarchar](10) NULL,
	[tutkintotaso_avain] [nvarchar](10) NULL,
	[lkm_tutkimustyovuodet] [decimal](8, 4) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [nvarchar](10) NULL,
	[tieteenala_avain] [nvarchar](10) NULL,
	[Tutkimusmenot_yhteensa] [decimal](8, 3) NULL,
	[Kayttomenot_yhteensa] [decimal](8, 3) NULL,
	[Kayttomenoista_palkat] [decimal](8, 3) NULL,
	[Kayttomenoista_apurahat] [decimal](8, 3) NULL,
	[Laskettu_muutkayttomenot] [decimal](10, 3) NULL,
	[Menot_laitehankinnat] [decimal](8, 3) NULL,
	[OKM_perusrahoitus] [decimal](8, 3) NULL,
	[SuomenAkatemia] [decimal](8, 3) NULL,
	[Muu_OKM] [decimal](8, 3) NULL,
	[TEKES] [decimal](8, 3) NULL,
	[Muu_TEM] [decimal](8, 3) NULL,
	[UM] [decimal](8, 3) NULL,
	[OM] [decimal](8, 3) NULL,
	[SM] [decimal](8, 3) NULL,
	[PM] [decimal](8, 3) NULL,
	[VM] [decimal](8, 3) NULL,
	[MMM] [decimal](8, 3) NULL,
	[LVM] [decimal](8, 3) NULL,
	[STM] [decimal](8, 3) NULL,
	[YM] [decimal](8, 3) NULL,
	[Kunnat] [decimal](8, 3) NULL,
	[Muu_julkinen_rahoitus] [decimal](8, 3) NULL,
	[Kotimaiset_rahastot] [decimal](8, 3) NULL,
	[Kotimaiset_yritykset] [decimal](8, 3) NULL,
	[Ulkomaiset_yritykset] [decimal](8, 3) NULL,
	[EU_puiteohjelmarahoitus] [decimal](8, 3) NULL,
	[EU_aluekehitysrahoitus] [decimal](8, 3) NULL,
	[EU_sosiaalirahasto] [decimal](8, 3) NULL,
	[Muu_EU] [decimal](8, 3) NULL,
	[Ulkomaiset_rahastot] [decimal](8, 3) NULL,
	[Kansainvaliset_jarjestot] [decimal](8, 3) NULL,
	[Muu_ulkomainen_rahoitus] [decimal](8, 3) NULL,
	[Korkeakoulun_omat_varat] [decimal](8, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [varchar](5) NOT NULL,
	[rahoituslahde_avain] [varchar](10) NOT NULL,
	[tutkimusrahoitus] [decimal](10, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [varchar](5) NOT NULL,
	[alueluokitus_avain] [varchar](3) NULL,
	[lkm_tutkimushenkilokunta_alueittain] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [varchar](5) NOT NULL,
	[sukupuoli_avain] [varchar](1) NOT NULL,
	[tehtava_avain] [varchar](7) NOT NULL,
	[tieteenala_avain] [varchar](6) NOT NULL,
	[lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [varchar](5) NOT NULL,
	[tutkintotaso_avain] [varchar](2) NOT NULL,
	[sukupuoli_avain] [varchar](1) NOT NULL,
	[lkm_tutkimushenkilokunta_tutkintotasoittain] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [varchar](5) NOT NULL,
	[menokohde_avain] [varchar](10) NOT NULL,
	[tutkimusmenot] [decimal](10, 3) NULL,
	[tutkimusmenot_arvio_seuraavatilastovuosi] [decimal](10, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [varchar](5) NOT NULL,
	[alueluokitus_avain] [varchar](3) NULL,
	[tutkimusmenot_alueittain] [decimal](35, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [varchar](5) NOT NULL,
	[tieteenala_avain] [varchar](10) NULL,
	[tutkimusmenot_tieteenaloittain] [numeric](25, 10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [varchar](5) NOT NULL,
	[alueluokitus_avain] [varchar](3) NULL,
	[lkm_tutkimustyovuodet_alueittain] [decimal](33, 1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [varchar](5) NOT NULL,
	[tehtava_avain] [varchar](7) NOT NULL,
	[lkm_tutkimustyovuodet_tyorooleittain] [decimal](10, 1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [varchar](5) NOT NULL,
	[tutkintotaso_avain] [varchar](2) NOT NULL,
	[lkm_tutkimustyovuodet_tutkintotasoittain] [decimal](14, 1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sektoritutkimuslaitos_avain] [varchar](5) NOT NULL,
	[rahoituslahde_avain] [varchar](10) NOT NULL,
	[tutkimusrahoitus] [decimal](10, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sektoritutkimuslaitos_avain] [varchar](5) NOT NULL,
	[alueluokitus_avain] [varchar](3) NULL,
	[lkm_tutkimushenkilokunta_alueittain] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sektoritutkimuslaitos_avain] [varchar](5) NOT NULL,
	[sukupuoli_avain] [varchar](1) NOT NULL,
	[tehtava_avain] [varchar](7) NOT NULL,
	[tieteenala_avain] [varchar](6) NOT NULL,
	[lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sektoritutkimuslaitos_avain] [varchar](5) NOT NULL,
	[tutkintotaso_avain] [varchar](2) NOT NULL,
	[sukupuoli_avain] [varchar](1) NOT NULL,
	[lkm_tutkimushenkilokunta_tutkintotasoittain] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sektoritutkimuslaitos_avain] [varchar](5) NOT NULL,
	[menokohde_avain] [varchar](10) NOT NULL,
	[tutkimusmenot] [decimal](10, 3) NULL,
	[tutkimusmenot_arvio_seuraavatilastovuosi] [decimal](10, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_alueittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_alueittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_alueittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sektoritutkimuslaitos_avain] [varchar](5) NOT NULL,
	[alueluokitus_avain] [varchar](3) NULL,
	[tutkimusmenot_alueittain] [decimal](35, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sektoritutkimuslaitos_avain] [varchar](5) NOT NULL,
	[tieteenala_avain] [varchar](10) NULL,
	[tutkimusmenot_tieteenaloittain] [numeric](25, 10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sektoritutkimuslaitos_avain] [varchar](5) NOT NULL,
	[alueluokitus_avain] [varchar](3) NULL,
	[lkm_tutkimustyovuodet_alueittain] [decimal](33, 1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sektoritutkimuslaitos_avain] [varchar](5) NOT NULL,
	[tehtava_avain] [varchar](7) NOT NULL,
	[lkm_tutkimustyovuodet_tyorooleittain] [decimal](10, 1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sektoritutkimuslaitos_avain] [varchar](5) NOT NULL,
	[tutkintotaso_avain] [varchar](2) NOT NULL,
	[lkm_tutkimustyovuodet_tutkintotasoittain] [decimal](14, 1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_rahoitus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_rahoitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_rahoitus](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[yosairaala_avain] [varchar](5) NULL,
	[rahoituslahde_avain] [varchar](10) NOT NULL,
	[tutkimusrahoitus] [decimal](10, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[yosairaala_avain] [varchar](5) NULL,
	[alueluokitus_avain] [varchar](3) NULL,
	[lkm_tutkimushenkilokunta_alueittain] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[yosairaala_avain] [varchar](5) NULL,
	[sukupuoli_avain] [varchar](1) NOT NULL,
	[tehtava_avain] [varchar](7) NOT NULL,
	[tieteenala_avain] [varchar](6) NOT NULL,
	[lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[yosairaala_avain] [varchar](5) NULL,
	[tutkintotaso_avain] [varchar](2) NOT NULL,
	[sukupuoli_avain] [varchar](1) NOT NULL,
	[lkm_tutkimushenkilokunta_tutkintotasoittain] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[yosairaala_avain] [varchar](5) NULL,
	[menokohde_avain] [varchar](10) NOT NULL,
	[tutkimusmenot] [decimal](10, 3) NULL,
	[tutkimusmenot_arvio_seuraavatilastovuosi] [decimal](10, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_alueittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_alueittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_alueittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[yosairaala_avain] [varchar](5) NULL,
	[alueluokitus_avain] [varchar](3) NULL,
	[tutkimusmenot_alueittain] [decimal](35, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[yosairaala_avain] [varchar](5) NULL,
	[tieteenala_avain] [varchar](10) NULL,
	[tutkimusmenot_tieteenaloittain] [numeric](27, 11) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[yosairaala_avain] [varchar](5) NULL,
	[alueluokitus_avain] [varchar](3) NULL,
	[lkm_tutkimustyovuodet_alueittain] [decimal](35, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[yosairaala_avain] [varchar](5) NULL,
	[tehtava_avain] [varchar](7) NOT NULL,
	[lkm_tutkimustyovuodet_tehtavittain] [decimal](12, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[yosairaala_avain] [varchar](5) NULL,
	[tutkintotaso_avain] [varchar](2) NOT NULL,
	[lkm_tutkimustyovuodet_tutkintotasoittain] [decimal](16, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[p_okieli] [nvarchar](2) NULL,
	[p_oltyp] [nvarchar](2) NULL,
	[p_tyos1] [nvarchar](2) NULL,
	[p_tyos2] [nvarchar](2) NULL,
	[p_tyos3] [nvarchar](2) NULL,
	[p_tyos4] [nvarchar](2) NULL,
	[p_tyos5] [nvarchar](2) NULL,
	[p_tyos] [nvarchar](50) NULL,
	[p_virka] [nvarchar](2) NULL,
	[p_aste] [nvarchar](2) NULL,
	[p_k1] [nvarchar](2) NULL,
	[p_k2] [nvarchar](2) NULL,
	[p_k3] [nvarchar](2) NULL,
	[p_k4] [nvarchar](2) NULL,
	[p_k5] [nvarchar](2) NULL,
	[p_k6] [nvarchar](2) NULL,
	[p_k7] [nvarchar](2) NULL,
	[p_k8] [nvarchar](2) NULL,
	[p_k9] [nvarchar](2) NULL,
	[p_k10] [nvarchar](2) NULL,
	[p_k11] [nvarchar](2) NULL,
	[p_olaste] [nvarchar](2) NULL,
	[p_oluom] [int] NULL,
	[p_aine] [nvarchar](2) NULL,
	[p_sp] [nvarchar](10) NULL,
	[p_maakunta] [varchar](2) NULL,
	[p_okunryh] [nvarchar](10) NULL,
	[p_ika] [nvarchar](10) NULL,
	[p_kelpu] [nvarchar](10) NULL,
	[p_osa1] [nchar](10) NULL,
	[p_osa2] [nchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[a_okieli] [nvarchar](2) NULL,
	[a_virka] [nvarchar](2) NULL,
	[a_aste] [nvarchar](2) NULL,
	[a_tyos] [nvarchar](50) NULL,
	[a_g16] [nvarchar](2) NULL,
	[a_g17] [nvarchar](2) NULL,
	[a_g18] [nvarchar](2) NULL,
	[a_g19] [nvarchar](2) NULL,
	[a_g20] [nvarchar](2) NULL,
	[a_g21] [nvarchar](2) NULL,
	[a_g22] [nvarchar](2) NULL,
	[a_h6] [nvarchar](2) NULL,
	[a_h7] [nvarchar](2) NULL,
	[a_h8] [nvarchar](2) NULL,
	[a_h9] [nvarchar](2) NULL,
	[a_h10] [nvarchar](2) NULL,
	[a_h11] [nvarchar](2) NULL,
	[a_h1] [nvarchar](2) NULL,
	[a_h2] [nvarchar](2) NULL,
	[a_h3] [nvarchar](2) NULL,
	[a_h4] [nvarchar](2) NULL,
	[a_h5] [nvarchar](2) NULL,
	[a_ala] [nvarchar](2) NULL,
	[a_aine] [nvarchar](3) NULL,
	[a_ala2] [nchar](10) NULL,
	[a_aine2] [nchar](10) NULL,
	[a_ala3] [nchar](10) NULL,
	[a_aine3] [nchar](10) NULL,
	[a_sp] [nvarchar](3) NULL,
	[a_ika] [nvarchar](10) NULL,
	[a_maakunta] [nvarchar](2) NULL,
	[a_osa1] [nchar](10) NULL,
	[a_osa2] [nchar](10) NULL,
	[tietolahde] [nvarchar](20) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[v_okieli] [nvarchar](4) NULL,
	[v_oltyp] [nvarchar](4) NULL,
	[v_tyos1] [nvarchar](4) NULL,
	[v_tyos2] [nvarchar](4) NULL,
	[v_tyos3] [nvarchar](4) NULL,
	[v_tyos4] [nvarchar](3) NULL,
	[v_tyos5] [nvarchar](3) NULL,
	[v_tyos] [nvarchar](3) NULL,
	[v_virka] [nvarchar](3) NULL,
	[v_h1] [nvarchar](3) NULL,
	[v_h2] [nvarchar](3) NULL,
	[v_h3] [nvarchar](3) NULL,
	[v_h4] [nvarchar](3) NULL,
	[v_ala1] [nvarchar](3) NULL,
	[v_aine1] [nvarchar](3) NULL,
	[v_sp] [nvarchar](2) NULL,
	[v_maakunta] [nvarchar](2) NULL,
	[v_okunryh] [nvarchar](2) NULL,
	[v_ika] [nvarchar](10) NULL,
	[v_osa1] [nchar](10) NULL,
	[v_osa2] [nchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_7_13_Vapaan_sivistystyön_opettajat_kelpoisuus_kouljarj]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_7_13_Vapaan_sivistystyön_opettajat_kelpoisuus_kouljarj]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_7_13_Vapaan_sivistystyön_opettajat_kelpoisuus_kouljarj](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[v_okieli] [nvarchar](4) NULL,
	[v_h1] [nvarchar](4) NULL,
	[v_h2] [nvarchar](4) NULL,
	[v_h3] [nvarchar](4) NULL,
	[v_h4] [nvarchar](4) NULL,
	[v_ykieli] [nvarchar](4) NULL,
	[v_yomist] [nvarchar](4) NULL,
	[v_ymkunta] [nvarchar](4) NULL,
	[v_ykunryh] [nvarchar](4) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[p_okieli] [nvarchar](2) NULL,
	[p_olaste] [nvarchar](2) NULL,
	[p_oluom] [int] NULL,
	[p_yopp19] [nvarchar](2) NULL,
	[p_ykieli] [nvarchar](10) NULL,
	[p_yomist] [nvarchar](10) NULL,
	[p_ymkunta] [varchar](2) NULL,
	[p_ykunryh] [nvarchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[p_okieli] [nvarchar](2) NULL,
	[p_virka] [nvarchar](2) NULL,
	[p_taydjo] [nvarchar](2) NULL,
	[p_taydeit] [nvarchar](2) NULL,
	[p_eitayd] [nvarchar](2) NULL,
	[p_tutktyo] [nvarchar](4) NULL,
	[p_tutkoma] [nvarchar](4) NULL,
	[p_pattyo] [nvarchar](4) NULL,
	[p_patoma] [nvarchar](4) NULL,
	[p_henktyo] [nvarchar](4) NULL,
	[p_henkoma] [nvarchar](4) NULL,
	[p_muutyo] [nvarchar](4) NULL,
	[p_muuoma] [nvarchar](4) NULL,
	[p_kanstyo] [nvarchar](4) NULL,
	[p_kansoma] [nvarchar](4) NULL,
	[p_kehsuu] [nvarchar](2) NULL,
	[p_sp] [nvarchar](2) NULL,
	[p_maakunta] [nvarchar](3) NULL,
	[p_ika] [nvarchar](10) NULL,
	[p_mento1] [nvarchar](50) NULL,
	[p_mento2] [nvarchar](50) NULL,
	[p_mento3] [nvarchar](50) NULL,
	[p_mento4] [nvarchar](50) NULL,
	[p_tyonoh1] [nchar](10) NULL,
	[p_tyonoh2] [nchar](10) NULL,
	[p_tyonoh3] [nchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[l_okieli] [nvarchar](2) NULL,
	[l_tyos1] [nvarchar](2) NULL,
	[l_tyos2] [nvarchar](2) NULL,
	[l_tyos3] [nvarchar](2) NULL,
	[l_tyos4] [nvarchar](2) NULL,
	[l_tyos5] [nvarchar](2) NULL,
	[l_tyos] [nvarchar](50) NULL,
	[l_virka] [nvarchar](2) NULL,
	[l_aste] [nvarchar](2) NULL,
	[l_k1] [nvarchar](2) NULL,
	[l_k2] [nvarchar](2) NULL,
	[l_k3] [nvarchar](2) NULL,
	[l_k4] [nvarchar](2) NULL,
	[l_k5] [nvarchar](2) NULL,
	[l_k6] [nvarchar](2) NULL,
	[l_k7] [nvarchar](2) NULL,
	[l_k8] [nvarchar](2) NULL,
	[l_k9] [nvarchar](2) NULL,
	[l_k10] [nvarchar](2) NULL,
	[l_k11] [nvarchar](2) NULL,
	[l_aine] [nvarchar](2) NULL,
	[l_sp] [nvarchar](10) NULL,
	[l_maakunta] [varchar](2) NULL,
	[l_okunryh] [nvarchar](10) NULL,
	[l_ika] [nvarchar](10) NULL,
	[l_kelpu] [nvarchar](10) NULL,
	[l_osa1] [nchar](10) NULL,
	[l_osa2] [nchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[l_okieli] [nvarchar](2) NULL,
	[l_yopp21_22] [nvarchar](2) NULL,
	[l_ykieli] [nvarchar](10) NULL,
	[l_yomist] [nvarchar](10) NULL,
	[l_ymkunta] [varchar](2) NULL,
	[l_ykunryh] [nvarchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[l_okieli] [nvarchar](2) NULL,
	[l_virka] [nvarchar](2) NULL,
	[l_taydjo] [nvarchar](2) NULL,
	[l_taydeit] [nvarchar](2) NULL,
	[l_eitayd] [nvarchar](2) NULL,
	[l_tutktyo] [nvarchar](4) NULL,
	[l_tutkoma] [nvarchar](4) NULL,
	[l_pattyo] [nvarchar](4) NULL,
	[l_patoma] [nvarchar](4) NULL,
	[l_henktyo] [nvarchar](4) NULL,
	[l_henkoma] [nvarchar](4) NULL,
	[l_muutyo] [nvarchar](4) NULL,
	[l_muuoma] [nvarchar](4) NULL,
	[l_kanstyo] [nvarchar](4) NULL,
	[l_kansoma] [nvarchar](4) NULL,
	[l_kehsuu] [nvarchar](2) NULL,
	[l_sp] [nvarchar](2) NULL,
	[l_maakunta] [nvarchar](3) NULL,
	[l_ika] [nvarchar](10) NULL,
	[l_mento1] [nvarchar](50) NULL,
	[l_mento2] [nvarchar](50) NULL,
	[l_mento3] [nvarchar](50) NULL,
	[l_mento4] [nvarchar](50) NULL,
	[l_tyonoh1] [nchar](10) NULL,
	[l_tyonoh2] [nchar](10) NULL,
	[l_tyonoh3] [nchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_7_7_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_7_7_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_7_7_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[a_okieli] [nvarchar](2) NULL,
	[a_aste] [nvarchar](2) NULL,
	[a_g16] [nvarchar](2) NULL,
	[a_g17] [nvarchar](2) NULL,
	[a_g18] [nvarchar](2) NULL,
	[a_g19] [nvarchar](2) NULL,
	[a_g20] [nvarchar](2) NULL,
	[a_g21] [nvarchar](2) NULL,
	[a_g22] [nvarchar](2) NULL,
	[a_h6] [nvarchar](2) NULL,
	[a_h7] [nvarchar](2) NULL,
	[a_h8] [nvarchar](2) NULL,
	[a_h9] [nvarchar](2) NULL,
	[a_h10] [nvarchar](2) NULL,
	[a_h11] [nvarchar](2) NULL,
	[a_h1] [nvarchar](2) NULL,
	[a_h2] [nvarchar](2) NULL,
	[a_h3] [nvarchar](2) NULL,
	[a_h4] [nvarchar](2) NULL,
	[a_h5] [nvarchar](2) NULL,
	[a_ala] [nvarchar](2) NULL,
	[a_aine] [nvarchar](3) NULL,
	[a_koulk] [nvarchar](6) NULL,
	[a_oppil] [nvarchar](2) NULL,
	[a_eioppilkm] [nvarchar](2) NULL,
	[a_oppilkm] [nvarchar](2) NULL,
	[a_ykieli] [nvarchar](2) NULL,
	[a_ymkunta] [varchar](2) NULL,
	[a_maakunta] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](20) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[a_okieli] [nvarchar](2) NULL,
	[a_virka] [nvarchar](2) NULL,
	[a_aste] [nvarchar](2) NULL,
	[a_ala108] [nvarchar](2) NULL,
	[a_taydjo] [nvarchar](2) NULL,
	[a_taydeit] [nvarchar](2) NULL,
	[a_eitayd] [nvarchar](2) NULL,
	[a_tutktyo] [nvarchar](3) NULL,
	[a_tutkoma] [nvarchar](3) NULL,
	[a_pattyo] [nvarchar](3) NULL,
	[a_patoma] [nvarchar](3) NULL,
	[a_henktyo] [nvarchar](3) NULL,
	[a_henkoma] [nvarchar](3) NULL,
	[a_muutyo] [nvarchar](3) NULL,
	[a_muuoma] [nvarchar](3) NULL,
	[a_kanstyo] [nvarchar](3) NULL,
	[a_kansoma] [nvarchar](3) NULL,
	[a_kehsuu] [nvarchar](2) NULL,
	[tyojakp] [nvarchar](3) NULL,
	[eityojak] [nvarchar](2) NULL,
	[tyojakeit] [nvarchar](2) NULL,
	[a_sp] [nvarchar](2) NULL,
	[a_maakunta] [nvarchar](2) NULL,
	[a_ika] [nvarchar](10) NULL,
	[a_mento1] [nvarchar](50) NULL,
	[a_mento2] [nvarchar](50) NULL,
	[a_mento3] [nvarchar](50) NULL,
	[a_mento4] [nvarchar](50) NULL,
	[a_tyonoh1] [nchar](10) NULL,
	[a_tyonoh2] [nchar](10) NULL,
	[a_tyonoh3] [nchar](10) NULL,
	[a_tyojak] [nchar](10) NULL,
	[a_tyojak1] [nchar](10) NULL,
	[a_tyojak2] [nchar](10) NULL,
	[a_tyojak3] [nchar](10) NULL,
	[a_tyojak4] [nchar](10) NULL,
	[a_tyopk] [nchar](10) NULL,
	[a_tyopk1] [nchar](10) NULL,
	[a_tyopk2] [nchar](10) NULL,
	[a_tyopk3] [nchar](10) NULL,
	[a_tyopk4] [nchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[v_okieli] [nvarchar](4) NULL,
	[v_virka] [nvarchar](4) NULL,
	[v_taydjo] [nvarchar](4) NULL,
	[v_taydeit] [nvarchar](4) NULL,
	[v_eitayd] [nvarchar](4) NULL,
	[v_tutktyo] [nvarchar](3) NULL,
	[v_tutkoma] [nvarchar](3) NULL,
	[v_pattyo] [nvarchar](3) NULL,
	[v_patoma] [nvarchar](3) NULL,
	[v_henktyo] [nvarchar](3) NULL,
	[v_henkoma] [nvarchar](3) NULL,
	[v_muutyo] [nvarchar](3) NULL,
	[v_muuoma] [nvarchar](3) NULL,
	[v_kanstyo] [nvarchar](3) NULL,
	[v_kansoma] [nvarchar](3) NULL,
	[v_kehsuu] [nvarchar](3) NULL,
	[v_sp] [nvarchar](2) NULL,
	[v_maakunta] [nvarchar](2) NULL,
	[v_ika] [nvarchar](10) NULL,
	[v_mento1] [nvarchar](3) NULL,
	[v_mento2] [nvarchar](3) NULL,
	[v_mento3] [nvarchar](3) NULL,
	[v_mento4] [nvarchar](3) NULL,
	[v_tyonoh1] [nchar](10) NULL,
	[v_tyonoh2] [nchar](10) NULL,
	[v_tyonoh3] [nchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[jarj] [nvarchar](10) NULL,
	[tunn] [nvarchar](5) NULL,
	[tietolahde] [varchar](255) NULL,
	[rivinumero] [varchar](255) NULL,
	[lkm_arvo] [int] NULL,
	[lkm_id] [nvarchar](128) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [varchar](3) NOT NULL,
	[lkm_arvo] [int] NULL,
	[lkm_id] [nvarchar](128) NULL,
	[tilv_date] [date] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk](
	[tilv] [nvarchar](4) NULL,
	[jarj] [nvarchar](10) NULL,
	[tiedtype] [nchar](1) NULL,
	[tunn] [nvarchar](5) NULL,
	[edesi] [nchar](1) NULL,
	[edala] [nchar](1) NULL,
	[edyla] [nchar](1) NULL,
	[edlisa] [nchar](1) NULL,
	[edainep] [nchar](1) NULL,
	[syesi] [nchar](1) NULL,
	[syala] [nchar](1) NULL,
	[syyla] [nchar](1) NULL,
	[sylisa] [nchar](1) NULL,
	[symamu] [nchar](1) NULL,
	[sylukio] [nchar](1) NULL,
	[syamm] [nchar](1) NULL,
	[symuu] [nchar](1) NULL,
	[aku] [nchar](1) NULL,
	[kaytto] [nchar](1) NULL,
	[tietolahde] [varchar](255) NULL,
	[rivinumero] [varchar](255) NULL,
	[lkm_arvo] [int] NULL,
	[lkm_id] [nvarchar](128) NULL,
	[tilv_date] [date] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_aloittaneiden_lapaisy_KAJAANI_JKL_TESTI]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_aloittaneiden_lapaisy_KAJAANI_JKL_TESTI]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_aloittaneiden_lapaisy_KAJAANI_JKL_TESTI](
	[rivinumero] [int] NOT NULL,
	[tilv] [varchar](255) NULL,
	[lahde] [varchar](255) NULL,
	[lahde_id] [int] NOT NULL,
	[opp] [nvarchar](5) NULL,
	[oppilaitoksen_taustatiedot_avain] [nvarchar](10) NOT NULL,
	[oppilaitoksen_taustatiedot_id] [int] NOT NULL,
	[oppilaitoksen_taustatiedot_historia_id] [int] NULL,
	[sp] [varchar](255) NULL,
	[sp_id] [int] NOT NULL,
	[syntv] [varchar](255) NULL,
	[ika] [nvarchar](10) NULL,
	[ika_id] [int] NOT NULL,
	[aikielir1] [varchar](255) NULL,
	[aikielir1_id] [int] NOT NULL,
	[alvv] [varchar](255) NULL,
	[allk] [varchar](255) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[klaji] [varchar](255) NULL,
	[ophal] [varchar](255) NULL,
	[ophal_id] [int] NOT NULL,
	[jarj] [varchar](255) NULL,
	[kkun] [varchar](255) NULL,
	[alueluokitus_historia_id] [int] NULL,
	[alueluokitus_id] [int] NOT NULL,
	[maak] [varchar](2) NOT NULL,
	[koulk] [varchar](255) NULL,
	[koulk_historia_id] [int] NULL,
	[koulk_id] [int] NOT NULL,
	[opmala] [varchar](2) NULL,
	[opmopa] [varchar](3) NULL,
	[opmast] [varchar](2) NULL,
	[opm95opa] [varchar](2) NULL,
	[koulutussektori] [varchar](26) NULL,
	[pohjkoulk] [varchar](255) NULL,
	[pohjkoulk_historia_id] [int] NULL,
	[pohjkoulk_id] [int] NOT NULL,
	[alvv_kk] [varchar](255) NULL,
	[allk_kk] [varchar](255) NULL,
	[aloituskausikoodi_kk] [varchar](8) NULL,
	[ololk] [varchar](255) NULL,
	[ololk_id] [int] NOT NULL,
	[rahlahde] [varchar](255) NULL,
	[rahlahde_id] [int] NOT NULL,
	[koulutuslaji2] [varchar](255) NULL,
	[koulutuslaji2_id] [int] NOT NULL,
	[saavutettu_suorv] [varchar](255) NULL,
	[saavutettu_suorlk] [varchar](255) NULL,
	[saavutettu_kausikoodi] [varchar](8) NOT NULL,
	[saavutettu_tutkmaak] [varchar](255) NULL,
	[saavutettu_alueluokitus_historia_id] [int] NULL,
	[saavutettu_alueluokitus_id] [int] NOT NULL,
	[saavutettu_tutkjarj] [varchar](255) NULL,
	[saavutettu_tutkopp] [varchar](255) NULL,
	[saavutettu_oppilaitoksen_taustatiedot_avain] [nvarchar](10) NOT NULL,
	[saavutettu_oppilaitoksen_taustatiedot_id] [int] NOT NULL,
	[saavutettu_oppilaitoksen_taustatiedot_historia_id] [int] NULL,
	[saavutettu_tutkkoulk] [varchar](255) NULL,
	[saavutettu_koulk_historia_id] [int] NULL,
	[saavutettu_koulk_id] [int] NOT NULL,
	[saavutettu_tutkopmala] [varchar](255) NULL,
	[saavutettu_tutkopmopa] [varchar](255) NULL,
	[saavutettu_tutkopmast] [varchar](255) NULL,
	[saavutettu_tutkopm95opa] [varchar](255) NULL,
	[saavutettu_tutkkoulutussektori] [varchar](255) NULL,
	[tarkastelujakso] [nvarchar](20) NOT NULL,
	[tarkastelujakso_id] [int] NOT NULL,
	[aloitus_saavutus] [nvarchar](50) NULL,
	[tarkastelujakso_tulevaisuus] [nvarchar](50) NULL,
	[tarkastelujakso_edustavuus] [nvarchar](50) NULL,
	[tietolahde] [varchar](255) NULL,
	[aineistokoodi] [varchar](5) NOT NULL,
	[aineistorivinumero] [numeric](18, 0) NULL,
	[lkm_int] [int] NULL,
	[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](255) NOT NULL,
	[1a_jarjestys] [nvarchar](255) NOT NULL,
	[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa] [nvarchar](255) NOT NULL,
	[1b_jarjestys] [nvarchar](255) NOT NULL,
	[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1c_jarjestys] [nvarchar](255) NOT NULL,
	[1d Aloittaneista ilman tutkintoa opiskelua jatkavat koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1d_jarjestys] [nvarchar](255) NOT NULL,
	[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1e_jarjestys] [nvarchar](255) NOT NULL,
	[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1f_jarjestys] [nvarchar](255) NOT NULL,
	[1g Aloittaneista alkuperäisen tutkintolajin opiskelua jatkavat koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1g_jarjestys] [nvarchar](255) NOT NULL,
	[1h Aloittaneista muun tutkintolajin opiskelua jatkavat koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1h_jarjestys] [nvarchar](255) NOT NULL,
	[2a Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](255) NOT NULL,
	[2a_jarjestys] [nvarchar](255) NOT NULL,
	[2b Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[2b_jarjestys] [nvarchar](255) NOT NULL,
	[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan] [nvarchar](255) NOT NULL,
	[2e_jarjestys] [nvarchar](255) NOT NULL,
	[2f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[2f_jarjestys] [nvarchar](255) NOT NULL,
	[2g Aloittaneista alkuperäisellä koulutusalalla opiskelua jatkavat koulutusalan mukaan] [nvarchar](255) NOT NULL,
	[2g_jarjestys] [nvarchar](255) NOT NULL,
	[2h Aloittaneista muulla koulutusalalla opiskelua jatkavat koulutusalan mukaan] [nvarchar](255) NOT NULL,
	[2h_jarjestys] [nvarchar](255) NOT NULL,
	[3a Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](255) NOT NULL,
	[3a_jarjestys] [nvarchar](255) NOT NULL,
	[3b Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[3b_jarjestys] [nvarchar](255) NOT NULL,
	[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](255) NOT NULL,
	[3e_jarjestys] [nvarchar](255) NOT NULL,
	[3f Aloittaneista muun opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](255) NOT NULL,
	[3f_jarjestys] [nvarchar](255) NOT NULL,
	[3g Aloittaneista alkuperäisellä opintoalalla (2002) opiskelua jatkavat opintoalan mukaan] [nvarchar](255) NOT NULL,
	[3g_jarjestys] [nvarchar](255) NOT NULL,
	[3h Aloittaneista muulla opintoalalla (2002) opiskelua jatkavat opintoalan mukaan] [nvarchar](255) NOT NULL,
	[3h_jarjestys] [nvarchar](255) NOT NULL,
	[4a Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto missä tahansa] [nvarchar](255) NOT NULL,
	[4a_jarjestys] [nvarchar](255) NOT NULL,
	[4b Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[4b_jarjestys] [nvarchar](255) NOT NULL,
	[4e Aloittaneista alkuperäisen koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan] [nvarchar](255) NOT NULL,
	[4e_jarjestys] [nvarchar](255) NOT NULL,
	[4f Aloittaneista muun koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan] [nvarchar](255) NOT NULL,
	[4f_jarjestys] [nvarchar](255) NOT NULL,
	[4g Aloittaneista alkuperäisellä järjestäjällä opiskelua jatkavat järjestäjän mukaan] [nvarchar](255) NOT NULL,
	[4g_jarjestys] [nvarchar](255) NOT NULL,
	[4h Aloittaneista muulla järjestäjällä opiskelua jatkavat järjestäjän mukaan] [nvarchar](255) NOT NULL,
	[4h_jarjestys] [nvarchar](255) NOT NULL,
	[5a Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto missä tahansa] [nvarchar](255) NOT NULL,
	[5a_jarjestys] [nvarchar](255) NOT NULL,
	[5b Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä] [nvarchar](255) NOT NULL,
	[5b_jarjestys] [nvarchar](255) NOT NULL,
	[5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] [nvarchar](255) NOT NULL,
	[5e_jarjestys] [nvarchar](255) NOT NULL,
	[5f Aloittaneista muussa oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] [nvarchar](255) NOT NULL,
	[5f_jarjestys] [nvarchar](255) NOT NULL,
	[5g Aloittaneista alkuperäisessä oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan] [nvarchar](255) NOT NULL,
	[5g_jarjestys] [nvarchar](255) NOT NULL,
	[5h Aloittaneista muussa oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan] [nvarchar](255) NOT NULL,
	[5h_jarjestys] [nvarchar](255) NOT NULL,
	[6a Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto missä tahansa] [nvarchar](255) NOT NULL,
	[6a_jarjestys] [nvarchar](255) NOT NULL,
	[6b Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä] [nvarchar](255) NOT NULL,
	[6b_jarjestys] [nvarchar](255) NOT NULL,
	[6e Aloittaneista alkuperäisessä maakunnassa tutkinnon suorittaneet maakunnan mukaan] [nvarchar](255) NOT NULL,
	[6e_jarjestys] [nvarchar](255) NOT NULL,
	[6f Aloittaneista muussa maakunnassa tutkinnon suorittaneet maakunnan mukaan] [nvarchar](255) NOT NULL,
	[6f_jarjestys] [nvarchar](255) NOT NULL,
	[6g Aloittaneista alkuperäisessä maakunnassa opiskelua jatkavat maakunnan mukaan] [nvarchar](255) NOT NULL,
	[6g_jarjestys] [nvarchar](255) NOT NULL,
	[6h Aloittaneista muussa maakunnassa opiskelua jatkavat maakunnan mukaan] [nvarchar](255) NOT NULL,
	[6h_jarjestys] [nvarchar](255) NOT NULL,
	[7a Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto missä tahansa] [nvarchar](255) NOT NULL,
	[7a_jarjestys] [nvarchar](255) NOT NULL,
	[7b Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[7b_jarjestys] [nvarchar](255) NOT NULL,
	[7e Aloittaneista alkuperäisen koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan] [nvarchar](255) NOT NULL,
	[7e_jarjestys] [nvarchar](255) NOT NULL,
	[7f Aloittaneista muun koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan] [nvarchar](255) NOT NULL,
	[7f_jarjestys] [nvarchar](255) NOT NULL,
	[7g Aloittaneista alkuperäisellä koulutussektorilla opiskelua jatkavat koulutussektorin mukaan] [nvarchar](255) NOT NULL,
	[7g_jarjestys] [nvarchar](255) NOT NULL,
	[7h Aloittaneista muulla koulutussektorilla opiskelua jatkavat koulutussektorin mukaan] [nvarchar](255) NOT NULL,
	[7h_jarjestys] [nvarchar](255) NOT NULL,
	[8a Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](255) NOT NULL,
	[8a_jarjestys] [nvarchar](255) NOT NULL,
	[8b Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[8b_jarjestys] [nvarchar](255) NOT NULL,
	[8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](255) NOT NULL,
	[8e_jarjestys] [nvarchar](255) NOT NULL,
	[8f Aloittaneista muun opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](255) NOT NULL,
	[8f_jarjestys] [nvarchar](255) NOT NULL,
	[8g Aloittaneista alkuperäisellä opintoalalla (1995) opiskelua jatkavat opintoalan mukaan] [nvarchar](255) NOT NULL,
	[8g_jarjestys] [nvarchar](255) NOT NULL,
	[8h Aloittaneista muulla opintoalalla (1995) opiskelua jatkavat opintoalan mukaan] [nvarchar](255) NOT NULL,
	[8h_jarjestys] [nvarchar](255) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_aloittaneiden_lapaisy_TEST20160217_JN]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_aloittaneiden_lapaisy_TEST20160217_JN]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_aloittaneiden_lapaisy_TEST20160217_JN](
	[rivinumero] [int] NOT NULL,
	[tilv] [varchar](255) NULL,
	[lahde] [varchar](255) NULL,
	[lahde_id] [int] NOT NULL,
	[opp] [nvarchar](5) NULL,
	[oppilaitoksen_taustatiedot_avain] [nvarchar](10) NOT NULL,
	[oppilaitoksen_taustatiedot_id] [int] NOT NULL,
	[oppilaitoksen_taustatiedot_historia_id] [int] NULL,
	[sp] [varchar](255) NULL,
	[sp_id] [int] NOT NULL,
	[syntv] [varchar](255) NULL,
	[ika] [nvarchar](10) NULL,
	[ika_id] [int] NOT NULL,
	[aikielir1] [varchar](255) NULL,
	[aikielir1_id] [int] NOT NULL,
	[alvv] [varchar](255) NULL,
	[allk] [varchar](255) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[klaji] [varchar](255) NULL,
	[ophal] [varchar](255) NULL,
	[ophal_id] [int] NOT NULL,
	[jarj] [varchar](255) NULL,
	[kkun] [varchar](255) NULL,
	[alueluokitus_historia_id] [int] NULL,
	[alueluokitus_id] [int] NOT NULL,
	[maak] [varchar](2) NOT NULL,
	[koulk] [varchar](255) NULL,
	[koulk_historia_id] [int] NULL,
	[koulk_id] [int] NOT NULL,
	[opmala] [varchar](2) NULL,
	[opmopa] [varchar](3) NULL,
	[opmast] [varchar](2) NULL,
	[opm95opa] [varchar](2) NULL,
	[koulutussektori] [varchar](26) NULL,
	[pohjkoulk] [varchar](255) NULL,
	[pohjkoulk_historia_id] [int] NULL,
	[pohjkoulk_id] [int] NOT NULL,
	[alvv_kk] [varchar](255) NULL,
	[allk_kk] [varchar](255) NULL,
	[aloituskausikoodi_kk] [varchar](8) NULL,
	[ololk] [varchar](255) NULL,
	[ololk_id] [int] NOT NULL,
	[rahlahde] [varchar](255) NULL,
	[rahlahde_id] [int] NOT NULL,
	[koulutuslaji2] [varchar](255) NULL,
	[koulutuslaji2_id] [int] NOT NULL,
	[saavutettu_suorv] [varchar](255) NULL,
	[saavutettu_suorlk] [varchar](255) NULL,
	[saavutettu_kausikoodi] [varchar](8) NOT NULL,
	[saavutettu_tutkmaak] [varchar](255) NULL,
	[saavutettu_alueluokitus_historia_id] [int] NULL,
	[saavutettu_alueluokitus_id] [int] NOT NULL,
	[saavutettu_tutkjarj] [varchar](255) NULL,
	[saavutettu_tutkopp] [varchar](255) NULL,
	[saavutettu_oppilaitoksen_taustatiedot_avain] [nvarchar](10) NOT NULL,
	[saavutettu_oppilaitoksen_taustatiedot_id] [int] NOT NULL,
	[saavutettu_oppilaitoksen_taustatiedot_historia_id] [int] NULL,
	[saavutettu_tutkkoulk] [varchar](255) NULL,
	[saavutettu_koulk_historia_id] [int] NULL,
	[saavutettu_koulk_id] [int] NOT NULL,
	[saavutettu_tutkopmala] [varchar](255) NULL,
	[saavutettu_tutkopmopa] [varchar](255) NULL,
	[saavutettu_tutkopmast] [varchar](255) NULL,
	[saavutettu_tutkopm95opa] [varchar](255) NULL,
	[saavutettu_tutkkoulutussektori] [varchar](255) NULL,
	[tarkastelujakso] [nvarchar](20) NOT NULL,
	[tarkastelujakso_id] [int] NOT NULL,
	[aloitus_saavutus] [nvarchar](50) NULL,
	[tarkastelujakso_tulevaisuus] [nvarchar](50) NULL,
	[tarkastelujakso_edustavuus] [nvarchar](50) NULL,
	[tietolahde] [varchar](255) NULL,
	[aineistokoodi] [varchar](5) NOT NULL,
	[aineistorivinumero] [numeric](18, 0) NULL,
	[lkm_int] [int] NULL,
	[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](255) NOT NULL,
	[1a_jarjestys] [nvarchar](255) NOT NULL,
	[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa] [nvarchar](255) NOT NULL,
	[1b_jarjestys] [nvarchar](255) NOT NULL,
	[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1c_jarjestys] [nvarchar](255) NOT NULL,
	[1d Aloittaneista ilman tutkintoa opiskelua jatkavat koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1d_jarjestys] [nvarchar](255) NOT NULL,
	[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1e_jarjestys] [nvarchar](255) NOT NULL,
	[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1f_jarjestys] [nvarchar](255) NOT NULL,
	[1g Aloittaneista alkuperäisen tutkintolajin opiskelua jatkavat koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1g_jarjestys] [nvarchar](255) NOT NULL,
	[1h Aloittaneista muun tutkintolajin opiskelua jatkavat koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[1h_jarjestys] [nvarchar](255) NOT NULL,
	[2a Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](255) NOT NULL,
	[2a_jarjestys] [nvarchar](255) NOT NULL,
	[2b Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[2b_jarjestys] [nvarchar](255) NOT NULL,
	[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan] [nvarchar](255) NOT NULL,
	[2e_jarjestys] [nvarchar](255) NOT NULL,
	[2f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](255) NOT NULL,
	[2f_jarjestys] [nvarchar](255) NOT NULL,
	[2g Aloittaneista alkuperäisellä koulutusalalla opiskelua jatkavat koulutusalan mukaan] [nvarchar](255) NOT NULL,
	[2g_jarjestys] [nvarchar](255) NOT NULL,
	[2h Aloittaneista muulla koulutusalalla opiskelua jatkavat koulutusalan mukaan] [nvarchar](255) NOT NULL,
	[2h_jarjestys] [nvarchar](255) NOT NULL,
	[3a Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](255) NOT NULL,
	[3a_jarjestys] [nvarchar](255) NOT NULL,
	[3b Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[3b_jarjestys] [nvarchar](255) NOT NULL,
	[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](255) NOT NULL,
	[3e_jarjestys] [nvarchar](255) NOT NULL,
	[3f Aloittaneista muun opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](255) NOT NULL,
	[3f_jarjestys] [nvarchar](255) NOT NULL,
	[3g Aloittaneista alkuperäisellä opintoalalla (2002) opiskelua jatkavat opintoalan mukaan] [nvarchar](255) NOT NULL,
	[3g_jarjestys] [nvarchar](255) NOT NULL,
	[3h Aloittaneista muulla opintoalalla (2002) opiskelua jatkavat opintoalan mukaan] [nvarchar](255) NOT NULL,
	[3h_jarjestys] [nvarchar](255) NOT NULL,
	[4a Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto missä tahansa] [nvarchar](255) NOT NULL,
	[4a_jarjestys] [nvarchar](255) NOT NULL,
	[4b Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[4b_jarjestys] [nvarchar](255) NOT NULL,
	[4e Aloittaneista alkuperäisen koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan] [nvarchar](255) NOT NULL,
	[4e_jarjestys] [nvarchar](255) NOT NULL,
	[4f Aloittaneista muun koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan] [nvarchar](255) NOT NULL,
	[4f_jarjestys] [nvarchar](255) NOT NULL,
	[4g Aloittaneista alkuperäisellä järjestäjällä opiskelua jatkavat järjestäjän mukaan] [nvarchar](255) NOT NULL,
	[4g_jarjestys] [nvarchar](255) NOT NULL,
	[4h Aloittaneista muulla järjestäjällä opiskelua jatkavat järjestäjän mukaan] [nvarchar](255) NOT NULL,
	[4h_jarjestys] [nvarchar](255) NOT NULL,
	[5a Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto missä tahansa] [nvarchar](255) NOT NULL,
	[5a_jarjestys] [nvarchar](255) NOT NULL,
	[5b Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä] [nvarchar](255) NOT NULL,
	[5b_jarjestys] [nvarchar](255) NOT NULL,
	[5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] [nvarchar](255) NOT NULL,
	[5e_jarjestys] [nvarchar](255) NOT NULL,
	[5f Aloittaneista muussa oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] [nvarchar](255) NOT NULL,
	[5f_jarjestys] [nvarchar](255) NOT NULL,
	[5g Aloittaneista alkuperäisessä oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan] [nvarchar](255) NOT NULL,
	[5g_jarjestys] [nvarchar](255) NOT NULL,
	[5h Aloittaneista muussa oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan] [nvarchar](255) NOT NULL,
	[5h_jarjestys] [nvarchar](255) NOT NULL,
	[6a Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto missä tahansa] [nvarchar](255) NOT NULL,
	[6a_jarjestys] [nvarchar](255) NOT NULL,
	[6b Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä] [nvarchar](255) NOT NULL,
	[6b_jarjestys] [nvarchar](255) NOT NULL,
	[6e Aloittaneista alkuperäisessä maakunnassa tutkinnon suorittaneet maakunnan mukaan] [nvarchar](255) NOT NULL,
	[6e_jarjestys] [nvarchar](255) NOT NULL,
	[6f Aloittaneista muussa maakunnassa tutkinnon suorittaneet maakunnan mukaan] [nvarchar](255) NOT NULL,
	[6f_jarjestys] [nvarchar](255) NOT NULL,
	[6g Aloittaneista alkuperäisessä maakunnassa opiskelua jatkavat maakunnan mukaan] [nvarchar](255) NOT NULL,
	[6g_jarjestys] [nvarchar](255) NOT NULL,
	[6h Aloittaneista muussa maakunnassa opiskelua jatkavat maakunnan mukaan] [nvarchar](255) NOT NULL,
	[6h_jarjestys] [nvarchar](255) NOT NULL,
	[7a Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto missä tahansa] [nvarchar](255) NOT NULL,
	[7a_jarjestys] [nvarchar](255) NOT NULL,
	[7b Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[7b_jarjestys] [nvarchar](255) NOT NULL,
	[7e Aloittaneista alkuperäisen koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan] [nvarchar](255) NOT NULL,
	[7e_jarjestys] [nvarchar](255) NOT NULL,
	[7f Aloittaneista muun koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan] [nvarchar](255) NOT NULL,
	[7f_jarjestys] [nvarchar](255) NOT NULL,
	[7g Aloittaneista alkuperäisellä koulutussektorilla opiskelua jatkavat koulutussektorin mukaan] [nvarchar](255) NOT NULL,
	[7g_jarjestys] [nvarchar](255) NOT NULL,
	[7h Aloittaneista muulla koulutussektorilla opiskelua jatkavat koulutussektorin mukaan] [nvarchar](255) NOT NULL,
	[7h_jarjestys] [nvarchar](255) NOT NULL,
	[8a Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](255) NOT NULL,
	[8a_jarjestys] [nvarchar](255) NOT NULL,
	[8b Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](255) NOT NULL,
	[8b_jarjestys] [nvarchar](255) NOT NULL,
	[8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](255) NOT NULL,
	[8e_jarjestys] [nvarchar](255) NOT NULL,
	[8f Aloittaneista muun opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](255) NOT NULL,
	[8f_jarjestys] [nvarchar](255) NOT NULL,
	[8g Aloittaneista alkuperäisellä opintoalalla (1995) opiskelua jatkavat opintoalan mukaan] [nvarchar](255) NOT NULL,
	[8g_jarjestys] [nvarchar](255) NOT NULL,
	[8h Aloittaneista muulla opintoalalla (1995) opiskelua jatkavat opintoalan mukaan] [nvarchar](255) NOT NULL,
	[8h_jarjestys] [nvarchar](255) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_K_3_11_Keskeyttaneet]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K_3_11_Keskeyttaneet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_K_3_11_Keskeyttaneet](
	[tilastovuosi] [nvarchar](6) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](1) NULL,
	[lahde] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1x] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](10) NULL,
	[ika_5v] [nvarchar](10) NULL,
	[kotikunta] [nvarchar](3) NULL,
	[kansalaisuus_versio1] [nvarchar](1) NULL,
	[eumaa] [nvarchar](1) NULL,
	[etamaa] [nvarchar](1) NULL,
	[pohjoismaa] [nvarchar](1) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulolukukausi] [nvarchar](6) NULL,
	[opiskelijan_olo_lk] [nvarchar](4) NULL,
	[oppilaitoksen_taustatiedot] [nvarchar](5) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutuksen_kieli_versio1] [nvarchar](2) NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[opetushallinnon_koulutus] [nvarchar](1) NULL,
	[hallinnonala2] [nvarchar](2) NULL,
	[koulutustyyppi] [nvarchar](1) NULL,
	[tutkinnon_suorittamismaakunta] [nvarchar](2) NULL,
	[tutkinnon_jarjestaja] [nvarchar](10) NULL,
	[tutkinnon_suorittamisoppilaitos] [nvarchar](5) NULL,
	[tutkinnon_koulutusluokitus] [nvarchar](6) NULL,
	[tutkinnon_koulutustyyppi] [nvarchar](1) NULL,
	[seuraavan_vuoden_maakunta] [nvarchar](2) NULL,
	[seuraavan_vuoden_jarjestaja] [nvarchar](10) NULL,
	[seuraavan_vuoden_oppilaitos] [nvarchar](5) NULL,
	[seuraavan_vuoden_koulutusluokitus] [nvarchar](6) NULL,
	[seuraavan_vuoden_koulutustyyppi] [nvarchar](1) NULL,
	[pääasiallinen_toiminta_versio2] [nvarchar](2) NULL,
	[ammattiasema] [nvarchar](1) NULL,
	[opiskelijat] [int] NULL,
	[1a_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan] [nvarchar](2) NULL,
	[1b_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan] [nvarchar](2) NULL,
	[1c_tutkinto_alkuperaisella_koulutusasteella_2002] [nvarchar](2) NULL,
	[1d_tutkinto_muulla_koulutusasteella_2002] [nvarchar](2) NULL,
	[1e_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002] [nvarchar](2) NULL,
	[1f_jatkaa_opiskelua_muulla_koulutusasteella_2002] [nvarchar](2) NULL,
	[2a_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan] [nvarchar](2) NULL,
	[2b_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan] [nvarchar](2) NULL,
	[2bb_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan] [nvarchar](2) NULL,
	[2c_tutkinto_alkuperaisella_koulutusalalla_2002] [nvarchar](2) NULL,
	[2d_tutkinto_muulla_koulutusalalla_2002] [nvarchar](2) NULL,
	[2e_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002] [nvarchar](2) NULL,
	[2f_jatkaa_opiskelua_muulla_koulutusalalla_2002] [nvarchar](2) NULL,
	[3a_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan] [nvarchar](2) NULL,
	[3b_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan] [nvarchar](2) NULL,
	[3bb_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan] [nvarchar](2) NULL,
	[3c_tutkinto_alkuperaisella_opintoalalla_2002] [nvarchar](2) NULL,
	[3d_tutkinto_muulla_opintoalalla_2002] [nvarchar](2) NULL,
	[3e_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002] [nvarchar](2) NULL,
	[3f_jatkaa_opiskelua_muulla_opintoalalla_2002] [nvarchar](2) NULL,
	[4a_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan] [nvarchar](2) NULL,
	[4b_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan] [nvarchar](2) NULL,
	[4bb_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan] [nvarchar](2) NULL,
	[4c_tutkinto_alkuperaisella_koulutuksen_jarjestajalla] [nvarchar](2) NULL,
	[4d_tutkinto_muulla_koulutuksen_jarjestajalla] [nvarchar](2) NULL,
	[4e_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla] [nvarchar](2) NULL,
	[4f_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla] [nvarchar](2) NULL,
	[5a_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan] [nvarchar](2) NULL,
	[5b_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan] [nvarchar](2) NULL,
	[5bb_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan] [nvarchar](2) NULL,
	[5c_tutkinto_alkuperaisessa_oppilaitoksessa] [nvarchar](2) NULL,
	[5d_tutkinto_muussa_oppilaitoksessa] [nvarchar](2) NULL,
	[5e_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa] [nvarchar](2) NULL,
	[5f_jatkaa_opiskelua_muussa_oppilaitoksessa] [nvarchar](2) NULL,
	[6a_opiskelijoiden_opintojen_kulku_maakunnan_mukaan] [nvarchar](2) NULL,
	[6b_opiskelijoiden_opintojen_kulku_maakunnan_mukaan] [nvarchar](2) NULL,
	[6c_tutkinto_alkuperaisessa_maakunnassa] [nvarchar](2) NULL,
	[6d_tutkinto_muussa_maakunnassa] [nvarchar](2) NULL,
	[6e_jatkaa_opiskelua_alkuperaisessa_maakunnassa] [nvarchar](2) NULL,
	[6f_jatkaa_opiskelua_muussa_maakunnassa] [nvarchar](2) NULL,
	[7a_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan] [nvarchar](2) NULL,
	[7b_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan] [nvarchar](2) NULL,
	[7c_tutkinto_alkuperaisella_koulutussektorilla] [nvarchar](2) NULL,
	[7d_tutkinto_muulla_koulutussektorilla] [nvarchar](2) NULL,
	[7e_jatkaa_opiskelua_alkuperaisella_koulutussektorilla] [nvarchar](2) NULL,
	[7f_jatkaa_opiskelua_muulla_koulutussektorilla] [nvarchar](2) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk](
	[tilastovuosi] [varchar](4) NULL,
	[sukupuoli_avain] [varchar](1) NULL,
	[syntymavuosi] [varchar](10) NULL,
	[jarjestys_syntymavuosi] [int] NULL,
	[kotikunta_avain] [varchar](3) NULL,
	[kotikunta_sama_kuin_edeltavana_vuonna_avain] [varchar](1) NULL,
	[edeltavan_vuoden_asuinpaikka_avain] [varchar](1) NULL,
	[suomeen_muuttamisvuosi] [varchar](30) NULL,
	[jarjestys_suomeen_muuttamisvuosi] [int] NULL,
	[aidinkieli_versio4_avain] [varchar](2) NULL,
	[kansalaisuus_avain] [varchar](3) NULL,
	[syntymamaa_avain] [varchar](3) NULL,
	[aidin_syntymamaa_avain] [varchar](3) NULL,
	[isan_syntymamaa_avain] [varchar](3) NULL,
	[henkilotunnuksen_oikeellisuus_avain] [varchar](1) NULL,
	[koulutusryhma_avain] [varchar](2) NULL,
	[opetushallinnon_koulutus_avain] [varchar](2) NULL,
	[koulutusluokitus_avain] [varchar](9) NULL,
	[koulutuksen_opetuskieli_avain] [varchar](2) NULL,
	[koulutuksen_sijaintikunta_koodi] [varchar](3) NULL,
	[tutkinnon_aloittamisvuosi] [varchar](10) NULL,
	[jarjestys_tutkinnon_aloittamisvuosi] [int] NULL,
	[opiskelijan_olo_avain] [varchar](1) NULL,
	[maassaolo_avain] [varchar](1) NULL,
	[osatutkinto_koodi] [varchar](1) NULL,
	[aloittaneet] [int] NULL,
	[opiskelijat] [int] NULL,
	[tutkinnot] [int] NULL,
	[tutkinnon_toteuma_avain] [int] NOT NULL,
	[aineisto_avain] [varchar](1) NOT NULL,
	[koulutussektori_avain] [int] NOT NULL,
	[ika1v_avain] [varchar](10) NULL,
	[ikaryhma1_avain] [varchar](10) NULL,
	[ikaryhma2_avain] [varchar](10) NULL,
	[suoritusaika] [varchar](10) NULL,
	[jarjestys_suoritusaika] [int] NULL,
	[aidinkieli_versio1_avain] [varchar](2) NULL,
	[aidinkieli_versio2_avain] [varchar](2) NULL,
	[maahantulo_ja_toisen_asteen_koul_aloittaminen_avain] [int] NULL,
	[maahantulo_ja_korkeakoulutuksen_aloittaminen_avain] [int] NULL,
	[koulutuksen_jarjestamismuoto_avain] [varchar](2) NULL,
	[aloittaneet_ulkomaalaistausta_kielen_mukaan] [int] NULL,
	[opiskelijat_ulkomaalaistausta_kielen_mukaan] [int] NULL,
	[tutkinnot_ulkomaalaistausta_kielen_mukaan] [int] NULL,
	[aloittaneet_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan] [int] NULL,
	[opiskelijat_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan] [int] NULL,
	[tutkinnot_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan] [int] NULL,
	[aloittaneet_ulkomaalaiset] [int] NULL,
	[opiskelijat_ulkomaalaiset] [int] NULL,
	[tutkinnot_ulkomaalaiset] [int] NULL,
	[aloittaneet_ulkomailla_syntyneet] [int] NULL,
	[opiskelijat_ulkomailla_syntyneet] [int] NULL,
	[tutkinnot_ulkomailla_syntyneet] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_K3_16_Moninkertainen_haku]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K3_16_Moninkertainen_haku]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_K3_16_Moninkertainen_haku](
	[Tilastovuosi] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[Koulutuksen_alkamislukukausi_avain] [varchar](5) NULL,
	[Koulutuksen_alkamislukukausi] [varchar](1) NULL,
	[luammhaku1_tunn] [varchar](5) NULL,
	[luammhaku2_tunn] [varchar](5) NULL,
	[luammhaku3_tunn] [varchar](5) NULL,
	[luammhaku4_tunn] [varchar](5) NULL,
	[luammhaku5_tunn] [varchar](5) NULL,
	[luammhaku1_opmast_avain] [varchar](8) NULL,
	[luammhaku2_opmast_avain] [varchar](8) NULL,
	[luammhaku3_opmast_avain] [varchar](8) NULL,
	[luammhaku4_opmast_avain] [varchar](8) NULL,
	[luammhaku5_opmast_avain] [varchar](8) NULL,
	[luammhaku1_opmopa_avain] [varchar](9) NULL,
	[luammhaku2_opmopa_avain] [varchar](9) NULL,
	[luammhaku3_opmopa_avain] [varchar](9) NULL,
	[luammhaku4_opmopa_avain] [varchar](9) NULL,
	[luammhaku5_opmopa_avain] [varchar](9) NULL,
	[luammhaku1_opm95opa_avain] [varchar](11) NULL,
	[luammhaku2_opm95opa_avain] [varchar](11) NULL,
	[luammhaku3_opm95opa_avain] [varchar](11) NULL,
	[luammhaku4_opm95opa_avain] [varchar](11) NULL,
	[luammhaku5_opm95opa_avain] [varchar](11) NULL,
	[luammhaku1_opmala_avain] [nvarchar](8) NULL,
	[luammhaku2_opmala_avain] [nvarchar](8) NULL,
	[luammhaku3_opmala_avain] [nvarchar](8) NULL,
	[luammhaku4_opmala_avain] [nvarchar](8) NULL,
	[luammhaku5_opmala_avain] [nvarchar](8) NULL,
	[luammhaku1_opm95ala_avain] [nvarchar](10) NULL,
	[luammhaku2_opm95ala_avain] [nvarchar](10) NULL,
	[luammhaku3_opm95ala_avain] [nvarchar](10) NULL,
	[luammhaku4_opm95ala_avain] [nvarchar](10) NULL,
	[luammhaku5_opm95ala_avain] [nvarchar](10) NULL,
	[luammhaku1_opmast] [varchar](2) NULL,
	[luammhaku2_opmast] [varchar](2) NULL,
	[luammhaku3_opmast] [varchar](2) NULL,
	[luammhaku4_opmast] [varchar](2) NULL,
	[luammhaku5_opmast] [varchar](2) NULL,
	[luammhaku1_opmopa] [varchar](3) NULL,
	[luammhaku2_opmopa] [varchar](3) NULL,
	[luammhaku3_opmopa] [varchar](3) NULL,
	[luammhaku4_opmopa] [varchar](3) NULL,
	[luammhaku5_opmopa] [varchar](3) NULL,
	[luammhaku1_opm95opa] [varchar](3) NULL,
	[luammhaku2_opm95opa] [varchar](3) NULL,
	[luammhaku3_opm95opa] [varchar](3) NULL,
	[luammhaku4_opm95opa] [varchar](3) NULL,
	[luammhaku5_opm95opa] [varchar](3) NULL,
	[luammhaku1_opmala] [nvarchar](2) NULL,
	[luammhaku2_opmala] [nvarchar](2) NULL,
	[luammhaku3_opmala] [nvarchar](2) NULL,
	[luammhaku4_opmala] [nvarchar](2) NULL,
	[luammhaku5_opmala] [nvarchar](2) NULL,
	[luammhaku1_opm95ala] [nvarchar](2) NULL,
	[luammhaku2_opm95ala] [nvarchar](2) NULL,
	[luammhaku3_opm95ala] [nvarchar](2) NULL,
	[luammhaku4_opm95ala] [nvarchar](2) NULL,
	[luammhaku5_opm95ala] [nvarchar](2) NULL,
	[luammhaku1_okieli] [varchar](1) NULL,
	[luammhaku2_okieli] [varchar](1) NULL,
	[luammhaku3_okieli] [varchar](1) NULL,
	[luammhaku4_okieli] [varchar](1) NULL,
	[luammhaku5_okieli] [varchar](1) NULL,
	[luammhaku1_hyv] [varchar](1) NULL,
	[luammhaku2_hyv] [varchar](1) NULL,
	[luammhaku3_hyv] [varchar](1) NULL,
	[luammhaku4_hyv] [varchar](1) NULL,
	[luammhaku5_hyv] [varchar](1) NULL,
	[luammhaku1_vastotto] [varchar](1) NULL,
	[luammhaku2_vastotto] [varchar](1) NULL,
	[luammhaku3_vastotto] [varchar](1) NULL,
	[luammhaku4_vastotto] [varchar](1) NULL,
	[luammhaku5_vastotto] [varchar](1) NULL,
	[amkhaku1_tunn] [varchar](5) NULL,
	[amkhaku2_tunn] [varchar](5) NULL,
	[amkhaku3_tunn] [varchar](5) NULL,
	[amkhaku4_tunn] [varchar](5) NULL,
	[amkhakum_tunn] [varchar](5) NULL,
	[amkhaku1_opmast_avain] [varchar](9) NULL,
	[amkhaku2_opmast_avain] [varchar](9) NULL,
	[amkhaku3_opmast_avain] [varchar](9) NULL,
	[amkhaku4_opmast_avain] [varchar](9) NULL,
	[amkhakum_opmast_avain] [varchar](9) NULL,
	[amkhaku1_opmopa_avain] [varchar](9) NULL,
	[amkhaku2_opmopa_avain] [varchar](9) NULL,
	[amkhaku3_opmopa_avain] [varchar](9) NULL,
	[amkhaku4_opmopa_avain] [varchar](9) NULL,
	[amkhakum_opmopa_avain] [varchar](9) NULL,
	[amkhaku1_opm95opa_avain] [varchar](11) NULL,
	[amkhaku2_opm95opa_avain] [varchar](11) NULL,
	[amkhaku3_opm95opa_avain] [varchar](11) NULL,
	[amkhaku4_opm95opa_avain] [varchar](11) NULL,
	[amkhakum_opm95opa_avain] [varchar](11) NULL,
	[amkhaku1_opmala_avain] [nvarchar](8) NULL,
	[amkhaku2_opmala_avain] [nvarchar](8) NULL,
	[amkhaku3_opmala_avain] [nvarchar](8) NULL,
	[amkhaku4_opmala_avain] [nvarchar](8) NULL,
	[amkhakum_opmala_avain] [nvarchar](8) NULL,
	[amkhaku1_opm95ala_avain] [nvarchar](10) NULL,
	[amkhaku2_opm95ala_avain] [nvarchar](10) NULL,
	[amkhaku3_opm95ala_avain] [nvarchar](10) NULL,
	[amkhaku4_opm95ala_avain] [nvarchar](10) NULL,
	[amkhakum_opm95ala_avain] [nvarchar](10) NULL,
	[amkhaku1_opmast] [varchar](3) NULL,
	[amkhaku2_opmast] [varchar](3) NULL,
	[amkhaku3_opmast] [varchar](3) NULL,
	[amkhaku4_opmast] [varchar](3) NULL,
	[amkhakum_opmast] [varchar](3) NULL,
	[amkhaku1_opmopa] [varchar](3) NULL,
	[amkhaku2_opmopa] [varchar](3) NULL,
	[amkhaku3_opmopa] [varchar](3) NULL,
	[amkhaku4_opmopa] [varchar](3) NULL,
	[amkhakum_opmopa] [varchar](3) NULL,
	[amkhaku1_opm95opa] [varchar](3) NULL,
	[amkhaku2_opm95opa] [varchar](3) NULL,
	[amkhaku3_opm95opa] [varchar](3) NULL,
	[amkhaku4_opm95opa] [varchar](3) NULL,
	[amkhakum_opm95opa] [varchar](3) NULL,
	[amkhaku1_opmala] [nvarchar](2) NULL,
	[amkhaku2_opmala] [nvarchar](2) NULL,
	[amkhaku3_opmala] [nvarchar](2) NULL,
	[amkhaku4_opmala] [nvarchar](2) NULL,
	[amkhakum_opmala] [nvarchar](2) NULL,
	[amkhaku1_opm95ala] [nvarchar](2) NULL,
	[amkhaku2_opm95ala] [nvarchar](2) NULL,
	[amkhaku3_opm95ala] [nvarchar](2) NULL,
	[amkhaku4_opm95ala] [nvarchar](2) NULL,
	[amkhakum_opm95ala] [nvarchar](2) NULL,
	[amkhaku1_koultyp] [varchar](1) NULL,
	[amkhaku2_koultyp] [varchar](1) NULL,
	[amkhaku3_koultyp] [varchar](1) NULL,
	[amkhaku4_koultyp] [varchar](1) NULL,
	[amkhakum_koultyp] [varchar](1) NULL,
	[amkhaku1_okieli] [varchar](1) NULL,
	[amkhaku2_okieli] [varchar](1) NULL,
	[amkhaku3_okieli] [varchar](1) NULL,
	[amkhaku4_okieli] [varchar](1) NULL,
	[amkhakum_okieli] [varchar](1) NULL,
	[amkhaku1_hyv] [varchar](1) NULL,
	[amkhaku2_hyv] [varchar](1) NULL,
	[amkhaku3_hyv] [varchar](1) NULL,
	[amkhaku4_hyv] [varchar](1) NULL,
	[amkhakum_hyv] [varchar](1) NULL,
	[amkhaku1_vastotto] [varchar](1) NULL,
	[amkhaku2_vastotto] [varchar](1) NULL,
	[amkhaku3_vastotto] [varchar](1) NULL,
	[amkhaku4_vastotto] [varchar](1) NULL,
	[amkhakum_vastotto] [varchar](1) NULL,
	[yohakua_tunn] [varchar](5) NULL,
	[yohakub_tunn] [varchar](5) NULL,
	[yohakuc_tunn] [varchar](5) NULL,
	[yohakud_tunn] [varchar](5) NULL,
	[yohakue_tunn] [varchar](5) NULL,
	[yohakuf_tunn] [varchar](5) NULL,
	[yohakug_tunn] [varchar](5) NULL,
	[yohakuh_tunn] [varchar](5) NULL,
	[yohakui_tunn] [varchar](5) NULL,
	[yohakua_opmast_avain] [varchar](8) NULL,
	[yohakub_opmast_avain] [varchar](8) NULL,
	[yohakuc_opmast_avain] [varchar](8) NULL,
	[yohakud_opmast_avain] [varchar](8) NULL,
	[yohakue_opmast_avain] [varchar](8) NULL,
	[yohakuf_opmast_avain] [varchar](8) NULL,
	[yohakug_opmast_avain] [varchar](8) NULL,
	[yohakuh_opmast_avain] [varchar](8) NULL,
	[yohakui_opmast_avain] [varchar](8) NULL,
	[yohakua_opmopa_avain] [varchar](9) NULL,
	[yohakub_opmopa_avain] [varchar](9) NULL,
	[yohakuc_opmopa_avain] [varchar](9) NULL,
	[yohakud_opmopa_avain] [varchar](9) NULL,
	[yohakue_opmopa_avain] [varchar](9) NULL,
	[yohakuf_opmopa_avain] [varchar](9) NULL,
	[yohakug_opmopa_avain] [varchar](9) NULL,
	[yohakuh_opmopa_avain] [varchar](9) NULL,
	[yohakui_opmopa_avain] [varchar](9) NULL,
	[yohakua_opm95opa_avain] [varchar](11) NULL,
	[yohakub_opm95opa_avain] [varchar](11) NULL,
	[yohakuc_opm95opa_avain] [varchar](11) NULL,
	[yohakud_opm95opa_avain] [varchar](11) NULL,
	[yohakue_opm95opa_avain] [varchar](11) NULL,
	[yohakuf_opm95opa_avain] [varchar](11) NULL,
	[yohakug_opm95opa_avain] [varchar](11) NULL,
	[yohakuh_opm95opa_avain] [varchar](11) NULL,
	[yohakui_opm95opa_avain] [varchar](11) NULL,
	[yohakua_opmala_avain] [nvarchar](8) NULL,
	[yohakub_opmala_avain] [nvarchar](8) NULL,
	[yohakuc_opmala_avain] [nvarchar](8) NULL,
	[yohakud_opmala_avain] [nvarchar](8) NULL,
	[yohakue_opmala_avain] [nvarchar](8) NULL,
	[yohakuf_opmala_avain] [nvarchar](8) NULL,
	[yohakug_opmala_avain] [nvarchar](8) NULL,
	[yohakuh_opmala_avain] [nvarchar](8) NULL,
	[yohakui_opmala_avain] [nvarchar](8) NULL,
	[yohakua_opm95ala_avain] [nvarchar](10) NULL,
	[yohakub_opm95ala_avain] [nvarchar](10) NULL,
	[yohakuc_opm95ala_avain] [nvarchar](10) NULL,
	[yohakud_opm95ala_avain] [nvarchar](10) NULL,
	[yohakue_opm95ala_avain] [nvarchar](10) NULL,
	[yohakuf_opm95ala_avain] [nvarchar](10) NULL,
	[yohakug_opm95ala_avain] [nvarchar](10) NULL,
	[yohakuh_opm95ala_avain] [nvarchar](10) NULL,
	[yohakui_opm95ala_avain] [nvarchar](10) NULL,
	[yohakua_opmast] [varchar](2) NULL,
	[yohakub_opmast] [varchar](2) NULL,
	[yohakuc_opmast] [varchar](2) NULL,
	[yohakud_opmast] [varchar](2) NULL,
	[yohakue_opmast] [varchar](2) NULL,
	[yohakuf_opmast] [varchar](2) NULL,
	[yohakug_opmast] [varchar](2) NULL,
	[yohakuh_opmast] [varchar](2) NULL,
	[yohakui_opmast] [varchar](2) NULL,
	[yohakua_opmopa] [varchar](3) NULL,
	[yohakub_opmopa] [varchar](3) NULL,
	[yohakuc_opmopa] [varchar](3) NULL,
	[yohakud_opmopa] [varchar](3) NULL,
	[yohakue_opmopa] [varchar](3) NULL,
	[yohakuf_opmopa] [varchar](3) NULL,
	[yohakug_opmopa] [varchar](3) NULL,
	[yohakuh_opmopa] [varchar](3) NULL,
	[yohakui_opmopa] [varchar](3) NULL,
	[yohakua_opm95opa] [varchar](3) NULL,
	[yohakub_opm95opa] [varchar](3) NULL,
	[yohakuc_opm95opa] [varchar](3) NULL,
	[yohakud_opm95opa] [varchar](3) NULL,
	[yohakue_opm95opa] [varchar](3) NULL,
	[yohakuf_opm95opa] [varchar](3) NULL,
	[yohakug_opm95opa] [varchar](3) NULL,
	[yohakuh_opm95opa] [varchar](3) NULL,
	[yohakui_opm95opa] [varchar](3) NULL,
	[yohakua_opmala] [nvarchar](2) NULL,
	[yohakub_opmala] [nvarchar](2) NULL,
	[yohakuc_opmala] [nvarchar](2) NULL,
	[yohakud_opmala] [nvarchar](2) NULL,
	[yohakue_opmala] [nvarchar](2) NULL,
	[yohakuf_opmala] [nvarchar](2) NULL,
	[yohakug_opmala] [nvarchar](2) NULL,
	[yohakuh_opmala] [nvarchar](2) NULL,
	[yohakui_opmala] [nvarchar](2) NULL,
	[yohakua_opm95ala] [nvarchar](2) NULL,
	[yohakub_opm95ala] [nvarchar](2) NULL,
	[yohakuc_opm95ala] [nvarchar](2) NULL,
	[yohakud_opm95ala] [nvarchar](2) NULL,
	[yohakue_opm95ala] [nvarchar](2) NULL,
	[yohakuf_opm95ala] [nvarchar](2) NULL,
	[yohakug_opm95ala] [nvarchar](2) NULL,
	[yohakuh_opm95ala] [nvarchar](2) NULL,
	[yohakui_opm95ala] [nvarchar](2) NULL,
	[yohakua_hyv] [varchar](1) NULL,
	[yohakub_hyv] [varchar](1) NULL,
	[yohakuc_hyv] [varchar](1) NULL,
	[yohakud_hyv] [varchar](1) NULL,
	[yohakue_hyv] [varchar](1) NULL,
	[yohakuf_hyv] [varchar](1) NULL,
	[yohakug_hyv] [varchar](1) NULL,
	[yohakuh_hyv] [varchar](1) NULL,
	[yohakui_hyv] [varchar](1) NULL,
	[yohakua_vastotto] [varchar](1) NULL,
	[yohakub_vastotto] [varchar](1) NULL,
	[yohakuc_vastotto] [varchar](1) NULL,
	[yohakud_vastotto] [varchar](1) NULL,
	[yohakue_vastotto] [varchar](1) NULL,
	[yohakuf_vastotto] [varchar](1) NULL,
	[yohakug_vastotto] [varchar](1) NULL,
	[yohakuh_vastotto] [varchar](1) NULL,
	[yohakui_vastotto] [varchar](1) NULL,
	[yohakua_harekast] [varchar](2) NULL,
	[yohakub_harekast] [varchar](2) NULL,
	[yohakuc_harekast] [varchar](2) NULL,
	[yohakud_harekast] [varchar](2) NULL,
	[yohakue_harekast] [varchar](2) NULL,
	[yohakuf_harekast] [varchar](2) NULL,
	[yohakug_harekast] [varchar](2) NULL,
	[yohakuh_harekast] [varchar](2) NULL,
	[yohakui_harekast] [varchar](2) NULL,
	[yohakua_ylempi] [varchar](1) NOT NULL,
	[yohakub_ylempi] [varchar](1) NOT NULL,
	[yohakuc_ylempi] [varchar](1) NOT NULL,
	[yohakud_ylempi] [varchar](1) NOT NULL,
	[yohakue_ylempi] [varchar](1) NOT NULL,
	[yohakuf_ylempi] [varchar](1) NOT NULL,
	[yohakug_ylempi] [varchar](1) NOT NULL,
	[yohakuh_ylempi] [varchar](1) NOT NULL,
	[yohakui_ylempi] [varchar](1) NOT NULL,
	[yohakua_erval] [varchar](1) NULL,
	[yohakub_erval] [varchar](1) NULL,
	[yohakuc_erval] [varchar](1) NULL,
	[yohakud_erval] [varchar](1) NULL,
	[yohakue_erval] [varchar](1) NULL,
	[yohakuf_erval] [varchar](1) NULL,
	[yohakug_erval] [varchar](1) NULL,
	[yohakuh_erval] [varchar](1) NULL,
	[yohakui_erval] [varchar](1) NULL,
	[luhakux] [varchar](1) NULL,
	[luhaku2x] [varchar](1) NULL,
	[luhaku3x] [varchar](1) NULL,
	[ammhakux] [varchar](1) NULL,
	[ammhaku2x] [varchar](1) NULL,
	[ammhaku3x] [varchar](1) NULL,
	[amkhakux] [varchar](1) NULL,
	[amkhaku2x] [varchar](1) NULL,
	[amkhaku3x] [varchar](1) NULL,
	[yohakux] [varchar](1) NULL,
	[yohaku2x] [varchar](1) NULL,
	[yohaku3x] [varchar](1) NULL,
	[Sukupuoli_avain] [varchar](1) NULL,
	[Aidinkielir1_avain] [varchar](2) NULL,
	[Syntymavuosi] [varchar](4) NULL,
	[Ika] [int] NULL,
	[Kotikunta_vuotta_aiemmin_avain] [varchar](3) NULL,
	[Kansalaisuusr1_avain] [varchar](1) NULL,
	[aikyotutk] [varchar](1) NULL,
	[aikyotutkkoulk] [varchar](6) NULL,
	[aikyotutkkoulk_opmast] [nvarchar](2) NULL,
	[aikyotutkkoulk_opm95opa] [nvarchar](3) NULL,
	[aikyotutkkoulk_opmopa] [nvarchar](3) NULL,
	[aikyotutkkoulk_opm95ala] [nvarchar](2) NULL,
	[aikyotutkkoulk_opmala] [nvarchar](2) NULL,
	[suvuosiyotutk] [varchar](4) NULL,
	[tunnyotutk] [varchar](5) NULL,
	[aikamm] [varchar](1) NULL,
	[aikammkoulk] [varchar](6) NULL,
	[aikammkoulk_opmast] [nvarchar](2) NULL,
	[aikammkoulk_opm95opa] [nvarchar](3) NULL,
	[aikammkoulk_opmopa] [nvarchar](3) NULL,
	[aikammkoulk_opm95ala] [nvarchar](2) NULL,
	[aikammkoulk_opmala] [nvarchar](2) NULL,
	[suvuosiamm] [varchar](4) NULL,
	[tunnamm] [varchar](5) NULL,
	[aikamk] [varchar](1) NULL,
	[aikamkkoulk] [varchar](6) NULL,
	[aikamkkoulk_opmast] [nvarchar](2) NULL,
	[aikamkkoulk_opm95opa] [nvarchar](3) NULL,
	[aikamkkoulk_opmopa] [nvarchar](3) NULL,
	[aikamkkoulk_opm95ala] [nvarchar](2) NULL,
	[aikamkkoulk_opmala] [nvarchar](2) NULL,
	[suvuosiamk] [varchar](4) NULL,
	[tunnamk] [varchar](5) NULL,
	[aikylamk] [varchar](1) NULL,
	[aikylamkkoulk] [varchar](6) NULL,
	[aikylamkkoulk_opmast] [nvarchar](2) NULL,
	[aikylamkkoulk_opm95opa] [nvarchar](3) NULL,
	[aikylamkkoulk_opmopa] [nvarchar](3) NULL,
	[aikylamkkoulk_opm95ala] [nvarchar](2) NULL,
	[aikylamkkoulk_opmala] [nvarchar](2) NULL,
	[suvuosiylamk] [varchar](4) NULL,
	[tunnylamk] [varchar](5) NULL,
	[aikalkk] [varchar](1) NULL,
	[aikalkkkoulk] [varchar](6) NULL,
	[aikalkkkoulk_opmast] [nvarchar](2) NULL,
	[aikalkkkoulk_opm95opa] [nvarchar](3) NULL,
	[aikalkkkoulk_opmopa] [nvarchar](3) NULL,
	[aikalkkkoulk_opm95ala] [nvarchar](2) NULL,
	[aikalkkkoulk_opmala] [nvarchar](2) NULL,
	[suvuosialkk] [varchar](4) NULL,
	[tunnalkk] [varchar](5) NULL,
	[aikylkk] [varchar](1) NULL,
	[aikylkkkoulk] [varchar](6) NULL,
	[aikylkkkoulk_opmast] [nvarchar](2) NULL,
	[aikylkkkoulk_opm95opa] [nvarchar](3) NULL,
	[aikylkkkoulk_opmopa] [nvarchar](3) NULL,
	[aikylkkkoulk_opm95ala] [nvarchar](2) NULL,
	[aikylkkkoulk_opmala] [nvarchar](2) NULL,
	[suvuosiylkk] [varchar](4) NULL,
	[tunnylkk] [varchar](5) NULL,
	[aiklistri] [varchar](1) NULL,
	[aiklistrikoulk] [varchar](6) NULL,
	[aiklistrikoulk_opmast] [nvarchar](2) NULL,
	[aiklistrikoulk_opm95opa] [nvarchar](3) NULL,
	[aiklistrikoulk_opmopa] [nvarchar](3) NULL,
	[aiklistrikoulk_opm95ala] [nvarchar](2) NULL,
	[aiklistrikoulk_opmala] [nvarchar](2) NULL,
	[suvuosilistri] [varchar](4) NULL,
	[tunnlistri] [varchar](5) NULL,
	[yotutkopisx] [varchar](1) NULL,
	[yotutkopisxkoulk] [varchar](6) NULL,
	[yotutkopisxkoulk_opmast] [nvarchar](2) NULL,
	[yotutkopisxkoulk_opm95opa] [nvarchar](3) NULL,
	[yotutkopisxkoulk_opmopa] [nvarchar](3) NULL,
	[yotutkopisxkoulk_opm95ala] [nvarchar](2) NULL,
	[yotutkopisxkoulk_opmala] [nvarchar](2) NULL,
	[yotutkopisxtunn] [varchar](5) NULL,
	[ammopisx] [varchar](1) NULL,
	[ammopisxkoulk] [varchar](6) NULL,
	[ammopisxkoulk_opmast] [nvarchar](2) NULL,
	[ammopisxkoulk_opm95opa] [nvarchar](3) NULL,
	[ammopisxkoulk_opmopa] [nvarchar](3) NULL,
	[ammopisxkoulk_opm95ala] [nvarchar](2) NULL,
	[ammopisxkoulk_opmala] [nvarchar](2) NULL,
	[ammopisxtunn] [varchar](6) NULL,
	[amkopisx1] [varchar](1) NULL,
	[amkopisxkoulk1] [varchar](6) NULL,
	[amkopisxkoulk1_opmast] [nvarchar](2) NULL,
	[amkopisxkoulk1_opm95opa] [nvarchar](3) NULL,
	[amkopisxkoulk1_opmopa] [nvarchar](3) NULL,
	[amkopisxkoulk1_opm95ala] [nvarchar](2) NULL,
	[amkopisxkoulk1_opmala] [nvarchar](2) NULL,
	[amkopisxtunn1] [varchar](5) NULL,
	[amkopisx2] [varchar](1) NULL,
	[amkopisxkoulk2] [varchar](6) NULL,
	[amkopisxkoulk2_opmast] [nvarchar](2) NULL,
	[amkopisxkoulk2_opm95opa] [nvarchar](3) NULL,
	[amkopisxkoulk2_opmopa] [nvarchar](3) NULL,
	[amkopisxkoulk2_opm95ala] [nvarchar](2) NULL,
	[amkopisxkoulk2_opmala] [nvarchar](2) NULL,
	[amkopisxtunn2] [varchar](5) NULL,
	[amkopisx3] [varchar](1) NULL,
	[amkopisxkoulk3] [varchar](6) NULL,
	[amkopisxkoulk3_opmast] [nvarchar](2) NULL,
	[amkopisxkoulk3_opm95opa] [nvarchar](3) NULL,
	[amkopisxkoulk3_opmopa] [nvarchar](3) NULL,
	[amkopisxkoulk3_opm95ala] [nvarchar](2) NULL,
	[amkopisxkoulk3_opmala] [nvarchar](2) NULL,
	[amkopisxtunn3] [varchar](5) NULL,
	[yoopisx1] [varchar](1) NULL,
	[yoopisxkoulk1] [varchar](6) NULL,
	[yoopisxkoulk1_opmast] [nvarchar](2) NULL,
	[yoopisxkoulk1_opm95opa] [nvarchar](3) NULL,
	[yoopisxkoulk1_opmopa] [nvarchar](3) NULL,
	[yoopisxkoulk1_opm95ala] [nvarchar](2) NULL,
	[yoopisxkoulk1_opmala] [nvarchar](2) NULL,
	[yoopisxtunn1] [varchar](5) NULL,
	[yoopisx2] [varchar](1) NULL,
	[yoopisxkoulk2] [varchar](6) NULL,
	[yoopisxkoulk2_opmast] [nvarchar](2) NULL,
	[yoopisxkoulk2_opm95opa] [nvarchar](3) NULL,
	[yoopisxkoulk2_opmopa] [nvarchar](3) NULL,
	[yoopisxkoulk2_opm95ala] [nvarchar](2) NULL,
	[yoopisxkoulk2_opmala] [nvarchar](2) NULL,
	[yoopisxtunn2] [varchar](5) NULL,
	[yoopisx3] [varchar](1) NULL,
	[yoopisxkoulk3] [varchar](6) NULL,
	[yoopisxkoulk3_opmast] [nvarchar](2) NULL,
	[yoopisxkoulk3_opm95opa] [nvarchar](3) NULL,
	[yoopisxkoulk3_opmopa] [nvarchar](3) NULL,
	[yoopisxkoulk3_opm95ala] [nvarchar](2) NULL,
	[yoopisxkoulk3_opmala] [nvarchar](2) NULL,
	[yoopisxtunn3] [varchar](5) NULL,
	[ptoim1r3x] [varchar](2) NULL,
	[htok] [varchar](1) NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](31) NOT NULL,
	[rivinumero] [bigint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat](
	[tilastovuosi] [varchar](4) NULL,
	[syntymamaa_avain] [varchar](3) NULL,
	[kansalaisuus_avain] [varchar](3) NULL,
	[sukupuoli_avain] [varchar](1) NULL,
	[ika_avain] [varchar](8) NULL,
	[asuinmaakunta_avain] [varchar](6) NULL,
	[paaasiallinen_toiminta_versio3_avain] [varchar](2) NULL,
	[koulutusluokitus_avain] [varchar](6) NULL,
	[tutkinnon_suoritusvuosi] [varchar](10) NULL,
	[koulutuksesta_kulunut_aika_koodi] [nvarchar](20) NULL,
	[tutkinnon_suoritusmaakunta] [varchar](6) NULL,
	[ammattikoodi_2010_avain] [nvarchar](10) NULL,
	[tyopaikan_sijaintimaakunta_avain] [varchar](6) NULL,
	[toimialaluokitus_tthv_avain] [varchar](2) NULL,
	[toimialaluokitus_ed_tthv_avain] [varchar](2) NULL,
	[tyonantajasektori2_avain] [varchar](2) NULL,
	[tyonantajasektori2_ed_avain] [varchar](2) NULL,
	[yrityksen_koko_avain] [varchar](2) NULL,
	[tyonantaja_vaihtunut_avain] [varchar](2) NULL,
	[lkm] [int] NULL,
	[tyonantajasektori2_tthv_avain] [int] NULL,
	[tyonantajasektori2_ed_tthv_avain] [int] NULL,
	[asuinmaakunta_sama_kuin_tyopaikan_sijaintikunta_avain] [int] NOT NULL,
	[tyonantajasektori_sama_kuin_ed_vuonna_avain] [int] NOT NULL,
	[toimiala_tthv1_sama_kuin_ed_vuonna_avain] [int] NOT NULL,
	[toimiala_tthv2_sama_kuin_ed_vuonna_avain] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [nvarchar](10) NULL,
	[oppilaitos_id] [int] NOT NULL,
	[oppilaitos_sijaintikunta_avain] [nvarchar](3) NOT NULL,
	[oppilaitos_sijaintikunta_id] [int] NOT NULL,
	[tieteenala_avain] [nvarchar](10) NULL,
	[tieteenala_id] [int] NOT NULL,
	[virkaryhma_avain] [nvarchar](10) NULL,
	[virkaryhma_id] [int] NOT NULL,
	[ika_avain] [nvarchar](10) NULL,
	[ika_id] [int] NOT NULL,
	[sukupuoli_avain] [nvarchar](10) NULL,
	[sukupuoli_id] [int] NOT NULL,
	[tutkintotaso_avain] [nvarchar](10) NULL,
	[tutkintotaso_id] [int] NOT NULL,
	[lkm_tutkimushenkilokunta] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_Moninkertainen_haku_aiemmat_tutkinnot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_aiemmat_tutkinnot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_Moninkertainen_haku_aiemmat_tutkinnot](
	[Tilastovuosi] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[Sukupuoli_avain] [varchar](1) NULL,
	[Ika] [int] NULL,
	[Syntymavuosi] [varchar](4) NULL,
	[Aidinkielir1_avain] [varchar](2) NULL,
	[Kotikunta_vuotta_aiemmin_avain] [varchar](3) NULL,
	[Hetuntila_avain] [varchar](1) NULL,
	[Toiminta_vuotta_aiemmin_avain] [varchar](2) NULL,
	[Aiemmin_suoritettu_tutkinto_oppilaitos_avain] [varchar](5) NULL,
	[Aiemmin_suoritettu_tutkinto_koulutusluokitus_avain] [varchar](6) NULL,
	[Aiemmin_suoritettu_tutkinto_suoritusvuosi] [varchar](4) NULL,
	[Aiemmin_suoritettu_tutkinto_ika] [int] NULL,
	[Aiemmin_suoritettu_tutkinto_sektori] [varchar](6) NOT NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](31) NOT NULL,
	[rivinumero] [bigint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_Moninkertainen_haku_edellisen_vuoden_opiskelut]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_edellisen_vuoden_opiskelut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_Moninkertainen_haku_edellisen_vuoden_opiskelut](
	[Tilastovuosi] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[Sukupuoli_avain] [varchar](1) NULL,
	[Ika] [int] NULL,
	[Syntymavuosi] [varchar](4) NULL,
	[Aidinkielir1_avain] [varchar](2) NULL,
	[Kotikunta_vuotta_aiemmin_avain] [varchar](3) NULL,
	[Hetuntila_avain] [varchar](1) NULL,
	[Toiminta_vuotta_aiemmin_avain] [varchar](2) NULL,
	[Edellisen_vuoden_opiskelu_oppilaitos_avain] [varchar](1) NULL,
	[Edellisen_vuoden_opiskelu_koulutusluokitus_avain] [varchar](1) NULL,
	[Edellisen_vuoden_opiskelu_sektori] [varchar](6) NOT NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](31) NOT NULL,
	[rivinumero] [bigint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_Moninkertainen_haku_edelliset_haut]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_edelliset_haut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_Moninkertainen_haku_edelliset_haut](
	[Tilastovuosi] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[Sukupuoli_avain] [varchar](1) NULL,
	[Ika] [int] NULL,
	[Syntymavuosi] [varchar](4) NULL,
	[Aidinkielir1_avain] [varchar](2) NULL,
	[Kotikunta_vuotta_aiemmin_avain] [varchar](3) NULL,
	[Hetuntila_avain] [varchar](1) NULL,
	[Toiminta_vuotta_aiemmin_avain] [varchar](2) NULL,
	[Edellinen_haku_avain] [varchar](3) NOT NULL,
	[Edellinen_haku_ajankohta] [varchar](6) NOT NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](31) NOT NULL,
	[rivinumero] [bigint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_Moninkertainen_haku_hakijat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_hakijat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_Moninkertainen_haku_hakijat](
	[Tilastovuosi] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[Sukupuoli_avain] [varchar](1) NULL,
	[Ika] [int] NULL,
	[Syntymavuosi] [varchar](4) NULL,
	[Aidinkielir1_avain] [varchar](2) NULL,
	[Kotikunta_vuotta_aiemmin_avain] [varchar](3) NULL,
	[Hetuntila_avain] [varchar](1) NULL,
	[Toiminta_vuotta_aiemmin_avain] [varchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](31) NOT NULL,
	[rivinumero] [bigint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_Moninkertainen_haku_uudet_haut]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_Moninkertainen_haku_uudet_haut](
	[Tilastovuosi] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[Sukupuoli_avain] [varchar](1) NULL,
	[Ika] [int] NULL,
	[Syntymavuosi] [varchar](4) NULL,
	[Aidinkielir1_avain] [varchar](2) NULL,
	[Kotikunta_vuotta_aiemmin_avain] [varchar](3) NULL,
	[Hetuntila_avain] [varchar](1) NULL,
	[Toiminta_vuotta_aiemmin_avain] [varchar](2) NULL,
	[Haku_avain] [varchar](3) NOT NULL,
	[Hakukohde_oppilaitos_avain] [varchar](5) NULL,
	[Hakukohde_koulutusaste2002_avain] [varchar](8) NULL,
	[Hakukohde_opintoala2002_avain] [varchar](9) NULL,
	[Hakukohde_opintoala1995_avain] [varchar](10) NULL,
	[Hakukohde_prioriteetti_avain] [varchar](3) NOT NULL,
	[Hakukohde_hyvaksytty] [varchar](1) NULL,
	[Hakukohde_vastaanotettu] [varchar](1) NULL,
	[Hakukohde_tutkinnon_taso] [varchar](2) NULL,
	[Hakukohde_vain_ylempi] [varchar](2) NULL,
	[Hakukohde_erillisvalinta] [varchar](2) NULL,
	[Johdettu_Hakija_opiskelee_hakukohteessa] [varchar](1) NOT NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](31) NOT NULL,
	[rivinumero] [bigint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[jarj] [nvarchar](10) NULL,
	[tiedtype] [nchar](1) NULL,
	[tunn] [nvarchar](5) NULL,
	[edesi] [nchar](1) NULL,
	[edala] [nchar](1) NULL,
	[edyla] [nchar](1) NULL,
	[edlisa] [nchar](1) NULL,
	[edainep] [nchar](1) NULL,
	[syesi] [nchar](1) NULL,
	[syala] [nchar](1) NULL,
	[syyla] [nchar](1) NULL,
	[sylisa] [nchar](1) NULL,
	[symamu] [nchar](1) NULL,
	[sylukio] [nchar](1) NULL,
	[syamm] [nchar](1) NULL,
	[symuu] [nchar](1) NULL,
	[keven] [int] NULL,
	[kev1] [int] NULL,
	[kev1n] [int] NULL,
	[kev2] [int] NULL,
	[kev2n] [int] NULL,
	[kev3] [int] NULL,
	[kev3n] [int] NULL,
	[kev4] [int] NULL,
	[kev4n] [int] NULL,
	[kev5] [int] NULL,
	[kev5n] [int] NULL,
	[kev6] [int] NULL,
	[kev6n] [int] NULL,
	[kev7] [int] NULL,
	[kev7n] [int] NULL,
	[kev8] [int] NULL,
	[kev8n] [int] NULL,
	[kev9] [int] NULL,
	[kev9n] [int] NULL,
	[kev10] [int] NULL,
	[kev10n] [int] NULL,
	[kev] [int] NULL,
	[kevn] [int] NULL,
	[luok1] [int] NULL,
	[luok1n] [int] NULL,
	[luok2] [int] NULL,
	[luok2n] [int] NULL,
	[luok3] [int] NULL,
	[luok3n] [int] NULL,
	[luok4] [int] NULL,
	[luok4n] [int] NULL,
	[luok5] [int] NULL,
	[luok5n] [int] NULL,
	[luok6] [int] NULL,
	[luok6n] [int] NULL,
	[luok7] [int] NULL,
	[luok7n] [int] NULL,
	[luok8] [int] NULL,
	[luok8n] [int] NULL,
	[luok9] [int] NULL,
	[luok9n] [int] NULL,
	[luok] [int] NULL,
	[luokn] [int] NULL,
	[kelaim] [int] NULL,
	[kelaimn] [int] NULL,
	[tod] [int] NULL,
	[todn] [int] NULL,
	[tutkt] [int] NULL,
	[tutktn] [int] NULL,
	[suor10] [int] NULL,
	[suor10n] [int] NULL,
	[oeriy] [int] NULL,
	[oeriyn] [int] NULL,
	[ilmtod] [int] NULL,
	[ilmtodn] [int] NULL,
	[aku] [nchar](1) NULL,
	[mamukurs] [int] NULL,
	[oppkurs] [int] NULL,
	[muukurs] [int] NULL,
	[akukurs] [int] NULL,
	[kmamu] [int] NULL,
	[kmamun] [int] NULL,
	[syulkom] [int] NULL,
	[syulkomn] [int] NULL,
	[sykoti] [int] NULL,
	[sykotin] [int] NULL,
	[ika4e] [int] NULL,
	[ika4en] [int] NULL,
	[ika5e] [int] NULL,
	[ika5en] [int] NULL,
	[pid5v] [int] NULL,
	[ika6e] [int] NULL,
	[ika6en] [int] NULL,
	[ika7e] [int] NULL,
	[ika7en] [int] NULL,
	[ikae] [int] NULL,
	[ikaen] [int] NULL,
	[ove] [int] NULL,
	[ov1] [int] NULL,
	[ov2] [int] NULL,
	[ov3] [int] NULL,
	[ov4] [int] NULL,
	[ov5] [int] NULL,
	[ov6] [int] NULL,
	[ov7] [int] NULL,
	[ov8] [int] NULL,
	[ov9] [int] NULL,
	[ov10] [int] NULL,
	[ovy] [int] NULL,
	[tehoe] [int] NULL,
	[teho1] [int] NULL,
	[teho2] [int] NULL,
	[teho3] [int] NULL,
	[teho4] [int] NULL,
	[teho5] [int] NULL,
	[teho6] [int] NULL,
	[teho7] [int] NULL,
	[teho8] [int] NULL,
	[teho9] [int] NULL,
	[teho10] [int] NULL,
	[tehoy] [int] NULL,
	[eipide] [int] NULL,
	[eipid1] [int] NULL,
	[eipid2] [int] NULL,
	[eipid3] [int] NULL,
	[eipid4] [int] NULL,
	[eipid5] [int] NULL,
	[eipid6] [int] NULL,
	[eipid7] [int] NULL,
	[eipid8] [int] NULL,
	[eipid9] [int] NULL,
	[eipid10] [int] NULL,
	[eipidy] [int] NULL,
	[ertuve] [int] NULL,
	[ertuv1] [int] NULL,
	[ertuv2] [int] NULL,
	[ertuv3] [int] NULL,
	[ertuv4] [int] NULL,
	[ertuv5] [int] NULL,
	[ertuv6] [int] NULL,
	[ertuv7] [int] NULL,
	[ertuv8] [int] NULL,
	[ertuv9] [int] NULL,
	[ertuv10] [int] NULL,
	[ertuvy] [int] NULL,
	[ertume] [int] NULL,
	[ertum1] [int] NULL,
	[ertum2] [int] NULL,
	[ertum3] [int] NULL,
	[ertum4] [int] NULL,
	[ertum5] [int] NULL,
	[ertum6] [int] NULL,
	[ertum7] [int] NULL,
	[ertum8] [int] NULL,
	[ertum9] [int] NULL,
	[ertum10] [int] NULL,
	[ertumy] [int] NULL,
	[tavove] [int] NULL,
	[tavov1] [int] NULL,
	[tavov2] [int] NULL,
	[tavov3] [int] NULL,
	[tavov4] [int] NULL,
	[tavov5] [int] NULL,
	[tavov6] [int] NULL,
	[tavov7] [int] NULL,
	[tavov8] [int] NULL,
	[tavov9] [int] NULL,
	[tavov10] [int] NULL,
	[tavovy] [int] NULL,
	[oven] [int] NULL,
	[ov1n] [int] NULL,
	[ov2n] [int] NULL,
	[ov3n] [int] NULL,
	[ov4n] [int] NULL,
	[ov5n] [int] NULL,
	[ov6n] [int] NULL,
	[ov7n] [int] NULL,
	[ov8n] [int] NULL,
	[ov9n] [int] NULL,
	[ov10n] [int] NULL,
	[ovyn] [int] NULL,
	[tehoen] [int] NULL,
	[teho1n] [int] NULL,
	[teho2n] [int] NULL,
	[teho3n] [int] NULL,
	[teho4n] [int] NULL,
	[teho5n] [int] NULL,
	[teho6n] [int] NULL,
	[teho7n] [int] NULL,
	[teho8n] [int] NULL,
	[teho9n] [int] NULL,
	[teho10n] [int] NULL,
	[tehoyn] [int] NULL,
	[eipiden] [int] NULL,
	[eipid1n] [int] NULL,
	[eipid2n] [int] NULL,
	[eipid3n] [int] NULL,
	[eipid4n] [int] NULL,
	[eipid5n] [int] NULL,
	[eipid6n] [int] NULL,
	[eipid7n] [int] NULL,
	[eipid8n] [int] NULL,
	[eipid9n] [int] NULL,
	[eipid10n] [int] NULL,
	[eipidyn] [int] NULL,
	[ertuven] [int] NULL,
	[ertuv1n] [int] NULL,
	[ertuv2n] [int] NULL,
	[ertuv3n] [int] NULL,
	[ertuv4n] [int] NULL,
	[ertuv5n] [int] NULL,
	[ertuv6n] [int] NULL,
	[ertuv7n] [int] NULL,
	[ertuv8n] [int] NULL,
	[ertuv9n] [int] NULL,
	[ertuv10n] [int] NULL,
	[ertuvyn] [int] NULL,
	[ertumen] [int] NULL,
	[ertum1n] [int] NULL,
	[ertum2n] [int] NULL,
	[ertum3n] [int] NULL,
	[ertum4n] [int] NULL,
	[ertum5n] [int] NULL,
	[ertum6n] [int] NULL,
	[ertum7n] [int] NULL,
	[ertum8n] [int] NULL,
	[ertum9n] [int] NULL,
	[ertum10n] [int] NULL,
	[ertumyn] [int] NULL,
	[tavoven] [int] NULL,
	[tavov1n] [int] NULL,
	[tavov2n] [int] NULL,
	[tavov3n] [int] NULL,
	[tavov4n] [int] NULL,
	[tavov5n] [int] NULL,
	[tavov6n] [int] NULL,
	[tavov7n] [int] NULL,
	[tavov8n] [int] NULL,
	[tavov9n] [int] NULL,
	[tavov10n] [int] NULL,
	[tavovyn] [int] NULL,
	[eipidec] [int] NULL,
	[eipidpc] [int] NULL,
	[eipidlc] [int] NULL,
	[eipidyc] [int] NULL,
	[ertuvec] [int] NULL,
	[ertuvpc] [int] NULL,
	[ertuvlc] [int] NULL,
	[ertuvyc] [int] NULL,
	[ertumec] [int] NULL,
	[ertumpc] [int] NULL,
	[ertumlc] [int] NULL,
	[ertumyc] [int] NULL,
	[muuec] [int] NULL,
	[muupc] [int] NULL,
	[muulc] [int] NULL,
	[muuyc] [int] NULL,
	[ovec] [int] NULL,
	[ovpc] [int] NULL,
	[ovlc] [int] NULL,
	[ovyc] [int] NULL,
	[sisae] [int] NULL,
	[sisap] [int] NULL,
	[sisal] [int] NULL,
	[sisam] [int] NULL,
	[sisay] [int] NULL,
	[maeipide] [int] NULL,
	[maeipidp] [int] NULL,
	[maeipidl] [int] NULL,
	[maeipidy] [int] NULL,
	[maertuve] [int] NULL,
	[maertuvp] [int] NULL,
	[maertuvl] [int] NULL,
	[maertuvy] [int] NULL,
	[maertume] [int] NULL,
	[maertump] [int] NULL,
	[maertuml] [int] NULL,
	[maertumy] [int] NULL,
	[mamuue] [int] NULL,
	[mamuup] [int] NULL,
	[mamuul] [int] NULL,
	[mamuuy] [int] NULL,
	[maove] [int] NULL,
	[maovp] [int] NULL,
	[maovl] [int] NULL,
	[maovy] [int] NULL,
	[kueipide] [int] NULL,
	[kueipidp] [int] NULL,
	[kueipidl] [int] NULL,
	[kueipidy] [int] NULL,
	[kuertuve] [int] NULL,
	[kuertuvp] [int] NULL,
	[kuertuvl] [int] NULL,
	[kuertuvy] [int] NULL,
	[kuertume] [int] NULL,
	[kuertump] [int] NULL,
	[kuertuml] [int] NULL,
	[kuertumy] [int] NULL,
	[kumuue] [int] NULL,
	[kumuup] [int] NULL,
	[kumuul] [int] NULL,
	[kumuuy] [int] NULL,
	[kuove] [int] NULL,
	[kuovp] [int] NULL,
	[kuovl] [int] NULL,
	[kuovy] [int] NULL,
	[vieipide] [int] NULL,
	[vieipidp] [int] NULL,
	[vieipidl] [int] NULL,
	[vieipidy] [int] NULL,
	[viertuve] [int] NULL,
	[viertuvp] [int] NULL,
	[viertuvl] [int] NULL,
	[viertuvy] [int] NULL,
	[viertume] [int] NULL,
	[viertump] [int] NULL,
	[viertuml] [int] NULL,
	[viertumy] [int] NULL,
	[vimuue] [int] NULL,
	[vimuup] [int] NULL,
	[vimuul] [int] NULL,
	[vimuuy] [int] NULL,
	[viove] [int] NULL,
	[viovp] [int] NULL,
	[viovl] [int] NULL,
	[viovy] [int] NULL,
	[ika61] [int] NULL,
	[ika61n] [int] NULL,
	[ika71] [int] NULL,
	[ika71n] [int] NULL,
	[ika81] [int] NULL,
	[ika81n] [int] NULL,
	[ika91] [int] NULL,
	[ika91n] [int] NULL,
	[ika1] [int] NULL,
	[ika1n] [int] NULL,
	[lykk] [int] NULL,
	[lykkn] [int] NULL,
	[jopo] [int] NULL,
	[jopon] [int] NULL,
	[kan17v] [int] NULL,
	[muu17v] [int] NULL,
	[op17v] [int] NULL,
	[lukoko] [int] NULL,
	[lukokon] [int] NULL,
	[luib] [int] NULL,
	[luibn] [int] NULL,
	[reife] [int] NULL,
	[reifen] [int] NULL,
	[gymn] [int] NULL,
	[gymnn] [int] NULL,
	[lueb] [int] NULL,
	[luebn] [int] NULL,
	[lukio] [int] NULL,
	[lukion] [int] NULL,
	[opsamm] [int] NULL,
	[opsammn] [int] NULL,
	[muuamm] [int] NULL,
	[muuammn] [int] NULL,
	[amm] [int] NULL,
	[ammn] [int] NULL,
	[peain] [int] NULL,
	[peainn] [int] NULL,
	[luain] [int] NULL,
	[luainn] [int] NULL,
	[vapsiv] [int] NULL,
	[vapsivn] [int] NULL,
	[taiop] [int] NULL,
	[taiopn] [int] NULL,
	[muukoul] [int] NULL,
	[muukouln] [int] NULL,
	[muuop] [int] NULL,
	[muuopn] [int] NULL,
	[tehoec] [int] NULL,
	[teho16c] [int] NULL,
	[teho79c] [int] NULL,
	[teholc] [int] NULL,
	[tehoyc] [int] NULL,
	[ertuec] [int] NULL,
	[ertu16c] [int] NULL,
	[ertu79c] [int] NULL,
	[ertulc] [int] NULL,
	[ertuyc] [int] NULL,
	[eritec] [int] NULL,
	[erit16c] [int] NULL,
	[erit79c] [int] NULL,
	[eritlc] [int] NULL,
	[erityc] [int] NULL,
	[inte4] [int] NULL,
	[int164] [int] NULL,
	[int794] [int] NULL,
	[intl4] [int] NULL,
	[inty4] [int] NULL,
	[inte3] [int] NULL,
	[int163] [int] NULL,
	[int793] [int] NULL,
	[intl3] [int] NULL,
	[inty3] [int] NULL,
	[inte2] [int] NULL,
	[int162] [int] NULL,
	[int792] [int] NULL,
	[intl2] [int] NULL,
	[inty2] [int] NULL,
	[inte1] [int] NULL,
	[int161] [int] NULL,
	[int791] [int] NULL,
	[intl1] [int] NULL,
	[inty1] [int] NULL,
	[inte0] [int] NULL,
	[int160] [int] NULL,
	[int790] [int] NULL,
	[intl0] [int] NULL,
	[inty0] [int] NULL,
	[intey] [int] NULL,
	[int16y] [int] NULL,
	[int79y] [int] NULL,
	[intly] [int] NULL,
	[intyy] [int] NULL,
	[yks160] [int] NULL,
	[yks790] [int] NULL,
	[yksl0] [int] NULL,
	[yksy0] [int] NULL,
	[yks161] [int] NULL,
	[yks791] [int] NULL,
	[yksl1] [int] NULL,
	[yksy1] [int] NULL,
	[yks162] [int] NULL,
	[yks792] [int] NULL,
	[yksl2] [int] NULL,
	[yksy2] [int] NULL,
	[yks164] [int] NULL,
	[yks794] [int] NULL,
	[yksl4] [int] NULL,
	[yksy4] [int] NULL,
	[yks16t] [int] NULL,
	[yks79t] [int] NULL,
	[ykslt] [int] NULL,
	[yksyt] [int] NULL,
	[yks16y] [int] NULL,
	[yks79y] [int] NULL,
	[yksly] [int] NULL,
	[yksyy] [int] NULL,
	[tehoosa] [int] NULL,
	[ertuosa] [int] NULL,
	[eritosa] [int] NULL,
	[tehotuki] [int] NULL,
	[ertutuki] [int] NULL,
	[erittuki] [int] NULL,
	[tehoavu] [int] NULL,
	[ertuavu] [int] NULL,
	[eritavu] [int] NULL,
	[tehomuu] [int] NULL,
	[ertumuu] [int] NULL,
	[eritmuu] [int] NULL,
	[alc] [int] NULL,
	[ylc] [int] NULL,
	[luc] [int] NULL,
	[amc] [int] NULL,
	[alkieli0] [int] NULL,
	[alkieli1] [int] NULL,
	[alkieli2] [int] NULL,
	[alkieli3] [int] NULL,
	[alkieli4] [int] NULL,
	[alkieliy] [int] NULL,
	[ylkieli0] [int] NULL,
	[ylkieli1] [int] NULL,
	[ylkieli2] [int] NULL,
	[ylkieli3] [int] NULL,
	[ylkieli4] [int] NULL,
	[ylkieli5] [int] NULL,
	[ylkieliy] [int] NULL,
	[lukieli0] [int] NULL,
	[lukieli1] [int] NULL,
	[lukieli2] [int] NULL,
	[lukieli3] [int] NULL,
	[lukieli4] [int] NULL,
	[lukieli5] [int] NULL,
	[lukieli6] [int] NULL,
	[lukieliy] [int] NULL,
	[amkieli0] [int] NULL,
	[amkieli1] [int] NULL,
	[amkieli2] [int] NULL,
	[amkieli3] [int] NULL,
	[amkieli4] [int] NULL,
	[amkieli5] [int] NULL,
	[amkieli6] [int] NULL,
	[amkieliy] [int] NULL,
	[aleny] [int] NULL,
	[alruy] [int] NULL,
	[alsuy] [int] NULL,
	[alray] [int] NULL,
	[alsay] [int] NULL,
	[alvey] [int] NULL,
	[alesy] [int] NULL,
	[ality] [int] NULL,
	[alsaay] [int] NULL,
	[almuy] [int] NULL,
	[yleny] [int] NULL,
	[ylruy] [int] NULL,
	[ylsuy] [int] NULL,
	[ylray] [int] NULL,
	[ylsay] [int] NULL,
	[ylvey] [int] NULL,
	[ylesy] [int] NULL,
	[ylity] [int] NULL,
	[ylsaay] [int] NULL,
	[yllaty] [int] NULL,
	[ylmuy] [int] NULL,
	[lueny] [int] NULL,
	[luruy] [int] NULL,
	[lusuy] [int] NULL,
	[luray] [int] NULL,
	[lusay] [int] NULL,
	[luvey] [int] NULL,
	[luesy] [int] NULL,
	[luity] [int] NULL,
	[lusaay] [int] NULL,
	[lulaty] [int] NULL,
	[lumuy] [int] NULL,
	[ameny] [int] NULL,
	[amruy] [int] NULL,
	[amsuy] [int] NULL,
	[amray] [int] NULL,
	[amsay] [int] NULL,
	[amvey] [int] NULL,
	[amesy] [int] NULL,
	[amity] [int] NULL,
	[amsaay] [int] NULL,
	[amlaty] [int] NULL,
	[ammuy] [int] NULL,
	[ov1c] [int] NULL,
	[ov2c] [int] NULL,
	[ov3c] [int] NULL,
	[ov4c] [int] NULL,
	[ov5c] [int] NULL,
	[ov6c] [int] NULL,
	[ov16yc] [int] NULL,
	[ov16nc] [int] NULL,
	[eng1] [int] NULL,
	[ru1] [int] NULL,
	[su1] [int] NULL,
	[ra1] [int] NULL,
	[sa1] [int] NULL,
	[ve1] [int] NULL,
	[es1] [int] NULL,
	[it1] [int] NULL,
	[saa1] [int] NULL,
	[mu1] [int] NULL,
	[eopis1] [int] NULL,
	[eng2] [int] NULL,
	[ru2] [int] NULL,
	[su2] [int] NULL,
	[ra2] [int] NULL,
	[sa2] [int] NULL,
	[ve2] [int] NULL,
	[es2] [int] NULL,
	[it2] [int] NULL,
	[saa2] [int] NULL,
	[mu2] [int] NULL,
	[eopis2] [int] NULL,
	[eng3] [int] NULL,
	[ru3] [int] NULL,
	[su3] [int] NULL,
	[ra3] [int] NULL,
	[sa3] [int] NULL,
	[ve3] [int] NULL,
	[es3] [int] NULL,
	[it3] [int] NULL,
	[saa3] [int] NULL,
	[mu3] [int] NULL,
	[eopis3] [int] NULL,
	[eng4] [int] NULL,
	[ru4] [int] NULL,
	[su4] [int] NULL,
	[ra4] [int] NULL,
	[sa4] [int] NULL,
	[ve4] [int] NULL,
	[es4] [int] NULL,
	[it4] [int] NULL,
	[saa4] [int] NULL,
	[mu4] [int] NULL,
	[eopis4] [int] NULL,
	[eng5] [int] NULL,
	[ru5] [int] NULL,
	[su5] [int] NULL,
	[ra5] [int] NULL,
	[sa5] [int] NULL,
	[ve5] [int] NULL,
	[es5] [int] NULL,
	[it5] [int] NULL,
	[saa5] [int] NULL,
	[mu5] [int] NULL,
	[eopis5] [int] NULL,
	[eng6] [int] NULL,
	[ru6] [int] NULL,
	[su6] [int] NULL,
	[ra6] [int] NULL,
	[sa6] [int] NULL,
	[ve6] [int] NULL,
	[es6] [int] NULL,
	[it6] [int] NULL,
	[saa6] [int] NULL,
	[mu6] [int] NULL,
	[eopis6] [int] NULL,
	[eny] [int] NULL,
	[ruy] [int] NULL,
	[suy] [int] NULL,
	[ray] [int] NULL,
	[say] [int] NULL,
	[vey] [int] NULL,
	[esy] [int] NULL,
	[ity] [int] NULL,
	[saay] [int] NULL,
	[muy] [int] NULL,
	[eopisy] [int] NULL,
	[enn] [int] NULL,
	[run] [int] NULL,
	[sun] [int] NULL,
	[ran] [int] NULL,
	[san] [int] NULL,
	[ven] [int] NULL,
	[esn] [int] NULL,
	[itn] [int] NULL,
	[saan] [int] NULL,
	[mun] [int] NULL,
	[eopisn] [int] NULL,
	[ven1] [int] NULL,
	[vru1] [int] NULL,
	[vsu1] [int] NULL,
	[vra1] [int] NULL,
	[vsa1] [int] NULL,
	[vve1] [int] NULL,
	[ves1] [int] NULL,
	[vit1] [int] NULL,
	[vsaa1] [int] NULL,
	[vmu1] [int] NULL,
	[vyht1] [int] NULL,
	[ven2] [int] NULL,
	[vru2] [int] NULL,
	[vsu2] [int] NULL,
	[vra2] [int] NULL,
	[vsa2] [int] NULL,
	[vve2] [int] NULL,
	[ves2] [int] NULL,
	[vit2] [int] NULL,
	[vsaa2] [int] NULL,
	[vmu2] [int] NULL,
	[vyht2] [int] NULL,
	[ven3] [int] NULL,
	[vru3] [int] NULL,
	[vsu3] [int] NULL,
	[vra3] [int] NULL,
	[vsa3] [int] NULL,
	[vve3] [int] NULL,
	[ves3] [int] NULL,
	[vit3] [int] NULL,
	[vsaa3] [int] NULL,
	[vmu3] [int] NULL,
	[vyht3] [int] NULL,
	[ven4] [int] NULL,
	[vru4] [int] NULL,
	[vsu4] [int] NULL,
	[vra4] [int] NULL,
	[vsa4] [int] NULL,
	[vve4] [int] NULL,
	[ves4] [int] NULL,
	[vit4] [int] NULL,
	[vsaa4] [int] NULL,
	[vmu4] [int] NULL,
	[vyht4] [int] NULL,
	[ven5] [int] NULL,
	[vru5] [int] NULL,
	[vsu5] [int] NULL,
	[vra5] [int] NULL,
	[vsa5] [int] NULL,
	[vve5] [int] NULL,
	[ves5] [int] NULL,
	[vit5] [int] NULL,
	[vsaa5] [int] NULL,
	[vmu5] [int] NULL,
	[vyht5] [int] NULL,
	[ven6] [int] NULL,
	[vru6] [int] NULL,
	[vsu6] [int] NULL,
	[vra6] [int] NULL,
	[vsa6] [int] NULL,
	[vve6] [int] NULL,
	[ves6] [int] NULL,
	[vit6] [int] NULL,
	[vsaa6] [int] NULL,
	[vmu6] [int] NULL,
	[vyht6] [int] NULL,
	[veny] [int] NULL,
	[vruy] [int] NULL,
	[vsuy] [int] NULL,
	[vray] [int] NULL,
	[vsay] [int] NULL,
	[vvey] [int] NULL,
	[vesy] [int] NULL,
	[vity] [int] NULL,
	[vsaay] [int] NULL,
	[vmuy] [int] NULL,
	[vyht] [int] NULL,
	[venn] [int] NULL,
	[vrun] [int] NULL,
	[vsun] [int] NULL,
	[vran] [int] NULL,
	[vsan] [int] NULL,
	[vven] [int] NULL,
	[vesn] [int] NULL,
	[vitn] [int] NULL,
	[vsaan] [int] NULL,
	[vmun] [int] NULL,
	[vtyt] [int] NULL,
	[ov79yc] [int] NULL,
	[ov79nc] [int] NULL,
	[yaen1] [int] NULL,
	[yaru1] [int] NULL,
	[yasu1] [int] NULL,
	[yara1] [int] NULL,
	[yasa1] [int] NULL,
	[yave1] [int] NULL,
	[yaes1] [int] NULL,
	[yait1] [int] NULL,
	[yasaa1] [int] NULL,
	[yalat1] [int] NULL,
	[yamuu1] [int] NULL,
	[yaen2] [int] NULL,
	[yaru2] [int] NULL,
	[yasu2] [int] NULL,
	[yara2] [int] NULL,
	[yasa2] [int] NULL,
	[yave2] [int] NULL,
	[yaes2] [int] NULL,
	[yait2] [int] NULL,
	[yasaa2] [int] NULL,
	[yalat2] [int] NULL,
	[yamuu2] [int] NULL,
	[yyen] [int] NULL,
	[yyru] [int] NULL,
	[yysu] [int] NULL,
	[yyra] [int] NULL,
	[yysa] [int] NULL,
	[yen] [int] NULL,
	[yru] [int] NULL,
	[ysu] [int] NULL,
	[yra] [int] NULL,
	[ysa] [int] NULL,
	[yve] [int] NULL,
	[yes] [int] NULL,
	[yit] [int] NULL,
	[ysaa] [int] NULL,
	[ylat] [int] NULL,
	[ymuu] [int] NULL,
	[enyy] [int] NULL,
	[ruyy] [int] NULL,
	[suyy] [int] NULL,
	[rayy] [int] NULL,
	[sayy] [int] NULL,
	[veyy] [int] NULL,
	[esyy] [int] NULL,
	[ityy] [int] NULL,
	[saayy] [int] NULL,
	[layy] [int] NULL,
	[muyy] [int] NULL,
	[yaen1n] [int] NULL,
	[yaru1n] [int] NULL,
	[yasu1n] [int] NULL,
	[yara1n] [int] NULL,
	[yasa1n] [int] NULL,
	[yave1n] [int] NULL,
	[yaes1n] [int] NULL,
	[yait1n] [int] NULL,
	[yasaa1n] [int] NULL,
	[yalat1n] [int] NULL,
	[yamuu1n] [int] NULL,
	[yaen2n] [int] NULL,
	[yaru2n] [int] NULL,
	[yasu2n] [int] NULL,
	[yara2n] [int] NULL,
	[yasa2n] [int] NULL,
	[yave2n] [int] NULL,
	[yaes2n] [int] NULL,
	[yait2n] [int] NULL,
	[yasaa2n] [int] NULL,
	[yalat2n] [int] NULL,
	[yamuu2n] [int] NULL,
	[yyenn] [int] NULL,
	[yyrun] [int] NULL,
	[yysun] [int] NULL,
	[yyran] [int] NULL,
	[yysan] [int] NULL,
	[yenn] [int] NULL,
	[yrun] [int] NULL,
	[ysun] [int] NULL,
	[yran] [int] NULL,
	[ysan] [int] NULL,
	[yven] [int] NULL,
	[yesn] [int] NULL,
	[yitn] [int] NULL,
	[ysaan] [int] NULL,
	[ylatn] [int] NULL,
	[ymuun] [int] NULL,
	[ennn] [int] NULL,
	[runn] [int] NULL,
	[sunn] [int] NULL,
	[rann] [int] NULL,
	[sann] [int] NULL,
	[vennn] [int] NULL,
	[esnn] [int] NULL,
	[itnn] [int] NULL,
	[saann] [int] NULL,
	[lann] [int] NULL,
	[munn] [int] NULL,
	[asv] [int] NULL,
	[arv] [int] NULL,
	[asvrv] [int] NULL,
	[ysv] [int] NULL,
	[yrv] [int] NULL,
	[ysvrv] [int] NULL,
	[sv] [int] NULL,
	[rv] [int] NULL,
	[svrv] [int] NULL,
	[aev] [int] NULL,
	[aort] [int] NULL,
	[aisl] [int] NULL,
	[amu] [int] NULL,
	[aet] [int] NULL,
	[aeos] [int] NULL,
	[akay] [int] NULL,
	[yev] [int] NULL,
	[yort] [int] NULL,
	[yisl] [int] NULL,
	[ymu] [int] NULL,
	[yet] [int] NULL,
	[yeos] [int] NULL,
	[ykay] [int] NULL,
	[ev] [int] NULL,
	[ort] [int] NULL,
	[isl] [int] NULL,
	[mu] [int] NULL,
	[et] [int] NULL,
	[eos] [int] NULL,
	[kay] [int] NULL,
	[ov89yc] [int] NULL,
	[ov89nc] [int] NULL,
	[ai] [int] NULL,
	[rsb] [int] NULL,
	[ma] [int] NULL,
	[yl] [int] NULL,
	[bi] [int] NULL,
	[ge] [int] NULL,
	[fy] [int] NULL,
	[ke] [int] NULL,
	[ter] [int] NULL,
	[ue] [int] NULL,
	[eti] [int] NULL,
	[hi] [int] NULL,
	[yh] [int] NULL,
	[mus] [int] NULL,
	[ku] [int] NULL,
	[tt] [int] NULL,
	[ts] [int] NULL,
	[li] [int] NULL,
	[ko] [int] NULL,
	[yhd] [int] NULL,
	[ain] [int] NULL,
	[rsbn] [int] NULL,
	[man] [int] NULL,
	[yln] [int] NULL,
	[bin] [int] NULL,
	[gen] [int] NULL,
	[fyn] [int] NULL,
	[ken] [int] NULL,
	[tern] [int] NULL,
	[uen] [int] NULL,
	[etin] [int] NULL,
	[hin] [int] NULL,
	[yhn] [int] NULL,
	[musn] [int] NULL,
	[kun] [int] NULL,
	[ttn] [int] NULL,
	[tsn] [int] NULL,
	[lin] [int] NULL,
	[kon] [int] NULL,
	[yhdn] [int] NULL,
	[tietop] [int] NULL,
	[tietok] [int] NULL,
	[tietoi] [int] NULL,
	[verkko] [int] NULL,
	[kaytto] [nchar](1) NULL,
	[tietolahde] [varchar](255) NULL,
	[rivinumero] [varchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sp] [nvarchar](10) NULL,
	[aikielir1] [nvarchar](10) NULL,
	[ikar1] [nvarchar](10) NULL,
	[opmast] [nvarchar](10) NULL,
	[tutklaja] [nvarchar](10) NULL,
	[opmopa] [nvarchar](10) NULL,
	[tilvasmaak] [varchar](2) NULL,
	[tol2008_m1] [nvarchar](20) NULL,
	[tol2008_m2] [nvarchar](20) NULL,
	[amm2001_m1] [nvarchar](20) NULL,
	[amm2001_m2] [nvarchar](20) NULL,
	[tsekt] [nvarchar](10) NULL,
	[tmaak] [nvarchar](10) NULL,
	[sose] [nvarchar](10) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[ikar1] [nvarchar](10) NULL,
	[opmast] [nvarchar](10) NULL,
	[tutklaja] [nvarchar](10) NULL,
	[opmopa] [nvarchar](10) NULL,
	[tol2008_m1] [nvarchar](20) NULL,
	[tol2008_m2] [nvarchar](20) NULL,
	[tol2008] [nvarchar](20) NULL,
	[amm2001_m1] [nvarchar](20) NULL,
	[amm2001_m2] [nvarchar](20) NULL,
	[tmaak] [nvarchar](10) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aikielir1] [nvarchar](10) NULL,
	[ika] [nvarchar](10) NULL,
	[tilvasmaak] [nvarchar](10) NULL,
	[tol2008_m1] [nvarchar](20) NULL,
	[tol2008_m2] [nvarchar](20) NULL,
	[amm2001_m1] [nvarchar](20) NULL,
	[amm2001_m2] [nvarchar](20) NULL,
	[tmaak] [nvarchar](10) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_R4_16_Tyossakayvat_ammateittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_R4_16_Tyossakayvat_ammateittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_R4_16_Tyossakayvat_ammateittain](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sp] [nvarchar](10) NULL,
	[aikielir1] [nvarchar](10) NULL,
	[ika] [nvarchar](10) NULL,
	[opmast] [nvarchar](10) NULL,
	[tutklaja] [nvarchar](10) NULL,
	[opmopa] [nvarchar](10) NULL,
	[amm2001_m1] [nvarchar](20) NULL,
	[amm2001_m2] [nvarchar](20) NULL,
	[amm2001_m] [nvarchar](20) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](10) NULL,
	[rivinumero] [int] NULL,
	[tmaak] [nvarchar](10) NULL,
	[amm2001_mnim] [nvarchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](10) NULL,
	[sp] [nvarchar](10) NULL,
	[aikielir1] [nvarchar](10) NULL,
	[ika] [nvarchar](10) NULL,
	[elaji] [nvarchar](10) NULL,
	[elk_koodi] [nvarchar](10) NULL,
	[ptoim1r8x] [nvarchar](10) NULL,
	[tmaakx] [nvarchar](10) NULL,
	[amm2001_m1x] [nvarchar](10) NULL,
	[amm2001_m2x] [nvarchar](20) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[tietojen_ajankohta] [nvarchar](10) NULL,
	[tiet_ak] [nvarchar](4) NULL,
	[tiet_akdate] [date] NULL,
	[aineisto] [nvarchar](8) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](10) NULL,
	[sp] [nvarchar](10) NULL,
	[aikielir1] [nvarchar](10) NULL,
	[ika] [nvarchar](10) NULL,
	[elaji] [nvarchar](10) NULL,
	[elk_koodi] [nvarchar](10) NULL,
	[ptoim1r8_2x] [nvarchar](10) NULL,
	[tmaak2x] [nvarchar](10) NULL,
	[amm2001_m1_2x] [nvarchar](10) NULL,
	[amm2001_m2_2x] [nvarchar](20) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[tietojen_ajankohta] [nvarchar](20) NULL,
	[tiet_ak] [nvarchar](4) NULL,
	[tiet_akdate] [date] NULL,
	[aineisto] [nvarchar](8) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_R4_19_R4_20_Tyollisten_ammattisiirtymat_ja_aiemmat_ammatit]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_R4_19_R4_20_Tyollisten_ammattisiirtymat_ja_aiemmat_ammatit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_R4_19_R4_20_Tyollisten_ammattisiirtymat_ja_aiemmat_ammatit](
	[tilastovuosi] [varchar](4) NULL,
	[sukupuoli_koodi] [varchar](2) NULL,
	[aidinkieli_versio1_koodi] [varchar](2) NULL,
	[ika_avain] [varchar](4) NULL,
	[tyopaikan_sijaintimaakunta_avain] [varchar](6) NULL,
	[mitenna_ammattiryhma2_koodi] [varchar](50) NULL,
	[paaasiallinen_toiminta_siirtyman_paassa_koodi] [varchar](2) NULL,
	[tyopaikan_sijainti_v_tilastovuonna_avain] [varchar](1) NULL,
	[mitenna_ammattiryhma2_siirtyman_paassa_koodi] [varchar](50) NULL,
	[lkm] [int] NULL,
	[suhteellinen_ajankohta_avain] [varchar](10) NOT NULL,
	[perusjoukko_tyolliset_avain] [varchar](4) NULL,
	[siirtyman_tarkastelusuunta_avain] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sukupuoli_koodi] [nvarchar](10) NULL,
	[aidinkieli_versio1_koodi] [nvarchar](2) NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[koulutusluokitus_avain] [nvarchar](6) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[oppisopimuskoulutus_koodi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_koodi] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] [nvarchar](2) NULL,
	[ammatillinen_koulutus_ryhma] [nvarchar](10) NULL,
	[ammatillinen_koulutus_ryhma_avain] [nvarchar](10) NULL,
	[nuorten_aikuisten_koulutus_amm_koodi] [nvarchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[ika_avain] [nvarchar](10) NULL,
	[henkiloiden_lkm] [int] NULL,
	[lulkm] [int] NULL,
	[lukoulk] [varchar](6) NULL,
	[lusuorv] [varchar](4) NULL,
	[luaikoul] [varchar](1) NULL,
	[lu_ika] [int] NULL,
	[lu_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammlkm] [int] NULL,
	[ammkoulk] [varchar](6) NULL,
	[ammsuorv] [varchar](4) NULL,
	[ammoppis] [varchar](1) NULL,
	[ammtutklaja] [varchar](1) NULL,
	[ammtutktav] [varchar](1) NULL,
	[amm_ika] [int] NULL,
	[amm_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[opistlkm] [int] NULL,
	[opistkoulk] [varchar](6) NULL,
	[opistsuorv] [varchar](4) NULL,
	[opist_ika] [int] NULL,
	[opist_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammkalkm] [int] NULL,
	[ammkakoulk] [varchar](6) NULL,
	[ammkasuorv] [varchar](4) NULL,
	[ammka_ika] [int] NULL,
	[ammka_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[amklkm] [int] NULL,
	[amkkoulk] [varchar](6) NULL,
	[amksuorv] [varchar](4) NULL,
	[amkaikoul] [varchar](1) NULL,
	[amk_ika] [int] NULL,
	[amk_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[akklkm] [int] NULL,
	[akkkoulk] [varchar](6) NULL,
	[akksuorv] [varchar](4) NULL,
	[akk_ika] [int] NULL,
	[akk_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ylamklkm] [int] NULL,
	[ylamkkoulk] [varchar](6) NULL,
	[ylamksuorv] [varchar](4) NULL,
	[ylamk_ika] [int] NULL,
	[ylamk_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ykklkm] [int] NULL,
	[ykkkoulk] [varchar](6) NULL,
	[ykksuorv] [varchar](4) NULL,
	[ykk_ika] [int] NULL,
	[ykk_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[laakerlkm] [int] NULL,
	[laakerkoulk] [varchar](6) NULL,
	[laakersuorv] [varchar](4) NULL,
	[laaker_ika] [int] NULL,
	[laaker_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[lislkm] [int] NULL,
	[liskoulk] [varchar](6) NULL,
	[lissuorv] [varchar](4) NULL,
	[lis_ika] [int] NULL,
	[lis_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[tohtlkm] [int] NULL,
	[tohtkoulk] [varchar](6) NULL,
	[tohtsuorv] [varchar](4) NULL,
	[toht_ika] [int] NULL,
	[toht_aiempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[tarkastelujakso_koodi] [nvarchar](20) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sukupuoli_koodi] [nvarchar](10) NULL,
	[aidinkieli_versio1_koodi] [nvarchar](2) NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[koulutusluokitus_avain] [nvarchar](6) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[oppisopimuskoulutus_koodi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_koodi] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] [nvarchar](2) NULL,
	[ammatillinen_koulutus_ryhma] [nvarchar](10) NULL,
	[ammatillinen_koulutus_ryhma_avain] [nvarchar](10) NULL,
	[nuorten_aikuisten_koulutus_amm_koodi] [nvarchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[ika_avain] [nvarchar](10) NULL,
	[henkiloiden_lkm] [int] NULL,
	[lulkm] [int] NULL,
	[lukoulk] [varchar](6) NULL,
	[lusuorv] [varchar](4) NULL,
	[luaikoul] [varchar](1) NULL,
	[lu_ika] [int] NULL,
	[lu_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammlkm] [int] NULL,
	[ammkoulk] [varchar](6) NULL,
	[ammsuorv] [varchar](4) NULL,
	[ammoppis] [varchar](1) NULL,
	[ammtutklaja] [varchar](1) NULL,
	[ammtutktav] [varchar](1) NULL,
	[amm_ika] [int] NULL,
	[amm_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[opistlkm] [int] NULL,
	[opistkoulk] [varchar](6) NULL,
	[opistsuorv] [varchar](4) NULL,
	[opist_ika] [int] NULL,
	[opist_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammkalkm] [int] NULL,
	[ammkakoulk] [varchar](6) NULL,
	[ammkasuorv] [varchar](4) NULL,
	[ammka_ika] [int] NULL,
	[ammka_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[amklkm] [int] NULL,
	[amkkoulk] [varchar](6) NULL,
	[amksuorv] [varchar](4) NULL,
	[amkaikoul] [varchar](1) NULL,
	[amk_ika] [int] NULL,
	[amk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[akklkm] [int] NULL,
	[akkkoulk] [varchar](6) NULL,
	[akksuorv] [varchar](4) NULL,
	[akk_ika] [int] NULL,
	[akk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ylamklkm] [int] NULL,
	[ylamkkoulk] [varchar](6) NULL,
	[ylamksuorv] [varchar](4) NULL,
	[ylamk_ika] [int] NULL,
	[ylamk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ykklkm] [int] NULL,
	[ykkkoulk] [varchar](6) NULL,
	[ykksuorv] [varchar](4) NULL,
	[ykk_ika] [int] NULL,
	[ykk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[laakerlkm] [int] NULL,
	[laakerkoulk] [varchar](6) NULL,
	[laakersuorv] [varchar](4) NULL,
	[laaker_ika] [int] NULL,
	[laaker_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[lislkm] [int] NULL,
	[liskoulk] [varchar](6) NULL,
	[lissuorv] [varchar](4) NULL,
	[lis_ika] [int] NULL,
	[lis_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[tohtlkm] [int] NULL,
	[tohtkoulk] [varchar](6) NULL,
	[tohtsuorv] [varchar](4) NULL,
	[toht_ika] [int] NULL,
	[toht_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[tarkastelujakso_koodi] [nvarchar](20) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](5) NULL,
	[jarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[koulk_opintoala1995] [nvarchar](6) NULL,
	[koulk_opintoala2002] [nvarchar](6) NULL,
	[koulk_koulutusala2002] [nvarchar](6) NULL,
	[koulk_koulutusaste2002] [nvarchar](6) NULL,
	[kkun] [nvarchar](3) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[tilvaskun] [nvarchar](3) NULL,
	[kansal] [nvarchar](1) NULL,
	[olotamm] [nvarchar](1) NULL,
	[olosyys] [nvarchar](1) NULL,
	[rahlahde] [nvarchar](1) NULL,
	[fte] [nvarchar](1) NULL,
	[op45] [nvarchar](1) NULL,
	[op55] [nvarchar](1) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](4) NULL,
	[alvv_kksek] [nvarchar](4) NULL,
	[alvv_kksek_lasna] [nvarchar](4) NULL,
	[alvv_sek] [nvarchar](4) NULL,
	[alvv_sek_lasna] [nvarchar](4) NULL,
	[alvv_kk] [nvarchar](4) NULL,
	[alvv_kk_lasna] [nvarchar](4) NULL,
	[alvv_opa] [nvarchar](4) NULL,
	[alvv_opa_lasna] [nvarchar](4) NULL,
	[koulutyp] [nvarchar](1) NULL,
	[om] [nvarchar](1) NULL,
	[avo] [nvarchar](1) NULL,
	[aikyotutk] [nvarchar](1) NULL,
	[aikyotutkkoulk] [nvarchar](6) NULL,
	[aikyotutkkoulk_opintoala1995] [nvarchar](6) NULL,
	[aikyotutkkoulk_opintoala2002] [nvarchar](6) NULL,
	[aikyotutkkoulk_koulutusala2002] [nvarchar](6) NULL,
	[aikyotutkkoulk_koulutusaste2002] [nvarchar](6) NULL,
	[suvuosiyotutk] [nvarchar](4) NULL,
	[tunnyotutk] [nvarchar](5) NULL,
	[aikamm] [nvarchar](1) NULL,
	[aikammkoulk] [nvarchar](6) NULL,
	[aikammkoulk_opintoala1995] [nvarchar](6) NULL,
	[aikammkoulk_opintoala2002] [nvarchar](6) NULL,
	[aikammkoulk_koulutusala2002] [nvarchar](6) NULL,
	[aikammkoulk_koulutusaste2002] [nvarchar](6) NULL,
	[suvuosiamm] [nvarchar](4) NULL,
	[tunnamm] [nvarchar](5) NULL,
	[aikamk] [nvarchar](1) NULL,
	[aikamkkoulk] [nvarchar](6) NULL,
	[aikamkkoulk_opintoala1995] [nvarchar](6) NULL,
	[aikamkkoulk_opintoala2002] [nvarchar](6) NULL,
	[aikamkkoulk_koulutusala2002] [nvarchar](6) NULL,
	[aikamkkoulk_koulutusaste2002] [nvarchar](6) NULL,
	[suvuosiamk] [nvarchar](4) NULL,
	[tunnamk] [nvarchar](5) NULL,
	[aikylamk] [nvarchar](1) NULL,
	[aikylamkkoulk] [nvarchar](6) NULL,
	[aikylamkkoulk_opintoala1995] [nvarchar](6) NULL,
	[aikylamkkoulk_opintoala2002] [nvarchar](6) NULL,
	[aikylamkkoulk_koulutusala2002] [nvarchar](6) NULL,
	[aikylamkkoulk_koulutusaste2002] [nvarchar](6) NULL,
	[suvuosiylamk] [nvarchar](4) NULL,
	[tunnylamk] [nvarchar](5) NULL,
	[aikalkk] [nvarchar](1) NULL,
	[aikalkkkoulk] [nvarchar](6) NULL,
	[aikalkkkoulk_opintoala1995] [nvarchar](6) NULL,
	[aikalkkkoulk_opintoala2002] [nvarchar](6) NULL,
	[aikalkkkoulk_koulutusala2002] [nvarchar](6) NULL,
	[aikalkkkoulk_koulutusaste2002] [nvarchar](6) NULL,
	[suvuosialkk] [nvarchar](4) NULL,
	[tunnalkk] [nvarchar](5) NULL,
	[aikylkk] [nvarchar](1) NULL,
	[aikylkkkoulk] [nvarchar](6) NULL,
	[aikylkkkoulk_opintoala1995] [nvarchar](6) NULL,
	[aikylkkkoulk_opintoala2002] [nvarchar](6) NULL,
	[aikylkkkoulk_koulutusala2002] [nvarchar](6) NULL,
	[aikylkkkoulk_koulutusaste2002] [nvarchar](6) NULL,
	[suvuosiylkk] [nvarchar](4) NULL,
	[tunnylkk] [nvarchar](5) NULL,
	[koulked] [nvarchar](6) NULL,
	[opm02opaed] [nvarchar](3) NULL,
	[opm95opaed] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](20) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_11_Oppilaitosten_tutkintoon_johtamaton]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_11_Oppilaitosten_tutkintoon_johtamaton]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_11_Oppilaitosten_tutkintoon_johtamaton](
	[tilv] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[tunn] [nvarchar](5) NULL,
	[jarj] [nvarchar](10) NULL,
	[osa1] [int] NULL,
	[suo1] [int] NULL,
	[osa2] [int] NULL,
	[suo2] [int] NULL,
	[osa3] [int] NULL,
	[suo3] [int] NULL,
	[kur4] [int] NULL,
	[osa4] [int] NULL,
	[nai4] [int] NULL,
	[tun4] [int] NULL,
	[kur5] [int] NULL,
	[osa5] [int] NULL,
	[nai5] [int] NULL,
	[tun5] [int] NULL,
	[kur6] [int] NULL,
	[osa6] [int] NULL,
	[nai6] [int] NULL,
	[tun6] [int] NULL,
	[kur7] [int] NULL,
	[osa7] [int] NULL,
	[nai7] [int] NULL,
	[kur8] [int] NULL,
	[osa8] [int] NULL,
	[nai8] [int] NULL,
	[kur9] [int] NULL,
	[osa9] [int] NULL,
	[nai9] [int] NULL,
	[kur10] [int] NULL,
	[osa10] [int] NULL,
	[nai10] [int] NULL,
	[kur11] [int] NULL,
	[osa11] [int] NULL,
	[nai11] [int] NULL,
	[kur12] [int] NULL,
	[osa12] [int] NULL,
	[nai12] [int] NULL,
	[kur13] [int] NULL,
	[osa13] [int] NULL,
	[nai13] [int] NULL,
	[kur14] [int] NULL,
	[osa14] [int] NULL,
	[nai14] [int] NULL,
	[kurd] [int] NULL,
	[osad] [int] NULL,
	[naid] [int] NULL,
	[E11] [int] NULL,
	[E12] [int] NULL,
	[E13] [int] NULL,
	[E14] [int] NULL,
	[E15] [int] NULL,
	[E16] [int] NULL,
	[E17] [int] NULL,
	[E18] [int] NULL,
	[E19] [int] NULL,
	[E21] [int] NULL,
	[E22] [int] NULL,
	[E23] [int] NULL,
	[E24] [int] NULL,
	[E25] [int] NULL,
	[E26] [int] NULL,
	[E27] [int] NULL,
	[E28] [int] NULL,
	[E29] [int] NULL,
	[E31] [int] NULL,
	[E32] [int] NULL,
	[E33] [int] NULL,
	[E34] [int] NULL,
	[E35] [int] NULL,
	[E36] [int] NULL,
	[E37] [int] NULL,
	[E38] [int] NULL,
	[E39] [int] NULL,
	[E41] [int] NULL,
	[E42] [int] NULL,
	[E43] [int] NULL,
	[E44] [int] NULL,
	[E45] [int] NULL,
	[E46] [int] NULL,
	[E47] [int] NULL,
	[E48] [int] NULL,
	[E49] [int] NULL,
	[E51] [int] NULL,
	[E52] [int] NULL,
	[E53] [int] NULL,
	[E54] [int] NULL,
	[E55] [int] NULL,
	[E56] [int] NULL,
	[E57] [int] NULL,
	[E58] [int] NULL,
	[E59] [int] NULL,
	[E61] [int] NULL,
	[E62] [int] NULL,
	[E63] [int] NULL,
	[E64] [int] NULL,
	[E65] [int] NULL,
	[E66] [int] NULL,
	[E67] [int] NULL,
	[E68] [int] NULL,
	[E69] [int] NULL,
	[E71] [int] NULL,
	[E72] [int] NULL,
	[E73] [int] NULL,
	[E74] [int] NULL,
	[E75] [int] NULL,
	[E76] [int] NULL,
	[E77] [int] NULL,
	[E78] [int] NULL,
	[E79] [int] NULL,
	[E81] [int] NULL,
	[E82] [int] NULL,
	[E83] [int] NULL,
	[E84] [int] NULL,
	[E85] [int] NULL,
	[E86] [int] NULL,
	[E87] [int] NULL,
	[E88] [int] NULL,
	[E89] [int] NULL,
	[E91] [int] NULL,
	[E92] [int] NULL,
	[E93] [int] NULL,
	[E94] [int] NULL,
	[E95] [int] NULL,
	[E96] [int] NULL,
	[E97] [int] NULL,
	[E98] [int] NULL,
	[E99] [int] NULL,
	[E101] [int] NULL,
	[E102] [int] NULL,
	[E103] [int] NULL,
	[E104] [int] NULL,
	[E105] [int] NULL,
	[E106] [int] NULL,
	[E107] [int] NULL,
	[E108] [int] NULL,
	[E109] [int] NULL,
	[E111] [int] NULL,
	[E112] [int] NULL,
	[E113] [int] NULL,
	[E114] [int] NULL,
	[E115] [int] NULL,
	[E116] [int] NULL,
	[E117] [int] NULL,
	[E118] [int] NULL,
	[E119] [int] NULL,
	[E121] [int] NULL,
	[E122] [int] NULL,
	[E123] [int] NULL,
	[E124] [int] NULL,
	[E125] [int] NULL,
	[E126] [int] NULL,
	[E127] [int] NULL,
	[E128] [int] NULL,
	[E129] [int] NULL,
	[E131] [int] NULL,
	[E132] [int] NULL,
	[E133] [int] NULL,
	[E134] [int] NULL,
	[E135] [int] NULL,
	[E136] [int] NULL,
	[E137] [int] NULL,
	[E138] [int] NULL,
	[E139] [int] NULL,
	[E141] [int] NULL,
	[E142] [int] NULL,
	[E143] [int] NULL,
	[E144] [int] NULL,
	[E145] [int] NULL,
	[E146] [int] NULL,
	[E147] [int] NULL,
	[E148] [int] NULL,
	[E149] [int] NULL,
	[E151] [int] NULL,
	[E152] [int] NULL,
	[E153] [int] NULL,
	[E154] [int] NULL,
	[E155] [int] NULL,
	[E156] [int] NULL,
	[E157] [int] NULL,
	[E158] [int] NULL,
	[E159] [int] NULL,
	[E161] [int] NULL,
	[E162] [int] NULL,
	[E163] [int] NULL,
	[E164] [int] NULL,
	[E165] [int] NULL,
	[E166] [int] NULL,
	[E167] [int] NULL,
	[E168] [int] NULL,
	[E169] [int] NULL,
	[E171] [int] NULL,
	[E172] [int] NULL,
	[E173] [int] NULL,
	[E174] [int] NULL,
	[E175] [int] NULL,
	[E176] [int] NULL,
	[E177] [int] NULL,
	[E178] [int] NULL,
	[E179] [int] NULL,
	[E181] [int] NULL,
	[E182] [int] NULL,
	[E183] [int] NULL,
	[E184] [int] NULL,
	[E185] [int] NULL,
	[E186] [int] NULL,
	[E187] [int] NULL,
	[E188] [int] NULL,
	[E189] [int] NULL,
	[E191] [int] NULL,
	[E192] [int] NULL,
	[E193] [int] NULL,
	[E194] [int] NULL,
	[E195] [int] NULL,
	[E196] [int] NULL,
	[E197] [int] NULL,
	[E198] [int] NULL,
	[E199] [int] NULL,
	[E201] [int] NULL,
	[E202] [int] NULL,
	[E203] [int] NULL,
	[E204] [int] NULL,
	[E205] [int] NULL,
	[E206] [int] NULL,
	[E207] [int] NULL,
	[E208] [int] NULL,
	[E209] [int] NULL,
	[E211] [int] NULL,
	[E212] [int] NULL,
	[E213] [int] NULL,
	[E214] [int] NULL,
	[E215] [int] NULL,
	[E216] [int] NULL,
	[E217] [int] NULL,
	[E218] [int] NULL,
	[E219] [int] NULL,
	[E221] [int] NULL,
	[E222] [int] NULL,
	[E223] [int] NULL,
	[E224] [int] NULL,
	[E225] [int] NULL,
	[E226] [int] NULL,
	[E227] [int] NULL,
	[E228] [int] NULL,
	[E229] [int] NULL,
	[E231] [int] NULL,
	[E232] [int] NULL,
	[E233] [int] NULL,
	[E234] [int] NULL,
	[E235] [int] NULL,
	[E236] [int] NULL,
	[E237] [int] NULL,
	[E238] [int] NULL,
	[E239] [int] NULL,
	[E241] [int] NULL,
	[E242] [int] NULL,
	[E243] [int] NULL,
	[E244] [int] NULL,
	[E245] [int] NULL,
	[E246] [int] NULL,
	[E247] [int] NULL,
	[E248] [int] NULL,
	[E249] [int] NULL,
	[E251] [int] NULL,
	[E252] [int] NULL,
	[E253] [int] NULL,
	[E254] [int] NULL,
	[E255] [int] NULL,
	[E256] [int] NULL,
	[E257] [int] NULL,
	[E258] [int] NULL,
	[E259] [int] NULL,
	[E261] [int] NULL,
	[E262] [int] NULL,
	[E263] [int] NULL,
	[E264] [int] NULL,
	[E265] [int] NULL,
	[E266] [int] NULL,
	[E267] [int] NULL,
	[E268] [int] NULL,
	[E269] [int] NULL,
	[E271] [int] NULL,
	[E272] [int] NULL,
	[E273] [int] NULL,
	[E274] [int] NULL,
	[E275] [int] NULL,
	[E276] [int] NULL,
	[E277] [int] NULL,
	[E278] [int] NULL,
	[E279] [int] NULL,
	[E281] [int] NULL,
	[E282] [int] NULL,
	[E283] [int] NULL,
	[E284] [int] NULL,
	[E285] [int] NULL,
	[E286] [int] NULL,
	[E287] [int] NULL,
	[E288] [int] NULL,
	[E289] [int] NULL,
	[E291] [int] NULL,
	[E292] [int] NULL,
	[E293] [int] NULL,
	[E294] [int] NULL,
	[E295] [int] NULL,
	[E296] [int] NULL,
	[E297] [int] NULL,
	[E298] [int] NULL,
	[E299] [int] NULL,
	[E301] [int] NULL,
	[E302] [int] NULL,
	[E303] [int] NULL,
	[E304] [int] NULL,
	[E305] [int] NULL,
	[E306] [int] NULL,
	[E307] [int] NULL,
	[E308] [int] NULL,
	[E309] [int] NULL,
	[E311] [int] NULL,
	[E312] [int] NULL,
	[E313] [int] NULL,
	[E314] [int] NULL,
	[E315] [int] NULL,
	[E316] [int] NULL,
	[E317] [int] NULL,
	[E318] [int] NULL,
	[E319] [int] NULL,
	[E321] [int] NULL,
	[E322] [int] NULL,
	[E323] [int] NULL,
	[E324] [int] NULL,
	[E325] [int] NULL,
	[E326] [int] NULL,
	[E327] [int] NULL,
	[E328] [int] NULL,
	[E329] [int] NULL,
	[E331] [int] NULL,
	[E332] [int] NULL,
	[E333] [int] NULL,
	[E334] [int] NULL,
	[E335] [int] NULL,
	[E336] [int] NULL,
	[E337] [int] NULL,
	[E338] [int] NULL,
	[E339] [int] NULL,
	[E341] [int] NULL,
	[E342] [int] NULL,
	[E343] [int] NULL,
	[E344] [int] NULL,
	[E345] [int] NULL,
	[E346] [int] NULL,
	[E347] [int] NULL,
	[E348] [int] NULL,
	[E349] [int] NULL,
	[E351] [int] NULL,
	[E352] [int] NULL,
	[E353] [int] NULL,
	[E354] [int] NULL,
	[E355] [int] NULL,
	[E356] [int] NULL,
	[E357] [int] NULL,
	[E358] [int] NULL,
	[E359] [int] NULL,
	[E361] [int] NULL,
	[E362] [int] NULL,
	[E363] [int] NULL,
	[E364] [int] NULL,
	[E365] [int] NULL,
	[E366] [int] NULL,
	[E367] [int] NULL,
	[E368] [int] NULL,
	[E369] [int] NULL,
	[E371] [int] NULL,
	[E372] [int] NULL,
	[E373] [int] NULL,
	[E374] [int] NULL,
	[E375] [int] NULL,
	[E376] [int] NULL,
	[E377] [int] NULL,
	[E378] [int] NULL,
	[E379] [int] NULL,
	[E381] [int] NULL,
	[E382] [int] NULL,
	[E383] [int] NULL,
	[E384] [int] NULL,
	[E385] [int] NULL,
	[E386] [int] NULL,
	[E387] [int] NULL,
	[E388] [int] NULL,
	[E389] [int] NULL,
	[E391] [int] NULL,
	[E392] [int] NULL,
	[E393] [int] NULL,
	[E394] [int] NULL,
	[E395] [int] NULL,
	[E396] [int] NULL,
	[E397] [int] NULL,
	[E398] [int] NULL,
	[E399] [int] NULL,
	[E401] [int] NULL,
	[E402] [int] NULL,
	[E403] [int] NULL,
	[E404] [int] NULL,
	[E405] [int] NULL,
	[E406] [int] NULL,
	[E407] [int] NULL,
	[E408] [int] NULL,
	[E409] [int] NULL,
	[E411] [int] NULL,
	[E412] [int] NULL,
	[E413] [int] NULL,
	[E414] [int] NULL,
	[E415] [int] NULL,
	[E416] [int] NULL,
	[E417] [int] NULL,
	[E418] [int] NULL,
	[E419] [int] NULL,
	[E421] [int] NULL,
	[E422] [int] NULL,
	[E423] [int] NULL,
	[E424] [int] NULL,
	[E425] [int] NULL,
	[E426] [int] NULL,
	[E427] [int] NULL,
	[E428] [int] NULL,
	[E429] [int] NULL,
	[E431] [int] NULL,
	[E432] [int] NULL,
	[E433] [int] NULL,
	[E434] [int] NULL,
	[E435] [int] NULL,
	[E436] [int] NULL,
	[E437] [int] NULL,
	[E438] [int] NULL,
	[E439] [int] NULL,
	[E441] [int] NULL,
	[E442] [int] NULL,
	[E443] [int] NULL,
	[E444] [int] NULL,
	[E445] [int] NULL,
	[E446] [int] NULL,
	[E447] [int] NULL,
	[E448] [int] NULL,
	[E449] [int] NULL,
	[E451] [int] NULL,
	[E452] [int] NULL,
	[E453] [int] NULL,
	[E454] [int] NULL,
	[E455] [int] NULL,
	[E456] [int] NULL,
	[E457] [int] NULL,
	[E458] [int] NULL,
	[E459] [int] NULL,
	[E461] [int] NULL,
	[E462] [int] NULL,
	[E463] [int] NULL,
	[E464] [int] NULL,
	[E465] [int] NULL,
	[E466] [int] NULL,
	[E467] [int] NULL,
	[E468] [int] NULL,
	[E469] [int] NULL,
	[E471] [int] NULL,
	[E472] [int] NULL,
	[E473] [int] NULL,
	[E474] [int] NULL,
	[E475] [int] NULL,
	[E476] [int] NULL,
	[E477] [int] NULL,
	[E478] [int] NULL,
	[E479] [int] NULL,
	[E481] [int] NULL,
	[E482] [int] NULL,
	[E483] [int] NULL,
	[E484] [int] NULL,
	[E485] [int] NULL,
	[E486] [int] NULL,
	[E487] [int] NULL,
	[E488] [int] NULL,
	[E489] [int] NULL,
	[E491] [int] NULL,
	[E492] [int] NULL,
	[E493] [int] NULL,
	[E494] [int] NULL,
	[E495] [int] NULL,
	[E496] [int] NULL,
	[E497] [int] NULL,
	[E498] [int] NULL,
	[E499] [int] NULL,
	[E501] [int] NULL,
	[E502] [int] NULL,
	[E503] [int] NULL,
	[E504] [int] NULL,
	[E505] [int] NULL,
	[E506] [int] NULL,
	[E507] [int] NULL,
	[E508] [int] NULL,
	[E509] [int] NULL,
	[E511] [int] NULL,
	[E512] [int] NULL,
	[E513] [int] NULL,
	[E514] [int] NULL,
	[E515] [int] NULL,
	[E516] [int] NULL,
	[E517] [int] NULL,
	[E518] [int] NULL,
	[E519] [int] NULL,
	[E521] [int] NULL,
	[E522] [int] NULL,
	[E523] [int] NULL,
	[E524] [int] NULL,
	[E525] [int] NULL,
	[E526] [int] NULL,
	[E527] [int] NULL,
	[E528] [int] NULL,
	[E529] [int] NULL,
	[E531] [int] NULL,
	[E532] [int] NULL,
	[E533] [int] NULL,
	[E534] [int] NULL,
	[E535] [int] NULL,
	[E536] [int] NULL,
	[E537] [int] NULL,
	[E538] [int] NULL,
	[E539] [int] NULL,
	[E541] [int] NULL,
	[E542] [int] NULL,
	[E543] [int] NULL,
	[E544] [int] NULL,
	[E545] [int] NULL,
	[E546] [int] NULL,
	[E547] [int] NULL,
	[E548] [int] NULL,
	[E549] [int] NULL,
	[E551] [int] NULL,
	[E552] [int] NULL,
	[E553] [int] NULL,
	[E554] [int] NULL,
	[E555] [int] NULL,
	[E556] [int] NULL,
	[E557] [int] NULL,
	[E558] [int] NULL,
	[E559] [int] NULL,
	[E561] [int] NULL,
	[E562] [int] NULL,
	[E563] [int] NULL,
	[E564] [int] NULL,
	[E565] [int] NULL,
	[E566] [int] NULL,
	[E567] [int] NULL,
	[E568] [int] NULL,
	[E569] [int] NULL,
	[E571] [int] NULL,
	[E572] [int] NULL,
	[E573] [int] NULL,
	[E574] [int] NULL,
	[E575] [int] NULL,
	[E576] [int] NULL,
	[E577] [int] NULL,
	[E578] [int] NULL,
	[E579] [int] NULL,
	[E581] [int] NULL,
	[E582] [int] NULL,
	[E583] [int] NULL,
	[E584] [int] NULL,
	[E585] [int] NULL,
	[E586] [int] NULL,
	[E587] [int] NULL,
	[E588] [int] NULL,
	[E589] [int] NULL,
	[E591] [int] NULL,
	[E592] [int] NULL,
	[E593] [int] NULL,
	[E594] [int] NULL,
	[E595] [int] NULL,
	[E596] [int] NULL,
	[E597] [int] NULL,
	[E598] [int] NULL,
	[E599] [int] NULL,
	[E601] [int] NULL,
	[E602] [int] NULL,
	[E603] [int] NULL,
	[E604] [int] NULL,
	[E605] [int] NULL,
	[E606] [int] NULL,
	[E607] [int] NULL,
	[E608] [int] NULL,
	[E609] [int] NULL,
	[E611] [int] NULL,
	[E612] [int] NULL,
	[E613] [int] NULL,
	[E614] [int] NULL,
	[E615] [int] NULL,
	[E616] [int] NULL,
	[E617] [int] NULL,
	[E618] [int] NULL,
	[E619] [int] NULL,
	[E621] [int] NULL,
	[E622] [int] NULL,
	[E623] [int] NULL,
	[E624] [int] NULL,
	[E625] [int] NULL,
	[E626] [int] NULL,
	[E627] [int] NULL,
	[E628] [int] NULL,
	[E629] [int] NULL,
	[E631] [int] NULL,
	[E632] [int] NULL,
	[E633] [int] NULL,
	[E634] [int] NULL,
	[E635] [int] NULL,
	[E636] [int] NULL,
	[E637] [int] NULL,
	[E638] [int] NULL,
	[E639] [int] NULL,
	[E641] [int] NULL,
	[E642] [int] NULL,
	[E643] [int] NULL,
	[E644] [int] NULL,
	[E645] [int] NULL,
	[E646] [int] NULL,
	[E647] [int] NULL,
	[E648] [int] NULL,
	[E649] [int] NULL,
	[E651] [int] NULL,
	[E652] [int] NULL,
	[E653] [int] NULL,
	[E654] [int] NULL,
	[E655] [int] NULL,
	[E656] [int] NULL,
	[E657] [int] NULL,
	[E658] [int] NULL,
	[E659] [int] NULL,
	[E661] [int] NULL,
	[E662] [int] NULL,
	[E663] [int] NULL,
	[E664] [int] NULL,
	[E665] [int] NULL,
	[E666] [int] NULL,
	[E667] [int] NULL,
	[E668] [int] NULL,
	[E669] [int] NULL,
	[E671] [int] NULL,
	[E672] [int] NULL,
	[E673] [int] NULL,
	[E674] [int] NULL,
	[E675] [int] NULL,
	[E676] [int] NULL,
	[E677] [int] NULL,
	[E678] [int] NULL,
	[E679] [int] NULL,
	[E681] [int] NULL,
	[E682] [int] NULL,
	[E683] [int] NULL,
	[E684] [int] NULL,
	[E685] [int] NULL,
	[E686] [int] NULL,
	[E687] [int] NULL,
	[E688] [int] NULL,
	[E689] [int] NULL,
	[E691] [int] NULL,
	[E692] [int] NULL,
	[E693] [int] NULL,
	[E694] [int] NULL,
	[E695] [int] NULL,
	[E696] [int] NULL,
	[E697] [int] NULL,
	[E698] [int] NULL,
	[E699] [int] NULL,
	[E701] [int] NULL,
	[E702] [int] NULL,
	[E703] [int] NULL,
	[E704] [int] NULL,
	[E705] [int] NULL,
	[E706] [int] NULL,
	[E707] [int] NULL,
	[E708] [int] NULL,
	[E709] [int] NULL,
	[E711] [int] NULL,
	[E712] [int] NULL,
	[E713] [int] NULL,
	[E714] [int] NULL,
	[E715] [int] NULL,
	[E716] [int] NULL,
	[E717] [int] NULL,
	[E718] [int] NULL,
	[E719] [int] NULL,
	[E721] [int] NULL,
	[E722] [int] NULL,
	[E723] [int] NULL,
	[E724] [int] NULL,
	[E725] [int] NULL,
	[E726] [int] NULL,
	[E727] [int] NULL,
	[E728] [int] NULL,
	[E729] [int] NULL,
	[E731] [int] NULL,
	[E732] [int] NULL,
	[E733] [int] NULL,
	[E734] [int] NULL,
	[E735] [int] NULL,
	[E736] [int] NULL,
	[E737] [int] NULL,
	[E738] [int] NULL,
	[E739] [int] NULL,
	[E741] [int] NULL,
	[E742] [int] NULL,
	[E743] [int] NULL,
	[E744] [int] NULL,
	[E745] [int] NULL,
	[E746] [int] NULL,
	[E747] [int] NULL,
	[E748] [int] NULL,
	[E749] [int] NULL,
	[E751] [int] NULL,
	[E752] [int] NULL,
	[E753] [int] NULL,
	[E754] [int] NULL,
	[E755] [int] NULL,
	[E756] [int] NULL,
	[E757] [int] NULL,
	[E758] [int] NULL,
	[E759] [int] NULL,
	[E1] [int] NULL,
	[E2] [int] NULL,
	[E3] [int] NULL,
	[E4] [int] NULL,
	[E5] [int] NULL,
	[E6] [int] NULL,
	[E7] [int] NULL,
	[E8] [int] NULL,
	[E9] [int] NULL,
	[osa15] [int] NULL,
	[nai15] [int] NULL,
	[osa16] [int] NULL,
	[nai16] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[aineisto] [varchar](5) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [varchar](2) NULL,
	[koulk] [varchar](6) NULL,
	[tutktav] [varchar](1) NULL,
	[tutklaja] [varchar](1) NULL,
	[ophal] [varchar](1) NULL,
	[kkieli] [varchar](2) NULL,
	[aikoul] [varchar](1) NULL,
	[kmaak] [varchar](2) NULL,
	[sp] [varchar](1) NULL,
	[aiopis] [varchar](1) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[olotamm] [varchar](1) NULL,
	[olosyys] [varchar](1) NULL,
	[tilvaskunryh] [varchar](1) NULL,
	[klajir2] [varchar](2) NULL,
	[kansal] [varchar](3) NULL,
	[lkm] [int] NULL,
	[luontipvm] [date] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [varchar](2) NULL,
	[koulk] [varchar](6) NULL,
	[tutktav] [varchar](1) NULL,
	[tutklaja] [varchar](1) NULL,
	[ophal] [varchar](1) NULL,
	[kkieli] [varchar](2) NULL,
	[aikoul] [varchar](1) NULL,
	[kmaak] [varchar](2) NULL,
	[sp] [varchar](1) NULL,
	[aiopis] [varchar](1) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[olotamm] [varchar](1) NULL,
	[olosyys] [varchar](1) NULL,
	[tilvaskunryh] [varchar](1) NULL,
	[klajir2] [varchar](2) NULL,
	[svalt] [varchar](3) NULL,
	[lkm] [int] NULL,
	[luontipvm] [date] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [varchar](2) NULL,
	[koulk] [varchar](6) NULL,
	[tutktav] [varchar](1) NULL,
	[tutklaja] [varchar](1) NULL,
	[ophal] [varchar](1) NULL,
	[kkieli] [varchar](2) NULL,
	[aikoul] [varchar](1) NULL,
	[kmaak] [varchar](2) NULL,
	[sp] [varchar](1) NULL,
	[aiopis] [varchar](1) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[olotamm] [varchar](1) NULL,
	[olosyys] [varchar](1) NULL,
	[tilvaskunryh] [varchar](1) NULL,
	[klajir2] [varchar](2) NULL,
	[aikieli] [varchar](2) NULL,
	[lkm] [int] NULL,
	[luontipvm] [date] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oltyp] [nvarchar](2) NULL,
	[koulk] [nvarchar](6) NULL,
	[koulk_opintoala] [nvarchar](6) NULL,
	[koulk_koulutusala] [nvarchar](6) NULL,
	[koulk_koulutusaste] [nvarchar](6) NULL,
	[aikoul] [nvarchar](1) NULL,
	[tutktav] [nvarchar](1) NULL,
	[tutklaja] [nvarchar](1) NULL,
	[ophal] [nvarchar](1) NULL,
	[kkun] [nvarchar](3) NULL,
	[rahoitus] [nvarchar](1) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](1) NULL,
	[olosyys] [nvarchar](1) NULL,
	[ylsivx] [nvarchar](1) NULL,
	[peruskx] [nvarchar](1) NULL,
	[oalapex] [nvarchar](2) NULL,
	[oastepex] [nvarchar](1) NULL,
	[oalapeux] [nvarchar](3) NULL,
	[oalapeux_koulutusala] [nvarchar](3) NULL,
	[oastpeux] [nvarchar](2) NULL,
	[ammvupe] [nvarchar](4) NULL,
	[nayttox] [nvarchar](1) NULL,
	[oppispex] [nvarchar](1) NULL,
	[lisakx] [nvarchar](1) NULL,
	[oalalix] [nvarchar](2) NULL,
	[oastelix] [nvarchar](1) NULL,
	[oalaliux] [nvarchar](3) NULL,
	[oalaliux_koulutusala] [nvarchar](3) NULL,
	[oastliux] [nvarchar](2) NULL,
	[ammvuli] [nvarchar](4) NULL,
	[oppislix] [nvarchar](1) NULL,
	[alempikax] [nvarchar](1) NULL,
	[oalaakx] [nvarchar](2) NULL,
	[oasteakx] [nvarchar](1) NULL,
	[oalauakx] [nvarchar](3) NULL,
	[oalauakx_koulutusala] [nvarchar](3) NULL,
	[oasteuakx] [nvarchar](2) NULL,
	[svuosiak] [nvarchar](4) NULL,
	[ylempikax] [nvarchar](1) NULL,
	[oalaykx] [nvarchar](2) NULL,
	[oasteykx] [nvarchar](1) NULL,
	[oalauykx] [nvarchar](3) NULL,
	[oalauykx_koulutusala] [nvarchar](3) NULL,
	[oasteuykx] [nvarchar](2) NULL,
	[svuosiyk] [nvarchar](4) NULL,
	[askun] [nvarchar](3) NULL,
	[syntv] [nvarchar](4) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](100) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sp] [nvarchar](1) NULL,
	[syntv] [nvarchar](4) NULL,
	[aikielir1x] [nvarchar](2) NULL,
	[tilvaskun] [nvarchar](3) NULL,
	[tilvaskunx] [nvarchar](3) NULL,
	[sose_isa1] [nvarchar](1) NULL,
	[sose_aiti1] [nvarchar](1) NULL,
	[sose_isa2] [nvarchar](2) NULL,
	[sose_aiti2] [nvarchar](2) NULL,
	[koulk_isa] [nvarchar](6) NULL,
	[koulk_aiti] [nvarchar](6) NULL,
	[tulo_isa] [nvarchar](2) NULL,
	[tulo_aiti] [nvarchar](2) NULL,
	[klaji] [nvarchar](2) NULL,
	[ophal] [nvarchar](1) NULL,
	[koulk] [nvarchar](6) NULL,
	[kkieli] [nvarchar](2) NULL,
	[kmaak] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[olosyys] [nvarchar](1) NULL,
	[uusi] [int] NULL,
	[opisk] [int] NULL,
	[tutk] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](10) NULL,
	[jarj] [nvarchar](10) NULL,
	[opjarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[kkieli] [nvarchar](2) NULL,
	[kkun] [nvarchar](3) NULL,
	[ophal] [nvarchar](2) NULL,
	[sp] [nvarchar](2) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](2) NULL,
	[olotamm] [nvarchar](2) NULL,
	[olosyys] [nvarchar](2) NULL,
	[aiopis] [nvarchar](2) NULL,
	[kirikar1] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tutklajl] [nvarchar](2) NULL,
	[aikoul] [nvarchar](2) NULL,
	[tutalv] [nvarchar](4) NULL,
	[tutalk] [nvarchar](2) NULL,
	[tutklaja] [nvarchar](2) NULL,
	[tunim] [nvarchar](5) NULL,
	[sutunim] [nvarchar](30) NULL,
	[rutunim] [nvarchar](30) NULL,
	[koohj] [nvarchar](4) NULL,
	[sukoohj] [nvarchar](60) NULL,
	[rukoohj] [nvarchar](60) NULL,
	[tutktav] [nvarchar](2) NULL,
	[tyov] [nvarchar](2) NULL,
	[rahoitus] [nvarchar](2) NULL,
	[alaika] [nvarchar](8) NULL,
	[loaika] [nvarchar](8) NULL,
	[tavoite] [nvarchar](2) NULL,
	[yrit] [nvarchar](2) NULL,
	[purku] [nvarchar](2) NULL,
	[todis] [nvarchar](2) NULL,
	[tol2008] [nvarchar](5) NULL,
	[koko] [nvarchar](2) NULL,
	[tyansek] [nvarchar](2) NULL,
	[tilvasmaak] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [nvarchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[jarj] [nvarchar](10) NULL,
	[opjarj] [nvarchar](10) NULL,
	[kkieli] [nvarchar](2) NULL,
	[koulk] [nvarchar](6) NULL,
	[kkun] [nvarchar](3) NULL,
	[ophal] [nvarchar](2) NULL,
	[sp] [nvarchar](2) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[tilvasmaak] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[aiopis] [nvarchar](2) NULL,
	[ika2] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[aikoul] [nvarchar](2) NULL,
	[tutalv] [nvarchar](4) NULL,
	[tutklaja] [nvarchar](2) NULL,
	[tunim] [nvarchar](255) NULL,
	[sutunim] [nvarchar](255) NULL,
	[rutunim] [nvarchar](255) NULL,
	[koohj] [nvarchar](100) NULL,
	[sukoohj] [nvarchar](100) NULL,
	[rukoohj] [nvarchar](100) NULL,
	[tutktav] [nvarchar](2) NULL,
	[rahoitus] [nvarchar](2) NULL,
	[tavoite] [nvarchar](2) NULL,
	[olosyys] [nvarchar](1) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [nvarchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](5) NULL,
	[jarj] [nvarchar](10) NULL,
	[opjarj] [nvarchar](10) NULL,
	[opmast] [nvarchar](6) NULL,
	[opmala] [nvarchar](6) NULL,
	[kkieli] [nvarchar](2) NULL,
	[kkun] [nvarchar](3) NULL,
	[ophal] [nvarchar](2) NULL,
	[tilvaskun] [nvarchar](3) NULL,
	[tilvaskunx] [nvarchar](3) NULL,
	[alvv] [nvarchar](4) NULL,
	[kirikar1] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tutklajl] [nvarchar](2) NULL,
	[aikoul] [nvarchar](2) NULL,
	[tutklaja] [nvarchar](2) NULL,
	[tutktav] [nvarchar](2) NULL,
	[tyov] [nvarchar](2) NULL,
	[rahoitus] [nvarchar](2) NULL,
	[tavoite] [nvarchar](2) NULL,
	[yrit] [nvarchar](2) NULL,
	[olosyys] [nvarchar](1) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [nvarchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_4_Amm_koulutuksen_tutkinnot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_4_Amm_koulutuksen_tutkinnot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_4_Amm_koulutuksen_tutkinnot](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](10) NULL,
	[jarj] [nvarchar](10) NULL,
	[opjarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[tunim] [nvarchar](5) NULL,
	[sutunim] [nvarchar](30) NULL,
	[rutunim] [nvarchar](30) NULL,
	[koohj] [nvarchar](4) NULL,
	[sukoohj] [nvarchar](60) NULL,
	[rukoohj] [nvarchar](60) NULL,
	[tutklaja] [nvarchar](1) NULL,
	[tutktav] [nvarchar](1) NULL,
	[kkieli] [nvarchar](2) NULL,
	[kkun] [nvarchar](3) NULL,
	[ophal] [nvarchar](2) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](1) NULL,
	[aiopis] [nvarchar](1) NULL,
	[aikoul] [nvarchar](1) NULL,
	[kirikar1] [nvarchar](2) NULL,
	[suorpvm] [nvarchar](8) NULL,
	[lkm] [int] NULL,
	[tutalv] [nvarchar](4) NULL,
	[tutalk] [nvarchar](1) NULL,
	[hyvennen] [int] NULL,
	[hyvaik] [int] NULL,
	[suorkouaik] [int] NULL,
	[ovyht] [int] NULL,
	[tyop] [int] NULL,
	[ammos] [int] NULL,
	[opintokok] [int] NULL,
	[tyov] [nvarchar](1) NULL,
	[rahoitus] [nvarchar](1) NULL,
	[vayla] [nvarchar](1) NULL,
	[alaika] [nvarchar](8) NULL,
	[loaika] [nvarchar](8) NULL,
	[tavoite] [nvarchar](1) NULL,
	[toteuma_tutk] [nvarchar](1) NULL,
	[yrit] [nvarchar](1) NULL,
	[purku] [nvarchar](1) NULL,
	[todis] [nvarchar](1) NULL,
	[tol2008] [nvarchar](5) NULL,
	[koko] [nvarchar](1) NULL,
	[tyansek] [nvarchar](1) NULL,
	[suorosat] [int] NULL,
	[tunn_opisk] [nvarchar](5) NULL,
	[jarj_opisk] [nvarchar](10) NULL,
	[kkun_opisk] [nvarchar](3) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [nvarchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[jarj] [nvarchar](10) NULL,
	[opjarj] [nvarchar](10) NULL,
	[kkieli] [nvarchar](2) NULL,
	[koulk] [nvarchar](6) NULL,
	[kkun] [nvarchar](3) NULL,
	[ophal] [nvarchar](2) NULL,
	[sp] [nvarchar](2) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[aiopis] [nvarchar](2) NULL,
	[ika2] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[aikoul] [nvarchar](2) NULL,
	[tutalv] [nvarchar](4) NULL,
	[tutklaja] [nvarchar](2) NULL,
	[tunim] [nvarchar](255) NULL,
	[sutunim] [nvarchar](255) NULL,
	[rutunim] [nvarchar](255) NULL,
	[koohj] [nvarchar](100) NULL,
	[sukoohj] [nvarchar](100) NULL,
	[rukoohj] [nvarchar](100) NULL,
	[tutktav] [nvarchar](2) NULL,
	[rahoitus] [nvarchar](2) NULL,
	[tavoite] [nvarchar](2) NULL,
	[tutalk] [nvarchar](2) NULL,
	[hyvennen] [nvarchar](5) NULL,
	[hyvaik] [nvarchar](5) NULL,
	[suorkouaik] [nvarchar](5) NULL,
	[ovyht] [nvarchar](5) NULL,
	[tyop] [nvarchar](5) NULL,
	[ammos] [nvarchar](5) NULL,
	[opintokok] [nvarchar](5) NULL,
	[vayla] [nvarchar](2) NULL,
	[toteuma_tutk] [nvarchar](2) NULL,
	[suorosat] [nvarchar](5) NULL,
	[jarj_opisk] [nvarchar](10) NULL,
	[kkun_opisk] [nvarchar](3) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [nvarchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_5_Lukiokoulutuksen_ainevalinnat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_5_Lukiokoulutuksen_ainevalinnat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_5_Lukiokoulutuksen_ainevalinnat](
	[tilv] [nvarchar](4) NULL,
	[tunn] [nvarchar](5) NULL,
	[jarj] [nvarchar](10) NULL,
	[nukevy] [int] NULL,
	[aikevy] [int] NULL,
	[kev] [int] NULL,
	[nukevyn] [int] NULL,
	[aikevyn] [int] NULL,
	[kevn] [int] NULL,
	[nukev1] [int] NULL,
	[nukev2] [int] NULL,
	[nukev3] [int] NULL,
	[nukev4] [int] NULL,
	[nukev] [int] NULL,
	[nukev1n] [int] NULL,
	[nukev2n] [int] NULL,
	[nukev3n] [int] NULL,
	[nukev4n] [int] NULL,
	[nukevn] [int] NULL,
	[aikev1] [int] NULL,
	[aikev2] [int] NULL,
	[aikev3] [int] NULL,
	[aikev4] [int] NULL,
	[aikev] [int] NULL,
	[aikev1n] [int] NULL,
	[aikev2n] [int] NULL,
	[aikev3n] [int] NULL,
	[aikev4n] [int] NULL,
	[aikevn] [int] NULL,
	[nuvary] [int] NULL,
	[aivary] [int] NULL,
	[var] [int] NULL,
	[nuvaryn] [int] NULL,
	[aivaryn] [int] NULL,
	[varn] [int] NULL,
	[nuyks] [int] NULL,
	[aiyks] [int] NULL,
	[yksy] [int] NULL,
	[nuvar2] [int] NULL,
	[nuvar25] [int] NULL,
	[nuvar3] [int] NULL,
	[nuvar35] [int] NULL,
	[nuvar4] [int] NULL,
	[nuvar45] [int] NULL,
	[nuvar5] [int] NULL,
	[nuvar] [int] NULL,
	[nuvar2n] [int] NULL,
	[nuvar25n] [int] NULL,
	[nuvar3n] [int] NULL,
	[nuvar35n] [int] NULL,
	[nuvar4n] [int] NULL,
	[nuvar45n] [int] NULL,
	[nuvar5n] [int] NULL,
	[nuvarn] [int] NULL,
	[aivar2] [int] NULL,
	[aivar25] [int] NULL,
	[aivar3] [int] NULL,
	[aivar35] [int] NULL,
	[aivar4] [int] NULL,
	[aivar45] [int] NULL,
	[aivar5] [int] NULL,
	[aivar] [int] NULL,
	[aivar2n] [int] NULL,
	[aivar25n] [int] NULL,
	[aivar3n] [int] NULL,
	[aivar35n] [int] NULL,
	[aivar4n] [int] NULL,
	[aivar45n] [int] NULL,
	[aivar5n] [int] NULL,
	[aivarn] [int] NULL,
	[ev] [int] NULL,
	[ort] [int] NULL,
	[et] [int] NULL,
	[mu] [int] NULL,
	[eos] [int] NULL,
	[kay] [int] NULL,
	[kieli1] [int] NULL,
	[kieli2] [int] NULL,
	[kieli3] [int] NULL,
	[kieli4] [int] NULL,
	[kieli5] [int] NULL,
	[kieli6] [int] NULL,
	[kieliy] [int] NULL,
	[sv] [int] NULL,
	[rv] [int] NULL,
	[svrv] [int] NULL,
	[svnn] [int] NULL,
	[rvnn] [int] NULL,
	[svrvn] [int] NULL,
	[yaenm] [int] NULL,
	[yyenm] [int] NULL,
	[yen6m] [int] NULL,
	[len6m] [int] NULL,
	[alen6m] [int] NULL,
	[enmm] [int] NULL,
	[yaenn] [int] NULL,
	[yyenn] [int] NULL,
	[yen6n] [int] NULL,
	[len6n] [int] NULL,
	[alen6n] [int] NULL,
	[ennn] [int] NULL,
	[yarum] [int] NULL,
	[yyrum] [int] NULL,
	[yru6m] [int] NULL,
	[lru6m] [int] NULL,
	[alru6m] [int] NULL,
	[rumm] [int] NULL,
	[yarun] [int] NULL,
	[yyrun] [int] NULL,
	[yru6n] [int] NULL,
	[lru6n] [int] NULL,
	[alru6n] [int] NULL,
	[runn] [int] NULL,
	[yasum] [int] NULL,
	[yysum] [int] NULL,
	[ysu6m] [int] NULL,
	[lsu6m] [int] NULL,
	[alsu6m] [int] NULL,
	[summ] [int] NULL,
	[yasun] [int] NULL,
	[yysun] [int] NULL,
	[ysu6n] [int] NULL,
	[lsu6n] [int] NULL,
	[alsu6n] [int] NULL,
	[sunn] [int] NULL,
	[yaram] [int] NULL,
	[yyram] [int] NULL,
	[yra6m] [int] NULL,
	[lra6m] [int] NULL,
	[alra6m] [int] NULL,
	[ramm] [int] NULL,
	[yaran] [int] NULL,
	[yyran] [int] NULL,
	[yra6n] [int] NULL,
	[lra6n] [int] NULL,
	[alra6n] [int] NULL,
	[rann] [int] NULL,
	[yasam] [int] NULL,
	[yysam] [int] NULL,
	[ysa6m] [int] NULL,
	[lsa6m] [int] NULL,
	[alsa6m] [int] NULL,
	[samm] [int] NULL,
	[yasan] [int] NULL,
	[yysan] [int] NULL,
	[ysa6n] [int] NULL,
	[lsa6n] [int] NULL,
	[alsa6n] [int] NULL,
	[sann] [int] NULL,
	[yavem] [int] NULL,
	[yyvem] [int] NULL,
	[yve6m] [int] NULL,
	[lve6m] [int] NULL,
	[alve6m] [int] NULL,
	[vemm] [int] NULL,
	[yaven] [int] NULL,
	[yyven] [int] NULL,
	[yve6n] [int] NULL,
	[lve6n] [int] NULL,
	[alve6n] [int] NULL,
	[vennn] [int] NULL,
	[yasaam] [int] NULL,
	[ysaa6m] [int] NULL,
	[lsaa6m] [int] NULL,
	[alsaa6m] [int] NULL,
	[saamm] [int] NULL,
	[yasaan] [int] NULL,
	[ysaa6n] [int] NULL,
	[lsaa6n] [int] NULL,
	[alsaa6n] [int] NULL,
	[saann] [int] NULL,
	[yalatm] [int] NULL,
	[ylat6m] [int] NULL,
	[lla6m] [int] NULL,
	[alla6m] [int] NULL,
	[lamm] [int] NULL,
	[yalan] [int] NULL,
	[ylat6n] [int] NULL,
	[lla6n] [int] NULL,
	[alla6n] [int] NULL,
	[lann] [int] NULL,
	[yaesm] [int] NULL,
	[yes6m] [int] NULL,
	[les6m] [int] NULL,
	[ales6m] [int] NULL,
	[esmm] [int] NULL,
	[yaesn] [int] NULL,
	[yes6n] [int] NULL,
	[les6n] [int] NULL,
	[ales6n] [int] NULL,
	[esnn] [int] NULL,
	[yaitm] [int] NULL,
	[yit6m] [int] NULL,
	[lit6m] [int] NULL,
	[alit6m] [int] NULL,
	[itmm] [int] NULL,
	[yaitn] [int] NULL,
	[yit6n] [int] NULL,
	[lit6n] [int] NULL,
	[alit6n] [int] NULL,
	[itnn] [int] NULL,
	[yamum] [int] NULL,
	[yymum] [int] NULL,
	[ymu6m] [int] NULL,
	[lmu6m] [int] NULL,
	[almu6m] [int] NULL,
	[mumm] [int] NULL,
	[yamun] [int] NULL,
	[yymun] [int] NULL,
	[ymu6n] [int] NULL,
	[lmu6n] [int] NULL,
	[almu6n] [int] NULL,
	[munn] [int] NULL,
	[yyvam] [int] NULL,
	[vamm] [int] NULL,
	[yyvan] [int] NULL,
	[vann] [int] NULL,
	[pmatm] [int] NULL,
	[pmatn] [int] NULL,
	[pmaty] [int] NULL,
	[lmatm] [int] NULL,
	[lmatn] [int] NULL,
	[lmaty] [int] NULL,
	[matm] [int] NULL,
	[matn] [int] NULL,
	[maty] [int] NULL,
	[pma1m] [int] NULL,
	[pma1n] [int] NULL,
	[pma2m] [int] NULL,
	[pma2n] [int] NULL,
	[pma3m] [int] NULL,
	[pma3n] [int] NULL,
	[pma45m] [int] NULL,
	[pma45n] [int] NULL,
	[pma6m] [int] NULL,
	[pma6n] [int] NULL,
	[pma7m] [int] NULL,
	[pma7n] [int] NULL,
	[lma1m] [int] NULL,
	[lma1n] [int] NULL,
	[lma2m] [int] NULL,
	[lma2n] [int] NULL,
	[lma3m] [int] NULL,
	[lma3n] [int] NULL,
	[lma45m] [int] NULL,
	[lma45n] [int] NULL,
	[lma6m] [int] NULL,
	[lma6n] [int] NULL,
	[lma7m] [int] NULL,
	[lma7n] [int] NULL,
	[fy1m] [int] NULL,
	[fy1n] [int] NULL,
	[fy2m] [int] NULL,
	[fy2n] [int] NULL,
	[fy3m] [int] NULL,
	[fy3n] [int] NULL,
	[fy45m] [int] NULL,
	[fy45n] [int] NULL,
	[fy6m] [int] NULL,
	[fy6n] [int] NULL,
	[fy7m] [int] NULL,
	[fy7n] [int] NULL,
	[ke1m] [int] NULL,
	[ke1n] [int] NULL,
	[ke2m] [int] NULL,
	[ke2n] [int] NULL,
	[ke3m] [int] NULL,
	[ke3n] [int] NULL,
	[ke45m] [int] NULL,
	[ke45n] [int] NULL,
	[ke6m] [int] NULL,
	[ke6n] [int] NULL,
	[ke7m] [int] NULL,
	[ke7n] [int] NULL,
	[bi1m] [int] NULL,
	[bi1n] [int] NULL,
	[bi2m] [int] NULL,
	[bi2n] [int] NULL,
	[bi3m] [int] NULL,
	[bi3n] [int] NULL,
	[bi45m] [int] NULL,
	[bi45n] [int] NULL,
	[bi6m] [int] NULL,
	[bi6n] [int] NULL,
	[bi7m] [int] NULL,
	[bi7n] [int] NULL,
	[mt1m] [int] NULL,
	[mt1n] [int] NULL,
	[mt2m] [int] NULL,
	[mt2n] [int] NULL,
	[mt3m] [int] NULL,
	[mt3n] [int] NULL,
	[mt45m] [int] NULL,
	[mt45n] [int] NULL,
	[mt6m] [int] NULL,
	[mt6n] [int] NULL,
	[mt7m] [int] NULL,
	[mt7n] [int] NULL,
	[soma2m] [int] NULL,
	[soma2n] [int] NULL,
	[soma3m] [int] NULL,
	[soma3n] [int] NULL,
	[sofy2m] [int] NULL,
	[sofy2n] [int] NULL,
	[sofy3m] [int] NULL,
	[sofy3n] [int] NULL,
	[soke2m] [int] NULL,
	[soke2n] [int] NULL,
	[soke3m] [int] NULL,
	[soke3n] [int] NULL,
	[sobi2m] [int] NULL,
	[sobi2n] [int] NULL,
	[sobi3m] [int] NULL,
	[sobi3n] [int] NULL,
	[somt2m] [int] NULL,
	[somt2n] [int] NULL,
	[somt3m] [int] NULL,
	[somt3n] [int] NULL,
	[sotek2m] [int] NULL,
	[sotek2n] [int] NULL,
	[sotek3m] [int] NULL,
	[sotek3n] [int] NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_8_Korkeakoulut_opiskelijat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_8_Korkeakoulut_opiskelijat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_8_Korkeakoulut_opiskelijat](
	[tilv] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [varchar](1) NULL,
	[lahde] [varchar](2) NULL,
	[tunn] [varchar](5) NULL,
	[jarj] [varchar](10) NULL,
	[koulk] [varchar](6) NULL,
	[kkun] [varchar](3) NULL,
	[sp] [varchar](1) NULL,
	[aikielir1x] [varchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[tilvaskun] [varchar](6) NULL,
	[tilvaskunx] [varchar](3) NULL,
	[tilvaskun2x] [varchar](3) NULL,
	[kansalr2] [varchar](1) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[olotamm] [varchar](1) NULL,
	[olosyys] [varchar](1) NULL,
	[rahlahde] [varchar](1) NULL,
	[fte] [varchar](1) NULL,
	[alvv_kksek] [varchar](4) NULL,
	[alvv_kksek_lasna] [varchar](4) NULL,
	[alvv_sek] [varchar](4) NULL,
	[alvv_sek_lasna] [varchar](4) NULL,
	[alvv_kk] [varchar](4) NULL,
	[alvv_kk_lasna] [varchar](4) NULL,
	[alvv_opa] [varchar](4) NULL,
	[alvv_opa_lasna] [varchar](4) NULL,
	[lkm] [int] NULL,
	[opyht0] [int] NULL,
	[opyht14] [int] NULL,
	[opyht29] [int] NULL,
	[opyht44] [int] NULL,
	[opyht59] [int] NULL,
	[opyht74] [int] NULL,
	[opyht89] [int] NULL,
	[opyht104] [int] NULL,
	[opyht119] [int] NULL,
	[opyht120] [int] NULL,
	[op55] [varchar](1) NULL,
	[opes] [int] NULL,
	[opek] [int] NULL,
	[opker] [int] NULL,
	[tutkamk] [varchar](3) NULL,
	[tunimamk] [nvarchar](60) NULL,
	[koamk] [varchar](4) NULL,
	[konimamk] [nvarchar](60) NULL,
	[suun_v] [varchar](5) NULL,
	[svnim] [nvarchar](40) NULL,
	[koultyp] [varchar](1) NULL,
	[kkieli] [varchar](2) NULL,
	[lasnalk] [int] NULL,
	[poissalk] [int] NULL,
	[oplaaj] [int] NULL,
	[kirtu1v] [varchar](4) NULL,
	[kirtu1k] [varchar](1) NULL,
	[ensisop] [varchar](1) NULL,
	[tilmaa] [varchar](1) NULL,
	[tutkyo] [varchar](3) NULL,
	[tunimyo] [nvarchar](40) NULL,
	[koyo] [varchar](4) NULL,
	[konimyo] [nvarchar](50) NULL,
	[paine] [varchar](4) NULL,
	[painenim] [nvarchar](60) NULL,
	[kk] [varchar](2) NULL,
	[tdk] [varchar](2) NULL,
	[fuksi] [varchar](1) NULL,
	[opoikv] [varchar](4) NULL,
	[om] [varchar](1) NULL,
	[opkelp] [varchar](1) NULL,
	[avo] [varchar](1) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [varchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_2_9_Korkeakoulut_tutkinnot]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_9_Korkeakoulut_tutkinnot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_9_Korkeakoulut_tutkinnot](
	[tilv] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [varchar](1) NULL,
	[lahde] [varchar](2) NULL,
	[tunn] [varchar](5) NULL,
	[jarj] [varchar](10) NULL,
	[koulk] [varchar](6) NULL,
	[opm95opa] [varchar](2) NULL,
	[kkun] [varchar](3) NULL,
	[sp] [varchar](1) NULL,
	[aikielir1x] [varchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[tilvaskun] [varchar](3) NULL,
	[tilvaskunx] [varchar](3) NULL,
	[kansalr2] [varchar](1) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[rahlahde] [varchar](1) NULL,
	[alvv_kksek] [varchar](4) NULL,
	[alvv_kksek_lasna] [varchar](4) NULL,
	[alvv_sek] [varchar](4) NULL,
	[alvv_sek_lasna] [varchar](4) NULL,
	[alvv_kk] [varchar](4) NULL,
	[alvv_kk_lasna] [varchar](4) NULL,
	[alvv_opa] [varchar](4) NULL,
	[alvv_opa_lasna] [varchar](4) NULL,
	[lkm] [int] NULL,
	[tutkamk] [varchar](3) NULL,
	[tunimamk] [varchar](60) NULL,
	[koamk] [varchar](4) NULL,
	[konimamk] [varchar](60) NULL,
	[suun_v] [varchar](5) NULL,
	[svnim] [varchar](60) NULL,
	[koultyp] [varchar](1) NULL,
	[kkieli] [varchar](2) NULL,
	[lasnalk] [int] NULL,
	[poissalk] [int] NULL,
	[oplaaj] [int] NULL,
	[kirtu1v] [varchar](4) NULL,
	[kirtu1k] [varchar](1) NULL,
	[opyhtamk] [int] NULL,
	[opylamamk] [int] NULL,
	[opmuuamk] [int] NULL,
	[opoamk] [int] NULL,
	[opmamk] [int] NULL,
	[opyliopamk] [int] NULL,
	[opulkomamk] [int] NULL,
	[tilmaa] [varchar](1) NULL,
	[tutkyo] [varchar](3) NULL,
	[tunimyo] [varchar](60) NULL,
	[koyo] [varchar](4) NULL,
	[konim] [varchar](60) NULL,
	[paine] [varchar](4) NULL,
	[painenim] [varchar](60) NULL,
	[tdk] [varchar](2) NULL,
	[om] [varchar](1) NULL,
	[opkelp] [varchar](1) NULL,
	[opyhtyo] [int] NULL,
	[opulkyo] [int] NULL,
	[opmuuyo] [int] NULL,
	[opoylio] [int] NULL,
	[opaylio] [int] NULL,
	[opmylio] [int] NULL,
	[opamkyo] [int] NULL,
	[ltop] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_3_14_Lukio_ja_amm_opisk_mediaani_iat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_3_14_Lukio_ja_amm_opisk_mediaani_iat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_3_14_Lukio_ja_amm_opisk_mediaani_iat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](10) NULL,
	[jarj] [nvarchar](10) NULL,
	[opjarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[sp] [nvarchar](2) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[synkk] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[aikoul] [nvarchar](2) NULL,
	[tutklaja] [nvarchar](2) NULL,
	[tutktav] [nvarchar](2) NULL,
	[ophal] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_3_15_Lukio_ja_amm_tutk_mediaani_iat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_3_15_Lukio_ja_amm_tutk_mediaani_iat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_3_15_Lukio_ja_amm_tutk_mediaani_iat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](10) NULL,
	[jarj] [nvarchar](10) NULL,
	[opjarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[sp] [nvarchar](2) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[synkk] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](2) NULL,
	[suorv] [nvarchar](4) NULL,
	[suorkk] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tutk] [nvarchar](2) NULL,
	[tutklaja] [nvarchar](2) NULL,
	[tutktav] [nvarchar](2) NULL,
	[ophal] [nvarchar](2) NULL,
	[aikoul] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_3_1a_Oppisopimuskoulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_3_1a_Oppisopimuskoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_3_1a_Oppisopimuskoulutus](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppisryh] [nvarchar](8) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[ikar2] [nvarchar](2) NULL,
	[opmala] [nvarchar](1) NULL,
	[opmast] [nvarchar](2) NULL,
	[tutklaja] [nvarchar](1) NULL,
	[kmaak] [nvarchar](2) NULL,
	[ptoim1r3] [nvarchar](2) NULL,
	[amas] [nvarchar](1) NULL,
	[tyansek] [nvarchar](1) NULL,
	[tol2002] [nvarchar](1) NULL,
	[tol2008] [nvarchar](1) NULL,
	[koko] [nvarchar](1) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_3_1b_Oppisopimuskoulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_3_1b_Oppisopimuskoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_3_1b_Oppisopimuskoulutus](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppisryh] [nvarchar](8) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[ikar2] [nvarchar](2) NULL,
	[opmala] [nvarchar](1) NULL,
	[opmast] [nvarchar](2) NULL,
	[tutklaja] [nvarchar](1) NULL,
	[kmaak] [nvarchar](2) NULL,
	[kesto] [nvarchar](2) NULL,
	[kestotot] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_3_2_Oppisopimuskoulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_3_2_Oppisopimuskoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_3_2_Oppisopimuskoulutus](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppisryh] [nvarchar](8) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[ikar2] [nvarchar](2) NULL,
	[opmala] [nvarchar](1) NULL,
	[tutklaja] [nvarchar](1) NULL,
	[kmaak] [nvarchar](2) NULL,
	[jopmast] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[opmast] [nvarchar](2) NULL,
	[jopmala] [nvarchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_3_2_Oppisopimuskoulutus_talteen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_3_2_Oppisopimuskoulutus_talteen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_3_2_Oppisopimuskoulutus_talteen](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppisryh] [nvarchar](8) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[ikar2] [nvarchar](2) NULL,
	[opmala] [nvarchar](1) NULL,
	[tutklaja] [nvarchar](1) NULL,
	[kmaak] [nvarchar](2) NULL,
	[jopmast] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](5) NULL,
	[jarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[koultyp] [nvarchar](2) NULL,
	[sp] [nvarchar](2) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[synkk] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](2) NULL,
	[alvv_kk] [nvarchar](4) NULL,
	[allk_kk] [nvarchar](2) NULL,
	[suorv] [nvarchar](4) NULL,
	[suorkk] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sp] [nvarchar](10) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[asmaak] [nvarchar](2) NULL,
	[asema] [nvarchar](10) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[asmaak] [nvarchar](2) NULL,
	[aikielir3] [nvarchar](2) NULL,
	[kansalr1] [nvarchar](10) NULL,
	[eumaa] [nvarchar](2) NULL,
	[etamaa] [nvarchar](2) NULL,
	[ika0] [int] NULL,
	[ika1] [int] NULL,
	[ika2] [int] NULL,
	[ika3] [int] NULL,
	[ika4] [int] NULL,
	[ika5] [int] NULL,
	[ika6] [int] NULL,
	[ika7] [int] NULL,
	[ika8] [int] NULL,
	[ika9] [int] NULL,
	[ika10] [int] NULL,
	[ika11] [int] NULL,
	[ika12] [int] NULL,
	[ika13] [int] NULL,
	[ika14] [int] NULL,
	[ika15] [int] NULL,
	[ika16] [int] NULL,
	[ika17] [int] NULL,
	[ika18] [int] NULL,
	[ika19] [int] NULL,
	[ika20] [int] NULL,
	[ika21] [int] NULL,
	[ika22] [int] NULL,
	[ika23] [int] NULL,
	[ika24] [int] NULL,
	[ika25] [int] NULL,
	[ika26] [int] NULL,
	[ika27] [int] NULL,
	[ika28] [int] NULL,
	[ika29] [int] NULL,
	[ika30] [int] NULL,
	[ika31] [int] NULL,
	[ika32] [int] NULL,
	[ika33] [int] NULL,
	[ika34] [int] NULL,
	[ika35] [int] NULL,
	[ika36] [int] NULL,
	[ika37] [int] NULL,
	[ika38] [int] NULL,
	[ika39] [int] NULL,
	[ika40] [int] NULL,
	[ika41] [int] NULL,
	[ika42] [int] NULL,
	[ika43] [int] NULL,
	[ika44] [int] NULL,
	[ika45] [int] NULL,
	[ika46] [int] NULL,
	[ika47] [int] NULL,
	[ika48] [int] NULL,
	[ika49] [int] NULL,
	[ika50] [int] NULL,
	[ika51] [int] NULL,
	[ika52] [int] NULL,
	[ika53] [int] NULL,
	[ika54] [int] NULL,
	[ika55] [int] NULL,
	[ika56] [int] NULL,
	[ika57] [int] NULL,
	[ika58] [int] NULL,
	[ika59] [int] NULL,
	[ika60] [int] NULL,
	[ika61] [int] NULL,
	[ika62] [int] NULL,
	[ika63] [int] NULL,
	[ika64] [int] NULL,
	[ika65] [int] NULL,
	[ika66] [int] NULL,
	[ika67] [int] NULL,
	[ika68] [int] NULL,
	[ika69] [int] NULL,
	[ika70] [int] NULL,
	[ika71] [int] NULL,
	[ika72] [int] NULL,
	[ika73] [int] NULL,
	[ika74] [int] NULL,
	[ika75] [int] NULL,
	[ika76] [int] NULL,
	[ika77] [int] NULL,
	[ika78] [int] NULL,
	[ika79] [int] NULL,
	[ika80] [int] NULL,
	[ika81] [int] NULL,
	[ika82] [int] NULL,
	[ika83] [int] NULL,
	[ika84] [int] NULL,
	[ika85] [int] NULL,
	[ika86] [int] NULL,
	[ika87] [int] NULL,
	[ika88] [int] NULL,
	[ika89] [int] NULL,
	[ika90] [int] NULL,
	[ika91] [int] NULL,
	[ika92] [int] NULL,
	[ika93] [int] NULL,
	[ika94] [int] NULL,
	[ika95] [int] NULL,
	[ika96] [int] NULL,
	[ika97] [int] NULL,
	[ika98] [int] NULL,
	[ika99] [int] NULL,
	[ika100_] [int] NULL,
	[lkm] [int] NULL,
	[luontipvm] [date] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[asmaak] [nvarchar](2) NULL,
	[koulk] [nvarchar](6) NULL,
	[ulosmuutto] [int] NULL,
	[sisaanmuutto] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[tilvasmaak] [nvarchar](2) NULL,
	[kansalr1] [nvarchar](1) NULL,
	[pohjmaa] [nvarchar](1) NULL,
	[eumaa] [nvarchar](1) NULL,
	[etamaa] [nvarchar](1) NULL,
	[suorv] [nvarchar](4) NULL,
	[suormaak] [nvarchar](2) NULL,
	[koulk] [nvarchar](6) NULL,
	[kouljat] [nvarchar](1) NULL,
	[oppis] [nvarchar](1) NULL,
	[tutklaja_tr] [nvarchar](1) NULL,
	[ptoim1r6] [nvarchar](2) NULL,
	[amm2001] [nvarchar](2) NULL,
	[amm2010] [nvarchar](2) NULL,
	[tsekt] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[tilvasmaak] [nvarchar](2) NULL,
	[aiopis] [nvarchar](2) NULL,
	[suorv] [nvarchar](4) NULL,
	[tutkmaak] [nvarchar](2) NULL,
	[jarj] [nvarchar](10) NULL,
	[tunn] [nvarchar](5) NULL,
	[akk] [nvarchar](5) NULL,
	[koulk] [nvarchar](6) NULL,
	[kouljat] [nvarchar](2) NULL,
	[oppis] [nvarchar](2) NULL,
	[tutklaja_tr] [nvarchar](2) NULL,
	[ptoim1r2] [nvarchar](2) NULL,
	[maassaolo] [nvarchar](2) NULL,
	[amas] [nvarchar](2) NULL,
	[amm2010] [nvarchar](5) NULL,
	[lkm] [int] NULL,
	[eu_etamaat] [nvarchar](2) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[mosa] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[koulk] [nvarchar](6) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[oppis] [nvarchar](2) NULL,
	[tutklaja] [nvarchar](2) NULL,
	[tutktav] [nvarchar](2) NULL,
	[aikoul] [nvarchar](2) NULL,
	[sp] [nvarchar](10) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[ika] [nvarchar](10) NULL,
	[lulkm] [int] NULL,
	[lukoulk] [varchar](6) NULL,
	[lusuorv] [varchar](4) NULL,
	[luaikoul] [varchar](1) NULL,
	[ammlkm] [int] NULL,
	[ammkoulk] [varchar](6) NULL,
	[ammsuorv] [varchar](4) NULL,
	[ammoppis] [varchar](1) NULL,
	[ammtutklaja] [varchar](1) NULL,
	[ammtutktav] [varchar](1) NULL,
	[opistlkm] [int] NULL,
	[opistkoulk] [varchar](6) NULL,
	[opistsuorv] [varchar](4) NULL,
	[ammkalkm] [int] NULL,
	[ammkakoulk] [varchar](6) NULL,
	[ammkasuorv] [varchar](4) NULL,
	[amklkm] [int] NULL,
	[amkkoulk] [varchar](6) NULL,
	[amksuorv] [varchar](4) NULL,
	[amkaikoul] [varchar](1) NULL,
	[akklkm] [int] NULL,
	[akkkoulk] [varchar](6) NULL,
	[akksuorv] [varchar](4) NULL,
	[ylamklkm] [int] NULL,
	[ylamkkoulk] [varchar](6) NULL,
	[ylamksuorv] [varchar](4) NULL,
	[ykklkm] [int] NULL,
	[ykkkoulk] [varchar](6) NULL,
	[ykksuorv] [varchar](4) NULL,
	[laakerlkm] [int] NULL,
	[laakerkoulk] [varchar](6) NULL,
	[laakersuorv] [varchar](4) NULL,
	[lislkm] [int] NULL,
	[liskoulk] [varchar](6) NULL,
	[lissuorv] [varchar](4) NULL,
	[tohtlkm] [int] NULL,
	[tohtkoulk] [varchar](6) NULL,
	[tohtsuorv] [varchar](4) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[koulk] [nvarchar](6) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[oppis] [nvarchar](2) NULL,
	[tutklaja] [nvarchar](2) NULL,
	[tutktav] [nvarchar](2) NULL,
	[aikoul] [nvarchar](2) NULL,
	[sp] [nvarchar](10) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[ika] [nvarchar](10) NULL,
	[lulkm] [varchar](2) NULL,
	[lukoulk] [varchar](6) NULL,
	[lusuorv] [varchar](4) NULL,
	[luaikoul] [varchar](1) NULL,
	[ammlkm] [int] NULL,
	[ammkoulk] [varchar](6) NULL,
	[ammsuorv] [varchar](4) NULL,
	[ammoppis] [varchar](1) NULL,
	[ammtutklaja] [varchar](1) NULL,
	[ammtutktav] [varchar](1) NULL,
	[opistlkm] [int] NULL,
	[opistkoulk] [varchar](6) NULL,
	[opistsuorv] [varchar](4) NULL,
	[ammkalkm] [int] NULL,
	[ammkakoulk] [varchar](6) NULL,
	[ammkasuorv] [varchar](4) NULL,
	[amklkm] [int] NULL,
	[amkkoulk] [varchar](6) NULL,
	[amksuorv] [varchar](4) NULL,
	[amkaikoul] [varchar](1) NULL,
	[akklkm] [int] NULL,
	[akkkoulk] [varchar](6) NULL,
	[akksuorv] [varchar](4) NULL,
	[ylamklkm] [int] NULL,
	[ylamkkoulk] [varchar](6) NULL,
	[ylamksuorv] [varchar](4) NULL,
	[ykklkm] [int] NULL,
	[ykkkoulk] [varchar](6) NULL,
	[ykksuorv] [varchar](4) NULL,
	[laakerlkm] [int] NULL,
	[laakerkoulk] [varchar](6) NULL,
	[laakersuorv] [varchar](4) NULL,
	[lislkm] [int] NULL,
	[liskoulk] [varchar](6) NULL,
	[lissuorv] [varchar](4) NULL,
	[tohtlkm] [int] NULL,
	[tohtkoulk] [varchar](6) NULL,
	[tohtsuorv] [varchar](4) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_4_9_Vaestorakenne_kunnittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_4_9_Vaestorakenne_kunnittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_4_9_Vaestorakenne_kunnittain](
	[tilv] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[sp] [varchar](1) NULL,
	[tilvaskun] [varchar](3) NULL,
	[aikielir2] [varchar](2) NULL,
	[kansalr1] [varchar](1) NULL,
	[mosa] [varchar](1) NULL,
	[pohjmaa] [varchar](1) NULL,
	[eumaa] [varchar](1) NULL,
	[etamaa] [varchar](1) NULL,
	[ika0] [int] NULL,
	[ika1] [int] NULL,
	[ika2] [int] NULL,
	[ika3] [int] NULL,
	[ika4] [int] NULL,
	[ika5] [int] NULL,
	[ika6] [int] NULL,
	[ika7] [int] NULL,
	[ika8] [int] NULL,
	[ika9] [int] NULL,
	[ika10] [int] NULL,
	[ika11] [int] NULL,
	[ika12] [int] NULL,
	[ika13] [int] NULL,
	[ika14] [int] NULL,
	[ika15] [int] NULL,
	[ika16] [int] NULL,
	[ika17] [int] NULL,
	[ika18] [int] NULL,
	[ika19] [int] NULL,
	[ika20] [int] NULL,
	[ika21] [int] NULL,
	[ika22] [int] NULL,
	[ika23] [int] NULL,
	[ika24] [int] NULL,
	[ika25] [int] NULL,
	[ika26] [int] NULL,
	[ika27] [int] NULL,
	[ika28] [int] NULL,
	[ika29] [int] NULL,
	[ika30] [int] NULL,
	[ika31] [int] NULL,
	[ika32] [int] NULL,
	[ika33] [int] NULL,
	[ika34] [int] NULL,
	[ika35] [int] NULL,
	[ika36] [int] NULL,
	[ika37] [int] NULL,
	[ika38] [int] NULL,
	[ika39] [int] NULL,
	[ika40] [int] NULL,
	[ika41] [int] NULL,
	[ika42] [int] NULL,
	[ika43] [int] NULL,
	[ika44] [int] NULL,
	[ika45] [int] NULL,
	[ika46] [int] NULL,
	[ika47] [int] NULL,
	[ika48] [int] NULL,
	[ika49] [int] NULL,
	[ika50] [int] NULL,
	[ika51] [int] NULL,
	[ika52] [int] NULL,
	[ika53] [int] NULL,
	[ika54] [int] NULL,
	[ika55] [int] NULL,
	[ika56] [int] NULL,
	[ika57] [int] NULL,
	[ika58] [int] NULL,
	[ika59] [int] NULL,
	[ika60] [int] NULL,
	[ika61] [int] NULL,
	[ika62] [int] NULL,
	[ika63] [int] NULL,
	[ika64] [int] NULL,
	[ika65] [int] NULL,
	[ika66] [int] NULL,
	[ika67] [int] NULL,
	[ika68] [int] NULL,
	[ika69] [int] NULL,
	[ika70] [int] NULL,
	[ika71] [int] NULL,
	[ika72] [int] NULL,
	[ika73] [int] NULL,
	[ika74] [int] NULL,
	[ika75] [int] NULL,
	[ika76] [int] NULL,
	[ika77] [int] NULL,
	[ika78] [int] NULL,
	[ika79] [int] NULL,
	[ika80] [int] NULL,
	[ika81] [int] NULL,
	[ika82] [int] NULL,
	[ika83] [int] NULL,
	[ika84] [int] NULL,
	[ika85] [int] NULL,
	[ika86] [int] NULL,
	[ika87] [int] NULL,
	[ika88] [int] NULL,
	[ika89] [int] NULL,
	[ika90] [int] NULL,
	[ika91] [int] NULL,
	[ika92] [int] NULL,
	[ika93] [int] NULL,
	[ika94] [int] NULL,
	[ika95] [int] NULL,
	[ika96] [int] NULL,
	[ika97] [int] NULL,
	[ika98] [int] NULL,
	[ika99] [int] NULL,
	[ika100_] [int] NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[tunn] [nvarchar](10) NULL,
	[tiede] [nvarchar](10) NULL,
	[vryhma] [nvarchar](10) NULL,
	[ikar4] [nvarchar](10) NULL,
	[sp] [nvarchar](10) NULL,
	[tutktaso] [nvarchar](10) NULL,
	[lkm_tutkimushenkilokunta] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[tunn] [nvarchar](10) NULL,
	[tiede] [nvarchar](10) NULL,
	[vryhma] [nvarchar](10) NULL,
	[ikar4] [nvarchar](10) NULL,
	[sp] [nvarchar](10) NULL,
	[tutktaso] [nvarchar](10) NULL,
	[lkm_tutkimustyovuodet] [decimal](8, 4) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[tunn] [nvarchar](10) NULL,
	[tiede] [nvarchar](10) NULL,
	[yhme] [decimal](8, 3) NULL,
	[kmeno] [decimal](8, 3) NULL,
	[palme] [decimal](8, 3) NULL,
	[apuraha] [decimal](8, 3) NULL,
	[mkmeno] [decimal](8, 3) NULL,
	[ptmeno] [decimal](8, 3) NULL,
	[sakat] [decimal](8, 3) NULL,
	[mokm] [decimal](8, 3) NULL,
	[tekes] [decimal](8, 3) NULL,
	[mtem] [decimal](8, 3) NULL,
	[um] [decimal](8, 3) NULL,
	[om] [decimal](8, 3) NULL,
	[sm] [decimal](8, 3) NULL,
	[pm] [decimal](8, 3) NULL,
	[vm] [decimal](8, 3) NULL,
	[mmm] [decimal](8, 3) NULL,
	[lvm] [decimal](8, 3) NULL,
	[stm] [decimal](8, 3) NULL,
	[ym] [decimal](8, 3) NULL,
	[kunnat] [decimal](8, 3) NULL,
	[mjulk] [decimal](8, 3) NULL,
	[krahas] [decimal](8, 3) NULL,
	[kyrit] [decimal](8, 3) NULL,
	[uyrit] [decimal](8, 3) NULL,
	[eu] [decimal](8, 3) NULL,
	[eupuite] [decimal](8, 3) NULL,
	[eakr] [decimal](8, 3) NULL,
	[esr] [decimal](8, 3) NULL,
	[muueu] [decimal](8, 3) NULL,
	[urahas] [decimal](8, 3) NULL,
	[kv_jarj] [decimal](8, 3) NULL,
	[mulko] [decimal](8, 3) NULL,
	[ot_menot] [decimal](8, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[NIMI] [varchar](100) NULL,
	[NIMI2] [varchar](30) NULL,
	[TK_koodi] [varchar](5) NOT NULL,
	[TOLKM] [int] NULL,
	[NTOLKM] [int] NULL,
	[TOTTV] [decimal](8, 1) NULL,
	[LISLKM] [int] NULL,
	[NLISLKM] [int] NULL,
	[LISTTV] [decimal](8, 1) NULL,
	[DILKM] [int] NULL,
	[NDIPLKM] [int] NULL,
	[DIPTTV] [decimal](8, 1) NULL,
	[INSLKM] [int] NULL,
	[NOPINS] [int] NULL,
	[OPINSTTV] [decimal](8, 1) NULL,
	[YHTE] [decimal](10, 3) NULL,
	[NYHTE] [decimal](10, 3) NULL,
	[YHTTTV] [decimal](8, 1) NULL,
	[PAME] [decimal](10, 3) NULL,
	[OSTPAL] [decimal](10, 3) NULL,
	[YHME] [decimal](10, 3) NULL,
	[TEKES] [decimal](10, 3) NULL,
	[MTEM] [decimal](10, 3) NULL,
	[AKATEMIA] [decimal](10, 3) NULL,
	[GRAD] [decimal](10, 3) NULL,
	[MOPEM] [decimal](10, 3) NULL,
	[LIIKM] [decimal](10, 3) NULL,
	[MAAM] [decimal](10, 3) NULL,
	[OM] [decimal](10, 3) NULL,
	[PM] [decimal](10, 3) NULL,
	[SISAM] [decimal](10, 3) NULL,
	[SOSM] [decimal](10, 3) NULL,
	[UM] [decimal](10, 3) NULL,
	[VN] [decimal](10, 3) NULL,
	[VM] [decimal](10, 3) NULL,
	[YMP] [decimal](10, 3) NULL,
	[MUUJU] [decimal](10, 3) NULL,
	[RAHAS] [decimal](10, 3) NULL,
	[KOTIM] [decimal](10, 3) NULL,
	[ULKOY] [decimal](10, 3) NULL,
	[UEU] [decimal](10, 3) NULL,
	[EUPUITE] [decimal](10, 3) NULL,
	[EAKR] [decimal](10, 3) NULL,
	[ESR] [decimal](10, 3) NULL,
	[MUUEU] [decimal](10, 3) NULL,
	[MULKO] [decimal](10, 3) NULL,
	[UYHTE] [decimal](10, 3) NULL,
	[KUNTA1] [varchar](3) NULL,
	[KUNTA2] [varchar](3) NULL,
	[KUNTA3] [varchar](3) NULL,
	[KUNTA4] [varchar](3) NULL,
	[KUNTA5] [varchar](3) NULL,
	[KUNTA6] [varchar](3) NULL,
	[KUNTA7] [varchar](3) NULL,
	[KUNTA8] [varchar](3) NULL,
	[KUNTA9] [varchar](3) NULL,
	[KUNTA10] [varchar](3) NULL,
	[KUNTA11] [varchar](3) NULL,
	[KUNTA12] [varchar](3) NULL,
	[KUNTA13] [varchar](3) NULL,
	[KUNTA14] [varchar](3) NULL,
	[KUNTA15] [varchar](3) NULL,
	[KUNTA16] [varchar](3) NULL,
	[KUNTA17] [varchar](3) NULL,
	[KUNTA18] [varchar](3) NULL,
	[KUNTA19] [varchar](3) NULL,
	[KUNTA20] [varchar](3) NULL,
	[KUNTA21] [varchar](3) NULL,
	[KUNTA22] [varchar](3) NULL,
	[KUNTA23] [varchar](3) NULL,
	[KUNTA24] [varchar](3) NULL,
	[KUNTA25] [varchar](3) NULL,
	[HENLKMY] [int] NULL,
	[TYOVY] [decimal](8, 1) NULL,
	[TKMENOY] [decimal](10, 3) NULL,
	[HENLKM1] [int] NULL,
	[HENLKM2] [int] NULL,
	[HENLKM3] [int] NULL,
	[HENLKM4] [int] NULL,
	[HENLKM5] [int] NULL,
	[HENLKM6] [int] NULL,
	[HENLKM7] [int] NULL,
	[HENLKM8] [int] NULL,
	[HENLKM9] [int] NULL,
	[HENLKM10] [int] NULL,
	[HENLKM11] [int] NULL,
	[HENLKM12] [int] NULL,
	[HENLKM13] [int] NULL,
	[HENLKM14] [int] NULL,
	[HENLKM15] [int] NULL,
	[HENLKM16] [int] NULL,
	[HENLKM17] [int] NULL,
	[HENLKM18] [int] NULL,
	[HENLKM19] [int] NULL,
	[HENLKM20] [int] NULL,
	[HENLKM21] [int] NULL,
	[HENLKM22] [int] NULL,
	[HENLKM23] [int] NULL,
	[HENLKM24] [int] NULL,
	[HENLKM25] [int] NULL,
	[TYOV1] [decimal](8, 1) NULL,
	[TYOV2] [decimal](8, 1) NULL,
	[TYOV3] [decimal](8, 1) NULL,
	[TYOV4] [decimal](8, 1) NULL,
	[TYOV5] [decimal](8, 1) NULL,
	[TYOV6] [decimal](8, 1) NULL,
	[TYOV7] [decimal](8, 1) NULL,
	[TYOV8] [decimal](8, 1) NULL,
	[TYOV9] [decimal](8, 1) NULL,
	[TYOV10] [decimal](8, 1) NULL,
	[TYOV11] [decimal](8, 1) NULL,
	[TYOV12] [decimal](8, 1) NULL,
	[TYOV13] [decimal](8, 1) NULL,
	[TYOV14] [decimal](8, 1) NULL,
	[TYOV15] [decimal](8, 1) NULL,
	[TYOV16] [decimal](8, 1) NULL,
	[TYOV17] [decimal](8, 1) NULL,
	[TYOV18] [decimal](8, 1) NULL,
	[TYOV19] [decimal](8, 1) NULL,
	[TYOV20] [decimal](8, 1) NULL,
	[TYOV21] [decimal](8, 1) NULL,
	[TYOV22] [decimal](8, 1) NULL,
	[TYOV23] [decimal](8, 1) NULL,
	[TYOV24] [decimal](8, 1) NULL,
	[TYOV25] [decimal](8, 1) NULL,
	[TKMENO1] [decimal](10, 3) NULL,
	[TKMENO2] [decimal](10, 3) NULL,
	[TKMENO3] [decimal](10, 3) NULL,
	[TKMENO4] [decimal](10, 3) NULL,
	[TKMENO5] [decimal](10, 3) NULL,
	[TKMENO6] [decimal](10, 3) NULL,
	[TKMENO7] [decimal](10, 3) NULL,
	[TKMENO8] [decimal](10, 3) NULL,
	[TKMENO9] [decimal](10, 3) NULL,
	[TKMENO10] [decimal](10, 3) NULL,
	[TKMENO11] [decimal](10, 3) NULL,
	[TKMENO12] [decimal](10, 3) NULL,
	[TKMENO13] [decimal](10, 3) NULL,
	[TKMENO14] [decimal](10, 3) NULL,
	[TKMENO15] [decimal](10, 3) NULL,
	[TKMENO16] [decimal](10, 3) NULL,
	[TKMENO17] [decimal](10, 3) NULL,
	[TKMENO18] [decimal](10, 3) NULL,
	[TKMENO19] [decimal](10, 3) NULL,
	[TKMENO20] [decimal](10, 3) NULL,
	[TKMENO21] [decimal](10, 3) NULL,
	[TKMENO22] [decimal](10, 3) NULL,
	[TKMENO23] [decimal](10, 3) NULL,
	[TKMENO24] [decimal](10, 3) NULL,
	[TKMENO25] [decimal](10, 3) NULL,
	[TA1] [varchar](10) NULL,
	[TA2] [varchar](10) NULL,
	[TA3] [varchar](10) NULL,
	[TA4] [varchar](10) NULL,
	[TA5] [varchar](10) NULL,
	[TA6] [varchar](10) NULL,
	[TA7] [varchar](10) NULL,
	[TA8] [varchar](10) NULL,
	[TA9] [varchar](10) NULL,
	[TA10] [varchar](10) NULL,
	[TA11] [varchar](10) NULL,
	[TA12] [varchar](10) NULL,
	[TA13] [varchar](10) NULL,
	[TA14] [varchar](10) NULL,
	[TA15] [varchar](10) NULL,
	[TA16] [varchar](10) NULL,
	[TA17] [varchar](10) NULL,
	[TA18] [varchar](10) NULL,
	[TA1P] [decimal](8, 2) NULL,
	[TA2P] [decimal](8, 2) NULL,
	[TA3P] [decimal](8, 2) NULL,
	[TA4P] [decimal](8, 2) NULL,
	[TA5P] [decimal](8, 2) NULL,
	[TA6P] [decimal](8, 2) NULL,
	[TA7P] [decimal](8, 2) NULL,
	[TA8P] [decimal](8, 2) NULL,
	[TA9P] [decimal](8, 2) NULL,
	[TA10P] [decimal](8, 2) NULL,
	[TA11P] [decimal](8, 2) NULL,
	[TA12P] [decimal](8, 2) NULL,
	[TA13P] [decimal](8, 2) NULL,
	[TA14P] [decimal](8, 2) NULL,
	[TA15P] [decimal](8, 2) NULL,
	[TA16P] [decimal](8, 2) NULL,
	[TA17P] [decimal](8, 2) NULL,
	[TA18P] [decimal](8, 2) NULL,
	[tk_arvio] [int] NULL,
	[tk_arvioe] [decimal](10, 3) NULL,
	[KMENO] [decimal](10, 3) NULL,
	[HMENO] [decimal](10, 3) NULL,
	[TUTLKM] [int] NULL,
	[NTUTLKM] [int] NULL,
	[TUTTTV] [decimal](8, 1) NULL,
	[MTKLKM] [int] NULL,
	[NMTKLKM] [int] NULL,
	[MTKTTV] [decimal](8, 1) NULL,
	[YHTE2] [int] NULL,
	[NYHTE2] [int] NULL,
	[MKOULKM] [int] NULL,
	[NMKOULKM] [int] NULL,
	[MKOUTTV] [decimal](8, 1) NULL,
	[OPISTLKM] [int] NULL,
	[NOPISTLKM] [int] NULL,
	[OPISTTTV] [decimal](8, 1) NULL,
	[KUNNAT] [decimal](10, 3) NULL,
	[MKVJ] [decimal](10, 3) NULL,
	[ORAHAS] [decimal](10, 3) NULL,
	[phy1] [int] NULL,
	[phy2] [int] NULL,
	[phy3] [int] NULL,
	[phy4] [int] NULL,
	[phy5] [int] NULL,
	[phy6] [int] NULL,
	[phyy] [int] NULL,
	[phn1] [int] NULL,
	[phn2] [int] NULL,
	[phn3] [int] NULL,
	[phn4] [int] NULL,
	[phn5] [int] NULL,
	[phn6] [int] NULL,
	[phny] [int] NULL,
	[pty1] [int] NULL,
	[pty2] [int] NULL,
	[pty3] [int] NULL,
	[pty4] [int] NULL,
	[pty5] [int] NULL,
	[pty6] [int] NULL,
	[ptyy] [int] NULL,
	[ptn1] [int] NULL,
	[ptn2] [int] NULL,
	[ptn3] [int] NULL,
	[ptn4] [int] NULL,
	[ptn5] [int] NULL,
	[ptn6] [int] NULL,
	[ptny] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[NIMI] [varchar](100) NULL,
	[NIMI2] [varchar](30) NULL,
	[TK_koodi] [varchar](5) NOT NULL,
	[TOLKM] [int] NULL,
	[NTOLKM] [int] NULL,
	[TOTTV] [decimal](8, 1) NULL,
	[LISLKM] [int] NULL,
	[NLISLKM] [int] NULL,
	[LISTTV] [decimal](8, 1) NULL,
	[DILKM] [int] NULL,
	[NDIPLKM] [int] NULL,
	[DIPTTV] [decimal](8, 1) NULL,
	[INSLKM] [int] NULL,
	[NOPINS] [int] NULL,
	[OPINSTTV] [decimal](8, 1) NULL,
	[YHTE] [decimal](10, 3) NULL,
	[NYHTE] [decimal](10, 3) NULL,
	[YHTTTV] [decimal](8, 1) NULL,
	[PAME] [decimal](10, 3) NULL,
	[OSTPAL] [decimal](10, 3) NULL,
	[YHME] [decimal](10, 3) NULL,
	[TEKES] [decimal](10, 3) NULL,
	[MTEM] [decimal](10, 3) NULL,
	[AKATEMIA] [decimal](10, 3) NULL,
	[GRAD] [decimal](10, 3) NULL,
	[MOPEM] [decimal](10, 3) NULL,
	[LIIKM] [decimal](10, 3) NULL,
	[MAAM] [decimal](10, 3) NULL,
	[OM] [decimal](10, 3) NULL,
	[PM] [decimal](10, 3) NULL,
	[SISAM] [decimal](10, 3) NULL,
	[SOSM] [decimal](10, 3) NULL,
	[UM] [decimal](10, 3) NULL,
	[VN] [decimal](10, 3) NULL,
	[VM] [decimal](10, 3) NULL,
	[YMP] [decimal](10, 3) NULL,
	[MUUJU] [decimal](10, 3) NULL,
	[RAHAS] [decimal](10, 3) NULL,
	[KOTIM] [decimal](10, 3) NULL,
	[ULKOY] [decimal](10, 3) NULL,
	[UEU] [decimal](10, 3) NULL,
	[EUPUITE] [decimal](10, 3) NULL,
	[EAKR] [decimal](10, 3) NULL,
	[ESR] [decimal](10, 3) NULL,
	[MUUEU] [decimal](10, 3) NULL,
	[MULKO] [decimal](10, 3) NULL,
	[UYHTE] [decimal](10, 3) NULL,
	[KUNTA1] [varchar](3) NULL,
	[KUNTA2] [varchar](3) NULL,
	[KUNTA3] [varchar](3) NULL,
	[KUNTA4] [varchar](3) NULL,
	[KUNTA5] [varchar](3) NULL,
	[KUNTA6] [varchar](3) NULL,
	[KUNTA7] [varchar](3) NULL,
	[KUNTA8] [varchar](3) NULL,
	[KUNTA9] [varchar](3) NULL,
	[KUNTA10] [varchar](3) NULL,
	[KUNTA11] [varchar](3) NULL,
	[KUNTA12] [varchar](3) NULL,
	[KUNTA13] [varchar](3) NULL,
	[KUNTA14] [varchar](3) NULL,
	[KUNTA15] [varchar](3) NULL,
	[KUNTA16] [varchar](3) NULL,
	[KUNTA17] [varchar](3) NULL,
	[KUNTA18] [varchar](3) NULL,
	[KUNTA19] [varchar](3) NULL,
	[KUNTA20] [varchar](3) NULL,
	[KUNTA21] [varchar](3) NULL,
	[KUNTA22] [varchar](3) NULL,
	[KUNTA23] [varchar](3) NULL,
	[KUNTA24] [varchar](3) NULL,
	[KUNTA25] [varchar](3) NULL,
	[HENLKMY] [int] NULL,
	[TYOVY] [decimal](8, 1) NULL,
	[TKMENOY] [decimal](10, 3) NULL,
	[HENLKM1] [int] NULL,
	[HENLKM2] [int] NULL,
	[HENLKM3] [int] NULL,
	[HENLKM4] [int] NULL,
	[HENLKM5] [int] NULL,
	[HENLKM6] [int] NULL,
	[HENLKM7] [int] NULL,
	[HENLKM8] [int] NULL,
	[HENLKM9] [int] NULL,
	[HENLKM10] [int] NULL,
	[HENLKM11] [int] NULL,
	[HENLKM12] [int] NULL,
	[HENLKM13] [int] NULL,
	[HENLKM14] [int] NULL,
	[HENLKM15] [int] NULL,
	[HENLKM16] [int] NULL,
	[HENLKM17] [int] NULL,
	[HENLKM18] [int] NULL,
	[HENLKM19] [int] NULL,
	[HENLKM20] [int] NULL,
	[HENLKM21] [int] NULL,
	[HENLKM22] [int] NULL,
	[HENLKM23] [int] NULL,
	[HENLKM24] [int] NULL,
	[HENLKM25] [int] NULL,
	[TYOV1] [decimal](8, 1) NULL,
	[TYOV2] [decimal](8, 1) NULL,
	[TYOV3] [decimal](8, 1) NULL,
	[TYOV4] [decimal](8, 1) NULL,
	[TYOV5] [decimal](8, 1) NULL,
	[TYOV6] [decimal](8, 1) NULL,
	[TYOV7] [decimal](8, 1) NULL,
	[TYOV8] [decimal](8, 1) NULL,
	[TYOV9] [decimal](8, 1) NULL,
	[TYOV10] [decimal](8, 1) NULL,
	[TYOV11] [decimal](8, 1) NULL,
	[TYOV12] [decimal](8, 1) NULL,
	[TYOV13] [decimal](8, 1) NULL,
	[TYOV14] [decimal](8, 1) NULL,
	[TYOV15] [decimal](8, 1) NULL,
	[TYOV16] [decimal](8, 1) NULL,
	[TYOV17] [decimal](8, 1) NULL,
	[TYOV18] [decimal](8, 1) NULL,
	[TYOV19] [decimal](8, 1) NULL,
	[TYOV20] [decimal](8, 1) NULL,
	[TYOV21] [decimal](8, 1) NULL,
	[TYOV22] [decimal](8, 1) NULL,
	[TYOV23] [decimal](8, 1) NULL,
	[TYOV24] [decimal](8, 1) NULL,
	[TYOV25] [decimal](8, 1) NULL,
	[TKMENO1] [decimal](10, 3) NULL,
	[TKMENO2] [decimal](10, 3) NULL,
	[TKMENO3] [decimal](10, 3) NULL,
	[TKMENO4] [decimal](10, 3) NULL,
	[TKMENO5] [decimal](10, 3) NULL,
	[TKMENO6] [decimal](10, 3) NULL,
	[TKMENO7] [decimal](10, 3) NULL,
	[TKMENO8] [decimal](10, 3) NULL,
	[TKMENO9] [decimal](10, 3) NULL,
	[TKMENO10] [decimal](10, 3) NULL,
	[TKMENO11] [decimal](10, 3) NULL,
	[TKMENO12] [decimal](10, 3) NULL,
	[TKMENO13] [decimal](10, 3) NULL,
	[TKMENO14] [decimal](10, 3) NULL,
	[TKMENO15] [decimal](10, 3) NULL,
	[TKMENO16] [decimal](10, 3) NULL,
	[TKMENO17] [decimal](10, 3) NULL,
	[TKMENO18] [decimal](10, 3) NULL,
	[TKMENO19] [decimal](10, 3) NULL,
	[TKMENO20] [decimal](10, 3) NULL,
	[TKMENO21] [decimal](10, 3) NULL,
	[TKMENO22] [decimal](10, 3) NULL,
	[TKMENO23] [decimal](10, 3) NULL,
	[TKMENO24] [decimal](10, 3) NULL,
	[TKMENO25] [decimal](10, 3) NULL,
	[TA1] [varchar](10) NULL,
	[TA2] [varchar](10) NULL,
	[TA3] [varchar](10) NULL,
	[TA4] [varchar](10) NULL,
	[TA5] [varchar](10) NULL,
	[TA6] [varchar](10) NULL,
	[TA7] [varchar](10) NULL,
	[TA8] [varchar](10) NULL,
	[TA9] [varchar](10) NULL,
	[TA10] [varchar](10) NULL,
	[TA11] [varchar](10) NULL,
	[TA12] [varchar](10) NULL,
	[TA13] [varchar](10) NULL,
	[TA14] [varchar](10) NULL,
	[TA15] [varchar](10) NULL,
	[TA16] [varchar](10) NULL,
	[TA17] [varchar](10) NULL,
	[TA18] [varchar](10) NULL,
	[TA1P] [decimal](8, 2) NULL,
	[TA2P] [decimal](8, 2) NULL,
	[TA3P] [decimal](8, 2) NULL,
	[TA4P] [decimal](8, 2) NULL,
	[TA5P] [decimal](8, 2) NULL,
	[TA6P] [decimal](8, 2) NULL,
	[TA7P] [decimal](8, 2) NULL,
	[TA8P] [decimal](8, 2) NULL,
	[TA9P] [decimal](8, 2) NULL,
	[TA10P] [decimal](8, 2) NULL,
	[TA11P] [decimal](8, 2) NULL,
	[TA12P] [decimal](8, 2) NULL,
	[TA13P] [decimal](8, 2) NULL,
	[TA14P] [decimal](8, 2) NULL,
	[TA15P] [decimal](8, 2) NULL,
	[TA16P] [decimal](8, 2) NULL,
	[TA17P] [decimal](8, 2) NULL,
	[TA18P] [decimal](8, 2) NULL,
	[tk_arvio] [int] NULL,
	[tk_arvioe] [decimal](10, 3) NULL,
	[KMENO] [decimal](10, 3) NULL,
	[HMENO] [decimal](10, 3) NULL,
	[TUTLKM] [int] NULL,
	[NTUTLKM] [int] NULL,
	[TUTTTV] [decimal](8, 1) NULL,
	[MTKLKM] [int] NULL,
	[NMTKLKM] [int] NULL,
	[MTKTTV] [decimal](8, 1) NULL,
	[YHTE2] [int] NULL,
	[NYHTE2] [int] NULL,
	[MKOULKM] [int] NULL,
	[NMKOULKM] [int] NULL,
	[MKOUTTV] [decimal](8, 1) NULL,
	[OPISTLKM] [int] NULL,
	[NOPISTLKM] [int] NULL,
	[OPISTTTV] [decimal](8, 1) NULL,
	[KUNNAT] [decimal](10, 3) NULL,
	[MKVJ] [decimal](10, 3) NULL,
	[ORAHAS] [decimal](10, 3) NULL,
	[phy1] [int] NULL,
	[phy2] [int] NULL,
	[phy3] [int] NULL,
	[phy4] [int] NULL,
	[phy5] [int] NULL,
	[phy6] [int] NULL,
	[phyy] [int] NULL,
	[phn1] [int] NULL,
	[phn2] [int] NULL,
	[phn3] [int] NULL,
	[phn4] [int] NULL,
	[phn5] [int] NULL,
	[phn6] [int] NULL,
	[phny] [int] NULL,
	[pty1] [int] NULL,
	[pty2] [int] NULL,
	[pty3] [int] NULL,
	[pty4] [int] NULL,
	[pty5] [int] NULL,
	[pty6] [int] NULL,
	[ptyy] [int] NULL,
	[ptn1] [int] NULL,
	[ptn2] [int] NULL,
	[ptn3] [int] NULL,
	[ptn4] [int] NULL,
	[ptn5] [int] NULL,
	[ptn6] [int] NULL,
	[ptny] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_5_4_Yosairaaloiden_tutkimus_ja_kehitys]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_5_4_Yosairaaloiden_tutkimus_ja_kehitys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_5_4_Yosairaaloiden_tutkimus_ja_kehitys](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[NIMI] [varchar](100) NULL,
	[NIMI2] [varchar](30) NULL,
	[TK_koodi] [varchar](5) NULL,
	[TOLKM] [int] NULL,
	[NTOLKM] [int] NULL,
	[TOTTV] [decimal](10, 3) NULL,
	[LISLKM] [int] NULL,
	[NLISLKM] [int] NULL,
	[LISTTV] [decimal](10, 3) NULL,
	[DILKM] [int] NULL,
	[NDIPLKM] [int] NULL,
	[DIPTTV] [decimal](10, 3) NULL,
	[INSLKM] [int] NULL,
	[NOPINS] [int] NULL,
	[OPINSTTV] [decimal](10, 3) NULL,
	[YHTE] [decimal](10, 3) NULL,
	[NYHTE] [decimal](10, 3) NULL,
	[YHTTTV] [decimal](10, 3) NULL,
	[PAME] [decimal](10, 3) NULL,
	[OSTPAL] [decimal](10, 3) NULL,
	[YHME] [decimal](10, 3) NULL,
	[TEKES] [decimal](10, 3) NULL,
	[MTEM] [decimal](10, 3) NULL,
	[AKATEMIA] [decimal](10, 3) NULL,
	[GRAD] [decimal](10, 3) NULL,
	[MOPEM] [decimal](10, 3) NULL,
	[LIIKM] [decimal](10, 3) NULL,
	[MAAM] [decimal](10, 3) NULL,
	[OM] [decimal](10, 3) NULL,
	[PM] [decimal](10, 3) NULL,
	[SISAM] [decimal](10, 3) NULL,
	[SOSM] [decimal](10, 3) NULL,
	[UM] [decimal](10, 3) NULL,
	[VN] [decimal](10, 3) NULL,
	[VM] [decimal](10, 3) NULL,
	[YMP] [decimal](10, 3) NULL,
	[MUUJU] [decimal](10, 3) NULL,
	[RAHAS] [decimal](10, 3) NULL,
	[KOTIM] [decimal](10, 3) NULL,
	[ULKOY] [decimal](10, 3) NULL,
	[UEU] [decimal](10, 3) NULL,
	[EUPUITE] [numeric](1, 1) NULL,
	[EAKR] [numeric](1, 1) NULL,
	[ESR] [numeric](1, 1) NULL,
	[MUUEU] [numeric](1, 1) NULL,
	[MULKO] [decimal](10, 3) NULL,
	[UYHTE] [decimal](10, 3) NULL,
	[KUNTA1] [varchar](3) NULL,
	[KUNTA2] [varchar](3) NULL,
	[KUNTA3] [varchar](3) NULL,
	[KUNTA4] [varchar](3) NULL,
	[KUNTA5] [varchar](3) NULL,
	[KUNTA6] [varchar](3) NULL,
	[KUNTA7] [varchar](3) NULL,
	[KUNTA8] [varchar](3) NULL,
	[KUNTA9] [varchar](3) NULL,
	[KUNTA10] [varchar](3) NULL,
	[KUNTA11] [varchar](3) NULL,
	[KUNTA12] [varchar](3) NULL,
	[KUNTA13] [varchar](3) NULL,
	[KUNTA14] [varchar](3) NULL,
	[KUNTA15] [varchar](3) NULL,
	[KUNTA16] [varchar](3) NULL,
	[KUNTA17] [varchar](3) NULL,
	[KUNTA18] [varchar](3) NULL,
	[KUNTA19] [varchar](3) NULL,
	[KUNTA20] [varchar](3) NULL,
	[KUNTA21] [varchar](3) NULL,
	[KUNTA22] [varchar](3) NULL,
	[KUNTA23] [varchar](3) NULL,
	[KUNTA24] [varchar](3) NULL,
	[KUNTA25] [varchar](3) NULL,
	[HENLKMY] [int] NULL,
	[TYOVY] [decimal](10, 3) NULL,
	[TKMENOY] [decimal](10, 3) NULL,
	[HENLKM1] [int] NULL,
	[HENLKM2] [int] NULL,
	[HENLKM3] [int] NULL,
	[HENLKM4] [int] NULL,
	[HENLKM5] [int] NULL,
	[HENLKM6] [int] NULL,
	[HENLKM7] [int] NULL,
	[HENLKM8] [int] NULL,
	[HENLKM9] [int] NULL,
	[HENLKM10] [int] NULL,
	[HENLKM11] [int] NULL,
	[HENLKM12] [int] NULL,
	[HENLKM13] [int] NULL,
	[HENLKM14] [int] NULL,
	[HENLKM15] [int] NULL,
	[HENLKM16] [int] NULL,
	[HENLKM17] [int] NULL,
	[HENLKM18] [int] NULL,
	[HENLKM19] [int] NULL,
	[HENLKM20] [int] NULL,
	[HENLKM21] [int] NULL,
	[HENLKM22] [int] NULL,
	[HENLKM23] [int] NULL,
	[HENLKM24] [int] NULL,
	[HENLKM25] [int] NULL,
	[TYOV1] [decimal](10, 3) NULL,
	[TYOV2] [decimal](10, 3) NULL,
	[TYOV3] [decimal](10, 3) NULL,
	[TYOV4] [decimal](10, 3) NULL,
	[TYOV5] [decimal](10, 3) NULL,
	[TYOV6] [decimal](10, 3) NULL,
	[TYOV7] [decimal](10, 3) NULL,
	[TYOV8] [decimal](10, 3) NULL,
	[TYOV9] [decimal](10, 3) NULL,
	[TYOV10] [decimal](10, 3) NULL,
	[TYOV11] [decimal](10, 3) NULL,
	[TYOV12] [decimal](10, 3) NULL,
	[TYOV13] [decimal](10, 3) NULL,
	[TYOV14] [decimal](10, 3) NULL,
	[TYOV15] [decimal](10, 3) NULL,
	[TYOV16] [decimal](10, 3) NULL,
	[TYOV17] [decimal](10, 3) NULL,
	[TYOV18] [decimal](10, 3) NULL,
	[TYOV19] [decimal](10, 3) NULL,
	[TYOV20] [decimal](10, 3) NULL,
	[TYOV21] [decimal](10, 3) NULL,
	[TYOV22] [decimal](10, 3) NULL,
	[TYOV23] [decimal](10, 3) NULL,
	[TYOV24] [decimal](10, 3) NULL,
	[TYOV25] [decimal](10, 3) NULL,
	[TKMENO1] [decimal](10, 3) NULL,
	[TKMENO2] [decimal](10, 3) NULL,
	[TKMENO3] [decimal](10, 3) NULL,
	[TKMENO4] [decimal](10, 3) NULL,
	[TKMENO5] [decimal](10, 3) NULL,
	[TKMENO6] [decimal](10, 3) NULL,
	[TKMENO7] [decimal](10, 3) NULL,
	[TKMENO8] [decimal](10, 3) NULL,
	[TKMENO9] [decimal](10, 3) NULL,
	[TKMENO10] [decimal](10, 3) NULL,
	[TKMENO11] [decimal](10, 3) NULL,
	[TKMENO12] [decimal](10, 3) NULL,
	[TKMENO13] [decimal](10, 3) NULL,
	[TKMENO14] [decimal](10, 3) NULL,
	[TKMENO15] [decimal](10, 3) NULL,
	[TKMENO16] [decimal](10, 3) NULL,
	[TKMENO17] [decimal](10, 3) NULL,
	[TKMENO18] [decimal](10, 3) NULL,
	[TKMENO19] [decimal](10, 3) NULL,
	[TKMENO20] [decimal](10, 3) NULL,
	[TKMENO21] [decimal](10, 3) NULL,
	[TKMENO22] [decimal](10, 3) NULL,
	[TKMENO23] [decimal](10, 3) NULL,
	[TKMENO24] [decimal](10, 3) NULL,
	[TKMENO25] [decimal](10, 3) NULL,
	[TA1] [varchar](10) NULL,
	[TA2] [varchar](10) NULL,
	[TA3] [varchar](10) NULL,
	[TA4] [varchar](10) NULL,
	[TA5] [varchar](10) NULL,
	[TA6] [varchar](10) NULL,
	[TA7] [varchar](10) NULL,
	[TA8] [varchar](10) NULL,
	[TA9] [varchar](10) NULL,
	[TA10] [varchar](10) NULL,
	[TA11] [varchar](10) NULL,
	[TA12] [varchar](10) NULL,
	[TA13] [varchar](10) NULL,
	[TA14] [varchar](10) NULL,
	[TA15] [varchar](10) NULL,
	[TA16] [varchar](10) NULL,
	[TA17] [varchar](10) NULL,
	[TA18] [varchar](10) NULL,
	[TA1P] [decimal](10, 3) NULL,
	[TA2P] [decimal](10, 3) NULL,
	[TA3P] [decimal](10, 3) NULL,
	[TA4P] [decimal](10, 3) NULL,
	[TA5P] [decimal](10, 3) NULL,
	[TA6P] [decimal](10, 3) NULL,
	[TA7P] [decimal](10, 3) NULL,
	[TA8P] [decimal](10, 3) NULL,
	[TA9P] [decimal](10, 3) NULL,
	[TA10P] [decimal](10, 3) NULL,
	[TA11P] [decimal](10, 3) NULL,
	[TA12P] [decimal](10, 3) NULL,
	[TA13P] [decimal](10, 3) NULL,
	[TA14P] [decimal](10, 3) NULL,
	[TA15P] [decimal](10, 3) NULL,
	[TA16P] [decimal](10, 3) NULL,
	[TA17P] [decimal](10, 3) NULL,
	[TA18P] [decimal](10, 3) NULL,
	[tk_arvio] [decimal](13, 3) NULL,
	[tk_arvioe] [decimal](10, 3) NULL,
	[KMENO] [decimal](10, 3) NULL,
	[HMENO] [decimal](10, 3) NULL,
	[TUTLKM] [int] NULL,
	[NTUTLKM] [int] NULL,
	[TUTTTV] [decimal](10, 3) NULL,
	[MTKLKM] [int] NULL,
	[NMTKLKM] [int] NULL,
	[MTKTTV] [decimal](10, 3) NULL,
	[YHTE2] [int] NULL,
	[NYHTE2] [int] NULL,
	[MKOULKM] [int] NULL,
	[NMKOULKM] [int] NULL,
	[MKOUTTV] [decimal](10, 3) NULL,
	[OPISTLKM] [int] NULL,
	[NOPISTLKM] [int] NULL,
	[OPISTTTV] [decimal](10, 3) NULL,
	[KUNNAT] [decimal](10, 3) NULL,
	[MKVJ] [decimal](10, 3) NULL,
	[ORAHAS] [decimal](10, 3) NULL,
	[phy1] [int] NULL,
	[phy2] [int] NULL,
	[phy3] [int] NULL,
	[phy4] [int] NULL,
	[phy5] [int] NULL,
	[phy6] [int] NULL,
	[phyy] [int] NULL,
	[phn1] [int] NULL,
	[phn2] [int] NULL,
	[phn3] [int] NULL,
	[phn4] [int] NULL,
	[phn5] [int] NULL,
	[phn6] [int] NULL,
	[phny] [int] NULL,
	[pty1] [int] NULL,
	[pty2] [int] NULL,
	[pty3] [int] NULL,
	[pty4] [int] NULL,
	[pty5] [int] NULL,
	[pty6] [int] NULL,
	[ptyy] [int] NULL,
	[ptn1] [int] NULL,
	[ptn2] [int] NULL,
	[ptn3] [int] NULL,
	[ptn4] [int] NULL,
	[ptn5] [int] NULL,
	[ptn6] [int] NULL,
	[ptny] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk](
	[tilv] [varchar](4) NULL,
	[sp] [varchar](1) NULL,
	[syntv] [varchar](4) NULL,
	[tilvaskun] [varchar](3) NULL,
	[tilvaskunsama] [varchar](1) NULL,
	[oleskelux] [varchar](1) NULL,
	[muuttov] [varchar](4) NULL,
	[aikielir4] [varchar](2) NULL,
	[kansalr3] [varchar](3) NULL,
	[svaltr3] [varchar](3) NULL,
	[svaltr3_aiti] [varchar](3) NULL,
	[svaltr3_isa] [varchar](3) NULL,
	[htok] [varchar](1) NULL,
	[klajir1] [varchar](2) NULL,
	[ophal] [varchar](2) NULL,
	[opmopa] [varchar](3) NULL,
	[kkieli] [varchar](2) NULL,
	[kkun] [varchar](3) NULL,
	[alvv] [varchar](4) NULL,
	[olosyys] [varchar](1) NULL,
	[maassaolo] [varchar](1) NULL,
	[osatutk] [varchar](1) NULL,
	[uusi] [int] NULL,
	[opisk] [int] NULL,
	[tutk] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk](
	[tilv] [varchar](4) NULL,
	[sp] [varchar](1) NULL,
	[syntv] [varchar](4) NULL,
	[tilvaskun] [varchar](3) NULL,
	[tilvaskunsama] [varchar](1) NULL,
	[oleskelux] [varchar](1) NULL,
	[muuttov] [varchar](4) NULL,
	[aikielir4] [varchar](2) NULL,
	[kansalr3] [varchar](3) NULL,
	[svaltr3] [varchar](3) NULL,
	[svaltr3_aiti] [varchar](3) NULL,
	[svaltr3_isa] [varchar](3) NULL,
	[htok] [varchar](1) NULL,
	[klajir1] [varchar](2) NULL,
	[ophal] [varchar](1) NULL,
	[opmopa] [varchar](3) NULL,
	[kkieli] [varchar](2) NULL,
	[kkun] [varchar](3) NULL,
	[alvv] [varchar](4) NULL,
	[olosyys] [varchar](1) NULL,
	[maassaolo] [varchar](1) NULL,
	[osatutk] [varchar](1) NULL,
	[uusi] [int] NULL,
	[opisk] [int] NULL,
	[tutk] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](1) NULL,
	[lahde] [nvarchar](2) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[tilvaskun] [nvarchar](3) NULL,
	[kansalr1] [nvarchar](1) NULL,
	[eumaa] [nvarchar](1) NULL,
	[etamaa] [nvarchar](1) NULL,
	[pohjmaa] [nvarchar](1) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](1) NULL,
	[ololk] [nvarchar](4) NULL,
	[jarj] [nvarchar](10) NULL,
	[tunn] [nvarchar](5) NULL,
	[koulk] [nvarchar](6) NULL,
	[koulk_opintoala] [nvarchar](6) NULL,
	[koulk_koulutusala] [nvarchar](6) NULL,
	[koulk_koulutusaste] [nvarchar](6) NULL,
	[kkielir1] [nvarchar](2) NULL,
	[kkun] [nvarchar](3) NULL,
	[kkun_kmaak] [nvarchar](2) NULL,
	[ophal] [nvarchar](1) NULL,
	[koultyp] [nvarchar](1) NULL,
	[tutkmaak] [nvarchar](2) NULL,
	[tutkjarj] [nvarchar](10) NULL,
	[tutktunn] [nvarchar](5) NULL,
	[tutkkoulk] [nvarchar](6) NULL,
	[tutk_opintoala] [nvarchar](6) NULL,
	[tutk_koulutusala] [nvarchar](6) NULL,
	[tutk_koulutusaste] [nvarchar](6) NULL,
	[tutkkoultyp] [nvarchar](1) NULL,
	[seurvkmaak] [nvarchar](2) NULL,
	[seurvjarj] [nvarchar](10) NULL,
	[seurvtunn] [nvarchar](5) NULL,
	[seurvkoulk] [nvarchar](6) NULL,
	[seurv_opintoala] [nvarchar](6) NULL,
	[seurv_koulutusala] [nvarchar](6) NULL,
	[seurv_koulutusaste] [nvarchar](6) NULL,
	[seurvkoultyp] [nvarchar](1) NULL,
	[ptoim1r2] [nvarchar](2) NULL,
	[amas1] [nvarchar](1) NULL,
	[lkm] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_K3_16_Moninkertainen_haku]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_K3_16_Moninkertainen_haku]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_K3_16_Moninkertainen_haku](
	[tilv] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[allk] [varchar](1) NULL,
	[luammhaku1_tunn] [varchar](5) NULL,
	[luammhaku2_tunn] [varchar](5) NULL,
	[luammhaku3_tunn] [varchar](5) NULL,
	[luammhaku4_tunn] [varchar](5) NULL,
	[luammhaku5_tunn] [varchar](5) NULL,
	[luammhaku1_opmast] [varchar](2) NULL,
	[luammhaku2_opmast] [varchar](2) NULL,
	[luammhaku3_opmast] [varchar](2) NULL,
	[luammhaku4_opmast] [varchar](2) NULL,
	[luammhaku5_opmast] [varchar](2) NULL,
	[luammhaku1_opmopa] [varchar](3) NULL,
	[luammhaku2_opmopa] [varchar](3) NULL,
	[luammhaku3_opmopa] [varchar](3) NULL,
	[luammhaku4_opmopa] [varchar](3) NULL,
	[luammhaku5_opmopa] [varchar](3) NULL,
	[luammhaku1_opm95opa] [varchar](3) NULL,
	[luammhaku2_opm95opa] [varchar](3) NULL,
	[luammhaku3_opm95opa] [varchar](3) NULL,
	[luammhaku4_opm95opa] [varchar](3) NULL,
	[luammhaku5_opm95opa] [varchar](3) NULL,
	[luammhaku1_okieli] [varchar](1) NULL,
	[luammhaku2_okieli] [varchar](1) NULL,
	[luammhaku3_okieli] [varchar](1) NULL,
	[luammhaku4_okieli] [varchar](1) NULL,
	[luammhaku5_okieli] [varchar](1) NULL,
	[luammhaku1_hyv] [varchar](1) NULL,
	[luammhaku2_hyv] [varchar](1) NULL,
	[luammhaku3_hyv] [varchar](1) NULL,
	[luammhaku4_hyv] [varchar](1) NULL,
	[luammhaku5_hyv] [varchar](1) NULL,
	[luammhaku1_vastotto] [varchar](1) NULL,
	[luammhaku2_vastotto] [varchar](1) NULL,
	[luammhaku3_vastotto] [varchar](1) NULL,
	[luammhaku4_vastotto] [varchar](1) NULL,
	[luammhaku5_vastotto] [varchar](1) NULL,
	[amkhaku1_tunn] [varchar](5) NULL,
	[amkhaku2_tunn] [varchar](5) NULL,
	[amkhaku3_tunn] [varchar](5) NULL,
	[amkhaku4_tunn] [varchar](5) NULL,
	[amkhakum_tunn] [varchar](5) NULL,
	[amkhaku1_opmast] [varchar](3) NULL,
	[amkhaku2_opmast] [varchar](3) NULL,
	[amkhaku3_opmast] [varchar](3) NULL,
	[amkhaku4_opmast] [varchar](3) NULL,
	[amkhakum_opmast] [varchar](3) NULL,
	[amkhaku1_opmopa] [varchar](3) NULL,
	[amkhaku2_opmopa] [varchar](3) NULL,
	[amkhaku3_opmopa] [varchar](3) NULL,
	[amkhaku4_opmopa] [varchar](3) NULL,
	[amkhakum_opmopa] [varchar](3) NULL,
	[amkhaku1_opm95opa] [varchar](3) NULL,
	[amkhaku2_opm95opa] [varchar](3) NULL,
	[amkhaku3_opm95opa] [varchar](3) NULL,
	[amkhaku4_opm95opa] [varchar](3) NULL,
	[amkhakum_opm95opa] [varchar](3) NULL,
	[amkhaku1_koultyp] [varchar](1) NULL,
	[amkhaku2_koultyp] [varchar](1) NULL,
	[amkhaku3_koultyp] [varchar](1) NULL,
	[amkhaku4_koultyp] [varchar](1) NULL,
	[amkhakum_koultyp] [varchar](1) NULL,
	[amkhaku1_okieli] [varchar](1) NULL,
	[amkhaku2_okieli] [varchar](1) NULL,
	[amkhaku3_okieli] [varchar](1) NULL,
	[amkhaku4_okieli] [varchar](1) NULL,
	[amkhakum_okieli] [varchar](1) NULL,
	[amkhaku1_hyv] [varchar](1) NULL,
	[amkhaku2_hyv] [varchar](1) NULL,
	[amkhaku3_hyv] [varchar](1) NULL,
	[amkhaku4_hyv] [varchar](1) NULL,
	[amkhakum_hyv] [varchar](1) NULL,
	[amkhaku1_vastotto] [varchar](1) NULL,
	[amkhaku2_vastotto] [varchar](1) NULL,
	[amkhaku3_vastotto] [varchar](1) NULL,
	[amkhaku4_vastotto] [varchar](1) NULL,
	[amkhakum_vastotto] [varchar](1) NULL,
	[yohakua_tunn] [varchar](5) NULL,
	[yohakub_tunn] [varchar](5) NULL,
	[yohakuc_tunn] [varchar](5) NULL,
	[yohakud_tunn] [varchar](5) NULL,
	[yohakue_tunn] [varchar](5) NULL,
	[yohakuf_tunn] [varchar](5) NULL,
	[yohakug_tunn] [varchar](5) NULL,
	[yohakuh_tunn] [varchar](5) NULL,
	[yohakui_tunn] [varchar](5) NULL,
	[yohakua_opmast] [varchar](2) NULL,
	[yohakub_opmast] [varchar](2) NULL,
	[yohakuc_opmast] [varchar](2) NULL,
	[yohakud_opmast] [varchar](2) NULL,
	[yohakue_opmast] [varchar](2) NULL,
	[yohakuf_opmast] [varchar](2) NULL,
	[yohakug_opmast] [varchar](2) NULL,
	[yohakuh_opmast] [varchar](2) NULL,
	[yohakui_opmast] [varchar](2) NULL,
	[yohakua_opmopa] [varchar](3) NULL,
	[yohakub_opmopa] [varchar](3) NULL,
	[yohakuc_opmopa] [varchar](3) NULL,
	[yohakud_opmopa] [varchar](3) NULL,
	[yohakue_opmopa] [varchar](3) NULL,
	[yohakuf_opmopa] [varchar](3) NULL,
	[yohakug_opmopa] [varchar](3) NULL,
	[yohakuh_opmopa] [varchar](3) NULL,
	[yohakui_opmopa] [varchar](3) NULL,
	[yohakua_opm95opa] [varchar](3) NULL,
	[yohakub_opm95opa] [varchar](3) NULL,
	[yohakuc_opm95opa] [varchar](3) NULL,
	[yohakud_opm95opa] [varchar](3) NULL,
	[yohakue_opm95opa] [varchar](3) NULL,
	[yohakuf_opm95opa] [varchar](3) NULL,
	[yohakug_opm95opa] [varchar](3) NULL,
	[yohakuh_opm95opa] [varchar](3) NULL,
	[yohakui_opm95opa] [varchar](3) NULL,
	[yohakua_hyv] [varchar](1) NULL,
	[yohakub_hyv] [varchar](1) NULL,
	[yohakuc_hyv] [varchar](1) NULL,
	[yohakud_hyv] [varchar](1) NULL,
	[yohakue_hyv] [varchar](1) NULL,
	[yohakuf_hyv] [varchar](1) NULL,
	[yohakug_hyv] [varchar](1) NULL,
	[yohakuh_hyv] [varchar](1) NULL,
	[yohakui_hyv] [varchar](1) NULL,
	[yohakua_vastotto] [varchar](1) NULL,
	[yohakub_vastotto] [varchar](1) NULL,
	[yohakuc_vastotto] [varchar](1) NULL,
	[yohakud_vastotto] [varchar](1) NULL,
	[yohakue_vastotto] [varchar](1) NULL,
	[yohakuf_vastotto] [varchar](1) NULL,
	[yohakug_vastotto] [varchar](1) NULL,
	[yohakuh_vastotto] [varchar](1) NULL,
	[yohakui_vastotto] [varchar](1) NULL,
	[yohakua_harekast] [varchar](2) NULL,
	[yohakub_harekast] [varchar](2) NULL,
	[yohakuc_harekast] [varchar](2) NULL,
	[yohakud_harekast] [varchar](2) NULL,
	[yohakue_harekast] [varchar](2) NULL,
	[yohakuf_harekast] [varchar](2) NULL,
	[yohakug_harekast] [varchar](2) NULL,
	[yohakuh_harekast] [varchar](2) NULL,
	[yohakui_harekast] [varchar](2) NULL,
	[yohakua_ylempi] [varchar](1) NULL,
	[yohakub_ylempi] [varchar](1) NULL,
	[yohakuc_ylempi] [varchar](1) NULL,
	[yohakud_ylempi] [varchar](1) NULL,
	[yohakue_ylempi] [varchar](1) NULL,
	[yohakuf_ylempi] [varchar](1) NULL,
	[yohakug_ylempi] [varchar](1) NULL,
	[yohakuh_ylempi] [varchar](1) NULL,
	[yohakui_ylempi] [varchar](1) NULL,
	[yohakua_erval] [varchar](1) NULL,
	[yohakub_erval] [varchar](1) NULL,
	[yohakuc_erval] [varchar](1) NULL,
	[yohakud_erval] [varchar](1) NULL,
	[yohakue_erval] [varchar](1) NULL,
	[yohakuf_erval] [varchar](1) NULL,
	[yohakug_erval] [varchar](1) NULL,
	[yohakuh_erval] [varchar](1) NULL,
	[yohakui_erval] [varchar](1) NULL,
	[luhakux] [varchar](1) NULL,
	[luhaku2x] [varchar](1) NULL,
	[luhaku3x] [varchar](1) NULL,
	[ammhakux] [varchar](1) NULL,
	[ammhaku2x] [varchar](1) NULL,
	[ammhaku3x] [varchar](1) NULL,
	[amkhakux] [varchar](1) NULL,
	[amkhaku2x] [varchar](1) NULL,
	[amkhaku3x] [varchar](1) NULL,
	[yohakux] [varchar](1) NULL,
	[yohaku2x] [varchar](1) NULL,
	[yohaku3x] [varchar](1) NULL,
	[sp] [varchar](1) NULL,
	[aikielir1] [varchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[tilvaskunx] [varchar](3) NULL,
	[kansalr1] [varchar](1) NULL,
	[aikyotutk] [varchar](1) NULL,
	[aikyotutkkoulk] [varchar](6) NULL,
	[suvuosiyotutk] [varchar](4) NULL,
	[tunnyotutk] [varchar](5) NULL,
	[aikamm] [varchar](1) NULL,
	[aikammkoulk] [varchar](6) NULL,
	[suvuosiamm] [varchar](4) NULL,
	[tunnamm] [varchar](5) NULL,
	[aikamk] [varchar](1) NULL,
	[aikamkkoulk] [varchar](6) NULL,
	[suvuosiamk] [varchar](4) NULL,
	[tunnamk] [varchar](5) NULL,
	[aikylamk] [varchar](1) NULL,
	[aikylamkkoulk] [varchar](6) NULL,
	[suvuosiylamk] [varchar](4) NULL,
	[tunnylamk] [varchar](5) NULL,
	[aikalkk] [varchar](1) NULL,
	[aikalkkkoulk] [varchar](6) NULL,
	[suvuosialkk] [varchar](4) NULL,
	[tunnalkk] [varchar](5) NULL,
	[aikylkk] [varchar](1) NULL,
	[aikylkkkoulk] [varchar](6) NULL,
	[suvuosiylkk] [varchar](4) NULL,
	[tunnylkk] [varchar](5) NULL,
	[aiklistri] [varchar](1) NULL,
	[aiklistrikoulk] [varchar](6) NULL,
	[suvuosilistri] [varchar](4) NULL,
	[tunnlistri] [varchar](5) NULL,
	[yotutkopisx] [varchar](1) NULL,
	[yotutkopisxkoulk] [varchar](6) NULL,
	[yotutkopisxtunn] [varchar](5) NULL,
	[ammopisx] [varchar](1) NULL,
	[ammopisxkoulk] [varchar](6) NULL,
	[ammopisxtunn] [varchar](6) NULL,
	[amkopisx1] [varchar](1) NULL,
	[amkopisxkoulk1] [varchar](6) NULL,
	[amkopisxtunn1] [varchar](5) NULL,
	[amkopisx2] [varchar](1) NULL,
	[amkopisxkoulk2] [varchar](6) NULL,
	[amkopisxtunn2] [varchar](5) NULL,
	[amkopisx3] [varchar](1) NULL,
	[amkopisxkoulk3] [varchar](6) NULL,
	[amkopisxtunn3] [varchar](5) NULL,
	[yoopisx1] [varchar](1) NULL,
	[yoopisxkoulk1] [varchar](6) NULL,
	[yoopisxtunn1] [varchar](5) NULL,
	[yoopisx2] [varchar](1) NULL,
	[yoopisxkoulk2] [varchar](6) NULL,
	[yoopisxtunn2] [varchar](5) NULL,
	[yoopisx3] [varchar](1) NULL,
	[yoopisxkoulk3] [varchar](6) NULL,
	[yoopisxtunn3] [varchar](5) NULL,
	[ptoim1r3x] [varchar](2) NULL,
	[htok] [varchar](1) NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](31) NOT NULL,
	[rivinumero] [bigint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat](
	[tilv] [varchar](4) NULL,
	[svalt] [varchar](3) NULL,
	[kansal] [varchar](3) NULL,
	[sp] [varchar](1) NULL,
	[ikar5] [varchar](2) NULL,
	[maakunta] [varchar](2) NULL,
	[ptoim1] [varchar](2) NULL,
	[koulk] [varchar](6) NULL,
	[suorv] [varchar](4) NULL,
	[suormaak] [varchar](2) NULL,
	[amm2010_2] [int] NULL,
	[tmaak] [varchar](2) NULL,
	[tol2008_akatemia] [varchar](2) NULL,
	[tsekt_2] [varchar](2) NULL,
	[ta_vaihdos] [varchar](2) NULL,
	[sl] [varchar](2) NULL,
	[tol2008_tthv_ed] [varchar](2) NULL,
	[tsekt_ed] [varchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_R4_19_Tyollisten_ammattisiirtymat]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_R4_19_Tyollisten_ammattisiirtymat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_R4_19_Tyollisten_ammattisiirtymat](
	[tilv] [varchar](4) NULL,
	[sp] [varchar](1) NULL,
	[aikielir1] [varchar](2) NULL,
	[ikar1] [varchar](4) NULL,
	[tmaak] [varchar](6) NULL,
	[amm2001_m1] [varchar](2) NULL,
	[amm2001_m2] [varchar](50) NULL,
	[ptoim1r7_2009] [varchar](2) NULL,
	[tmaakr1_2009] [varchar](1) NULL,
	[amm2001_m1_2009] [varchar](2) NULL,
	[amm2001_m2_2009] [varchar](50) NULL,
	[lkm] [int] NULL,
	[suhteellinen_ajankohta_avain] [varchar](10) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_R4_20_Tyollisten_aiemmat_ammatit]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_R4_20_Tyollisten_aiemmat_ammatit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_R4_20_Tyollisten_aiemmat_ammatit](
	[tilv] [varchar](4) NULL,
	[aikielir1] [varchar](2) NULL,
	[ikar1] [varchar](4) NULL,
	[tmaak] [varchar](6) NULL,
	[amm2001_m1] [varchar](2) NULL,
	[amm2001_m2] [varchar](50) NULL,
	[ptoim1r7_2004] [varchar](2) NULL,
	[tmaakr1_2004] [varchar](1) NULL,
	[amm2001_m1_2004] [varchar](2) NULL,
	[amm2001_m2_2004] [varchar](50) NULL,
	[lkm] [int] NULL,
	[suhteellinen_ajankohta_avain] [varchar](10) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sarakeleveys]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sarakeleveys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sarakeleveys](
	[sarakeleveys] [char](1) NULL,
	[leveys] [varchar](100) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SSIS Configurations]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SSIS Configurations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SSIS Configurations](
	[ConfigurationFilter] [nvarchar](255) NOT NULL,
	[ConfiguredValue] [nvarchar](255) NULL,
	[PackagePath] [nvarchar](255) NOT NULL,
	[ConfiguredValueType] [nvarchar](20) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkintolaji_tyollistymiseen]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkintolaji_tyollistymiseen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkintolaji_tyollistymiseen](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkintolaji_tyollistymiseen_koodi] [nvarchar](2) NULL,
	[tutkintolaji_tyollistymiseen] [nvarchar](350) NULL,
	[tutkintolaji_tyollistymiseen_SV] [nvarchar](350) NULL,
	[tutkintolaji_tyollistymiseen_EN] [nvarchar](350) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VipunenTK_laatu]    Script Date: 19.6.2017 11:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VipunenTK_laatu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VipunenTK_laatu](
	[Taulu] [sysname] NOT NULL,
	[Sarake] [sysname] NOT NULL,
	[Arvo] [int] NULL,
	[Lkm] [int] NULL
) ON [PRIMARY]
END
GO

USE [ANTERO]


