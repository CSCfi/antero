use VipunenTK
go

Drop table if exists dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
Select top 0 * into dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset 
from [dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
go