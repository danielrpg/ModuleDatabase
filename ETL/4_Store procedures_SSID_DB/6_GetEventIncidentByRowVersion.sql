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