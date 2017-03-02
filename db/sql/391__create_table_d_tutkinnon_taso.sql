IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_tutkinnon_taso') 
BEGIN

CREATE TABLE [dw].[d_tutkinnon_taso](
	[id] [int] PRIMARY KEY IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL
);

ALTER TABLE [dw].[d_tutkinnon_taso] ADD  CONSTRAINT [DF_d_tutkinnon_taso_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_tutkinnon_taso] ADD  CONSTRAINT [DF_d_tutkinnon_taso_username]  DEFAULT (suser_sname()) FOR [username]
;

END