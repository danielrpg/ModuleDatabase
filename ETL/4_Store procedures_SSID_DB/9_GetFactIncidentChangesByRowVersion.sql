IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.GetFactIncidentChangesByRowVersion') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.GetFactIncidentChangesByRowVersion
	PRINT 'SE HA ELIMINADO EL SP ETL.GetFactIncidentChangesByRowVersion';
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

	SELECT PersonalID		 = i.personal_personal_id
		  ,AreaID			 = p.area_area_id
		  ,PositionID		 = ppc.position_id
		  ,EventIncidentID	 = i.incident_id
		  ,[Type]			 = id.incident_detail_type
		  ,EventIncidentDate = i.date_at
	FROM dbo.incident i
			INNER JOIN dbo.incident_detail id ON i.incident_detail_id = id.incident_detail_id
			INNER JOIN dbo.personals p ON i.personal_personal_id = p.personal_id
			INNER JOIN dbo.personal_position_contract ppc ON p.personal_id = ppc.personal_id
	WHERE i.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND i.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	GROUP BY i.personal_personal_id
		  ,p.area_area_id
		  ,ppc.position_id
		  ,i.incident_id
		  ,id.incident_detail_type
		  ,i.date_at

	UNION 
	--Aumentamos UNION por si hubo cambios en incident_detail (Type)
	SELECT PersonalID		 = i.personal_personal_id
		  ,AreaID			 = p.area_area_id
		  ,PositionID		 = ppc.position_id
		  ,EventIncidentID	 = i.incident_id
		  ,[Type]			 = id.incident_detail_type
		  ,EventIncidentDate = i.date_at
	FROM dbo.incident i
			INNER JOIN dbo.incident_detail id ON i.incident_detail_id = id.incident_detail_id
			INNER JOIN dbo.personals p ON i.personal_personal_id = p.personal_id
			INNER JOIN dbo.personal_position_contract ppc ON p.personal_id = ppc.personal_id
	WHERE id.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND id.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	GROUP BY i.personal_personal_id
		  ,p.area_area_id
		  ,ppc.position_id
		  ,i.incident_id
		  ,id.incident_detail_type
		  ,i.date_at
END
GO