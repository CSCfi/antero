USE [ANTERO]
GO

IF NOT EXISTS (
  SELECT * FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dw].[d_alueluokitus]') AND name = 'mannersuomessa'
)
BEGIN
    ALTER TABLE [dw].[d_alueluokitus] 
    ADD [mannersuomessa] bit not null default(0)
END
