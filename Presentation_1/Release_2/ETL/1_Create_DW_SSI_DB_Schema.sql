/******************************************************************************
**  Name: create schema for DW_SSI_DB
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
** 26/05/2018 Marcos Bustos						Initial version
** 06/06/2018 Jesus David Piérola Alvarado		Edited all names for not use CamelCase, Change Type IDs and NVARCHAR
*******************************************************************************/

-- Creamos o usamos DB para DW
IF NOT EXISTS(
	SELECT *
	FROM sys.databases
	WHERE name = 'DW_SSID_DB')
BEGIN
	CREATE DATABASE [DW_SSID_DB]
END
GO

USE [DW_SSID_DB]
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


-- Create Table dim_personal
/******************************************************************************
**  Table Name: dim_personal
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
PRINT 'Creating the dim_personal table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[dim_personal]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[dim_personal](
		[personal_id] [bigint] NOT NULL,
		[personal_full_name] [varchar](100) NOT NULL,
		[personal_age] [int] NOT NULL,
		[personal_status] [varchar](10) NOT NULL,
		[personal_count_equipa] [int] NOT NULL
	 CONSTRAINT [PK_dim_personal] PRIMARY KEY CLUSTERED 
	(
		[personal_id] ASC
	))
		PRINT 'Table dim_personal created!';
	END
ELSE 
	BEGIN
		PRINT 'Table dim_personal already exists into the database';
	END
GO


-- Create Table dim_area
/******************************************************************************
**  Table Name: dim_area
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
PRINT 'Creating the dim_area table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[dim_area]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[dim_area](
		[area_id] [bigint] NOT NULL,
		[area_name] [varchar](50) NOT NULL
	 CONSTRAINT [PK_dim_area] PRIMARY KEY CLUSTERED 
	(
		[area_id] ASC
	))
		PRINT 'Table dim_area created!';
	END
ELSE 
	BEGIN
		PRINT 'Table dim_area already exists into the database';
	END
GO


-- Create Table dim_position
/******************************************************************************
**  Table Name: dim_position
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
PRINT 'Creating the dim_position table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[dim_position]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[dim_position](
		[position_id] [bigint] NOT NULL,
		[position_name] [varchar](150) NOT NULL,
		[position_parent] [varchar](150) NOT NULL
	 CONSTRAINT [PK_dim_position] PRIMARY KEY CLUSTERED 
	(
		[position_id] ASC
	))
		PRINT 'Table dim_position created!';
	END
ELSE 
	BEGIN
		PRINT 'Table dim_position already exists into the database';
	END
GO


-- Create Table dim_event_incident
/******************************************************************************
**  Table Name: dim_event_incident
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
PRINT 'Creating the dim_event_incident table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[dim_event_incident]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[dim_event_incident](
		[event_incident_id] [bigint] NOT NULL,
		[event_incident_detail] [varchar](MAX) NOT NULL,
		[event_incident_severity] [varchar](150) NOT NULL,
		[event_incident_reported_by] [varchar](50) NOT NULL
	 CONSTRAINT [PK_dim_event_incident] PRIMARY KEY CLUSTERED 
	(
		[event_incident_id] ASC
	))
		PRINT 'Table dim_event_incident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table dim_event_incident already exists into the database';
	END
GO


-- Create Table fact_incident
/******************************************************************************
**  Table Name: fact_incident
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
PRINT 'Creating the fact_incident table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[fact_incident]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[fact_incident](
		[personal_id] [bigint] NOT NULL,
		[area_id] [bigint] NOT NULL,
		[position_id] [bigint] NOT NULL,
		[event_incident_id] [bigint] NOT NULL,
		[type] [varchar](50) NOT NULL,
		[event_incident_date] [datetime] NOT NULL
	 CONSTRAINT [PK_fact_incident] PRIMARY KEY CLUSTERED 
	(
		[personal_id] ASC,
		[area_id] ASC,
		[position_id] ASC,
		[event_incident_id] ASC
	))
		PRINT 'Table fact_incident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table fact_incident already exists into the database';
	END
GO


-- Create foreing key FK_dim_personal
/******************************************************************************
**  Foreing key Name: FK_dim_personal
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
-- Define the relationship between DimPesonal and fact_incident.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_dim_personal]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[fact_incident]'))
ALTER TABLE [dbo].[fact_incident]  WITH CHECK ADD  
       CONSTRAINT [FK_dim_personal] FOREIGN KEY([personal_id])
REFERENCES [dbo].[dim_personal] ([personal_id])
GO
ALTER TABLE [dbo].[fact_incident] CHECK 
       CONSTRAINT [FK_dim_personal]
GO


-- Create foreing key FK_dim_area
/******************************************************************************
**  Foreing key Name: FK_dim_area
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
-- Define the relationship between dim_area and fact_incident.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_dim_area]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[fact_incident]'))
ALTER TABLE [dbo].[fact_incident]  WITH CHECK ADD  
       CONSTRAINT [FK_dim_area] FOREIGN KEY([area_id])
REFERENCES [dbo].[dim_area] ([area_id])
GO
ALTER TABLE [dbo].[fact_incident] CHECK 
       CONSTRAINT [FK_dim_area]
GO


-- Create foreing key FK_dim_position
/******************************************************************************
**  Foreing key Name: FK_dim_position
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
-- Define the relationship between dim_position and fact_incident.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_dim_position]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[fact_incident]'))
ALTER TABLE [dbo].[fact_incident]  WITH CHECK ADD  
       CONSTRAINT [FK_dim_position] FOREIGN KEY([position_id])
REFERENCES [dbo].[dim_position] ([position_id])
GO
ALTER TABLE [dbo].[fact_incident] CHECK 
       CONSTRAINT [FK_dim_position]
GO


-- Create foreing key FK_dim_event_incident
/******************************************************************************
**  Foreing key Name: FK_dim_event_incident
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
-- Define the relationship between dim_event_incident and fact_incident.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_dim_event_incident]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[fact_incident]'))
ALTER TABLE [dbo].[fact_incident]  WITH CHECK ADD  
       CONSTRAINT [FK_dim_event_incident] FOREIGN KEY([event_incident_id])
REFERENCES [dbo].[dim_event_incident] ([event_incident_id])
GO
ALTER TABLE [dbo].[fact_incident] CHECK 
       CONSTRAINT [FK_dim_event_incident]
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
		[personal_id] [bigint],
		[personal_full_name] [varchar](100),
		[personal_age] [int],
		[personal_status] [varchar](10),
		[personal_count_equipa] [int]
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
		[area_id] [bigint],
		[area_name] [varchar](50)
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
		[position_id] [bigint],
		[position_name] [varchar](150),
		[position_parent] [varchar](150)
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
		[event_incident_id] [bigint],
		[event_incident_detail] [varchar](MAX),
		[event_incident_severity] [varchar](150),
		[event_incident_reported_by] [varchar](50)
	)
		PRINT 'Table EventIncident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table EventIncident already exists into the database';
	END
GO


-- Create Table [ETL].[fact_incident]
/******************************************************************************
**  Table Name: [ETL].[fact_incident]
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
PRINT 'Creating the fact_incident table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[fact_incident]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [ETL].[fact_incident](
		[personal_id] [bigint],
		[area_id] [int],
		[position_id] [int],
		[event_incident_id] [int],
		[Type] [varchar](50),
		[event_incident_date] [datetime]
	)
		PRINT 'Table fact_incident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table fact_incident already exists into the database';
	END
GO



