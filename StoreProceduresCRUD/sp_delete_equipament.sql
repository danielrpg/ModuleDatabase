-- DELETE Equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_equipament]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_equipament]
END
GO
-- Drop Equipament CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: delete an equipament
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
CREATE PROCEDURE [dbo].[sp_delete_equipament](
    @equipament_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[equipaments]
    WHERE equipament_id = @equipament_id;
END
GO
