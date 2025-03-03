USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus] DROP CONSTRAINT [FK_f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus_d_sektoritutkimuslaitos]
GO

ALTER TABLE [dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus] DROP CONSTRAINT [FK_f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus_d_rahoituslahde]
GO

/****** Object:  Table [dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus]    Script Date: 26.3.2020 9:52:27 ******/
DROP TABLE [dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus]
GO

/****** Object:  Table [dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus]    Script Date: 26.3.2020 9:52:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sektoritutkimuslaitos_avain] [varchar](5) NOT NULL,
	[sektoritutkimuslaitos_id] [int] NOT NULL,
	[rahoituslahde_avain] [varchar](20) NOT NULL,
	[rahoituslahde_id] [int] NOT NULL,
	[tutkimusrahoitus] [decimal](10, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus]  WITH CHECK ADD  CONSTRAINT [FK_f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus_d_rahoituslahde] FOREIGN KEY([rahoituslahde_id])
REFERENCES [dbo].[d_tutkimuksen_rahoituslahde] ([id])
GO

ALTER TABLE [dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus] CHECK CONSTRAINT [FK_f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus_d_rahoituslahde]
GO

ALTER TABLE [dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus]  WITH CHECK ADD  CONSTRAINT [FK_f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus_d_sektoritutkimuslaitos] FOREIGN KEY([sektoritutkimuslaitos_id])
REFERENCES [dbo].[d_sektoritutkimuslaitos] ([id])
GO

ALTER TABLE [dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus] CHECK CONSTRAINT [FK_f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus_d_sektoritutkimuslaitos]
GO


USE [ANTERO]