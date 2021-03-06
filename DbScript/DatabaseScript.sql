USE [TravelerMonitoring]
GO
/****** Object:  Table [dbo].[TblAccessLevel]    Script Date: 4/11/2018 10:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblAccessLevel](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[AccessLevel] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblAccessLevel] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblPriority]    Script Date: 4/11/2018 10:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPriority](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[Priority] [nvarchar](50) NULL,
	[PriorityAlphabet] [nvarchar](1) NULL,
 CONSTRAINT [PK_Priority] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblProcess]    Script Date: 4/11/2018 10:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProcess](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[Process] [nvarchar](200) NULL,
 CONSTRAINT [PK_Process] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblStatus]    Script Date: 4/11/2018 10:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblStatus](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblStatus] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblTraveler]    Script Date: 4/11/2018 10:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTraveler](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[TravelerNo] [nvarchar](100) NULL,
	[Priority] [int] NULL,
	[OrderDate] [date] NULL,
	[Status] [int] NULL,
	[JobDescription] [nvarchar](500) NULL,
	[EditedDate] [date] NULL,
	[Finished] [bit] NULL,
 CONSTRAINT [PK_Traveler] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblTravelerProcess]    Script Date: 4/11/2018 10:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTravelerProcess](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[TravelerAutoID] [int] NULL,
	[ProcessAutoID] [int] NULL,
	[DateIn] [date] NULL,
	[DateOut] [date] NULL,
 CONSTRAINT [PK_TblTravelerProcess] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblUserAccessLevel]    Script Date: 4/11/2018 10:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUserAccessLevel](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[AccessLevelID] [int] NULL,
 CONSTRAINT [PK_TblUserAccessLevel] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblUserName]    Script Date: 4/11/2018 10:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUserName](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserName] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[TblAccessLevel] ON 

INSERT [dbo].[TblAccessLevel] ([AutoID], [AccessLevel]) VALUES (1, N'admin')
INSERT [dbo].[TblAccessLevel] ([AutoID], [AccessLevel]) VALUES (2, N'Edit')
INSERT [dbo].[TblAccessLevel] ([AutoID], [AccessLevel]) VALUES (3, N'View')
INSERT [dbo].[TblAccessLevel] ([AutoID], [AccessLevel]) VALUES (4, N'Insert')
SET IDENTITY_INSERT [dbo].[TblAccessLevel] OFF
SET IDENTITY_INSERT [dbo].[TblPriority] ON 

INSERT [dbo].[TblPriority] ([AutoID], [Priority], [PriorityAlphabet]) VALUES (1, N'Normal', N'B')
INSERT [dbo].[TblPriority] ([AutoID], [Priority], [PriorityAlphabet]) VALUES (2, N'Expedite', N'A')
INSERT [dbo].[TblPriority] ([AutoID], [Priority], [PriorityAlphabet]) VALUES (3, N'Rush', N'C')
SET IDENTITY_INSERT [dbo].[TblPriority] OFF
SET IDENTITY_INSERT [dbo].[TblProcess] ON 

INSERT [dbo].[TblProcess] ([AutoID], [Process]) VALUES (1, N'Paint')
INSERT [dbo].[TblProcess] ([AutoID], [Process]) VALUES (2, N'Plating')
INSERT [dbo].[TblProcess] ([AutoID], [Process]) VALUES (3, N'Plating Big Line')
INSERT [dbo].[TblProcess] ([AutoID], [Process]) VALUES (4, N'Sand Blasting')
SET IDENTITY_INSERT [dbo].[TblProcess] OFF
SET IDENTITY_INSERT [dbo].[TblStatus] ON 

INSERT [dbo].[TblStatus] ([AutoID], [Status]) VALUES (1, N'in Queue')
INSERT [dbo].[TblStatus] ([AutoID], [Status]) VALUES (2, N'In Process')
INSERT [dbo].[TblStatus] ([AutoID], [Status]) VALUES (3, N'Need Template')
INSERT [dbo].[TblStatus] ([AutoID], [Status]) VALUES (4, N'R.F.I (Request For Information)')
SET IDENTITY_INSERT [dbo].[TblStatus] OFF
SET IDENTITY_INSERT [dbo].[TblTraveler] ON 

INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (9, N'Traveler-001', 1, CAST(N'2018-01-22' AS Date), 2, N'Traveler-001 Description', NULL, 1)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (10, N'Traveler-002', 1, CAST(N'2018-01-23' AS Date), 1, N'Traveler-002 Description', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (11, N'Traveler-003', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-003', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (12, N'Traveler-004', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-004', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (13, N'Traveler-005', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-005', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (14, N'Traveler-006', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-006', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (15, N'Traveler-007', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-007', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (16, N'Traveler-008', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-008', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (17, N'Traveler-009', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-009', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (18, N'Traveler-010', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-010', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (19, N'Traveler-011', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-011', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (20, N'Traveler-012', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-012', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (21, N'Traveler-013', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-013', NULL, 1)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (22, N'Traveler-014', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-014', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (23, N'Traveler-015', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-015', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (24, N'Traveler-016', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-016', NULL, NULL)
INSERT [dbo].[TblTraveler] ([AutoID], [TravelerNo], [Priority], [OrderDate], [Status], [JobDescription], [EditedDate], [Finished]) VALUES (25, N'Traveler-017', 2, CAST(N'0001-01-01' AS Date), 1, N'Traveler-017', NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblTraveler] OFF
SET IDENTITY_INSERT [dbo].[TblTravelerProcess] ON 

INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (5, 9, 3, CAST(N'2018-01-22' AS Date), CAST(N'2018-04-11' AS Date))
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (6, 10, 4, CAST(N'2018-01-22' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (7, 11, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (8, 12, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (9, 13, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (10, 14, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (11, 15, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (12, 16, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (13, 17, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (14, 18, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (15, 19, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (16, 20, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (17, 21, 1, CAST(N'2018-01-27' AS Date), CAST(N'2018-04-11' AS Date))
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (18, 22, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (19, 23, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (20, 24, 1, CAST(N'2018-01-27' AS Date), NULL)
INSERT [dbo].[TblTravelerProcess] ([AutoID], [TravelerAutoID], [ProcessAutoID], [DateIn], [DateOut]) VALUES (21, 25, 1, CAST(N'2018-01-27' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[TblTravelerProcess] OFF
SET IDENTITY_INSERT [dbo].[TblUserAccessLevel] ON 

INSERT [dbo].[TblUserAccessLevel] ([AutoID], [UserID], [AccessLevelID]) VALUES (5, 1, 1)
INSERT [dbo].[TblUserAccessLevel] ([AutoID], [UserID], [AccessLevelID]) VALUES (6, 1, 2)
INSERT [dbo].[TblUserAccessLevel] ([AutoID], [UserID], [AccessLevelID]) VALUES (7, 1, 3)
INSERT [dbo].[TblUserAccessLevel] ([AutoID], [UserID], [AccessLevelID]) VALUES (8, 1, 4)
SET IDENTITY_INSERT [dbo].[TblUserAccessLevel] OFF
SET IDENTITY_INSERT [dbo].[TblUserName] ON 

INSERT [dbo].[TblUserName] ([AutoID], [UserName], [Password]) VALUES (1, N'reza', N'123')
SET IDENTITY_INSERT [dbo].[TblUserName] OFF
ALTER TABLE [dbo].[TblTraveler] ADD  CONSTRAINT [DF_TblTraveler_Finished]  DEFAULT ((0)) FOR [Finished]
GO
ALTER TABLE [dbo].[TblTraveler]  WITH CHECK ADD  CONSTRAINT [FK_TblTraveler_TblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[TblStatus] ([AutoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblTraveler] CHECK CONSTRAINT [FK_TblTraveler_TblStatus]
GO
ALTER TABLE [dbo].[TblTraveler]  WITH CHECK ADD  CONSTRAINT [FK_Traveler_Priority] FOREIGN KEY([Priority])
REFERENCES [dbo].[TblPriority] ([AutoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblTraveler] CHECK CONSTRAINT [FK_Traveler_Priority]
GO
ALTER TABLE [dbo].[TblTravelerProcess]  WITH CHECK ADD  CONSTRAINT [FK_TblTravelerProcess_TblProcess] FOREIGN KEY([ProcessAutoID])
REFERENCES [dbo].[TblProcess] ([AutoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblTravelerProcess] CHECK CONSTRAINT [FK_TblTravelerProcess_TblProcess]
GO
ALTER TABLE [dbo].[TblTravelerProcess]  WITH CHECK ADD  CONSTRAINT [FK_TblTravelerProcess_TblTraveler] FOREIGN KEY([TravelerAutoID])
REFERENCES [dbo].[TblTraveler] ([AutoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblTravelerProcess] CHECK CONSTRAINT [FK_TblTravelerProcess_TblTraveler]
GO
ALTER TABLE [dbo].[TblUserAccessLevel]  WITH CHECK ADD  CONSTRAINT [FK_TblUserAccessLevel_TblAccessLevel1] FOREIGN KEY([AccessLevelID])
REFERENCES [dbo].[TblAccessLevel] ([AutoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblUserAccessLevel] CHECK CONSTRAINT [FK_TblUserAccessLevel_TblAccessLevel1]
GO
ALTER TABLE [dbo].[TblUserAccessLevel]  WITH CHECK ADD  CONSTRAINT [FK_TblUserAccessLevel_TblUserName1] FOREIGN KEY([UserID])
REFERENCES [dbo].[TblUserName] ([AutoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblUserAccessLevel] CHECK CONSTRAINT [FK_TblUserAccessLevel_TblUserName1]
GO
