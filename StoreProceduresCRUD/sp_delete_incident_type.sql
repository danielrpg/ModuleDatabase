IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_delete_incident_type]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_delete_incident_type
		PRINT 'SE HA ELIMINADO EL SP sp_delete_incident_type';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_delete_incident_type
**  Desc:  SP for delete incident type
**  Called by: SSI
**
**  Author: Marcos Bustos
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Marcos Bustos   Initial version
*******************************************************************************/


CREATE PROCEDURE [dbo].[sp_delete_incident_type]
(
	@incident_type_id bigint 
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	DELETE FROM [dbo].[incident_type]
  WHERE [incident_type_id] = @incident_type_id 
END
GO