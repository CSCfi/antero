USE [ANTERO]
GO

/****** Object:  Table [dw].[d_varda_henkilostoryhma]    Script Date: 30.3.2023 13:52:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if not exists (select * from sysobjects where name='d_varda_henkilostoryhma' and xtype='U')

BEGIN
CREATE TABLE [dw].[d_varda_henkilostoryhma](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](200) NOT NULL,
	[selite_fi] [varchar](200) NOT NULL,
	[selite_sv] [varchar](200) NOT NULL,
	[selite_en] [varchar](200) NOT NULL,
	[jarjestys] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_varda_henkilostoryhma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



ALTER TABLE [dw].[d_varda_henkilostoryhma] ADD  CONSTRAINT [DF__d_varda_henkilostoryhma__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]


ALTER TABLE [dw].[d_varda_henkilostoryhma] ADD  CONSTRAINT [DF__d_varda_henkilostoryhma__username__531856C7]  DEFAULT (suser_sname()) FOR [username]

END


