IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.d_toiminto') AND type in (N'U'))
BEGIN
CREATE TABLE dbo.d_toiminto(
	id int IDENTITY(1,1) NOT NULL,
	toiminto nvarchar(30) NOT NULL,
	loadtime datetime NOT NULL,
	source nvarchar(100) NOT NULL,
	username nvarchar(30) NOT NULL,
 CONSTRAINT PK_d_toiminto PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.DF__d_toiminto__loadtime__5224328E') AND type = 'D')
BEGIN
ALTER TABLE dbo.d_toiminto ADD  CONSTRAINT DF__d_toiminto__loadtime__5224328E  DEFAULT (getdate()) FOR loadtime
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.DF__d_toiminto__username__531856C7') AND type = 'D')
BEGIN
ALTER TABLE dbo.d_toiminto ADD  CONSTRAINT DF__d_toiminto__username__531856C7  DEFAULT (suser_sname()) FOR username
END