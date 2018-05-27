USE [DW_SSI_DB];
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ETL')
	BEGIN	
		EXEC('CREATE SCHEMA [ETL]');
		PRINT 'Schema ETL created!';
	END
ELSE 
	BEGIN
		PRINT 'Schema ETL already exists into the database';
	END
GO


-- Create Table DimPersonal
/******************************************************************************
**  Table Name: DimPersonal
**  Desc: Table for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
PRINT 'Creating the DimPersonal table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimPersonal]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[DimPersonal](
		[PersonalID] [int] NOT NULL,
		[PersonalFullName] [varchar](100) NOT NULL,
		[PersonalAge] [int] NOT NULL,
		[PersonalStatus] [varchar](10) NOT NULL,
		[PersonalCountEquipa] [int] NOT NULL
	 CONSTRAINT [PK_DimPersonal] PRIMARY KEY CLUSTERED 
	(
		[PersonalID] ASC
	))
		PRINT 'Table DimPersonal created!';
	END
ELSE 
	BEGIN
		PRINT 'Table DimPersonal already exists into the database';
	END
GO


-- Create Table DimArea
/******************************************************************************
**  Table Name: DimArea
**  Desc: Table for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
PRINT 'Creating the DimArea table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimArea]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[DimArea](
		[AreaID] [int] NOT NULL,
		[AreaName] [varchar](50) NOT NULL
	 CONSTRAINT [PK_DimArea] PRIMARY KEY CLUSTERED 
	(
		[AreaID] ASC
	))
		PRINT 'Table DimArea created!';
	END
ELSE 
	BEGIN
		PRINT 'Table DimArea already exists into the database';
	END
GO


-- Create Table DimPosition
/******************************************************************************
**  Table Name: DimPosition
**  Desc: Table for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
PRINT 'Creating the DimPosition table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimPosition]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[DimPosition](
		[PositionID] [int] NOT NULL,
		[PositionName] [varchar](150) NOT NULL,
		[PositionParent] [varchar](150) NOT NULL
	 CONSTRAINT [PK_DimPosition] PRIMARY KEY CLUSTERED 
	(
		[PositionID] ASC
	))
		PRINT 'Table DimPosition created!';
	END
ELSE 
	BEGIN
		PRINT 'Table DimPosition already exists into the database';
	END
GO


-- Create Table DimEventIncident
/******************************************************************************
**  Table Name: DimEventIncident
**  Desc: Table for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
PRINT 'Creating the DimEventIncident table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimEventIncident]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[DimEventIncident](
		[EventIncidentID] [int] NOT NULL,
		[EventIncidentDetail] [nvarchar](MAX) NOT NULL,
		[EventIncidentSeverity] [varchar](150) NOT NULL,
		[EventIncidentReportedBy] [varchar](50) NOT NULL
	 CONSTRAINT [PK_DimEventIncident] PRIMARY KEY CLUSTERED 
	(
		[EventIncidentID] ASC
	))
		PRINT 'Table DimEventIncident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table DimEventIncident already exists into the database';
	END
GO


-- Create Table FactIncident
/******************************************************************************
**  Table Name: FactIncident
**  Desc: Table for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
PRINT 'Creating the FactIncident table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[FactIncident]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[FactIncident](
		[PersonalID] [int] NOT NULL,
		[AreaID] [int] NOT NULL,
		[PositionID] [int] NOT NULL,
		[EventIncidentID] [int] NOT NULL,
		[Type] [varchar](50) NOT NULL,
		[EventIncidentDate] [datetime] NOT NULL
	 CONSTRAINT [PK_FactIncident] PRIMARY KEY CLUSTERED 
	(
		[PersonalID] ASC,
		[AreaID] ASC,
		[PositionID] ASC,
		[EventIncidentID] ASC
	))
		PRINT 'Table FactIncident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table FactIncident already exists into the database';
	END
GO


-- Create foreing key FK_DimPersonal
/******************************************************************************
**  Foreing key Name: FK_DimPersonal
**  Desc: Foreing key for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
-- Define the relationship between DimPesonal and FactIncident.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_DimPersonal]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactIncident]'))
ALTER TABLE [dbo].[FactIncident]  WITH CHECK ADD  
       CONSTRAINT [FK_DimPersonal] FOREIGN KEY([PersonalID])
REFERENCES [dbo].[DimPersonal] ([PersonalID])
GO
ALTER TABLE [dbo].[FactIncident] CHECK 
       CONSTRAINT [FK_DimPersonal]
GO


-- Create foreing key FK_DimArea
/******************************************************************************
**  Foreing key Name: FK_DimArea
**  Desc: Foreing key for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
-- Define the relationship between DimArea and FactIncident.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_DimArea]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactIncident]'))
ALTER TABLE [dbo].[FactIncident]  WITH CHECK ADD  
       CONSTRAINT [FK_DimArea] FOREIGN KEY([AreaID])
REFERENCES [dbo].[DimArea] ([AreaID])
GO
ALTER TABLE [dbo].[FactIncident] CHECK 
       CONSTRAINT [FK_DimArea]
GO


-- Create foreing key FK_DimPosition
/******************************************************************************
**  Foreing key Name: FK_DimPosition
**  Desc: Foreing key for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
-- Define the relationship between DimPosition and FactIncident.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_DimPosition]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactIncident]'))
ALTER TABLE [dbo].[FactIncident]  WITH CHECK ADD  
       CONSTRAINT [FK_DimPosition] FOREIGN KEY([PositionID])
REFERENCES [dbo].[DimPosition] ([PositionID])
GO
ALTER TABLE [dbo].[FactIncident] CHECK 
       CONSTRAINT [FK_DimPosition]
GO


-- Create foreing key FK_DimEventIncident
/******************************************************************************
**  Foreing key Name: FK_DimEventIncident
**  Desc: Foreing key for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
-- Define the relationship between DimEventIncident and FactIncident.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_DimEventIncident]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactIncident]'))
ALTER TABLE [dbo].[FactIncident]  WITH CHECK ADD  
       CONSTRAINT [FK_DimEventIncident] FOREIGN KEY([EventIncidentID])
REFERENCES [dbo].[DimEventIncident] ([EventIncidentID])
GO
ALTER TABLE [dbo].[FactIncident] CHECK 
       CONSTRAINT [FK_DimEventIncident]
GO



-- Create Table [ETL].[Personal]
/******************************************************************************
**  Table Name: [ETL].[Personal]
**  Desc: Table for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
PRINT 'Creating the Personal table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Personal]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [ETL].[Personal](
		[PersonalID] [int] NOT NULL,
		[PersonalFullName] [varchar](100) NOT NULL,
		[PersonalAge] [int] NOT NULL,
		[PersonalStatus] [varchar](10) NOT NULL,
		[PersonalCountEquipa] [int] NOT NULL
		)
		PRINT 'Table Personal created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Personal already exists into the database';
	END
GO


-- Create Table [ETL].[Area]
/******************************************************************************
**  Table Name: [ETL].[Area]
**  Desc: Table for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
PRINT 'Creating the Area table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Area]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [ETL].[Area](
		[AreaID] [int] NOT NULL,
		[AreaName] [varchar](50) NOT NULL
	)
		PRINT 'Table Area created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Area already exists into the database';
	END
GO


-- Create Table [ETL].[Position]
/******************************************************************************
**  Table Name: [ETL].[Position]
**  Desc: Table for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
PRINT 'Creating the Position table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Position]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [ETL].[Position](
		[PositionID] [int] NOT NULL,
		[PositionName] [varchar](150) NOT NULL,
		[PositionParent] [varchar](150) NOT NULL
	 )
		PRINT 'Table Position created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Position already exists into the database';
	END
GO


-- Create Table [ETL].[EventIncident]
/******************************************************************************
**  Table Name: [ETL].[EventIncident]
**  Desc: Table for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
PRINT 'Creating the EventIncident table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[EventIncident]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [ETL].[EventIncident](
		[EventIncidentID] [int] NOT NULL,
		[EventIncidentDetail] [nvarchar](MAX) NOT NULL,
		[EventIncidentSeverity] [varchar](150) NOT NULL,
		[EventIncidentReportedBy] [varchar](50) NOT NULL
	)
		PRINT 'Table EventIncident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table EventIncident already exists into the database';
	END
GO


-- Create Table [ETL].[FactIncident]
/******************************************************************************
**  Table Name: [ETL].[FactIncident]
**  Desc: Table for DW_SSI_DB
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Marcos Bustos   Initial version
*******************************************************************************/
PRINT 'Creating the FactIncident table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[FactIncident]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [ETL].[FactIncident](
		[PersonalID] [int] NOT NULL,
		[AreaID] [int] NOT NULL,
		[PositionID] [int] NOT NULL,
		[EventIncidentID] [int] NOT NULL,
		[Type] [varchar](50) NOT NULL,
		[EventIncidentDate] [datetime] NOT NULL
	)
		PRINT 'Table FactIncident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table FactIncident already exists into the database';
	END
GO



