USE [shar_hp]
GO
/****** Object:  Table [dbo].[bmed]    Script Date: 11/18/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bmed](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img] [image] NULL,
	[dat] [date] NULL,
	[loc] [nvarchar](max) NULL,
	[chk] [nvarchar](max) NULL,
	[phn] [nvarchar](max) NULL,
	[idp] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_deg]    Script Date: 11/18/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_deg](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_id] [nvarchar](20) NULL,
	[dg_name] [nvarchar](max) NULL,
	[dg_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[email]    Script Date: 11/18/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idus] [nvarchar](20) NULL,
	[email] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[emlp]    Script Date: 11/18/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emlp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idp] [int] NULL,
	[email] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gtamb]    Script Date: 11/18/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gtamb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loc] [nvarchar](max) NULL,
	[che] [varchar](max) NULL DEFAULT ('no'),
	[dat] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[img]    Script Date: 11/18/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[img](
	[id] [nvarchar](20) NULL,
	[img] [image] NULL,
 CONSTRAINT [UQ__img__3213E83E23315B3A] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[joindp]    Script Date: 11/18/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[joindp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idd] [nvarchar](20) NULL,
	[idp] [int] NULL,
	[dat] [date] NULL,
	[tim] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notf]    Script Date: 11/18/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notf](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idp] [int] NULL,
	[idd] [nvarchar](20) NULL,
	[dat] [date] NULL,
	[tim] [time](7) NULL,
	[msg] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ptb]    Script Date: 11/18/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ptb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[f_n] [nvarchar](max) NULL,
	[l_n] [nvarchar](max) NULL,
	[gender] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[b_date] [date] NULL,
	[pass] [nvarchar](max) NULL,
	[tim] [datetime] NULL,
	[sick] [nvarchar](max) NULL DEFAULT ('no'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stb]    Script Date: 11/18/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idp] [int] NULL,
	[sn] [nvarchar](max) NULL,
	[dat] [date] NULL,
	[tb] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_tb]    Script Date: 11/18/2022 4:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_tb](
	[username] [nvarchar](20) NOT NULL,
	[pass] [nvarchar](max) NULL,
	[auth] [nvarchar](max) NULL,
	[f_n] [nvarchar](max) NULL,
	[l_n] [nvarchar](max) NULL,
	[b_date] [date] NULL,
	[gender] [varchar](max) NULL,
	[ph_num] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[bmed]  WITH CHECK ADD FOREIGN KEY([idp])
REFERENCES [dbo].[ptb] ([id])
GO
ALTER TABLE [dbo].[d_deg]  WITH CHECK ADD FOREIGN KEY([d_id])
REFERENCES [dbo].[user_tb] ([username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[email]  WITH CHECK ADD FOREIGN KEY([idus])
REFERENCES [dbo].[user_tb] ([username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[emlp]  WITH CHECK ADD FOREIGN KEY([idp])
REFERENCES [dbo].[ptb] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[img]  WITH CHECK ADD  CONSTRAINT [FK__img__id__182C9B23] FOREIGN KEY([id])
REFERENCES [dbo].[user_tb] ([username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[img] CHECK CONSTRAINT [FK__img__id__182C9B23]
GO
ALTER TABLE [dbo].[joindp]  WITH CHECK ADD FOREIGN KEY([idd])
REFERENCES [dbo].[user_tb] ([username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[joindp]  WITH CHECK ADD FOREIGN KEY([idp])
REFERENCES [dbo].[ptb] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[notf]  WITH CHECK ADD FOREIGN KEY([idp])
REFERENCES [dbo].[ptb] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[stb]  WITH CHECK ADD FOREIGN KEY([idp])
REFERENCES [dbo].[ptb] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
