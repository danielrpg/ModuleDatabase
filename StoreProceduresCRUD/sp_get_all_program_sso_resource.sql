-- GET Program_sso_resource stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_program_sso_resource]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_program_sso_resource]
END
GO
/******************************************************************************
**  Name: sp_get_all_program_sso_resource
**  Desc: Table for sp_get_all_program_sso_resource
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
CREATE PROCEDURE [dbo].[sp_get_all_program_sso_resource]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    SELECT [sso_resource_id]
      ,[created_on]
      ,[updated_on]
      ,[sso_resource_cost]
      ,[sso_resource_detail]
      ,[sso_detail_id]
  FROM [dbo].[program_sso_resource]
	 
END
GO