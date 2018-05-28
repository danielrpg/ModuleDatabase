IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergePosition') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergePosition
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergePosition';
END
GO

/******************************************************************************
**  Name: ETL.DW_MergePosition
**  Desc: Merges Source ETL.Position changes into Destination dbo.DimPosition table. 
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
CREATE PROCEDURE [ETL].[DW_MergePosition]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE dbo.DimPosition AS target
	USING ETL.Position AS source
	ON
	(
	  target.PositionID = source.PositionID
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET PositionName   = source.PositionName
			,PositionParent = source.PositionParent
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 PositionID
		,PositionName
		,PositionParent
	  )
	  VALUES
	  (
		source.PositionID
		,source.PositionName
		,source.PositionParent
	  );
END
GO