USE [ANTERO]
GO

/****** Object:  Table [dw].[d_koulutusluokitus]    Script Date: 12.5.2023 19:30:35 ******/
DROP TABLE [dw].[d_koulutusluokitus]
GO

/****** Object:  Table [dw].[d_koulutusluokitus]    Script Date: 12.5.2023 19:30:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_koulutusluokitus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koulutusluokitus_avain] [varchar](50) NOT NULL,
	[koulutusluokitus_koodi] [varchar](6) NOT NULL,
	[koulutusluokitus_fi] [nvarchar](200) NOT NULL,
	[koulutusluokitus_sv] [nvarchar](200) NOT NULL,
	[koulutusluokitus_en] [nvarchar](200) NOT NULL,
	[koulutusastetaso1_koodi] [varchar](2) NULL,
	[koulutusastetaso1_fi] [nvarchar](200) NULL,
	[koulutusastetaso1_sv] [nvarchar](200) NULL,
	[koulutusastetaso1_en] [nvarchar](200) NULL,
	[koulutusastetaso2_koodi] [varchar](2) NULL,
	[koulutusastetaso2_fi] [nvarchar](200) NULL,
	[koulutusastetaso2_sv] [nvarchar](200) NULL,
	[koulutusastetaso2_en] [nvarchar](200) NULL,
	[koulutusalataso1_koodi] [varchar](2) NULL,
	[koulutusalataso1_fi] [nvarchar](200) NULL,
	[koulutusalataso1_sv] [nvarchar](200) NULL,
	[koulutusalataso1_en] [nvarchar](200) NULL,
	[koulutusalataso2_koodi] [varchar](3) NULL,
	[koulutusalataso2_fi] [nvarchar](200) NULL,
	[koulutusalataso2_sv] [nvarchar](200) NULL,
	[koulutusalataso2_en] [nvarchar](200) NULL,
	[koulutusalataso3_koodi] [varchar](4) NULL,
	[koulutusalataso3_fi] [nvarchar](200) NULL,
	[koulutusalataso3_sv] [nvarchar](200) NULL,
	[koulutusalataso3_en] [nvarchar](200) NULL,
	[okmohjauksenala_koodi] [varchar](2) NULL,
	[okmohjauksenala_fi] [nvarchar](200) NULL,
	[okmohjauksenala_sv] [nvarchar](200) NULL,
	[okmohjauksenala_en] [nvarchar](200) NULL,
	[koulutusaste2002_koodi] [varchar](2) NULL,
	[koulutusaste2002_fi] [nvarchar](200) NULL,
	[koulutusaste2002_sv] [nvarchar](200) NULL,
	[koulutusaste2002_en] [nvarchar](200) NULL,
	[koulutusala2002_koodi] [varchar](2) NULL,
	[koulutusala2002_fi] [nvarchar](200) NULL,
	[koulutusala2002_sv] [nvarchar](200) NULL,
	[koulutusala2002_en] [nvarchar](200) NULL,
	[opintoala2002_koodi] [varchar](3) NULL,
	[opintoala2002_fi] [nvarchar](200) NULL,
	[opintoala2002_sv] [nvarchar](200) NULL,
	[opintoala2002_en] [nvarchar](200) NULL,
	[opintoala1995_koodi] [varchar](2) NULL,
	[opintoala1995_fi] [nvarchar](200) NULL,
	[opintoala1995_sv] [nvarchar](200) NULL,
	[opintoala1995_en] [nvarchar](200) NULL,
	[koulutussektori_koodi] [varchar](2) NULL,
	[koulutussektori_fi] [nvarchar](60) NULL,
	[koulutussektori_sv] [nvarchar](60) NULL,
	[koulutussektori_en] [nvarchar](60) NULL,
	[tutkintotyyppi_koodi] [varchar](2) NULL,
	[tutkintotyyppi_fi] [nvarchar](60) NULL,
	[tutkintotyyppi_sv] [nvarchar](60) NULL,
	[tutkintotyyppi_en] [nvarchar](60) NULL,
	[tutkintotyypin_ryhma_koodi] [varchar](2) NULL,
	[tutkintotyypin_ryhma_fi] [nvarchar](60) NULL,
	[tutkintotyypin_ryhma_sv] [nvarchar](60) NULL,
	[tutkintotyypin_ryhma_en] [nvarchar](60) NULL,
	[uusi_eat_koodi] [varchar](6) NULL,
	[koulutustyyppi_koodi] [varchar](6) NULL,
	[source] [varchar](100) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[jarjestys_koulutusalataso1_koodi]  AS (case when [koulutusalataso1_koodi]=(-1) then '99999' else CONVERT([varchar](10),[koulutusalataso1_koodi]) end),
	[jarjestys_koulutusalataso2_koodi]  AS (case when [koulutusalataso2_koodi]=(-1) then '99999' else CONVERT([varchar](10),[koulutusalataso2_koodi]) end),
	[jarjestys_koulutusalataso3_koodi]  AS (case when [koulutusalataso3_koodi]='-1' then '99999' else CONVERT([varchar](10),[koulutusalataso3_koodi]) end),
	[jarjestys_koulutusastetaso1_koodi]  AS (case when [koulutusastetaso1_koodi]='-1' then '99999' else CONVERT([varchar](10),[koulutusastetaso1_koodi]) end),
	[jarjestys_koulutusastetaso2_koodi]  AS (case when [koulutusastetaso2_koodi]='-1' then '99999' else CONVERT([varchar](10),[koulutusastetaso2_koodi]) end),
	[jarjestys_koulutusluokitus_koodi]  AS (case when [koulutusluokitus_koodi]='-1' then '9999999' else CONVERT([varchar](10),[koulutusluokitus_koodi]) end),
	[jarjestys_koulutussektori_koodi]  AS (case when [koulutussektori_koodi]='-1' then '99999' else CONVERT([varchar](10),[koulutussektori_koodi]) end),
	[jarjestys_okmohjauksenala_koodi]  AS (case when [okmohjauksenala_koodi]='-1' then '99999' else CONVERT([varchar](10),(100)+[okmohjauksenala_koodi]) end),
	[jarjestys_tutkintotyyppi_koodi]  AS (case when [tutkintotyyppi_koodi]=(-1) then '99999' else CONVERT([varchar](10),[tutkintotyyppi_koodi]) end),
	[jarjestys_tutkintotyypin_ryhma_koodi]  AS (case when [tutkintotyypin_ryhma_koodi]=(-1) then '99999' else CONVERT([varchar](10),[tutkintotyypin_ryhma_koodi]) end),
	[jarjestys_koulutusaste2002_koodi]  AS (case when [koulutusaste2002_koodi]=(-1) then '99999' else CONVERT([varchar](10),[koulutusaste2002_koodi]) end),
	[jarjestys_koulutusala2002_koodi]  AS (case when [koulutusala2002_koodi]=(-1) then '99999' else CONVERT([varchar](10),[koulutusala2002_koodi]) end),
	[jarjestys_opintoala2002_koodi]  AS (case when [opintoala2002_koodi]=(-1) then '99999' else CONVERT([varchar](10),[opintoala2002_koodi]) end),
	[jarjestys_opintoala1995_koodi]  AS (case when [opintoala1995_koodi]=(-1) then '99999' else CONVERT([varchar](10),[opintoala1995_koodi]) end),
 CONSTRAINT [PK__d_koulutusluokitus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_koulutusluokitus] ADD  CONSTRAINT [DF__d_koulutusluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_koulutusluokitus] ADD  CONSTRAINT [DF__d_koulutusluokitus__username]  DEFAULT (suser_sname()) FOR [username]
GO


