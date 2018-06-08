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
** 05/06/2018   Marcos Bustos Jimenez		Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE [dbo].[GetIncidentByArea] 
	@STARTDATE DATETIME
	,@ENDDATE DATETIME
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	SELECT COUNT(FI.EventIncidentID) NumIncidents
		,FI.Type
		,DA.AreaName
	FROM FactIncident FI
	INNER JOIN DimArea DA ON FI.AreaID = DA.AreaID
	WHERE FI.EventIncidentDate BETWEEN @STARTDATE AND @ENDDATE
	GROUP BY FI.Type, DA.AreaName
	ORDER BY FI.Type, DA.AreaName
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
******************************************************************************/
CREATE PROCEDURE [dbo].[GetIncidentDetails] 
	@STARTDATE DATETIME
	,@ENDDATE DATETIME
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	SELECT FI.EventIncidentDate
		,DP.PersonalFullName
		,DP.PersonalStatus
		,DP.PersonalAge
		,FI.Type
		,DA.AreaName
		,DEI.EventIncidentDetail
		,DEI.EventIncidentSeverity
		,DEI.EventIncidentReportedBy
		,DPT.PositionName
		,DPT.PositionParent
	FROM FactIncident FI
	INNER JOIN DimArea DA ON FI.AreaID = DA.AreaID
	INNER JOIN DimEventIncident DEI ON FI.EventIncidentID = DEI.EventIncidentID
	INNER JOIN DimPersonal DP ON FI.PersonalID = DP.PersonalID
	INNER JOIN DimPosition DPT ON FI.PositionID = DPT.PositionID
	WHERE FI.EventIncidentDate BETWEEN @STARTDATE AND @ENDDATE
END
GO




