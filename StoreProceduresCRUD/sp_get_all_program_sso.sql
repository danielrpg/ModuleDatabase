-- GET Program_sso stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_program_sso]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_program_sso]
END
GO
/******************************************************************************
**  Name: sp_get_all_program_sso
**  Desc: Table for sp_get_all_program_sso
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_get_all_program_sso]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    SELECT [sso_id]
      ,[created_on]
      ,[updated_on]
      ,[sso_execution_time]
      ,[sso_goal]
      ,[sso_indicator]
      ,[sso_objetive]
      ,[sso_responsable]
      ,[sso_total_cost]
  FROM [dbo].[program_sso]
	 
END
GO