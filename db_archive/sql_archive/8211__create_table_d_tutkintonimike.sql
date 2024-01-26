USE [ANTERO]
GO

/****** Object:  Table [dw].[d_tutkintonimike]    Script Date: 18.10.2023 8:07:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_tutkintonimike]') AND type in (N'U'))

BEGIN

CREATE TABLE [dw].[d_tutkintonimike](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tutkintonimike_koodi] [varchar](6) NOT NULL,
	[tutkintonimike_fi] [nvarchar](200) NOT NULL,
	[tutkintonimike_sv] [nvarchar](200) NOT NULL,
	[tutkintonimike_en] [nvarchar](200) NOT NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[source] [varchar](100) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_tutkintonimike] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dw].[d_tutkintonimike] ADD  CONSTRAINT [DF__d_tutkintonimike__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_tutkintonimike] ADD  CONSTRAINT [DF__d_tutkintonimike__username]  DEFAULT (suser_sname()) FOR [username]

END

GO

USE [ANTERO]

