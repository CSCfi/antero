IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_f_tab_amk_talous]'))
EXEC sp_rename 'dw.v_f_tab_amk_talous', 'v_amk_talous'