USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_18_Paivahoidossa_jarjestettava_esiopetus]    Script Date: 6.10.2025 10.52.29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER VIEW [dbo].[v_sa_2_18_Paivahoidossa_jarjestettava_esiopetus] AS

SELECT [tilv]
      ,[jarjnim]
      ,[jarj]
      ,[tiedtype]
	  ,vkieli = NULL
      ,[popy]
	  ,[popyn] = NULL
      ,[jmamu]
      ,[psisa]
      ,[jmamusisa]
      ,[pteho]
      ,[pertu]
      ,[pertuv]
      ,[pertum]
      ,[ptehoerop]
      ,[pviertu]
      ,[pviertuv]
      ,[pviertum]
      ,[pvimuut]
      ,[pviop]
      ,[pkuertu]
      ,[pkuertuv]
      ,[pkuertum]
      ,[pkumuut]
      ,[pkuop]
      ,[ppid5v]
      ,[pmuu5v]
      ,[pop5v]
      ,[apip1]
      ,[apip2]
      ,[apip39]
      ,[apipy]
      ,[oma3s]
      ,[osto3s]
      ,[avust3s]
      ,[syk3s]
      ,[oma4s]
      ,[osto4s]
      ,[avust4s]
      ,[syk4s]
      ,[omams]
      ,[ostoms]
      ,[avustms]
      ,[sykms]
      ,[omays]
      ,[ostoys]
      ,[avustys]
      ,[sykys]
      ,[oma3k]
      ,[osto3k]
      ,[avust3k]
      ,[kev3k]
      ,[oma4k]
      ,[osto4k]
      ,[avust4k]
      ,[kev4k]
      ,[omamk]
      ,[ostomk]
      ,[avustmk]
      ,[kevmk]
      ,[omayk]
      ,[ostoyk]
      ,[avustyk]
      ,[kevyk]
      ,[pesis]
      ,[pesisjarjnim]
      ,[pesisjarj]
      ,[kesis]
      ,[kesisjarjnim]
      ,[kesisjarj]
      ,[perops]
      ,[peropsjarjnim]
      ,[peropsjarj]
      ,[apips]
      ,[apipsjarjnim]
      ,[apipsjarj]
      ,[luontipvm]
      ,[jmamun] = NULL
      ,[jmamuy] = NULL
      ,[jmamuyn] = NULL
      ,[jmamusisay] = NULL
      ,[jmamueo8] = NULL
      ,[jmamueo8n] = NULL
      ,[jmamueo4] = NULL
      ,[jmamueo4n] = NULL
FROM [TK_H9098_CSC]..[TK_2_18_sopv_12]
UNION ALL
SELECT [tilv]
      ,[jarjnim]
      ,[jarj]
      ,[tiedtype]
	  ,vkieli = NULL
      ,[popy]
	  ,[popyn] = NULL
      ,[jmamu]
      ,[psisa]
      ,[jmamusisa]
      ,[pteho]
      ,[pertu]
      ,[pertuv]
      ,[pertum]
      ,[ptehoerop]
      ,[pviertu]
      ,[pviertuv]
      ,[pviertum]
      ,[pvimuut]
      ,[pviop]
      ,[pkuertu]
      ,[pkuertuv]
      ,[pkuertum]
      ,[pkumuut]
      ,[pkuop]
      ,[ppid5v]
      ,[pmuu5v]
      ,[pop5v]
      ,[apip1]
      ,[apip2]
      ,[apip39]
      ,[apipy]
      ,[oma3s]
      ,[osto3s]
      ,[avust3s]
      ,[syk3s]
      ,[oma4s]
      ,[osto4s]
      ,[avust4s]
      ,[syk4s]
      ,[omams]
      ,[ostoms]
      ,[avustms]
      ,[sykms]
      ,[omays]
      ,[ostoys]
      ,[avustys]
      ,[sykys]
      ,[oma3k]
      ,[osto3k]
      ,[avust3k]
      ,[kev3k]
      ,[oma4k]
      ,[osto4k]
      ,[avust4k]
      ,[kev4k]
      ,[omamk]
      ,[ostomk]
      ,[avustmk]
      ,[kevmk]
      ,[omayk]
      ,[ostoyk]
      ,[avustyk]
      ,[kevyk]
      ,[pesis]
      ,[pesisjarjnim]
      ,[pesisjarj]
      ,[kesis]
      ,[kesisjarjnim]
      ,[kesisjarj]
      ,[perops]
      ,[peropsjarjnim]
      ,[peropsjarj]
      ,[apips]
      ,[apipsjarjnim]
      ,[apipsjarj]
      ,[luontipvm]
      ,[jmamun] = NULL
      ,[jmamuy] = NULL
      ,[jmamuyn] = NULL
      ,[jmamusisay] = NULL
      ,[jmamueo8] = NULL
      ,[jmamueo8n] = NULL
      ,[jmamueo4] = NULL
      ,[jmamueo4n] = NULL
