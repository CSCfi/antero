USE ARVO_SA
GO
/****** Object:  Table [sa].[sa_kuntatalous_taksonomiat_aputaulu]    Script Date: 19.11.2025 10.49.50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_jatkokysymykset]') AND type in (N'U'))
DROP TABLE [sa].[sa_arvo_v2_jatkokysymykset]
GO

CREATE TABLE [sa].[sa_arvo_v2_jatkokysymykset](
	[kyselyid] [int] NULL,
	[kysymysryhmaid] [int] NULL,
	[jatkokysymysid] [int] NULL,
	[kysymysid] [int] NULL,
	[jatkokysymysversio] [int] NULL,
	[kysymysversio] [int] NULL,
	[vastaus] [varchar](500) NULL,
	[source] [varchar](500) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](255) NULL
) ON [PRIMARY]
GO


USE ANTERO
