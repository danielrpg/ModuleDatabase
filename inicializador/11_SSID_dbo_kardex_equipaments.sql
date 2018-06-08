print 'insert data into the kardex_equipaments table';
if(select count(*) from dbo.kardex_equipaments)=0
begin
	set identity_insert dbo.kardex_equipaments on;
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES ( 1, '2018-05-28 15:13:25', null, 15, '2018-05-28 09:13:25', 15, 0, 1);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES ( 2, '2018-05-28 15:13:25', null, 10, '2018-05-28 09:30:25', 0, 5, 2);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES ( 3, '2018-05-28 15:13:25', null, 15, '2018-05-28 10:00:25', 15, 0, 3);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES ( 4, '2018-05-28 15:13:25', null, 10, '2018-05-28 10:15:25', 0, 0, 4);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES ( 5, '2018-05-28 15:13:25', null, 15, '2018-05-28 11:17:25', 15, 0, 5);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES ( 6, '2018-05-28 15:13:25', null, 10, '2018-05-28 14:00:25', 0, 5, 6);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES ( 7, '2018-05-28 15:13:25', null, 15, '2018-05-28 14:30:25', 15, 0, 7);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES ( 8, '2018-05-28 15:13:25', null, 10, '2018-05-28 14:55:25', 0, 0, 8);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES ( 9, '2018-05-28 15:13:25', null, 15, '2018-05-28 15:13:25', 15, 0, 9);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES (10, '2018-05-28 15:13:25', null, 10, '2018-05-28 15:17:25', 0, 5, 10);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES (11, '2018-05-28 15:13:25', null, 15, '2018-05-28 15:25:25', 15, 0, 11);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES (12, '2018-05-28 15:13:25', null, 10, '2018-05-28 15:55:25', 0, 0, 12);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES (13, '2018-05-28 15:13:25', null, 15, '2018-05-28 16:30:25', 15, 0, 13);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES (14, '2018-05-28 15:13:25', null, 10, '2018-05-28 17:19:25', 0, 5, 14);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id) VALUES (15, '2018-05-28 15:13:25', null, 15, '2018-05-28 17:40:25', 15, 0, 15);
	set identity_insert dbo.kardex_equipaments off;
	print 'kardex done';
end 
