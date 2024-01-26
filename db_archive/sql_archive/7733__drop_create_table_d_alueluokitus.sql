USE [ANTERO]
GO

/****** Object:  Table [dw].[d_alueluokitus]    Script Date: 15.5.2023 15:47:26 ******/
DROP TABLE [dw].[d_alueluokitus]
GO

/****** Object:  Table [dw].[d_alueluokitus]    Script Date: 15.5.2023 15:47:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_alueluokitus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[alueluokitus_avain] [varchar](50) NOT NULL,
	[kunta_koodi] [varchar](3) NOT NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[voimassa] [int] NULL,
	[kunta_fi] [nvarchar](200) NOT NULL,
	[kunta_sv] [nvarchar](200) NOT NULL,
	[kunta_en] [nvarchar](200) NOT NULL,
	[maakunta_koodi] [varchar](2) NULL,
	[maakunta_fi] [nvarchar](200) NULL,
	[maakunta_sv] [nvarchar](200) NULL,
	[maakunta_en] [nvarchar](200) NULL,
	[hyvinvointialue_koodi] [varchar](2) NULL,
	[hyvinvointialue_fi] [nvarchar](200) NULL,
	[hyvinvointialue_sv] [nvarchar](200) NULL,
	[hyvinvointialue_en] [nvarchar](200) NULL,
	[avi_koodi] [varchar](2) NULL,
	[avi_fi] [nvarchar](60) NULL,
	[avi_sv] [nvarchar](60) NULL,
	[avi_en] [nvarchar](60) NULL,
	[ely_koodi] [varchar](2) NULL,
	[ely_fi] [nvarchar](60) NULL,
	[ely_sv] [nvarchar](60) NULL,
	[ely_en] [nvarchar](60) NULL,
	[kielisuhde_koodi] [varchar](5) NULL,
	[kielisuhde_fi] [nvarchar](60) NULL,
	[kielisuhde_sv] [nvarchar](60) NULL,
	[kielisuhde_en] [nvarchar](60) NULL,
	[seutukunta_koodi] [varchar](5) NULL,
	[seutukunta_fi] [nvarchar](60) NULL,
	[seutukunta_sv] [nvarchar](60) NULL,
	[seutukunta_en] [nvarchar](60) NULL,
	[kuntaryhma_koodi] [varchar](5) NULL,
	[kuntaryhma_fi] [nvarchar](60) NULL,
	[kuntaryhma_sv] [nvarchar](60) NULL,
	[kuntaryhma_en] [nvarchar](60) NULL,
	[vanha_kunta_fi] [nvarchar](200) NULL,
	[vanha_kunta_sv] [nvarchar](200) NULL,
	[vanha_kunta_en] [nvarchar](200) NULL,
	[jarjestys_kunta_koodi]  AS (case when [kunta_koodi]=(-1) then '99999' else CONVERT([varchar](10),[kunta_koodi]) end),
	[jarjestys_avi_koodi]  AS (case when [avi_koodi]=(-1) then '99999' else CONVERT([varchar](10),[avi_koodi]) end),
	[jarjestys_ely_koodi]  AS (case when [ely_koodi]=(-1) then '99999' else CONVERT([varchar](10),[ely_koodi]) end),
	[jarjestys_kielisuhde_koodi]  AS (case when [kielisuhde_koodi]=(-1) then '99999' else CONVERT([varchar](10),[kielisuhde_koodi]) end),
	[jarjestys_kuntaryhma_koodi]  AS (case when [kuntaryhma_koodi]=(-1) then '99999' else CONVERT([varchar](10),[kuntaryhma_koodi]) end),
	[jarjestys_maakunta_koodi]  AS (case when [maakunta_koodi]=(-1) then '99999' else CONVERT([varchar](10),[maakunta_koodi]) end),
	[jarjestys_hyvinvointialue_koodi]  AS (case when [hyvinvointialue_koodi]=(-1) then '99999' else CONVERT([varchar](10),[hyvinvointialue_koodi]) end),
	[jarjestys_seutukunta_koodi]  AS (case when [seutukunta_koodi]=(-1) then '99999' else CONVERT([varchar](10),[seutukunta_koodi]) end),
 CONSTRAINT [PK__d_alueluokitus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_alueluokitus] ADD  CONSTRAINT [DF__d_alueluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_alueluokitus] ADD  CONSTRAINT [DF__d_alueluokitus__username]  DEFAULT (suser_sname()) FOR [username]
GO


