USE [Sports_Management]
GO
/****** Object:  Table [dbo].[tbl_teacher]    Script Date: 03/24/2019 16:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_teacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[teach_id] [varchar](50) NULL,
	[teacher_name] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_teacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_teacher] ON
INSERT [dbo].[tbl_teacher] ([id], [teach_id], [teacher_name], [password]) VALUES (1, N'Teacher@gmail.com', N'Taecher1', N'123456')
SET IDENTITY_INSERT [dbo].[tbl_teacher] OFF
/****** Object:  Table [dbo].[tbl_Student_Participate_Event]    Script Date: 03/24/2019 16:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Student_Participate_Event](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NOT NULL,
	[Event_Id] [int] NOT NULL,
	[Participate_On] [varchar](50) NOT NULL,
	[Mark_Attendance] [varchar](50) NULL,
	[Mark_Attendance_On] [varchar](50) NULL,
	[Round_In] [varchar](50) NULL,
	[Round_In_On] [varchar](50) NULL,
	[Winner_No] [varchar](50) NULL,
	[Winner_Declare_On] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Student_Participate_Event] ON
INSERT [dbo].[tbl_Student_Participate_Event] ([Id], [Student_Id], [Event_Id], [Participate_On], [Mark_Attendance], [Mark_Attendance_On], [Round_In], [Round_In_On], [Winner_No], [Winner_Declare_On]) VALUES (1, 1, 1, N'Mar 23 2019 11:37PM', N'P', N'Mar 24 2019  1:48PM', N'3', N'Mar 24 2019  3:08PM', N'1', N'Mar 24 2019  3:56PM')
INSERT [dbo].[tbl_Student_Participate_Event] ([Id], [Student_Id], [Event_Id], [Participate_On], [Mark_Attendance], [Mark_Attendance_On], [Round_In], [Round_In_On], [Winner_No], [Winner_Declare_On]) VALUES (2, 2, 1, N'Mar 23 2019 11:37PM', N'P', N'Mar 24 2019  1:49PM', N'3', N'Mar 24 2019  3:08PM', N'2', N'Mar 24 2019  3:58PM')
INSERT [dbo].[tbl_Student_Participate_Event] ([Id], [Student_Id], [Event_Id], [Participate_On], [Mark_Attendance], [Mark_Attendance_On], [Round_In], [Round_In_On], [Winner_No], [Winner_Declare_On]) VALUES (3, 3, 1, N'Mar 23 2019 11:37PM', N'P', N'Mar 24 2019  1:51PM', N'2', N'Mar 24 2019  3:05PM', NULL, NULL)
INSERT [dbo].[tbl_Student_Participate_Event] ([Id], [Student_Id], [Event_Id], [Participate_On], [Mark_Attendance], [Mark_Attendance_On], [Round_In], [Round_In_On], [Winner_No], [Winner_Declare_On]) VALUES (4, 4, 1, N'Mar 23 2019 11:37PM', N'P', N'Mar 24 2019  1:51PM', N'1', N'Mar 24 2019  3:02PM', NULL, NULL)
INSERT [dbo].[tbl_Student_Participate_Event] ([Id], [Student_Id], [Event_Id], [Participate_On], [Mark_Attendance], [Mark_Attendance_On], [Round_In], [Round_In_On], [Winner_No], [Winner_Declare_On]) VALUES (5, 5, 1, N'Mar 23 2019 11:37PM', N'P', N'Mar 24 2019  1:51PM', NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Student_Participate_Event] ([Id], [Student_Id], [Event_Id], [Participate_On], [Mark_Attendance], [Mark_Attendance_On], [Round_In], [Round_In_On], [Winner_No], [Winner_Declare_On]) VALUES (6, 6, 1, N'Mar 23 2019 11:37PM', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Student_Participate_Event] OFF
/****** Object:  Table [dbo].[tbl_student]    Script Date: 03/24/2019 16:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [varchar](50) NULL,
	[roll_no] [varchar](50) NULL,
	[class] [varchar](50) NULL,
	[division] [varchar](50) NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[address] [varchar](500) NULL,
	[mobile_no] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_student] ON
INSERT [dbo].[tbl_student] ([id], [student_id], [roll_no], [class], [division], [first_name], [last_name], [address], [mobile_no], [email], [password]) VALUES (1, N'1', N'1', N'I', N'A', N'Rupen', N'Chavan', N'Virara west', N'123456789', N'abc@gmail.com', N'123456')
INSERT [dbo].[tbl_student] ([id], [student_id], [roll_no], [class], [division], [first_name], [last_name], [address], [mobile_no], [email], [password]) VALUES (2, N'2', N'2', N'I', N'A', N'Abc', N'XYX', N'Virara west', N'123456789', N'abc2@gmail.com', N'123456')
INSERT [dbo].[tbl_student] ([id], [student_id], [roll_no], [class], [division], [first_name], [last_name], [address], [mobile_no], [email], [password]) VALUES (3, N'3', N'3', N'I', N'B', N'First Name', N'Last name', N'Virara west', N'123456789', N'abc3@gmail.com', N'123456')
INSERT [dbo].[tbl_student] ([id], [student_id], [roll_no], [class], [division], [first_name], [last_name], [address], [mobile_no], [email], [password]) VALUES (4, N'4', N'4', N'I', N'B', N'First Name', N'Last name', N'Virara west', N'123456789', N'abc4@gmail.com', N'123456')
INSERT [dbo].[tbl_student] ([id], [student_id], [roll_no], [class], [division], [first_name], [last_name], [address], [mobile_no], [email], [password]) VALUES (5, N'5', N'5', N'I', N'C', N'First Name', N'Last name', N'Virara west', N'123456789', N'abc5@gmail.com', N'123456')
INSERT [dbo].[tbl_student] ([id], [student_id], [roll_no], [class], [division], [first_name], [last_name], [address], [mobile_no], [email], [password]) VALUES (6, N'6', N'6', N'I', N'C', N'First Name', N'Last name', N'Virara west', N'123456789', N'abc6@gmail.com', N'123456')
INSERT [dbo].[tbl_student] ([id], [student_id], [roll_no], [class], [division], [first_name], [last_name], [address], [mobile_no], [email], [password]) VALUES (7, N'7', N'7', N'I', N'D', N'First Name', N'Last name', N'Virara west', N'123456789', N'abc7@gmail.com', N'123456')
INSERT [dbo].[tbl_student] ([id], [student_id], [roll_no], [class], [division], [first_name], [last_name], [address], [mobile_no], [email], [password]) VALUES (8, N'8', N'8', N'I', N'D', N'First Name', N'Last name', N'Virara west', N'123456789', N'abc8@gmail.com', N'123456')
SET IDENTITY_INSERT [dbo].[tbl_student] OFF
/****** Object:  Table [dbo].[tbl_sports_round]    Script Date: 03/24/2019 16:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_sports_round](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_category] [varchar](50) NULL,
	[no_of_round] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_sports_round] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_sports_round] ON
INSERT [dbo].[tbl_sports_round] ([id], [event_category], [no_of_round]) VALUES (1, N'1', N'3')
SET IDENTITY_INSERT [dbo].[tbl_sports_round] OFF
/****** Object:  Table [dbo].[tbl_sports_name]    Script Date: 03/24/2019 16:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_sports_name](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sports_name] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_sports_name] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_sports_name] ON
INSERT [dbo].[tbl_sports_name] ([id], [sports_name]) VALUES (1, N'')
SET IDENTITY_INSERT [dbo].[tbl_sports_name] OFF
/****** Object:  Table [dbo].[tbl_sports_category]    Script Date: 03/24/2019 16:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_sports_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sports_category] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_sports_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_sports_category] ON
INSERT [dbo].[tbl_sports_category] ([id], [sports_category]) VALUES (1, N'Indoar')
SET IDENTITY_INSERT [dbo].[tbl_sports_category] OFF
/****** Object:  Table [dbo].[tbl_event_category]    Script Date: 03/24/2019 16:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_event_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_category] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_event_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_event_category] ON
INSERT [dbo].[tbl_event_category] ([id], [event_category]) VALUES (1, N'Cricket')
SET IDENTITY_INSERT [dbo].[tbl_event_category] OFF
/****** Object:  Table [dbo].[tbl_Event_Attendance]    Script Date: 03/24/2019 16:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Event_Attendance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NOT NULL,
	[Event_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_event]    Script Date: 03/24/2019 16:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_event](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_name] [varchar](50) NULL,
	[event_category] [varchar](50) NULL,
	[description] [varchar](500) NULL,
	[start_date] [varchar](50) NULL,
	[end_date] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_event] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_event] ON
INSERT [dbo].[tbl_event] ([id], [event_name], [event_category], [description], [start_date], [end_date]) VALUES (1, N'ABC', N'1', N'Its an event held at Virar in Viva College', N'31-18-2018', N'01-01-2019')
SET IDENTITY_INSERT [dbo].[tbl_event] OFF
/****** Object:  Table [dbo].[tbl_Assign_Event_Teacher]    Script Date: 03/24/2019 16:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Assign_Event_Teacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Event_Id] [int] NOT NULL,
	[Teacher_Id] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Assign_Event_Teacher] ON
INSERT [dbo].[tbl_Assign_Event_Teacher] ([id], [Event_Id], [Teacher_Id]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_Assign_Event_Teacher] OFF
/****** Object:  Table [dbo].[tbl_admin_login]    Script Date: 03/24/2019 16:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_admin_login](
	[admin_email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[id] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_admin_login] ([admin_email], [password], [id]) VALUES (N'admin@gmail.com', N'admin', 1)
/****** Object:  Default [DF_tbl_User_Participate_Event_Participate_On]    Script Date: 03/24/2019 16:20:41 ******/
ALTER TABLE [dbo].[tbl_Student_Participate_Event] ADD  CONSTRAINT [DF_tbl_User_Participate_Event_Participate_On]  DEFAULT (getdate()) FOR [Participate_On]
GO
