--GET department_position store procedure
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_department_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_department_position]
END
GO
-- department_position CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: Table for sp_get_all_department_position
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/26/2018

*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_department_position](
	@department_id BIGINT = null
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT   department_id
			,position_id 
	FROM [dbo].[department_position] as de_po
	WHERE de_po.department_id = ISNULL(@department_id, de_po.department_id);
END
GO