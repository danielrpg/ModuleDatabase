--GET positions store procedure
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_position]
END
GO
-- Equipments CRUD PROCEDURES
/******************************************************************************
**  Table Name: position
**  Desc: Table for sp_get_all_position
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/28/2018

*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_position](
	@position_id BIGINT = null
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT   position_id
			,position_name
			,position_level
			,position_description
			,parent_position_position_id 
	FROM [dbo].[position] as posi
	WHERE posi.position_id = ISNULL(@position_id, posi.position_id);
END
GO