IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_areas]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_areas]
END
GO
-- Area CRUD PROCEDURES
/******************************************************************************
**  Table Name: areas
**  Desc: Table for sp_get_all_areas
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_areas]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT * FROM [dbo].[areas];
END
GO