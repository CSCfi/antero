USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]    Script Date: 6.10.2025 10.57.42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]') AND type in (N'U'))
  DROP TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]
GO

CREATE TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto](
	[tilv] [varchar](4) NULL,
	[jarj] [varchar](20) NULL,
	[oppilaitoksen_taustatiedot_id] [int] NOT NULL,
	[alueluokitus_id] [int] NOT NULL,
	[oppilaitoksen_taustatiedot_historia_id] [int] NULL,
	[alueluokitus_historia_id] [int] NULL,
	[tiedonantajatyyppi_id] [int] NOT NULL,
	[opetuskieli_id] [int] NOT NULL,
	[popy] [varchar](5) NULL,
	[popyn] [varchar](5) NULL,
	[jmamu] [varchar](5) NULL,
	[psisa] [varchar](5) NULL,
	[jmamusisa] [varchar](5) NULL,
	[pteho] [varchar](5) NULL,
	[pertu] [varchar](5) NULL,
	[pertuv] [varchar](5) NULL,
	[pertum] [varchar](5) NULL,
	[ptehoerop] [varchar](5) NULL,
	[pviertu] [varchar](5) NULL,
	[pviertuv] [varchar](5) NULL,
	[pviertum] [varchar](5) NULL,
	[pvimuut] [varchar](5) NULL,
	[pviop] [varchar](5) NULL,
	[pkuertu] [varchar](5) NULL,
	[pkuertuv] [varchar](5) NULL,
	[pkuertum] [varchar](5) NULL,
	[pkumuut] [varchar](5) NULL,
	[pkuop] [varchar](5) NULL,
	[ppid5v] [varchar](5) NULL,
	[pmuu5v] [varchar](5) NULL,
	[pop5v] [varchar](5) NULL,
	[apip1] [varchar](5) NULL,
	[apip2] [varchar](5) NULL,
	[apip39] [varchar](5) NULL,
	[apipy] [varchar](5) NULL,
	[oma3s] [varchar](8) NULL,
	[osto3s] [varchar](8) NULL,
	[avust3s] [varchar](8) NULL,
	[syk3s] [varchar](8) NULL,
	[oma4s] [varchar](8) NULL,
	[osto4s] [varchar](8) NULL,
	[avust4s] [varchar](8) NULL,
	[syk4s] [varchar](8) NULL,
	[omams] [varchar](8) NULL,
	[ostoms] [varchar](8) NULL,
	[avustms] [varchar](8) NULL,
	[sykms] [varchar](8) NULL,
	[omays] [varchar](8) NULL,
	[ostoys] [varchar](8) NULL,
	[avustys] [varchar](8) NULL,
	[sykys] [varchar](8) NULL,
	[oma3k] [varchar](8) NULL,
	[osto3k] [varchar](8) NULL,
	[avust3k] [varchar](8) NULL,
	[kev3k] [varchar](8) NULL,
	[oma4k] [varchar](8) NULL,
	[osto4k] [varchar](8) NULL,
	[avust4k] [varchar](8) NULL,
	[kev4k] [varchar](8) NULL,
	[omamk] [varchar](8) NULL,
	[ostomk] [varchar](8) NULL,
	[avustmk] [varchar](8) NULL,
	[kevmk] [varchar](8) NULL,
	[omayk] [varchar](8) NULL,
	[ostoyk] [varchar](8) NULL,
	[avustyk] [varchar](8) NULL,
	[kevyk] [varchar](8) NULL,
	[pesis_kylla_ei_id] [int] NOT NULL,
	[pesis_alueluokitus_id] [int] NOT NULL,
	[kesis_kylla_ei_id] [int] NOT NULL,
	[kesis_alueluokitus_id] [int] NOT NULL,
	[perops_kylla_ei_id] [int] NOT NULL,
	[perops_alueluokitus_id] [int] NOT NULL,
	[apips_kylla_ei_id] [int] NOT NULL,
	[apips_alueluokitus_id] [int] NOT NULL,
	[luontipvm] [date] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]  WITH CHECK ADD  CONSTRAINT [FK_apips_d_alueluokitus] FOREIGN KEY([apips_alueluokitus_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] CHECK CONSTRAINT [FK_apips_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]  WITH CHECK ADD  CONSTRAINT [FK_d_alueluokitus] FOREIGN KEY([alueluokitus_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] CHECK CONSTRAINT [FK_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]  WITH CHECK ADD  CONSTRAINT [FK_d_alueluokitus_historia] FOREIGN KEY([alueluokitus_historia_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] CHECK CONSTRAINT [FK_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]  WITH CHECK ADD  CONSTRAINT [FK_d_opetuksen_jarjestajan_tiedoantajatyyppi] FOREIGN KEY([tiedonantajatyyppi_id])
REFERENCES [dbo].[d_opetuksen_jarjestajan_tiedoantajatyyppi] ([id])
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] CHECK CONSTRAINT [FK_d_opetuksen_jarjestajan_tiedoantajatyyppi]
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]  WITH CHECK ADD  CONSTRAINT [FK_d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppilaitoksen_taustatiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] CHECK CONSTRAINT [FK_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]  WITH CHECK ADD  CONSTRAINT [FK_d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([oppilaitoksen_taustatiedot_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] CHECK CONSTRAINT [FK_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]  WITH CHECK ADD  CONSTRAINT [FK_kesis_d_alueluokitus] FOREIGN KEY([kesis_alueluokitus_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] CHECK CONSTRAINT [FK_kesis_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]  WITH CHECK ADD  CONSTRAINT [FK_opetuskieli_d_opetuskieli] FOREIGN KEY([opetuskieli_id])
REFERENCES [dbo].[d_opetuskieli] ([id])
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] CHECK CONSTRAINT [FK_opetuskieli_d_opetuskieli]
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]  WITH CHECK ADD  CONSTRAINT [FK_perops_d_alueluokitus] FOREIGN KEY([perops_alueluokitus_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] CHECK CONSTRAINT [FK_perops_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]  WITH CHECK ADD  CONSTRAINT [FK_pesis_d_alueluokitus] FOREIGN KEY([pesis_alueluokitus_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] CHECK CONSTRAINT [FK_pesis_d_alueluokitus]
GO


