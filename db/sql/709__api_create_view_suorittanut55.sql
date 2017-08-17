IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.suorittanut55'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW api.suorittanut55 AS
SELECT 1 AS a
'
GO

-- copy from: dw.v_virta_otp_55_tilanne
ALTER VIEW api.suorittanut55 AS

select 
      
      [Tilastovuosi] = f.[vuosi]
    ,[Lukuvuosi] = cast(f.vuosi-1 as nvarchar)+'/'+cast(f.vuosi as nvarchar)
    ,f.loAloituspvm
      ,f.ooAloituspvm
    ,[Aika aloittamisesta] = coalesce(
    case 
      when f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end)>=8 then '8 tai enemmän' 
      when f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end)<0 then 'Ei tietoa'
      else cast(f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end) as varchar) 
    end,'Ei tietoa')
    ,[Henkilo_koodi] = opiskelijaAvain+opiskeluoikeusAvain+d1.organisaatio_koodi
    ,[Sukupuoli] = coalesce(d3.sukupuoli_fi,'Tuntematon')
      ,uusi_opisk = coalesce(f.uusiOpisk,0)
    ,[Aloittanut keväällä] = case f.uusiOpiskKevat when 1 then 'Kyllä' when 0 then 'Ei' else 'Tuntematon' end
      ,[Olo syksy] = coalesce(f.edellinenSyysolo,0)
    ,[Olo kevät] = coalesce(f.olok,0)
    ,[Lasna] = case when f.edellinenSyysolo=1 or f.olok=1 then 1 else 0 end
    ,[Suorittanut55] = case when f.[suorittanut27]=1 or f.[suorittanut55ilmanPankkia]=1 or f.[suorittanut55PankinAvulla]=1 then 1 else 0 end
    --,f.[olos]
    --,f.[olok]
      ,[Opintopisteet syksy] = coalesce(f.[syys],0)
      ,[Opintopisteet kevät] = coalesce(f.[kevat],0)
      --,[Opintopisteet summa] = f.[summa]
    
    ,[Sektori] = 
    case 
      when d1.organisaatio_fi in 
      ('Aalto-yliopisto',
      'Helsingin yliopisto',
      'Itä-Suomen yliopisto',
      'Jyväskylän yliopisto',
      'Lapin yliopisto',
      'Lappeenrannan tekn. yliopisto',
      'Oulun yliopisto',
      'Svenska handelshögskolan',
      'Taideyliopisto',
      'Tampereen tekn. yliopisto',
      'Tampereen yliopisto',
      'Turun yliopisto',
      'Vaasan yliopisto',
      'Åbo Akademi') then 'Yliopisto'
      else 'Ammattikorkeakoulu'
    end
    ,[Korkeakoulu] = d1.organisaatio_fi
      ,[Tutkintokoodi] = coalesce(f.[tkoodi],'999999')
    ,[Tutkinto]  = coalesce(d2.koulutusluokitus_fi,'Tuntematon')
    ,[OKM ohjauksen ala] = coalesce(d2.okmohjauksenala_fi,'Tuntematon')
    ,[Koulutusaste, taso 1] = coalesce(d2.koulutusastetaso1_fi,'Tuntematon')
    ,[Koulutusaste, taso 2] = coalesce(d2.Koulutusastetaso2_fi,'Tuntematon')
    ,[Koulutusala, taso 1] = coalesce(d2.koulutusalataso1_fi,'Tuntematon')
    ,[Koulutusala, taso 2] = coalesce(d2.koulutusalataso2_fi,'Tuntematon')
    ,[Koulutusala, taso 3] = coalesce(d2.koulutusalataso3_fi,'Tuntematon')

      ,f.[suorittanut27]
      ,f.[suorittanut55IlmanPankkia]
      ,f.[suorittanut55PankinAvulla]

    --järjestys
    ,[OKM ohjauksen ala jarj] = d2.okmohjauksenala_koodi
    ,[Koulutusaste, taso 1 jarj] = d2.koulutusastetaso1_koodi
    ,[Koulutusaste, taso 2 jarj] = d2.koulutusastetaso2_koodi
    ,[Koulutusala, taso 1 jarj] = d2.koulutusalataso1_koodi
    ,[Koulutusala, taso 2 jarj] = d2.koulutusalataso2_koodi
    ,[Koulutusala, taso 3 jarj] = d2.koulutusalataso3_koodi
   

  FROM [ANTERO].[sa].[sa_virta_otp_viisviis] f

LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=f.oppilaitostunnus
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi=f.tkoodi
LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.sukupuoli_koodi=f.sukupuoli
GO


/* revert
drop view api.suorittanut55
--*/
