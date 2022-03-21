
USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_eter_expenditure')
BEGIN
	DROP TABLE [dw].[f_eter_expenditure];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_eter_expenditure')
BEGIN
CREATE TABLE [dw].[f_eter_expenditure](	
	[_id][varchar](24) NOT NULL,
      Personnel_expenditure_EURO_code [nvarchar](20) NULL,
      Personnel_expenditure_EURO_value [nvarchar](20) NULL,
      Personnel_expenditure_PPP_code [nvarchar](20) NULL,
      Personnel_expenditure_PPP_value [nvarchar](20) NULL,
      Personnel_expenditure_NC_code [nvarchar](20) NULL,
      Personnel_expenditure_NC_value [nvarchar](20) NULL,
      Non_personnel_expenditure_NC_code [nvarchar](20) NULL,
      Non_personnel_expenditure_NC_value [nvarchar](20) NULL,
      Non_personnel_expenditure_PPP_code [nvarchar](20) NULL,
      Non_personnel_expenditure_PPP_value [nvarchar](20) NULL,
      Non_personnel_expenditure_EURO_code [nvarchar](20) NULL,
      Non_personnel_expenditure_EURO_value [nvarchar](20) NULL,
      Flag_Expenditure_unclassified_value [nvarchar](20) NULL,
      Flag_Expenditure_unclassified_record [nvarchar](20) NULL,
      Expenditure_unclassified_EURO_code [nvarchar](20) NULL,
      Expenditure_unclassified_EURO_value [nvarchar](20) NULL,
      Expenditure_unclassified_NC_code [nvarchar](20) NULL,
      Expenditure_unclassified_NC_value [nvarchar](20) NULL,
      Expenditure_unclassified_PPP_code [nvarchar](20) NULL,
      Expenditure_unclassified_PPP_value [nvarchar](20) NULL,
      Capital_expenditure_NC_code [nvarchar](20) NULL,
      Capital_expenditure_NC_value [nvarchar](20) NULL,
      Capital_expenditure_PPP_code [nvarchar](20) NULL,
      Capital_expenditure_PPP_value [nvarchar](20) NULL,
      Capital_expenditure_EURO_code [nvarchar](20) NULL,
      Capital_expenditure_EURO_value [nvarchar](20) NULL,
      Notes_on_expenditure [nvarchar](300) NULL,
      Total_Current_expenditure_PPP_code [nvarchar](20) NULL,
      Total_Current_expenditure_PPP_value [nvarchar](20) NULL,
      Total_Current_expenditure_EURO_code [nvarchar](20) NULL,
      Total_Current_expenditure_EURO_value [nvarchar](20) NULL,
      Total_Current_expenditure_NC_code [nvarchar](20) NULL,
      Total_Current_expenditure_NC_value [nvarchar](20) NULL,
      Flag_Capital_expenditure_value [nvarchar](20) NULL,
      Flag_Capital_expenditure_record [nvarchar](20) NULL,
      Flag_Personnel_expenditure_value [nvarchar](50) NULL,
      Flag_Personnel_expenditure_record [nvarchar](20) NULL,
      Flag_Non_personnel_expenditure_value [nvarchar](20) NULL,
      Flag_Non_personnel_expenditure_record [nvarchar](20) NULL,
      Flag_Total_current_expenditure_value [nvarchar](20) NULL,
      Flag_Total_current_expenditure_record [nvarchar](20) NULL,
      Accounting_system_of_capital_expenditure_code [nvarchar](20) NULL,
      Accounting_system_of_capital_expenditure_value [nvarchar](20) NULL,
      R_n_D_Expenditure_NC_code [nvarchar](20) NULL,
      R_n_D_Expenditure_NC_value [nvarchar](20) NULL,
      R_n_D_Expenditure_PPP_code [nvarchar](20) NULL,
      R_n_D_Expenditure_PPP_value [nvarchar](20) NULL,
      R_n_D_Expenditure_EURO_code [nvarchar](20) NULL,
      R_n_D_Expenditure_EURO_value [nvarchar](20) NULL,
      Flag_R_n_D_Expenditure_value [nvarchar](20) NULL,
      Flag_R_n_D_Expenditure_record [nvarchar](20) NULL,
      [username] [varchar](100) NULL,
	  [Source] [varchar](100) NULL,
	  [Loadtime] [datetime] NULL,
	   CONSTRAINT [PK__f_eter_expenditure] PRIMARY KEY CLUSTERED
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
USE [ANTERO]