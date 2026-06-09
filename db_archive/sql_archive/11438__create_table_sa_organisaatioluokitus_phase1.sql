USE [ANTERO]
GO



/****** Object:  Table [sa].[sa_organisaatioluokitus_phase1]    Script Date: 4.12.2025 11.53.52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_organisaatioluokitus_phase1](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[oid] [varchar](200) NULL,
	[koodi] [varchar](30) NULL,
	[nimi] [nvarchar](500) NULL,
	[nimi_sv] [nvarchar](500) NULL,
	[nimi_en] [nvarchar](500) NULL,
	[alkupvm] [varchar](20) NULL,
	[loppupvm] [varchar](20) NULL,
	[tyyppi] [varchar](30) NULL,
	[parentoid] [varchar](200) NULL,
	[liitosoid] [varchar](200) NULL,
	[kotikunta] [varchar](5) NULL,
	[oppilaitoksenopetuskieli] [varchar](5) NULL,
	[oppilaitostyyppi] [varchar](5) NULL,
	[osoitetyyppi] [varchar](20) NULL,
	[osoite] [nvarchar](1000) NULL,
	[postinumero] [varchar](5) NULL,
	[postitoimipaikka] [nvarchar](200) NULL,
	[latitude] [varchar](30) NULL,
	[longitude] [varchar](30) NULL,
 CONSTRAINT [PK__sa_organisaatioluokitus_phase1] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_organisaatioluokitus_phase1] ADD  CONSTRAINT [DF__sa_organisaatioluokitus_phase1__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_organisaatioluokitus_phase1] ADD  CONSTRAINT [DF__sa_organisaatioluokitus_phase1__username]  DEFAULT (suser_name()) FOR [username]
GO
