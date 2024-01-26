use antero
go

update [ANTERO].[dw].[d_ammatillisen_tutkinnon_kustannusryhma]
set [selite_fi] = replace([selite_fi], 'VALMA&TELMA', 'VALMA&TUVA&TELMA')
,[selite_sv] = replace([selite_sv], 'VALMA&TELMA', 'VALMA&TUVA&TELMA')
,[selite_en] = replace([selite_en], 'VALMA&TELMA', 'VALMA&TUVA&TELMA')