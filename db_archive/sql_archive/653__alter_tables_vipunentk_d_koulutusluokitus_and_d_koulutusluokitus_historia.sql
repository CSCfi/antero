USE [VipunenTK]

ALTER TABLE [dbo].[d_koulutusluokitus_historia] ALTER COLUMN [koulutuslyhyt] [nvarchar](50) NULL;
ALTER TABLE [dbo].[d_koulutusluokitus_historia] ALTER COLUMN [koulutuslyhyt_SV] [nvarchar](50) NULL;
ALTER TABLE [dbo].[d_koulutusluokitus_historia] ALTER COLUMN [koulutuslyhyt_EN] [nvarchar](50) NULL;
ALTER TABLE [dbo].[d_koulutusluokitus_historia] ALTER COLUMN [koulutusala_koodi] [nvarchar](2) NULL;
ALTER TABLE [dbo].[d_koulutusluokitus_historia] ALTER COLUMN [koulutusaste_koodi] [nvarchar](2) NULL;



ALTER TABLE [dbo].[d_koulutusluokitus] ALTER COLUMN [koulutuslyhyt] [nvarchar](50) NULL;
ALTER TABLE [dbo].[d_koulutusluokitus] ALTER COLUMN	[koulutuslyhyt_SV] [nvarchar](50) NULL;
ALTER TABLE [dbo].[d_koulutusluokitus] ALTER COLUMN	[koulutuslyhyt_EN] [nvarchar](50) NULL;
ALTER TABLE [dbo].[d_koulutusluokitus] ALTER COLUMN	[koulutusala_koodi] [nvarchar](2) NULL;
ALTER TABLE [dbo].[d_koulutusluokitus] ALTER COLUMN	[koulutusala] [nvarchar](255) NULL;
ALTER TABLE [dbo].[d_koulutusluokitus] ALTER COLUMN	[koulutusala_SV] [nvarchar](255) NULL;
ALTER TABLE [dbo].[d_koulutusluokitus] ALTER COLUMN	[koulutusala_EN] [nvarchar](255) NULL;
ALTER TABLE [dbo].[d_koulutusluokitus] ALTER COLUMN	[koulutusaste_koodi] [nvarchar](2) NULL;

USE [ANTERO]