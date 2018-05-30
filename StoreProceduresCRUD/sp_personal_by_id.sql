IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_personal_by_id]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_personal_by_id]
END
GO
-- Personal CRUD PROCEDURES
/******************************************************************************
**  Table Name: personal
**  Desc: Table for sp_personal_by_id
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_personal_by_id]
(
    @personal_id BIGINT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
   SELECT [personal_id]
      ,[created_on]
      ,[updated_on]
      ,[personal_active]
      ,[personal_direction]
      ,[personal_cellphone]
      ,[personal_email]
      ,[personal_last_name]
      ,[personal_name]
      ,[personal_photo]
      ,[personal_telephone]
      ,[area_area_id]
      ,[assign_equipament_assign_id]
  FROM [dbo].[personals]
    WHERE p.personal_id = @personal_id

END
GO
