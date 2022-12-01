USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_otp_erikoistumiskoulutukset_2021]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_virta_otp_erikoistumiskoulutukset_2021](
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

END

GO

USE [ANTERO]