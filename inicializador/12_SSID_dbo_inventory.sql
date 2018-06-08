print 'insert data into the inventory table';
if(select count(*) from dbo.inventory)=0
begin
	set identity_insert dbo.inventory on;
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (1, '2018-05-28 16:20:04', null, 1, '2018-05-28 16:20:30', 'bueno', 1, 1);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (2, '2018-05-28 16:21:40', null, 1, '2017-05-28 16:21:50', 'nuevo', 2, 2);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (3, '2016-05-28 16:22:33', null, 0, '2017-05-28 16:22:46', 'malo', 2, 3);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (4, '2018-05-28 16:20:04', null, 1, '2018-05-28 16:20:30', 'bueno', 1, 4);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (5, '2018-05-28 16:21:40', null, 1, '2017-05-28 16:21:50', 'nuevo', 2, 5);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (6, '2016-05-28 16:22:33', null, 0, '2017-05-28 16:22:46', 'malo', 2, 6);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (7, '2018-05-28 16:20:04', null, 1, '2018-05-28 16:20:30', 'bueno', 1, 7);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (8, '2018-05-28 16:21:40', null, 1, '2017-05-28 16:21:50', 'nuevo', 2, 8);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (9, '2016-05-28 16:22:33', null, 0, '2017-05-28 16:22:46', 'malo', 2, 9);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (10, '2016-05-28 16:22:33', null, 0, '2017-05-28 16:22:46', 'malo', 2, 10);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (11, '2016-05-28 16:22:33', null, 0, '2017-05-28 16:22:46', 'malo', 2, 11);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (12, '2016-05-28 16:22:33', null, 0, '2017-05-28 16:22:46', 'malo', 2, 12);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (13, '2016-05-28 16:22:33', null, 0, '2017-05-28 16:22:46', 'malo', 2, 13);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (15, '2016-05-28 16:22:33', null, 0, '2017-05-28 16:22:46', 'malo', 2, 14);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (16, '2016-05-28 16:22:33', null, 0, '2017-05-28 16:22:46', 'malo', 2, 15);
	set identity_insert dbo.inventory off;
	print 'inventory done';
end
