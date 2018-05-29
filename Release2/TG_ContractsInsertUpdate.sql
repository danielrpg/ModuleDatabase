--Trigger of ContractsTable
/******************************************************************************
**  Name: TG_Contracts(Audit)_InsertUpdate
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
CREATE TRIGGER [dbo].[TG_Contracts(Audit)_InsertUpdate]
ON [dbo].[contracts]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(contract_code)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'contracts', 
           ColumnName   = 'contract_code',
           ID1          = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[contract_code], 
           NewValue     = i.[contract_code],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_code, '') != ISNULL(i.contract_code, '');
  END
  IF UPDATE(contract_city)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'contracts', 
           ColumnName   = 'contract_city',
           ID1          = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[contract_city], 
           NewValue     = i.[contract_city],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_city, '') != ISNULL(i.contract_city, '');
  END
 IF UPDATE(contract_type)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'contracts', 
           ColumnName   = 'contract_type',
           ID1          = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[contract_type], 
           NewValue     = i.[contract_type],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_type, '') != ISNULL(i.contract_type, '');
  END
 IF UPDATE(contract_date)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'contracts', 
           ColumnName   = 'contract_date',
           ID1          = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[contract_date], 
           NewValue     = i.[contract_date],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_date, '') != ISNULL(i.contract_date, '');
  END
  IF UPDATE(contract_salary)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'contracts', 
           ColumnName   = 'contract_salary',
           ID1          = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[contract_salary], 
           NewValue     = i.[contract_salary],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_salary, '') != ISNULL(i.contract_salary, '');
  END
 IF UPDATE(contract_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'contracts', 
           ColumnName   = 'contract_description',
           ID1          = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[contract_description], 
           NewValue     = i.[contract_description],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_description, '') != ISNULL(i.contract_description, '');
  END
 
  
END;
