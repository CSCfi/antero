USE [ANTERO]

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_ytl_FT3001')

BEGIN
CREATE TABLE [sa].[sa_ytl_FT3001](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](128) NOT NULL,
	[YH] [varchar](max) NULL,
	[EA] [varchar](max) NULL,
	[BA] [varchar](max) NULL,
	[BB] [varchar](max) NULL,
	[FY] [varchar](max) NULL,
	[BI] [varchar](max) NULL,
	[FA] [varchar](max) NULL,
	[HI] [varchar](max) NULL,
	[FF] [varchar](max) NULL,
	[koulun_nro] [varchar](max) NULL,
	[O5] [varchar](max) NULL,
	[tyyppi] [varchar](max) NULL,
	[koulun_nimi] [varchar](max) NULL,
	[tutkintokerta] [varchar](max) NULL,
	[QC] [varchar](max) NULL,
	[PC] [varchar](max) NULL,
	[PA] [varchar](max) NULL,
	[A5] [varchar](max) NULL,
	[TE] [varchar](max) NULL,
	[TC] [varchar](max) NULL,
	[A] [varchar](max) NULL,
	[VA] [varchar](max) NULL,
	[VC] [varchar](max) NULL,
	[PS] [varchar](max) NULL,
	[I] [varchar](max) NULL,
	[CB] [varchar](max) NULL,
	[CA] [varchar](max) NULL,
	[M] [varchar](max) NULL,
	[O] [varchar](max) NULL,
	[N] [varchar](max) NULL,
	[Q] [varchar](max) NULL,
	[SC] [varchar](max) NULL,
	[GE] [varchar](max) NULL,
	[GC] [varchar](max) NULL,
	[EC] [varchar](max) NULL,
	[W] [varchar](max) NULL,
	[L1] [varchar](max) NULL,
	[ET] [varchar](max) NULL,
	[IC] [varchar](max) NULL,
	[Z] [varchar](max) NULL,
	[sukup] [varchar](max) NULL,
	[KE] [varchar](max) NULL,
	[L7] [varchar](max) NULL,
	[DC] [varchar](max) NULL,
	[opetuskieli] [varchar](max) NULL,
	[UO] [varchar](max) NULL,
	[FC] [varchar](max) NULL,
	[UE] [varchar](max) NULL,
	[SA] [varchar](max) NULL,
	[yht] [varchar](max) NULL,
 CONSTRAINT [PK__sa_ytl_FT3001] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_ytl_FT3001] ADD  CONSTRAINT [DF__sa_ytl_FT3001__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_ytl_FT3001__username]') AND type = 'D')

ALTER TABLE [sa].[sa_ytl_FT3001] ADD  CONSTRAINT [DF__sa_ytl_FTSD3001__username]  DEFAULT (suser_name()) FOR [username]
