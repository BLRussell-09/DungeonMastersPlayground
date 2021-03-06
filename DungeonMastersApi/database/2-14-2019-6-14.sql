USE [master]
GO
/****** Object:  Database [DungeonMaster]    Script Date: 2/14/2019 6:16:31 PM ******/
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
/****** Object:  Table [dbo].[Ability_bonuses]    Script Date: 2/14/2019 6:16:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ability_bonuses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[score] [int] NULL,
	[name] [varchar](250) NULL,
	[race_id] [varchar](250) NULL,
 CONSTRAINT [PK_Ability_bonuses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbilityScores]    Script Date: 2/14/2019 6:16:34 PM ******/
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
	[pc_id] [int] NULL,
	[firebase_id] [varchar](250) NULL,
 CONSTRAINT [PK_AbilityScores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2/14/2019 6:16:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[_id] [varchar](250) NOT NULL,
	[index] [int] NULL,
	[name] [varchar](75) NULL,
	[hit_die] [int] NULL,
	[url] [varchar](250) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class_Name]    Script Date: 2/14/2019 6:16:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Name](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [varchar](75) NULL,
	[owner_id] [int] NULL,
	[class_level] [int] NULL,
 CONSTRAINT [PK_Class_Name] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FromP]    Script Date: 2/14/2019 6:16:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FromP](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NULL,
	[url] [varchar](250) NULL,
	[class_id] [varchar](250) NULL,
 CONSTRAINT [PK_From] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NULL,
	[description] [varchar](500) NULL,
	[quantity] [int] NULL,
	[owner_id] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[name] [varchar](150) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [varchar](200) NULL,
	[race_id] [varchar](250) NULL,
	[firebaseId] [varchar](250) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPC]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPC](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[characteristics] [varchar](100) NOT NULL,
	[race_name] [varchar](50) NULL,
	[firebaseId] [varchar](250) NULL,
 CONSTRAINT [PK_NPC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pc]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[characteristics] [varchar](500) NULL,
	[description] [varchar](500) NULL,
	[hit_points] [int] NULL,
	[proficiency_score] [int] NULL,
	[experience] [int] NULL,
	[level] [int] NULL,
	[is_active] [bit] NULL,
	[race_name] [varchar](50) NULL,
	[firebase_id] [varchar](250) NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_Pc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PcAs]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PcAs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[strength] [int] NULL,
	[dexterity] [int] NULL,
	[constitution] [int] NULL,
	[wisdom] [int] NULL,
	[charisma] [int] NULL,
	[owner_id] [int] NULL,
	[intelligence] [int] NULL,
 CONSTRAINT [PK_PcAs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proficiencies]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proficiencies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NULL,
	[url] [varchar](250) NULL,
	[class_id] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Proficiencies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proficiency_Choices]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proficiency_Choices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](250) NULL,
	[choose] [int] NULL,
	[class_id] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Proficiency_Choices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proficiency_Skills]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proficiency_Skills](
	[athletics] [bit] NULL,
	[acrobatics] [bit] NULL,
	[arcana] [bit] NULL,
	[animal_Handling] [bit] NULL,
	[deception] [bit] NULL,
	[history] [bit] NULL,
	[insight] [bit] NULL,
	[intimidation] [bit] NULL,
	[investigation] [bit] NULL,
	[medicine] [bit] NULL,
	[nature] [bit] NULL,
	[perception] [bit] NULL,
	[performance] [bit] NULL,
	[persuasion] [bit] NULL,
	[religion] [bit] NULL,
	[sleight_of_hand] [bit] NULL,
	[stealth] [bit] NULL,
	[survival] [bit] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[owner_id] [int] NULL,
 CONSTRAINT [PK_Proficiency_Skills] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Race]    Script Date: 2/14/2019 6:16:35 PM ******/
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
	[_id] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Race'] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saving_Throws]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saving_Throws](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[url] [varchar](250) NULL,
	[class_id] [varchar](250) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Starting_proficiency]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Starting_proficiency](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NULL,
	[url] [varchar](250) NULL,
	[race_id] [varchar](250) NULL,
	[firebaseId] [varchar](250) NULL,
 CONSTRAINT [PK_Starting_proficiency] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subrace]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subrace](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NULL,
	[url] [varchar](150) NULL,
	[race_id] [varchar](250) NULL,
	[firebaseId] [varchar](250) NULL,
 CONSTRAINT [PK_Subrace] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trait]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trait](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NULL,
	[url] [varchar](150) NULL,
	[race_id] [varchar](250) NULL,
	[firebaseId] [varchar](250) NULL,
 CONSTRAINT [PK_Trait] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weapons]    Script Date: 2/14/2019 6:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weapons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NULL,
	[damage_dice] [int] NULL,
	[owner_id] [int] NULL,
	[description] [varchar](500) NULL,
	[dice_count] [int] NULL,
 CONSTRAINT [PK_Weapons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ability_bonuses]  WITH CHECK ADD  CONSTRAINT [FK_Ability_bonuses_Ability_bonuses] FOREIGN KEY([race_id])
