USE ssidev;
GO
-- Create Table Incident_type
/******************************************************************************
**  Table Name: Incident_type
**  Desc: Table for Incident_type
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
PRINT 'Creating the Incident_type table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Incident_type]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Incident_type]([incident_type_id] INT IDENTITY(1,1) NOT NULL
										,[incident_type_name] VARCHAR(50) CONSTRAINT NN_IncidentTypeName NOT NULL
										,[incident_type_description] VARCHAR(50) CONSTRAINT NN_IncidentTypeDesc NOT NULL
										,[incident_type_type] VARCHAR(50) CONSTRAINT NN_IncidentType NOT NULL
										,[incident_type_subtype] VARCHAR(50) CONSTRAINT NN_IncidentTypeSubType NOT NULL
										,[CreatedBy] INT         NOT NULL
									    ,[CreatedDate] DATETIME  NOT NULL
									    ,[ModifiedBy] DATETIME   NOT NULL
									    ,[ModifiedDate] DATETIME NOT NULL
		,CONSTRAINT [PK_Incident_Type] PRIMARY KEY
		(
			[incident_type_id] ASC
		));

		PRINT 'Table Incident_type created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Incident_type already exists into the database';
	END
GO

-- Create Table Incident_detail
/******************************************************************************
**  Table Name: Incident_detail
**  Desc: Table for Incident_detail
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
PRINT 'Creating the Incident_detail table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Incident_detail]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Incident_detail]([incident_detail_id] INT IDENTITY(1,1) NOT NULL
										,[incident_detail_status] BIT CONSTRAINT NN_IncidentDetailStatus NOT NULL
										,[incident_detail_name] VARCHAR(50) CONSTRAINT NN_IncidentDetailName NOT NULL
										,[incident_detail_description] VARCHAR(200) CONSTRAINT NN_IncidentDetailDescription NOT NULL
										,[CreatedBy] INT         NOT NULL
									    ,[CreatedDate] DATETIME  NOT NULL
									    ,[ModifiedBy] DATETIME   NOT NULL
									    ,[ModifiedDate] DATETIME NOT NULL
		 CONSTRAINT [PK_Incident_Type] PRIMARY KEY
		(
			[incident_detail_id] ASC
		));

		PRINT 'Table Incident_detail created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Incident_detail already exists into the database';
	END
GO
-- Create Table Incident
/******************************************************************************
**  Table Name: Incident
**  Desc: Table for Incident
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
PRINT 'Creating the Incident table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Incident]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Incident]([incident_id] INT IDENTITY(1,1) NOT NULL
										,[incident_code] VARCHAR(10) CONSTRAINT NN_IncidentCode NOT NULL
										,[incident_number] INT CONSTRAINT NN_IncidentNumber NOT NULL
										,[incident_registered_date] DATETIME CONSTRAINT NN_IncidentRegisteredDate NOT NULL
										,[incident_area] VARCHAR(50) CONSTRAINT NN_IncidentArea NOT NULL
										,[incident_reincident] BIT CONSTRAINT NN_IncidentReincident NOT NULL
										,[incident_treatment] BIT CONSTRAINT NN_IncidentTreatment NOT NULL
										,[CreatedBy] INT         NOT NULL
									    ,[CreatedDate] DATETIME  NOT NULL
									    ,[ModifiedBy] DATETIME   NOT NULL
									    ,[ModifiedDate] DATETIME NOT NULL
		 CONSTRAINT [PK_Incident_Type] PRIMARY KEY
		(
			[incident_id] ASC
		));

		PRINT 'Table Incident created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Incident already exists into the database';
	END
GO
