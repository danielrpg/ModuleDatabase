IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_get_incident_detail]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_get_incident_detail
		PRINT 'SE HA ELIMINADO EL SP sp_get_incident_detail';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_get_incident_detail
**  Desc:  SP for get incident detail
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

CREATE PROCEDURE [dbo].[sp_get_incident_detail]
(
	@incident_detail_id bigint = NULL   
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	SELECT [incident_detail_id]
		,[incident_detail_name]
		,[incident_detail_status]
		,[incident_detail_subtype]
		,[incident_detail_type]
	FROM [dbo].[incident_detail]
	WHERE [incident_detail_id] = ISNULL(@incident_detail_id, [incident_detail_id])
END
GO