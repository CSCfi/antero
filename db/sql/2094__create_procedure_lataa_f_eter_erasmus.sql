USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_erasmus]    Script Date: 5.2.2019  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
ETER erasmus lataus SA-tauluista
5.2.2019
JKO
*/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_eter_erasmus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_eter_erasmus] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_eter_erasmus] AS

TRUNCATE TABLE dw.f_eter_erasmus

INSERT INTO dw.f_eter_erasmus (
	   [id]
      ,[Erasmus_code]
      ,[Erasmus_incoming_students_ISCED_5_value]
	  ,[Erasmus_incoming_students_ISCED_5_code]
      ,[Erasmus_incoming_students_ISCED_6_value]
	  ,[Erasmus_incoming_students_ISCED_6_code]
      ,[Erasmus_incoming_students_ISCED_7_value]
      ,[Erasmus_incoming_students_ISCED_7_code]
      ,[Erasmus_incoming_students_ISCED_8_value]
      ,[Erasmus_incoming_students_ISCED_8_code]
      ,[Erasmus_incoming_students_other_value]
      ,[Erasmus_incoming_students_other_code]
      ,[Erasmus_total_incoming_students_value]
      ,[Erasmus_total_incoming_students_code] 
      ,[Erasmus_outgoing_students_ISCED_5_value]
      ,[Erasmus_outgoing_students_ISCED_5_code]
      ,[Erasmus_outgoing_students_ISCED_6_value]
      ,[Erasmus_outgoing_students_ISCED_6_code]
      ,[Erasmus_outgoing_students_ISCED_7_value]
      ,[Erasmus_outgoing_students_ISCED_7_code]
      ,[Erasmus_outgoing_students_ISCED_8_value]
      ,[Erasmus_outgoing_students_ISCED_8_code]
      ,[Erasmus_outgoing_students_other_value]
      ,[Erasmus_outgoing_students_other_code]
      ,[Erasmus_total_outgoing_students_value]
      ,[Erasmus_total_outgoing_students_code]  
      ,[Erasmus_incoming_staff_value]
      ,[Erasmus_incoming_staff_code]
      ,[Erasmus_outgoing_staff_value]
      ,[Erasmus_outgoing_staff_code]
	  ,[Flag_Erasmus_data]
      ,[Notes_Erasmus_data]
      ,[Erasmus_credit_mobility_incoming_value]
      ,[Erasmus_credit_mobility_incoming_code]
	  ,[Erasmus_credit_mobility_incoming_flag]
      ,[Erasmus_credit_mobility_outgoing_value]
      ,[Erasmus_credit_mobility_outgoing_code]
	  ,[username]
      ,[Source]
      ,[Loadtime]

)
select 
	  [id]=sa.[_id]
      ,[Erasmus_code]=sa.[ERA.CODE]
      ,[Erasmus_incoming_students_ISCED_5_value]=sa.[ERA.INCOMING_STUDENTS_ISCED5.v]
	  ,[Erasmus_incoming_students_ISCED_5_code]=sa.[ERA.INCOMING_STUDENTS_ISCED5.code]
      ,[Erasmus_incoming_students_ISCED_6_value]=sa.[ERA.INCOMING_STUDENTS_ISCED6.v]
	  ,[Erasmus_incoming_students_ISCED_6_code]=sa.[ERA.INCOMING_STUDENTS_ISCED6.code]
      ,[Erasmus_incoming_students_ISCED_7_value]=sa.[ERA.INCOMING_STUDENTS_ISCED7.v]
      ,[Erasmus_incoming_students_ISCED_7_code]=sa.[ERA.INCOMING_STUDENTS_ISCED7.code]	  
      ,[Erasmus_incoming_students_ISCED_8_value]=sa.[ERA.INCOMING_STUDENTS_ISCED8.v]
      ,[Erasmus_incoming_students_ISCED_8_code]=sa.[ERA.INCOMING_STUDENTS_ISCED8.code]	  
      ,[Erasmus_incoming_students_other_value]=sa.[ERA.INCOMING_STUDENTS_OTHER.v]
      ,[Erasmus_incoming_students_other_code]=sa.[ERA.INCOMING_STUDENTS_OTHER.code]	  
      ,[Erasmus_total_incoming_students_value]=sa.[ERA.INCOMING_STUDENTS_TOT.v]
      ,[Erasmus_total_incoming_students_code]=sa.[ERA.INCOMING_STUDENTS_TOT.code]	  
      ,[Erasmus_outgoing_students_ISCED_5_value]=sa.[ERA.OUTGOING_STUDENTS_ISCED5.v]
      ,[Erasmus_outgoing_students_ISCED_5_code]=sa.[ERA.OUTGOING_STUDENTS_ISCED5.code]	  
      ,[Erasmus_outgoing_students_ISCED_6_value]=sa.[ERA.OUTGOING_STUDENTS_ISCED6.v]
      ,[Erasmus_outgoing_students_ISCED_6_code]=sa.[ERA.OUTGOING_STUDENTS_ISCED6.code]	  
      ,[Erasmus_outgoing_students_ISCED_7_value]=sa.[ERA.OUTGOING_STUDENTS_ISCED7.v]
      ,[Erasmus_outgoing_students_ISCED_7_code]=sa.[ERA.OUTGOING_STUDENTS_ISCED7.code]	  
      ,[Erasmus_outgoing_students_ISCED_8_value]=sa.[ERA.OUTGOING_STUDENTS_ISCED8.v]
      ,[Erasmus_outgoing_students_ISCED_8_code]=sa.[ERA.OUTGOING_STUDENTS_ISCED8.code]	  
      ,[Erasmus_outgoing_students_other_value]=sa.[ERA.OUTGOING_STUDENTS_OTHER.v]
      ,[Erasmus_outgoing_students_other_code]=sa.[ERA.OUTGOING_STUDENTS_OTHER.code]	  
      ,[Erasmus_total_outgoing_students_value]=sa.[ERA.OUTGOING_STUDENTS_TOT.v]
      ,[Erasmus_total_outgoing_students_code]=sa.[ERA.OUTGOING_STUDENTS_TOT.code]	  
      ,[Erasmus_incoming_staff_value]=sa.[ERA.INCOMING_STAFF.v]
      ,[Erasmus_incoming_staff_code]=sa.[ERA.INCOMING_STAFF.code]	  
      ,[Erasmus_outgoing_staff_value]=sa.[ERA.OUTGOING_STAFF.v]
      ,[Erasmus_outgoing_staff_code]=sa.[ERA.OUTGOING_STAFF.code]
	  ,[Flag_Erasmus_data]=sa.[ERA.FLAG]
      ,[Notes_Erasmus_data]=sa.[ERA.NOTES]      
      ,[Erasmus_credit_mobility_incoming_value]=sa.[ERA.CREDITMOBINCOMING.v]
      ,[Erasmus_credit_mobility_incoming_code]=sa.[ERA.CREDITMOBINCOMING.code]
	  ,[Erasmus_credit_mobility_incoming_flag]=[ERA.FLAGCREDITMOBINCOMING]      
      ,[Erasmus_credit_mobility_outgoing_value]=sa.[ERA.CREDITMOBOUTGOING.v]
      ,[Erasmus_credit_mobility_outgoing_code]=sa.[ERA.CREDITMOBOUTGOING.code]
	  ,sa.[username]
      ,sa.[Source]
      ,sa.[Loadtime]
 FROM [ANTERO].[sa].[sa_eter_erasmus] as sa

GO

USE [ANTERO]
 

