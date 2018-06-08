/*****************************************************************************
**  DataBase: ssidb
**  Desc: Initialization of basic data
** 
**  Called by: ssi
**
**  Author: Franz A. Lopez Choque
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   -------------------        --------------------------------------
** 05/28/2018 Ivan Misericordia Eulate   Initial version last version
** 05/29/2018 Franz A. Lopez Choque		  Update schema version
** 05/30/2018 Franz A. Lopez Choque		  Add Data
*******************************************************************************/
use SSID;
set xact_abort on;
set nocount on;

BEGIN TRANSACTION;

-- Users
print 'insert data into the roles table';
if(select count(*) from dbo.roles)=0
begin
	set identity_insert dbo.roles on;
	INSERT INTO dbo.roles(role_id, created_on , updated_on, role_name) VALUES (1, '2018-05-27 22:18:59', '2018-05-27 22:18:59', 'ROLE_ADMIN');
	INSERT INTO dbo.roles(role_id, created_on, updated_on, role_name) VALUES (2, '2018-05-27 22:18:59', '2018-05-27 22:18:59', 'ROLE_USER');
	set identity_insert dbo.roles off;
	print 'roles table done';
end
