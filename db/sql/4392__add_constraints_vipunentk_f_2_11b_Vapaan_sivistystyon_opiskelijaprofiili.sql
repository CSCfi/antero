USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili] DROP CONSTRAINT IF EXISTS [FK__2_11b__tunn__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili] DROP CONSTRAINT IF EXISTS [FK__2_11b__jarj__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili]  WITH CHECK ADD  CONSTRAINT [FK__2_11b__jarj__d_oppilaitoksen_taustatiedot] FOREIGN KEY([jarj_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili] CHECK CONSTRAINT [FK__2_11b__jarj__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili]  WITH CHECK ADD  CONSTRAINT [FK__2_11b__tunn__d_oppilaitoksen_taustatiedot] FOREIGN KEY([tunn_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili] CHECK CONSTRAINT [FK__2_11b__tunn__d_oppilaitoksen_taustatiedot]
GO

use antero