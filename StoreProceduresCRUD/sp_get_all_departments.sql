IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_departments]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_departments]
END
GO

-- Personal CRUD PROCEDURES
/******************************************************************************
**  Table Name: equipaments
**  Desc: Table for sp_get_all_department
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_departments]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT [department_id]
      ,[created_on]
      ,[updated_on]
      ,[department_description]
      ,[department_name]
  FROM [dbo].[department]
END
GO