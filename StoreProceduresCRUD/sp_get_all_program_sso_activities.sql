-- GET Program_sso_activities stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_program_sso_activities]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_program_sso_activities]
END
GO
/******************************************************************************
**  Name: sp_get_all_program_sso_activities
**  Desc: Table for sp_get_all_program_sso_activities
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
CREATE PROCEDURE [dbo].[sp_get_all_program_sso_activities]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    SELECT [sso_detail_id]
      ,[created_on]
      ,[updated_on]
      ,[sso_detail_activities]
      ,[sso_detail_goal]
      ,[so_detail_number]
      ,[sso_detail_time]
      ,[soo_detail_type]
      ,[sso_id]
      ,[sso_trainer_id]
  FROM [dbo].[program_sso_activities]
	 
END
GO