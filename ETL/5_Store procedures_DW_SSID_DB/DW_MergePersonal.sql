IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergePersonal') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergePersonal
	PRINT 'SE HA ELIMINADO EL SP ETL.DW_MergePersonal';
END
GO

/******************************************************************************
**  Name: ETL.DW_MergePersonal
**  Desc: Merges Source ETL.Personal changes into Destination dbo.DimPersonal table. 
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
CREATE PROCEDURE [ETL].[DW_MergePersonal]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE dbo.DimPersonal AS target
	USING ETL.Personal AS source
	ON
	(
	  target.PersonalID = source.PersonalID
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET PersonalFullName   = source.PersonalFullName
			,PersonalAge		= source.PersonalAge
			,PersonalStatus		= source.PersonalStatus
			,PersonalCountEquipa = source.PersonalCountEquipa
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 PersonalID
		,PersonalFullName
		,PersonalAge
		,PersonalStatus
		,PersonalCountEquipa
	  )
	  VALUES
	  (
		source.PersonalID
		,source.PersonalFullName
		,source.PersonalAge
		,source.PersonalStatus
		,source.PersonalCountEquipa
	  );
END
GO