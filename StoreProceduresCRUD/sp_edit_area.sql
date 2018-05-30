IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_area]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_area]
END
GO
-- Drop AREA CRUD PROCEDURES
/******************************************************************************
**  Table Name: AREA
**  Desc: Table for sp_edit_area
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

CREATE PROCEDURE [dbo].[sp_edit_area](
    @area_id INT
   ,@area_description VARCHAR(200)
   ,@area_name VARCHAR(50)
   
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[areas]
    SET  area_description = @area_description
        ,area_name        = @area_name
        ,updated_on       = GETDATE()
    WHERE area_id         = @area_id;

    SELECT *
    FROM [dbo].[areas]
    WHERE area_id = @area_id;

END
GO