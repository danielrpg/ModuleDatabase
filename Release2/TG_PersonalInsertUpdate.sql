--Trigger of PersonalsTable
/******************************************************************************
**  Name: TG_Personals(Audit)_InsertUpdate
**  Desc: Audit History for User table
** 
**  Called by: ssi
**
**  Author: Boris Medrano
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Boris Medrano   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Personals(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Personals(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Personals(Audit)_InsertUpdate SE ELIMINO '

END    
GO
CREATE TRIGGER [dbo].[TG_Personals(Audit)_InsertUpdate]
ON [dbo].[personals]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(personal_active)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_active',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_active], 
           NewValue     = i.[personal_active],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_active, '') != ISNULL(i.personal_active, '');
  END
   
  IF UPDATE(personal_direction)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_direction',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_direction], 
           NewValue     = i.[personal_direction],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_direction, '') != ISNULL(i.personal_direction, '');
  END
  IF UPDATE(personal_cellphone)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_cellphone',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_cellphone], 
           NewValue     = i.[personal_cellphone],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_cellphone, '') != ISNULL(i.personal_cellphone, '');
  END
  IF UPDATE(personal_email)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_email',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_email], 
           NewValue     = i.[personal_email],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_email, '') != ISNULL(i.personal_email, '');
  END
  IF UPDATE(personal_last_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_last_name',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_last_name], 
           NewValue     = i.[personal_last_name],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_last_name, '') != ISNULL(i.personal_last_name, '');
  END
   IF UPDATE(personal_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_name',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_name], 
           NewValue     = i.[personal_name],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_name, '') != ISNULL(i.personal_name, '');
  END

   IF UPDATE(personal_telephone)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_telephone',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_telephone], 
           NewValue     = i.[personal_telephone],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_telephone, '') != ISNULL(i.personal_telephone, '');
  END
  IF UPDATE(area_area_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'area_area_id',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[area_area_id], 
           NewValue     = i.[area_area_id],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.area_area_id, '') != ISNULL(i.area_area_id, '');
  END
   
END;
