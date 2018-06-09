IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.DW_MergePersonal') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.DW_MergePersonal
	PRINT 'Store procedure deleted - ETL.DW_MergePersonal';
END
GO

PRINT 'Creating store procedure DW_MergePersonal';
GO
/******************************************************************************
**  Name: ETL.DW_MergePersonal
**  Desc: Merges Source ETL.Personal changes into Destination dbo.dim_personal table. 
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
	MERGE dbo.dim_personal AS target
	USING ETL.Personal AS source
	ON
	(
	  target.personal_id = source.personal_id
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET personal_full_name   = source.personal_full_name
			,personal_age		= ISNULL(source.personal_age,0)
			,personal_status		= source.personal_status
			,personal_count_equipa = source.personal_count_equipa
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 personal_id
		,personal_full_name
		,personal_age
		,personal_status
		,personal_count_equipa
	  )
	  VALUES
	  (
		source.personal_id
		,source.personal_full_name
		,ISNULL(source.personal_age,0)
		,source.personal_status
		,source.personal_count_equipa
	  );
END
GO