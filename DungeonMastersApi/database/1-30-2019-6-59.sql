USE [master]
GO
/****** Object:  Database [DungeonMaster]    Script Date: 1/30/2019 7:00:48 PM ******/
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
/****** Object:  Table [dbo].[Ability_bonuses]    Script Date: 1/30/2019 7:00:49 PM ******/
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
/****** Object:  Table [dbo].[AbilityScores]    Script Date: 1/30/2019 7:00:49 PM ******/
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
/****** Object:  Table [dbo].[Language]    Script Date: 1/30/2019 7:00:49 PM ******/
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
/****** Object:  Table [dbo].[NPC]    Script Date: 1/30/2019 7:00:49 PM ******/
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
/****** Object:  Table [dbo].[Race]    Script Date: 1/30/2019 7:00:49 PM ******/
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
/****** Object:  Table [dbo].[Starting_proficiency]    Script Date: 1/30/2019 7:00:49 PM ******/
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
/****** Object:  Table [dbo].[Subrace]    Script Date: 1/30/2019 7:00:49 PM ******/
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
/****** Object:  Table [dbo].[Trait]    Script Date: 1/30/2019 7:00:49 PM ******/
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
SET IDENTITY_INSERT [dbo].[AbilityScores] ON 

INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (20, 20, 20, 20, 20, 15, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (15, 16, 20, 18, 20, 13, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (15, 14, 6, 10, 18, 8, 3, 12, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (0, 4, 15, 12, 7, 0, 4, 13, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (15, 17, 13, 0, 3, 5, 5, 14, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (20, 18, 6, 3, 13, 17, 6, 15, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (4, 3, 10, 1, 12, 15, 7, 16, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (15, 14, 3, 15, 14, 11, 8, 17, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (4, 8, 3, 6, 10, 20, 9, 18, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (5, 2, 19, 12, 3, 18, 10, 19, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (19, 5, 14, 20, 1, 19, 11, 22, 4, -2, 2, -4, 5, 4)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (2, 12, 20, 17, 1, 16, 12, 23, -4, 1, 5, -4, 3, 3)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (18, 0, 1, 1, 7, 1, 13, 24, 4, -5, -4, -1, -4, -4)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (14, 9, 7, 17, 18, 8, 14, 25, 2, 0, -1, 4, 3, -1)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (13, 3, 19, 4, 1, 19, 15, 26, 1, -3, 4, -4, -3, 4)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (11, 16, 12, 8, 7, 14, 16, 27, 0, 3, 1, -1, -1, 2)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (15, 16, 16, 16, 14, 17, 17, 28, 2, 3, 3, 2, 3, 3)
INSERT [dbo].[AbilityScores] ([strength], [dexterity], [constitution], [wisdom], [intelligence], [charisma], [id], [owner_id], [strMod], [dexMod], [conMod], [intMod], [wisMod], [chaMod]) VALUES (16, 10, 6, 15, 6, 14, 18, 29, 3, 0, -2, -2, 2, 2)
SET IDENTITY_INSERT [dbo].[AbilityScores] OFF
SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 2, N'http://www.dnd5eapi.co/api/languages/1', NULL, N'joshingMe')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Elvish', 3, N'http://www.dnd5eapi.co/api/languages/3', NULL, N'joshingMe')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 4, N'http://www.dnd5eapi.co/api/languages/1', NULL, N'joshingMe3')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Elvish', 5, N'http://www.dnd5eapi.co/api/languages/3', NULL, N'joshingMe3')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 6, N'http://www.dnd5eapi.co/api/languages/1', 2, NULL)
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Elvish', 7, N'http://www.dnd5eapi.co/api/languages/3', 2, NULL)
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 8, N'http://www.dnd5eapi.co/api/languages/1', 1, N'testData')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Dwarvish', 9, N'http://www.dnd5eapi.co/api/languages/2', 1, N'testData')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 10, N'http://www.dnd5eapi.co/api/languages/1', 1, N'testData')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Dwarvish', 11, N'http://www.dnd5eapi.co/api/languages/2', 1, N'testData')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 12, N'http://www.dnd5eapi.co/api/languages/1', 1, N'testData')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Dwarvish', 13, N'http://www.dnd5eapi.co/api/languages/2', 1, N'testData')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 14, N'http://www.dnd5eapi.co/api/languages/1', 3, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Halfling', 15, N'http://www.dnd5eapi.co/api/languages/7', 3, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 16, N'http://www.dnd5eapi.co/api/languages/1', 3, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Halfling', 17, N'http://www.dnd5eapi.co/api/languages/7', 3, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 18, N'http://www.dnd5eapi.co/api/languages/1', 1, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Dwarvish', 19, N'http://www.dnd5eapi.co/api/languages/2', 1, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 20, N'http://www.dnd5eapi.co/api/languages/1', 1, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Dwarvish', 21, N'http://www.dnd5eapi.co/api/languages/2', 1, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 22, N'http://www.dnd5eapi.co/api/languages/1', 4, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 23, N'http://www.dnd5eapi.co/api/languages/1', 4, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 24, N'http://www.dnd5eapi.co/api/languages/1', 4, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 25, N'http://www.dnd5eapi.co/api/languages/1', 3, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Halfling', 26, N'http://www.dnd5eapi.co/api/languages/7', 3, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 27, N'http://www.dnd5eapi.co/api/languages/1', 2, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Elvish', 28, N'http://www.dnd5eapi.co/api/languages/3', 2, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 29, N'http://www.dnd5eapi.co/api/languages/1', 4, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 30, N'http://www.dnd5eapi.co/api/languages/1', 4, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 31, N'http://www.dnd5eapi.co/api/languages/1', 5, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Draconic', 32, N'http://www.dnd5eapi.co/api/languages/11', 5, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 33, N'http://www.dnd5eapi.co/api/languages/1', 6, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Gnomish', 34, N'http://www.dnd5eapi.co/api/languages/5', 6, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 35, N'http://www.dnd5eapi.co/api/languages/1', 5, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Draconic', 36, N'http://www.dnd5eapi.co/api/languages/11', 5, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 37, N'http://www.dnd5eapi.co/api/languages/1', 7, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Elvish', 38, N'http://www.dnd5eapi.co/api/languages/3', 7, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 39, N'http://www.dnd5eapi.co/api/languages/1', 3, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Halfling', 40, N'http://www.dnd5eapi.co/api/languages/7', 3, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 41, N'http://www.dnd5eapi.co/api/languages/1', 1, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Dwarvish', 42, N'http://www.dnd5eapi.co/api/languages/2', 1, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 43, N'http://www.dnd5eapi.co/api/languages/1', 2, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Elvish', 44, N'http://www.dnd5eapi.co/api/languages/3', 2, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 45, N'http://www.dnd5eapi.co/api/languages/1', 3, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Halfling', 46, N'http://www.dnd5eapi.co/api/languages/7', 3, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 47, N'http://www.dnd5eapi.co/api/languages/1', 4, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 48, N'http://www.dnd5eapi.co/api/languages/1', 5, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Draconic', 49, N'http://www.dnd5eapi.co/api/languages/11', 5, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 50, N'http://www.dnd5eapi.co/api/languages/1', 6, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Gnomish', 51, N'http://www.dnd5eapi.co/api/languages/5', 6, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 52, N'http://www.dnd5eapi.co/api/languages/1', 7, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Elvish', 53, N'http://www.dnd5eapi.co/api/languages/3', 7, N'testData1')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 54, N'http://www.dnd5eapi.co/api/languages/1', 1, N'stockDataDwarf')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Dwarvish', 55, N'http://www.dnd5eapi.co/api/languages/2', 1, N'stockDataDwarf')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 56, N'http://www.dnd5eapi.co/api/languages/1', 2, N'stockDataElf')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Elvish', 57, N'http://www.dnd5eapi.co/api/languages/3', 2, N'stockDataElf')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 58, N'http://www.dnd5eapi.co/api/languages/1', 3, N'stockDataHalfling')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Halfling', 59, N'http://www.dnd5eapi.co/api/languages/7', 3, N'stockDataHalfling')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 60, N'http://www.dnd5eapi.co/api/languages/1', 4, N'stockDataHuman')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 61, N'http://www.dnd5eapi.co/api/languages/1', 5, N'stockDataDragonborn')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Draconic', 62, N'http://www.dnd5eapi.co/api/languages/11', 5, N'stockDataDragonborn')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 63, N'http://www.dnd5eapi.co/api/languages/1', 6, N'stockDataGnome')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Gnomish', 64, N'http://www.dnd5eapi.co/api/languages/5', 6, N'stockDataGnome')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 65, N'http://www.dnd5eapi.co/api/languages/1', 7, N'stockDataHalf-Elf')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Elvish', 66, N'http://www.dnd5eapi.co/api/languages/3', 7, N'stockDataHalf-Elf')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 67, N'http://www.dnd5eapi.co/api/languages/1', 1, N'stockDataDwarf')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Dwarvish', 68, N'http://www.dnd5eapi.co/api/languages/2', 1, N'stockDataDwarf')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 69, N'http://www.dnd5eapi.co/api/languages/1', 2, N'stockDataElf')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Elvish', 70, N'http://www.dnd5eapi.co/api/languages/3', 2, N'stockDataElf')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 71, N'http://www.dnd5eapi.co/api/languages/1', 3, N'stockDataHalfling')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Halfling', 72, N'http://www.dnd5eapi.co/api/languages/7', 3, N'stockDataHalfling')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 73, N'http://www.dnd5eapi.co/api/languages/1', 4, N'stockDataHuman')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 74, N'http://www.dnd5eapi.co/api/languages/1', 5, N'stockDataDragonborn')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Draconic', 75, N'http://www.dnd5eapi.co/api/languages/11', 5, N'stockDataDragonborn')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 76, N'http://www.dnd5eapi.co/api/languages/1', 6, N'stockDataGnome')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Gnomish', 77, N'http://www.dnd5eapi.co/api/languages/5', 6, N'stockDataGnome')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Common', 78, N'http://www.dnd5eapi.co/api/languages/1', 7, N'stockDataHalf-Elf')
INSERT [dbo].[Language] ([name], [id], [url], [race_id], [firebaseId]) VALUES (N'Elvish', 79, N'http://www.dnd5eapi.co/api/languages/3', 7, N'stockDataHalf-Elf')
SET IDENTITY_INSERT [dbo].[Language] OFF
SET IDENTITY_INSERT [dbo].[NPC] ON 

INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (1, N'TODD', N'Boring')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (2, N'Jake ', N'Cool-Ice')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (3, N'Lavashus', N'Boorish')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (4, N'Jogranal', N'Fiddles and fidgets nervously')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (5, N'Behalan', N'Slurs words, lisps, or stutters')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (6, N'Takelam', N'Fiddles and fidgets nervously')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (7, N'Sinetan', N'Stares into the distance')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (8, N'Kivashin', N'Boorish')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (9, N'Lapennor', N'Uses colorful oaths and exclamations')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (10, N'Silimid', N'Fiddles and fidgets nervously')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (11, N'Kinetett', N'Stares into the distance')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (12, N'Elzenac', N'Arrogant')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (13, N'Kigranil', N'Dim-witted')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (14, N'Nazenel', N'Stares into the distance')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (15, N'Jonetel', N'Uses colorful oaths and exclamations')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (16, N'Pakelan', N'Speaks loudly or whispers')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (17, N'Degranea', N'Dim-witted')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (18, N'Remorai', N'Friendly')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (19, N'Simoric', N'Fiddles and fidgets nervously')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (20, N'Fasarkea', N'Clumsy')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (21, N'Makelil', N'Prone to predictions of certain doom')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (22, N'Sichedai', N'Pronounced scar')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (23, N'Eljenac', N'Absentminded')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (24, N'Lachedic', N'Stares into the distance')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (25, N'Silimac', N'Pronounced scar')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (26, N'Elnetil', N'Stares into the distance')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (27, N'Osarkin', N'Uses colorful oaths and exclamations')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (28, N'Debarar', N'Dim-witted')
INSERT [dbo].[NPC] ([id], [name], [characteristics]) VALUES (29, N'Tachedel', N'Uses colorful oaths and exclamations')
SET IDENTITY_INSERT [dbo].[NPC] OFF
SET IDENTITY_INSERT [dbo].[Race] ON 

INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (1, 2, N'Elf', 30, N'Elves love freedom, variety, and self-expression, so they lean strongly toward the gentler aspects of chaos. They value and protect others’ freedom as well as their own, and they are more often good than not. The drow are an exception; their exile has made them vicious and dangerous. Drow are more often evil than not.', N'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', N'Medium', N'Elves range from under 5 to over 6 feet tall and have slender builds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/2', NULL, NULL)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (2, 2, N'Elf', 30, N'Elves love freedom, variety, and self-expression, so they lean strongly toward the gentler aspects of chaos. They value and protect others’ freedom as well as their own, and they are more often good than not. The drow are an exception; their exile has made them vicious and dangerous. Drow are more often evil than not.', N'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', N'Medium', N'Elves range from under 5 to over 6 feet tall and have slender builds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/2', NULL, NULL)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (3, 2, N'Elf', 30, N'Elves love freedom, variety, and self-expression, so they lean strongly toward the gentler aspects of chaos. They value and protect others’ freedom as well as their own, and they are more often good than not. The drow are an exception; their exile has made them vicious and dangerous. Drow are more often evil than not.', N'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', N'Medium', N'Elves range from under 5 to over 6 feet tall and have slender builds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/2', N'joshingMe', NULL)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (4, 2, N'Elf', 30, N'Elves love freedom, variety, and self-expression, so they lean strongly toward the gentler aspects of chaos. They value and protect others’ freedom as well as their own, and they are more often good than not. The drow are an exception; their exile has made them vicious and dangerous. Drow are more often evil than not.', N'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', N'Medium', N'Elves range from under 5 to over 6 feet tall and have slender builds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/2', N'joshingMe', NULL)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (5, 2, N'Elf', 30, N'Elves love freedom, variety, and self-expression, so they lean strongly toward the gentler aspects of chaos. They value and protect others’ freedom as well as their own, and they are more often good than not. The drow are an exception; their exile has made them vicious and dangerous. Drow are more often evil than not.', N'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', N'Medium', N'Elves range from under 5 to over 6 feet tall and have slender builds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/2', N'joshingMe', NULL)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (6, 2, N'Elf', 30, N'Elves love freedom, variety, and self-expression, so they lean strongly toward the gentler aspects of chaos. They value and protect others’ freedom as well as their own, and they are more often good than not. The drow are an exception; their exile has made them vicious and dangerous. Drow are more often evil than not.', N'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', N'Medium', N'Elves range from under 5 to over 6 feet tall and have slender builds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/2', N'joshingMe', NULL)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (7, 2, N'Elf', 30, N'Elves love freedom, variety, and self-expression, so they lean strongly toward the gentler aspects of chaos. They value and protect others’ freedom as well as their own, and they are more often good than not. The drow are an exception; their exile has made them vicious and dangerous. Drow are more often evil than not.', N'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', N'Medium', N'Elves range from under 5 to over 6 feet tall and have slender builds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/2', N'joshingMe3', NULL)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (8, 2, N'Elf', 30, N'Elves love freedom, variety, and self-expression, so they lean strongly toward the gentler aspects of chaos. They value and protect others’ freedom as well as their own, and they are more often good than not. The drow are an exception; their exile has made them vicious and dangerous. Drow are more often evil than not.', N'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', N'Medium', N'Elves range from under 5 to over 6 feet tall and have slender builds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/2', NULL, 2)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (9, 1, N'Dwarf', 30, N'Most dwarves are lawful, believing firmly in the benefits of a well-ordered society. They tend toward good as well, with a strong sense of fair play and a belief that everyone deserves to share in the benefits of a just order.', N'Dwarves mature at the same rate as humans, but they’re considered young until they reach the age of 50. On average, they live about 350 years.', N'Medium', N'Dwarves stand between 4 and 5 feet tall and average about 150 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/1', NULL, 1)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (10, 1, N'Dwarf', 30, N'Most dwarves are lawful, believing firmly in the benefits of a well-ordered society. They tend toward good as well, with a strong sense of fair play and a belief that everyone deserves to share in the benefits of a just order.', N'Dwarves mature at the same rate as humans, but they’re considered young until they reach the age of 50. On average, they live about 350 years.', N'Medium', N'Dwarves stand between 4 and 5 feet tall and average about 150 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/1', NULL, 1)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (11, 1, N'Dwarf', 30, N'Most dwarves are lawful, believing firmly in the benefits of a well-ordered society. They tend toward good as well, with a strong sense of fair play and a belief that everyone deserves to share in the benefits of a just order.', N'Dwarves mature at the same rate as humans, but they’re considered young until they reach the age of 50. On average, they live about 350 years.', N'Medium', N'Dwarves stand between 4 and 5 feet tall and average about 150 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/1', NULL, 1)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (12, 3, N'Halfling', 25, N'Most halflings are lawful good. As a rule, they are good-hearted and kind, hate to see others in pain, and have no tolerance for oppression. They are also very orderly and traditional, leaning heavily on the support of their community and the comfort of their old ways.', N'A halfling reaches adulthood at the age of 20 and generally lives into the middle of his or her second century.', N'Small', N'Halflings average about 3 feet tall and weigh about 40 pounds. Your size is Small.', NULL, N'http://www.dnd5eapi.co/api/races/3', NULL, 3)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (13, 3, N'Halfling', 25, N'Most halflings are lawful good. As a rule, they are good-hearted and kind, hate to see others in pain, and have no tolerance for oppression. They are also very orderly and traditional, leaning heavily on the support of their community and the comfort of their old ways.', N'A halfling reaches adulthood at the age of 20 and generally lives into the middle of his or her second century.', N'Small', N'Halflings average about 3 feet tall and weigh about 40 pounds. Your size is Small.', NULL, N'http://www.dnd5eapi.co/api/races/3', NULL, 3)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (14, 1, N'Dwarf', 30, N'Most dwarves are lawful, believing firmly in the benefits of a well-ordered society. They tend toward good as well, with a strong sense of fair play and a belief that everyone deserves to share in the benefits of a just order.', N'Dwarves mature at the same rate as humans, but they’re considered young until they reach the age of 50. On average, they live about 350 years.', N'Medium', N'Dwarves stand between 4 and 5 feet tall and average about 150 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/1', NULL, 1)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (15, 1, N'Dwarf', 30, N'Most dwarves are lawful, believing firmly in the benefits of a well-ordered society. They tend toward good as well, with a strong sense of fair play and a belief that everyone deserves to share in the benefits of a just order.', N'Dwarves mature at the same rate as humans, but they’re considered young until they reach the age of 50. On average, they live about 350 years.', N'Medium', N'Dwarves stand between 4 and 5 feet tall and average about 150 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/1', NULL, 1)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (16, 4, N'Human', 30, N'Humans tend toward no particular alignment. The best and the worst are found among them.', N'Humans reach adulthood in their late teens and live less than a century.', N'Medium', N'Humans vary widely in height and build, from barely 5 feet to well over 6 feet tall. Regardless of your position in that range, your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/4', NULL, 4)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (17, 4, N'Human', 30, N'Humans tend toward no particular alignment. The best and the worst are found among them.', N'Humans reach adulthood in their late teens and live less than a century.', N'Medium', N'Humans vary widely in height and build, from barely 5 feet to well over 6 feet tall. Regardless of your position in that range, your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/4', NULL, 4)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (18, 4, N'Human', 30, N'Humans tend toward no particular alignment. The best and the worst are found among them.', N'Humans reach adulthood in their late teens and live less than a century.', N'Medium', N'Humans vary widely in height and build, from barely 5 feet to well over 6 feet tall. Regardless of your position in that range, your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/4', NULL, 4)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (19, 3, N'Halfling', 25, N'Most halflings are lawful good. As a rule, they are good-hearted and kind, hate to see others in pain, and have no tolerance for oppression. They are also very orderly and traditional, leaning heavily on the support of their community and the comfort of their old ways.', N'A halfling reaches adulthood at the age of 20 and generally lives into the middle of his or her second century.', N'Small', N'Halflings average about 3 feet tall and weigh about 40 pounds. Your size is Small.', NULL, N'http://www.dnd5eapi.co/api/races/3', NULL, 3)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (20, 2, N'Elf', 30, N'Elves love freedom, variety, and self-expression, so they lean strongly toward the gentler aspects of chaos. They value and protect others’ freedom as well as their own, and they are more often good than not. The drow are an exception; their exile has made them vicious and dangerous. Drow are more often evil than not.', N'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', N'Medium', N'Elves range from under 5 to over 6 feet tall and have slender builds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/2', NULL, 2)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (21, 4, N'Human', 30, N'Humans tend toward no particular alignment. The best and the worst are found among them.', N'Humans reach adulthood in their late teens and live less than a century.', N'Medium', N'Humans vary widely in height and build, from barely 5 feet to well over 6 feet tall. Regardless of your position in that range, your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/4', NULL, 4)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (22, 4, N'Human', 30, N'Humans tend toward no particular alignment. The best and the worst are found among them.', N'Humans reach adulthood in their late teens and live less than a century.', N'Medium', N'Humans vary widely in height and build, from barely 5 feet to well over 6 feet tall. Regardless of your position in that range, your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/4', NULL, 4)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (23, 5, N'Dragonborn', 30, N' Dragonborn tend to extremes, making a conscious choice for one side or the other in the cosmic war between good and evil. Most dragonborn are good, but those who side with evil can be terrible villains.', N'Young dragonborn grow quickly. They walk hours after hatching, attain the size and development of a 10-year-old human child by the age of 3, and reach adulthood by 15. They live to be around 80.', N'Medium', N'Dragonborn are taller and heavier than humans, standing well over 6 feet tall and averaging almost 250 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/5', NULL, 5)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (24, 6, N'Gnome', 25, N'Gnomes are most often good. Those who tend toward law are sages, engineers, researchers, scholars, investigators, or inventors. Those who tend toward chaos are minstrels, tricksters, wanderers, or fanciful jewelers. Gnomes are good-hearted, and even the tricksters among them are more playful than vicious.', N' Gnomes mature at the same rate humans do, and most are expected to settle down into an adult life by around age 40. They can live 350 to almost 500 years.', N'Small', N'Gnomes are between 3 and 4 feet tall and average about 40 pounds. Your size is Small.', NULL, N'http://www.dnd5eapi.co/api/races/6', NULL, 6)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (25, 5, N'Dragonborn', 30, N' Dragonborn tend to extremes, making a conscious choice for one side or the other in the cosmic war between good and evil. Most dragonborn are good, but those who side with evil can be terrible villains.', N'Young dragonborn grow quickly. They walk hours after hatching, attain the size and development of a 10-year-old human child by the age of 3, and reach adulthood by 15. They live to be around 80.', N'Medium', N'Dragonborn are taller and heavier than humans, standing well over 6 feet tall and averaging almost 250 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/5', NULL, 5)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (26, 7, N'Half-Elf', 30, N'Half-elves share the chaotic bent of their elven heritage. They value both personal freedom and creative expression, demonstrating neither love of leaders nor desire for followers. They chafe at rules, resent others'' demands, and sometimes prove unreliable, or at least unpredictable.', N'Half-elves mature at the same rate humans do and reach adulthood around the age of 20. They live much longer than humans, however, often exceeding 180 years.', N'Medium', N'Half-elves are about the same size as humans, ranging from 5 to 6 feet tall. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/7', NULL, 7)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (27, 3, N'Halfling', 25, N'Most halflings are lawful good. As a rule, they are good-hearted and kind, hate to see others in pain, and have no tolerance for oppression. They are also very orderly and traditional, leaning heavily on the support of their community and the comfort of their old ways.', N'A halfling reaches adulthood at the age of 20 and generally lives into the middle of his or her second century.', N'Small', N'Halflings average about 3 feet tall and weigh about 40 pounds. Your size is Small.', NULL, N'http://www.dnd5eapi.co/api/races/3', NULL, 3)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (28, 1, N'Dwarf', 30, N'Most dwarves are lawful, believing firmly in the benefits of a well-ordered society. They tend toward good as well, with a strong sense of fair play and a belief that everyone deserves to share in the benefits of a just order.', N'Dwarves mature at the same rate as humans, but they’re considered young until they reach the age of 50. On average, they live about 350 years.', N'Medium', N'Dwarves stand between 4 and 5 feet tall and average about 150 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/1', NULL, 1)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (29, 2, N'Elf', 30, N'Elves love freedom, variety, and self-expression, so they lean strongly toward the gentler aspects of chaos. They value and protect others’ freedom as well as their own, and they are more often good than not. The drow are an exception; their exile has made them vicious and dangerous. Drow are more often evil than not.', N'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', N'Medium', N'Elves range from under 5 to over 6 feet tall and have slender builds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/2', NULL, 2)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (30, 3, N'Halfling', 25, N'Most halflings are lawful good. As a rule, they are good-hearted and kind, hate to see others in pain, and have no tolerance for oppression. They are also very orderly and traditional, leaning heavily on the support of their community and the comfort of their old ways.', N'A halfling reaches adulthood at the age of 20 and generally lives into the middle of his or her second century.', N'Small', N'Halflings average about 3 feet tall and weigh about 40 pounds. Your size is Small.', NULL, N'http://www.dnd5eapi.co/api/races/3', NULL, 3)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (31, 4, N'Human', 30, N'Humans tend toward no particular alignment. The best and the worst are found among them.', N'Humans reach adulthood in their late teens and live less than a century.', N'Medium', N'Humans vary widely in height and build, from barely 5 feet to well over 6 feet tall. Regardless of your position in that range, your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/4', NULL, 4)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (32, 5, N'Dragonborn', 30, N' Dragonborn tend to extremes, making a conscious choice for one side or the other in the cosmic war between good and evil. Most dragonborn are good, but those who side with evil can be terrible villains.', N'Young dragonborn grow quickly. They walk hours after hatching, attain the size and development of a 10-year-old human child by the age of 3, and reach adulthood by 15. They live to be around 80.', N'Medium', N'Dragonborn are taller and heavier than humans, standing well over 6 feet tall and averaging almost 250 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/5', NULL, 5)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (33, 6, N'Gnome', 25, N'Gnomes are most often good. Those who tend toward law are sages, engineers, researchers, scholars, investigators, or inventors. Those who tend toward chaos are minstrels, tricksters, wanderers, or fanciful jewelers. Gnomes are good-hearted, and even the tricksters among them are more playful than vicious.', N' Gnomes mature at the same rate humans do, and most are expected to settle down into an adult life by around age 40. They can live 350 to almost 500 years.', N'Small', N'Gnomes are between 3 and 4 feet tall and average about 40 pounds. Your size is Small.', NULL, N'http://www.dnd5eapi.co/api/races/6', NULL, 6)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (34, 7, N'Half-Elf', 30, N'Half-elves share the chaotic bent of their elven heritage. They value both personal freedom and creative expression, demonstrating neither love of leaders nor desire for followers. They chafe at rules, resent others'' demands, and sometimes prove unreliable, or at least unpredictable.', N'Half-elves mature at the same rate humans do and reach adulthood around the age of 20. They live much longer than humans, however, often exceeding 180 years.', N'Medium', N'Half-elves are about the same size as humans, ranging from 5 to 6 feet tall. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/7', NULL, 7)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (35, 1, N'Dwarf', 30, N'Most dwarves are lawful, believing firmly in the benefits of a well-ordered society. They tend toward good as well, with a strong sense of fair play and a belief that everyone deserves to share in the benefits of a just order.', N'Dwarves mature at the same rate as humans, but they’re considered young until they reach the age of 50. On average, they live about 350 years.', N'Medium', N'Dwarves stand between 4 and 5 feet tall and average about 150 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/1', NULL, 1)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (36, 2, N'Elf', 30, N'Elves love freedom, variety, and self-expression, so they lean strongly toward the gentler aspects of chaos. They value and protect others’ freedom as well as their own, and they are more often good than not. The drow are an exception; their exile has made them vicious and dangerous. Drow are more often evil than not.', N'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', N'Medium', N'Elves range from under 5 to over 6 feet tall and have slender builds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/2', NULL, 2)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (37, 3, N'Halfling', 25, N'Most halflings are lawful good. As a rule, they are good-hearted and kind, hate to see others in pain, and have no tolerance for oppression. They are also very orderly and traditional, leaning heavily on the support of their community and the comfort of their old ways.', N'A halfling reaches adulthood at the age of 20 and generally lives into the middle of his or her second century.', N'Small', N'Halflings average about 3 feet tall and weigh about 40 pounds. Your size is Small.', NULL, N'http://www.dnd5eapi.co/api/races/3', NULL, 3)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (38, 4, N'Human', 30, N'Humans tend toward no particular alignment. The best and the worst are found among them.', N'Humans reach adulthood in their late teens and live less than a century.', N'Medium', N'Humans vary widely in height and build, from barely 5 feet to well over 6 feet tall. Regardless of your position in that range, your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/4', NULL, 4)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (39, 5, N'Dragonborn', 30, N' Dragonborn tend to extremes, making a conscious choice for one side or the other in the cosmic war between good and evil. Most dragonborn are good, but those who side with evil can be terrible villains.', N'Young dragonborn grow quickly. They walk hours after hatching, attain the size and development of a 10-year-old human child by the age of 3, and reach adulthood by 15. They live to be around 80.', N'Medium', N'Dragonborn are taller and heavier than humans, standing well over 6 feet tall and averaging almost 250 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/5', NULL, 5)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (40, 6, N'Gnome', 25, N'Gnomes are most often good. Those who tend toward law are sages, engineers, researchers, scholars, investigators, or inventors. Those who tend toward chaos are minstrels, tricksters, wanderers, or fanciful jewelers. Gnomes are good-hearted, and even the tricksters among them are more playful than vicious.', N' Gnomes mature at the same rate humans do, and most are expected to settle down into an adult life by around age 40. They can live 350 to almost 500 years.', N'Small', N'Gnomes are between 3 and 4 feet tall and average about 40 pounds. Your size is Small.', NULL, N'http://www.dnd5eapi.co/api/races/6', NULL, 6)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (41, 7, N'Half-Elf', 30, N'Half-elves share the chaotic bent of their elven heritage. They value both personal freedom and creative expression, demonstrating neither love of leaders nor desire for followers. They chafe at rules, resent others'' demands, and sometimes prove unreliable, or at least unpredictable.', N'Half-elves mature at the same rate humans do and reach adulthood around the age of 20. They live much longer than humans, however, often exceeding 180 years.', N'Medium', N'Half-elves are about the same size as humans, ranging from 5 to 6 feet tall. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/7', NULL, 7)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (42, 1, N'Dwarf', 30, N'Most dwarves are lawful, believing firmly in the benefits of a well-ordered society. They tend toward good as well, with a strong sense of fair play and a belief that everyone deserves to share in the benefits of a just order.', N'Dwarves mature at the same rate as humans, but they’re considered young until they reach the age of 50. On average, they live about 350 years.', N'Medium', N'Dwarves stand between 4 and 5 feet tall and average about 150 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/1', N'stockDataDwarf', 1)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (43, 2, N'Elf', 30, N'Elves love freedom, variety, and self-expression, so they lean strongly toward the gentler aspects of chaos. They value and protect others’ freedom as well as their own, and they are more often good than not. The drow are an exception; their exile has made them vicious and dangerous. Drow are more often evil than not.', N'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', N'Medium', N'Elves range from under 5 to over 6 feet tall and have slender builds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/2', N'stockDataElf', 2)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (44, 3, N'Halfling', 25, N'Most halflings are lawful good. As a rule, they are good-hearted and kind, hate to see others in pain, and have no tolerance for oppression. They are also very orderly and traditional, leaning heavily on the support of their community and the comfort of their old ways.', N'A halfling reaches adulthood at the age of 20 and generally lives into the middle of his or her second century.', N'Small', N'Halflings average about 3 feet tall and weigh about 40 pounds. Your size is Small.', NULL, N'http://www.dnd5eapi.co/api/races/3', N'stockDataHalfling', 3)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (45, 4, N'Human', 30, N'Humans tend toward no particular alignment. The best and the worst are found among them.', N'Humans reach adulthood in their late teens and live less than a century.', N'Medium', N'Humans vary widely in height and build, from barely 5 feet to well over 6 feet tall. Regardless of your position in that range, your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/4', N'stockDataHuman', 4)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (46, 5, N'Dragonborn', 30, N' Dragonborn tend to extremes, making a conscious choice for one side or the other in the cosmic war between good and evil. Most dragonborn are good, but those who side with evil can be terrible villains.', N'Young dragonborn grow quickly. They walk hours after hatching, attain the size and development of a 10-year-old human child by the age of 3, and reach adulthood by 15. They live to be around 80.', N'Medium', N'Dragonborn are taller and heavier than humans, standing well over 6 feet tall and averaging almost 250 pounds. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/5', N'stockDataDragonborn', 5)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (47, 6, N'Gnome', 25, N'Gnomes are most often good. Those who tend toward law are sages, engineers, researchers, scholars, investigators, or inventors. Those who tend toward chaos are minstrels, tricksters, wanderers, or fanciful jewelers. Gnomes are good-hearted, and even the tricksters among them are more playful than vicious.', N' Gnomes mature at the same rate humans do, and most are expected to settle down into an adult life by around age 40. They can live 350 to almost 500 years.', N'Small', N'Gnomes are between 3 and 4 feet tall and average about 40 pounds. Your size is Small.', NULL, N'http://www.dnd5eapi.co/api/races/6', N'stockDataGnome', 6)
INSERT [dbo].[Race] ([id], [index], [name], [speed], [alignment], [age], [size], [size_description], [language_description], [url], [firebaseId], [race_id]) VALUES (48, 7, N'Half-Elf', 30, N'Half-elves share the chaotic bent of their elven heritage. They value both personal freedom and creative expression, demonstrating neither love of leaders nor desire for followers. They chafe at rules, resent others'' demands, and sometimes prove unreliable, or at least unpredictable.', N'Half-elves mature at the same rate humans do and reach adulthood around the age of 20. They live much longer than humans, however, often exceeding 180 years.', N'Medium', N'Half-elves are about the same size as humans, ranging from 5 to 6 feet tall. Your size is Medium.', NULL, N'http://www.dnd5eapi.co/api/races/7', N'stockDataHalf-Elf', 7)
SET IDENTITY_INSERT [dbo].[Race] OFF
SET IDENTITY_INSERT [dbo].[Starting_proficiency] ON 

INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (1, N'Battleaxes', N'http://www.dnd5eapi.co/api/proficiencies/20', 1, N'testData')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (2, N'Handaxes', N'http://www.dnd5eapi.co/api/proficiencies/24', 1, N'testData')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (3, N'Light hammers', N'http://www.dnd5eapi.co/api/proficiencies/26', 1, N'testData')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (4, N'Warhammers', N'http://www.dnd5eapi.co/api/proficiencies/51', 1, N'testData')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (5, N'Battleaxes', N'http://www.dnd5eapi.co/api/proficiencies/20', 1, N'testData')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (6, N'Handaxes', N'http://www.dnd5eapi.co/api/proficiencies/24', 1, N'testData')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (7, N'Light hammers', N'http://www.dnd5eapi.co/api/proficiencies/26', 1, N'testData')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (8, N'Warhammers', N'http://www.dnd5eapi.co/api/proficiencies/51', 1, N'testData')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (9, N'Battleaxes', N'http://www.dnd5eapi.co/api/proficiencies/20', 1, N'testData')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (10, N'Handaxes', N'http://www.dnd5eapi.co/api/proficiencies/24', 1, N'testData')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (11, N'Light hammers', N'http://www.dnd5eapi.co/api/proficiencies/26', 1, N'testData')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (12, N'Warhammers', N'http://www.dnd5eapi.co/api/proficiencies/51', 1, N'testData')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (13, N'Battleaxes', N'http://www.dnd5eapi.co/api/proficiencies/20', 1, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (14, N'Handaxes', N'http://www.dnd5eapi.co/api/proficiencies/24', 1, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (15, N'Light hammers', N'http://www.dnd5eapi.co/api/proficiencies/26', 1, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (16, N'Warhammers', N'http://www.dnd5eapi.co/api/proficiencies/51', 1, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (17, N'Battleaxes', N'http://www.dnd5eapi.co/api/proficiencies/20', 1, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (18, N'Handaxes', N'http://www.dnd5eapi.co/api/proficiencies/24', 1, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (19, N'Light hammers', N'http://www.dnd5eapi.co/api/proficiencies/26', 1, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (20, N'Warhammers', N'http://www.dnd5eapi.co/api/proficiencies/51', 1, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (21, N'Tony', N'urlHere', 4, N'nerf this')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (22, N'Skill: Perception', N'http://www.dnd5eapi.co/api/proficiencies/116', 2, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (23, N'Battleaxes', N'http://www.dnd5eapi.co/api/proficiencies/20', 1, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (24, N'Handaxes', N'http://www.dnd5eapi.co/api/proficiencies/24', 1, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (25, N'Light hammers', N'http://www.dnd5eapi.co/api/proficiencies/26', 1, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (26, N'Warhammers', N'http://www.dnd5eapi.co/api/proficiencies/51', 1, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (27, N'Skill: Perception', N'http://www.dnd5eapi.co/api/proficiencies/116', 2, N'testData1')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (28, N'Battleaxes', N'http://www.dnd5eapi.co/api/proficiencies/20', 1, N'stockDataDwarf')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (29, N'Handaxes', N'http://www.dnd5eapi.co/api/proficiencies/24', 1, N'stockDataDwarf')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (30, N'Light hammers', N'http://www.dnd5eapi.co/api/proficiencies/26', 1, N'stockDataDwarf')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (31, N'Warhammers', N'http://www.dnd5eapi.co/api/proficiencies/51', 1, N'stockDataDwarf')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (32, N'Skill: Perception', N'http://www.dnd5eapi.co/api/proficiencies/116', 2, N'stockDataElf')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (33, N'Battleaxes', N'http://www.dnd5eapi.co/api/proficiencies/20', 1, N'stockDataDwarf')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (34, N'Handaxes', N'http://www.dnd5eapi.co/api/proficiencies/24', 1, N'stockDataDwarf')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (35, N'Light hammers', N'http://www.dnd5eapi.co/api/proficiencies/26', 1, N'stockDataDwarf')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (36, N'Warhammers', N'http://www.dnd5eapi.co/api/proficiencies/51', 1, N'stockDataDwarf')
INSERT [dbo].[Starting_proficiency] ([id], [name], [url], [race_id], [firebaseId]) VALUES (37, N'Skill: Perception', N'http://www.dnd5eapi.co/api/proficiencies/116', 2, N'stockDataElf')
SET IDENTITY_INSERT [dbo].[Starting_proficiency] OFF
SET IDENTITY_INSERT [dbo].[Subrace] ON 

INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (1, N'Hill Dwarf', N'http://www.dnd5eapi.co/api/subraces/1', 1, N'testData')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (2, N'Mountain Dwarf', N'http://www.dnd5eapi.co/api/subraces/4', 1, N'testData')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (3, N'Hill Dwarf', N'http://www.dnd5eapi.co/api/subraces/1', 1, N'testData')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (4, N'Mountain Dwarf', N'http://www.dnd5eapi.co/api/subraces/4', 1, N'testData')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (5, N'Lightfoot Halfling', N'http://www.dnd5eapi.co/api/subraces/3', 3, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (6, N'Lightfoot Halfling', N'http://www.dnd5eapi.co/api/subraces/3', 3, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (7, N'Hill Dwarf', N'http://www.dnd5eapi.co/api/subraces/1', 1, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (8, N'Mountain Dwarf', N'http://www.dnd5eapi.co/api/subraces/4', 1, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (9, N'Hill Dwarf', N'http://www.dnd5eapi.co/api/subraces/1', 1, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (10, N'Mountain Dwarf', N'http://www.dnd5eapi.co/api/subraces/4', 1, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (11, N'Lightfoot Halfling', N'http://www.dnd5eapi.co/api/subraces/3', 3, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (12, N'High Elf', N'http://www.dnd5eapi.co/api/subraces/2', 2, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (13, N'Forest Gnome', N'http://www.dnd5eapi.co/api/subraces/7', 6, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (14, N'Rock Gnome', N'http://www.dnd5eapi.co/api/subraces/8', 6, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (15, N'Lightfoot Halfling', N'http://www.dnd5eapi.co/api/subraces/3', 3, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (16, N'Hill Dwarf', N'http://www.dnd5eapi.co/api/subraces/1', 1, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (17, N'Mountain Dwarf', N'http://www.dnd5eapi.co/api/subraces/4', 1, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (18, N'High Elf', N'http://www.dnd5eapi.co/api/subraces/2', 2, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (19, N'Lightfoot Halfling', N'http://www.dnd5eapi.co/api/subraces/3', 3, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (20, N'Forest Gnome', N'http://www.dnd5eapi.co/api/subraces/7', 6, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (21, N'Rock Gnome', N'http://www.dnd5eapi.co/api/subraces/8', 6, N'testData1')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (22, N'Hill Dwarf', N'http://www.dnd5eapi.co/api/subraces/1', 1, N'stockDataDwarf')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (23, N'Mountain Dwarf', N'http://www.dnd5eapi.co/api/subraces/4', 1, N'stockDataDwarf')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (24, N'High Elf', N'http://www.dnd5eapi.co/api/subraces/2', 2, N'stockDataElf')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (25, N'Lightfoot Halfling', N'http://www.dnd5eapi.co/api/subraces/3', 3, N'stockDataHalfling')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (26, N'Forest Gnome', N'http://www.dnd5eapi.co/api/subraces/7', 6, N'stockDataGnome')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (27, N'Rock Gnome', N'http://www.dnd5eapi.co/api/subraces/8', 6, N'stockDataGnome')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (28, N'Hill Dwarf', N'http://www.dnd5eapi.co/api/subraces/1', 1, N'stockDataDwarf')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (29, N'Mountain Dwarf', N'http://www.dnd5eapi.co/api/subraces/4', 1, N'stockDataDwarf')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (30, N'High Elf', N'http://www.dnd5eapi.co/api/subraces/2', 2, N'stockDataElf')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (31, N'Lightfoot Halfling', N'http://www.dnd5eapi.co/api/subraces/3', 3, N'stockDataHalfling')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (32, N'Forest Gnome', N'http://www.dnd5eapi.co/api/subraces/7', 6, N'stockDataGnome')
INSERT [dbo].[Subrace] ([id], [name], [url], [race_id], [firebaseId]) VALUES (33, N'Rock Gnome', N'http://www.dnd5eapi.co/api/subraces/8', 6, N'stockDataGnome')
SET IDENTITY_INSERT [dbo].[Subrace] OFF
SET IDENTITY_INSERT [dbo].[Trait] ON 

INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (1, N'Darkvision (Dwarf)', N'http://www.dnd5eapi.co/api/traits/1', 1, N'testData')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (2, N'Dwarven Resilience', N'http://www.dnd5eapi.co/api/traits/2', 1, N'testData')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (3, N'Stonecunning', N'http://www.dnd5eapi.co/api/traits/3', 1, N'testData')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (4, N'Brave', N'http://www.dnd5eapi.co/api/traits/21', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (5, N'Halfling Nimbleness', N'http://www.dnd5eapi.co/api/traits/22', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (6, N'Lucky', N'http://www.dnd5eapi.co/api/traits/23', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (7, N'Brave', N'http://www.dnd5eapi.co/api/traits/21', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (8, N'Halfling Nimbleness', N'http://www.dnd5eapi.co/api/traits/22', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (9, N'Lucky', N'http://www.dnd5eapi.co/api/traits/23', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (10, N'Darkvision (Dwarf)', N'http://www.dnd5eapi.co/api/traits/1', 1, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (11, N'Dwarven Resilience', N'http://www.dnd5eapi.co/api/traits/2', 1, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (12, N'Stonecunning', N'http://www.dnd5eapi.co/api/traits/3', 1, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (13, N'Darkvision (Dwarf)', N'http://www.dnd5eapi.co/api/traits/1', 1, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (14, N'Dwarven Resilience', N'http://www.dnd5eapi.co/api/traits/2', 1, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (15, N'Stonecunning', N'http://www.dnd5eapi.co/api/traits/3', 1, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (16, N'Brave', N'http://www.dnd5eapi.co/api/traits/21', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (17, N'Halfling Nimbleness', N'http://www.dnd5eapi.co/api/traits/22', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (18, N'Lucky', N'http://www.dnd5eapi.co/api/traits/23', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (19, N'Darkvision (Elf)', N'http://www.dnd5eapi.co/api/traits/5', 2, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (20, N'Fey Ancestry', N'http://www.dnd5eapi.co/api/traits/6', 2, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (21, N'Trance', N'http://www.dnd5eapi.co/api/traits/7', 2, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (22, N'Draconic Anscestry', N'http://www.dnd5eapi.co/api/traits/24', 5, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (23, N'Breath Weapon', N'http://www.dnd5eapi.co/api/traits/25', 5, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (24, N'Damage Resistance (Dragonborn)', N'http://www.dnd5eapi.co/api/traits/36', 5, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (25, N'Darkvision (Gnome)', N'http://www.dnd5eapi.co/api/traits/42', 6, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (26, N'Gnome Cunning', N'http://www.dnd5eapi.co/api/traits/43', 6, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (27, N'Draconic Anscestry', N'http://www.dnd5eapi.co/api/traits/24', 5, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (28, N'Breath Weapon', N'http://www.dnd5eapi.co/api/traits/25', 5, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (29, N'Damage Resistance (Dragonborn)', N'http://www.dnd5eapi.co/api/traits/36', 5, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (30, N'Darkvision (Half-Elf)', N'http://www.dnd5eapi.co/api/traits/48', 7, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (31, N'Fey Ancestry', N'http://www.dnd5eapi.co/api/traits/49', 7, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (32, N'Skill Versatility', N'http://www.dnd5eapi.co/api/traits/50', 7, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (33, N'Brave', N'http://www.dnd5eapi.co/api/traits/21', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (34, N'Halfling Nimbleness', N'http://www.dnd5eapi.co/api/traits/22', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (35, N'Lucky', N'http://www.dnd5eapi.co/api/traits/23', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (36, N'Darkvision (Dwarf)', N'http://www.dnd5eapi.co/api/traits/1', 1, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (37, N'Dwarven Resilience', N'http://www.dnd5eapi.co/api/traits/2', 1, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (38, N'Stonecunning', N'http://www.dnd5eapi.co/api/traits/3', 1, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (39, N'Darkvision (Elf)', N'http://www.dnd5eapi.co/api/traits/5', 2, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (40, N'Fey Ancestry', N'http://www.dnd5eapi.co/api/traits/6', 2, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (41, N'Trance', N'http://www.dnd5eapi.co/api/traits/7', 2, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (42, N'Brave', N'http://www.dnd5eapi.co/api/traits/21', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (43, N'Halfling Nimbleness', N'http://www.dnd5eapi.co/api/traits/22', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (44, N'Lucky', N'http://www.dnd5eapi.co/api/traits/23', 3, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (45, N'Draconic Anscestry', N'http://www.dnd5eapi.co/api/traits/24', 5, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (46, N'Breath Weapon', N'http://www.dnd5eapi.co/api/traits/25', 5, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (47, N'Damage Resistance (Dragonborn)', N'http://www.dnd5eapi.co/api/traits/36', 5, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (48, N'Darkvision (Gnome)', N'http://www.dnd5eapi.co/api/traits/42', 6, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (49, N'Gnome Cunning', N'http://www.dnd5eapi.co/api/traits/43', 6, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (50, N'Darkvision (Half-Elf)', N'http://www.dnd5eapi.co/api/traits/48', 7, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (51, N'Fey Ancestry', N'http://www.dnd5eapi.co/api/traits/49', 7, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (52, N'Skill Versatility', N'http://www.dnd5eapi.co/api/traits/50', 7, N'testData1')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (53, N'Darkvision (Dwarf)', N'http://www.dnd5eapi.co/api/traits/1', 1, N'stockDataDwarf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (54, N'Dwarven Resilience', N'http://www.dnd5eapi.co/api/traits/2', 1, N'stockDataDwarf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (55, N'Stonecunning', N'http://www.dnd5eapi.co/api/traits/3', 1, N'stockDataDwarf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (56, N'Darkvision (Elf)', N'http://www.dnd5eapi.co/api/traits/5', 2, N'stockDataElf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (57, N'Fey Ancestry', N'http://www.dnd5eapi.co/api/traits/6', 2, N'stockDataElf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (58, N'Trance', N'http://www.dnd5eapi.co/api/traits/7', 2, N'stockDataElf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (59, N'Brave', N'http://www.dnd5eapi.co/api/traits/21', 3, N'stockDataHalfling')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (60, N'Halfling Nimbleness', N'http://www.dnd5eapi.co/api/traits/22', 3, N'stockDataHalfling')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (61, N'Lucky', N'http://www.dnd5eapi.co/api/traits/23', 3, N'stockDataHalfling')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (62, N'Draconic Anscestry', N'http://www.dnd5eapi.co/api/traits/24', 5, N'stockDataDragonborn')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (63, N'Breath Weapon', N'http://www.dnd5eapi.co/api/traits/25', 5, N'stockDataDragonborn')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (64, N'Damage Resistance (Dragonborn)', N'http://www.dnd5eapi.co/api/traits/36', 5, N'stockDataDragonborn')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (65, N'Darkvision (Gnome)', N'http://www.dnd5eapi.co/api/traits/42', 6, N'stockDataGnome')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (66, N'Gnome Cunning', N'http://www.dnd5eapi.co/api/traits/43', 6, N'stockDataGnome')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (67, N'Darkvision (Half-Elf)', N'http://www.dnd5eapi.co/api/traits/48', 7, N'stockDataHalf-Elf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (68, N'Fey Ancestry', N'http://www.dnd5eapi.co/api/traits/49', 7, N'stockDataHalf-Elf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (69, N'Skill Versatility', N'http://www.dnd5eapi.co/api/traits/50', 7, N'stockDataHalf-Elf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (70, N'Darkvision (Dwarf)', N'http://www.dnd5eapi.co/api/traits/1', 1, N'stockDataDwarf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (71, N'Dwarven Resilience', N'http://www.dnd5eapi.co/api/traits/2', 1, N'stockDataDwarf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (72, N'Stonecunning', N'http://www.dnd5eapi.co/api/traits/3', 1, N'stockDataDwarf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (73, N'Darkvision (Elf)', N'http://www.dnd5eapi.co/api/traits/5', 2, N'stockDataElf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (74, N'Fey Ancestry', N'http://www.dnd5eapi.co/api/traits/6', 2, N'stockDataElf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (75, N'Trance', N'http://www.dnd5eapi.co/api/traits/7', 2, N'stockDataElf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (76, N'Brave', N'http://www.dnd5eapi.co/api/traits/21', 3, N'stockDataHalfling')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (77, N'Halfling Nimbleness', N'http://www.dnd5eapi.co/api/traits/22', 3, N'stockDataHalfling')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (78, N'Lucky', N'http://www.dnd5eapi.co/api/traits/23', 3, N'stockDataHalfling')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (79, N'Draconic Anscestry', N'http://www.dnd5eapi.co/api/traits/24', 5, N'stockDataDragonborn')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (80, N'Breath Weapon', N'http://www.dnd5eapi.co/api/traits/25', 5, N'stockDataDragonborn')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (81, N'Damage Resistance (Dragonborn)', N'http://www.dnd5eapi.co/api/traits/36', 5, N'stockDataDragonborn')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (82, N'Darkvision (Gnome)', N'http://www.dnd5eapi.co/api/traits/42', 6, N'stockDataGnome')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (83, N'Gnome Cunning', N'http://www.dnd5eapi.co/api/traits/43', 6, N'stockDataGnome')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (84, N'Darkvision (Half-Elf)', N'http://www.dnd5eapi.co/api/traits/48', 7, N'stockDataHalf-Elf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (85, N'Fey Ancestry', N'http://www.dnd5eapi.co/api/traits/49', 7, N'stockDataHalf-Elf')
INSERT [dbo].[Trait] ([id], [name], [url], [race_id], [firebaseId]) VALUES (86, N'Skill Versatility', N'http://www.dnd5eapi.co/api/traits/50', 7, N'stockDataHalf-Elf')
SET IDENTITY_INSERT [dbo].[Trait] OFF
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
