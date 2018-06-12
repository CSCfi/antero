USE [VipunenTK_lisatiedot];
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' and TABLE_NAME='rahoituslahde') BEGIN

update [dbo].[rahoituslahde]
set    [rahoituslahde] = 'Lukukausimaksu' --old Lukukausimaksukokeilu
      ,[rahoituslahde_SV] = 'Terminsavgift' --old Experiment med terminsavgift
      ,[rahoituslahde_EN] = 'Tuition fee'  --old Tuition fee trial period
	  ,kommentti = 'CSC Teemu' --old CSC Jarmo
  where rahoituslahde_koodi = '5';
 
 END; 

USE [ANTERO]