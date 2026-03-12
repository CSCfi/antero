USE ANTERO
DROP TABLE IF EXISTS [ANTERO].[sa].[sa_virta_otp_rekrytohtorit]


SELECT
       [henkilonumero]
      ,[rekrykorkeakoulu]
      ,[tilastovuosi]
      ,[tohtoritutkintokorkeakoulu]
      ,[tohtoritutkintomaa]
      ,[tohtoritutkintosuoritusvuosi]
      ,[loadtime]
      ,[source]
      ,[username]
      ,[tohtoritutkintokoulutuskoodi]
      ,[maisterintutkintokorkeakoulu]
      ,[maisterintutkintokoulutuskoodi]
      ,[maisterintutkintosuoritusvuosi]
      ,[opettajapatevyyskorkeakoulu]
      ,[opettajapatevyyskoodi]
      ,[opettajapatevyyssuoritusvuosi]
      ,[rekrytointitiedonkeruussa]
INTO [ANTERO].[sa].[sa_virta_otp_rekrytohtorit]
FROM [VirtaSiirto].[sa].[sa_virta_otp_rekrytohtorit]