FROM [TK_H9098_CSC]..[TK_2_18_sopv_13]
UNION ALL
SELECT [tilv]
      ,[jarjnim]
      ,[jarj]
      ,[tiedtype]
	  ,vkieli = NULL
      ,[popy]
	  ,[popyn] = NULL
      ,[jmamu]
      ,[psisa]
      ,[jmamusisa]
      ,[pteho]
      ,[pertu]
      ,[pertuv]
      ,[pertum]
      ,[ptehoerop]
      ,[pviertu]
      ,[pviertuv]
      ,[pviertum]
      ,[pvimuut]
      ,[pviop]
      ,[pkuertu]
      ,[pkuertuv]
      ,[pkuertum]
      ,[pkumuut]
      ,[pkuop]
      ,[ppid5v]
      ,[pmuu5v]
      ,[pop5v]
      ,[apip1]
      ,[apip2]
      ,[apip39]
      ,[apipy]
      ,[oma3s]
      ,[osto3s]
      ,[avust3s]
      ,[syk3s]
      ,[oma4s]
      ,[osto4s]
      ,[avust4s]
      ,[syk4s]
      ,[omams]
      ,[ostoms]
      ,[avustms]
      ,[sykms]
      ,[omays]
      ,[ostoys]
      ,[avustys]
      ,[sykys]
      ,[oma3k]
      ,[osto3k]
      ,[avust3k]
      ,[kev3k]
      ,[oma4k]
      ,[osto4k]
      ,[avust4k]
      ,[kev4k]
      ,[omamk]
      ,[ostomk]
      ,[avustmk]
      ,[kevmk]
      ,[omayk]
      ,[ostoyk]
      ,[avustyk]
      ,[kevyk]
      ,[pesis]
      ,[pesisjarjnim]
      ,[pesisjarj]
      ,[kesis]
      ,[kesisjarjnim]
      ,[kesisjarj]
      ,[perops]
      ,[peropsjarjnim]
      ,[peropsjarj]
      ,[apips]
      ,[apipsjarjnim]
      ,[apipsjarj]
      ,[luontipvm]
      ,[jmamun] = NULL
      ,[jmamuy] = NULL
      ,[jmamuyn] = NULL
      ,[jmamusisay] = NULL
      ,[jmamueo8] = NULL
      ,[jmamueo8n] = NULL
      ,[jmamueo4] = NULL
      ,[jmamueo4n] = NULL
FROM [TK_H9098_CSC]..[TK_2_18_sopv_14]
UNION ALL
SELECT [tilv]
      ,[jarjnim]
      ,[jarj]
      ,[tiedtype]
	  ,vkieli = NULL
      ,[popy]
	  ,[popyn] = NULL
      ,[jmamu]
      ,[psisa]
      ,[jmamusisa]
      ,[pteho]
      ,[pertu]
      ,[pertuv]
      ,[pertum]
      ,[ptehoerop]
      ,[pviertu]
      ,[pviertuv]
      ,[pviertum]
      ,[pvimuut]
      ,[pviop]
      ,[pkuertu]
      ,[pkuertuv]
      ,[pkuertum]
      ,[pkumuut]
      ,[pkuop]
      ,[ppid5v]
      ,[pmuu5v]
      ,[pop5v]
      ,[apip1]
      ,[apip2]
      ,[apip39]
      ,[apipy]
      ,[oma3s]
      ,[osto3s]
      ,[avust3s]
      ,[syk3s]
      ,[oma4s]
      ,[osto4s]
      ,[avust4s]
      ,[syk4s]
      ,[omams]
      ,[ostoms]
      ,[avustms]
      ,[sykms]
      ,[omays]
      ,[ostoys]
      ,[avustys]
      ,[sykys]
      ,[oma3k]
      ,[osto3k]
      ,[avust3k]
      ,[kev3k]
      ,[oma4k]
      ,[osto4k]
      ,[avust4k]
      ,[kev4k]
      ,[omamk]
      ,[ostomk]
      ,[avustmk]
      ,[kevmk]
      ,[omayk]
      ,[ostoyk]
      ,[avustyk]
      ,[kevyk]
      ,[pesis]
      ,[pesisjarjnim]
      ,[pesisjarj]
      ,[kesis]
      ,[kesisjarjnim]
      ,[kesisjarj]
      ,[perops]
      ,[peropsjarjnim]
      ,[peropsjarj]
      ,[apips]
      ,[apipsjarjnim]
      ,[apipsjarj]
      ,[luontipvm]
      ,[jmamun] = NULL
      ,[jmamuy] = NULL
      ,[jmamuyn] = NULL
      ,[jmamusisay] = NULL
      ,[jmamueo8] = NULL
      ,[jmamueo8n] = NULL
      ,[jmamueo4] = NULL
      ,[jmamueo4n] = NULL
