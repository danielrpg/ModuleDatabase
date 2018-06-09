IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_Mergefact_incident') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_Mergefact_incident
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_Mergefact_incident';
END
GO

/******************************************************************************
**  Name: ETL.DW_Mergefact_incident
**  Desc: Merges Source ETL.fact_incident changes into Destination dbo.fact_incident table. 
**  Called By: SQL Job ETL
**
**  Author: Jes�s David Pi�rola Alvarado
**
**  Created: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:							Description:
**  --------    --------------					-------------------------------
** 28/05/2018   Jes�s David Pi�rola Alvarado    Release 3.0 - DW
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