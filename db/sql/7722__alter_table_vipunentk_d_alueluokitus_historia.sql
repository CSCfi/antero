USE [VipunenTK]
GO

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dbo].[d_alueluokitus_historia]') 
  AND name = 'hyvinvointialue_koodi'
)
ALTER TABLE [dbo].[d_alueluokitus_historia]
ADD [hyvinvointialue_koodi] [nvarchar](2) NULL

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dbo].[d_alueluokitus_historia]') 
  AND name = 'hyvinvointialue'
)
ALTER TABLE [dbo].[d_alueluokitus_historia]
ADD [hyvinvointialue] [nvarchar](255) NULL

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dbo].[d_alueluokitus_historia]') 
  AND name = 'hyvinvointialue_SV'
)
ALTER TABLE [dbo].[d_alueluokitus_historia]
ADD [hyvinvointialue_SV] [nvarchar](255) NULL

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dbo].[d_alueluokitus_historia]') 
  AND name = 'hyvinvointialue_EN'
)
ALTER TABLE [dbo].[d_alueluokitus_historia]
ADD [hyvinvointialue_EN] [nvarchar](255) NULL

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dbo].[d_alueluokitus_historia]') 
  AND name = 'jarjestys_hyvinvointialue'
)
ALTER TABLE [dbo].[d_alueluokitus_historia]
ADD [jarjestys_hyvinvointialue] [nvarchar](10) NULL