FROM [TK_H9098_CSC]..[TK_2_18_sopv_15]
UNION ALL
SELECT [tilv]
      ,[jarjnim]
      ,[jarj]
      ,[tiedtype]
	  ,vkieli = NULL
      ,[popy]
	  ,[popyn]
      ,[jmamu]
      ,[psisa]
      ,[jmamusisa]
      ,[pteho]
      ,[pertu]
      ,[pertuv]
      ,[pertum]
      ,[ptehoerop]
      ,[pviertu]
      ,[pviertuv]
      ,[pviertum]
      ,[pvimuut]
      ,[pviop]
      ,[pkuertu]
      ,[pkuertuv]
      ,[pkuertum]
      ,[pkumuut]
      ,[pkuop]
      ,[ppid5v]
      ,[pmuu5v]
      ,[pop5v]
      ,[apip1]
      ,[apip2]
      ,[apip39]
      ,[apipy]
      ,[oma3s]
      ,[osto3s]
      ,[avust3s]
      ,[syk3s]
      ,[oma4s]
      ,[osto4s]
      ,[avust4s]
      ,[syk4s]
      ,[omams]
      ,[ostoms]
      ,[avustms]
      ,[sykms]
      ,[omays]
      ,[ostoys]
      ,[avustys]
      ,[sykys]
      ,[oma3k]
      ,[osto3k]
      ,[avust3k]
      ,[kev3k]
      ,[oma4k]
      ,[osto4k]
      ,[avust4k]
      ,[kev4k]
      ,[omamk]
      ,[ostomk]
      ,[avustmk]
      ,[kevmk]
      ,[omayk]
      ,[ostoyk]
      ,[avustyk]
      ,[kevyk]
      ,[pesis]
      ,[pesisjarjnim]
      ,[pesisjarj]
      ,[kesis]
      ,[kesisjarjnim]
      ,[kesisjarj]
      ,[perops]
      ,[peropsjarjnim]
      ,[peropsjarj]
      ,[apips]
      ,[apipsjarjnim]
      ,[apipsjarj]
      ,[luontipvm]
      ,[jmamun]
      ,[jmamuy]
      ,[jmamuyn]
      ,[jmamusisay]
      ,[jmamueo8]
      ,[jmamueo8n]
      ,[jmamueo4]
      ,[jmamueo4n]
FROM [TK_H9098_CSC]..[TK_2_18_sopv_16]
UNION ALL
SELECT [tilv]
      ,[jarjnim]
      ,[jarj]
      ,[tiedtype]
	  ,vkieli = NULL
      ,[popy]
	  ,[popyn]
      ,[jmamu]
      ,[psisa]
      ,[jmamusisa]
      ,[pteho]
      ,[pertu]
      ,[pertuv]
      ,[pertum]
      ,[ptehoerop]
      ,[pviertu]
      ,[pviertuv]
      ,[pviertum]
      ,[pvimuut]
      ,[pviop]
      ,[pkuertu]
      ,[pkuertuv]
      ,[pkuertum]
      ,[pkumuut]
      ,[pkuop]
      ,[ppid5v]
      ,[pmuu5v]
      ,[pop5v]
      ,[apip1]
      ,[apip2]
      ,[apip39]
      ,[apipy]
      ,[oma3s]
      ,[osto3s]
      ,[avust3s]
      ,[syk3s]
      ,[oma4s]
      ,[osto4s]
      ,[avust4s]
      ,[syk4s]
      ,[omams]
      ,[ostoms]
      ,[avustms]
      ,[sykms]
      ,[omays]
      ,[ostoys]
      ,[avustys]
      ,[sykys]
      ,[oma3k]
      ,[osto3k]
      ,[avust3k]
      ,[kev3k]
      ,[oma4k]
      ,[osto4k]
      ,[avust4k]
      ,[kev4k]
      ,[omamk]
      ,[ostomk]
      ,[avustmk]
      ,[kevmk]
      ,[omayk]
      ,[ostoyk]
      ,[avustyk]
      ,[kevyk]
      ,[pesis]
      ,[pesisjarjnim]
      ,[pesisjarj]
      ,[kesis]
      ,[kesisjarjnim]
      ,[kesisjarj]
      ,[perops]
      ,[peropsjarjnim]
      ,[peropsjarj]
      ,[apips]
      ,[apipsjarjnim]
      ,[apipsjarj]
      ,[luontipvm]
      ,[jmamun] = NULL
      ,[jmamuy] = NULL
      ,[jmamuyn] = NULL
      ,[jmamusisay] = NULL
      ,[jmamueo8] = NULL
      ,[jmamueo8n] = NULL
      ,[jmamueo4] = NULL
      ,[jmamueo4n] = NULL
