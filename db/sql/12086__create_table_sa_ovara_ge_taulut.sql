USE [Varda_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_tuen_tiedot_2025]') AND type in (N'U'))

BEGIN
    CREATE TABLE [sa].[sa_varda_tuen_tiedot_2025](
        [id] [int] IDENTITY(1,1) NOT NULL,
        [organisaatio_oid] [varchar](255) NULL,
        [tilastointi_pvm] [datetime] NULL,
        [yksityinen_jarjestaja] [int] NULL,
        [tuentaso_koodi] [varchar](5) NULL,
        [ikaryhma_koodi] [varchar](5) NULL,
        [tukipaatosmaara] [int] NULL,
        [source] [varchar](255) NULL,
        [loadtime] [datetime] NULL,
        [username] [varchar](255) NULL,
     CONSTRAINT [PK__sa_varda_tuen_tiedot_2025] PRIMARY KEY CLUSTERED
    (
        [id] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    

    ALTER TABLE [sa].[sa_varda_tuen_tiedot_2025] ADD  CONSTRAINT [DF__sa_varda_tuen_tiedot_2025_imp_created]  DEFAULT (getdate()) FOR [loadtime]
    

    ALTER TABLE [sa].[sa_varda_tuen_tiedot_2025] ADD  CONSTRAINT [DF__sa_varda_tuen_tiedot_2025_username]  DEFAULT (suser_sname()) FOR [username]
END
GO
USE [ANTERO]

