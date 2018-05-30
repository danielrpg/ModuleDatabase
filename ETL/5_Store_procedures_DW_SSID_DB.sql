USE DW_SSID_DB
GO

/******************************************************************************
**  Name: 5_Store_procedures_DW_SSID_DB
**  Desc: Global Script to DW in DW_SSID_DB Database for Merge data
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

-- Creation Store procedures Merge

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergeArea') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergeArea
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergeArea';
END
GO

PRINT 'Creating store procedure DW_MergeArea';
GO
/******************************************************************************
**  Name: ETL.DW_MergeArea
**  Desc: Merges Source ETL.Area changes into Destination dbo.DimArea table. 
**  Called By: SQL Job ETL
**
**  Author: Jesús David Piérola Alvarado
**
**  Created: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:							Description:
**  --------    --------------					-------------------------------
** 28/05/2018   Jesús David Piérola Alvarado    Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE [ETL].[DW_MergeArea]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE dbo.DimArea AS target
	USING ETL.Area AS source
	ON
	(
	  target.AreaID = source.AreaID
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET AreaName   = source.AreaName
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 AreaID
		,AreaName
	  )
	  VALUES
	  (
		source.AreaID
		,source.AreaName
	  );
END
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergeEventIncident') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergeEventIncident
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergeEventIncident';
END
GO

PRINT 'Creating store procedure DW_MergeEventIncident';
GO
/******************************************************************************
**  Name: ETL.DW_MergeEventIncident
**  Desc: Merges Source ETL.EventIncident changes into Destination dbo.DimEventIncident table. 
**  Called By: SQL Job ETL
**
**  Author: Jesús David Piérola Alvarado
**
**  Created: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:							Description:
**  --------    --------------					-------------------------------
** 28/05/2018   Jesús David Piérola Alvarado    Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE [ETL].[DW_MergeEventIncident]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE dbo.DimEventIncident AS target
	USING ETL.EventIncident AS source
	ON
	(
	  target.EventIncidentID = source.EventIncidentID
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET EventIncidentDetail   = source.EventIncidentDetail
			,EventIncidentSeverity = source.EventIncidentSeverity
			,EventIncidentReportedBy = source.EventIncidentReportedBy
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 EventIncidentID
		,EventIncidentDetail
		,EventIncidentSeverity
		,EventIncidentReportedBy
	  )
	  VALUES
	  (
		source.EventIncidentID
		,source.EventIncidentDetail
		,source.EventIncidentSeverity
		,source.EventIncidentReportedBy
	  );
END
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergeFactIncident') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergeFactIncident
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergeFactIncident';
END
GO

PRINT 'Creating store procedure DW_MergeFactIncident';
GO
/******************************************************************************
**  Name: ETL.DW_MergeFactIncident
**  Desc: Merges Source ETL.FactIncident changes into Destination dbo.FactIncident table. 
**  Called By: SQL Job ETL
**
**  Author: Jesús David Piérola Alvarado
**
**  Created: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:							Description:
**  --------    --------------					-------------------------------
** 28/05/2018   Jesús David Piérola Alvarado    Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE [ETL].[DW_MergeFactIncident]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE dbo.FactIncident AS target
	USING ETL.FactIncident AS source
	ON
	(
	  target.PersonalID = source.PersonalID
	  AND target.AreaID = source.AreaID
	  AND target.PositionID = source.PositionID
	  AND target.EventIncidentID = source.EventIncidentID
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [Type]				= source.[Type]
			,EventIncidentDate  = source.EventIncidentDate
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 PersonalID
		,AreaID
		,PositionID
		,EventIncidentID
		,[Type]
		,EventIncidentDate
	  )
	  VALUES
	  (
		source.PersonalID
		,source.AreaID
		,source.PositionID
		,source.EventIncidentID
		,source.[Type]
		,source.EventIncidentDate
	  );
END
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergePersonal') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergePersonal
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergePersonal';
END
GO

PRINT 'Creating store procedure DW_MergePersonal';
GO
/******************************************************************************
**  Name: ETL.DW_MergePersonal
**  Desc: Merges Source ETL.Personal changes into Destination dbo.DimPersonal table. 
**  Called By: SQL Job ETL
**
**  Author: Jesús David Piérola Alvarado
**
**  Created: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:							Description:
**  --------    --------------					-------------------------------
** 28/05/2018   Jesús David Piérola Alvarado    Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE [ETL].[DW_MergePersonal]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE dbo.DimPersonal AS target
	USING ETL.Personal AS source
	ON
	(
	  target.PersonalID = source.PersonalID
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET PersonalFullName   = source.PersonalFullName
			,PersonalAge		= source.PersonalAge
			,PersonalStatus		= source.PersonalStatus
			,PersonalCountEquipa = source.PersonalCountEquipa
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 PersonalID
		,PersonalFullName
		,PersonalAge
		,PersonalStatus
		,PersonalCountEquipa
	  )
	  VALUES
	  (
		source.PersonalID
		,source.PersonalFullName
		,source.PersonalAge
		,source.PersonalStatus
		,source.PersonalCountEquipa
	  );
END
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergePosition') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergePosition
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergePosition';
END
GO

PRINT 'Creating store procedure DW_MergePosition';
GO
/******************************************************************************
**  Name: ETL.DW_MergePosition
**  Desc: Merges Source ETL.Position changes into Destination dbo.DimPosition table. 
**  Called By: SQL Job ETL
**
**  Author: Jesús David Piérola Alvarado
**
**  Created: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:							Description:
**  --------    --------------					-------------------------------
** 28/05/2018   Jesús David Piérola Alvarado    Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE [ETL].[DW_MergePosition]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE dbo.DimPosition AS target
	USING ETL.Position AS source
	ON
	(
	  target.PositionID = source.PositionID
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET PositionName   = source.PositionName
			,PositionParent = source.PositionParent
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 PositionID
		,PositionName
		,PositionParent
	  )
	  VALUES
	  (
		source.PositionID
		,source.PositionName
		,source.PositionParent
	  );
END
GO