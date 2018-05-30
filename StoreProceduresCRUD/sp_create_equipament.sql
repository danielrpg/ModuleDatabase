-- Create Equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_equipament]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_equipament]
END
GO
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

  SELECT @@IDENTITY AS equipament_id;
END