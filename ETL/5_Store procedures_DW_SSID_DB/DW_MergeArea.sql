IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergeArea') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergeArea
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergeArea';
END
GO

/******************************************************************************
**  Name: ETL.DW_MergeArea
**  Desc: Merges Source ETL.Area changes into Destination dbo.DimArea table. 
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
CREATE PROCEDURE [ETL].[DW_MergeArea]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE dbo.DimArea AS target
	USING ETL.Area AS source
	ON
	(
	  target.AreaID = source.AreaID
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET AreaName   = source.AreaName
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 AreaID
		,AreaName
	  )
	  VALUES
	  (
		source.AreaID
		,source.AreaName
	  );
END
GO