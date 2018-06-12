USE [VipunenTK_lisatiedot]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rahoituslahde]') AND type in (N'U'))

update [dbo].[rahoituslahde]
set     [rahoituslahde] = 'Lukukausimaksu' --old Lukukausimaksukokeilu
      ,[rahoituslahde_SV] = 'Terminsavgift' --old Experiment med terminsavgift
      ,[rahoituslahde_EN] = 'Tuition fee'  --old Tuition fee trial period
	  ,kommentti = 'CSC Teemu' --old CSC Jarmo
  where rahoituslahde_koodi = '5'
 
  GO 

USE ANTERO
