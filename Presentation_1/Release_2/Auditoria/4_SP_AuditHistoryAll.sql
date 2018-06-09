USE [SSID2]
GO

IF EXISTS (SELECT 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_AuditHistoryAll]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_AuditHistoryAll
		PRINT 'Store procedure deleted -  [sp_AuditHistoryAll]';
	END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/******************************************************************************
**  Name: SP_AuditHistoryAll
**  Desc: Returns the audit history table
**
**  Author: Christian Tola
**
**  Parameters:
**
**  ----------
**
**  Created: 03/06/2018
*****************************************************************************************************
**                            Change History
*****************************************************************************************************
**  Date:       Author:        Description:
**  --------    --------      -----------------------------------------------------------------------
** 08/06/2018 Christian Tola   AuditHistoryAll StoreProcedure creation.
*****************************************************************************************************/
CREATE PROCEDURE [dbo].[sp_AuditHistoryAll]
 WITH RECOMPILE
AS
BEGIN
  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
  SET NOCOUNT ON;

  -- Create temp tblAuditHistory table in memory
  DECLARE @tblAuditHistory TABLE (audit_id INT
                                  ,table_name NVARCHAR(MAX)
								  ,column_name NVARCHAR(MAX)
                                  ,id INT
                                  ,[date] DATETIME
								  ,old_value NVARCHAR(MAX)
                                  ,new_value NVARCHAR(MAX)
								  ,modified_date DATETIME
                                  ,modified_by NVARCHAR(MAX));


      --Insert Rows in the New Table

	  INSERT INTO @tblAuditHistory(audit_id
									   ,table_name
									   ,column_name
									   ,id
									    ,[date]
										,old_value
										,new_value
									   ,modified_date
									   ,modified_by)

		  SELECT ah.audit_id
				 ,ah.table_name
				 ,ah.column_name
				 ,ah.id
				  ,ah.[date]
				  ,ah.old_value
				 ,ah.new_value
				 ,ah.modified_date
				 ,modified_by = ah.modified_by
		  FROM dbo.audithistory ah
		  LEFT JOIN dbo.users u ON (ah.modified_by = u.user_name)

		-- Return @AuditHistory values
		SELECT
		  audit_id
		  ,table_name
		  ,column_name
		  ,id
		  ,[date]
		  ,old_value
		  ,new_value
		  ,modified_date
		  ,modified_by
		FROM @tblAuditHistory

	  END
GO
  PRINT 'Store procedure CREATED -  [sp_AuditHistoryAll]';
GO