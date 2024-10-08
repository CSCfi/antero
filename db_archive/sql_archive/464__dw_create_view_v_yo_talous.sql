if not exists (select * from sys.views where object_id = object_id('dw.v_yo_talous'))
exec dbo.sp_executesql @statement = N'
create view dw.v_yo_talous as
select tilikausi as ''Tilastovuosi''
  ,case when konserni = ''E'' THEN ''Ei'' ELSE ''Kyllä'' end as Konserni
  ,d1.yo_nimi_fi as ''Yliopisto''
  ,d2.opintoala95_nimi_fi as ''Koulutusala''
  ,d4.aineistotyyppi_nimi_fi as ''Aineisto''
  --ruotsi
  ,tilikausi as ''Statistikår''
  ,d1.yo_nimi_sv as ''Universitet''
  ,d2.opintoala95_nimi_sv as ''Utbildningsområde''
  ,d4.aineistotyyppi_nimi_sv as ''Material typ''
  --englanti
  ,tilikausi as ''Statistical year''
  ,d1.yo_nimi_en as ''University''
  ,d2.opintoala95_nimi_en as ''Field of education''
  ,d4.aineistotyyppi_nimi_en as ''Material type''

  ,d1.yo_tunnus as ''Koodit_yliopisto''
  ,d2.opintoala95_koodi as ''Koodit_koulutusala''
  ,d4.aineistotyyppi_koodi as ''Koodit_aineisto''

  ,d3.tili_taso0_fi
  ,d3.tili_taso1_fi
  ,d3.tili_taso2_fi
  ,d3.tili_taso3_fi
  ,d3.tili_taso4_fi
  ,d3.tili_taso5_fi
  ,d3.tili_taso0_sv
  ,d3.tili_taso1_sv
  ,d3.tili_taso2_sv
  ,d3.tili_taso3_sv
  ,d3.tili_taso4_sv
  ,d3.tili_taso5_sv
  ,d3.tili_taso0_en
  ,d3.tili_taso1_en
  ,d3.tili_taso2_en
  ,d3.tili_taso3_en
  ,d3.tili_taso4_en
  ,d3.tili_taso5_en
  ,d5.toiminto_nimi_fi
  ,f.arvo
  from dw.f_yo_talous f
inner join dw.d_yo d1 on f.d_yo_id = d1.id
inner join dw.d_opintoala95 d2 on f.d_opintoala95_id = d2.id
inner join dw.d_tili d3 on f.d_tili_id = d3.id
inner join dw.d_aineistotyyppi d4 on f.d_aineistotyyppi_id = d4.id
inner join dw.d_toiminto d5 on f.d_toiminto_id = d5.id
where f.arvo <> 0'