FROM [TK_H9098_CSC]..[TK_2_18_sopv_17]

UNION ALL

SELECT [tilv]
      ,[jarjnim]
      ,[jarj]
      ,[tiedtype]
	  ,vkieli = NULL
      ,[popy]
	  ,[popyn]
      ,[jmamu] = NULL
      ,[psisa]
      ,[jmamusisa] = NULL
      ,[pteho]
      ,[pertu]
      ,[pertuv]
      ,[pertum]
      ,[ptehoerop]
      ,[pviertu]
      ,[pviertuv]
      ,[pviertum]
      ,[pvimuut]
      ,[pviop]
      ,[pkuertu]
      ,[pkuertuv]
      ,[pkuertum]
      ,[pkumuut]
      ,[pkuop]
      ,[ppid5v]
      ,[pmuu5v]
      ,[pop5v]
      ,[apip1]
      ,[apip2]
      ,[apip39]
      ,[apipy]
      ,[oma3s]
      ,[osto3s]
      ,[avust3s]
      ,[syk3s]
      ,[oma4s]
      ,[osto4s]
      ,[avust4s]
      ,[syk4s]
      ,[omams]
      ,[ostoms]
      ,[avustms]
      ,[sykms]
      ,[omays]
      ,[ostoys]
      ,[avustys]
      ,[sykys]
      ,[oma3k]
      ,[osto3k]
      ,[avust3k]
      ,[kev3k]
      ,[oma4k]
      ,[osto4k]
      ,[avust4k]
      ,[kev4k]
      ,[omamk]
      ,[ostomk]
      ,[avustmk]
      ,[kevmk]
      ,[omayk]
      ,[ostoyk]
      ,[avustyk]
      ,[kevyk]
      ,[pesis]
      ,[pesisjarjnim]
      ,[pesisjarj]
      ,[kesis]
      ,[kesisjarjnim]
      ,[kesisjarj]
      ,[perops]
      ,[peropsjarjnim]
      ,[peropsjarj]
      ,[apips]
      ,[apipsjarjnim]
      ,[apipsjarj]
      ,[luontipvm]
      ,[jmamun] = NULL
      ,[jmamuy] = NULL
      ,[jmamuyn] = NULL
      ,[jmamusisay] = NULL
      ,[jmamueo8] = NULL
      ,[jmamueo8n] = NULL
      ,[jmamueo4] = NULL
      ,[jmamueo4n] = NULL
FROM [TK_H9098_CSC]..[TK_2_18_sopv_18]

UNION ALL

SELECT [tilv]
      ,[jarjnim]
      ,[jarj]
      ,[tiedtype]
	  ,vkieli = NULL
      ,[popy]
	  ,[popyn]
      ,[jmamu] = NULL
      ,[psisa]
      ,[jmamusisa] = NULL
      ,[pteho]
      ,[pertu]
      ,[pertuv]
      ,[pertum]
      ,[ptehoerop]
      ,[pviertu]
      ,[pviertuv]
      ,[pviertum]
      ,[pvimuut]
      ,[pviop]
      ,[pkuertu]
      ,[pkuertuv]
      ,[pkuertum]
      ,[pkumuut]
      ,[pkuop]
      ,[ppid5v]
      ,[pmuu5v]
      ,[pop5v]
      ,[apip1]
      ,[apip2]
      ,[apip39]
      ,[apipy]
      ,[oma3s]
      ,[osto3s]
      ,[avust3s]
      ,[syk3s]
      ,[oma4s]
      ,[osto4s]
      ,[avust4s]
      ,[syk4s]
      ,[omams]
      ,[ostoms]
      ,[avustms]
      ,[sykms]
      ,[omays]
      ,[ostoys]
      ,[avustys]
      ,[sykys]
      ,[oma3k]
      ,[osto3k]
      ,[avust3k]
      ,[kev3k]
      ,[oma4k]
      ,[osto4k]
      ,[avust4k]
      ,[kev4k]
      ,[omamk]
      ,[ostomk]
      ,[avustmk]
      ,[kevmk]
      ,[omayk]
      ,[ostoyk]
      ,[avustyk]
      ,[kevyk]
      ,[pesis]
      ,[pesisjarjnim]
      ,[pesisjarj]
      ,[kesis]
      ,[kesisjarjnim]
      ,[kesisjarj]
      ,[perops]
      ,[peropsjarjnim]
      ,[peropsjarj]
      ,[apips]
      ,[apipsjarjnim]
      ,[apipsjarj]
      ,[luontipvm]
      ,[jmamun] = NULL
      ,[jmamuy] = NULL
      ,[jmamuyn] = NULL
      ,[jmamusisay] = NULL
      ,[jmamueo8] = NULL
      ,[jmamueo8n] = NULL
      ,[jmamueo4] = NULL
      ,[jmamueo4n] = NULL
