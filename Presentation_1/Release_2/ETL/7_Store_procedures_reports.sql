USE DW_SSID_DB
GO

-- Creation Store procedures for get incidents in period of time by Area

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'GetIncidentByArea') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE GetIncidentByArea
	PRINT 'Store procedure deleted -  GetIncidentByArea';
END
GO

PRINT 'Creating store procedure GetIncidentByArea';
GO
/******************************************************************************
**  Name: GetIncidentByArea
**  Desc:Store procedures for get incidents in period of time by Area. 
**  Called By: API DW
**
**  Author: Marcos Bustos Jimenez
**
**  Created: 05/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:							Description:
**  --------    --------------					-------------------------------
** 05/06/2018   Marcos Bustos Jimenez			Release 3.0 - DW
** 06/07/2018   Jesus David Piérola Alvarado	Edit Table Name and fields
******************************************************************************/
CREATE PROCEDURE [dbo].[GetIncidentByArea] 
	@STARTDATE DATETIME
	,@ENDDATE DATETIME
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	SELECT COUNT(FI.event_incident_id) NumIncidents
		,FI.type
		,DA.area_name
	FROM dbo.fact_incident FI
	INNER JOIN dbo.dim_area DA ON FI.area_id = DA.area_id
	WHERE FI.event_incident_date BETWEEN @STARTDATE AND @ENDDATE
	GROUP BY FI.Type, DA.area_name
	ORDER BY FI.Type, DA.area_name
END
GO


-- Creation Store procedures for get incidents details

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'GetIncidentDetails') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE GetIncidentDetails
	PRINT 'Store procedure deleted -  GetIncidentDetails';
END
GO

PRINT 'Creating store procedure GetIncidentDetails';
GO
/******************************************************************************
**  Name: GetIncidentDetails
**  Desc:Store procedures for get incidents details.
**  Called By: API DW
**
**  Author: Marcos Bustos Jimenez
**
**  Created: 05/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:							Description:
**  --------    --------------					-------------------------------
** 05/06/2018   Marcos Bustos Jimenez		Release 3.0 - DW
** 06/07/2018   Jesus David Piérola Alvarado	Edit Table Name and fields
******************************************************************************/
CREATE PROCEDURE [dbo].[GetIncidentDetails] 
	@STARTDATE DATETIME
	,@ENDDATE DATETIME
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	SELECT FI.event_incident_date
		,DP.personal_full_name
		,DP.personal_status
		,DP.personal_age
		,FI.type
		,DA.area_name
		,DEI.event_incident_detail
		,DEI.event_incident_severity
		,DEI.event_incident_reported_by
		,DPT.position_name
		,DPT.position_parent
	FROM dbo.fact_incident FI
	INNER JOIN dbo.dim_area DA ON FI.area_id = DA.area_id
	INNER JOIN dbo.dim_event_incident DEI ON FI.event_incident_id = DEI.event_incident_id
	INNER JOIN dbo.dim_personal DP ON FI.personal_id = DP.personal_id
	INNER JOIN dbo.dim_position DPT ON FI.position_id = DPT.position_id
	WHERE FI.event_incident_date BETWEEN @STARTDATE AND @ENDDATE
END
GO
