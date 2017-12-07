USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_odw_hakeneet]    Script Date: 7.12.2017 14:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_odw_hakeneet]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_odw_hakeneet](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[HenkiloID] [bigint] NULL,
	[HenkiloOID] [varchar](255) NULL,
	[KotikuntaKoodi] [varchar](255) NULL,
	[SukupuoliKoodi] [varchar](255) NULL,
	[AidinkieliKoodi] [varchar](255) NULL,
	[Ika] [int] NULL,
	[Ensikertalainen] [int] NULL,
	[KansalaisuusKoodi] [int] NULL,
	[OrganisaatioOID] [varchar](255) NULL,
	[KoulutusToimijaOID] [varchar](255) NULL,
	[OppilaitosOID] [varchar](255) NULL,
	[ToimipisteOID] [varchar](255) NULL,
	[OrganisaationKuntaKoodi] [varchar](255) NULL,
	[Luokkataso] [varchar](255) NULL,
	[PohjakoulutuksenSuoritusvuosi] [int] NULL,
	[ToisenAsteenKoulutuksenSuoritusvuosi] [int] NULL,
	[HakukohdeOID] [varchar](255) NULL,
	[HakutoiveNumero] [int] NULL,
	[hakukohteen_tutkinnon_taso_kk_sykli] [varchar](255) NULL,
	[hakukohteen_tutkinnon_taso_kk] [varchar](255) NULL,
	[PohjakoulutusKoodi] [varchar](255) NULL,
	[PohjakoulutusKKLomakeKoodi] [varchar](255) NULL,
	[ValinnanTila] [varchar](255) NULL,
	[VastaanotonTila] [varchar](255) NULL,
	[IlmoittautumisenTila] [varchar](255) NULL,
	[PohjakoulutusvaatimusKoodi] [varchar](255) NULL,
	[HakuOid] [varchar](255) NULL,
	[HakuaikaId] [varchar](255) NULL,
	[HakemusOid] [varchar](255) NULL,
	[Hakukelpoisuus] [varchar](255) NULL,
	[KiinnostunutOppisopimuksesta] [int] NULL,
	[PohjakoulutuksenMaaKoodi] [varchar](255) NULL,
	[Jatkotutkintohaku] [varchar](255) NULL,
	[koulutusaste] [varchar](255) NULL,
	[Yo_Amk_YoAmk] [varchar](30) NULL,
	[LahtokouluOid] [varchar](255) NULL,
	[LahtokoulunKuntaKoodi] [varchar](255) NULL,
 CONSTRAINT [PK__sa_odw_hakeneet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_odw_hakeneet__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_odw_hakeneet] ADD  CONSTRAINT [DF__sa_odw_hakeneet__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_odw_hakeneet__username]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_odw_hakeneet] ADD  CONSTRAINT [DF__sa_odw_hakeneet__username]  DEFAULT (suser_name()) FOR [username]
END