FROM [TK_H9098_CSC]..[TK_K2_18_sopv_19]

UNION ALL

SELECT f.[tilv]
      ,[jarjnim] = d.ylnimi
      ,f.[jarj]
      ,[tiedtype] = NULL
	  ,vkieli = NULL
      ,[popy] = f.lkm
	  ,[popyn] = case when f.sp = '2' then f.lkm end
      ,[jmamu] = NULL
      ,[psisa] = NULL
      ,[jmamusisa] = NULL
      ,[pteho] = NULL
      ,[pertu] = NULL
      ,[pertuv] = NULL
      ,[pertum] = NULL
      ,[ptehoerop] = NULL
      ,[pviertu] = NULL
      ,[pviertuv] = NULL
      ,[pviertum] = NULL
      ,[pvimuut] = NULL
      ,[pviop] = case when f.aikielir1 not in ('fs','sv') then f.lkm end
      ,[pkuertu] = NULL
      ,[pkuertuv] = NULL
      ,[pkuertum] = NULL
      ,[pkumuut] = NULL
      ,[pkuop] = NULL
      ,[ppid5v] = NULL
      ,[pmuu5v] = NULL
      ,[pop5v] = NULL
      ,[apip1] = NULL
      ,[apip2] = NULL
      ,[apip39] = NULL
      ,[apipy] = NULL
      ,[oma3s] = NULL
      ,[osto3s] = NULL
      ,[avust3s] = NULL
      ,[syk3s] = NULL
      ,[oma4s] = NULL
      ,[osto4s] = NULL
      ,[avust4s] = NULL
      ,[syk4s] = NULL
      ,[omams] = NULL
      ,[ostoms] = NULL
      ,[avustms] = NULL
      ,[sykms] = NULL
      ,[omays] = NULL
      ,[ostoys] = NULL
      ,[avustys] = NULL
      ,[sykys] = NULL
      ,[oma3k] = NULL
      ,[osto3k] = NULL
      ,[avust3k] = NULL
      ,[kev3k] = NULL
      ,[oma4k] = NULL
      ,[osto4k] = NULL
      ,[avust4k] = NULL
      ,[kev4k] = NULL
      ,[omamk] = NULL
      ,[ostomk] = NULL
      ,[avustmk] = NULL
      ,[kevmk] = NULL
      ,[omayk] = NULL
      ,[ostoyk] = NULL
      ,[avustyk] = NULL
      ,[kevyk] = NULL
      ,[pesis] = NULL
      ,[pesisjarjnim] = NULL
      ,[pesisjarj] = NULL
      ,[kesis] = NULL
      ,[kesisjarjnim] = NULL
      ,[kesisjarj] = NULL
      ,[perops] = NULL
      ,[peropsjarjnim] = NULL
      ,[peropsjarj] = NULL
      ,[apips] = NULL
      ,[apipsjarjnim] = NULL
      ,[apipsjarj] = NULL
      ,f.[luontipvm]
      ,[jmamun] = NULL
      ,[jmamuy] = NULL
      ,[jmamuyn] = NULL
      ,[jmamusisay] = NULL
      ,[jmamueo8] = NULL
      ,[jmamueo8n] = NULL
      ,[jmamueo4] = NULL
      ,[jmamueo4n] = NULL
FROM [TK_H9098_CSC]..[TK_K2_22b_sopv_21] f
LEFT JOIN TK_H9098_CSC..[TK_6_2_sopv_21] d on d.jarj = f.jarj
WHERE f.esi = '1' and f.oppilas = '1'

UNION ALL

