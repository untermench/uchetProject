USE [master]
GO
/****** Object:  Database [uchotDB]    Script Date: 10.05.2023 13:49:06 ******/
CREATE DATABASE [uchotDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'uchotDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\uchotDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'uchotDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\uchotDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [uchotDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [uchotDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [uchotDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [uchotDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [uchotDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [uchotDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [uchotDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [uchotDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [uchotDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [uchotDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [uchotDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [uchotDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [uchotDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [uchotDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [uchotDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [uchotDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [uchotDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [uchotDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [uchotDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [uchotDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [uchotDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [uchotDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [uchotDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [uchotDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [uchotDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [uchotDB] SET  MULTI_USER 
GO
ALTER DATABASE [uchotDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [uchotDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [uchotDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [uchotDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [uchotDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [uchotDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [uchotDB] SET QUERY_STORE = OFF
GO
USE [uchotDB]
GO
/****** Object:  Table [dbo].[Группы]    Script Date: 10.05.2023 13:49:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Группы](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Специальность] [int] NOT NULL,
	[Места] [int] NOT NULL,
	[Свободные_места] [int] NOT NULL,
	[Префикс] [nvarchar](50) NOT NULL,
	[Курс] [int] NOT NULL,
	[Дата_создания] [date] NOT NULL,
	[Дата_окончания] [date] NULL,
	[ID_Преподаватель] [int] NULL,
 CONSTRAINT [PK_Группы] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявки]    Script Date: 10.05.2023 13:49:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявки](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Дата_рождения] [date] NOT NULL,
	[Место_обучения] [nvarchar](50) NOT NULL,
	[ID_Специальность] [int] NOT NULL,
	[Аттестат] [float] NOT NULL,
	[Номер] [nvarchar](12) NOT NULL,
	[Почта] [nvarchar](50) NULL,
	[ID_Статус] [int] NULL,
 CONSTRAINT [PK_Заявки] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Преподаватель]    Script Date: 10.05.2023 13:49:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Преподаватель](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](max) NOT NULL,
	[Рождение] [date] NOT NULL,
	[Почта] [nvarchar](50) NOT NULL,
	[Телефон] [nvarchar](12) NULL,
	[Стаж] [int] NOT NULL,
	[Изображение] [nvarchar](max) NULL,
 CONSTRAINT [PK_Преподаватель] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 10.05.2023 13:49:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](max) NOT NULL,
	[Почта] [nvarchar](50) NOT NULL,
	[Телефон] [nvarchar](12) NULL,
	[Логин] [nvarchar](50) NOT NULL,
	[Пароль] [nvarchar](50) NOT NULL,
	[ID_Тип] [int] NOT NULL,
 CONSTRAINT [PK_Сотрудник] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Специальность]    Script Date: 10.05.2023 13:49:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Специальность](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
	[Код] [nvarchar](50) NULL,
	[Сокращение] [nvarchar](50) NULL,
 CONSTRAINT [PK_Специальность] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статус_заявки]    Script Date: 10.05.2023 13:49:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статус_заявки](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Статус] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Статус_заявки] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статус_студента]    Script Date: 10.05.2023 13:49:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статус_студента](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Статус] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Статус_студента] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Студент]    Script Date: 10.05.2023 13:49:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Студент](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](max) NOT NULL,
	[Дата_рождения] [date] NOT NULL,
	[ID_Группа] [int] NOT NULL,
	[ID_Статус] [int] NOT NULL,
	[ID_Форма] [int] NOT NULL,
	[Зачисление] [date] NOT NULL,
	[Выбытие] [date] NULL,
	[Номер] [nvarchar](12) NULL,
	[Изображение] [nvarchar](max) NULL,
 CONSTRAINT [PK_Студент] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип_сотрудника]    Script Date: 10.05.2023 13:49:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип_сотрудника](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Тип_сотрудника] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Форма_обучения]    Script Date: 10.05.2023 13:49:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Форма_обучения](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Форма] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Форма_обучения] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Группы] ON 

INSERT [dbo].[Группы] ([ID], [ID_Специальность], [Места], [Свободные_места], [Префикс], [Курс], [Дата_создания], [Дата_окончания], [ID_Преподаватель]) VALUES (1, 1, 25, 24, N'ИС', 4, CAST(N'2019-09-02' AS Date), CAST(N'2023-06-30' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Группы] OFF
GO
SET IDENTITY_INSERT [dbo].[Сотрудник] ON 

INSERT [dbo].[Сотрудник] ([ID], [ФИО], [Почта], [Телефон], [Логин], [Пароль], [ID_Тип]) VALUES (1, N'Сыромицкий Дмитрий Сергеевич', N'stalkerpro200306@gmail.com', N'+79005001488', N'ne', N'neloh', 2)
INSERT [dbo].[Сотрудник] ([ID], [ФИО], [Почта], [Телефон], [Логин], [Пароль], [ID_Тип]) VALUES (2, N'Сыромицкий Дмитрий Сергеевич', N'stalkerpro200306@gmail.com', N'+79005001488', N'ne', N'neloh', 2)
SET IDENTITY_INSERT [dbo].[Сотрудник] OFF
GO
SET IDENTITY_INSERT [dbo].[Специальность] ON 

INSERT [dbo].[Специальность] ([ID], [Название], [Код], [Сокращение]) VALUES (1, N'09.02.07', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Специальность] OFF
GO
SET IDENTITY_INSERT [dbo].[Статус_студента] ON 

INSERT [dbo].[Статус_студента] ([ID], [Статус]) VALUES (1, N'Обучается')
INSERT [dbo].[Статус_студента] ([ID], [Статус]) VALUES (2, N'Закончил')
INSERT [dbo].[Статус_студента] ([ID], [Статус]) VALUES (3, N'Отчислен')
SET IDENTITY_INSERT [dbo].[Статус_студента] OFF
GO
SET IDENTITY_INSERT [dbo].[Студент] ON 

INSERT [dbo].[Студент] ([ID], [ФИО], [Дата_рождения], [ID_Группа], [ID_Статус], [ID_Форма], [Зачисление], [Выбытие], [Номер], [Изображение]) VALUES (4, N'Паладич Виталий Юрьевич', CAST(N'2003-06-09' AS Date), 1, 3, 1, CAST(N'2019-09-01' AS Date), CAST(N'2023-10-15' AS Date), N'79002359823', N'/Images/Student/test.jpg')
INSERT [dbo].[Студент] ([ID], [ФИО], [Дата_рождения], [ID_Группа], [ID_Статус], [ID_Форма], [Зачисление], [Выбытие], [Номер], [Изображение]) VALUES (6, N'Паладич Виталий Юрьевич', CAST(N'2003-06-09' AS Date), 1, 3, 1, CAST(N'2019-09-01' AS Date), CAST(N'2023-10-15' AS Date), N'79002359823', N'/Images/Student/test.jpg')
SET IDENTITY_INSERT [dbo].[Студент] OFF
GO
SET IDENTITY_INSERT [dbo].[Тип_сотрудника] ON 

INSERT [dbo].[Тип_сотрудника] ([ID], [Название]) VALUES (1, N'Администратор')
INSERT [dbo].[Тип_сотрудника] ([ID], [Название]) VALUES (2, N'Сотрудник')
SET IDENTITY_INSERT [dbo].[Тип_сотрудника] OFF
GO
SET IDENTITY_INSERT [dbo].[Форма_обучения] ON 

INSERT [dbo].[Форма_обучения] ([ID], [Форма]) VALUES (1, N'Очная')
INSERT [dbo].[Форма_обучения] ([ID], [Форма]) VALUES (2, N'Заочная')
SET IDENTITY_INSERT [dbo].[Форма_обучения] OFF
GO
ALTER TABLE [dbo].[Группы]  WITH CHECK ADD  CONSTRAINT [FK_Группы_Преподаватель] FOREIGN KEY([ID_Преподаватель])
REFERENCES [dbo].[Преподаватель] ([ID])
GO
ALTER TABLE [dbo].[Группы] CHECK CONSTRAINT [FK_Группы_Преподаватель]
GO
ALTER TABLE [dbo].[Группы]  WITH CHECK ADD  CONSTRAINT [FK_Группы_Специальность] FOREIGN KEY([ID_Специальность])
REFERENCES [dbo].[Специальность] ([ID])
GO
ALTER TABLE [dbo].[Группы] CHECK CONSTRAINT [FK_Группы_Специальность]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_Специальность] FOREIGN KEY([ID_Специальность])
REFERENCES [dbo].[Специальность] ([ID])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_Специальность]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_Статус_заявки] FOREIGN KEY([ID_Статус])
REFERENCES [dbo].[Статус_заявки] ([ID])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_Статус_заявки]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Тип_сотрудника] FOREIGN KEY([ID_Тип])
REFERENCES [dbo].[Тип_сотрудника] ([ID])
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [FK_Сотрудник_Тип_сотрудника]
GO
ALTER TABLE [dbo].[Студент]  WITH CHECK ADD  CONSTRAINT [FK_Студент_Группы] FOREIGN KEY([ID_Группа])
REFERENCES [dbo].[Группы] ([ID])
GO
ALTER TABLE [dbo].[Студент] CHECK CONSTRAINT [FK_Студент_Группы]
GO
ALTER TABLE [dbo].[Студент]  WITH CHECK ADD  CONSTRAINT [FK_Студент_Статус_студента] FOREIGN KEY([ID_Статус])
REFERENCES [dbo].[Статус_студента] ([ID])
GO
ALTER TABLE [dbo].[Студент] CHECK CONSTRAINT [FK_Студент_Статус_студента]
GO
ALTER TABLE [dbo].[Студент]  WITH CHECK ADD  CONSTRAINT [FK_Студент_Форма_обучения] FOREIGN KEY([ID_Форма])
REFERENCES [dbo].[Форма_обучения] ([ID])
GO
ALTER TABLE [dbo].[Студент] CHECK CONSTRAINT [FK_Студент_Форма_обучения]
GO
USE [master]
GO
ALTER DATABASE [uchotDB] SET  READ_WRITE 
GO
