USE [ANTERO]
GO

IF NOT EXISTS (
	SELECT * FROM [dw].[d_vuosiluokka_tai_koulutus] 
	WHERE koodi = 'x'
)
BEGIN

	SET IDENTITY_INSERT [dw].[d_vuosiluokka_tai_koulutus] ON

	INSERT [dw].[d_vuosiluokka_tai_koulutus] (
		[id]
		,[koodi]
		,[vuosiluokka_fi]
		,[vuosiluokka_sv]
		,[vuosiluokka_en]
		,[vuosiluokkaryhma_fi]
		,[vuosiluokkaryhma_sv]
		,[vuosiluokkaryhma_en]
		,[koulutus_fi]
		,[koulutus_sv]
		,[koulutus_en]
		,[jarjestys_vuosiluokka]
		,[jarjestys_vuosiluokkaryhma]
		,[jarjestys_koulutus]
		,[kommentti]
	) 
	VALUES (
		43
		,N'x'
		,N'Perusopetuksen oppimäärä (vuosiluokka ei tiedossa)'
		,N'Lärokursen för den grundläggande utbildningen (okänd årskurs)'
		,N'Basic education syllabus (unknown grade)'
		,N'Perusopetuksen oppimäärä (vuosiluokka ei tiedossa)'
		,N'Lärokursen för den grundläggande utbildningen (okänd årskurs)'
		,N'Basic education syllabus (unknown grade)'
		,N'Perusopetus'
		,N'Grundläggande utbildning'
		,N'Basic education'
		,31
		,31
		,31
		,N'manuell'
	)

	SET IDENTITY_INSERT [dw].[d_vuosiluokka_tai_koulutus] OFF
	
END

GO
