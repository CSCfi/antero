USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_virta_otp_tk_opisk_ennakko]    Script Date: 16.10.2025 8:50:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [sa].[sa_virta_otp_tk_opisk_ennakko_2025]

CREATE TABLE [sa].[sa_virta_otp_tk_opisk_ennakko_2025](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[aikielir1x] [varchar](2) NULL,
	[aineisto] [varchar](1) NULL,
	[allk] [varchar](1) NULL,
	[alvv] [varchar](4) NULL,
	[alvvkk] [varchar](4) NULL,
	[alvvkklasna] [varchar](4) NULL,
	[alvvkksek] [varchar](4) NULL,
	[alvvkkseklasna] [varchar](4) NULL,
	[alvvopa] [varchar](4) NULL,
	[alvvopalasna] [varchar](4) NULL,
	[alvvsek] [varchar](4) NULL,
	[alvvseklasna] [varchar](4) NULL,
	[avo] [varchar](1) NULL,
	[ensisop] [varchar](1) NULL,
	[fte] [varchar](1) NULL,
	[fuksi] [varchar](1) NULL,
	[jarj] [varchar](6) NULL,
	[kansalr2] [varchar](3) NULL,
	[kirtu1k] [varchar](1) NULL,
	[kirtu1v] [varchar](4) NULL,
	[kk] [varchar](2) NULL,
	[kkieli] [varchar](2) NULL,
	[kkun] [varchar](3) NULL,
	[koulk] [varchar](6) NULL,
	[koultyp] [varchar](1) NULL,
	[lahde] [varchar](2) NULL,
	[lasnalk] [int] NULL,
	[lkm] [int] NULL,
	[ltop] [varchar](1) NULL,
	[luontipvm] [varchar](10) NULL,
	[olosyys] [varchar](1) NULL,
	[olotamm] [varchar](1) NULL,
	[om] [varchar](1) NULL,
	[op55] [varchar](1) NULL,
	[opek] [int] NULL,
	[opes] [int] NULL,
	[opkelp] [varchar](1) NULL,
	[opker] [int] NULL,
	[oplaaj] [int] NULL,
	[opmopa] [varchar](3) NULL,
	[opoikv] [varchar](4) NULL,
	[opyht0] [int] NULL,
	[opyht104] [int] NULL,
	[opyht119] [int] NULL,
	[opyht120] [int] NULL,
	[opyht14] [int] NULL,
	[opyht29] [int] NULL,
	[opyht44] [int] NULL,
	[opyht59] [int] NULL,
	[opyht74] [int] NULL,
	[opyht89] [int] NULL,
	[poissalk] [int] NULL,
	[rahlahde] [varchar](1) NULL,
	[sp] [varchar](1) NULL,
	[syntv] [varchar](4) NULL,
	[tilmaa] [varchar](1) NULL,
	[tilv] [varchar](4) NULL,
	[tilvaskun] [varchar](3) NULL,
	[tilvaskun2x] [varchar](3) NULL,
	[tilvaskunx] [varchar](3) NULL,
	[tunn] [varchar](5) NULL,
	[loadtime] [datetime2](4) NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[aloitusvuosi] [int] NULL,
	[ensikertalainen] [int] NULL
) ON [PRIMARY]

GO

INSERT INTO [sa].[sa_virta_otp_tk_opisk_ennakko_2025] (	
	[aikielir1x]
    ,[aineisto]
    ,[allk]
    ,[alvv]
    ,[alvvkk]
    ,[alvvkklasna]
    ,[alvvkksek]
    ,[alvvkkseklasna]
    ,[alvvopa]
    ,[alvvopalasna]
    ,[alvvsek]
    ,[alvvseklasna]
    ,[avo]
    ,[ensisop]
    ,[fte]
    ,[fuksi]
    ,[jarj]
    ,[kansalr2]
    ,[kirtu1k]
    ,[kirtu1v]
    ,[kk]
    ,[kkieli]
    ,[kkun]
    ,[koulk]
    ,[koultyp]
    ,[lahde]
    ,[lasnalk]
    ,[lkm]
    ,[ltop]
    ,[luontipvm]
    ,[olosyys]
    ,[olotamm]
    ,[om]
    ,[op55]
    ,[opek]
    ,[opes]
    ,[opkelp]
    ,[opker]
    ,[oplaaj]
    ,[opmopa]
    ,[opoikv]
    ,[opyht0]
    ,[opyht104]
    ,[opyht119]
    ,[opyht120]
    ,[opyht14]
    ,[opyht29]
    ,[opyht44]
    ,[opyht59]
    ,[opyht74]
    ,[opyht89]
    ,[poissalk]
    ,[rahlahde]
    ,[sp]
    ,[syntv]
    ,[tilmaa]
    ,[tilv]
    ,[tilvaskun]
    ,[tilvaskun2x]
    ,[tilvaskunx]
    ,[tunn]
    ,[loadtime]
    ,[source]
    ,[username]
    ,[aloitusvuosi]
    ,[ensikertalainen]
)

SELECT
	[aikielir1x]
    ,[aineisto]
    ,[allk]
    ,[alvv]
    ,[alvvkk]
    ,[alvvkklasna]
    ,[alvvkksek]
    ,[alvvkkseklasna]
    ,[alvvopa]
    ,[alvvopalasna]
    ,[alvvsek]
    ,[alvvseklasna]
    ,[avo]
    ,[ensisop]
    ,[fte]
    ,[fuksi]
    ,[jarj]
    ,[kansalr2]
    ,[kirtu1k]
    ,[kirtu1v]
    ,[kk]
    ,[kkieli]
    ,[kkun]
    ,[koulk]
    ,[koultyp]
    ,[lahde]
    ,[lasnalk]
    ,[lkm]
    ,[ltop]
    ,[luontipvm]
    ,[olosyys]
    ,[olotamm]
    ,[om]
    ,[op55]
    ,[opek]
    ,[opes]
    ,[opkelp]
    ,[opker]
    ,[oplaaj]
    ,[opmopa]
    ,[opoikv]
    ,[opyht0]
    ,[opyht104]
    ,[opyht119]
    ,[opyht120]
    ,[opyht14]
    ,[opyht29]
    ,[opyht44]
    ,[opyht59]
    ,[opyht74]
    ,[opyht89]
    ,[poissalk]
    ,[rahlahde]
    ,[sp]
    ,[syntv]
    ,[tilmaa]
    ,[tilv]
    ,[tilvaskun]
    ,[tilvaskun2x]
    ,[tilvaskunx]
    ,[tunn]
    ,GETDATE() as loadtime
    ,[source]
    ,SUSER_NAME() as username
    ,[aloitusvuosi]
    ,[ensikertalainen]
FROM VirtaSiirto.sa.sa_virta_otp_tk_opisk_ennakko
WHERE tilv = 2025

USE [ANTERO]
