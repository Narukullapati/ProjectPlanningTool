
/****** Object:  User [scott]    Script Date: 9/29/2016 10:19:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'scott')
CREATE USER [scott] FOR LOGIN [scott] WITH DEFAULT_SCHEMA=[dbo]
GO


GO
/****** Object:  Table [dbo].[Activity]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Activity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Activity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ObjectID] [int] NOT NULL,
	[ObjectType] [varchar](15) NOT NULL,
	[ActivityDesc] [varchar](100) NULL,
	[ObjectTitle] [varchar](500) NULL,
	[OldState] [varchar](500) NULL,
	[NewState] [varchar](500) NULL,
	[TeamID] [int] NOT NULL,
	[CreatedByID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [varchar](20) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Document]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Document]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Document](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](200) NOT NULL,
	[FileAlias] [nvarchar](100) NOT NULL,
	[ParentID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedByID] [int] NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EmailTemplate]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailTemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmailTemplate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[EmailBody] [nvarchar](max) NOT NULL,
	[EmailSubject] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Issue]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Issue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[DueDate] [datetime] NULL,
	[CategoryID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[PriorityID] [int] NULL,
	[ProjectID] [int] NOT NULL,
	[Location] [varchar](5) NULL,
	[TeamID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedByID] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Issue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IssueMember]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueMember]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IssueMember](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IssueID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[RelationType] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedByID] [int] NOT NULL,
 CONSTRAINT [PK_IssueMember] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NotificationType]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NotificationType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NotificationType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_NotificationType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PasswordResetRequest]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PasswordResetRequest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PasswordResetRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ActivationCode] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PasswordResetRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Priority]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Priority]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Priority](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Code] [varchar](20) NULL,
	[Color] [varchar](15) NULL
 CONSTRAINT [PK_Priority] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Project]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[TeamID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedByID] [int] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Status]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Status]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[StatusGroupId] [int] NULL,
	[Color] [varchar](15) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StatusGroup]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StatusGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_StatusGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Team]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Team]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedById] [int] NOT NULL,
	[IsPublic] [bit] NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TeamMember]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeamMember]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TeamMember](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
	[DefaultProjectID] [int] NULL,
	[CreatedByID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TeamMember] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TeamMemberRequest]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeamMemberRequest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TeamMemberRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [varchar](100) NOT NULL,
	[TeamID] [int] NOT NULL,
	[ActivationCode] [varchar](50) NOT NULL,
	[CreatedByID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TeamMemberRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[JobTitle] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[Avatar] [varchar](100) NULL,
	[DefaultTeamID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserNotificationSubscription]    Script Date: 9/29/2016 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserNotificationSubscription]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserNotificationSubscription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[NotificationTypeID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
	[Subscribed] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserNotificationSubscription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Activity_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[Activity]'))
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Activity_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[Activity]'))
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Team]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Activity_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Activity]'))
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_User] FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Activity_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Activity]'))
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_Issue]') AND parent_object_id = OBJECT_ID(N'[dbo].[Document]'))
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Issue] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Issue] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_Issue]') AND parent_object_id = OBJECT_ID(N'[dbo].[Document]'))
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Issue]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Document]'))
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_User] FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Document_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Document]'))
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Category]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_Priority]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Priority] FOREIGN KEY([PriorityID])
REFERENCES [dbo].[Priority] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_Priority]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Priority]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Project]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Status]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Team]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_User] FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_User1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_User1] FOREIGN KEY([ModifiedByID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Issue_User1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Issue]'))
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_User1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IssueMember_Issue]') AND parent_object_id = OBJECT_ID(N'[dbo].[IssueMember]'))
ALTER TABLE [dbo].[IssueMember]  WITH CHECK ADD  CONSTRAINT [FK_IssueMember_Issue] FOREIGN KEY([IssueID])
REFERENCES [dbo].[Issue] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IssueMember_Issue]') AND parent_object_id = OBJECT_ID(N'[dbo].[IssueMember]'))
ALTER TABLE [dbo].[IssueMember] CHECK CONSTRAINT [FK_IssueMember_Issue]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IssueMember_IssueMember]') AND parent_object_id = OBJECT_ID(N'[dbo].[IssueMember]'))
ALTER TABLE [dbo].[IssueMember]  WITH CHECK ADD  CONSTRAINT [FK_IssueMember_IssueMember] FOREIGN KEY([MemberID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IssueMember_IssueMember]') AND parent_object_id = OBJECT_ID(N'[dbo].[IssueMember]'))
ALTER TABLE [dbo].[IssueMember] CHECK CONSTRAINT [FK_IssueMember_IssueMember]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IssueMember_User_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[IssueMember]'))
ALTER TABLE [dbo].[IssueMember]  WITH CHECK ADD  CONSTRAINT [FK_IssueMember_User_CreatedBy] FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IssueMember_User_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[IssueMember]'))
ALTER TABLE [dbo].[IssueMember] CHECK CONSTRAINT [FK_IssueMember_User_CreatedBy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasswordResetRequest_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasswordResetRequest]'))
ALTER TABLE [dbo].[PasswordResetRequest]  WITH CHECK ADD  CONSTRAINT [FK_PasswordResetRequest_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasswordResetRequest_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasswordResetRequest]'))
ALTER TABLE [dbo].[PasswordResetRequest] CHECK CONSTRAINT [FK_PasswordResetRequest_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Project_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Project]'))
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_User] FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Project_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Project]'))
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Status_StatusGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Status]'))
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_StatusGroup] FOREIGN KEY([StatusGroupId])
REFERENCES [dbo].[StatusGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Status_StatusGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Status]'))
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_StatusGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Team_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Team]'))
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_User] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Team_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Team]'))
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamMember_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamMember]'))
ALTER TABLE [dbo].[TeamMember]  WITH CHECK ADD  CONSTRAINT [FK_TeamMember_CreatedBy] FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamMember_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamMember]'))
ALTER TABLE [dbo].[TeamMember] CHECK CONSTRAINT [FK_TeamMember_CreatedBy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamMember_DefaultProject]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamMember]'))
ALTER TABLE [dbo].[TeamMember]  WITH CHECK ADD  CONSTRAINT [FK_TeamMember_DefaultProject] FOREIGN KEY([DefaultProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamMember_DefaultProject]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamMember]'))
ALTER TABLE [dbo].[TeamMember] CHECK CONSTRAINT [FK_TeamMember_DefaultProject]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamMember_Member]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamMember]'))
ALTER TABLE [dbo].[TeamMember]  WITH CHECK ADD  CONSTRAINT [FK_TeamMember_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamMember_Member]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamMember]'))
ALTER TABLE [dbo].[TeamMember] CHECK CONSTRAINT [FK_TeamMember_Member]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamMember_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamMember]'))
ALTER TABLE [dbo].[TeamMember]  WITH CHECK ADD  CONSTRAINT [FK_TeamMember_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamMember_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamMember]'))
ALTER TABLE [dbo].[TeamMember] CHECK CONSTRAINT [FK_TeamMember_Team]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamMemberRequest_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamMemberRequest]'))
ALTER TABLE [dbo].[TeamMemberRequest]  WITH CHECK ADD  CONSTRAINT [FK_TeamMemberRequest_CreatedBy] FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamMemberRequest_CreatedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamMemberRequest]'))
ALTER TABLE [dbo].[TeamMemberRequest] CHECK CONSTRAINT [FK_TeamMemberRequest_CreatedBy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamMemberRequest_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamMemberRequest]'))
ALTER TABLE [dbo].[TeamMemberRequest]  WITH CHECK ADD  CONSTRAINT [FK_TeamMemberRequest_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TeamMemberRequest_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[TeamMemberRequest]'))
ALTER TABLE [dbo].[TeamMemberRequest] CHECK CONSTRAINT [FK_TeamMemberRequest_Team]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserNotificationSubscription_NotificationType]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserNotificationSubscription]'))
ALTER TABLE [dbo].[UserNotificationSubscription]  WITH CHECK ADD  CONSTRAINT [FK_UserNotificationSubscription_NotificationType] FOREIGN KEY([NotificationTypeID])
REFERENCES [dbo].[NotificationType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserNotificationSubscription_NotificationType]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserNotificationSubscription]'))
ALTER TABLE [dbo].[UserNotificationSubscription] CHECK CONSTRAINT [FK_UserNotificationSubscription_NotificationType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserNotificationSubscription_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserNotificationSubscription]'))
ALTER TABLE [dbo].[UserNotificationSubscription]  WITH CHECK ADD  CONSTRAINT [FK_UserNotificationSubscription_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserNotificationSubscription_Team]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserNotificationSubscription]'))
ALTER TABLE [dbo].[UserNotificationSubscription] CHECK CONSTRAINT [FK_UserNotificationSubscription_Team]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserNotificationSubscription_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserNotificationSubscription]'))
ALTER TABLE [dbo].[UserNotificationSubscription]  WITH CHECK ADD  CONSTRAINT [FK_UserNotificationSubscription_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserNotificationSubscription_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserNotificationSubscription]'))
ALTER TABLE [dbo].[UserNotificationSubscription] CHECK CONSTRAINT [FK_UserNotificationSubscription_User]
GO


------

CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CommentText] [nvarchar](2000) NOT NULL,
	[IssueID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedByID] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[User] ([ID])
GO

ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
