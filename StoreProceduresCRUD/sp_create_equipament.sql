-- Create Equipament CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: Table for sp_create_equipament
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

CREATE PROCEDURE [dbo].[sp_create_equipament](
				@equipament_name VARCHAR(50)
			   ,@equipament_type INT
			   ,@equipament_description VARCHAR(200)
			   ,@equipament_image VARBINARY(MAX)
			   ,@result BIT OUTPUT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[equipaments](equipament_name
								  ,equipament_type
								  ,equipament_description
								  ,equipament_image
								  ,created_on)
    VALUES ( @equipament_name
			,@equipament_type
			,@equipament_description
			,@equipament_image
			,GETDATE());

    SET @result = 1;

    RETURN @result; 
END