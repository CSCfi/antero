USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_expenditure]    Script Date: 4.2.2019 9:19:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
f_eter_expenditure information lataus SA-tauluista
25.2.2019
JKO
*/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_eter_expenditure]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_eter_expenditure] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_eter_expenditure] AS

TRUNCATE TABLE dw.f_eter_expenditure
INSERT INTO dw.f_eter_expenditure
(
	[_id]
      ,Personnel_expenditure_EURO_code
      ,Personnel_expenditure_EURO_value
      ,Personnel_expenditure_PPP_code
      ,Personnel_expenditure_PPP_value
      ,Personnel_expenditure_NC_code
      ,Personnel_expenditure_NC_value
      ,Non_personnel_expenditure_NC_code
      ,Non_personnel_expenditure_NC_value
      ,Non_personnel_expenditure_PPP_code
      ,Non_personnel_expenditure_PPP_value
      ,Non_personnel_expenditure_EURO_code
      ,Non_personnel_expenditure_EURO_value
      ,Flag_Expenditure_unclassified_value
      ,Flag_Expenditure_unclassified_record
      ,Expenditure_unclassified_EURO_code
      ,Expenditure_unclassified_EURO_value
      ,Expenditure_unclassified_NC_code
      ,Expenditure_unclassified_NC_value
      ,Expenditure_unclassified_PPP_code
      ,Expenditure_unclassified_PPP_value
      ,Capital_expenditure_NC_code
      ,Capital_expenditure_NC_value
      ,Capital_expenditure_PPP_code
      ,Capital_expenditure_PPP_value
      ,Capital_expenditure_EURO_code
      ,Capital_expenditure_EURO_value
      ,Notes_on_expenditure
      ,Total_Current_expenditure_PPP_code
      ,Total_Current_expenditure_PPP_value
      ,Total_Current_expenditure_EURO_code
      ,Total_Current_expenditure_EURO_value
      ,Total_Current_expenditure_NC_code
      ,Total_Current_expenditure_NC_value
      ,Flag_Capital_expenditure_value
      ,Flag_Capital_expenditure_record
      ,Flag_Personnel_expenditure_value
      ,Flag_Personnel_expenditure_record
      ,Flag_Non_personnel_expenditure_value
      ,Flag_Non_personnel_expenditure_record
      ,Flag_Total_current_expenditure_value
      ,Flag_Total_current_expenditure_record
      ,Accounting_system_of_capital_expenditure_code
      ,Accounting_system_of_capital_expenditure_value
      ,R_n_D_Expenditure_NC_code
      ,R_n_D_Expenditure_NC_value
      ,R_n_D_Expenditure_PPP_code
      ,R_n_D_Expenditure_PPP_value
      ,R_n_D_Expenditure_EURO_code
      ,R_n_D_Expenditure_EURO_value
      ,Flag_R_n_D_Expenditure_value
      ,Flag_R_n_D_Expenditure_record
      ,[username]
      ,[Source]
      ,[Loadtime]
)

