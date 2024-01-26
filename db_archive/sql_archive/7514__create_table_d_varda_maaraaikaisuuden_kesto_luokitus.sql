USE [ANTERO]
GO

/****** Object:  Table [dw].[d_varda_maaraaikaisuuden_kesto_luokitus]    Script Date: 30.3.2023 13:38:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if not exists (select * from sysobjects where name='d_varda_maaraaikaisuuden_kesto_luokitus' and xtype='U')

BEGIN 
CREATE TABLE [dw].[d_varda_maaraaikaisuuden_kesto_luokitus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[jarjestys] [int] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_maaraaikaisuuden_kesto_luokitus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



ALTER TABLE [dw].[d_varda_maaraaikaisuuden_kesto_luokitus] ADD  CONSTRAINT [DF__d_varda_maaraaikaisuuden_kesto_luokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]


ALTER TABLE [dw].[d_varda_maaraaikaisuuden_kesto_luokitus] ADD  CONSTRAINT [DF__d_varda_maaraaikaisuuden_kesto_luokitus__username]  DEFAULT (suser_name()) FOR [username]


END


