USE [master]
GO
/****** Object:  Database [UniversityManagementDB]    Script Date: 30-Jan-16 1:42:01 AM ******/
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
/****** Object:  Table [dbo].[assigned_course_tbl]    Script Date: 30-Jan-16 1:42:01 AM ******/
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
/****** Object:  Table [dbo].[courses]    Script Date: 30-Jan-16 1:42:01 AM ******/
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
/****** Object:  Table [dbo].[Department_tbl]    Script Date: 30-Jan-16 1:42:01 AM ******/
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
/****** Object:  Table [dbo].[room_tbl]    Script Date: 30-Jan-16 1:42:01 AM ******/
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
/****** Object:  Table [dbo].[roomAllocation_tbl]    Script Date: 30-Jan-16 1:42:01 AM ******/
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
/****** Object:  Table [dbo].[semester]    Script Date: 30-Jan-16 1:42:01 AM ******/
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
/****** Object:  Table [dbo].[students_tbl]    Script Date: 30-Jan-16 1:42:01 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentTakenCourse]    Script Date: 30-Jan-16 1:42:01 AM ******/
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
/****** Object:  Table [dbo].[teachers_tbl]    Script Date: 30-Jan-16 1:42:01 AM ******/
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
/****** Object:  View [dbo].[CourseStatics]    Script Date: 30-Jan-16 1:42:01 AM ******/
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
SET IDENTITY_INSERT [dbo].[assigned_course_tbl] ON 

INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (1, 1, 4, 14, CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (10, 2, 7, 14, CAST(2.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (11, 2, 8, 14, CAST(2.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (12, 3, 6, 15, CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (13, 1, 9, 14, CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (14, 1, 10, 14, CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (15, 1, 11, 14, CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (16, 1, 12, 14, CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (17, 1, 14, 14, CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (1002, 4, 13, 14, CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (1003, 4, 1008, 14, CAST(2.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (2002, 7, 1011, 1010, CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (3014, 1, 4, 14, CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[assigned_course_tbl] ([id], [teachers_id], [course_id], [department_id], [credit], [status]) VALUES (3015, 1, 7, 14, CAST(2.50 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[assigned_course_tbl] OFF
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (4, N'CSE-101', N'Computer Fundamental', CAST(3.0 AS Decimal(18, 1)), N'This is the computer science questions', 14, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (6, N'EEE-101', N'Electronic Circit', CAST(3.0 AS Decimal(18, 1)), N'An electronic circuit is composed of individual electronic components', 15, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (7, N'CSE-102', N'Computer Algorithom', CAST(2.5 AS Decimal(18, 1)), N'A computer program can be viewed as an elaborate algorithm. In mathematics and computer science, an algorithm usually means a small procedure that solves ...', 14, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (8, N'CSE-111', N'C Programming', CAST(2.5 AS Decimal(18, 1)), N'bla bla bla', 14, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (9, N'CSE-112', N'OOP', CAST(5.0 AS Decimal(18, 1)), N'bla bla bla', 14, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (10, N'CSE-113', N'Database Design', CAST(5.0 AS Decimal(18, 1)), N'bla bla bla', 14, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (11, N'CSE-114', N'Software Enginering', CAST(5.0 AS Decimal(18, 1)), N'bla bla bla', 14, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (12, N'CSE-115', N'Digital Logic', CAST(5.0 AS Decimal(18, 1)), N'bla bla bla', 14, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (13, N'CSE-117', N'Java Programming', CAST(3.0 AS Decimal(18, 1)), N'bla bla bla', 14, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (14, N'CSE-118', N'Python Programming', CAST(5.0 AS Decimal(18, 1)), N'bla bla bla', 14, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (1008, N'CSE-119', N'Assembly Language', CAST(2.5 AS Decimal(18, 1)), N'bla bla bla', 14, 2)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (1009, N'EEE-201', N'Basic Electronic', CAST(3.0 AS Decimal(18, 1)), N'Bla Bla', 15, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (1010, N'BBA-001', N'Business Administration', CAST(2.5 AS Decimal(18, 1)), N'bla bla bla', 14, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (1011, N'BBA-002', N'Management', CAST(5.0 AS Decimal(18, 1)), N'bla bla bla', 1010, 1)
INSERT [dbo].[courses] ([id], [code], [name], [credit], [description], [department_id], [semester_id]) VALUES (1012, N'LLB-001', N'Low Rule', CAST(5.0 AS Decimal(18, 1)), N'bla bla bla', 2010, 1)
SET IDENTITY_INSERT [dbo].[courses] OFF
SET IDENTITY_INSERT [dbo].[Department_tbl] ON 

INSERT [dbo].[Department_tbl] ([id], [code], [name]) VALUES (14, N'CSE', N'Computer')
INSERT [dbo].[Department_tbl] ([id], [code], [name]) VALUES (15, N'EEE', N'Electronic ')
INSERT [dbo].[Department_tbl] ([id], [code], [name]) VALUES (16, N'1', N'kkk')
INSERT [dbo].[Department_tbl] ([id], [code], [name]) VALUES (1010, N'BBA', N'Bavhalor of Business Administration')
INSERT [dbo].[Department_tbl] ([id], [code], [name]) VALUES (2010, N'LLB', N'LOW')
INSERT [dbo].[Department_tbl] ([id], [code], [name]) VALUES (2011, N'1111', N'ffffffffffff')
INSERT [dbo].[Department_tbl] ([id], [code], [name]) VALUES (2012, N'CSE-101', N'Computer Algorithom')
INSERT [dbo].[Department_tbl] ([id], [code], [name]) VALUES (2014, N'CSE-112', N'Mohammad Faruk')
SET IDENTITY_INSERT [dbo].[Department_tbl] OFF
SET IDENTITY_INSERT [dbo].[room_tbl] ON 

INSERT [dbo].[room_tbl] ([id], [room_no]) VALUES (1, N'101')
INSERT [dbo].[room_tbl] ([id], [room_no]) VALUES (2, N'102')
INSERT [dbo].[room_tbl] ([id], [room_no]) VALUES (3, N'103')
INSERT [dbo].[room_tbl] ([id], [room_no]) VALUES (4, N'104')
INSERT [dbo].[room_tbl] ([id], [room_no]) VALUES (5, N'105')
INSERT [dbo].[room_tbl] ([id], [room_no]) VALUES (6, N'106')
INSERT [dbo].[room_tbl] ([id], [room_no]) VALUES (7, N'201')
INSERT [dbo].[room_tbl] ([id], [room_no]) VALUES (8, N'202')
INSERT [dbo].[room_tbl] ([id], [room_no]) VALUES (9, N'203')
INSERT [dbo].[room_tbl] ([id], [room_no]) VALUES (10, N'204')
INSERT [dbo].[room_tbl] ([id], [room_no]) VALUES (11, N'205')
SET IDENTITY_INSERT [dbo].[room_tbl] OFF
SET IDENTITY_INSERT [dbo].[roomAllocation_tbl] ON 

INSERT [dbo].[roomAllocation_tbl] ([id], [departmnetId], [courseId], [roomNo], [dayName], [timeForm], [timeTo], [status]) VALUES (1, 14, 4, N'102', N'Sun', N'10:20 AM', N'01:00 PM', 1)
SET IDENTITY_INSERT [dbo].[roomAllocation_tbl] OFF
SET IDENTITY_INSERT [dbo].[semester] ON 

INSERT [dbo].[semester] ([id], [name]) VALUES (1, N'Fall-2016')
INSERT [dbo].[semester] ([id], [name]) VALUES (2, N'Spring-2016')
INSERT [dbo].[semester] ([id], [name]) VALUES (3, N'Summer-2016')
SET IDENTITY_INSERT [dbo].[semester] OFF
SET IDENTITY_INSERT [dbo].[students_tbl] ON 

INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (1, N'CSE-2016-001', N'Md. Rakibur Rahman', N'matirmanusrakib@gmail.com', N'+8801813550000', N'01-01-2016', N'Mirpur-1, Dhaka-1216', 14)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (2, N'BBA-2013-001', N'Md. Rakibur Rahman(Poran)', N'matirmanusrakib@live.com', N'+8801813550000', N'01-02-2013', N'Mirpur-1, Dhaka-1216', 1010)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (3, N'BBA-2013-002', N'Md. Rakibur Rahman(Poran)', N'matirmanusrakib@hotmail.com', N'01813550000', N'01-02-2013', N'Mirpur-1, Dhaka-1216', 1010)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (1002, N'CSE-2014-001', N'Mohammad Faruk', N'sffaruk@outlook.com', N'01856333493', N'01-01-2014', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 14)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (1003, N'CSE-2014-002', N'Mohammad Faruk', N'sffaruk@outlook.comm', N'01856333493', N'01-01-2014', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 14)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (1004, N'CSE-2014-003', N'Rakib', N'lyfoflinux@gmail.com', N'01856333493', N'01-01-2014', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 14)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (1005, N'CSE-2014-004', N'Rakibur Rahman', N'fis.ncc@gmail.com', N'01856333493', N'01-01-2014', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 14)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (1006, N'CSE-2014-005', N'Poran', N'sffaruk@live.com', N'01813550000', N'01-01-2014', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 14)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (1007, N'CSE-2014-006', N'Mohammad', N'CourseCredit@outlook.com', N'01856333493', N'01-01-2014', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 14)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (1008, N'CSE-2014-007', N'Mohammad Faruk', N'Faruk@outlook.com', N'01856333493', N'01-01-2014', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 14)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (1009, N'CSE-2014-008', N'Rony', N'fis.nc@gmail.com', N'01813550000', N'01-01-2014', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 14)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (1010, N'CSE-2014-009', N'Sufian', N'sufian@gmail.com', N'01823188400', N'01-01-2014', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 14)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (1011, N'CSE-2014-010', N'Ismail', N'ismail@outlook.com', N'01856333493', N'01-01-2014', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 14)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (1012, N'CSE-2017-001', N'Mohammad Faruk', N'sffaruk@outlook.commm', N'01856333493', N'22-01-2017', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 14)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (2005, N'EEE-2016-001', N'Mohammad Faruk', N'sffaruk@outlook.comnn', N'01856333493', N'01/27/2016', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 15)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (2006, N'BBA-2016-001', N'Poran', N'sffaruk44@gmail.com', N'01856333493', N'01/27/2016', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 1010)
INSERT [dbo].[students_tbl] ([id], [registration_number], [name], [email], [phone], [date], [address], [departmentId]) VALUES (2007, N'LLB-2006-001', N'Poran', N'sffaruk@outlook.comnnu', N'01813550000', N'07/11/2006', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', 2010)
SET IDENTITY_INSERT [dbo].[students_tbl] OFF
SET IDENTITY_INSERT [dbo].[StudentTakenCourse] ON 

INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (1, N'CSE-2014-002', 4, N'01/27/2016', N'A')
INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (2, N'CSE-2014-001', 4, N'01/27/2016', N'A+')
INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (3, N'CSE-2014-001', 7, N'01/27/2016', N'C-')
INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (4, N'EEE-2016-001', 6, N'01/27/2016', N'B')
INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (5, N'EEE-2016-001', 1009, N'01/27/2016', N'A+')
INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (6, N'CSE-2014-003', 4, N'01/27/2016', NULL)
INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (7, N'CSE-2014-006', 4, N'01/27/2016', N'C+')
INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (8, N'CSE-2014-003', 8, N'01/27/2016', N'')
INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (9, N'CSE-2014-008', 10, N'01/12/2016', N'A+')
INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (10, N'CSE-2014-004', 8, N'01/28/2016', N'A+')
INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (11, N'CSE-2014-004', 14, N'01/02/2016', N'B+')
INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (12, N'CSE-2014-004', 12, N'01/28/2016', N'C+')
INSERT [dbo].[StudentTakenCourse] ([id], [student_registration_number], [courseId], [date], [grade]) VALUES (13, N'BBA-2013-001', 1011, N'01/28/2016', N'A+')
SET IDENTITY_INSERT [dbo].[StudentTakenCourse] OFF
SET IDENTITY_INSERT [dbo].[teachers_tbl] ON 

INSERT [dbo].[teachers_tbl] ([id], [name], [address], [email], [phone], [designation], [department_id], [taken_credit]) VALUES (1, N'Md. Rakibur Rahman', N'Mirpur-1, Dhaka-1216', N'matirmanusrakib@gmail.com', N'+8801813550000', N'1', 14, CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[teachers_tbl] ([id], [name], [address], [email], [phone], [designation], [department_id], [taken_credit]) VALUES (2, N'Md. Rakib', N'Mirpur-1, Dhaka-1216', N'matirmanusrakib@live.com', N'+8801813550000', N'1', 14, CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[teachers_tbl] ([id], [name], [address], [email], [phone], [designation], [department_id], [taken_credit]) VALUES (3, N'Sufian', N'Mirpur-1, Dhaka-1216', N'anik.eng2012@gmail.com', N'+8801813550000', N'1', 15, CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[teachers_tbl] ([id], [name], [address], [email], [phone], [designation], [department_id], [taken_credit]) VALUES (4, N'Rony', N'Mirpur-1, Dhaka-1216', N'abusufianrony708@gmail.com', N'+8801813550000', N'2', 14, CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[teachers_tbl] ([id], [name], [address], [email], [phone], [designation], [department_id], [taken_credit]) VALUES (5, N'Younus', N'Mirpur-1, Dhaka-1216', N'younus@gmail.com', N'+8801813550000', N'2', 15, CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[teachers_tbl] ([id], [name], [address], [email], [phone], [designation], [department_id], [taken_credit]) VALUES (6, N'Mohammad Faruk', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', N'sffaruk@outlook.com', N'01856333493', N'2', 14, CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[teachers_tbl] ([id], [name], [address], [email], [phone], [designation], [department_id], [taken_credit]) VALUES (7, N'Mohammad Faruk', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', N'sffaruk@outlookk.com', N'01856333493', N'1', 1010, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[teachers_tbl] ([id], [name], [address], [email], [phone], [designation], [department_id], [taken_credit]) VALUES (8, N'Rakibur Rahman', N'House # 13, Road # 01, Block # G, Avenue Road, Mirpur-01', N'lyfoflinux@gmail.comm', N'01856333493', N'1', 2010, CAST(23.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[teachers_tbl] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_courses]    Script Date: 30-Jan-16 1:42:01 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_courses] ON [dbo].[courses]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_courses_1]    Script Date: 30-Jan-16 1:42:01 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_courses_1] ON [dbo].[courses]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department_tbl]    Script Date: 30-Jan-16 1:42:01 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department_tbl] ON [dbo].[Department_tbl]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department_tbl_1]    Script Date: 30-Jan-16 1:42:01 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department_tbl_1] ON [dbo].[Department_tbl]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_students_tbl]    Script Date: 30-Jan-16 1:42:01 AM ******/
ALTER TABLE [dbo].[students_tbl] ADD  CONSTRAINT [IX_students_tbl] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_students_tbl_1]    Script Date: 30-Jan-16 1:42:01 AM ******/
ALTER TABLE [dbo].[students_tbl] ADD  CONSTRAINT [IX_students_tbl_1] UNIQUE NONCLUSTERED 
(
	[registration_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
