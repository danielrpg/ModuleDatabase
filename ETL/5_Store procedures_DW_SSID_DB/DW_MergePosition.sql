IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergePosition') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergePosition
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergePosition';
END
GO

/******************************************************************************
**  Name: ETL.DW_MergePosition
**  Desc: Merges Source ETL.Position changes into Destination dbo.dim_position table. 
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
	MERGE dbo.dim_position AS target
	USING ETL.Position AS source
	ON
	(
	  target.position_id = source.position_id
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET position_name   = source.position_name
			,position_parent = source.position_parent
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 position_id
		,position_name
		,position_parent
	  )
	  VALUES
	  (
		source.position_id
		,source.position_name
		,source.position_parent
	  );
END
GO