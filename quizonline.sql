USE [TestQuiz]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 6/2/2020 3:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answer](
	[AnsId] [varchar](5) NOT NULL,
	[AnsContent] [varchar](500) NOT NULL,
	[QuesId] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 6/2/2020 3:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QContent] [varchar](500) NOT NULL,
	[CorrectAnswerId] [char](2) NOT NULL,
	[DateOfCreate] [datetime] NOT NULL,
	[SubId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/2/2020 3:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [bit] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/2/2020 3:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 6/2/2020 3:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubId] [int] IDENTITY(1,1) NOT NULL,
	[SubName] [varchar](50) NOT NULL,
	[NumOfQuestions] [int] NOT NULL,
	[Time] [int] NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestQuestions]    Script Date: 6/2/2020 3:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestQuestions](
	[TestQuesId] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [int] NOT NULL,
	[QuesId] [int] NOT NULL,
	[AnsId] [varchar](5) NOT NULL,
 CONSTRAINT [PK_TestQuestions] PRIMARY KEY CLUSTERED 
(
	[TestQuesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 6/2/2020 3:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tests](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Marks] [float] NOT NULL,
	[SubjectName] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/2/2020 3:09:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Email] [varchar](50) NOT NULL,
	[Fullname] [varchar](50) NOT NULL,
	[Password] [varchar](265) NOT NULL,
	[RoleId] [bit] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'vgvhj', 69)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'vhjvhj', 69)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'bhjb', 69)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'bbjk', 69)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'The javax.servlet.annotation package provides annotations to 
