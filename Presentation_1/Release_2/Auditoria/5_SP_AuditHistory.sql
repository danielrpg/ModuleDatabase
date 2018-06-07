USE [SSID]
GO

IF EXISTS (SELECT 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_AuditHistory]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_AuditHistory
		PRINT 'Store procedure deleted -  [sp_AuditHistory]';
	END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/******************************************************************************
**  Name: SP_AuditHistory
**  Desc: Returns the audit history for a depending on the table name,
**        column name and id
**
**  Author: Vanessa Alcocer
**
**  Parameters:
**  Input
**  ----------
**  @StartDate DateTime
**  @EndDate DateTime
**
**  Created: 03/06/2018
*****************************************************************************************************
**                            Change History
*****************************************************************************************************
**  Date:       Author:        Description:
**  --------    --------      -----------------------------------------------------------------------
** 03/06/2018 Vanessa Alcocer  AuditHistory StoreProcedure creation.
** 06/06/2018 Vanessa Alcocer  AuditHistory Adding startDate and endDate as Parameters.
*****************************************************************************************************/
CREATE PROCEDURE [dbo].[sp_AuditHistory]
  @StartDate DateTime = NULL,
 @EndDate DateTime = NULL
 WITH RECOMPILE
AS
BEGIN
  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
  SET NOCOUNT ON;

  -- Create temp tblAuditHistory table in memory
  DECLARE @tblAuditHistory TABLE (AuditHistoryId INT
                                  ,TableName NVARCHAR(MAX)
								  ,ColumnName NVARCHAR(MAX)
                                  ,ID INT
                                  ,[Date] DATETIME
								  ,OldValue NVARCHAR(MAX)
                                  ,NewValue NVARCHAR(MAX)
								  ,ModifiedDate DATETIME
                                  ,ModifiedBy NVARCHAR(MAX));


      --Insert Rows in the New Table

	  INSERT INTO @tblAuditHistory(AuditHistoryId
									   ,TableName
									   ,ColumnName
									   ,ID
									    ,[Date]
										,OldValue
										,NewValue
									   ,ModifiedDate
									   ,ModifiedBy)

		  SELECT ah.AuditHistoryId
				 ,ah.TableName
				 ,ah.ColumnName
				 ,ah.ID
				  ,ah.[Date]
				  ,ah.OldValue
				 ,ah.NewValue
				 ,ModifiedDate
				 ,ModifiedBy = ah.ModifiedBy
		  FROM dbo.AuditHistory ah
		  LEFT JOIN dbo.users u ON (ah.ModifiedBy = u.user_name)
		  WHERE (ah.ModifiedDate) between @StartDate and @EndDate;


		-- Return @AuditHistory values
		SELECT
		  AuditHistoryId
		  ,TableName
		  ,ColumnName
		  ,ID
		  ,[Date]
		  ,OldValue
		  ,NewValue
		  ,ModifiedDate
		  ,ModifiedBy
		FROM @tblAuditHistory

	  END
GO
  PRINT 'Store procedure CREATED -  [sp_AuditHistory]';
GO


