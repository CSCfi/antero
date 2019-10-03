IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_arvokyselykerta') BEGIN

CREATE TABLE [dw].[d_arvokyselykerta](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [loadtime] [datetime] NOT NULL,
  [source] [varchar](100) NOT NULL,
  [username] [varchar](30) NOT NULL,
  [kyselykertaid] [int] NOT NULL,
  [kyselykerta] [nvarchar](max) NOT NULL,
  [kyselyid] [int] NOT NULL,
  [kysely_fi] [nvarchar](500) NOT NULL,
  [kysely_sv] [nvarchar](500) NULL,
  [kysely_en] [nvarchar](500) NULL,
  [kyselypohja] [nvarchar](500) NOT NULL,
  [vuosi] [int] NOT NULL,
 CONSTRAINT [PK__d_arvokyselykerta] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)
) 

ALTER TABLE [dw].[d_arvokyselykerta] ADD  CONSTRAINT [DF__d_arvokyselykerta__loadtime]  DEFAULT (getdate()) FOR [loadtime]


ALTER TABLE [dw].[d_arvokyselykerta] ADD  CONSTRAINT [DF__d_arvokyselykerta__username]  DEFAULT (suser_sname()) FOR [username]

end



