USE [ANTERO]
GO

DROP TABLE [sa].[sa_virta_otp_cimolyhytlahteva]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [sa].[sa_virta_otp_cimolyhytlahteva](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[hetu] [varchar](11) NULL,
	[jaksoAlkupvm] [bigint] NULL,
	[jaksoLoppupvm] [bigint] NULL,
	[kesto] [varchar](4) NULL,
	[koultyp] [varchar](2) NULL,
	[koulutusala] [varchar](2) NULL,
	[koulutuskoodi] [varchar](6) NULL,
	[liikkuvuusjaksoId] [int] NULL,
	[liikkuvuusjaksoavain] [nvarchar](100) NULL,
	[luoja] [nvarchar](255) NULL,
	[luontipaivamaara] [bigint] NULL,
	[opintoaste] [varchar](2) NULL,
	[opiskelijaId] [int] NULL,
	[opiskelijaavain] [nvarchar](100) NULL,
	[opiskeluoikeusId] [int] NULL,
	[opiskeluoikeusavain] [nvarchar](100) NULL,
	[oppilaitos] [varchar](5) NULL,
	[sp] [varchar](2) NULL,
	[tyyppi] [varchar](2) NULL,
	[kohdemaa] [varchar](3) NULL,
	[xika] [smallint] NULL,
	[xxaloitusvuosi] [int] NULL,
	[loadtime] [datetime2](4) NOT NULL CONSTRAINT [DF__sa_virta_otp_cimolyhytlahteva__loadtime]  DEFAULT (getdate()),
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL CONSTRAINT [DF__sa_virta_otp_cimolyhytlahteva__username]  DEFAULT (suser_name()),
 CONSTRAINT [PK__sa_virta_otp_cimolyhytlahteva] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [ANTERO]
GO


DROP TABLE [sa].[sa_virta_otp_cimolyhytsaapuva]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [sa].[sa_virta_otp_cimolyhytsaapuva](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[hetu] [varchar](11) NULL,
	[jaksoAlkupvm] [bigint] NULL,
	[jaksoLoppupvm] [bigint] NULL,
	[kesto] [varchar](4) NULL,
	[koultyp] [varchar](2) NULL,
	[koulutusala] [varchar](2) NULL,
	[koulutuskoodi] [varchar](6) NULL,
	[liikkuvuusjaksoId] [int] NULL,
	[liikkuvuusjaksoavain] [nvarchar](100) NULL,
	[luoja] [nvarchar](255) NULL,
	[luontipaivamaara] [bigint] NULL,
	[opintoaste] [varchar](2) NULL,
	[opiskelijaId] [int] NULL,
	[opiskelijaavain] [nvarchar](100) NULL,
	[opiskeluoikeusId] [int] NULL,
	[opiskeluoikeusavain] [nvarchar](100) NULL,
	[oppilaitos] [varchar](5) NULL,
	[sp] [varchar](2) NULL,
	[tyyppi] [varchar](2) NULL,
	[lahtomaa] [varchar](3) NULL,
	[xika] [smallint] NULL,
	[xxaloitusvuosi] [int] NULL,
	[loadtime] [datetime2](4) NOT NULL CONSTRAINT [DF__sa_virta_otp_cimolyhytsaapuva__loadtime]  DEFAULT (getdate()),
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL CONSTRAINT [DF__sa_virta_otp_cimolyhytsaapuva__username]  DEFAULT (suser_name()),
 CONSTRAINT [PK__sa_virta_otp_cimolyhytsaapuva] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [ANTERO]
GO


DROP TABLE [sa].[sa_virta_otp_cimopitkalahteva]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [sa].[sa_virta_otp_cimopitkalahteva](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[hetu] [varchar](11) NULL,
	[jaksoAlkupvm] [bigint] NULL,
	[jaksoLoppupvm] [bigint] NULL,
	[kesto] [varchar](4) NULL,
	[koultyp] [varchar](2) NULL,
	[koulutusala] [varchar](2) NULL,
	[koulutuskoodi] [varchar](6) NULL,
	[liikkuvuusjaksoId] [int] NULL,
	[liikkuvuusjaksoavain] [nvarchar](100) NULL,
	[luoja] [nvarchar](255) NULL,
	[luontipaivamaara] [bigint] NULL,
	[opintoaste] [varchar](2) NULL,
	[opiskelijaId] [int] NULL,
	[opiskelijaavain] [nvarchar](100) NULL,
	[opiskeluoikeusId] [int] NULL,
	[opiskeluoikeusavain] [nvarchar](100) NULL,
	[oppilaitos] [varchar](5) NULL,
	[sp] [varchar](2) NULL,
	[tyyppi] [varchar](2) NULL,
	[kohdemaa] [varchar](3) NULL,
	[liikkuvuusohjelma] [varchar](3) NULL,
	[xika] [smallint] NULL,
	[xxaloitusvuosi] [int] NULL,
	[loadtime] [datetime2](4) NOT NULL CONSTRAINT [DF__sa_virta_otp_cimopitkalahteva__loadtime]  DEFAULT (getdate()),
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL CONSTRAINT [DF__sa_virta_otp_cimopitkalahteva__username]  DEFAULT (suser_name()),
 CONSTRAINT [PK__sa_virta_otp_cimopitkalahteva] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


USE [ANTERO]
GO


DROP TABLE [sa].[sa_virta_otp_cimopitkasaapuva]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [sa].[sa_virta_otp_cimopitkasaapuva](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[hetu] [varchar](11) NULL,
	[jaksoAlkupvm] [bigint] NULL,
	[jaksoLoppupvm] [bigint] NULL,
	[kesto] [varchar](4) NULL,
	[koultyp] [varchar](2) NULL,
	[koulutusala] [varchar](2) NULL,
	[koulutuskoodi] [varchar](6) NULL,
	[liikkuvuusjaksoId] [int] NULL,
	[liikkuvuusjaksoavain] [nvarchar](100) NULL,
	[luoja] [nvarchar](255) NULL,
	[luontipaivamaara] [bigint] NULL,
	[opintoaste] [varchar](2) NULL,
	[opiskelijaId] [int] NULL,
	[opiskelijaavain] [nvarchar](100) NULL,
	[opiskeluoikeusId] [int] NULL,
	[opiskeluoikeusavain] [nvarchar](100) NULL,
	[oppilaitos] [varchar](5) NULL,
	[sp] [varchar](2) NULL,
	[tyyppi] [varchar](2) NULL,
	[lahtomaa] [varchar](3) NULL,
	[kansalaisuus] [varchar](3) NULL,
	[liikkuvuusohjelma] [varchar](3) NULL,
	[xika] [smallint] NULL,
	[xxaloitusvuosi] [int] NULL,
	[loadtime] [datetime2](4) NOT NULL CONSTRAINT [DF__sa_virta_otp_cimopitkasaapuva__loadtime]  DEFAULT (getdate()),
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL CONSTRAINT [DF__sa_virta_otp_cimopitkasaapuva__username]  DEFAULT (suser_name()),
 CONSTRAINT [PK__sa_virta_otp_cimopitkasaapuva] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO




