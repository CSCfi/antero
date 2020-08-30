USE [ANTERO]
GO

ALTER TABLE [dw].[d_julkaisun_tekijan_rooli] DROP CONSTRAINT [DF__d_rooli__loadtime]
GO


/****** Object:  Table [dw].[d_julkaisun_tekijan_rooli]    Script Date: 31.8.2020 1:02:33 ******/
DROP TABLE [dw].[d_julkaisun_tekijan_rooli]
GO

/****** Object:  Table [dw].[d_julkaisun_tekijan_rooli]    Script Date: 31.8.2020 1:02:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_julkaisun_tekijan_rooli](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[username] [nvarchar](128) NOT NULL,
	[source] [nvarchar](255) NULL,
	[rooli_koodi] [varchar](100) NULL,
	[rooli_fi] [nvarchar](255) NULL,
	[rooli_sv] [nvarchar](255) NULL,
	[rooli_en] [nvarchar](255) NULL,
 CONSTRAINT [PK__d_julkaisun_tekijan_rooli] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_julkaisun_tekijan_rooli] ADD  CONSTRAINT [DF__d_rooli__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

SET IDENTITY_INSERT [dw].[d_julkaisun_tekijan_rooli] ON
GO

INSERT INTO [dw].[d_julkaisun_tekijan_rooli] (id, username, source, rooli_koodi, rooli_fi)
values (-1,'dwi\oeskola','manual','-1','Tieto puuttuu'),
(1,'dwi\oeskola','manual','110','arkkitehti'),
(2,'dwi\oeskola','manual','111','dramaturgi'),
(3,'dwi\oeskola','manual','112','editoija'),
(4,'dwi\oeskola','manual','113','esiintyjä'),
(5,'dwi\oeskola','manual','114','kapellimestari'),
(6,'dwi\oeskola','manual','115','kehittäjä'),
(7,'dwi\oeskola','manual','116','koreografi'),
(8,'dwi\oeskola','manual','117','kuoronjohtaja'),
(9,'dwi\oeskola','manual','118','kuraattori'),
(10,'dwi\oeskola','manual','119','kuvaaja'),
(11,'dwi\oeskola','manual','120','kuvataiteilija'),
(12,'dwi\oeskola','manual','121','käsikirjoittaja'),
(13,'dwi\oeskola','manual','122','lavastaja'),
(14,'dwi\oeskola','manual','123','maisema-arkkitehti'),
(15,'dwi\oeskola','manual','124','muotoilija'),
(16,'dwi\oeskola','manual','125','näyttelijä'),
(17,'dwi\oeskola','manual','126','ohjaaja'),
(18,'dwi\oeskola','manual','127','pukusuunnittelija'),
(19,'dwi\oeskola','manual','128','sanoittaja'),
(20,'dwi\oeskola','manual','129','sisustusarkkitehti'),
(21,'dwi\oeskola','manual','130','solisti'),
(22,'dwi\oeskola','manual','131','sovittaja'),
(23,'dwi\oeskola','manual','132','säveltäjä'),
(24,'dwi\oeskola','manual','133','taiteilija'),
(25,'dwi\oeskola','manual','134','tanssija'),
(26,'dwi\oeskola','manual','135','tekijä'),
(27,'dwi\oeskola','manual','136','tuottaja'),
(28,'dwi\oeskola','manual','137','valokuvaaja'),
(29,'dwi\oeskola','manual','138','valosuunnittelija'),
(30,'dwi\oeskola','manual','139','visualisoija'),
(31,'dwi\oeskola','manual','140','äänisuunnittelija')
GO

SET IDENTITY_INSERT [dw].[d_julkaisun_tekijan_rooli] OFF
GO


