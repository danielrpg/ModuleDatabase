-- Drop Equipament CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: Table for sp_delete_equipament
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
** 05/27/2018 Gilmer Ivan Misericordia Eulate   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_delete_equipament](
    @equipament_id INT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[equipaments]
    WHERE equipament_id = @equipament_id;

    SET @result = 1;
    
    RETURN @result; 
END