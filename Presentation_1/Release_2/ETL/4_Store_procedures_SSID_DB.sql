USE SSID
GO

/******************************************************************************
**  Name: 4_Store_procedures_SSID_DB
**  Desc: Global Script to DW in SSID Database
**  Called By: SSI-D
**
**  Author: Jesus David Piérola Alvarado
**
**  Created: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------					----------------------------------
**  29/05/2018  Jesus David Piérola Alvarado Release 3.0 - DW
******************************************************************************/

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ETL')
BEGIN	
	EXEC('CREATE SCHEMA [ETL]');
	PRINT 'Schema ETL created!';
END
GO

-- Store procedures and functions

-- Creacion de Funcion
IF EXISTS(SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[ETL].[GetTableMigrationLatestRowVersion]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	DROP FUNCTION [ETL].GetTableMigrationLatestRowVersion
	PRINT ('Function Deleted -  GetTableMigrationLatestRowVersion')
END
GO
/******************************************************************************
**  Name: GetTableMigrationLatestRowVersion
**  Desc: Get Latest row version of table Migration
** 
**  Called by: SSI-D
**
**  Author: Jesús David Piérola Alvarado
**
**  Date: 27/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------                      -----------------------------------
** 27/05/2018 Jesús David Piérola Alvarado   Release 3.0 - DW
*******************************************************************************/
CREATE FUNCTION [ETL].[GetTableMigrationLatestRowVersion]
(
	@table VARCHAR(50)
)
RETURNS BIGINT
AS
BEGIN
	DECLARE @last BIGINT;

	SELECT @last = LatestChange
	FROM [ETL].[Migration]
	WHERE TableName = @table;

  RETURN @last;
END
GO
PRINT 'Creating function GetTableMigrationLatestRowVersion';
GO

-- Creacion de Funcion
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ETL].[GetDatabaseRowVersion]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	DROP FUNCTION [ETL].GetDatabaseRowVersion
	PRINT ('Function Deleted -  GetDatabaseRowVersion')
END
GO
/******************************************************************************
**  Name: GetDatabaseRowVersion
**  Desc: Used by DW ETL Process to return INT lastest version
** 
**  Called by: SSI-D
**
**  Author: Jesús David Piérola Alvarado
**
**  Date: 27/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------                      -----------------------------------
** 27/05/2018 Jesús David Piérola Alvarado   Release 3.0 - DW
*******************************************************************************/
CREATE FUNCTION [ETL].[GetDatabaseRowVersion] ()
RETURNS BIGINT
AS
BEGIN
  RETURN CONVERT(BIGINT, MIN_ACTIVE_ROWVERSION()) - 1;
END
GO
PRINT 'Creating function GetDatabaseRowVersion';
GO

-- Store procedures

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.UpdateTableMigration') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.UpdateTableMigration
	PRINT 'Store procedure Deleted -  ETL.UpdateTableMigration';
