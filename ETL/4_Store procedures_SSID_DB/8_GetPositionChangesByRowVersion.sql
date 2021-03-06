IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.GetPositionChangesByRowVersion') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.GetPositionChangesByRowVersion
	PRINT 'Store procedure Deleted -  ETL.GetPositionChangesByRowVersion';
END
GO
/******************************************************************************
**  Name: GetPositionChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Position table (Position Data)
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
CREATE PROCEDURE ETL.GetPositionChangesByRowVersion
(
	@LastRowVersionID BIGINT,
	@CurrentDBTS      BIGINT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT PositionID		= p.position_id
		  ,PositionName		= p.position_name
		  ,PositionParent	= ISNULL(parent_position_position_id,0)
	FROM dbo.position p
	WHERE p.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND p.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	GROUP BY p.position_id
		  ,p.position_name
		  ,ISNULL(parent_position_position_id,0)
END
GO
PRINT 'Creating store procedure GetPositionChangesByRowVersion';
GO