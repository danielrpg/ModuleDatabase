IF EXISTS (SELECT * FROM sys.objects 

		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_functions]') 

		AND type in (N'P', N'PC'))

BEGIN

	DROP PROCEDURE [dbo].[sp_edit_functions]

END

GO

-- Functions CRUD PROCEDURES

/******************************************************************************

**  Table Name: functions

**  Desc: Table for sp_edit_functions

** 

**  Called by: ssi

**

**  Author: Boris Gonzalo Medrano Guzman

**

**  Date: 05/29/2018

*******************************************************************************

**                            Change History

*******************************************************************************

**   Date:     Author:                            Description:

** --------   --------        ---------------------------------------------------

** 05/29/2018 Boris Gonzalo Medrano Guzman   Initial version

*******************************************************************************/



CREATE PROCEDURE [dbo].[sp_edit_functions](

    @func_id INT

   ,@func_name VARCHAR(50)

   ,@func_description VARCHAR(100)
   
   ,@position_position_id INT

)

AS 

SET XACT_ABORT ON;

SET NOCOUNT ON;

BEGIN



    UPDATE [dbo].[functions]

    SET func_name  = @func_name

        ,func_description  = @func_description
        
        ,position_position_id = @position_position_id

        ,updated_on    =  GETDATE()

    WHERE func_id = @func_id;



    SELECT  [func_id]
      ,[created_on]
      ,[updated_on]
      ,[func_description]
      ,[func_name]
      ,[position_position_id]
  FROM [dbo].[functions]
  WHERE func_id = @func_id;



END
GO
