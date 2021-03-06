USE [master]
GO
/****** Object:  Database [DungeonMaster]    Script Date: 1/30/2019 7:05:03 PM ******/
CREATE DATABASE [DungeonMaster]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DungeonMaster', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DungeonMaster.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DungeonMaster_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DungeonMaster_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DungeonMaster] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DungeonMaster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DungeonMaster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DungeonMaster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DungeonMaster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DungeonMaster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DungeonMaster] SET ARITHABORT OFF 
GO
ALTER DATABASE [DungeonMaster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DungeonMaster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DungeonMaster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DungeonMaster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DungeonMaster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DungeonMaster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DungeonMaster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DungeonMaster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DungeonMaster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DungeonMaster] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DungeonMaster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DungeonMaster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DungeonMaster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DungeonMaster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DungeonMaster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DungeonMaster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DungeonMaster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DungeonMaster] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DungeonMaster] SET  MULTI_USER 
GO
ALTER DATABASE [DungeonMaster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DungeonMaster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DungeonMaster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DungeonMaster] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DungeonMaster] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DungeonMaster] SET QUERY_STORE = OFF
GO
USE [DungeonMaster]
GO
/****** Object:  Table [dbo].[Ability_bonuses]    Script Date: 1/30/2019 7:05:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ability_bonuses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[score] [int] NULL,
	[name] [varchar](250) NULL,
	[race_id] [int] NULL,
 CONSTRAINT [PK_Ability_bonuses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbilityScores]    Script Date: 1/30/2019 7:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbilityScores](
	[strength] [int] NULL,
	[dexterity] [int] NULL,
	[constitution] [int] NULL,
	[wisdom] [int] NULL,
	[intelligence] [int] NULL,
	[charisma] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[owner_id] [int] NOT NULL,
	[strMod] [int] NULL,
	[dexMod] [int] NULL,
	[conMod] [int] NULL,
	[intMod] [int] NULL,
	[wisMod] [int] NULL,
	[chaMod] [int] NULL,
 CONSTRAINT [PK_AbilityScores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 1/30/2019 7:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[name] [varchar](150) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [varchar](200) NULL,
	[race_id] [int] NULL,
	[firebaseId] [varchar](250) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPC]    Script Date: 1/30/2019 7:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPC](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[characteristics] [varchar](100) NOT NULL,
 CONSTRAINT [PK_NPC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Race]    Script Date: 1/30/2019 7:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Race](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[index] [int] NULL,
	[name] [varchar](200) NULL,
	[speed] [int] NULL,
	[alignment] [varchar](500) NULL,
	[age] [varchar](500) NULL,
	[size] [varchar](50) NULL,
	[size_description] [varchar](250) NULL,
	[language_description] [varchar](250) NULL,
	[url] [varchar](250) NULL,
	[firebaseId] [varchar](250) NULL,
	[race_id] [int] NULL,
 CONSTRAINT [PK_Race'] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Starting_proficiency]    Script Date: 1/30/2019 7:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Starting_proficiency](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NULL,
	[url] [varchar](250) NULL,
	[race_id] [int] NULL,
	[firebaseId] [varchar](250) NULL,
 CONSTRAINT [PK_Starting_proficiency] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subrace]    Script Date: 1/30/2019 7:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subrace](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NULL,
	[url] [varchar](150) NULL,
	[race_id] [int] NULL,
	[firebaseId] [varchar](250) NULL,
 CONSTRAINT [PK_Subrace] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trait]    Script Date: 1/30/2019 7:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trait](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NULL,
	[url] [varchar](150) NULL,
	[race_id] [int] NULL,
	[firebaseId] [varchar](250) NULL,
 CONSTRAINT [PK_Trait] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ability_bonuses]  WITH CHECK ADD  CONSTRAINT [FK_Ability_bonuses_Race] FOREIGN KEY([race_id])
REFERENCES [dbo].[Race] ([id])
GO
ALTER TABLE [dbo].[Ability_bonuses] CHECK CONSTRAINT [FK_Ability_bonuses_Race]
GO
ALTER TABLE [dbo].[AbilityScores]  WITH CHECK ADD  CONSTRAINT [FK_AbilityScores_NPC] FOREIGN KEY([owner_id])
REFERENCES [dbo].[NPC] ([id])
GO
ALTER TABLE [dbo].[AbilityScores] CHECK CONSTRAINT [FK_AbilityScores_NPC]
GO
ALTER TABLE [dbo].[Language]  WITH CHECK ADD  CONSTRAINT [FK_Language_Race] FOREIGN KEY([race_id])
REFERENCES [dbo].[Race] ([id])
GO
ALTER TABLE [dbo].[Language] CHECK CONSTRAINT [FK_Language_Race]
GO
ALTER TABLE [dbo].[Starting_proficiency]  WITH CHECK ADD  CONSTRAINT [FK_Starting_proficiency_Race] FOREIGN KEY([race_id])
REFERENCES [dbo].[Race] ([id])
GO
ALTER TABLE [dbo].[Starting_proficiency] CHECK CONSTRAINT [FK_Starting_proficiency_Race]
GO
ALTER TABLE [dbo].[Subrace]  WITH CHECK ADD  CONSTRAINT [FK_Subrace_Race] FOREIGN KEY([race_id])
REFERENCES [dbo].[Race] ([id])
GO
ALTER TABLE [dbo].[Subrace] CHECK CONSTRAINT [FK_Subrace_Race]
GO
ALTER TABLE [dbo].[Trait]  WITH CHECK ADD  CONSTRAINT [FK_Trait_Race] FOREIGN KEY([race_id])
REFERENCES [dbo].[Race] ([id])
GO
ALTER TABLE [dbo].[Trait] CHECK CONSTRAINT [FK_Trait_Race]
GO
USE [master]
GO
ALTER DATABASE [DungeonMaster] SET  READ_WRITE 
GO
