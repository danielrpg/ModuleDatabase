--Trigger of IncidentTable
/******************************************************************************
**  Name: TG_Incident(Audit)_InsertUpdate
**  Desc: Audit History for Incident table
** 
**  Called by: ssi
**
**  Author: Christian Tola
**
**  Date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/21/2018 Christian Tola   Initial version
*******************************************************************************/
CREATE TRIGGER [dbo].[TG_Incident(Audit)_InsertUpdate]
ON [dbo].[Incident]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  --incident_code
  IF UPDATE(incident_code)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident', 
           ColumnName   = 'incident_code',
           ID1          = i.incident_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_code], 
           NewValue     = i.[incident_code],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_code, '') != ISNULL(i.incident_code, '');
  END
  --incident_number
  IF UPDATE(incident_number)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident', 
           ColumnName   = 'incident_number',
           ID1          = i.incident_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_number], 
           NewValue     = i.[incident_number],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_number, '') != ISNULL(i.incident_number, '');
  END
  --incident_area
  IF UPDATE(incident_area)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident', 
           ColumnName   = 'incident_area',
           ID1          = i.incident_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_area], 
           NewValue     = i.[incident_area],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_area, '') != ISNULL(i.incident_area, '');
  END
END;
