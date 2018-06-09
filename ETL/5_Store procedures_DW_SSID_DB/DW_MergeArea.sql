IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergeArea') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergeArea
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergeArea';
END
GO

/******************************************************************************
**  Name: ETL.DW_MergeArea
**  Desc: Merges Source ETL.Area changes into Destination dbo.dim_area table. 
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
	MERGE dbo.dim_area AS target
	USING ETL.Area AS source
	ON
	(
	  target.area_id = source.area_id
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET area_name   = source.area_name
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 area_id
		,area_name
	  )
	  VALUES
	  (
		source.area_id
		,source.area_name
	  );
END
GO