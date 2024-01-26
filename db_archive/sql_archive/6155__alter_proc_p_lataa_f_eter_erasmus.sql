USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_erasmus]    Script Date: 27.4.2022 11:04:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_eter_erasmus] AS

TRUNCATE TABLE dw.f_eter_erasmus

INSERT INTO ANTERO.dw.f_eter_erasmus (
	   [ETER_ID]
      ,[Erasmus incoming students - ISCED 7]
      ,[Erasmus outgoing students - ISCED 6]
      ,[Erasmus incoming staff]
      ,[Erasmus incoming students - ISCED 8]
      ,[Erasmus outgoing students - ISCED 7]
      ,[Erasmus outgoing staff]
      ,[Erasmus incoming students - ISCED 6]
      ,[Erasmus incoming students (other)]
      ,[Erasmus outgoing students - ISCED 5]
      ,[Erasmus outgoing students - ISCED 8]
      ,[Erasmus total outgoing students]
      ,[Flag Erasmus data]
      ,[Erasmus incoming students - ISCED 5]
      ,[Erasmus total incoming students]
      ,[Erasmus outgoing students (other)]
      ,[Notes on Erasmus data]
      ,[username]
      ,[source]
      ,[loadtime])
SELECT
	   [ETER_ID]
      ,[Erasmus incoming students - ISCED 7]
      ,[Erasmus outgoing students - ISCED 6]
      ,[Erasmus incoming staff]
      ,[Erasmus incoming students - ISCED 8]
      ,[Erasmus outgoing students - ISCED 7]
      ,[Erasmus outgoing staff]
      ,[Erasmus incoming students - ISCED 6]
      ,[Erasmus incoming students (other)]
      ,[Erasmus outgoing students - ISCED 5]
      ,[Erasmus outgoing students - ISCED 8]
      ,[Erasmus total outgoing students]
      ,[Flag Erasmus data]
      ,[Erasmus incoming students - ISCED 5]
      ,[Erasmus total incoming students]
      ,[Erasmus outgoing students (other)]
      ,[Notes on Erasmus data]
	  ,SUSER_NAME()
	  ,'ETL: p_lataa_f_eter_erasmus' 
	  ,getdate()
FROM [ANTERO].[sa].[sa_eter_erasmus]



GO

USE [ANTERO]