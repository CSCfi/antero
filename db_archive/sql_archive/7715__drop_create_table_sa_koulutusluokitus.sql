USE [ANTERO]
GO

ALTER TABLE [sa].[sa_koulutusluokitus] DROP  CONSTRAINT [DF__sa_koulutusluokitus__loadtime]

ALTER TABLE [sa].[sa_koulutusluokitus] DROP  CONSTRAINT [DF__sa_koulutusluokitus__username]
GO

GO

/****** Object:  Table [dw].[d_julkaisun_tekijan_rooli]    Script Date: 4.5.2023 10:09:09 ******/
DROP TABLE IF EXISTS [sa].[sa_koulutusluokitus]
GO

/****** Object:  Table [dw].[d_julkaisun_tekijan_rooli]    Script Date: 4.5.2023 10:09:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_koulutusluokitus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](10) NOT NULL,
	[nimi] [nvarchar](300) NOT NULL,
	[nimi_sv] [nvarchar](300) NULL,
	[nimi_en] [nvarchar](300) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[koulutusaste2002koodi] [nvarchar](10) NULL,
	[koulutusaste2002nimi] [nvarchar](300) NULL,
	[koulutusaste2002nimi_sv] [nvarchar](300) NULL,
	[koulutusaste2002nimi_en] [nvarchar](300) NULL,
	[koulutusala2002koodi] [nvarchar](10) NULL,
	[koulutusala2002nimi] [nvarchar](300) NULL,
	[koulutusala2002nimi_sv] [nvarchar](300) NULL,
	[koulutusala2002nimi_en] [nvarchar](300) NULL,
	[opintoala2002koodi] [nvarchar](10) NULL,
	[opintoala2002nimi] [nvarchar](300) NULL,
	[opintoala2002nimi_sv] [nvarchar](300) NULL,
	[opintoala2002nimi_en] [nvarchar](300) NULL,
	[koulutusaste1995koodi] [nvarchar](10) NULL,
	[koulutusaste1995nimi] [nvarchar](300) NULL,
	[koulutusaste1995nimi_sv] [nvarchar](300) NULL,
	[koulutusaste1995nimi_en] [nvarchar](300) NULL,
	[koulutusala1995koodi] [nvarchar](10) NULL,
	[koulutusala1995nimi] [nvarchar](300) NULL,
	[koulutusala1995nimi_sv] [nvarchar](300) NULL,
	[koulutusala1995nimi_en] [nvarchar](300) NULL,
	[opintoala1995koodi] [nvarchar](10) NULL,
	[opintoala1995nimi] [nvarchar](300) NULL,
	[opintoala1995nimi_sv] [nvarchar](300) NULL,
	[opintoala1995nimi_en] [nvarchar](300) NULL,
	[tutkintokoodi] [nvarchar](10) NULL,
	[tutkintonimi] [nvarchar](300) NULL,
	[tutkintonimi_sv] [nvarchar](300) NULL,
	[tutkintonimi_en] [nvarchar](300) NULL,
	[tutkintotyyppikoodi] [nvarchar](10) NULL,
	[tutkintotyyppinimi] [nvarchar](300) NULL,
	[tutkintotyyppinimi_sv] [nvarchar](300) NULL,
	[tutkintotyyppinimi_en] [nvarchar](300) NULL,
	[koulutustyyppikoodi] [nvarchar](10) NULL,
	[koulutustyyppinimi] [nvarchar](300) NULL,
	[koulutustyyppinimi_sv] [nvarchar](300) NULL,
	[koulutustyyppinimi_en] [nvarchar](300) NULL,
	[isced2011koulutusastekoodi] [nvarchar](10) NULL,
	[isced2011koulutusastenimi] [nvarchar](300) NULL,
	[isced2011koulutusastenimi_sv] [nvarchar](300) NULL,
	[isced2011koulutusastenimi_en] [nvarchar](300) NULL,
	[isced2011koulutusastetaso1koodi] [nvarchar](10) NULL,
	[isced2011koulutusastetaso1nimi] [nvarchar](300) NULL,
	[isced2011koulutusastetaso1nimi_sv] [nvarchar](300) NULL,
	[isced2011koulutusastetaso1nimi_en] [nvarchar](300) NULL,
	[isced2011koulutusastetaso2koodi] [nvarchar](10) NULL,
	[isced2011koulutusastetaso2nimi] [nvarchar](300) NULL,
	[isced2011koulutusastetaso2nimi_sv] [nvarchar](300) NULL,
	[isced2011koulutusastetaso2nimi_en] [nvarchar](300) NULL,
	[isced2011koulutusalataso1koodi] [nvarchar](10) NULL,
	[isced2011koulutusalataso1nimi] [nvarchar](300) NULL,
	[isced2011koulutusalataso1nimi_sv] [nvarchar](300) NULL,
	[isced2011koulutusalataso1nimi_en] [nvarchar](300) NULL,
	[isced2011koulutusalataso2koodi] [nvarchar](10) NULL,
	[isced2011koulutusalataso2nimi] [nvarchar](300) NULL,
	[isced2011koulutusalataso2nimi_sv] [nvarchar](300) NULL,
	[isced2011koulutusalataso2nimi_en] [nvarchar](300) NULL,
	[isced2011koulutusalataso3koodi] [nvarchar](10) NULL,
	[isced2011koulutusalataso3nimi] [nvarchar](300) NULL,
	[isced2011koulutusalataso3nimi_sv] [nvarchar](300) NULL,
	[isced2011koulutusalataso3nimi_en] [nvarchar](300) NULL,
	[okmohjauksenalakoodi] [nvarchar](10) NULL,
	[okmohjauksenalanimi] [nvarchar](300) NULL,
	[okmohjauksenalanimi_sv] [nvarchar](300) NULL,
	[okmohjauksenalanimi_en] [nvarchar](300) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](255) NOT NULL,
	[koulutusluokitus2016koulutusalataso1koodi] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusalataso1nimi] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusalataso1nimi_sv] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusalataso1nimi_en] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusalataso2koodi] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusalataso2nimi] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusalataso2nimi_sv] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusalataso2nimi_en] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusalataso3koodi] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusalataso3nimi] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusalataso3nimi_sv] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusalataso3nimi_en] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusastetaso1koodi] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusastetaso1nimi] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusastetaso1nimi_sv] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusastetaso1nimi_en] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusastetaso2koodi] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusastetaso2nimi] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusastetaso2nimi_sv] [nvarchar](300) NULL,
	[koulutusluokitus2016koulutusastetaso2nimi_en] [nvarchar](300) NULL,
	[tutkintonimikekoodi] [nvarchar](300) NULL,
	[tutkintonimike] [nvarchar](300) NULL,
	[tutkintonimike_sv] [nvarchar](300) NULL,
	[tutkintonimike_en] [nvarchar](300) NULL,
 CONSTRAINT [PK__sa_koulutusluokitus] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_koulutusluokitus] ADD  CONSTRAINT [DF__sa_koulutusluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_koulutusluokitus] ADD  CONSTRAINT [DF__sa_koulutusluokitus__username]  DEFAULT (suser_name()) FOR [username]
GO






USE [ANTERO]
