USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_virta_otp_erikoistumiskoulutukset_2023]    Script Date: 28.11.2024 10:20:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_otp_erikoistumiskoulutukset_2023]') AND type in (N'U'))
DROP TABLE [sa].[sa_virta_otp_erikoistumiskoulutukset_2023]
GO

/****** Object:  Table [sa].[sa_virta_otp_erikoistumiskoulutukset_2023]    Script Date: 28.11.2024 10:20:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [sa].[sa_virta_otp_erikoistumiskoulutukset_2023](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[erikoistumiskoulutuskoodi] [nvarchar](20) NULL,
	[ika] [smallint] NULL,
	[ohjauksenalakoodi] [nvarchar](20) NULL,
	[opiskeluoikeudenalkamispaivamaara] [bigint] NULL,
	[oppilaitoskoodi] [nvarchar](8) NULL,
	[sukupuolikoodi] [nvarchar](5) NOT NULL,
	[tutkinnonsuorituspvm] [bigint] NULL,
	[tutkinnonsuoropkoodi] [nvarchar](8) NULL,
	[tutkinnontasokoodi] [smallint] NULL,
	[ylinuusintutkintokoodi] [nvarchar](6) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO


