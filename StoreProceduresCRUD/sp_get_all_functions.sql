IF EXISTS (SELECT * FROM sys.objects 

		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_functions]') 

		AND type in (N'P', N'PC'))

BEGIN

	DROP PROCEDURE [dbo].[sp_get_all_functions]

END

GO

-- Functions CRUD PROCEDURES

/******************************************************************************

**  Table Name: functions

**  Desc: Table for sp_get_all_functions

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



CREATE PROCEDURE [dbo].[sp_get_all_functions]

AS

SET XACT_ABORT ON;

SET NOCOUNT ON;

BEGIN

    SELECT [func_id]
      ,[created_on]
      ,[updated_on]
      ,[func_description]
      ,[func_name]
      ,[position_position_id]
  FROM [dbo].[functions]

END

GO