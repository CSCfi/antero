
USE [ANTERO]
GO

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='dw'
	AND TABLE_NAME='sa_korkeakoulu_koodi_historia')

BEGIN

CREATE TABLE [dw].[sa_korkeakoulu_koodi_historia](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[korkeakoulun_koodi] [varchar](5) NOT NULL,
	[korkeakoulun_nykyinen_tunnus] [varchar](5) NOT NULL,
	[nimi_fi] [varchar](100) NOT NULL,
  [vanha_nimi] [varchar](100) NOT NULL,
	[alkupvm] datetime,
	[loppupvm] datetime,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_sa_korkeakoulu_koodi_historia] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [dw].[sa_korkeakoulu_koodi_historia] ADD  CONSTRAINT [DF__sa_korkeakoulu_koodi_historia__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[sa_korkeakoulu_koodi_historia] ADD  CONSTRAINT [DF__sa_korkeakoulu_koodi_historia__username]  DEFAULT (suser_sname()) FOR [username]
GO
