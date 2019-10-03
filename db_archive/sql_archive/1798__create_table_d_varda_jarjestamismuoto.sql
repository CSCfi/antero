USE [ANTERO]
GO

/****** Object:  Table [sa].[d_varda_jarjestamismuoto]    Script Date: 30.7.2018 13:42:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_varda_jarjestamismuoto]') AND type in (N'U'))

BEGIN

CREATE TABLE [dw].[d_varda_jarjestamismuoto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_jarjestamismuoto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
;
ALTER TABLE [dw].[d_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__d_varda_jarjestamismuoto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
;
ALTER TABLE [dw].[d_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__d_varda_jarjestamismuoto__username]  DEFAULT (suser_name()) FOR [username]
;
END
