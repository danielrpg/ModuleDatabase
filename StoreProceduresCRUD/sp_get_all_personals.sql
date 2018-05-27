-- Personal CRUD PROCEDURES
/******************************************************************************
**  Table Name: personal
**  Desc: Table for sp_get_all_personal
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

CREATE PROCEDURE [dbo].[sp_get_all_personal]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT * FROM [dbo].[personal];
END
GO