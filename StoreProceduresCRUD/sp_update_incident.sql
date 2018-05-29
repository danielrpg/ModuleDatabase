IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_update_incident]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_update_incident
		PRINT 'SE HA ELIMINADO EL SP sp_update_incident';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_update_incident
**  Desc:  SP for update incident
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

CREATE PROCEDURE [dbo].[sp_update_incident]
(	@incident_id bigint
	,@code nvarchar(255)
    ,@date_at datetime
    ,@incident_number int
    ,@recurrence int
    ,@reincident bit
    ,@reported_by nvarchar(255)
    ,@severity nvarchar(255)
    ,@treatment bit
    ,@incident_detail_id bigint
    ,@incident_type_id bigint
	,@personal_id bigint
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[incident]
   SET [code] = @code
      ,[date_at] = @date_at
      ,[incident_number] = @incident_number
      ,[recurrence] = @recurrence
      ,[reincident] = @reincident
      ,[reported_by] = @reported_by
      ,[severity] = @severity
      ,[treatment] = @treatment
      ,[incident_detail_id] = @incident_detail_id
      ,[incident_type_id] = @incident_type_id
      ,[personal_id] = @personal_id
 WHERE [incident_id] = @incident_id

	SELECT @@IDENTITY AS incident_id;
END
GO