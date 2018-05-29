IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_create_incident_detail]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_create_incident_detail
		PRINT 'SE HA ELIMINADO EL SP sp_create_incident_detail';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_create_incident_detail
**  Desc:  SP for insert incident detail
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

CREATE PROCEDURE [dbo].[sp_create_incident_detail]
(
	@incident_detail_name varchar(255)
    ,@incident_detail_status varchar(255)
    ,@incident_detail_subtype varchar(255)
    ,@incident_detail_type varchar(255)    
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[incident_detail]
           ([incident_detail_name]
           ,[incident_detail_status]
           ,[incident_detail_subtype]
           ,[incident_detail_type])
     VALUES
           (@incident_detail_name 
           ,@incident_detail_status 
           ,@incident_detail_subtype 
           ,@incident_detail_type)

	SELECT @@IDENTITY AS incident_detail_id;
END
GO