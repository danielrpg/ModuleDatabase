-- Equipament CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: Table for sp_get_all_equipament
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_equipament]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT * FROM [dbo].[equipaments];
END
GO