USE [VipunenTK]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__tutkinnon_suoritusvuosi__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__tutkinnon_suorituslukukausi__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__syntymavuosi__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__oppilaitos__d_oppilaitoksen_taustatiedot_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__oppilaitos__d_oppilaitoksen_taustatiedot]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__opintoala1995__d_koulutusluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__koulutusluokitus__d_koulutusluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__koulutuslaji_OKM_id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__koulutuksen_kunta__d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__koulutuksen_kunta__d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__koulutuksen_kieli__d_kieli]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kotikunta1x__d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kotikunta1x__d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kotikunta__d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kotikunta__d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kirjoihinvuosi_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kirjoihintulovuosi_tutkinto__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kirjoihintulovuosi_sektori_lasnaoleva__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kirjoihintulovuosi_sektori__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kirjoihintulovuosi_opintoala_lasnaoleva__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kirjoihintulovuosi_opintoala__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kirjoihintulovuosi_korkeakoulu_lasnaoleva__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kirjoihintulovuosi_korkeakoulu__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kirjoihintulovuosi_kirjoihintulovuosi_korkeakoulusektori__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kirjoihintulovuosi__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kirjoihintulokausi_tutkinto__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__kirjoihintulokausi__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_tutkinto_yo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_tutkinto_amk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_tilauskoulutuksen_sijaintimaa]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_tiedekunta_yo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_suuntautumisvaihtoehto_amk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_sukupuoli]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_rahoituslahde]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_opiskelumuoto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_opetushallinnon_koulutus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_opettajankelpoisuus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_lahde]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_koulutustyyppi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_koulutussektori]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_koulutusohjelma_amk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_koulutuslaji_OKM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_kansalaisuus_versio2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_ika]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_aineisto_OTV]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_aineisto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_aidinkieli_versio1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__tutkintooikeusvuosi__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__syntymavuosi__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__oppilaitos__d_oppilaitoksen_taustatiedot_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__oppilaitos__d_oppilaitoksen_taustatiedot]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__oppilaitos__d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__oppilaitos__d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__opiskelijan_olo_tamm__d_opiskelijan_olo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__opiskelijan_olo_syys__d_opiskelijan_olo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__koulutusluokitus__d_koulutusluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__koulutuslaji_OKM_id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__koulutuksen_kunta__d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__koulutuksen_kunta__d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__koulutuksen_kieli__d_kieli]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__koulutuksen_jarjestaja_kunta__d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kotikunta2x__d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kotikunta2x__d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kotikunta1x__d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kotikunta1x__d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kotikunta__d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kotikunta__d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kirjoihinvuosi_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kirjoihintulovuosi_tutkinto__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kirjoihintulovuosi_sektori_lasnaoleva__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kirjoihintulovuosi_sektori__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kirjoihintulovuosi_opintoala_lasnaoleva__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kirjoihintulovuosi_opintoala__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kirjoihintulovuosi_korkeakoulu_lasnaoleva__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kirjoihintulovuosi_korkeakoulu__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kirjoihintulovuosi_kirjoihintulovuosi_korkeakoulusektori__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kirjoihintulovuosi__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kirjoihintulokausi_tutkinto__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__kirjoihintulokausi__d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_yliopisto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_vahintaan_55_op_suorittanut]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_uusi_vanha_opiskelija]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_tutkinto_yo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_tutkinto_amk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_tilauskoulutuksen_sijaintimaa]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_tiedekunta_yo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_suuntautumisvaihtoehto_amk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_sukupuoli]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_rahoituslahde]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_opiskelumuoto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_opiskelijan_fte_tieto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_opetushallinnon_koulutus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_opettajankelpoisuus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_lahde]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_koulutustyyppi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_koulutussektori]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_koulutusohjelma_amk]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_koulutuslaji_OKM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_kansalaisuus_versio2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_ika]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_ensisijainen_opintooikeus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_avoinvayla]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_aineisto_OTV]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_aineisto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_aidinkieli_versio1]
GO
/****** Object:  Table [dbo].[f_OTV_2_9_Korkeakoulututkinnot]    Script Date: 20.3.2018 17:51:24 ******/
DROP TABLE IF EXISTS [dbo].[f_OTV_2_9_Korkeakoulututkinnot]
GO
/****** Object:  Table [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]    Script Date: 20.3.2018 17:51:24 ******/
DROP TABLE IF EXISTS [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]
GO
/****** Object:  Table [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]    Script Date: 20.3.2018 17:51:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[aineisto_id] [int] NULL,
	[lahde] [nvarchar](2) NULL,
	[lahde_id] [int] NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[oppilaitos_id] [int] NULL,
	[oppilaitos_historia_id] [int] NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_id] [int] NULL,
	[koulutuksen_jarjestaja_historia_id] [int] NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusluokitus_id] [int] NULL,
	[koulutusluokitus_historia_id] [int] NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[koulutuksen_kunta_id] [int] NULL,
	[koulutuksen_kunta_historia_id] [int] NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[sukupuoli_id] [int] NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymavuosi_id] [nvarchar](10) NULL,
	[kotikunta] [nvarchar](6) NULL,
	[kotikunta_id] [int] NULL,
	[kotikunta_historia_id] [int] NULL,
	[kotikunta1x] [nvarchar](3) NULL,
	[kotikunta1x_id] [int] NULL,
	[kotikunta1x_historia_id] [int] NULL,
	[kotikunta2x] [nvarchar](3) NULL,
	[kotikunta2x_id] [int] NULL,
	[kotikunta2x_historia_id] [int] NULL,
	[kansalaisuus_versio2] [nvarchar](2) NULL,
	[kansalaisuus_versio2_id] [int] NULL,
	[kirjoihintulovuosi] [nvarchar](10) NULL,
	[jarjestys_kirjoihintulovuosi] [int] NULL,
	[kirjoihintulovuosi_id] [nvarchar](10) NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[kirjoihintulokausi_id] [nvarchar](10) NULL,
	[opiskelijan_olo_tamm] [nvarchar](2) NULL,
	[opiskelijan_olo_tamm_id] [int] NULL,
	[opiskelijan_olo_syys] [nvarchar](2) NULL,
	[opiskelijan_olo_syys_id] [int] NULL,
	[rahoituslahde] [nvarchar](2) NULL,
	[rahoituslahde_id] [int] NULL,
	[opiskelijan_fte_tieto] [nvarchar](2) NULL,
	[opiskelijan_fte_tieto_id] [int] NULL,
	[kirjoihintulovuosi_korkeakoulusektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_sektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_korkeakoulu] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_opintoala] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva_id] [nvarchar](10) NULL,
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
	[vahintaan_55_op_suorittanut_id] [int] NULL,
	[op_edellinen_syksy] [int] NULL,
	[op_edellinen_kevat] [int] NULL,
	[op_kertyma_edel_lkv_loppu] [int] NULL,
	[tutkinto_amk] [nvarchar](3) NULL,
	[tutkinto_amk_id] [int] NULL,
	[koulutusohjelma_amk] [nvarchar](4) NULL,
	[koulutusohjelma_amk_id] [int] NULL,
	[suuntautumisvaihtoehto_amk] [nvarchar](5) NULL,
	[suuntautumisvaihtoehto_amk_id] [int] NULL,
	[koulutustyyppi] [nvarchar](2) NULL,
	[koulutustyyppi_id] [int] NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_kieli_id] [int] NULL,
	[lkm_lasnalk] [int] NULL,
	[lkm_poissalk] [int] NULL,
	[op_suoritettavien_laajuus] [int] NULL,
	[kirjoihintulovuosi_tutkinto] [nvarchar](4) NULL,
	[kirjoihintulovuosi_tutkinto_id] [nvarchar](10) NULL,
	[kirjoihintulokausi_tutkinto] [nvarchar](2) NULL,
	[kirjoihintulokausi_tutkinto_id] [nvarchar](10) NULL,
	[ensisijainen_opintooikeus] [nvarchar](2) NULL,
	[ensisijainen_opintooikeus_id] [int] NULL,
	[tilauskoulutuksen_sijaintimaa] [nvarchar](2) NULL,
	[tilauskoulutuksen_sijaintimaa_id] [int] NULL,
	[tutkinto_yo] [nvarchar](3) NULL,
	[tutkinto_yo_id] [int] NULL,
	[koulutusohjelma_yo] [nvarchar](4) NULL,
	[paaaine_yo] [nvarchar](4) NULL,
	[yliopisto] [nvarchar](2) NULL,
	[yliopisto_id] [int] NULL,
	[tiedekunta_yo] [nvarchar](2) NULL,
	[tiedekunta_yo_id] [int] NULL,
	[uusi_vanha_opiskelija] [nvarchar](2) NULL,
	[uusi_vanha_opiskelija_id] [int] NULL,
	[tutkintooikeusvuosi] [nvarchar](4) NULL,
	[tutkintooikeusvuosi_id] [nvarchar](10) NULL,
	[opiskelumuoto] [nvarchar](2) NULL,
	[opiskelumuoto_id] [int] NULL,
	[opettajankelpoisuus] [nvarchar](2) NULL,
	[opettajankelpoisuus_id] [int] NULL,
	[avoinvayla] [nvarchar](2) NULL,
	[avoinvayla_id] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[koulutussektori_id] [int] NULL,
	[ika_1v] [nvarchar](4) NULL,
	[ika_id] [int] NULL,
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
	[aineisto_OTV_id] [int] NULL,
	[koulutuksen_jarjestaja_kunta_id] [int] NULL,
	[koulutuksen_jarjestaja_kunta_historia_id] [int] NULL,
	[oppilaitos_kunta_id] [int] NULL,
	[oppilaitos_kunta_historia_id] [int] NULL,
	[opetushallinnon_koulutus_id] [int] NULL,
	[koulutuslaji_OKM_id] [int] NULL,
	[koulutusryhma_id] [int] NULL,
	[ikaryhma1_id] [int] NULL,
	[ikaryhma2_id] [int] NULL,
	[tieteenala_avain] [nvarchar](20) NULL,
	[tieteenala_id] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[f_OTV_2_9_Korkeakoulututkinnot]    Script Date: 20.3.2018 17:51:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[aineisto_id] [int] NULL,
	[lahde] [nvarchar](2) NULL,
	[lahde_id] [int] NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[oppilaitos_id] [int] NULL,
	[oppilaitos_historia_id] [int] NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_id] [int] NULL,
	[koulutuksen_jarjestaja_historia_id] [int] NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusluokitus_id] [int] NULL,
	[koulutusluokitus_historia_id] [int] NULL,
	[opintoala1995] [nvarchar](2) NULL,
	[opintoala1995_id] [int] NULL,
	[opintoala1995_historia_id] [int] NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[koulutuksen_kunta_id] [int] NULL,
	[koulutuksen_kunta_historia_id] [int] NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[sukupuoli_id] [int] NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymavuosi_id] [nvarchar](10) NULL,
	[kotikunta] [nvarchar](3) NULL,
	[kotikunta_id] [int] NULL,
	[kotikunta_historia_id] [int] NULL,
	[kotikunta1x] [nvarchar](3) NULL,
	[kotikunta1x_id] [int] NULL,
	[kotikunta1x_historia_id] [int] NULL,
	[kansalaisuus_versio2] [nvarchar](2) NULL,
	[kansalaisuus_versio2_id] [int] NULL,
	[kirjoihintulovuosi] [nvarchar](10) NULL,
	[jarjestys_kirjoihintulovuosi] [int] NULL,
	[kirjoihintulovuosi_id] [nvarchar](10) NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[kirjoihintulokausi_id] [nvarchar](10) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suoritusvuosi_id] [nvarchar](10) NULL,
	[tutkinnon_suorituslukukausi] [nvarchar](2) NULL,
	[tutkinnon_suorituslukukausi_id] [nvarchar](10) NULL,
	[rahoituslahde] [nvarchar](2) NULL,
	[rahoituslahde_id] [int] NULL,
	[kirjoihintulovuosi_korkeakoulusektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_sektori] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_korkeakoulu] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_opintoala] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva] [nvarchar](4) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva_id] [nvarchar](10) NULL,
	[lukumaara] [int] NULL,
	[tutkinto_amk] [nvarchar](3) NULL,
	[tutkinto_amk_id] [int] NULL,
	[koulutusohjelma_amk] [nvarchar](4) NULL,
	[koulutusohjelma_amk_id] [int] NULL,
	[suuntautumisvaihtoehto_amk] [nvarchar](5) NULL,
	[suuntautumisvaihtoehto_amk_id] [int] NULL,
	[koulutustyyppi] [nvarchar](2) NULL,
	[koulutustyyppi_id] [int] NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_kieli_id] [int] NULL,
	[lkm_lasnalk] [int] NULL,
	[lkm_poissalk] [int] NULL,
	[op_suoritettavien_laajuus] [int] NULL,
	[kirjoihintulovuosi_tutkinto] [nvarchar](4) NULL,
	[kirjoihintulovuosi_tutkinto_id] [nvarchar](10) NULL,
	[kirjoihintulokausi_tutkinto] [nvarchar](2) NULL,
	[kirjoihintulokausi_tutkinto_id] [nvarchar](10) NULL,
	[op_amk_yhteensa] [int] NULL,
	[op_amk_yleissiv_amm_opplait] [int] NULL,
	[op_amk_muualla] [int] NULL,
	[op_amk_oma_amk] [int] NULL,
	[op_amk_muu_amk] [int] NULL,
	[op_amk_yliopistoissa] [int] NULL,
	[op_amk_ulkomailla] [int] NULL,
	[tilauskoulutuksen_sijaintimaa] [nvarchar](2) NULL,
	[tilauskoulutuksen_sijaintimaa_id] [int] NULL,
	[tutkinto_yo] [nvarchar](3) NULL,
	[tutkinto_yo_id] [int] NULL,
	[koulutusohjelma_yo] [nvarchar](4) NULL,
	[paaaine_yo] [nvarchar](4) NULL,
	[tiedekunta_yo] [nvarchar](2) NULL,
	[tiedekunta_yo_id] [int] NULL,
	[opiskelumuoto] [nvarchar](2) NULL,
	[opiskelumuoto_id] [int] NULL,
	[opettajankelpoisuus] [nvarchar](2) NULL,
	[opettajankelpoisuus_id] [int] NULL,
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
	[koulutussektori_id] [int] NULL,
	[ika_1v] [nvarchar](4) NULL,
	[ika_id] [int] NULL,
	[tutkinnot] [int] NULL,
	[aineisto_OTV_id] [int] NULL,
	[koulutuksen_jarjestaja_kunta_id] [int] NULL,
	[koulutuksen_jarjestaja_kunta_historia_id] [int] NULL,
	[oppilaitos_kunta_id] [int] NULL,
	[oppilaitos_kunta_historia_id] [int] NULL,
	[opetushallinnon_koulutus_id] [int] NULL,
	[koulutuslaji_OKM_id] [int] NULL,
	[koulutusryhma_id] [int] NULL,
	[ikaryhma1_id] [int] NULL,
	[ikaryhma2_id] [int] NULL,
	[tieteenala_avain] [nvarchar](20) NULL,
	[tieteenala_id] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_aidinkieli_versio1]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_aidinkieli_versio1]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_aidinkieli_versio1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_aineisto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_aineisto] FOREIGN KEY([aineisto_id])
REFERENCES [dbo].[d_aineisto] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_aineisto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_aineisto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_aineisto_OTV]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_aineisto_OTV] FOREIGN KEY([aineisto_OTV_id])
REFERENCES [dbo].[d_aineisto_OTV] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_aineisto_OTV]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_aineisto_OTV]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_avoinvayla]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_avoinvayla] FOREIGN KEY([avoinvayla_id])
REFERENCES [dbo].[d_avoinvayla] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_avoinvayla]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_avoinvayla]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_ensisijainen_opintooikeus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_ensisijainen_opintooikeus] FOREIGN KEY([ensisijainen_opintooikeus_id])
REFERENCES [dbo].[d_ensisijainen_opintooikeus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_ensisijainen_opintooikeus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_ensisijainen_opintooikeus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_ika]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_kansalaisuus_versio2]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_kansalaisuus_versio2] FOREIGN KEY([kansalaisuus_versio2_id])
REFERENCES [dbo].[d_kansalaisuus_versio2] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_kansalaisuus_versio2]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_kansalaisuus_versio2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_koulutuslaji_OKM]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_koulutuslaji_OKM] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_koulutuslaji_OKM]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_koulutuslaji_OKM]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_koulutusohjelma_amk]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_koulutusohjelma_amk] FOREIGN KEY([koulutusohjelma_amk_id])
REFERENCES [dbo].[d_koulutusohjelma_amk] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_koulutusohjelma_amk]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_koulutusohjelma_amk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_koulutussektori]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_koulutussektori] FOREIGN KEY([koulutussektori_id])
REFERENCES [dbo].[d_koulutussektori] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_koulutussektori]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_koulutussektori]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_koulutustyyppi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_koulutustyyppi] FOREIGN KEY([koulutustyyppi_id])
REFERENCES [dbo].[d_koulutustyyppi] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_koulutustyyppi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_koulutustyyppi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_lahde]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_lahde] FOREIGN KEY([lahde_id])
REFERENCES [dbo].[d_lahde] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_lahde]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_lahde]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_opettajankelpoisuus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_opettajankelpoisuus] FOREIGN KEY([opettajankelpoisuus_id])
REFERENCES [dbo].[d_opettajankelpoisuus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_opettajankelpoisuus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_opettajankelpoisuus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_opetushallinnon_koulutus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_opetushallinnon_koulutus] FOREIGN KEY([opetushallinnon_koulutus_id])
REFERENCES [dbo].[d_opetushallinnon_koulutus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_opetushallinnon_koulutus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_opetushallinnon_koulutus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_opiskelijan_fte_tieto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_opiskelijan_fte_tieto] FOREIGN KEY([opiskelijan_fte_tieto_id])
REFERENCES [dbo].[d_opiskelijan_fte_tieto] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_opiskelijan_fte_tieto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_opiskelijan_fte_tieto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_opiskelumuoto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_opiskelumuoto] FOREIGN KEY([opiskelumuoto_id])
REFERENCES [dbo].[d_opiskelumuoto] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_opiskelumuoto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_opiskelumuoto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_rahoituslahde]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_rahoituslahde] FOREIGN KEY([rahoituslahde_id])
REFERENCES [dbo].[d_rahoituslahde] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_rahoituslahde]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_rahoituslahde]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_sukupuoli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_sukupuoli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_sukupuoli]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_suuntautumisvaihtoehto_amk]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_suuntautumisvaihtoehto_amk] FOREIGN KEY([suuntautumisvaihtoehto_amk_id])
REFERENCES [dbo].[d_suuntautumisvaihtoehto_amk] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_suuntautumisvaihtoehto_amk]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_suuntautumisvaihtoehto_amk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_tiedekunta_yo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_tiedekunta_yo] FOREIGN KEY([tiedekunta_yo_id])
REFERENCES [dbo].[d_tiedekunta_yo] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_tiedekunta_yo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_tiedekunta_yo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_tilauskoulutuksen_sijaintimaa]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_tilauskoulutuksen_sijaintimaa] FOREIGN KEY([tilauskoulutuksen_sijaintimaa_id])
REFERENCES [dbo].[d_tilauskoulutuksen_sijaintimaa] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_tilauskoulutuksen_sijaintimaa]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_tilauskoulutuksen_sijaintimaa]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_tutkinto_amk]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_tutkinto_amk] FOREIGN KEY([tutkinto_amk_id])
REFERENCES [dbo].[d_tutkinto_amk] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_tutkinto_amk]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_tutkinto_amk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_tutkinto_yo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_tutkinto_yo] FOREIGN KEY([tutkinto_yo_id])
REFERENCES [dbo].[d_tutkinto_yo] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_tutkinto_yo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_tutkinto_yo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_uusi_vanha_opiskelija]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_uusi_vanha_opiskelija] FOREIGN KEY([uusi_vanha_opiskelija_id])
REFERENCES [dbo].[d_uusi_vanha_opiskelija] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_uusi_vanha_opiskelija]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_uusi_vanha_opiskelija]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_vahintaan_55_op_suorittanut]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_vahintaan_55_op_suorittanut] FOREIGN KEY([vahintaan_55_op_suorittanut_id])
REFERENCES [dbo].[d_vahintaan_55_op_suorittanut] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_vahintaan_55_op_suorittanut]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_vahintaan_55_op_suorittanut]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_yliopisto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_yliopisto] FOREIGN KEY([yliopisto_id])
REFERENCES [dbo].[d_yliopisto] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__d_yliopisto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_yliopisto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulokausi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kirjoihintulokausi__d_kausi] FOREIGN KEY([kirjoihintulokausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulokausi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kirjoihintulokausi__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulokausi_tutkinto__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kirjoihintulokausi_tutkinto__d_kausi] FOREIGN KEY([kirjoihintulokausi_tutkinto_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulokausi_tutkinto__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kirjoihintulokausi_tutkinto__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kirjoihintulovuosi__d_kausi] FOREIGN KEY([kirjoihintulovuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kirjoihintulovuosi__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_kirjoihintulovuosi_korkeakoulusektori__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kirjoihintulovuosi_kirjoihintulovuosi_korkeakoulusektori__d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulusektori_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_kirjoihintulovuosi_korkeakoulusektori__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kirjoihintulovuosi_kirjoihintulovuosi_korkeakoulusektori__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_korkeakoulu__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kirjoihintulovuosi_korkeakoulu__d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulu_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_korkeakoulu__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kirjoihintulovuosi_korkeakoulu__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_korkeakoulu_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kirjoihintulovuosi_korkeakoulu_lasnaoleva__d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulu_lasnaoleva_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_korkeakoulu_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kirjoihintulovuosi_korkeakoulu_lasnaoleva__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_opintoala__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kirjoihintulovuosi_opintoala__d_kausi] FOREIGN KEY([kirjoihintulovuosi_opintoala_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_opintoala__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kirjoihintulovuosi_opintoala__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_opintoala_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kirjoihintulovuosi_opintoala_lasnaoleva__d_kausi] FOREIGN KEY([kirjoihintulovuosi_opintoala_lasnaoleva_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_opintoala_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kirjoihintulovuosi_opintoala_lasnaoleva__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_sektori__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kirjoihintulovuosi_sektori__d_kausi] FOREIGN KEY([kirjoihintulovuosi_sektori_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_sektori__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kirjoihintulovuosi_sektori__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_sektori_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kirjoihintulovuosi_sektori_lasnaoleva__d_kausi] FOREIGN KEY([kirjoihintulovuosi_sektori_lasnaoleva_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_sektori_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kirjoihintulovuosi_sektori_lasnaoleva__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_tutkinto__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kirjoihintulovuosi_tutkinto__d_kausi] FOREIGN KEY([kirjoihintulovuosi_tutkinto_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihintulovuosi_tutkinto__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kirjoihintulovuosi_tutkinto__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihinvuosi_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kirjoihinvuosi_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva__d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kirjoihinvuosi_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kirjoihinvuosi_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kotikunta__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kotikunta__d_alueluokitus] FOREIGN KEY([kotikunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kotikunta__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kotikunta__d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kotikunta__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kotikunta__d_alueluokitus_historia] FOREIGN KEY([kotikunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kotikunta__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kotikunta__d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kotikunta1x__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kotikunta1x__d_alueluokitus] FOREIGN KEY([kotikunta1x_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kotikunta1x__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kotikunta1x__d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kotikunta1x__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kotikunta1x__d_alueluokitus_historia] FOREIGN KEY([kotikunta1x_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kotikunta1x__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kotikunta1x__d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kotikunta2x__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kotikunta2x__d_alueluokitus] FOREIGN KEY([kotikunta2x_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kotikunta2x__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kotikunta2x__d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kotikunta2x__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__kotikunta2x__d_alueluokitus_historia] FOREIGN KEY([kotikunta2x_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__kotikunta2x__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__kotikunta2x__d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot] FOREIGN KEY([koulutuksen_jarjestaja_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([koulutuksen_jarjestaja_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_jarjestaja_kunta__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__koulutuksen_jarjestaja_kunta__d_alueluokitus] FOREIGN KEY([koulutuksen_jarjestaja_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_jarjestaja_kunta__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__koulutuksen_jarjestaja_kunta__d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia] FOREIGN KEY([koulutuksen_jarjestaja_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_kieli__d_kieli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__koulutuksen_kieli__d_kieli] FOREIGN KEY([koulutuksen_kieli_id])
REFERENCES [dbo].[d_kieli] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_kieli__d_kieli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__koulutuksen_kieli__d_kieli]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_kunta__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__koulutuksen_kunta__d_alueluokitus] FOREIGN KEY([koulutuksen_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_kunta__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__koulutuksen_kunta__d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_kunta__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__koulutuksen_kunta__d_alueluokitus_historia] FOREIGN KEY([koulutuksen_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuksen_kunta__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__koulutuksen_kunta__d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuslaji_OKM_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__koulutuslaji_OKM_id] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutuslaji_OKM_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__koulutuslaji_OKM_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutusluokitus__d_koulutusluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__koulutusluokitus__d_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__koulutusluokitus__d_koulutusluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__koulutusluokitus__d_koulutusluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__opiskelijan_olo_syys__d_opiskelijan_olo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__opiskelijan_olo_syys__d_opiskelijan_olo] FOREIGN KEY([opiskelijan_olo_syys_id])
REFERENCES [dbo].[d_opiskelijan_olo] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__opiskelijan_olo_syys__d_opiskelijan_olo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__opiskelijan_olo_syys__d_opiskelijan_olo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__opiskelijan_olo_tamm__d_opiskelijan_olo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__opiskelijan_olo_tamm__d_opiskelijan_olo] FOREIGN KEY([opiskelijan_olo_tamm_id])
REFERENCES [dbo].[d_opiskelijan_olo_tamm] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__opiskelijan_olo_tamm__d_opiskelijan_olo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__opiskelijan_olo_tamm__d_opiskelijan_olo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__oppilaitos__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__oppilaitos__d_alueluokitus] FOREIGN KEY([oppilaitos_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__oppilaitos__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__oppilaitos__d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__oppilaitos__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__oppilaitos__d_alueluokitus_historia] FOREIGN KEY([oppilaitos_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__oppilaitos__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__oppilaitos__d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__oppilaitos__d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__oppilaitos__d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__oppilaitos__d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__oppilaitos__d_oppilaitoksen_taustatiedot]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__oppilaitos__d_oppilaitoksen_taustatiedot_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__oppilaitos__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([oppilaitos_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__oppilaitos__d_oppilaitoksen_taustatiedot_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__oppilaitos__d_oppilaitoksen_taustatiedot_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__syntymavuosi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__syntymavuosi__d_kausi] FOREIGN KEY([syntymavuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__syntymavuosi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__syntymavuosi__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__tutkintooikeusvuosi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__tutkintooikeusvuosi__d_kausi] FOREIGN KEY([tutkintooikeusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_8__tutkintooikeusvuosi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]'))
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__tutkintooikeusvuosi__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_aidinkieli_versio1]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_aidinkieli_versio1]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_aidinkieli_versio1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_aineisto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_aineisto] FOREIGN KEY([aineisto_id])
REFERENCES [dbo].[d_aineisto] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_aineisto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_aineisto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_aineisto_OTV]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_aineisto_OTV] FOREIGN KEY([aineisto_OTV_id])
REFERENCES [dbo].[d_aineisto_OTV] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_aineisto_OTV]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_aineisto_OTV]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_ika]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_kansalaisuus_versio2]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_kansalaisuus_versio2] FOREIGN KEY([kansalaisuus_versio2_id])
REFERENCES [dbo].[d_kansalaisuus_versio2] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_kansalaisuus_versio2]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_kansalaisuus_versio2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_koulutuslaji_OKM]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_koulutuslaji_OKM] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_koulutuslaji_OKM]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_koulutuslaji_OKM]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_koulutusohjelma_amk]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_koulutusohjelma_amk] FOREIGN KEY([koulutusohjelma_amk_id])
REFERENCES [dbo].[d_koulutusohjelma_amk] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_koulutusohjelma_amk]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_koulutusohjelma_amk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_koulutussektori]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_koulutussektori] FOREIGN KEY([koulutussektori_id])
REFERENCES [dbo].[d_koulutussektori] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_koulutussektori]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_koulutussektori]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_koulutustyyppi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_koulutustyyppi] FOREIGN KEY([koulutustyyppi_id])
REFERENCES [dbo].[d_koulutustyyppi] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_koulutustyyppi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_koulutustyyppi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_lahde]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_lahde] FOREIGN KEY([lahde_id])
REFERENCES [dbo].[d_lahde] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_lahde]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_lahde]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_opettajankelpoisuus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_opettajankelpoisuus] FOREIGN KEY([opettajankelpoisuus_id])
REFERENCES [dbo].[d_opettajankelpoisuus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_opettajankelpoisuus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_opettajankelpoisuus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_opetushallinnon_koulutus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_opetushallinnon_koulutus] FOREIGN KEY([opetushallinnon_koulutus_id])
REFERENCES [dbo].[d_opetushallinnon_koulutus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_opetushallinnon_koulutus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_opetushallinnon_koulutus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_opiskelumuoto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_opiskelumuoto] FOREIGN KEY([opiskelumuoto_id])
REFERENCES [dbo].[d_opiskelumuoto] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_opiskelumuoto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_opiskelumuoto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_rahoituslahde]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_rahoituslahde] FOREIGN KEY([rahoituslahde_id])
REFERENCES [dbo].[d_rahoituslahde] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_rahoituslahde]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_rahoituslahde]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_sukupuoli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_sukupuoli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_sukupuoli]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_suuntautumisvaihtoehto_amk]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_suuntautumisvaihtoehto_amk] FOREIGN KEY([suuntautumisvaihtoehto_amk_id])
REFERENCES [dbo].[d_suuntautumisvaihtoehto_amk] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_suuntautumisvaihtoehto_amk]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_suuntautumisvaihtoehto_amk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_tiedekunta_yo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_tiedekunta_yo] FOREIGN KEY([tiedekunta_yo_id])
REFERENCES [dbo].[d_tiedekunta_yo] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_tiedekunta_yo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_tiedekunta_yo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_tilauskoulutuksen_sijaintimaa]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_tilauskoulutuksen_sijaintimaa] FOREIGN KEY([tilauskoulutuksen_sijaintimaa_id])
REFERENCES [dbo].[d_tilauskoulutuksen_sijaintimaa] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_tilauskoulutuksen_sijaintimaa]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_tilauskoulutuksen_sijaintimaa]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_tutkinto_amk]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_tutkinto_amk] FOREIGN KEY([tutkinto_amk_id])
REFERENCES [dbo].[d_tutkinto_amk] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_tutkinto_amk]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_tutkinto_amk]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_tutkinto_yo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_tutkinto_yo] FOREIGN KEY([tutkinto_yo_id])
REFERENCES [dbo].[d_tutkinto_yo] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__d_tutkinto_yo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_tutkinto_yo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulokausi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kirjoihintulokausi__d_kausi] FOREIGN KEY([kirjoihintulokausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulokausi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kirjoihintulokausi__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulokausi_tutkinto__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kirjoihintulokausi_tutkinto__d_kausi] FOREIGN KEY([kirjoihintulokausi_tutkinto_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulokausi_tutkinto__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kirjoihintulokausi_tutkinto__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kirjoihintulovuosi__d_kausi] FOREIGN KEY([kirjoihintulovuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kirjoihintulovuosi__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_kirjoihintulovuosi_korkeakoulusektori__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kirjoihintulovuosi_kirjoihintulovuosi_korkeakoulusektori__d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulusektori_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_kirjoihintulovuosi_korkeakoulusektori__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kirjoihintulovuosi_kirjoihintulovuosi_korkeakoulusektori__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_korkeakoulu__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kirjoihintulovuosi_korkeakoulu__d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulu_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_korkeakoulu__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kirjoihintulovuosi_korkeakoulu__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_korkeakoulu_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kirjoihintulovuosi_korkeakoulu_lasnaoleva__d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulu_lasnaoleva_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_korkeakoulu_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kirjoihintulovuosi_korkeakoulu_lasnaoleva__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_opintoala__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kirjoihintulovuosi_opintoala__d_kausi] FOREIGN KEY([kirjoihintulovuosi_opintoala_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_opintoala__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kirjoihintulovuosi_opintoala__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_opintoala_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kirjoihintulovuosi_opintoala_lasnaoleva__d_kausi] FOREIGN KEY([kirjoihintulovuosi_opintoala_lasnaoleva_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_opintoala_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kirjoihintulovuosi_opintoala_lasnaoleva__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_sektori__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kirjoihintulovuosi_sektori__d_kausi] FOREIGN KEY([kirjoihintulovuosi_sektori_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_sektori__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kirjoihintulovuosi_sektori__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_sektori_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kirjoihintulovuosi_sektori_lasnaoleva__d_kausi] FOREIGN KEY([kirjoihintulovuosi_sektori_lasnaoleva_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_sektori_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kirjoihintulovuosi_sektori_lasnaoleva__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_tutkinto__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kirjoihintulovuosi_tutkinto__d_kausi] FOREIGN KEY([kirjoihintulovuosi_tutkinto_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihintulovuosi_tutkinto__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kirjoihintulovuosi_tutkinto__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihinvuosi_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kirjoihinvuosi_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva__d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kirjoihinvuosi_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kirjoihinvuosi_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kotikunta__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kotikunta__d_alueluokitus] FOREIGN KEY([kotikunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kotikunta__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kotikunta__d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kotikunta__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kotikunta__d_alueluokitus_historia] FOREIGN KEY([kotikunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kotikunta__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kotikunta__d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kotikunta1x__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kotikunta1x__d_alueluokitus] FOREIGN KEY([kotikunta1x_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kotikunta1x__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kotikunta1x__d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kotikunta1x__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__kotikunta1x__d_alueluokitus_historia] FOREIGN KEY([kotikunta1x_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__kotikunta1x__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__kotikunta1x__d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot] FOREIGN KEY([koulutuksen_jarjestaja_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([koulutuksen_jarjestaja_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutuksen_kieli__d_kieli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__koulutuksen_kieli__d_kieli] FOREIGN KEY([koulutuksen_kieli_id])
REFERENCES [dbo].[d_kieli] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutuksen_kieli__d_kieli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__koulutuksen_kieli__d_kieli]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutuksen_kunta__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__koulutuksen_kunta__d_alueluokitus] FOREIGN KEY([koulutuksen_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutuksen_kunta__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__koulutuksen_kunta__d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutuksen_kunta__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__koulutuksen_kunta__d_alueluokitus_historia] FOREIGN KEY([koulutuksen_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutuksen_kunta__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__koulutuksen_kunta__d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutuslaji_OKM_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__koulutuslaji_OKM_id] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutuslaji_OKM_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__koulutuslaji_OKM_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutusluokitus__d_koulutusluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__koulutusluokitus__d_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__koulutusluokitus__d_koulutusluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__koulutusluokitus__d_koulutusluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__opintoala1995__d_koulutusluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__opintoala1995__d_koulutusluokitus_historia] FOREIGN KEY([opintoala1995_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__opintoala1995__d_koulutusluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__opintoala1995__d_koulutusluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__oppilaitos__d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__oppilaitos__d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__oppilaitos__d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__oppilaitos__d_oppilaitoksen_taustatiedot]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__oppilaitos__d_oppilaitoksen_taustatiedot_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__oppilaitos__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([oppilaitos_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__oppilaitos__d_oppilaitoksen_taustatiedot_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__oppilaitos__d_oppilaitoksen_taustatiedot_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__syntymavuosi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__syntymavuosi__d_kausi] FOREIGN KEY([syntymavuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__syntymavuosi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__syntymavuosi__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__tutkinnon_suorituslukukausi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__tutkinnon_suorituslukukausi__d_kausi] FOREIGN KEY([tutkinnon_suorituslukukausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__tutkinnon_suorituslukukausi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__tutkinnon_suorituslukukausi__d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__tutkinnon_suoritusvuosi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__tutkinnon_suoritusvuosi__d_kausi] FOREIGN KEY([tutkinnon_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__2_9__tutkinnon_suoritusvuosi__d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_OTV_2_9_Korkeakoulututkinnot]'))
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__tutkinnon_suoritusvuosi__d_kausi]
GO
USE [ANTERO]