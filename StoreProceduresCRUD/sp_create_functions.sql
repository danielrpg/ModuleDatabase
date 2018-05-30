IF EXISTS (SELECT * FROM sys.objects 

		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_functions]') 

		AND type in (N'P', N'PC'))

BEGIN

	DROP PROCEDURE [dbo].[sp_create_functions]

END

GO





-- Functions CRUD PROCEDURES

/******************************************************************************

**  Table Name: functions

**  Desc: Table for sp_create_functions

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



CREATE PROCEDURE [dbo].[sp_create_functions](

    @func_name VARCHAR(50)
   ,@func_description VARCHAR(100)
   ,@position_position_id INT

   ,@result BIT OUTPUT  --resultado

)

AS 

SET XACT_ABORT ON;

SET NOCOUNT ON;

BEGIN



    INSERT INTO [dbo].[functions]

    (func_name, func_description,position_position_id, created_on)

    VALUES (@func_name, @func_description,@position_position_id,GETDATE());



    SET @result = @@IDENTITY;



    RETURN @result; 

END

