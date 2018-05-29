-- UPDATE Inventory stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_inventory]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_inventory]
END
GO
-- Create Inventory CRUD PROCEDURES
/******************************************************************************
**  Table Name: Inventory
**  Desc: Table for sp_create_inventory
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/27/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/27/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_create_inventory](
				@active_asignament BIT
			   ,@status_asignament VARCHAR(50)
			   ,@date_asignament DATETIME
			   ,@equipament_id BIGINT
			   ,@personal_id BIGINT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[inventory](
			    active_assignament
			   ,status_assignament
			   ,date_assignament
			   ,created_on
			   ,equipament_id
			   ,personal_id)
    VALUES ( 
				@active_asignament
			   ,@status_asignament
			   ,@date_asignament
			   ,GETDATE()
			   ,@equipament_id
			   ,@personal_id);

	SELECT @@IDENTITY AS inventory_id;
END