SELECT f.[tilv]
      ,[jarjnim] = d.ylnimi
      ,f.[jarj]
      ,[tiedtype] = NULL
	  ,vkieli = NULL
      ,[popy] = f.lkm
	  ,[popyn] = case when f.sp = '2' then f.lkm end
      ,[jmamu] = NULL
      ,[psisa] = NULL
      ,[jmamusisa] = NULL
      ,[pteho] = NULL
      ,[pertu] = NULL
      ,[pertuv] = NULL
      ,[pertum] = NULL
      ,[ptehoerop] = NULL
      ,[pviertu] = NULL
      ,[pviertuv] = NULL
      ,[pviertum] = NULL
      ,[pvimuut] = NULL
      ,[pviop] = case when f.aikielir1 not in ('fs','sv') then f.lkm end
      ,[pkuertu] = NULL
      ,[pkuertuv] = NULL
      ,[pkuertum] = NULL
      ,[pkumuut] = NULL
      ,[pkuop] = NULL
      ,[ppid5v] = NULL
      ,[pmuu5v] = NULL
      ,[pop5v] = NULL
      ,[apip1] = NULL
      ,[apip2] = NULL
      ,[apip39] = NULL
      ,[apipy] = NULL
      ,[oma3s] = NULL
      ,[osto3s] = NULL
      ,[avust3s] = NULL
      ,[syk3s] = NULL
      ,[oma4s] = NULL
      ,[osto4s] = NULL
      ,[avust4s] = NULL
      ,[syk4s] = NULL
      ,[omams] = NULL
      ,[ostoms] = NULL
      ,[avustms] = NULL
      ,[sykms] = NULL
      ,[omays] = NULL
      ,[ostoys] = NULL
      ,[avustys] = NULL
      ,[sykys] = NULL
      ,[oma3k] = NULL
      ,[osto3k] = NULL
      ,[avust3k] = NULL
      ,[kev3k] = NULL
      ,[oma4k] = NULL
      ,[osto4k] = NULL
      ,[avust4k] = NULL
      ,[kev4k] = NULL
      ,[omamk] = NULL
      ,[ostomk] = NULL
      ,[avustmk] = NULL
      ,[kevmk] = NULL
      ,[omayk] = NULL
      ,[ostoyk] = NULL
      ,[avustyk] = NULL
      ,[kevyk] = NULL
      ,[pesis] = NULL
      ,[pesisjarjnim] = NULL
      ,[pesisjarj] = NULL
      ,[kesis] = NULL
      ,[kesisjarjnim] = NULL
      ,[kesisjarj] = NULL
      ,[perops] = NULL
      ,[peropsjarjnim] = NULL
      ,[peropsjarj] = NULL
      ,[apips] = NULL
      ,[apipsjarjnim] = NULL
      ,[apipsjarj] = NULL
      ,f.[luontipvm]
      ,[jmamun] = NULL
      ,[jmamuy] = NULL
      ,[jmamuyn] = NULL
      ,[jmamusisay] = NULL
      ,[jmamueo8] = NULL
      ,[jmamueo8n] = NULL
      ,[jmamueo4] = NULL
      ,[jmamueo4n] = NULL
FROM [TK_H9098_CSC]..[TK_K2_22b_sopv_22] f
LEFT JOIN TK_H9098_CSC..[TK_6_2_sopv_22] d on d.jarj = f.jarj
WHERE f.esi = '1' and f.oppilas = '1'

UNION ALL

