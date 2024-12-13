USE [ANTERO]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_koski_tutkinnonosat]') AND type in (N'U'))
BEGIN
	ALTER TABLE [dw].[d_koski_tutkinnonosat] DROP CONSTRAINT IF EXISTS [DF__d_koski_tutkinnonosat_username]
	ALTER TABLE [dw].[d_koski_tutkinnonosat] DROP CONSTRAINT IF EXISTS [DF__d_koski_tutkinnonosat_loadtime]
END

/****** Object:  Table [dw].[d_koski_tutkinnonosat]    Script Date: 13.12.2024 12.44.54 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_koski_tutkinnonosat]') AND type in (N'U'))
BEGIN

	CREATE TABLE [dw].[d_koski_tutkinnonosat](
		[id] [int] IDENTITY(0,1) NOT NULL,
		[koodi] [nvarchar](100) NOT NULL,
		[selite_fi] [nvarchar](200) NOT NULL,
		[selite_sv] [nvarchar](200) NOT NULL,
		[selite_en] [nvarchar](200) NOT NULL,
		[jarjestys_koodi] [int] NULL,
		[loadtime] [datetime] NOT NULL,
		[source] [nvarchar](100) NOT NULL,
		[username] [nvarchar](50) NOT NULL,
	 CONSTRAINT [PK_d_koski_tutkinnonosat] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
	;

END

ALTER TABLE [dw].[d_koski_tutkinnonosat] ADD  CONSTRAINT [DF__d_koski_tutkinnonosat_loadtime]  DEFAULT (getdate()) FOR [loadtime]
ALTER TABLE [dw].[d_koski_tutkinnonosat] ADD  CONSTRAINT [DF__d_koski_tutkinnonosat_username]  DEFAULT (suser_sname()) FOR [username]

GO
