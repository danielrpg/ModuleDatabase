IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_create_incident]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_create_incident
		PRINT 'SE HA ELIMINADO EL SP sp_create_incident';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_create_incident
**  Desc:  SP for insert incident
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

CREATE PROCEDURE [dbo].[sp_create_incident]
(	
	@code nvarchar(255)
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

	INSERT INTO [dbo].[incident]
           ([code]
           ,[date_at]
           ,[incident_number]
           ,[recurrence]
           ,[reincident]
           ,[reported_by]
           ,[severity]
           ,[treatment]
           ,[incident_detail_id]
           ,[incident_type_id]
		   ,[personal_id])
     VALUES
           (@code
           ,@date_at
           ,@incident_number
           ,@recurrence
           ,@reincident
           ,@reported_by
           ,@severity
           ,@treatment
           ,@incident_detail_id
           ,@incident_type_id
		   ,@personal_id)

	SELECT @@IDENTITY AS incident_id;
END
GO