USE [ANTERO]
GO

/****** Object:  Table [dw].[d_oppisopimuksen_perusta]    Script Date: 15.3.2022 10:42:56 ******/
DROP TABLE IF EXISTS [dw].[d_oppisopimuksen_perusta]
GO

/****** Object:  Table [dw].[d_oppisopimuksen_perusta]    Script Date: 15.3.2022 10:42:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_oppisopimuksen_perusta](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](100) NOT NULL,
	[selite_sv] [varchar](100) NOT NULL,
	[selite_en] [varchar](100) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[jarjestys_koodi] [int] NULL,
 CONSTRAINT [PK__d_oppisopimuksen_perusta__3213E83F19F4479D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_oppisopimuksen_perusta] ADD  CONSTRAINT [DF_d_oppisopimuksen_perusta_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_oppisopimuksen_perusta] ADD  CONSTRAINT [DF_d_oppisopimuksen_perusta_username]  DEFAULT (suser_sname()) FOR [username]
GO


