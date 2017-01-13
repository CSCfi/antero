IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[Sarakeleveys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[Sarakeleveys](
  [Sarakeleveys] [char](1) NULL,
  [leveys] [varchar](100) NULL
) ON [PRIMARY]
END