SELECT f.[tilv]
      ,[jarjnim] = d.ylnimi
      ,f.[jarj]
      ,[tiedtype] = NULL
	  ,vkieli = NULL
      ,[popy] = f.lkm
	  ,[popyn] = case when f.sp = '2' then f.lkm end
      ,[jmamu] = NULL
      ,[psisa] = NULL
      ,[jmamusisa] = NULL
      ,[pteho] = NULL
      ,[pertu] = NULL
      ,[pertuv] = NULL
      ,[pertum] = NULL
      ,[ptehoerop] = NULL
      ,[pviertu] = NULL
      ,[pviertuv] = NULL
      ,[pviertum] = NULL
      ,[pvimuut] = NULL
      ,[pviop] = case when f.aikielir1 not in ('fs','sv') then f.lkm end
      ,[pkuertu] = NULL
      ,[pkuertuv] = NULL
      ,[pkuertum] = NULL
      ,[pkumuut] = NULL
      ,[pkuop] = NULL
      ,[ppid5v] = NULL
      ,[pmuu5v] = NULL
      ,[pop5v] = NULL
      ,[apip1] = NULL
      ,[apip2] = NULL
      ,[apip39] = NULL
      ,[apipy] = NULL
      ,[oma3s] = NULL
      ,[osto3s] = NULL
      ,[avust3s] = NULL
      ,[syk3s] = NULL
      ,[oma4s] = NULL
      ,[osto4s] = NULL
      ,[avust4s] = NULL
      ,[syk4s] = NULL
      ,[omams] = NULL
      ,[ostoms] = NULL
      ,[avustms] = NULL
      ,[sykms] = NULL
      ,[omays] = NULL
      ,[ostoys] = NULL
      ,[avustys] = NULL
      ,[sykys] = NULL
      ,[oma3k] = NULL
      ,[osto3k] = NULL
      ,[avust3k] = NULL
      ,[kev3k] = NULL
      ,[oma4k] = NULL
      ,[osto4k] = NULL
      ,[avust4k] = NULL
      ,[kev4k] = NULL
      ,[omamk] = NULL
      ,[ostomk] = NULL
      ,[avustmk] = NULL
      ,[kevmk] = NULL
      ,[omayk] = NULL
      ,[ostoyk] = NULL
      ,[avustyk] = NULL
      ,[kevyk] = NULL
      ,[pesis] = NULL
      ,[pesisjarjnim] = NULL
      ,[pesisjarj] = NULL
      ,[kesis] = NULL
      ,[kesisjarjnim] = NULL
      ,[kesisjarj] = NULL
      ,[perops] = NULL
      ,[peropsjarjnim] = NULL
      ,[peropsjarj] = NULL
      ,[apips] = NULL
      ,[apipsjarjnim] = NULL
      ,[apipsjarj] = NULL
      ,f.[luontipvm]
      ,[jmamun] = NULL
      ,[jmamuy] = NULL
      ,[jmamuyn] = NULL
      ,[jmamusisay] = NULL
      ,[jmamueo8] = NULL
      ,[jmamueo8n] = NULL
      ,[jmamueo4] = NULL
      ,[jmamueo4n] = NULL
FROM [TK_H9098_CSC]..[TK_K2_22b_sopv_23] f
LEFT JOIN TK_H9098_CSC..[TK_6_2_sopv_23] d on d.jarj = f.jarj
WHERE f.esi = '1' and f.oppilas = '1'

UNION ALL

SELECT f.[tilv]
      ,[jarjnim] = d.ylnimi
      ,f.[jarj]
      ,[tiedtype] = NULL
	  ,vkieli = NULL
      ,[popy] = f.lkm
	  ,[popyn] = case when f.sp = '2' then f.lkm end
      ,[jmamu] = NULL
      ,[psisa] = NULL
      ,[jmamusisa] = NULL
      ,[pteho] = NULL
      ,[pertu] = NULL
      ,[pertuv] = NULL
      ,[pertum] = NULL
      ,[ptehoerop] = NULL
      ,[pviertu] = NULL
      ,[pviertuv] = NULL
      ,[pviertum] = NULL
      ,[pvimuut] = NULL
      ,[pviop] = case when f.aikielir1 not in ('fs','sv') then f.lkm end
      ,[pkuertu] = NULL
      ,[pkuertuv] = NULL
      ,[pkuertum] = NULL
      ,[pkumuut] = NULL
      ,[pkuop] = NULL
      ,[ppid5v] = NULL
      ,[pmuu5v] = NULL
      ,[pop5v] = NULL
      ,[apip1] = NULL
      ,[apip2] = NULL
      ,[apip39] = NULL
      ,[apipy] = NULL
      ,[oma3s] = NULL
      ,[osto3s] = NULL
      ,[avust3s] = NULL
      ,[syk3s] = NULL
      ,[oma4s] = NULL
      ,[osto4s] = NULL
      ,[avust4s] = NULL
      ,[syk4s] = NULL
      ,[omams] = NULL
      ,[ostoms] = NULL
      ,[avustms] = NULL
      ,[sykms] = NULL
      ,[omays] = NULL
      ,[ostoys] = NULL
      ,[avustys] = NULL
      ,[sykys] = NULL
      ,[oma3k] = NULL
      ,[osto3k] = NULL
      ,[avust3k] = NULL
      ,[kev3k] = NULL
      ,[oma4k] = NULL
      ,[osto4k] = NULL
      ,[avust4k] = NULL
      ,[kev4k] = NULL
      ,[omamk] = NULL
      ,[ostomk] = NULL
      ,[avustmk] = NULL
      ,[kevmk] = NULL
      ,[omayk] = NULL
      ,[ostoyk] = NULL
      ,[avustyk] = NULL
      ,[kevyk] = NULL
      ,[pesis] = NULL
      ,[pesisjarjnim] = NULL
      ,[pesisjarj] = NULL
      ,[kesis] = NULL
      ,[kesisjarjnim] = NULL
      ,[kesisjarj] = NULL
      ,[perops] = NULL
      ,[peropsjarjnim] = NULL
      ,[peropsjarj] = NULL
      ,[apips] = NULL
      ,[apipsjarjnim] = NULL
      ,[apipsjarj] = NULL
      ,f.[luontipvm]
      ,[jmamun] = NULL
      ,[jmamuy] = NULL
      ,[jmamuyn] = NULL
      ,[jmamusisay] = NULL
      ,[jmamueo8] = NULL
      ,[jmamueo8n] = NULL
      ,[jmamueo4] = NULL
      ,[jmamueo4n] = NULL
