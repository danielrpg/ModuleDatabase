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
    SELECT * 
    FROM [dbo].[personals] AS p
    WHERE p.personal_id = @personal_id

END

GO
