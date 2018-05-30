-- GET Program_sso_trainer stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_program_sso_trainer]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_program_sso_trainer]
END
GO
/******************************************************************************
**  Name: sp_get_all_program_sso_trainer
**  Desc: Table for sp_get_all_program_sso_trainer
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
CREATE PROCEDURE [dbo].[sp_get_all_program_sso_trainer]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    SELECT [sso_trainer_id]
		,[created_on]
		,[updated_on]
		,[sso_trainer_skills]
		,[sso_trainer_ci]
		,[sso_trainer_image]
		,[sso_trainer_name]
		,[sso_trainer_specialty]
	FROM [dbo].[program_sso_trainer]
	 
END
GO
