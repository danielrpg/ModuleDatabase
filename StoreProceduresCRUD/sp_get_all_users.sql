IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_users]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_users]
END
GO
-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: users
**  Desc: Table for sp_get_all_users
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_users]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT [user_id]
		,[created_on]
		,[updated_on]
		,[user_password]
		,[user_active]
		,[user_name]
	FROM [dbo].[users]
END
GO
