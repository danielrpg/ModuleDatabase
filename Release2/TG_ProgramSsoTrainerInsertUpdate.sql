IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Program_sso_trainer(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER TG_Program_sso_trainer(Audit)_InsertUpdate
		PRINT 'EL TRIGGER TG_Program_sso_trainer(Audit)_InsertUpdate SE ELIMINO '

END
GO

--Trigger of Program_sso_trainer Table
/******************************************************************************
**  Name: TG_Program_sso_trainer(Audit)_InsertUpdate
**  Desc: Audit History for program_sso_trainer table
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
CREATE TRIGGER [dbo].[TG_Program_sso_trainer(Audit)_InsertUpdate]
ON [dbo].[program_sso_trainer]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(sso_trainer_skills)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_trainer',
           ColumnName   = 'sso_trainer_skills',
           ID1          = i.sso_trainer_id,
           Date         = @CurrDate,
           OldValue     = d.sso_trainer_skills,
           NewValue     = i.[sso_trainer_skills],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_skills, '') != ISNULL(i.sso_trainer_skills, '');
  END

  IF UPDATE(sso_trainer_ci)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_trainer',
           ColumnName   = 'sso_trainer_ci',
           ID1          = i.sso_trainer_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_trainer_ci],
           NewValue     = i.[sso_trainer_ci],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_ci, '') != ISNULL(i.sso_trainer_ci, '');
  END

    IF UPDATE(sso_trainer_image)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_trainer',
           ColumnName   = 'sso_trainer_image',
           ID1          = i.sso_trainer_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_trainer_image],
           NewValue     = i.[sso_trainer_image],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_image, '') != ISNULL(i.sso_trainer_image, '');
  END

    IF UPDATE(sso_trainer_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_trainer',
           ColumnName   = 'sso_trainer_name',
           ID1          = i.sso_trainer_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_trainer_name],
           NewValue     = i.[sso_trainer_name],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_name, '') != ISNULL(i.sso_trainer_name, '');
  END

      IF UPDATE(sso_trainer_specialty)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_trainer',
           ColumnName   = 'sso_trainer_specialty',
           ID1          = i.sso_trainer_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_trainer_specialty],
           NewValue     = i.[sso_trainer_specialty],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_specialty, '') != ISNULL(i.sso_trainer_specialty, '');
  END

END;



