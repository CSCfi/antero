USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] DROP CONSTRAINT IF EXISTS [FK_f_aloittaneiden_lapaisy_tavoitekoulutuksen_oppilaitos_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] DROP CONSTRAINT IF EXISTS [FK_f_aloittaneiden_lapaisy_tavoitekoulutuksen_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] DROP CONSTRAINT IF EXISTS [FK_f_aloittaneiden_lapaisy_saavutettu_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] DROP CONSTRAINT IF EXISTS [FK_f_aloittaneiden_lapaisy_saavutettu_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] DROP CONSTRAINT IF EXISTS [FK_f_aloittaneiden_lapaisy_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] DROP CONSTRAINT IF EXISTS [FK_f_aloittaneiden_lapaisy_d_rahoituslahde]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] DROP CONSTRAINT IF EXISTS [FK_f_aloittaneiden_lapaisy_d_opiskelijan_olo]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] DROP CONSTRAINT IF EXISTS [FK_f_aloittaneiden_lapaisy_d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] DROP CONSTRAINT IF EXISTS [FK_f_aloittaneiden_lapaisy_d_lahde]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] DROP CONSTRAINT IF EXISTS [FK_f_aloittaneiden_lapaisy_d_koulutuslaji2_id]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] DROP CONSTRAINT IF EXISTS [FK_f_aloittaneiden_lapaisy_d_ika]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] DROP CONSTRAINT IF EXISTS [FK_f_aloittaneiden_lapaisy_d_aidinkieli_versio1]
GO

/****** Object:  Table [dbo].[f_aloittaneiden_lapaisy]    Script Date: 18.9.2021 22:43:40 ******/
DROP TABLE [dbo].[f_aloittaneiden_lapaisy]
GO

