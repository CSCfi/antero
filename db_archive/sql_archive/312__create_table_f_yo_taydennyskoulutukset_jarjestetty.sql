IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_taydennyskoulutukset_jarjestetty') BEGIN

CREATE TABLE [dw].[f_yo_taydennyskoulutukset_jarjestetty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NULL,
	[vuosi] [int] NULL,
	[jarjestettyjen_koulutusten_lkm] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

