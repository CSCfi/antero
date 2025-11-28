USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_virta_otp_erikoistumiskoulutukset_2024]    Script Date: 28.11.2025 10.12.21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'sa.sa_virta_otp_erikoistumiskoulutukset_2024')
      AND type = 'U'
)

BEGIN
    CREATE TABLE [sa].[sa_virta_otp_erikoistumiskoulutukset_2024](
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