FROM [TK_H9098_CSC]..[TK_K2_22b_sopv_24] f
LEFT JOIN TK_H9098_CSC..[TK_6_2_sopv_24] d on d.jarj = f.jarj
WHERE f.esi = '1' and f.oppilas = '1'

UNION ALL

SELECT f.[tilv]
      ,[jarjnim] = d.ylnimi
      ,f.[jarj]
      ,[tiedtype] = NULL
	  ,vkieli
      ,[popy] = f.lkm
	  ,[popyn] = case when f.sp = '2' then f.lkm end
      ,[jmamu] = NULL
      ,[psisa] = NULL
      ,[jmamusisa] = NULL
      ,[pteho] = NULL
      ,[pertu] = NULL
      ,[pertuv] = NULL
      ,[pertum] = NULL
      ,[ptehoerop] = NULL
      ,[pviertu] = NULL
      ,[pviertuv] = NULL
      ,[pviertum] = NULL
      ,[pvimuut] = NULL
      ,[pviop] = case when f.aikielir1 not in ('fs','sv') then f.lkm end
      ,[pkuertu] = NULL
      ,[pkuertuv] = NULL
      ,[pkuertum] = NULL
      ,[pkumuut] = NULL
      ,[pkuop] = NULL
      ,[ppid5v] = NULL
      ,[pmuu5v] = NULL
      ,[pop5v] = NULL
      ,[apip1] = NULL
      ,[apip2] = NULL
      ,[apip39] = NULL
      ,[apipy] = NULL
      ,[oma3s] = NULL
      ,[osto3s] = NULL
      ,[avust3s] = NULL
      ,[syk3s] = NULL
      ,[oma4s] = NULL
      ,[osto4s] = NULL
      ,[avust4s] = NULL
      ,[syk4s] = NULL
      ,[omams] = NULL
      ,[ostoms] = NULL
      ,[avustms] = NULL
      ,[sykms] = NULL
      ,[omays] = NULL
      ,[ostoys] = NULL
      ,[avustys] = NULL
      ,[sykys] = NULL
      ,[oma3k] = NULL
      ,[osto3k] = NULL
      ,[avust3k] = NULL
      ,[kev3k] = NULL
      ,[oma4k] = NULL
      ,[osto4k] = NULL
      ,[avust4k] = NULL
      ,[kev4k] = NULL
      ,[omamk] = NULL
      ,[ostomk] = NULL
      ,[avustmk] = NULL
      ,[kevmk] = NULL
      ,[omayk] = NULL
      ,[ostoyk] = NULL
      ,[avustyk] = NULL
      ,[kevyk] = NULL
      ,[pesis] = NULL
      ,[pesisjarjnim] = NULL
      ,[pesisjarj] = NULL
      ,[kesis] = NULL
      ,[kesisjarjnim] = NULL
      ,[kesisjarj] = NULL
      ,[perops] = NULL
      ,[peropsjarjnim] = NULL
      ,[peropsjarj] = NULL
      ,[apips] = NULL
      ,[apipsjarjnim] = NULL
      ,[apipsjarj] = NULL
      ,f.[luontipvm]
      ,[jmamun] = NULL
      ,[jmamuy] = NULL
      ,[jmamuyn] = NULL
      ,[jmamusisay] = NULL
      ,[jmamueo8] = NULL
      ,[jmamueo8n] = NULL
      ,[jmamueo4] = NULL
      ,[jmamueo4n] = NULL
FROM [TK_H9098_CSC]..[TK_K2_22b_sopv_25] f
LEFT JOIN TK_H9098_CSC..[TK_6_2_sopv_25] d on d.jarj = f.jarj
WHERE f.esi = '1' and f.oppilas = '1'

GO


