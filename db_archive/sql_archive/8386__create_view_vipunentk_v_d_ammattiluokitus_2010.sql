USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_d_ammattiluokitus_2010]    Script Date: 14.12.2023 10:45:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dbo].[v_d_ammattiluokitus_2010]
AS
SELECT 
   id
  ,alkaa
  ,paattyy
  ,[ammattiluokitus_2010_avain]
  ,case len([ammattiluokitus_2010_avain])
        when 4 then [ammattiluokitus_2010_4_taso]
        when 5 then [ammattiluokitus_2010_5_taso]
        when 3 then [ammattiluokitus_2010_3_taso]
        when 2 then [ammattiluokitus_2010_2_taso]
        when 1 then [ammattiluokitus_2010_paataso]
   end as ammattiluokitus_2010
  ,case len([ammattiluokitus_2010_avain])
         when 4 then [ammattiluokitus_2010_4_taso_SV]
         when 5 then [ammattiluokitus_2010_5_taso_SV]
         when 3 then [ammattiluokitus_2010_3_taso_SV]
         when 2 then [ammattiluokitus_2010_2_taso_SV]
         when 1 then [ammattiluokitus_2010_paataso_SV]
   end as ammattiluokitus_2010_SV
  ,case len([ammattiluokitus_2010_avain])
        when 4 then [ammattiluokitus_2010_4_taso_EN]
        when 5 then [ammattiluokitus_2010_5_taso_EN]
        when 3 then [ammattiluokitus_2010_3_taso_EN]
        when 2 then [ammattiluokitus_2010_2_taso_EN]
        when 1 then [ammattiluokitus_2010_paataso_EN]
  end as ammattiluokitus_2010_EN
 ,case when [ammattiluokitus_2010_avain] != '-1' then [ammattiluokitus_2010_avain] else   '999999'  end as ammattiluokitus_2010_jarjestys
FROM [dbo].[d_ammattiluokitus_2010]


GO


