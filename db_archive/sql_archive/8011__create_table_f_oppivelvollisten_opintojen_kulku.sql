USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_oppivelvollisten_opintojen_kulku]    Script Date: 6.9.2023 10:42:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_oppivelvollisten_opintojen_kulku]') AND type in (N'U'))

BEGIN

CREATE TABLE [dw].[f_koski_oppivelvollisten_opintojen_kulku](
	[oppija_oid] [varchar](50) NULL,
	[alku] [date] NULL,
	[loppu] [date] NULL,
	[opiskeluoikeus_alkuperainen] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[tilanne] [int] NOT NULL,
	[tilanne_prio] [int] NULL,
	[aika_vuosina] [float] NULL,
	[suorituksen_tyyppi_alkuperainen] [varchar](250) NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[koulutusmuoto_alkuperainen] [varchar](250) NULL,
	[koulutusmuoto] [varchar](250) NULL,
	[aloitettu_koulutus] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_kytkin_suorittanut_perusopetuksen_id] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
) ON [PRIMARY]

ALTER TABLE [dw].[f_koski_oppivelvollisten_opintojen_kulku] ADD  CONSTRAINT [DF__f_koski_oppivelvollisten_opintojen_kulku__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[f_koski_oppivelvollisten_opintojen_kulku] ADD  CONSTRAINT [DF__f_koski_oppivelvollisten_opintojen_kulku__username__531856C7]  DEFAULT (suser_sname()) FOR [username]

END 

GO

USE [ANTERO]