END
GO
/******************************************************************************
**  Name: UpdateTableMigration
**  Desc: Updates Table Migration with latest Rowversion used 
**  Called By: ETL SQL Job
**
**  Author: Jesus David Piérola Alvarado
**
**  Created: 27/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------					----------------------------------
**  27/05/2018  Jesus David Piérola Alvarado Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE ETL.UpdateTableMigration
(
	@tableName VARCHAR(50),
	@current     BIGINT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	UPDATE ETL.Migration
	SET LatestChange = @current
	WHERE TableName = @tableName;
END
GO
PRINT 'Creating store procedure UpdateTableMigration';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.PullDataToDatawarehouse') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.PullDataToDatawarehouse
	PRINT 'Store procedure Deleted -  ETL.PullDataToDatawarehouse';
END
GO
/******************************************************************************
**  Name: PullTableDataToDW
**  Desc: Pulls Changes and Inserts from the SSID to DW_SSID_DB Database
**  Called By: ETL SQL Job.
**
**  Author: Jesus David Piérola Alvarado
**
**  Created: 27/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------					----------------------------------
**  27/05/2018  Jesus David Piérola Alvarado Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE ETL.PullDataToDatawarehouse
(
	@table VARCHAR(50)
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
BEGIN
	DECLARE @SQLString      NVARCHAR(MAX);  
	DECLARE @ParmDefinition NVARCHAR(MAX); 
	DECLARE @currentDBTS    BIGINT = [ETL].[GetDatabaseRowVersion]();
	DECLARE @lastDBTS       BIGINT = [ETL].[GetTableMigrationLatestRowVersion](@table); 

	SET @ParmDefinition = N'@last BIGINT, @current BIGINT'; 
	SET @SQLString = N'INSERT INTO [DW_SSID_DB].[ETL].[' + @table + ']
					   EXECUTE [ETL].[Get' + @table + 'ChangesByRowVersion] @LastRowVersionID = @last
																		   ,@CurrentDBTS      = @current;';  
	EXECUTE SP_EXECUTESQL @SQLString
						 ,@ParmDefinition
						 ,@last    = @lastDBTS
						 ,@current = @currentDBTS;  

	EXECUTE [ETL].[UpdateTableMigration] @tableName = @table
										,@current   = @currentDBTS;
END
GO
PRINT 'Creating store procedure PullDataToDatawarehouse';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.GetAreaChangesByRowVersion') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.GetAreaChangesByRowVersion
	PRINT 'Store procedure Deleted -  ETL.GetAreaChangesByRowVersion';
END
GO
/******************************************************************************
**  Name: GetAreaChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Areas table (Area Data)
**  Called By: ETL SQL Job.
**
**  Author: Jesus David Piérola Alvarado
**
**  Created: 27/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------					----------------------------------
**  27/05/2018  Jesus David Piérola Alvarado Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE ETL.GetAreaChangesByRowVersion
(
	@LastRowVersionID BIGINT,
	@CurrentDBTS      BIGINT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT AreaID       = a.area_id
		  ,AreaName     = a.area_name
	FROM dbo.areas a
	WHERE a.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND a.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	GROUP BY a.area_id
			,a.area_name
END
GO
PRINT 'Creating store procedure GetAreaChangesByRowVersion';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.GetEventIncidentChangesByRowVersion') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.GetEventIncidentChangesByRowVersion
	PRINT 'Store procedure Deleted -  ETL.GetEventIncidentChangesByRowVersion';
END
GO
/******************************************************************************
**  Name: GetEventIncidentChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.incident table (EventIncident Data)
**  Called By: ETL SQL Job.
**
**  Author: Jesus David Piérola Alvarado
**
**  Created: 27/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------					----------------------------------
**  27/05/2018  Jesus David Piérola Alvarado Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE ETL.GetEventIncidentChangesByRowVersion
(
	@LastRowVersionID BIGINT,
	@CurrentDBTS      BIGINT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT EventIncidentID			= i.incident_id
		  ,EventIncidentDetail		= id.incident_detail_name
		  ,EventIncidentSeverity	= i.incident_severity
		  ,EventIncidentReportedBy	= i.incident_reported_by
	FROM dbo.incident i
			INNER JOIN dbo.incident_detail id ON i.incident_detail_id = id.incident_detail_id
	WHERE i.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND i.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	GROUP BY i.incident_id
			  ,id.incident_detail_name
			  ,i.incident_severity
			  ,i.incident_reported_by

	UNION
	-- Se busca cambios en incident_detail, por si ubiera ocurrido algun cambio
	SELECT EventIncidentID			= i.incident_id
		  ,EventIncidentDetail		= id.incident_detail_name
		  ,EventIncidentSeverity	= i.incident_severity
		  ,EventIncidentReportedBy	= i.incident_reported_by
	FROM dbo.incident i
			INNER JOIN dbo.incident_detail id ON i.incident_detail_id = id.incident_detail_id
	WHERE id.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND id.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	GROUP BY i.incident_id
			  ,id.incident_detail_name
			  ,i.incident_severity
			  ,i.incident_reported_by
END
GO
PRINT 'Creating store procedure GetEventIncidentChangesByRowVersion';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.GetPersonalChangesByRowVersion') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.GetPersonalChangesByRowVersion
	PRINT 'Store procedure Deleted -  ETL.GetPersonalChangesByRowVersion';
END
GO
/******************************************************************************
**  Name: GetPersonalChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Personals table (Personal Data)
**  Called By: ETL SQL Job.
**
**  Author: Jesus David Piérola Alvarado
**
**  Created: 27/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------					----------------------------------
**  27/05/2018  Jesus David Piérola Alvarado Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE ETL.GetPersonalChangesByRowVersion
(
	@LastRowVersionID BIGINT,
	@CurrentDBTS      BIGINT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT PersonalID			= p.personal_id
		  ,PersonalFullName		= p.personal_name + ' ' + p.personal_last_name
		  ,PersonalAge			= DATEDIFF(YEAR,p.personal_birthdate,GETDATE())
		  ,PersonalSatus		= p.personal_active
		  ,PersonalCountEquipa	= COUNT(i.inventory_id)
	FROM dbo.personals p 
			INNER JOIN inventory i ON p.personal_id = i.personal_id
	WHERE p.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND p.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	AND i.active_assignament = 1
	GROUP BY p.personal_id
		  ,p.personal_name + ' ' + p.personal_last_name
		  ,p.personal_birthdate
		  ,p.personal_active

	UNION
	-- Hacemos el UNION, por su hubo cambios en invetory de asignacion de equipamiento en personal
	SELECT PersonalID			= p.personal_id
		  ,PersonalFullName		= p.personal_name + ' ' + p.personal_last_name
		  ,PersonalAge			= DATEDIFF(YEAR,p.personal_birthdate,GETDATE())
		  ,PersonalSatus		= p.personal_active
		  ,PersonalCountEquipa	= COUNT(i.inventory_id)
	FROM dbo.personals p 
			INNER JOIN inventory i ON p.personal_id = i.personal_id
	WHERE i.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND i.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	AND i.active_assignament = 1
	GROUP BY p.personal_id
		  ,p.personal_name + ' ' + p.personal_last_name
		  ,p.personal_birthdate
		  ,p.personal_active
END
GO
PRINT 'Creating store procedure GetPersonalChangesByRowVersion';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.GetPositionChangesByRowVersion') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.GetPositionChangesByRowVersion
	PRINT 'Store procedure Deleted -  ETL.GetPositionChangesByRowVersion';
END
GO
/******************************************************************************
**  Name: GetPositionChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Position table (Position Data)
**  Called By: ETL SQL Job.
**
**  Author: Jesus David Piérola Alvarado
**
**  Created: 27/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------					----------------------------------
**  27/05/2018  Jesus David Piérola Alvarado Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE ETL.GetPositionChangesByRowVersion
(
	@LastRowVersionID BIGINT,
	@CurrentDBTS      BIGINT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT PositionID		= p.position_id
		  ,PositionName		= p.position_name
		  ,PositionParent	= ISNULL(parent_position_position_id,0)
	FROM dbo.position p
	WHERE p.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND p.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	GROUP BY p.position_id
		  ,p.position_name
		  ,ISNULL(parent_position_position_id,0)
END
GO
PRINT 'Creating store procedure GetPositionChangesByRowVersion';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.GetFactIncidentChangesByRowVersion') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.GetFactIncidentChangesByRowVersion
	PRINT 'Store procedure Deleted -  ETL.GetFactIncidentChangesByRowVersion';
END
GO
/******************************************************************************
**  Name: GetFactIncidentChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.incident table (FactIncident Data)
**  Called By: ETL SQL Job.
**
**  Author: Jesus David Piérola Alvarado
**
**  Created: 27/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------					----------------------------------
**  27/05/2018  Jesus David Piérola Alvarado Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE ETL.GetFactIncidentChangesByRowVersion
(
	@LastRowVersionID BIGINT,
	@CurrentDBTS      BIGINT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT PersonalID		 = i.personal_id
		  ,AreaID			 = p.area_area_id
		  ,PositionID		 = ppc.position_id
		  ,EventIncidentID	 = i.incident_id
		  ,[Type]			 = it.incident_type_type
		  ,EventIncidentDate = i.incident_registered_date
	FROM dbo.incident i
			INNER JOIN dbo.incident_detail id ON i.incident_detail_id = id.incident_detail_id
			INNER JOIN dbo.incident_type it ON i.incident_type_id = it.incident_type_id
			INNER JOIN dbo.personals p ON i.personal_id = p.personal_id
			INNER JOIN dbo.personal_position_contract ppc ON p.personal_id = ppc.personal_id
	WHERE i.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND i.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	GROUP BY i.personal_id
		  ,p.area_area_id
		  ,ppc.position_id
		  ,i.incident_id
		  ,it.incident_type_type
		  ,i.incident_registered_date

	UNION 
	--Aumentamos UNION por si hubo cambios en incident_detail (Type)
	SELECT PersonalID		 = i.personal_id
		  ,AreaID			 = p.area_area_id
		  ,PositionID		 = ppc.position_id
		  ,EventIncidentID	 = i.incident_id
		  ,[Type]			 = it.incident_type_type
		  ,EventIncidentDate = i.incident_registered_date
	FROM dbo.incident i
			INNER JOIN dbo.incident_detail id ON i.incident_detail_id = id.incident_detail_id
			INNER JOIN dbo.incident_type it ON i.incident_type_id = it.incident_type_id
			INNER JOIN dbo.personals p ON i.personal_id = p.personal_id
			INNER JOIN dbo.personal_position_contract ppc ON p.personal_id = ppc.personal_id
	WHERE id.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND id.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	GROUP BY i.personal_id
		  ,p.area_area_id
		  ,ppc.position_id
		  ,i.incident_id
		  ,it.incident_type_type
		  ,i.incident_registered_date
END
GO
PRINT 'Creating store procedure GetFactIncidentChangesByRowVersion';
GO