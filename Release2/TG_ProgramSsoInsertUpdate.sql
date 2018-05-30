--====================================
--  Create database trigger template
--====================================

--Trigger of Program_sso Table
/******************************************************************************
**  Name: TG_Program_sso(Audit)_InsertUpdate
**  Desc: Audit History for program_sso table
**
**  Called by: ssi
**
**  Author: Patsy Vanessa Alcocer Iriarte
**
**  Date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Vanessa Alcocer   Initial version
*******************************************************************************/
CREATE TRIGGER [dbo].[TG_Program_sso(Audit)_InsertUpdate]
ON [dbo].[program_sso]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(sso_execution_time)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso',
           ColumnName   = 'sso_execution_time',
           ID1          = i.sso_id,
           Date         = @CurrDate,
           OldValue     = d.sso_execution_time,
           NewValue     = i.[sso_execution_time],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_execution_time, '') != ISNULL(i.sso_execution_time, '');
  END

  IF UPDATE(sso_goal)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso',
           ColumnName   = 'sso_goal',
           ID1          = i.sso_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_goal],
           NewValue     = i.[sso_goal],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_goal, '') != ISNULL(i.sso_goal, '');
  END

    IF UPDATE(sso_indicator)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso',
           ColumnName   = 'sso_indicator',
           ID1          = i.sso_id,
           Date         = @CurrDate,
           OldValue     = d.sso_indicator,
           NewValue     = i.[sso_indicator],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_indicator, '') != ISNULL(i.sso_indicator, '');
  END

    IF UPDATE(sso_objetive)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso',
           ColumnName   = 'sso_objetive',
           ID1          = i.sso_id,
           Date         = @CurrDate,
           OldValue     = d.sso_objetive,
           NewValue     = i.[sso_objetive],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_objetive, '') != ISNULL(i.sso_objetive, '');
  END

      IF UPDATE(sso_responsable)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso',
           ColumnName   = 'sso_responsable',
           ID1          = i.sso_id,
           Date         = @CurrDate,
           OldValue     = d.sso_responsable,
           NewValue     = i.[sso_responsable],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_responsable, '') != ISNULL(i.sso_responsable, '');
  END

        IF UPDATE(sso_total_cost)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso',
           ColumnName   = 'sso_total_cost',
           ID1          = i.sso_id,
           Date         = @CurrDate,
           OldValue     = d.sso_total_cost,
           NewValue     = i.[sso_total_cost],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_total_cost, '') != ISNULL(i.sso_total_cost, '');
  END

END;