declare Servlets by specifying metadata information in the Servlet 
class', 11)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'There are many instance of Servlet created on the Web server.', 11)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Servlets Are Java codes that are used to add dynamic content to Web server.', 11)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'A Servlet’s initializing code is used only for initializing in the 1 st time', 11)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Response Message includes:  Status line, Header Information, Message Body', 12)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Request Object is created by Request Message', 12)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Request Message includes:  Status line, Header Information, Message Body', 12)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Container is a sofware but not compiler', 12)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Properties Of RequestObject is Converted by Request Object', 13)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Header Information of Request Object includes all information from client to server', 13)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Message body of Response Object contains parameter', 13)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Request Message is created by Browser/OS', 13)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Maps the request to servlet, translate request, passes request to servlet', 14)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Translates request, maps the request to servlet, passes request to servlet', 14)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Passes request to servlet, translates the request, maps the request to servlet', 14)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Translates request, passes request to servlet, maps the request to servlet', 14)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'The servlet processes the request and produces a response.', 15)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'The container translates the response into the network format, then sends the 
response back to the Web server.', 15)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Is designed to perform well while serving a request', 15)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Both the container and the objects in the container are multithreaded', 15)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Group related components. 
', 16)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Share data in easily.
', 16)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Provide a set of services for the web application to work with the container
', 16)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'All of the others', 16)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'returns a ServletContext object used by the servlet to interact 
with its container
', 17)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Retrieves the value of the initialisation parameter
', 17)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Searches the configuration information and retrieves name of 
the servlet instance
', 17)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'All of the others', 17)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'It exists from Request Message hits container to Response Message is delivered by Servlet', 18)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Library imported in java is: javax.servlet.ServletRequest
', 18)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Data Type is HttpServletRequest', 18)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'It is used for authenticated users', 18)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Session Scope', 19)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Application Scope', 19)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Request Scope', 19)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Page Scope', 19)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Nhu Cute', 28)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'JSP is always compiled before it is processed by the server', 28)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Nguyen Khung', 28)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Nam Dep Trai', 28)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'jhjb', 70)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'jbjkbjk', 70)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'bkbk', 70)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'jhhkbk', 70)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Running programs on multiple machines', 71)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Switching the CPU between executing programs in order to maximize resource utilization', 71)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Allowing multiple users to write programs simultaneously', 71)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'None of the other choices', 71)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Windows', 72)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Mac OS', 72)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'UNIX', 72)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'None of the other choices', 72)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Process Management', 73)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Time Management', 73)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Space Management', 73)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Speed Management', 73)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Ã¡dasd', 55)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'sadasdasd', 55)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'ádsadsa', 55)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'sdfsd', 55)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'dgfdgfdg', 56)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'dfgdfgfd', 56)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'gdfgfdgfd', 56)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'gdfg', 56)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'ADD', 57)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'FDFDS', 57)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'sdfsdfs', 57)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'FDFSF', 57)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Nguyen Nhuuuu', 58)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Quynh Nhu Cute', 58)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'asdasdasda', 58)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'sdasdasdas', 58)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Nhu Xinh Dep', 59)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'dfsdfsdf', 59)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'sdfsdfsd', 59)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'aaaaaaaaaaa', 59)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Personal Computer', 61)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Personal Device', 61)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Personal Operating System', 61)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Personal Digital Assistant', 61)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'ffsdfs', 63)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'fsfsdf', 63)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'sfsdfs', 63)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'fsfsdf', 63)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'JSP has significantly better performance than CGI', 66)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'sdfsdfdsf', 66)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'ffsdfsd', 66)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'dgdf', 66)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'nhu map', 67)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'nhu tu', 67)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'haha', 67)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'meo emo', 67)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Embbed Operating System', 75)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Personal Computer Operating System', 75)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Mainframe Operating System', 75)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'All of the others', 75)
GO
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Block special file', 77)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Character special file', 77)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Excepting block and character special file (e.g. clock)', 77)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'All of the others', 77)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Formatted Message', 78)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Directed Signal', 78)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Client cannot communicate to server', 78)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'None of the others', 78)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Real-time Operating System', 79)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Mainframe Operating System', 79)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Server Operating System', 79)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'PC Operating System', 79)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'GDFHGH', 80)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'GJvefd', 80)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'bdfbdb', 80)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'dfgdf', 80)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Operating System', 81)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'System Calls', 81)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Shell', 81)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'All of the others', 81)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Pretty', 82)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'beauty', 82)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'lovety', 82)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'paba', 82)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'good', 83)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'bad', 83)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'perfect', 83)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'handsome', 83)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'hsdfgsd', 84)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'fsdfsdfsd', 84)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'dbfgbnj', 84)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'ghjghjhgf', 84)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'fghgf', 85)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'nhgn', 85)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'tewrw', 85)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'tetre', 85)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'System programs are simply user interfaces to system callsSystem programs are simply user interfaces to system calls', 86)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'System programs define the view of the OS seen by most users while System Calls are hidden to user', 86)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'All of the others', 86)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'None of the others', 86)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Microkernels', 87)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Kernels', 87)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Layers', 87)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'All of the others', 87)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'2.75', 88)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'3.25', 88)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'4.65', 88)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'7.25', 88)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'blocked -> running', 89)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N' running -> ready', 89)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'blocked -> ready', 89)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'ready -> running', 89)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'6.00', 90)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'5.00', 90)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'4.0', 90)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'3.0', 90)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'8.0', 91)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'14.0', 91)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'12.0', 91)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'15.0', 91)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'nhu map', 68)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'biubih', 68)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'bhbib', 68)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'bjnk', 68)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'adasd', 36)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'JSP is always compiled before it is processed by the server', 36)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'dadasd', 36)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'asdaSD', 36)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'JSP has significantly better performance than CGI', 37)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'JSP is always compiled before it is processed by the server', 37)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'JSP has access to all powerful Enterprise Java APIs, including JDBC, EJB, JAXP, ...', 37)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'JSP is well suited for uploading files or for creating dynamic images', 37)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'dele', 38)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'huiNK', 38)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Nhu Xinh Dep', 38)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'jkbkb', 38)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'A block', 39)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'A pipe', 39)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'A specific file', 39)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'A block file', 39)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Personal computers are always interactive', 40)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Mainframe computers are mostly batch systems with many users', 40)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Protection is much more important on mainframe computers', 40)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'All of the others', 40)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Provide the users with an extended (virtual) machine', 41)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Manage the I/O devices', 41)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Provide user interfaces', 41)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Support virtual memory', 41)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Monolithic system', 42)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Layered System', 42)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Virtual Machine', 42)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Client-server model', 42)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Multiple CPU', 43)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N' Time-sharing', 43)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Many I/O devices', 43)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Restriction of memory size, speed of CPU, screen size, powers', 43)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'In kernel mode, the OS can execute every instruction in the instruction set', 44)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'In user mode, user program can execute only a subset of instructions', 44)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N' Having two modes of operation helps prevent user programs from accessing critical instructions', 44)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'None of the others', 44)
GO
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Another name for a batch systemAnother name for a batch system', 45)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'A multi-user, multi-process, interactive system', 45)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'All of the others', 45)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'None of the others', 45)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N' The modules run user mode `\rightarrow` protection against bugs', 46)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N' The modules run user mode `\rightarrow` protection against bugs', 46)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N' Resist crashing the entire system', 46)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'All of the others', 46)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Resist crashing the entire system', 47)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Achieve high reliability by splitting the OS into small, well-defined modules', 47)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'The modules run user mode to protection against bugs', 47)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'None of the others', 47)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Operator â?? process communication, User programs, and Processor allocation and multiprogramming', 48)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Procedure management, User programs, and Processor allocation and multiprogramming', 48)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'File management, Operator â?? process communication, and Processor allocation and multiprogramming', 48)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Service management, and Operator â?? process communication, User programs', 48)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Do not disrupt the normal system operation, Completely protecting system resources, and Solving system compatibility system', 49)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Do not disrupt the normal system operation, Completely protecting system resources, and keep track of which virtual machine has been assigned which resource', 49)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Saving a layer mapping, Do not disrupt the normal system operation, and Completely protecting system resources', 49)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Allocate all disks, Completely protecting system resources, and Solving system compatibility system', 49)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Virtual Machine', 50)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Extend Kernel', 50)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Extra Kernel', 50)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'ExoKernel', 50)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'MS-DOS', 51)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Monochrome', 51)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'MonoOS', 51)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'MonoKernel', 51)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'a piece of firmware that essentially provides a kind of interface for end-users', 52)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'A piece of software that essentially provides a kind of interface for end-users', 52)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'A piece of hardware that essentially provides a kind of interface for end-users', 52)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Rigid outer covering of an animal', 52)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Shell scripts', 53)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Shell commands', 53)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'None of the others', 53)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'All of the others', 53)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Protection', 54)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Address space', 54)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Pipes', 54)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'I/O management', 54)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'A set of service procedures that carry out the system calls', 60)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'A set of utility procedures that Help the service procedures', 60)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'A main program that invokes the requested service procedure', 60)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'All of others', 60)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'fsdfsdf', 62)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'gfdgh', 62)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'fghgfhg', 62)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'hfhfghgf', 62)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Nhu Cute', 64)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'Nguyen Map', 64)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'Trang Lun', 64)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'Hien Gia', 64)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'A', N'Thinh Dep Trai', 65)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'B', N'bhb', 65)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'C', N'jkbjkb', 65)
INSERT [dbo].[Answer] ([AnsId], [AnsContent], [QuesId]) VALUES (N'D', N'uhbhb', 65)
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (11, N'Which of the following statement is INCORRECT about SERVLET?', N'B ', CAST(N'2020-05-24 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (12, N'Which of statement is CORRECT ?', N'A ', CAST(N'2020-05-24 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (13, N'Which statement is INCORRECT ?', N'C ', CAST(N'2020-05-24 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (14, N'What will container do when a request arrive ?
', N'A ', CAST(N'2020-05-24 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (15, N'Which is NOT TRUE about Servlet Container ?', N'C ', CAST(N'2020-05-24 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (16, N'The container uses the context to:', N'D ', CAST(N'2020-05-24 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (17, N'Which of the following statement is NOT CORRECT about getServletContext() method ?', N'A ', CAST(N'2020-05-24 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (18, N'Which of the statement is INCORRECT about Request Scope ?', N'D ', CAST(N'2020-05-24 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (19, N'What is the longest-lived scope in Web Container ?', N'B ', CAST(N'2020-05-24 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (28, N'SE1402', N'A ', CAST(N'2020-05-27 20:11:45.507' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (36, N'dasdasd', N'D ', CAST(N'2020-05-27 20:27:18.860' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (37, N'Which statement is CORRECT about Cookie?', N'C ', CAST(N'2020-05-27 20:37:43.470' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (38, N'test delete', N'A ', CAST(N'2020-05-29 07:50:49.240' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (39, N' is a sort of pseudofile that can be used to connect to processes', N'B ', CAST(N'2020-05-29 15:38:50.897' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (40, N'Which is the difference between personal computers and mainframe computers?', N'D ', CAST(N'2020-05-29 15:43:53.607' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (41, N'What is not a main function of an operating system?', N'C ', CAST(N'2020-05-29 15:44:33.543' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (42, N'MS-DOS is a example of', N'A ', CAST(N'2020-05-29 15:45:05.450' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (43, N'What is the main characteristic of embedded operating system?', N'D ', CAST(N'2020-05-29 15:45:57.047' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (44, N'Which of the following statements is incorrect about user mode and kernel mode?', N'D ', CAST(N'2020-05-29 15:46:29.797' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (45, N'A time-sharing system is', N'B ', CAST(N'2020-05-29 15:47:01.857' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (46, N'Which of these statements about Microkernel are true?', N'A ', CAST(N'2020-05-29 15:47:39.547' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (47, N'Which of these statements about Microkernel are not true?', N'D ', CAST(N'2020-05-29 15:48:31.343' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (48, N'The layers in Layered System are', N'A ', CAST(N'2020-05-29 15:49:16.640' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (49, N'Which of these statements about the advantages of Virtual Machines are true ?', N'A ', CAST(N'2020-05-29 15:49:55.750' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (50, N'Which type of OS structure does give each user a subset of the resource instead of exact copying entire of underlying real machine ?', N'D ', CAST(N'2020-05-29 15:50:44.007' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (51, N'The OS is written as a collection of procedures, linked together into a single large executable binary program. Which OS structure is described ?', N'A ', CAST(N'2020-05-29 15:51:21.643' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (52, N'The shell is ', N'A ', CAST(N'2020-05-29 15:52:11.593' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (53, N'The _______ is a file that contains a list of shell command be executed in order', N'A ', CAST(N'2020-05-29 15:52:51.097' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (54, N'What is the mechanism? 1. The mechanism ensures that all access to system resources is controlled 2. The mechanism detects latent errors at the interface between component subsystems 3. The mechanism protects the system from unwanted intruders', N'A ', CAST(N'2020-05-29 15:53:45.247' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (55, N'dsdsd', N'A ', CAST(N'2020-05-29 16:01:27.340' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (56, N'tesst Scope', N'D ', CAST(N'2020-05-29 16:21:30.970' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (57, N'TESST', N'C ', CAST(N'2020-05-29 16:24:06.350' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (58, N'SE1402', N'A ', CAST(N'2020-05-29 16:27:44.987' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (59, N'test', N'B ', CAST(N'2020-05-29 16:51:19.350' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (60, N'Which of these statements about Monolithic Systems are true?', N'A ', CAST(N'2020-05-29 17:10:14.853' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (61, N'_________ is a small computer that fits in a shirt pocket and performs a small number of functions, such as an electronic address book and memo pad', N'D ', CAST(N'2020-05-29 17:13:05.413' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (62, N'nhuuuuucuteeee', N'C ', CAST(N'2020-05-29 18:00:04.340' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (63, N'tesst result', N'C ', CAST(N'2020-05-29 18:03:44.547' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (64, N'Thinh Tu', N'A ', CAST(N'2020-05-29 21:54:54.480' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (65, N'Nhu Om', N'A ', CAST(N'2020-05-29 21:55:44.430' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (66, N'beby love', N'A ', CAST(N'2020-05-29 22:01:34.817' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (67, N'thinh dep trai', N'D ', CAST(N'2020-05-29 22:05:11.843' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (68, N'nhu dep gai', N'A ', CAST(N'2020-05-31 10:52:37.757' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (69, N'C201', N'A ', CAST(N'2020-05-31 21:59:32.537' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (70, N'C211', N'D ', CAST(N'2020-05-31 22:04:40.643' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (71, N'The term multiprogramming means', N'B ', CAST(N'2020-06-02 11:00:41.707' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (72, N'Linux and __________ are often used as operating systems on supercomputers, mainframes, and servers.', N'C ', CAST(N'2020-06-02 11:01:17.070' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (73, N'Which of the following is an Operating System component?', N'A ', CAST(N'2020-06-02 11:02:35.127' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (74, N'What is the Operating Systemâ??s mission?', N'D ', CAST(N'2020-06-02 11:03:08.087' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (75, N'Which Operating System is described that it is tailored for the specific applications?', N'A ', CAST(N'2020-06-02 11:03:42.677' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (76, N'Which particular Operating System does not implement the â??Process hierarchiesâ? concepts?', N'A ', CAST(N'2020-06-02 11:04:15.557' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (77, N'Which special file does the Operating System concept make a standard object in progress and application development?', N'D ', CAST(N'2020-06-02 11:05:00.563' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (78, N'Which object is used when a client communicates to a server?', N'A ', CAST(N'2020-06-02 11:05:34.237' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (79, N'____ offers 2 types: hard and soft system', N'A ', CAST(N'2020-06-02 11:06:08.490' AS DateTime), 3, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (80, N'GDFGDF', N'A ', CAST(N'2020-06-02 11:06:54.160' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (81, N'A _________ that acts as an intermediary between user of a computer and the computer hardware', N'A ', CAST(N'2020-06-02 11:07:30.487' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (82, N'I am ----------', N'A ', CAST(N'2020-06-02 11:07:57.997' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (83, N'Teacher is----------', N'D ', CAST(N'2020-06-02 11:09:16.267' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (84, N'nhgnfg', N'C ', CAST(N'2020-06-02 11:09:35.113' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (85, N'gdfgfdh', N'D ', CAST(N'2020-06-02 11:10:20.777' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (86, N'What are the differences between System Calls and System Programs?', N'C ', CAST(N'2020-06-02 11:10:56.643' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (87, N'Which Operating System structure is applied to Symbian?', N'A ', CAST(N'2020-06-02 11:12:16.343' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (88, N'Assume that jobs A-D arrive in the ready queue in quick succession and have the CPU cycle requirements listed below. Using the Shortest Remaining Time Next algorithm, the average waiting time is ____. Arrival time: 0 1 2 3 Job: A B C D CPU cycle: 6 3 1 4', N'A ', CAST(N'2020-06-02 11:12:38.137' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (89, N'Which of the following process state transitions are illegal?', N'A ', CAST(N'2020-06-02 11:13:22.337' AS DateTime), 2, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (90, N'Assume that jobs A-D arrive in the ready queue in quick succession and have the CPU cycle requirements listed below. Using the Shortest Remaining Time Next algorithm, the Turnaround time of job D is ____. Arrival time: 0 1 2 3 Job: A B C D CPU cycle: 6 3 1 4', N'A ', CAST(N'2020-06-02 11:13:51.320' AS DateTime), 1, 1)
INSERT [dbo].[Questions] ([QuestionId], [QContent], [CorrectAnswerId], [DateOfCreate], [SubId], [StatusId]) VALUES (91, N'Assume that jobs A-D arrive in the ready queue in quick succession and have the CPU cycle requirements listed below. Using the Shortest Remaining Time Next algorithm, the Waiting time of job A is ____. Arrival time: 0 1 2 3 Job: A B C D CPU cycle: 6 3 1 4', N'A ', CAST(N'2020-06-02 11:14:55.527' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[Questions] OFF
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (0, N'Student')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (1, N'Activee')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (2, N'Inactive')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (3, N'New')
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([SubId], [SubName], [NumOfQuestions], [Time]) VALUES (1, N'PRJ321', 10, 30)
INSERT [dbo].[Subjects] ([SubId], [SubName], [NumOfQuestions], [Time]) VALUES (2, N'PRJ311', 10, 30)
INSERT [dbo].[Subjects] ([SubId], [SubName], [NumOfQuestions], [Time]) VALUES (3, N'OSG', 10, 20)
SET IDENTITY_INSERT [dbo].[Subjects] OFF
SET IDENTITY_INSERT [dbo].[TestQuestions] ON 

INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (1, 1, 58, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (2, 1, 18, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (3, 1, 16, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (4, 1, 19, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (5, 1, 36, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (6, 1, 38, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (7, 1, 11, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (8, 1, 37, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (9, 1, 67, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (10, 1, 62, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (11, 2, 62, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (12, 2, 38, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (13, 2, 67, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (14, 2, 11, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (15, 2, 14, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (16, 2, 43, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (17, 2, 37, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (18, 2, 18, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (19, 2, 55, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (20, 2, 68, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (21, 3, 69, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (22, 3, 57, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (23, 3, 53, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (24, 3, 65, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (25, 3, 56, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (26, 3, 52, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (27, 3, 66, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (28, 3, 63, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (29, 3, 64, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (30, 3, 70, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (31, 4, 61, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (32, 4, 42, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (33, 4, 41, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (34, 4, 45, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (35, 4, 60, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (36, 4, 39, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (37, 4, 47, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (38, 4, 46, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (39, 4, 49, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (40, 4, 51, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (41, 5, 13, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (42, 5, 62, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (43, 5, 43, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (44, 5, 12, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (45, 5, 28, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (46, 5, 18, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (47, 5, 67, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (48, 5, 55, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (49, 5, 15, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (50, 5, 58, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (51, 6, 44, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (52, 6, 46, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (53, 6, 49, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (54, 6, 51, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (55, 6, 40, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (56, 6, 39, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (57, 6, 42, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (58, 6, 47, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (59, 6, 41, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (60, 6, 48, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (61, 7, 14, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (62, 7, 36, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (63, 7, 15, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (64, 7, 11, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (65, 7, 55, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (66, 7, 59, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (67, 7, 67, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (68, 7, 19, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (69, 7, 62, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (70, 7, 13, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (71, 8, 18, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (72, 8, 38, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (73, 8, 19, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (74, 8, 37, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (75, 8, 67, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (76, 8, 12, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (77, 8, 58, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (78, 8, 13, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (79, 8, 36, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (80, 8, 68, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (81, 9, 46, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (82, 9, 61, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (83, 9, 39, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (84, 9, 51, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (85, 9, 42, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (86, 9, 41, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (87, 9, 48, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (88, 9, 45, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (89, 9, 49, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (90, 9, 44, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (91, 10, 62, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (92, 10, 59, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (93, 10, 37, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (94, 10, 67, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (95, 10, 14, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (96, 10, 68, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (97, 10, 43, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (98, 10, 15, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (99, 10, 19, N'B')
GO
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (100, 10, 28, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (101, 11, 63, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (102, 11, 66, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (103, 11, 70, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (104, 11, 69, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (105, 11, 64, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (106, 11, 56, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (107, 11, 53, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (108, 11, 54, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (109, 11, 57, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (110, 11, 65, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (111, 12, 42, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (112, 12, 48, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (113, 12, 46, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (114, 12, 60, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (115, 12, 61, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (116, 12, 44, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (117, 12, 50, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (118, 12, 51, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (119, 12, 47, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (120, 12, 49, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (121, 13, 55, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (122, 13, 38, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (123, 13, 58, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (124, 13, 13, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (125, 13, 43, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (126, 13, 37, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (127, 13, 36, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (128, 13, 67, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (129, 13, 90, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (130, 13, 59, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (131, 14, 58, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (132, 14, 28, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (133, 14, 17, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (134, 14, 59, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (135, 14, 81, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (136, 14, 16, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (137, 14, 38, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (138, 14, 37, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (139, 14, 18, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (140, 14, 43, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (141, 15, 63, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (142, 15, 69, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (143, 15, 85, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (144, 15, 86, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (145, 15, 65, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (146, 15, 53, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (147, 15, 87, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (148, 15, 88, N'C')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (149, 15, 52, N'A')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (150, 15, 56, N'D')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (151, 16, 28, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (152, 16, 59, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (153, 16, 62, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (154, 16, 68, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (155, 16, 67, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (156, 16, 81, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (157, 16, 18, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (158, 16, 55, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (159, 16, 17, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (160, 16, 11, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (161, 17, 15, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (162, 17, 36, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (163, 17, 58, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (164, 17, 38, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (165, 17, 59, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (166, 17, 55, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (167, 17, 18, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (168, 17, 68, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (169, 17, 13, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (170, 17, 16, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (171, 18, 14, N'B')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (172, 18, 17, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (173, 18, 67, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (174, 18, 15, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (175, 18, 37, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (176, 18, 16, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (177, 18, 90, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (178, 18, 55, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (179, 18, 18, N'')
INSERT [dbo].[TestQuestions] ([TestQuesId], [TestId], [QuesId], [AnsId]) VALUES (180, 18, 11, N'')
SET IDENTITY_INSERT [dbo].[TestQuestions] OFF
SET IDENTITY_INSERT [dbo].[Tests] ON 

INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (1, CAST(N'2020-06-01 16:39:03.153' AS DateTime), 3, N'PRJ321', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (2, CAST(N'2020-06-01 16:41:57.590' AS DateTime), 0, N'PRJ321', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (3, CAST(N'2020-06-01 16:46:37.410' AS DateTime), 5, N'PRJ311', N'nhuhmsa13009@fpt.edu.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (4, CAST(N'2020-06-01 16:48:12.077' AS DateTime), 2, N'OSG', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (5, CAST(N'2020-06-01 16:51:27.827' AS DateTime), 0, N'PRJ321', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (6, CAST(N'2020-06-01 16:53:45.590' AS DateTime), 1, N'OSG', N'nhuhmsa13009@fpt.edu.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (7, CAST(N'2020-06-01 16:55:17.657' AS DateTime), 0, N'PRJ321', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (8, CAST(N'2020-06-01 16:56:21.150' AS DateTime), 0, N'PRJ321', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (9, CAST(N'2020-06-01 17:00:27.203' AS DateTime), 0, N'OSG', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (10, CAST(N'2020-06-02 07:24:40.130' AS DateTime), 6, N'PRJ321', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (11, CAST(N'2020-06-02 07:25:42.320' AS DateTime), 2, N'PRJ311', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (12, CAST(N'2020-06-02 07:33:34.567' AS DateTime), 0, N'OSG', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (13, CAST(N'2020-06-02 11:25:32.110' AS DateTime), 3, N'PRJ321', N'nhatquang@fpt.com')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (14, CAST(N'2020-06-02 11:56:44.803' AS DateTime), 2, N'PRJ321', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (15, CAST(N'2020-06-02 12:31:40.763' AS DateTime), 4, N'PRJ311', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (16, CAST(N'2020-06-02 14:59:47.127' AS DateTime), 0, N'PRJ321', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (17, CAST(N'2020-06-02 15:00:58.947' AS DateTime), 0, N'PRJ321', N'quynhtrang@fpt.com.vn')
INSERT [dbo].[Tests] ([TestId], [CreateDate], [Marks], [SubjectName], [Email]) VALUES (18, CAST(N'2020-06-02 15:01:20.593' AS DateTime), 0, N'PRJ321', N'quynhtrang@fpt.com.vn')
SET IDENTITY_INSERT [dbo].[Tests] OFF
INSERT [dbo].[Users] ([Email], [Fullname], [Password], [RoleId], [StatusId]) VALUES (N'ducthinh55@fpt.edu.vn', N'Le Duc Thinh', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, 1)
INSERT [dbo].[Users] ([Email], [Fullname], [Password], [RoleId], [StatusId]) VALUES (N'minhnhu@gmail.com', N'Nhu Quynh', N'0f8ef3377b30fc47f96b48247f463a726a802f62f3faa03d56403751d2f66c67', 0, 1)
INSERT [dbo].[Users] ([Email], [Fullname], [Password], [RoleId], [StatusId]) VALUES (N'nhatquang@fpt.com', N'Hua Nhat Quang', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1)
INSERT [dbo].[Users] ([Email], [Fullname], [Password], [RoleId], [StatusId]) VALUES (N'nhu123@gmail.com', N'Nhu Cue Hot Me', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, 1)
INSERT [dbo].[Users] ([Email], [Fullname], [Password], [RoleId], [StatusId]) VALUES (N'nhuhmsa13009@fpt.edu.vn', N'Ho Minh Nhu', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1)
INSERT [dbo].[Users] ([Email], [Fullname], [Password], [RoleId], [StatusId]) VALUES (N'nhunnqse140857@fpt.edu.vn', N'Nguyen Ngoc Quynh Nhu', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, 1)
INSERT [dbo].[Users] ([Email], [Fullname], [Password], [RoleId], [StatusId]) VALUES (N'quynhtrang@fpt.com.vn', N'Cao Quynh Trang', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1)
INSERT [dbo].[Users] ([Email], [Fullname], [Password], [RoleId], [StatusId]) VALUES (N'ximuoi@gmail.com', N'Xi Muoi', N'0a2d643bfd24a028cd236e76575d828424ccffbfa47392bd09d8ca9dc85e2f8d', 0, 1)
INSERT [dbo].[Users] ([Email], [Fullname], [Password], [RoleId], [StatusId]) VALUES (N'ximuoi125@gmail.com', N'Nguyen Thi Xi Muoi', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1)
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Questions] FOREIGN KEY([QuesId])
REFERENCES [dbo].[Questions] ([QuestionId])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Questions]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Status]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Subjects] FOREIGN KEY([SubId])
REFERENCES [dbo].[Subjects] ([SubId])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Subjects]
GO
ALTER TABLE [dbo].[TestQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TestQuestions_Questions] FOREIGN KEY([QuesId])
REFERENCES [dbo].[Questions] ([QuestionId])
GO
ALTER TABLE [dbo].[TestQuestions] CHECK CONSTRAINT [FK_TestQuestions_Questions]
GO
ALTER TABLE [dbo].[TestQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TestQuestions_Tests] FOREIGN KEY([TestId])
REFERENCES [dbo].[Tests] ([TestId])
GO
ALTER TABLE [dbo].[TestQuestions] CHECK CONSTRAINT [FK_TestQuestions_Tests]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Status]
GO
