--
--  create table f_yo_rekrytointihaut
--

USE [ANTERO]
GO

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='dw'
	AND TABLE_NAME='f_yo_rekrytointihaut')

BEGIN
CREATE TABLE [dw].[f_yo_rekrytointihaut](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NULL,
	[vuosi] [int] NULL,
	[hakunumero] [int] NULL,
	[d_kutsuhaku_id] [int] NULL,
	[d_yhteisprofessuuri_id] [int] NULL,
	[d_haun_kansainvalisyys_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kansalaisuus_suomi_id] [int] NULL,
	[d_hakijan_maanosa_koodi] [int] NULL,
	[d_hakijan_maanosa2_koodi] [nvarchar](5) NULL,
	[hakijat_lkm] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](30) NULL
)
END
