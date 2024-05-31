USE [ANTERO] GO
UPDATE [ANTERO].[dw].[d_vuosiluokka_tai_koulutus] SET 
      [vuosiluokka_sv]='Undervisning som förebereder för den grundläggande utbildningen'
	 ,[vuosiluokkaryhma_sv]='Undervisning som förebereder för den grundläggande utbildningen'
      ,[koulutus_sv]='Undervisning som förebereder för den grundläggande utbildningen'
	WHERE vuosiluokka_sv='Undervisning som förebereder för den grundläggande utbildning'
