USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [sa].[sa_virta_otp_tutkinnot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alkuperainenorganisaatio] [varchar](5) NULL,
	[avoinvayla] [int] NULL,
	[ika] [smallint] NULL,
	[kk] [varchar](8) NOT NULL,
	[koulutuskieli] [varchar](2) NULL,
	[koulutuskunta] [varchar](3) NULL,
	[luokittelu] [smallint] NULL,
	[opintosuoritusavain] [varchar](100) NULL,
	[opiskelijaavain] [varchar](100) NULL,
	[opiskeluoikeusavain] [varchar](100) NULL,
	[oppilaitosnro] [varchar](6) NOT NULL,
	[rahoituslahde] [smallint] NULL,
	[siirtoopiskelija] [int] NULL,
	[sukupuoli] [smallint] NULL,
	[tkkoulutustyyppi] [int] NULL,
	[tutkinnonlaajuusop] [int] NULL,
	[tutkinnonsuoritusvuosi] [int] NOT NULL,
	[tutkinnonsuorituspvm] [date] NOT NULL,
	[tutkintokoodi] [varchar](6) NULL,
	[loadtime] [datetime2](4) NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NULL,
 CONSTRAINT [PK__sa_virta_otp_tutkinnot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [sa].[sa_virta_otp_tutkinnot] ADD  CONSTRAINT [DF__sa_virta_otp_tutkinnot__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_virta_otp_tutkinnot] ADD  CONSTRAINT [DF__sa_virta_otp_tutkinnot__username]  DEFAULT (suser_name()) FOR [username]
GO


