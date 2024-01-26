/****** Script for SelectTopNRows command from SSMS  ******/
update [VipunenTK_lisatiedot].[dbo].[mitenna_ammatti]
set mitenna_ammatti = '7223 Koneenasettajat ja koneistajat'
where mitenna_ammatti = '7223 Koneenasentajat ja koneistajat'

update [VipunenTK_DW].[dbo].[d_mitenna_ammatti]
set mitenna_ammatti = '7223 Koneenasettajat ja koneistajat'
where mitenna_ammatti = '7223 Koneenasentajat ja koneistajat'

update [VipunenTK].[dbo].[d_mitenna_ammatti]
set mitenna_ammatti = '7223 Koneenasettajat ja koneistajat'
where mitenna_ammatti = '7223 Koneenasentajat ja koneistajat'