print 'insert data into the personal_position_contract table';
if(select count(*) from dbo.[personal_position_contract])=0
begin
	set identity_insert dbo.[personal_position_contract] on;
	INSERT INTO [dbo].[personal_position_contract]([pers_pos_contract_id],[created_on],[updated_on],[pers_pos_contract_end_date],[pers_pos_contract_init_date],[pers_pos_contract_status],[pers_pos_contract_turno],[contract_id],[personal_id],[position_id])VALUES(1,'2015-05-27 23:56:44',null,null,'2015-05-27 23:56:44',1,'dia',1,1,11);
	INSERT INTO [dbo].[personal_position_contract]([pers_pos_contract_id],[created_on],[updated_on],[pers_pos_contract_end_date],[pers_pos_contract_init_date],[pers_pos_contract_status],[pers_pos_contract_turno],[contract_id],[personal_id],[position_id]) VALUES(2,'2015-05-27 23:56:44',null,null,'2015-05-27 23:56:44',1,'dia',1,2,12);
	INSERT INTO [dbo].[personal_position_contract]([pers_pos_contract_id],[created_on],[updated_on],[pers_pos_contract_end_date],[pers_pos_contract_init_date],[pers_pos_contract_status],[pers_pos_contract_turno],[contract_id],[personal_id],[position_id]) VALUES(3,'2015-05-27 23:56:44',null,null,'2015-05-27 23:56:44',1,'dia',1,3,13);
	set identity_insert dbo.[personal_position_contract] off;
	print 'personal_position_contract done';
end
