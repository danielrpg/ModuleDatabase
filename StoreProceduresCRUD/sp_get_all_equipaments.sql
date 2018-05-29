-- GET Equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_equipament]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_equipament]
END
GO
-- Equipament CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: Table for sp_get_all_equipament
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

CREATE PROCEDURE [dbo].[sp_get_all_equipament](
	@equipament_id BIGINT = null
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT   equi.equipament_id
			,equi.equipament_name
			,equi.equipament_type
			,equi.equipament_description
			,equi.equipament_image 
	FROM [dbo].[equipaments] as equi
	WHERE equi.equipament_id = ISNULL(@equipament_id, equi.equipament_id);
END
GO