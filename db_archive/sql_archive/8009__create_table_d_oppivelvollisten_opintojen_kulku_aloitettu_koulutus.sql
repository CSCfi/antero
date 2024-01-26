USE [ANTERO]
GO

/****** Object:  Table [dw].[d_oppivelvollisen_toiminta]    Script Date: 6.9.2023 10:27:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus]') AND type in (N'U'))

BEGIN

CREATE TABLE [dw].[d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](200) NOT NULL,
	[selite_fi] [varchar](200) NOT NULL,
	[selite_sv] [varchar](200) NULL,
	[selite_en] [varchar](200) NULL,
	[jarjestys] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dw].[d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus] ADD  CONSTRAINT [DF__d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus] ADD  CONSTRAINT [DF__d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus__username__531856C7]  DEFAULT (suser_sname()) FOR [username]

END

USE [ANTERO]