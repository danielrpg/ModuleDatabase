IF EXISTS (SELECT * FROM sys.objects 

		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_functions]') 

		AND type in (N'P', N'PC'))

BEGIN

	DROP PROCEDURE [dbo].[sp_delete_functions]

END

GO

-- Drop functions CRUD PROCEDURES

/******************************************************************************

**  Table Name: functions

**  Desc: Table for sp_delete_functions

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

CREATE PROCEDURE [dbo].[sp_delete_functions](

    @func_id INT

   ,@result BIT OUTPUT

)

AS

SET XACT_ABORT ON;

SET NOCOUNT ON;

BEGIN 

    

    DELETE FROM [dbo].[functions]

    WHERE func_id = @func_id


    SET @result = 1;

    
    RETURN @result; 

END