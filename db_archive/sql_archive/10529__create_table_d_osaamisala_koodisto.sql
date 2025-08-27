USE [ANTERO]
GO

/****** Object:  Table [dw].[d_osaamisala_koodisto]    Script Date: 24.1.2025 9.03.56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_osaamisala_koodisto]') AND type in (N'U'))
DROP TABLE [dw].[d_osaamisala_koodisto]
GO

/****** Object:  Table [dw].[d_osaamisala_koodisto]    Script Date: 24.1.2025 9.03.56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_osaamisala_koodisto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](5) NOT NULL,
	[selite_fi] [nvarchar](200) NOT NULL,
	[selite_sv] [nvarchar](200) NULL,
	[selite_en] [nvarchar](200) NULL,
	[jarjestys] [int] NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_d_osaamisala_koodisto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_osaamisala_koodisto] ADD  CONSTRAINT [DF__d_osaamisala_koodisto__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_osaamisala_koodisto] ADD  CONSTRAINT [DF__d_osaamisala_koodisto__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO


USE [ANTERO]