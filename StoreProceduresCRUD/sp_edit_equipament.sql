-- Update Equipament CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: Table for sp_edit_equipament
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

CREATE PROCEDURE [dbo].[sp_edit_equipament](
			    @equipament_id INT
			   ,@equipament_name VARCHAR(50)
			   ,@equipament_type INT
			   ,@equipament_description VARCHAR(200)
			   ,@equipament_image VARBINARY(MAX)
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[equipaments]
    SET equipament_name = @equipament_name
	   ,equipament_type = @equipament_type
	   ,equipament_description = @equipament_description
	   ,equipament_image = @equipament_image
	   ,created_on = GETDATE()
    WHERE equipament_id = @equipament_id;

    SELECT *
    FROM [dbo].[equipaments]
    WHERE equipament_id = @equipament_id;

END