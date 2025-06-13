USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_9_Vaestorakenne_kunnittain]    Script Date: 13.6.2025 10.34.25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dbo].[v_sa_4_9_Vaestorakenne_kunnittain] AS

-- truncate table vipunentk_dw..sa_4_9_Vaestorakenne_kunnittain
-- insert into vipunentk_dw..sa_4_9_Vaestorakenne_kunnittain select * from v_sa_4_9_Vaestorakenne_kunnittain

SELECT
	 tilv = cast(kaikkivuodet.tilv as varchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,sp = cast(kaikkivuodet.sp as varchar(1))
	,tilvaskun = cast(kaikkivuodet.tilvaskun as varchar(3))
	,aikielir2 = cast(kaikkivuodet.aikielir2 as varchar(2))
	,kansalr1 = cast(kaikkivuodet.kansalr1 as varchar(1))
	,mosa = cast(kaikkivuodet.mosa as varchar(1))
	,pohjmaa = cast(kaikkivuodet.pohjmaa as varchar(1))
	,eumaa = cast(kaikkivuodet.eumaa as varchar(1))
	,etamaa = cast(kaikkivuodet.etamaa as varchar(1))
	,ika0 = cast(kaikkivuodet.ika0 as int)
	,ika1 = cast(kaikkivuodet.ika1 as int)
	,ika2 = cast(kaikkivuodet.ika2 as int)
	,ika3 = cast(kaikkivuodet.ika3 as int)
	,ika4 = cast(kaikkivuodet.ika4 as int)
	,ika5 = cast(kaikkivuodet.ika5 as int)
	,ika6 = cast(kaikkivuodet.ika6 as int)
	,ika7 = cast(kaikkivuodet.ika7 as int)
	,ika8 = cast(kaikkivuodet.ika8 as int)
	,ika9 = cast(kaikkivuodet.ika9 as int)
	,ika10 = cast(kaikkivuodet.ika10 as int)
	,ika11 = cast(kaikkivuodet.ika11 as int)
	,ika12 = cast(kaikkivuodet.ika12 as int)
	,ika13 = cast(kaikkivuodet.ika13 as int)
	,ika14 = cast(kaikkivuodet.ika14 as int)
	,ika15 = cast(kaikkivuodet.ika15 as int)
	,ika16 = cast(kaikkivuodet.ika16 as int)
	,ika17 = cast(kaikkivuodet.ika17 as int)
	,ika18 = cast(kaikkivuodet.ika18 as int)
	,ika19 = cast(kaikkivuodet.ika19 as int)
	,ika20 = cast(kaikkivuodet.ika20 as int)
	,ika21 = cast(kaikkivuodet.ika21 as int)
	,ika22 = cast(kaikkivuodet.ika22 as int)
	,ika23 = cast(kaikkivuodet.ika23 as int)
	,ika24 = cast(kaikkivuodet.ika24 as int)
	,ika25 = cast(kaikkivuodet.ika25 as int)
	,ika26 = cast(kaikkivuodet.ika26 as int)
	,ika27 = cast(kaikkivuodet.ika27 as int)
	,ika28 = cast(kaikkivuodet.ika28 as int)
	,ika29 = cast(kaikkivuodet.ika29 as int)
	,ika30 = cast(kaikkivuodet.ika30 as int)
	,ika31 = cast(kaikkivuodet.ika31 as int)
	,ika32 = cast(kaikkivuodet.ika32 as int)
	,ika33 = cast(kaikkivuodet.ika33 as int)
	,ika34 = cast(kaikkivuodet.ika34 as int)
	,ika35 = cast(kaikkivuodet.ika35 as int)
	,ika36 = cast(kaikkivuodet.ika36 as int)
	,ika37 = cast(kaikkivuodet.ika37 as int)
	,ika38 = cast(kaikkivuodet.ika38 as int)
	,ika39 = cast(kaikkivuodet.ika39 as int)
	,ika40 = cast(kaikkivuodet.ika40 as int)
	,ika41 = cast(kaikkivuodet.ika41 as int)
	,ika42 = cast(kaikkivuodet.ika42 as int)
	,ika43 = cast(kaikkivuodet.ika43 as int)
	,ika44 = cast(kaikkivuodet.ika44 as int)
	,ika45 = cast(kaikkivuodet.ika45 as int)
	,ika46 = cast(kaikkivuodet.ika46 as int)
	,ika47 = cast(kaikkivuodet.ika47 as int)
	,ika48 = cast(kaikkivuodet.ika48 as int)
	,ika49 = cast(kaikkivuodet.ika49 as int)
	,ika50 = cast(kaikkivuodet.ika50 as int)
	,ika51 = cast(kaikkivuodet.ika51 as int)
	,ika52 = cast(kaikkivuodet.ika52 as int)
	,ika53 = cast(kaikkivuodet.ika53 as int)
	,ika54 = cast(kaikkivuodet.ika54 as int)
	,ika55 = cast(kaikkivuodet.ika55 as int)
	,ika56 = cast(kaikkivuodet.ika56 as int)
	,ika57 = cast(kaikkivuodet.ika57 as int)
	,ika58 = cast(kaikkivuodet.ika58 as int)
	,ika59 = cast(kaikkivuodet.ika59 as int)
	,ika60 = cast(kaikkivuodet.ika60 as int)
	,ika61 = cast(kaikkivuodet.ika61 as int)
	,ika62 = cast(kaikkivuodet.ika62 as int)
	,ika63 = cast(kaikkivuodet.ika63 as int)
	,ika64 = cast(kaikkivuodet.ika64 as int)
	,ika65 = cast(kaikkivuodet.ika65 as int)
	,ika66 = cast(kaikkivuodet.ika66 as int)
	,ika67 = cast(kaikkivuodet.ika67 as int)
	,ika68 = cast(kaikkivuodet.ika68 as int)
	,ika69 = cast(kaikkivuodet.ika69 as int)
	,ika70 = cast(kaikkivuodet.ika70 as int)
	,ika71 = cast(kaikkivuodet.ika71 as int)
	,ika72 = cast(kaikkivuodet.ika72 as int)
	,ika73 = cast(kaikkivuodet.ika73 as int)
	,ika74 = cast(kaikkivuodet.ika74 as int)
	,ika75 = cast(kaikkivuodet.ika75 as int)
	,ika76 = cast(kaikkivuodet.ika76 as int)
	,ika77 = cast(kaikkivuodet.ika77 as int)
	,ika78 = cast(kaikkivuodet.ika78 as int)
	,ika79 = cast(kaikkivuodet.ika79 as int)
	,ika80 = cast(kaikkivuodet.ika80 as int)
	,ika81 = cast(kaikkivuodet.ika81 as int)
	,ika82 = cast(kaikkivuodet.ika82 as int)
	,ika83 = cast(kaikkivuodet.ika83 as int)
	,ika84 = cast(kaikkivuodet.ika84 as int)
	,ika85 = cast(kaikkivuodet.ika85 as int)
	,ika86 = cast(kaikkivuodet.ika86 as int)
	,ika87 = cast(kaikkivuodet.ika87 as int)
	,ika88 = cast(kaikkivuodet.ika88 as int)
	,ika89 = cast(kaikkivuodet.ika89 as int)
	,ika90 = cast(kaikkivuodet.ika90 as int)
	,ika91 = cast(kaikkivuodet.ika91 as int)
	,ika92 = cast(kaikkivuodet.ika92 as int)
	,ika93 = cast(kaikkivuodet.ika93 as int)
	,ika94 = cast(kaikkivuodet.ika94 as int)
	,ika95 = cast(kaikkivuodet.ika95 as int)
	,ika96 = cast(kaikkivuodet.ika96 as int)
	,ika97 = cast(kaikkivuodet.ika97 as int)
	,ika98 = cast(kaikkivuodet.ika98 as int)
	,ika99 = cast(kaikkivuodet.ika99 as int)
	,ika100_ = cast(kaikkivuodet.ika100_ as int)
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_11]
UNION ALL
	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_12]

UNION ALL
	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_13]

UNION ALL
	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_14]

UNION ALL
	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_15]

UNION ALL
	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_16]

UNION ALL
	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_17]

UNION ALL

SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_18]

UNION ALL

SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_19'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_9_sopv_19]

UNION ALL

SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_20'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_9_sopv_20]

UNION ALL

SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_21'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_9_sopv_21]

UNION ALL

SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_22'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_9_sopv_22]

UNION ALL

SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_23'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_9_sopv_23]

UNION ALL

SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_24'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_9_sopv_24]

UNION ALL

SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]='4_9_sopv_25'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_9_sopv_25]

) as kaikkivuodet

GO


