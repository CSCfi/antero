--
--  drop and then create table f_yo_rekrytointi_haut
--
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_yo_rekrytointihaut')
BEGIN
DROP TABLE [dw].[f_yo_rekrytointihaut]
END
GO

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_yo_rekrytointihaut')
BEGIN
CREATE TABLE [dw].[f_yo_rekrytointihaut](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[hakunumero] [int] NOT NULL,
	[d_kytkin_kutsuhaku_id] [int] NOT NULL,
	[d_kytkin_yhteisprofessuuri_id] [int] NOT NULL,
	[d_kytkin_haun_kansainvalisyys_id] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_kytkin_kansalaisuus_suomi_id] [int] NOT NULL,
	[d_rekrytointi_maanosa_id] [int] NOT NULL,
	[hakijat_lkm] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	 CONSTRAINT [PK__f_yo_rekrytointihaut] PRIMARY KEY CLUSTERED
	(
	[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

ALTER TABLE [dw].[f_yo_rekrytointihaut] ADD  CONSTRAINT [DF_f_yo_rekrytointihaut_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_yo_rekrytointihaut] ADD  CONSTRAINT [DF_f_yo_rekrytointihaut_username]  DEFAULT (suser_sname()) FOR [username]
GO
