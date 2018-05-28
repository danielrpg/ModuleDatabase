IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergeEventIncident') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergeEventIncident
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergeEventIncident';
END
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