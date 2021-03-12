USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_indikaattorit_oppivelvolliset]    Script Date: 3.3.2021 14:43:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_tab_indikaattorit_oppivelvolliset] AS

Select 
[tilastointivuosi] as Tilastovuosi2
,case d9.sukupuoli when 'Mies' then 'Pojat' when 'Nainen' then 'Tytöt' else 'Tuntematon' end as "Sukupuoli"
--jarjestysmuuttujat
,d9.jarjestys
--ruotsi
,[tilastointivuosi] as Statistikår2
,case d9.sukupuoli_SV when 'Man' then 'Pojkar' when 'Kvinna' then 'Flickor' else 'Information saknas' end as "Kön"
--englanti
,[tilastointivuosi] as "Statistical year2"
,case d9.sukupuoli_EN when 'Male' then 'Boys' when 'Female' then 'Girls' else 'Missing data' end as "Gender"
--Lukumäärämuuttujat
,[opiskelijat] as opisk2
,[tutkinnot] as tutk2
,[tod]
,[ilmtod]
,[kelaim]
,[tutkt]
,[suor10]
,[opiskelijat_1_9_luokka]
,[opiskelijat_1_10_luokka]
,[tutkinnot_9_luokka]

FROM dbo.f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk

	JOIN d_sukupuoli d9 ON d9.id = sukupuoli_id

WHERE [tilastointivuosi] > '2010'





GO


use antero