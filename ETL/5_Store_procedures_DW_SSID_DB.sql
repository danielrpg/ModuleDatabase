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
	PRINT 'Store procedure deleted - ETL.DW_MergeArea';
END
GO

PRINT 'Creating store procedure DW_MergeArea';
GO
/******************************************************************************
**  Name: ETL.DW_MergeArea
**  Desc: Merges Source ETL.Area changes into Destination dbo.dim_area table. 
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
	MERGE dbo.dim_area AS target
	USING ETL.Area AS source
	ON
	(
	  target.area_id = source.area_id
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET area_name   = source.area_name
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 area_id
		,area_name
	  )
	  VALUES
	  (
		source.area_id
		,source.area_name
	  );
END
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergeEventIncident') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergeEventIncident
	PRINT 'Store procedure deleted - ETL.DW_MergeEventIncident';
END
GO

PRINT 'Creating store procedure DW_MergeEventIncident';
GO
/******************************************************************************
**  Name: ETL.DW_MergeEventIncident
**  Desc: Merges Source ETL.EventIncident changes into Destination dbo.dim_event_incident table. 
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
	MERGE dbo.dim_event_incident AS target
	USING ETL.EventIncident AS source
	ON
	(
	  target.event_incident_id = source.event_incident_id
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET event_incident_detail   = source.event_incident_detail
			,event_incident_severity = source.event_incident_severity
			,event_incident_reported_by = source.event_incident_reported_by
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 event_incident_id
		,event_incident_detail
		,event_incident_severity
		,event_incident_reported_by
	  )
	  VALUES
	  (
		source.event_incident_id
		,source.event_incident_detail
		,source.event_incident_severity
		,source.event_incident_reported_by
	  );
END
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_Mergefact_incident') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_Mergefact_incident
	PRINT 'Store procedure deleted - ETL.DW_Mergefact_incident';
END
GO

PRINT 'Creating store procedure DW_Mergefact_incident';
GO
/******************************************************************************
**  Name: ETL.DW_Mergefact_incident
**  Desc: Merges Source ETL.fact_incident changes into Destination dbo.fact_incident table. 
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
CREATE PROCEDURE [ETL].[DW_Mergefact_incident]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE dbo.fact_incident AS target
	USING ETL.fact_incident AS source
	ON
	(
	  target.personal_id = source.personal_id
	  AND target.area_id = source.area_id
	  AND target.position_id = source.position_id
	  AND target.event_incident_id = source.event_incident_id
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [type]				= source.[type]
			,event_incident_date  = source.event_incident_date
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 personal_id
		,area_id
		,position_id
		,event_incident_id
		,[type]
		,event_incident_date
	  )
	  VALUES
	  (
		source.personal_id
		,source.area_id
		,source.position_id
		,source.event_incident_id
		,source.[type]
		,source.event_incident_date
	  );
END
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergePersonal') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergePersonal
	PRINT 'Store procedure deleted - ETL.DW_MergePersonal';
END
GO

PRINT 'Creating store procedure DW_MergePersonal';
GO
/******************************************************************************
**  Name: ETL.DW_MergePersonal
**  Desc: Merges Source ETL.Personal changes into Destination dbo.dim_personal table. 
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
	MERGE dbo.dim_personal AS target
	USING ETL.Personal AS source
	ON
	(
	  target.personal_id = source.personal_id
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET personal_full_name   = source.personal_full_name
			,personal_age		= source.personal_age
			,personal_status		= source.personal_status
			,personal_count_equipa = source.personal_count_equipa
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 personal_id
		,personal_full_name
		,personal_age
		,personal_status
		,personal_count_equipa
	  )
	  VALUES
	  (
		source.personal_id
		,source.personal_full_name
		,source.personal_age
		,source.personal_status
		,source.personal_count_equipa
	  );
END
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergePosition') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergePosition
	PRINT 'Store procedure deleted - ETL.DW_MergePosition';
END
GO

PRINT 'Creating store procedure DW_MergePosition';
GO
/******************************************************************************
**  Name: ETL.DW_MergePosition
**  Desc: Merges Source ETL.Position changes into Destination dbo.dim_position table. 
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
	MERGE dbo.dim_position AS target
	USING ETL.Position AS source
	ON
	(
	  target.position_id = source.position_id
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET position_name   = source.position_name
			,position_parent = source.position_parent
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 position_id
		,position_name
		,position_parent
	  )
	  VALUES
	  (
		source.position_id
		,source.position_name
		,source.position_parent
	  );
END
GO