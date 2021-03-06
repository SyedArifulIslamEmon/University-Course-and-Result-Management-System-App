USE [master]
GO
/****** Object:  Database [UniversityManagementDB]    Script Date: 30-Jan-16 1:40:56 AM ******/
CREATE DATABASE [UniversityManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\UniversityManagementDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\UniversityManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityManagementDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET RECOVERY FULL 
GO
ALTER DATABASE [UniversityManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UniversityManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UniversityManagementDB', N'ON'
GO
USE [UniversityManagementDB]
GO
/****** Object:  Table [dbo].[assigned_course_tbl]    Script Date: 30-Jan-16 1:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assigned_course_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[teachers_id] [int] NULL,
	[course_id] [int] NULL,
	[department_id] [int] NULL,
	[credit] [decimal](18, 2) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_assigned_course_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[courses]    Script Date: 30-Jan-16 1:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[credit] [decimal](18, 1) NOT NULL,
	[description] [varchar](400) NOT NULL,
	[department_id] [int] NOT NULL,
	[semester_id] [int] NOT NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department_tbl]    Script Date: 30-Jan-16 1:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](7) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[room_tbl]    Script Date: 30-Jan-16 1:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[room_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[room_no] [varchar](50) NOT NULL,
 CONSTRAINT [PK_room_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roomAllocation_tbl]    Script Date: 30-Jan-16 1:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roomAllocation_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[departmnetId] [int] NOT NULL,
	[courseId] [int] NOT NULL,
	[roomNo] [varchar](50) NOT NULL,
	[dayName] [varchar](50) NOT NULL,
	[timeForm] [varchar](50) NOT NULL,
	[timeTo] [varchar](50) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_roomAllocation_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[semester]    Script Date: 30-Jan-16 1:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[semester](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_semester] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[students_tbl]    Script Date: 30-Jan-16 1:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[students_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[registration_number] [varchar](12) NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](28) NULL,
	[date] [varchar](10) NULL,
	[address] [nvarchar](200) NULL,
	[departmentId] [int] NULL,
 CONSTRAINT [PK_students_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_students_tbl] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_students_tbl_1] UNIQUE NONCLUSTERED 
(
	[registration_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentTakenCourse]    Script Date: 30-Jan-16 1:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentTakenCourse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_registration_number] [varchar](12) NULL,
	[courseId] [int] NULL,
	[date] [varchar](12) NULL,
	[grade] [varchar](3) NULL,
 CONSTRAINT [PK_StudentTakenCourse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[teachers_tbl]    Script Date: 30-Jan-16 1:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teachers_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](80) NULL,
	[address] [varchar](200) NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](30) NULL,
	[designation] [varchar](50) NULL,
	[department_id] [int] NULL,
	[taken_credit] [decimal](18, 2) NULL,
 CONSTRAINT [PK_teachers_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CourseStatics]    Script Date: 30-Jan-16 1:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseStatics] AS SELECT c.Code,c.name as courseName,ISNULL(b.Name,'Not Assign Yet') As teachersName,c.semester_id,c.department_id
  FROM assigned_course_tbl a INNER JOIN teachers_tbl b 
  ON a.Teachers_id=b.id 
  RIGHT JOIN courses c
  ON a.Course_id=c.id WHERE a.status=1;

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_courses]    Script Date: 30-Jan-16 1:40:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_courses] ON [dbo].[courses]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_courses_1]    Script Date: 30-Jan-16 1:40:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_courses_1] ON [dbo].[courses]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department_tbl]    Script Date: 30-Jan-16 1:40:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department_tbl] ON [dbo].[Department_tbl]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department_tbl_1]    Script Date: 30-Jan-16 1:40:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department_tbl_1] ON [dbo].[Department_tbl]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[assigned_course_tbl]  WITH CHECK ADD  CONSTRAINT [FK_assigned_course_tbl_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[assigned_course_tbl] CHECK CONSTRAINT [FK_assigned_course_tbl_courses]
GO
ALTER TABLE [dbo].[assigned_course_tbl]  WITH CHECK ADD  CONSTRAINT [FK_assigned_course_tbl_Department_tbl] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department_tbl] ([id])
GO
ALTER TABLE [dbo].[assigned_course_tbl] CHECK CONSTRAINT [FK_assigned_course_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[assigned_course_tbl]  WITH CHECK ADD  CONSTRAINT [FK_assigned_course_tbl_teachers_tbl] FOREIGN KEY([teachers_id])
REFERENCES [dbo].[teachers_tbl] ([id])
GO
ALTER TABLE [dbo].[assigned_course_tbl] CHECK CONSTRAINT [FK_assigned_course_tbl_teachers_tbl]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_Department_tbl] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department_tbl] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_Department_tbl]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_semester] FOREIGN KEY([semester_id])
REFERENCES [dbo].[semester] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_semester]
GO
ALTER TABLE [dbo].[roomAllocation_tbl]  WITH CHECK ADD  CONSTRAINT [FK_roomAllocation_tbl_courses] FOREIGN KEY([courseId])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[roomAllocation_tbl] CHECK CONSTRAINT [FK_roomAllocation_tbl_courses]
GO
ALTER TABLE [dbo].[roomAllocation_tbl]  WITH CHECK ADD  CONSTRAINT [FK_roomAllocation_tbl_Department_tbl] FOREIGN KEY([departmnetId])
REFERENCES [dbo].[Department_tbl] ([id])
GO
ALTER TABLE [dbo].[roomAllocation_tbl] CHECK CONSTRAINT [FK_roomAllocation_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[students_tbl]  WITH CHECK ADD  CONSTRAINT [FK_students_tbl_Department_tbl] FOREIGN KEY([departmentId])
REFERENCES [dbo].[Department_tbl] ([id])
GO
ALTER TABLE [dbo].[students_tbl] CHECK CONSTRAINT [FK_students_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[StudentTakenCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentTakenCourse_courses] FOREIGN KEY([courseId])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[StudentTakenCourse] CHECK CONSTRAINT [FK_StudentTakenCourse_courses]
GO
ALTER TABLE [dbo].[StudentTakenCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentTakenCourse_StudentTakenCourse] FOREIGN KEY([student_registration_number])
REFERENCES [dbo].[students_tbl] ([registration_number])
GO
ALTER TABLE [dbo].[StudentTakenCourse] CHECK CONSTRAINT [FK_StudentTakenCourse_StudentTakenCourse]
GO
ALTER TABLE [dbo].[teachers_tbl]  WITH CHECK ADD  CONSTRAINT [FK_teachers_tbl_Department_tbl] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department_tbl] ([id])
GO
ALTER TABLE [dbo].[teachers_tbl] CHECK CONSTRAINT [FK_teachers_tbl_Department_tbl]
GO
USE [master]
GO
ALTER DATABASE [UniversityManagementDB] SET  READ_WRITE 
GO
