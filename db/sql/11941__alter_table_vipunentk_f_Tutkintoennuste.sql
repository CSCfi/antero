USE [VipunenTK]

GO

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[dbo].[f_Tutkintoennuste]') 
  AND name = 'Äidinkieli'
)
BEGIN
	ALTER TABLE VipunenTK.dbo.f_Tutkintoennuste ADD [Äidinkieli] VARCHAR(100)
END