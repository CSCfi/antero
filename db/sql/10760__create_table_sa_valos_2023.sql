USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_valos_2023]') AND type in (N'U'))
DROP TABLE [sa].[sa_valos_2023]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_valos_2023](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rekno] [varchar](50) NULL,
	[vuosi] [varchar](50) NULL,
	[SAAJA] [varchar](50) NULL,
	[ytunnus] [varchar](50) NULL,
	[nimi] [varchar](50) NULL,
	[nimi2] [varchar](50) NULL,
	[slyhenne] [varchar](50) NULL,
	[kala] [varchar](50) NULL,
	[koulumto] [varchar](50) NULL,
	[OMISTAJA] [varchar](50) NULL,
	[KUNTA] [varchar](50) NULL,
	[VIRKUNTA] [varchar](50) NULL,
	[suorite] [varchar](50) NULL,
	[k010l01] [varchar](50) NULL,
	[k010l02] [varchar](50) NULL,
	[k010l03] [varchar](50) NULL,
	[k010l09] [varchar](50) NULL,
	[k020l01] [varchar](50) NULL,
	[k020l02] [varchar](50) NULL,
	[k020l03] [varchar](50) NULL,
	[k020l09] [varchar](50) NULL,
	[k030l01] [varchar](50) NULL,
	[k030l02] [varchar](50) NULL,
	[k030l03] [varchar](50) NULL,
	[k030l09] [varchar](50) NULL,
	[k040l01] [varchar](50) NULL,
	[k040l02] [varchar](50) NULL,
	[k040l03] [varchar](50) NULL,
	[k040l09] [varchar](50) NULL,
	[k050l01] [varchar](50) NULL,
	[k050l02] [varchar](50) NULL,
	[k050l03] [varchar](50) NULL,
	[k050l09] [varchar](50) NULL,
	[k060l01] [varchar](50) NULL,
	[k060l02] [varchar](50) NULL,
	[k060l03] [varchar](50) NULL,
	[k060l09] [varchar](50) NULL,
	[k070l01] [varchar](50) NULL,
	[k070l02] [varchar](50) NULL,
	[k070l03] [varchar](50) NULL,
	[k070l09] [varchar](50) NULL,
	[k080l01] [varchar](50) NULL,
	[k080l02] [varchar](50) NULL,
	[k080l03] [varchar](50) NULL,
	[k080l09] [varchar](50) NULL,
	[k090l02] [varchar](50) NULL,
	[k090l03] [varchar](50) NULL,
	[k090l09] [varchar](50) NULL,
	[k100l01] [varchar](50) NULL,
	[k100l02] [varchar](50) NULL,
	[k100l03] [varchar](50) NULL,
	[k100l09] [varchar](50) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](30) NULL,

CONSTRAINT [PK__sa_valos_2023] PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_valos_2023] ADD  CONSTRAINT [DF__sa_valos_2023__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_valos_2023] ADD  CONSTRAINT [DF__sa_valos_2023__username]  DEFAULT (suser_name()) FOR [username]
GO
