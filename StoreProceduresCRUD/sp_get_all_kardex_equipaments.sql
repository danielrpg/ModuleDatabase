-- Kardex_equipaments CRUD PROCEDURES
/******************************************************************************
**  Table Name: Kardex_equipaments
**  Desc: Table for sp_get_all_kardex_equipaments
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/27/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/27/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_kardex_equipaments]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT * FROM [dbo].[kardex_equipaments];
END
GO