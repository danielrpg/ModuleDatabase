IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Program_sso_activities(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER TG_Program_sso_activities(Audit)_InsertUpdate
		PRINT 'EL TRIGGER TG_Program_sso_activities(Audit)_InsertUpdate SE ELIMINO '

END
GO

--Trigger of Program_sso_activities Table
/******************************************************************************
**  Name: TG_Program_sso(Audit)_InsertUpdate
**  Desc: Audit History for program_sso_activities table
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
** 05/29/2018 Vanessa Alcocer   Initial version
*******************************************************************************/
CREATE TRIGGER [dbo].[TG_Program_sso_activities(Audit)_InsertUpdate]
ON [dbo].[program_sso_activities]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(sso_detail_activities)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_activities',
           ColumnName   = 'sso_detail_activities',
           ID1          = i.sso_detail_id,
           Date         = @CurrDate,
           OldValue     = d.sso_detail_activities,
           NewValue     = i.[sso_detail_activities],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.sso_detail_activities, '') != ISNULL(i.sso_detail_activities, '');
  END

  IF UPDATE(sso_detail_goal)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_activities',
           ColumnName   = 'sso_detail_goal',
           ID1          = i.sso_detail_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_detail_goal],
           NewValue     = i.[sso_detail_goal],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.sso_detail_goal, '') != ISNULL(i.sso_detail_goal, '');
  END

   IF UPDATE(so_detail_number)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_activities',
           ColumnName   = 'sso_detail_number',
           ID1          = i.sso_detail_id,
           Date         = @CurrDate,
           OldValue     = d.[so_detail_number],
           NewValue     = i.[so_detail_number],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.so_detail_number, '') != ISNULL(i.so_detail_number, '');
  END

    IF UPDATE(sso_detail_time)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_activities',
           ColumnName   = 'sso_detail_time',
           ID1          = i.sso_detail_id,
           Date         = @CurrDate,
           OldValue     = d.sso_detail_time,
           NewValue     = i.[sso_detail_time],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.sso_detail_time, '') != ISNULL(i.sso_detail_time, '');
  END

       IF UPDATE(soo_detail_type)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_activities',
           ColumnName   = 'soo_detail_type',
           ID1          = i.sso_detail_id,
           Date         = @CurrDate,
           OldValue     = d.soo_detail_type,
           NewValue     = i.[soo_detail_type],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.soo_detail_type, '') != ISNULL(i.soo_detail_type, '');
  END

END;



