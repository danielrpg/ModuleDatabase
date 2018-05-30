IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergeFactIncident') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergeFactIncident
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergeFactIncident';
END
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