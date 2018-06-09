print 'insert data into the history_area_personal table';
if(select count(*) from dbo.history_area_personal)=0
begin
	set identity_insert dbo.[history_area_personal] on;
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(1,'2018-05-27 23:56:43',null,null ,null,1,1);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(2,'2016-05-28 16:22:33',null,null ,null,1,2);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(3,'2015-05-27 23:56:43',null,null ,null,1,3);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(4,'2015-05-27 23:56:43',null,null ,null,1,4);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(5,'2015-05-27 23:56:43',null,null ,null,1,5);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(6,'2015-05-27 23:56:43',null,null ,null,1,6);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(7,'2015-05-27 23:56:43',null,null ,null,1,7);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(8,'2015-05-27 23:56:43',null,null ,null,1,8);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(9,'2015-05-27 23:56:43',null,null ,null,1,9);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(10,'2015-05-27 23:56:43',null,null ,null,1,10);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(11,'2015-05-27 23:56:43',null,null ,null,1,11);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(12,'2015-05-27 23:56:43',null,null ,null,1,12);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(13,'2015-05-27 23:56:43',null,null ,null,1,13);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(14,'2015-05-27 23:56:43',null,null ,null,1,15);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(15,'2015-05-27 23:56:43',null,null ,null,1,17);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(16,'2015-05-27 23:56:43',null,null ,null,1,18);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(17,'2015-05-27 23:56:43',null,null ,null,1,19); 
	set identity_insert dbo.[history_area_personal] off;
end
-- End SSO
