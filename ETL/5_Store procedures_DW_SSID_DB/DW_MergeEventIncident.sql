IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergeEventIncident') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergeEventIncident
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergeEventIncident';
END
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