SELECT
[_id]
      ,Personnel_expenditure_EURO_code=[EXP.CURRPERSON.EURO.code]
      ,Personnel_expenditure_EURO_value=[EXP.CURRPERSON.EURO.v]
      ,Personnel_expenditure_PPP_code=[EXP.CURRPERSON.PPP.code]
      ,Personnel_expenditure_PPP_value=[EXP.CURRPERSON.PPP.v]
      ,Personnel_expenditure_NC_code=[EXP.CURRPERSON.NC.code]
      ,Personnel_expenditure_NC_value=[EXP.CURRPERSON.NC.v]
      ,Non_personnel_expenditure_NC_code=[EXP.CURRNONPERSON.NC.code]
      ,Non_personnel_expenditure_NC_value=[EXP.CURRNONPERSON.NC.v]
      ,Non_personnel_expenditure_PPP_code=[EXP.CURRNONPERSON.PPP.code]
      ,Non_personnel_expenditure_PPP_value=[EXP.CURRNONPERSON.PPP.v]
      ,Non_personnel_expenditure_EURO_code=[EXP.CURRNONPERSON.EURO.code]
      ,Non_personnel_expenditure_EURO_value=[EXP.CURRNONPERSON.EURO.v]
      ,Flag_Expenditure_unclassified_value=[EXP.FLAGCURRUNCL.v]
      ,Flag_Expenditure_unclassified_record=[EXP.FLAGCURRUNCL.r]
      ,Expenditure_unclassified_EURO_code=[EXP.CURRUNCL.EURO.code]
      ,Expenditure_unclassified_EURO_value=[EXP.CURRUNCL.EURO.v]
      ,Expenditure_unclassified_NC_code=[EXP.CURRUNCL.NC.code]
      ,Expenditure_unclassified_NC_value=[EXP.CURRUNCL.NC.v]
      ,Expenditure_unclassified_PPP_code=[EXP.CURRUNCL.PPP.code]
      ,Expenditure_unclassified_PPP_value=[EXP.CURRUNCL.PPP.v]
      ,Capital_expenditure_NC_code=[EXP.CAPITAL.NC.code]
      ,Capital_expenditure_NC_value=[EXP.CAPITAL.NC.v]
      ,Capital_expenditure_PPP_code=[EXP.CAPITAL.PPP.code]
      ,Capital_expenditure_PPP_value=[EXP.CAPITAL.PPP.v]
      ,Capital_expenditure_EURO_code=[EXP.CAPITAL.EURO.code]
      ,Capital_expenditure_EURO_value=[EXP.CAPITAL.EURO.v]
      ,Notes_on_expenditure=[EXP.NOTES]
      ,Total_Current_expenditure_PPP_code=[EXP.CURRTOTAL.PPP.code]
      ,Total_Current_expenditure_PPP_value=[EXP.CURRTOTAL.PPP.v]
      ,Total_Current_expenditure_EURO_code=[EXP.CURRTOTAL.EURO.code]
      ,Total_Current_expenditure_EURO_value=[EXP.CURRTOTAL.EURO.v]
      ,Total_Current_expenditure_NC_code=[EXP.CURRTOTAL.NC.code]
      ,Total_Current_expenditure_NC_value=[EXP.CURRTOTAL.NC.v]
      ,Flag_Capital_expenditure_value=[EXP.FLAGCAPITAL.v]
      ,Flag_Capital_expenditure_record=[EXP.FLAGCAPITAL.r]
      ,Flag_Personnel_expenditure_value=[EXP.FLAGCURRPERSON.v]
      ,Flag_Personnel_expenditure_record=[EXP.FLAGCURRPERSON.r]
      ,Flag_Non_personnel_expenditure_value=[EXP.FLAGCURRNONPERSON.v]
      ,Flag_Non_personnel_expenditure_record=[EXP.FLAGCURRNONPERSON.r]
      ,Flag_Total_current_expenditure_value=[EXP.FLAGCURRTOTAL.v]
      ,Flag_Total_current_expenditure_record=[EXP.FLAGCURRTOTAL.r]
      ,Accounting_system_of_capital_expenditure_code=[EXP.ACCSYSTEM.code]
      ,Accounting_system_of_capital_expenditure_value=[EXP.ACCSYSTEM.v]
      ,R_n_D_Expenditure_NC_code=[RES.R_n_DEXP.NC.code]
      ,R_n_D_Expenditure_NC_value=[RES.R_n_DEXP.NC.v]
      ,R_n_D_Expenditure_PPP_code=[RES.R_n_DEXP.PPP.code]
      ,R_n_D_Expenditure_PPP_value=[RES.R_n_DEXP.PPP.v]
      ,R_n_D_Expenditure_EURO_code=[RES.R_n_DEXP.EURO.code]
      ,R_n_D_Expenditure_EURO_value=[RES.R_n_DEXP.EURO.v]
      ,Flag_R_n_D_Expenditure_value=[RES.FLAGR_n_DEXP.v]
      ,Flag_R_n_D_Expenditure_record=[RES.FLAGR_n_DEXP.r]
      ,[username]
      ,[Source]
      ,[Loadtime]
  FROM [ANTERO].[sa].[sa_eter_expenditure]

  
  
GO



USE [ANTERO]