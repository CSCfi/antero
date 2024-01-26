/****** Script for SelectTopNRows command from SSMS  ******/
use antero
go

if not exists (
	select * from sys.tables t 
	join sys.schemas s on (t.schema_id = s.schema_id) 
	where s.name = 'dw' and t.name = 'd_koulutusluokitus_temp_JS'
)
begin

	SELECT d.[id]
		,[koulutusluokitus_avain]
		,[koulutusluokitus_koodi]
		,[koulutusluokitus_fi]
		,[koulutusluokitus_sv]
		,[koulutusluokitus_en]
		,[koulutusastetaso1_koodi]
		,[koulutusastetaso1_fi]
		,[koulutusastetaso1_sv]
		,[koulutusastetaso1_en]
		,[koulutusastetaso2_koodi]
		,[koulutusastetaso2_fi]
		,[koulutusastetaso2_sv]
		,[koulutusastetaso2_en]
		,[koulutusalataso1_koodi]
		,[koulutusalataso1_fi]
		,[koulutusalataso1_sv]
		,[koulutusalataso1_en]
		,[koulutusalataso2_koodi]
		,[koulutusalataso2_fi]
		,[koulutusalataso2_sv]
		,[koulutusalataso2_en]
		,[koulutusalataso3_koodi]
		,[koulutusalataso3_fi]
		,[koulutusalataso3_sv]
		,[koulutusalataso3_en]
		,[okmohjauksenala_koodi]
		,[okmohjauksenala_fi]
		,[okmohjauksenala_sv]
		,[okmohjauksenala_en]
		,[koulutusaste2002_koodi]
		,[koulutusaste2002_fi]
		,[koulutusaste2002_sv]
		,[koulutusaste2002_en]
		,[koulutusala2002_koodi]
		,[koulutusala2002_fi]
		,[koulutusala2002_sv]
		,[koulutusala2002_en]
		,[opintoala2002_koodi]
		,[opintoala2002_fi]
		,[opintoala2002_sv]
		,[opintoala2002_en]
		,[opintoala1995_koodi]
		,[opintoala1995_fi]
		,[opintoala1995_sv]
		,[opintoala1995_en]
		,[koulutussektori_koodi]
		,[koulutussektori_fi]
		,[koulutussektori_sv]
		,[koulutussektori_en]
		,[tutkintotyyppi_koodi]
		,[tutkintotyyppi_fi]
		,[tutkintotyyppi_sv]
		,[tutkintotyyppi_en]
		,[tutkintotyypin_ryhma_koodi]
		,[tutkintotyypin_ryhma_fi]
		,[tutkintotyypin_ryhma_sv]
		,[tutkintotyypin_ryhma_en]
		,[uusi_eat_koodi]
		,sa.koulutustyyppikoodi as koulutustyyppi_koodi
		,d.[source]
		
	into [dw].[d_koulutusluokitus_temp_JS]
	
	from [dw].[d_koulutusluokitus] d 
	left join [sa].[sa_koulutusluokitus] sa on sa.koodi = d.koulutusluokitus_koodi

end
