USE [ANTERO]
GO

/****** Object:  Table [dw].[d_yritysmuoto]    Script Date: 1.3.2022 16.39.26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (select * from sysobjects where name = 'd_yritysmuoto' and xtype='U')

BEGIN;

CREATE TABLE [dw].[d_yritysmuoto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](400) NULL,
	[nimi_sv] [nvarchar](400) NULL,
	[nimi_en] [nvarchar](400) NULL,
	[kuvaus_fi] [nvarchar](400) NULL,
	[kuvaus_sv] [nvarchar](400) NULL,
	[kuvaus_en] [nvarchar](400) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_yritysmuoto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dw].[d_yritysmuoto] ADD  CONSTRAINT [DF__d_yritysmuoto__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_yritysmuoto] ADD  CONSTRAINT [DF__d_yritysmuoto__username]  DEFAULT (suser_name()) FOR [username]
END;

