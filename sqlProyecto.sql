-- Create Table Contracts
/******************************************************************************
**  Table Name: Contract
**  Desc: Table for Contracts
** 
**  
**
**  Author: Boris Medrano
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Boris Medrano   Initial version
*******************************************************************************/
PRINT 'Creating the Contracts table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[contracts]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[contracts](
										[contract_id] [bigint] NOT NULL,
										[contract_city] [varchar](100) NULL,
										[contract_code] [varchar](50) NULL,
										[contract_date] [datetime2](7) NULL,
										[contract_description] [varchar](100) NULL,
										[contract_salary] [float] NULL,
										[contract_type] [varchar](100) NULL
		,CONSTRAINT [PK_contract_id] PRIMARY KEY
		(
			[contract_id] ASC
		));

		PRINT 'Table Contracts created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Contracts already exists into the database';
	END
GO

-- Create Table Functions
/******************************************************************************
**  Table Name: Functions
**  Desc: Table for Functions
** 
**  
**
**  Author: Boris Medrano
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Boris Medrano   Initial version
*******************************************************************************/
PRINT 'Creating the Functions table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[functions]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[functions](
										[func_id] [bigint] NOT NULL,
										[func_description] [varchar](200) NULL,
										[func_name] [varchar](50) NULL,
										[position_position_id] [bigint] NOT NULL
		,CONSTRAINT [PK_func_id] PRIMARY KEY
		(
			[func_id] ASC
		));

		PRINT 'Table Functions created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Functions already exists into the database';
	END
GO

-- Create Table Requeriments
/******************************************************************************
**  Table Name: Requeriments
**  Desc: Table for Requeriments
** 
**  
**
**  Author: Boris Medrano
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Boris Medrano   Initial version
*******************************************************************************/
PRINT 'Creating the Functions table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[requirements]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[requirements](
											[requiriment_id] [bigint] NOT NULL,
											[requiriment_description] [varchar](200) NULL,
											[requiriment_name] [varchar](50) NULL,
											[position_position_id] [bigint] NOT NULL
		,CONSTRAINT [PK_requiriment_id] PRIMARY KEY
		(
			[requiriment_id] ASC
		));

		PRINT 'Table Functions created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Functions already exists into the database';
	END
GO



-- Create Foreign key FK_position_id_functions
/******************************************************************************
**  Table Name: functions
**  Desc: Table for functions
** 
**  
**
**  Author: Boris Medrano
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Boris Medrano   Initial version
*******************************************************************************/

PRINT 'Creating the Forengn key FK_position_id_functions ....';
IF NOT EXISTS(SELECT 1
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_position_id_functions')
            AND parent_object_id = OBJECT_ID('dbo.functions'))
    BEGIN
        ALTER TABLE dbo.functions 
        ADD CONSTRAINT FK_position_id_functions 
        FOREIGN KEY(position_position_id)
        REFERENCES dbo.position(position_id);

        PRINT 'Foreign key created';
    END
ELSE
    BEGIN
        PRINT 'Foreign key already exist';
END


-- Create Foreign key FK_position_id_requirements
/******************************************************************************
**  Table Name: requirements
**  Desc: Table for requirements
** 
**  
**
**  Author: Boris Medrano
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Boris Medrano   Initial version
*******************************************************************************/

PRINT 'Creating the Forengn key FK_position_id_requirements ....';
IF NOT EXISTS(SELECT 1
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_position_id_requirements')
            AND parent_object_id = OBJECT_ID('dbo.requirements'))
    BEGIN
        ALTER TABLE dbo.requirements 
        ADD CONSTRAINT FK_position_id_requirements 
        FOREIGN KEY(position_position_id)
        REFERENCES dbo.position(position_id);

        PRINT 'Foreign key created';
    END
ELSE
    BEGIN
        PRINT 'Foreign key already exist';
END



