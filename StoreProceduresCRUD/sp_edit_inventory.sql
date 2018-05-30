-- UPDATE Inventory stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_inventory]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_inventory]
END
GO
-- Update Inventory CRUD PROCEDURES
/******************************************************************************
**  Table Name: Inventory
**  Desc: Table for sp_edit_inventory
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

CREATE PROCEDURE [dbo].[sp_edit_inventory](
			    @inventory_id INT
			   ,@active_asignament BIT
			   ,@status_asignament VARCHAR(50)
			   ,@date_asignament DATETIME
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[Inventory]
    SET		active_assignament = @active_asignament
		   ,status_assignament = @status_asignament
		   ,date_assignament = @date_asignament
	       ,created_on = GETDATE()
    WHERE inventory_id = @inventory_id;

    SELECT *
    FROM [dbo].[Inventory]
    WHERE inventory_id = @inventory_id;
	SELECT @@IDENTITY AS inventory_id;
END