REFERENCES [dbo].[Race] ([_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ability_bonuses] CHECK CONSTRAINT [FK_Ability_bonuses_Ability_bonuses]
GO
ALTER TABLE [dbo].[AbilityScores]  WITH CHECK ADD  CONSTRAINT [FK_AbilityScores_NPC] FOREIGN KEY([owner_id])
REFERENCES [dbo].[NPC] ([id])
GO
ALTER TABLE [dbo].[AbilityScores] CHECK CONSTRAINT [FK_AbilityScores_NPC]
GO
ALTER TABLE [dbo].[Class_Name]  WITH CHECK ADD  CONSTRAINT [FK_Class_Name_Pc] FOREIGN KEY([owner_id])
REFERENCES [dbo].[Pc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class_Name] CHECK CONSTRAINT [FK_Class_Name_Pc]
GO
ALTER TABLE [dbo].[FromP]  WITH CHECK ADD  CONSTRAINT [FK_From_Class] FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FromP] CHECK CONSTRAINT [FK_From_Class]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Pc] FOREIGN KEY([owner_id])
REFERENCES [dbo].[Pc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Pc]
GO
ALTER TABLE [dbo].[Language]  WITH CHECK ADD  CONSTRAINT [FK_Language_Race] FOREIGN KEY([race_id])
REFERENCES [dbo].[Race] ([_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Language] CHECK CONSTRAINT [FK_Language_Race]
GO
ALTER TABLE [dbo].[PcAs]  WITH CHECK ADD  CONSTRAINT [FK_PcAs_Pc] FOREIGN KEY([owner_id])
REFERENCES [dbo].[Pc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PcAs] CHECK CONSTRAINT [FK_PcAs_Pc]
GO
ALTER TABLE [dbo].[Proficiencies]  WITH CHECK ADD  CONSTRAINT [FK_Proficiencies_Class] FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Proficiencies] CHECK CONSTRAINT [FK_Proficiencies_Class]
GO
ALTER TABLE [dbo].[Proficiency_Choices]  WITH CHECK ADD  CONSTRAINT [FK_Proficiency_Choices_Class] FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Proficiency_Choices] CHECK CONSTRAINT [FK_Proficiency_Choices_Class]
GO
ALTER TABLE [dbo].[Proficiency_Skills]  WITH CHECK ADD  CONSTRAINT [FK_Proficiency_Skills_Pc] FOREIGN KEY([owner_id])
REFERENCES [dbo].[Pc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Proficiency_Skills] CHECK CONSTRAINT [FK_Proficiency_Skills_Pc]
GO
ALTER TABLE [dbo].[Saving_Throws]  WITH CHECK ADD  CONSTRAINT [FK_Saving_Throws_Class] FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Saving_Throws] CHECK CONSTRAINT [FK_Saving_Throws_Class]
GO
ALTER TABLE [dbo].[Starting_proficiency]  WITH CHECK ADD  CONSTRAINT [FK_Starting_proficiency_Race] FOREIGN KEY([race_id])
REFERENCES [dbo].[Race] ([_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Starting_proficiency] CHECK CONSTRAINT [FK_Starting_proficiency_Race]
GO
ALTER TABLE [dbo].[Subrace]  WITH CHECK ADD  CONSTRAINT [FK_Subrace_Race] FOREIGN KEY([race_id])
REFERENCES [dbo].[Race] ([_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Subrace] CHECK CONSTRAINT [FK_Subrace_Race]
GO
ALTER TABLE [dbo].[Trait]  WITH CHECK ADD  CONSTRAINT [FK_Trait_Race] FOREIGN KEY([race_id])
REFERENCES [dbo].[Race] ([_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Trait] CHECK CONSTRAINT [FK_Trait_Race]
GO
ALTER TABLE [dbo].[Weapons]  WITH CHECK ADD  CONSTRAINT [FK_Weapons_Pc] FOREIGN KEY([owner_id])
REFERENCES [dbo].[Pc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Weapons] CHECK CONSTRAINT [FK_Weapons_Pc]
GO
USE [master]
GO
ALTER DATABASE [DungeonMaster] SET  READ_WRITE 
GO
