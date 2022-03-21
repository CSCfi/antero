use antero
go

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dbo].[tabularprocess]') 
         AND name = 'Aloitusaika'
)

BEGIN
	ALTER TABLE [dbo].[tabularprocess] 
	ADD Aloitusaika [datetime] NULL
	,Lopetusaika [datetime] NULL
	,Kesto [time](0) NULL
	,Virhe [nvarchar](4000) NULL
END