USE [ANTERO]
GO

ALTER TABLE [dw].[f_amk_opintopisteet] DROP CONSTRAINT [DF__f_amk_opintopisteet__username]
GO

ALTER TABLE [dw].[f_amk_opintopisteet] DROP CONSTRAINT [DF__f_amk_opintopisteet__loadtime]
GO

/****** Object:  Table [dw].[f_amk_opintopisteet]    Script Date: 21.2.2023 15:05:48 ******/
DROP TABLE [dw].[f_amk_opintopisteet]
GO

/****** Object:  Table [dw].[f_amk_opintopisteet]    Script Date: 21.2.2023 15:05:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amk_opintopisteet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[d_koulutusala_2002_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_amk_koulutustyyppi_id] [int] NOT NULL,
	[d_tilannepvm_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[kaikki_tutk_lkm] [int] NULL,
	[tki_pisteet_lkm] [int] NULL,
	[tki_harj_pisteet_lkm] [int] NULL,
	[tki_muu_pisteet_lkm] [int] NULL,
	[vierkiel_pisteet_lkm] [int] NULL,
	[ulkom_hyv_op_lkm] [int] NULL,
	[ulkom_harj_op_lkm] [int] NULL,
	[avoinamk_op_lkm] [int] NULL,
	[avoinamk_op_amk_lkm] [int] NULL,
	[avoinamk_op_yliop_lkm] [int] NULL,
	[avoinamk_op_kesa_lkm] [int] NULL,
	[avoinamk_op_kansan_lkm] [int] NULL,
	[avoinamk_op_kansal_lkm] [int] NULL,
	[avoinamk_op_muut_lkm] [int] NULL,
	[kv_vaihtoopiskelijat_op_lkm] [int] NULL,
	[kk_yhteistyo_op_lkm] [int] NULL,
	[erilopintooik_op_lkm] [int] NULL,
	[mamu_op_lkm] [int] NULL,
	[erikoul_suor_op_lkm] [int] NULL,
	[muu_kuin_kk_yhteistyo_op_lkm] [int] NULL,
	[kv_suomi_vieraana_op_lkm] [int] NULL,
	[kv_ruotsi_vieraana_op_lkm] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_amk_opintopisteet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_amk_opintopisteet] ADD  CONSTRAINT [DF__f_amk_opintopisteet__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_amk_opintopisteet] ADD  CONSTRAINT [DF__f_amk_opintopisteet__username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]