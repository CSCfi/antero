USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_hul]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_arvo_hul](
	[kysymysid] [int] NULL,
	[koodi] [varchar](255) NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL
) ON [PRIMARY]


END

GO