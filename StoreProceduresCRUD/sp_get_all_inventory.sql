-- UPDATE Equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_inventory]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_inventory]
END
GO
-- Inventory CRUD PROCEDURES
/******************************************************************************
**  Table Name: Inventory
**  Desc: Table for sp_get_all_inventory
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

CREATE PROCEDURE [dbo].[sp_get_all_inventory](
	@inventory_id BIGINT = null
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT inventory_id
		  ,inventory.active_assignament
		  ,inventory.status_assignament
		  ,inventory.date_assignament
		  ,inventory.equipament_id
		  ,inventory.personal_id
	FROM [dbo].[inventory] AS inventory
	WHERE inventory.inventory_id = ISNULL(@inventory_id, inventory.inventory_id);
END
GO