/****** Object:  Table [dbo].[f_aloittaneiden_lapaisy]    Script Date: 18.9.2021 22:43:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_aloittaneiden_lapaisy](
	[rivinumero] [int] NOT NULL,
	[tilv] [varchar](4) NULL,
	[lahde] [varchar](2) NULL,
	[lahde_id] [int] NOT NULL,
	[opp] [nvarchar](5) NULL,
	[oppilaitoksen_taustatiedot_avain] [nvarchar](10) NOT NULL,
	[oppilaitoksen_taustatiedot_id] [int] NOT NULL,
	--[oppilaitoksen_taustatiedot_historia_id] [int] NULL,
	[sp] [varchar](1) NULL,
	[sp_id] [int] NOT NULL,
	[syntv] [varchar](4) NULL,
	[ika] [int] NULL,
	[ika_id] [int] NULL,
	[aikielir1] [varchar](2) NULL,
	[aikielir1_id] [int] NOT NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[klaji] [varchar](2) NULL,
	[ophal] [varchar](1) NULL,
	[ophal_id] [int] NOT NULL,
	[jarj] [varchar](10) NULL,
	[kkun] [varchar](4) NULL,
	--[alueluokitus_historia_id] [int] NULL,
	[alueluokitus_id] [int] NULL,
	[maak] [varchar](2) NOT NULL,
	[koulk] [varchar](10) NULL,
	--[koulk_historia_id] [int] NULL,
	[koulk_id] [int] NULL,
	--[opmala] [varchar](2) NULL,
	--[opmopa] [varchar](3) NULL,
	--[opmast] [varchar](2) NULL,
	--[opm95opa] [varchar](2) NULL,
	[koulutussektori] [varchar](26) NULL,
	[pohjkoulk] [varchar](10) NULL,
	--[pohjkoulk_historia_id] [int] NULL,
	[pohjkoulk_id] [int] NULL,
	[alvv_kk] [varchar](4) NULL,
	[allk_kk] [varchar](1) NULL,
	[aloituskausikoodi_kk] [varchar](8) NULL,
	[ololk] [varchar](11) NULL,
	[ololk_id] [int] NOT NULL,
	[rahlahde] [varchar](1) NULL,
	[rahlahde_id] [int] NOT NULL,
	[koulutuslaji2] [varchar](3) NULL,
	[koulutuslaji2_id] [int] NOT NULL,
	[saavutettu_suorv] [varchar](6) NULL,
	[saavutettu_suorlk] [varchar](4) NULL,
	[saavutettu_kausikoodi] [varchar](8) NOT NULL,
	[saavutettu_tutkmaak] [varchar](5) NULL,
	--[saavutettu_alueluokitus_historia_id] [int] NULL,
	[saavutettu_alueluokitus_id] [int] NULL,
	[saavutettu_tutkjarj] [varchar](12) NULL,
	[saavutettu_tutkopp] [varchar](7) NULL,
	[saavutettu_oppilaitoksen_taustatiedot_avain] [nvarchar](10) NOT NULL,
	[saavutettu_oppilaitoksen_taustatiedot_id] [int] NOT NULL,
	--[saavutettu_oppilaitoksen_taustatiedot_historia_id] [int] NULL,
	[saavutettu_tutkkoulk] [varchar](8) NULL,
	--[saavutettu_koulk_historia_id] [int] NULL,
	[saavutettu_koulk_id] [int] NULL,
	--[saavutettu_tutkopmala] [varchar](4) NULL,
	--[saavutettu_tutkopmopa] [varchar](5) NULL,
	--[saavutettu_tutkopmast] [varchar](4) NULL,
	--[saavutettu_tutkopm95opa] [varchar](4) NULL,
	[saavutettu_tutkkoulutussektori] [varchar](50) NULL,
	[tarkastelujakso] [nvarchar](4) NOT NULL,
	[tarkastelujakso_id] [int] NOT NULL,
	[aloitus_saavutus] [nvarchar](50) NULL,
	[tarkastelujakso_tulevaisuus] [nvarchar](50) NULL,
	[tarkastelujakso_edustavuus] [nvarchar](50) NULL,
	[tietolahde] [varchar](20) NULL,
	[aineistokoodi] [varchar](5) NOT NULL,
	[aineistorivinumero] [numeric](18, 0) NULL,
	[lkm_int] [int] NULL,
	[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](100) NOT NULL,
	[1a_jarjestys] [nvarchar](5) NOT NULL,
	[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa] [nvarchar](100) NOT NULL,
	[1b_jarjestys] [nvarchar](5) NOT NULL,
	[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](100) NOT NULL,
	[1c_jarjestys] [nvarchar](5) NOT NULL,
	[1d Aloittaneista ilman tutkintoa opiskelua jatkavat koulutuslajin mukaan] [nvarchar](200) NOT NULL,
	[1d_jarjestys] [nvarchar](5) NOT NULL,
	[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](12) NOT NULL,
	[1e_jarjestys] [nvarchar](5) NOT NULL,
	[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan] [nvarchar](12) NOT NULL,
	[1f_jarjestys] [nvarchar](5) NOT NULL,
	[1g Aloittaneista alkuperäisen tutkintolajin opiskelua jatkavat koulutuslajin mukaan] [nvarchar](12) NOT NULL,
	[1g_jarjestys] [nvarchar](5) NOT NULL,
	[1h Aloittaneista muun tutkintolajin opiskelua jatkavat koulutuslajin mukaan] [nvarchar](12) NOT NULL,
	[1h_jarjestys] [nvarchar](5) NOT NULL,
	[2a Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](100) NOT NULL,
	[2a_jarjestys] [nvarchar](5) NOT NULL,
	[2b Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](100) NOT NULL,
	[2b_jarjestys] [nvarchar](5) NOT NULL,
	[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[2e_jarjestys] [nvarchar](5) NOT NULL,
	[2f Aloittaneista muun koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[2f_jarjestys] [nvarchar](5) NOT NULL,
	[2g Aloittaneista alkuperäisellä koulutusalalla (2002) opiskelua jatkavat koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[2g_jarjestys] [nvarchar](5) NOT NULL,
	[2h Aloittaneista muulla koulutusalalla (2002) opiskelua jatkavat koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[2h_jarjestys] [nvarchar](5) NOT NULL,
	[3a Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](100) NOT NULL,
	[3a_jarjestys] [nvarchar](5) NOT NULL,
	[3b Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](100) NOT NULL,
	[3b_jarjestys] [nvarchar](5) NOT NULL,
	[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](12) NOT NULL,
	[3e_jarjestys] [nvarchar](5) NOT NULL,
	[3f Aloittaneista muun opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](12) NOT NULL,
	[3f_jarjestys] [nvarchar](5) NOT NULL,
	[3g Aloittaneista alkuperäisellä opintoalalla (2002) opiskelua jatkavat opintoalan mukaan] [nvarchar](12) NOT NULL,
	[3g_jarjestys] [nvarchar](5) NOT NULL,
	[3h Aloittaneista muulla opintoalalla (2002) opiskelua jatkavat opintoalan mukaan] [nvarchar](12) NOT NULL,
	[3h_jarjestys] [nvarchar](5) NOT NULL,
	[4a Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto missä tahansa] [nvarchar](100) NOT NULL,
	[4a_jarjestys] [nvarchar](5) NOT NULL,
	[4b Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](100) NOT NULL,
	[4b_jarjestys] [nvarchar](5) NOT NULL,
	[4e Aloittaneista alkuperäisen koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan] [nvarchar](12) NOT NULL,
	[4e_jarjestys] [nvarchar](5) NOT NULL,
	[4f Aloittaneista muun koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan] [nvarchar](12) NOT NULL,
	[4f_jarjestys] [nvarchar](5) NOT NULL,
	[4g Aloittaneista alkuperäisellä järjestäjällä opiskelua jatkavat järjestäjän mukaan] [nvarchar](12) NOT NULL,
	[4g_jarjestys] [nvarchar](5) NOT NULL,
	[4h Aloittaneista muulla järjestäjällä opiskelua jatkavat järjestäjän mukaan] [nvarchar](12) NOT NULL,
	[4h_jarjestys] [nvarchar](5) NOT NULL,
	[5a Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto missä tahansa] [nvarchar](100) NOT NULL,
	[5a_jarjestys] [nvarchar](5) NOT NULL,
	[5b Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä] [nvarchar](100) NOT NULL,
	[5b_jarjestys] [nvarchar](5) NOT NULL,
	[5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] [nvarchar](12) NOT NULL,
	[5e_jarjestys] [nvarchar](5) NOT NULL,
	[5f Aloittaneista muussa oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] [nvarchar](12) NOT NULL,
	[5f_jarjestys] [nvarchar](5) NOT NULL,
	[5g Aloittaneista alkuperäisessä oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan] [nvarchar](12) NOT NULL,
	[5g_jarjestys] [nvarchar](5) NOT NULL,
	[5h Aloittaneista muussa oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan] [nvarchar](12) NOT NULL,
	[5h_jarjestys] [nvarchar](5) NOT NULL,
	[6a Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto missä tahansa] [nvarchar](100) NOT NULL,
	[6a_jarjestys] [nvarchar](5) NOT NULL,
	[6b Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä] [nvarchar](100) NOT NULL,
	[6b_jarjestys] [nvarchar](5) NOT NULL,
	[6e Aloittaneista alkuperäisessä maakunnassa tutkinnon suorittaneet maakunnan mukaan] [nvarchar](12) NOT NULL,
	[6e_jarjestys] [nvarchar](5) NOT NULL,
	[6f Aloittaneista muussa maakunnassa tutkinnon suorittaneet maakunnan mukaan] [nvarchar](12) NOT NULL,
	[6f_jarjestys] [nvarchar](5) NOT NULL,
	[6g Aloittaneista alkuperäisessä maakunnassa opiskelua jatkavat maakunnan mukaan] [nvarchar](12) NOT NULL,
	[6g_jarjestys] [nvarchar](5) NOT NULL,
	[6h Aloittaneista muussa maakunnassa opiskelua jatkavat maakunnan mukaan] [nvarchar](12) NOT NULL,
	[6h_jarjestys] [nvarchar](5) NOT NULL,
	[7a Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto missä tahansa] [nvarchar](100) NOT NULL,
	[7a_jarjestys] [nvarchar](5) NOT NULL,
	[7b Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](100) NOT NULL,
	[7b_jarjestys] [nvarchar](5) NOT NULL,
	[7e Aloittaneista alkuperäisen koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan] [nvarchar](12) NOT NULL,
	[7e_jarjestys] [nvarchar](5) NOT NULL,
	[7f Aloittaneista muun koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan] [nvarchar](12) NOT NULL,
	[7f_jarjestys] [nvarchar](5) NOT NULL,
	[7g Aloittaneista alkuperäisellä koulutussektorilla opiskelua jatkavat koulutussektorin mukaan] [nvarchar](12) NOT NULL,
	[7g_jarjestys] [nvarchar](5) NOT NULL,
	[7h Aloittaneista muulla koulutussektorilla opiskelua jatkavat koulutussektorin mukaan] [nvarchar](12) NOT NULL,
	[7h_jarjestys] [nvarchar](5) NOT NULL,
	[8a Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](100) NOT NULL,
	[8a_jarjestys] [nvarchar](5) NOT NULL,
	[8b Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](100) NOT NULL,
	[8b_jarjestys] [nvarchar](5) NOT NULL,
	[8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](12) NOT NULL,
	[8e_jarjestys] [nvarchar](5) NOT NULL,
	[8f Aloittaneista muun opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan] [nvarchar](12) NOT NULL,
	[8f_jarjestys] [nvarchar](5) NOT NULL,
	[8g Aloittaneista alkuperäisellä opintoalalla (1995) opiskelua jatkavat opintoalan mukaan] [nvarchar](12) NOT NULL,
	[8g_jarjestys] [nvarchar](5) NOT NULL,
	[8h Aloittaneista muulla opintoalalla (1995) opiskelua jatkavat opintoalan mukaan] [nvarchar](12) NOT NULL,
	[8h_jarjestys] [nvarchar](5) NOT NULL,
	[9a Aloittaneiden opintojen kulku koulutusalan, taso 1 mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](100) NOT NULL,
	[9a_jarjestys] [nvarchar](5) NOT NULL,
	[9b Aloittaneiden opintojen kulku koulutusalan, taso 1 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](100) NOT NULL,
	[9b_jarjestys] [nvarchar](5) NOT NULL,
	[9e Aloittaneista alkuperäisen koulutusalan, taso 1 tutkinnon suorittaneet koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[9e_jarjestys] [nvarchar](5) NOT NULL,
	[9f Aloittaneista muun koulutusalan, taso 1 tutkinnon suorittaneet koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[9f_jarjestys] [nvarchar](5) NOT NULL,
	[9g Aloittaneista alkuperäisellä koulutusalalla, taso 1 opiskelua jatkavat koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[9g_jarjestys] [nvarchar](5) NOT NULL,
	[9h Aloittaneista muulla koulutusalalla, taso 1 opiskelua jatkavat koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[9h_jarjestys] [nvarchar](5) NOT NULL,
	[10a Aloittaneiden opintojen kulku koulutusalan, taso 2 mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](100) NOT NULL,
	[10a_jarjestys] [nvarchar](5) NOT NULL,
	[10b Aloittaneiden opintojen kulku koulutusalan, taso 2 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](100) NOT NULL,
	[10b_jarjestys] [nvarchar](5) NOT NULL,
	[10e Aloittaneista alkuperäisen koulutusalan, taso 2 tutkinnon suorittaneet koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[10e_jarjestys] [nvarchar](5) NOT NULL,
	[10f Aloittaneista muun koulutusalan, taso 2 tutkinnon suorittaneet koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[10f_jarjestys] [nvarchar](5) NOT NULL,
	[10g Aloittaneista alkuperäisellä koulutusalalla, taso 2 opiskelua jatkavat koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[10g_jarjestys] [nvarchar](5) NOT NULL,
	[10h Aloittaneista muulla koulutusalalla, taso 2 opiskelua jatkavat koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[10h_jarjestys] [nvarchar](5) NOT NULL,
	[11a Aloittaneiden opintojen kulku koulutusalan, taso 3 mukaan prioriteettina mikä tahansa tutkinto] [nvarchar](100) NOT NULL,
	[11a_jarjestys] [nvarchar](5) NOT NULL,
	[11b Aloittaneiden opintojen kulku koulutusalan, taso 3 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] [nvarchar](100) NOT NULL,
	[11b_jarjestys] [nvarchar](5) NOT NULL,
	[11e Aloittaneista alkuperäisen koulutusalan, taso 3 tutkinnon suorittaneet koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[11e_jarjestys] [nvarchar](5) NOT NULL,
	[11f Aloittaneista muun koulutusalan, taso 3 tutkinnon suorittaneet koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[11f_jarjestys] [nvarchar](5) NOT NULL,
	[11g Aloittaneista alkuperäisellä koulutusalalla, taso 3 opiskelua jatkavat koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[11g_jarjestys] [nvarchar](5) NOT NULL,
	[11h Aloittaneista muulla koulutusalalla, taso 3 opiskelua jatkavat koulutusalan mukaan] [nvarchar](12) NOT NULL,
	[11h_jarjestys] [nvarchar](5) NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy]  WITH CHECK ADD  CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_aidinkieli_versio1] FOREIGN KEY([aikielir1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] CHECK CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy]  WITH CHECK ADD  CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] CHECK CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_ika]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy]  WITH CHECK ADD  CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_koulutuslaji2_id] FOREIGN KEY([koulutuslaji2_id])
REFERENCES [dbo].[d_koulutuslaji2] ([id])
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] CHECK CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_koulutuslaji2_id]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy]  WITH CHECK ADD  CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_lahde] FOREIGN KEY([lahde_id])
REFERENCES [dbo].[d_lahde] ([id])
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] CHECK CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_lahde]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy]  WITH CHECK ADD  CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_opetushallinnon_koulutus] FOREIGN KEY([ophal_id])
REFERENCES [dbo].[d_opetushallinnon_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] CHECK CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy]  WITH CHECK ADD  CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_opiskelijan_olo] FOREIGN KEY([ololk_id])
REFERENCES [dbo].[d_opiskelijan_olo] ([id])
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] CHECK CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_opiskelijan_olo]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy]  WITH CHECK ADD  CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_rahoituslahde] FOREIGN KEY([rahlahde_id])
REFERENCES [dbo].[d_rahoituslahde] ([id])
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] CHECK CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_rahoituslahde]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy]  WITH CHECK ADD  CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_sukupuoli] FOREIGN KEY([sp_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] CHECK CONSTRAINT [FK_f_aloittaneiden_lapaisy_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy]  WITH CHECK ADD  CONSTRAINT [FK_f_aloittaneiden_lapaisy_saavutettu_d_alueluokitus] FOREIGN KEY([saavutettu_alueluokitus_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] CHECK CONSTRAINT [FK_f_aloittaneiden_lapaisy_saavutettu_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy]  WITH CHECK ADD  CONSTRAINT [FK_f_aloittaneiden_lapaisy_saavutettu_d_oppilaitoksen_taustatiedot] FOREIGN KEY([saavutettu_oppilaitoksen_taustatiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] CHECK CONSTRAINT [FK_f_aloittaneiden_lapaisy_saavutettu_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy]  WITH CHECK ADD  CONSTRAINT [FK_f_aloittaneiden_lapaisy_tavoitekoulutuksen_d_alueluokitus] FOREIGN KEY([alueluokitus_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] CHECK CONSTRAINT [FK_f_aloittaneiden_lapaisy_tavoitekoulutuksen_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy]  WITH CHECK ADD  CONSTRAINT [FK_f_aloittaneiden_lapaisy_tavoitekoulutuksen_oppilaitos_d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppilaitoksen_taustatiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_aloittaneiden_lapaisy] CHECK CONSTRAINT [FK_f_aloittaneiden_lapaisy_tavoitekoulutuksen_oppilaitos_d_oppilaitoksen_taustatiedot]
GO


