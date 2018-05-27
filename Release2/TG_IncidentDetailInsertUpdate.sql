--Trigger of Incident_detail
/******************************************************************************
**  Name: TG_IncidentDetail(Audit)_InsertUpdate
**  Desc: Audit History for Incident detail table
** 
**  Called by: ssi
**
**  Author: Christian Tola
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Christian Tola   Initial version
*******************************************************************************/
CREATE TRIGGER [dbo].[TG_IncidentDetail(Audit)_InsertUpdate]
ON [dbo].[Incident_detail]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(incident_detail_status)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident_detail', 
           ColumnName   = 'incident_detail_status',
           ID1          = i.incident_detail_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_detail_status], 
           NewValue     = i.[incident_detail_status],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_detail_id = i.incident_detail_id)
    WHERE ISNULL(d.incident_detail_status, '') != ISNULL(i.incident_detail_status, '');
  END
  IF UPDATE(incident_detail_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident_detail', 
           ColumnName   = 'incident_detail_name',
           ID1          = i.incident_detail_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_detail_name], 
           NewValue     = i.[incident_detail_name],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_detail_id = i.incident_detail_id)
    WHERE ISNULL(d.incident_detail_name, '') != ISNULL(i.incident_detail_name, '');
  END
  IF UPDATE(incident_detail_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident_detail', 
           ColumnName   = 'incident_detail_description',
           ID1          = i.incident_detail_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_detail_description], 
           NewValue     = i.[incident_detail_description],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_detail_id = i.incident_detail_id)
    WHERE ISNULL(d.incident_detail_description, '') != ISNULL(i.incident_detail_description, '');
  END
END;
