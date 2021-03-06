IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.GetPersonalChangesByRowVersion') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.GetPersonalChangesByRowVersion
	PRINT 'Store procedure Deleted -  ETL.GetPersonalChangesByRowVersion';
END
GO
/******************************************************************************
**  Name: GetPersonalChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Personals table (Personal Data)
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
CREATE PROCEDURE ETL.GetPersonalChangesByRowVersion
(
	@LastRowVersionID BIGINT,
	@CurrentDBTS      BIGINT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT PersonalID			= p.personal_id
		  ,PersonalFullName		= p.personal_name + ' ' + p.personal_last_name
		  ,PersonalAge			= DATEDIFF(YEAR,p.personal_birthdate,GETDATE())
		  ,PersonalSatus		= p.personal_active
		  ,PersonalCountEquipa	= COUNT(i.inventory_id)
	FROM dbo.personals p 
			INNER JOIN inventory i ON p.personal_id = i.personal_id
	WHERE p.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND p.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	AND i.active_assignament = 1
	GROUP BY p.personal_id
		  ,p.personal_name + ' ' + p.personal_last_name
		  ,p.personal_birthdate
		  ,p.personal_active

	UNION
	-- Hacemos el UNION, por su hubo cambios en invetory de asignacion de equipamiento en personal
	SELECT PersonalID			= p.personal_id
		  ,PersonalFullName		= p.personal_name + ' ' + p.personal_last_name
		  ,PersonalAge			= DATEDIFF(YEAR,p.personal_birthdate,GETDATE())
		  ,PersonalSatus		= p.personal_active
		  ,PersonalCountEquipa	= COUNT(i.inventory_id)
	FROM dbo.personals p 
			INNER JOIN inventory i ON p.personal_id = i.personal_id
	WHERE i.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND i.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	AND i.active_assignament = 1
	GROUP BY p.personal_id
		  ,p.personal_name + ' ' + p.personal_last_name
		  ,p.personal_birthdate
		  ,p.personal_active
END
GO
PRINT 'Creating store procedure GetPersonalChangesByRowVersion';
GO