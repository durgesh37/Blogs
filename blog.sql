USE [master]
GO
/****** Object:  Database [article]    Script Date: 4/30/2021 10:34:33 AM ******/
CREATE DATABASE [article]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'article', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER_2014\MSSQL\DATA\article.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'article_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER_2014\MSSQL\DATA\article_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [article] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [article].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [article] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [article] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [article] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [article] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [article] SET ARITHABORT OFF 
GO
ALTER DATABASE [article] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [article] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [article] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [article] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [article] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [article] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [article] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [article] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [article] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [article] SET  ENABLE_BROKER 
GO
ALTER DATABASE [article] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [article] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [article] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [article] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [article] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [article] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [article] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [article] SET RECOVERY FULL 
GO
ALTER DATABASE [article] SET  MULTI_USER 
GO
ALTER DATABASE [article] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [article] SET DB_CHAINING OFF 
GO
ALTER DATABASE [article] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [article] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [article] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'article', N'ON'
GO
USE [article]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 4/30/2021 10:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [varchar](100) NOT NULL,
	[ArticleCategory] [varchar](100) NULL,
	[AuthorId] [varchar](100) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[DatePublished] [datetime] NULL,
	[PageTitle] [text] NULL,
	[PageContent] [text] NULL,
	[IsPublished] [varchar](100) NULL,
	[Description] [varchar](1000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRegistration]    Script Date: 4/30/2021 10:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](100) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[UserType] [varchar](100) NOT NULL,
	[IsActive] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([Id], [ArticleId], [ArticleCategory], [AuthorId], [DateCreated], [DateUpdated], [DatePublished], [PageTitle], [PageContent], [IsPublished], [Description]) VALUES (1, N'News1', N'News', N'1', CAST(N'2021-04-29 00:00:00.000' AS DateTime), CAST(N'2021-04-29 00:00:00.000' AS DateTime), CAST(N'2021-04-29 00:00:00.000' AS DateTime), N'Corona Virus Today''s Cases', N'Coronavirus Daily Cases and Deaths in India, Covid-19 India Lockdown, CoWIN Covid-19 Vaccination Registration April 28 Highlights: India reported 3,60,960 new coronavirus cases, highest single-day spike in the world; death toll crossed two lakh following 3,293 fresh fatalities; 10 states account for over 78% of new Covid-19 deaths; Goa Chief Minister Pramod Sawant announces lockdown from Thursday; Puducherry govt extends Corona restrictions till May 3', N'Yes', N'Testt')
INSERT [dbo].[Articles] ([Id], [ArticleId], [ArticleCategory], [AuthorId], [DateCreated], [DateUpdated], [DatePublished], [PageTitle], [PageContent], [IsPublished], [Description]) VALUES (2, N'News2', N'News', N'1', CAST(N'2021-04-29 00:00:00.000' AS DateTime), CAST(N'2021-04-29 00:00:00.000' AS DateTime), CAST(N'2021-04-29 00:00:00.000' AS DateTime), N'Covid Virus', N'Covid testing in UP', N'Yes', N'Testt')
SET IDENTITY_INSERT [dbo].[Articles] OFF
SET IDENTITY_INSERT [dbo].[UserRegistration] ON 

INSERT [dbo].[UserRegistration] ([Id], [UserId], [UserName], [Password], [UserType], [IsActive]) VALUES (1, N'durgesh3k7', N'Durgesh', N'dk@1234', N'admin', N'yes')
SET IDENTITY_INSERT [dbo].[UserRegistration] OFF
/****** Object:  StoredProcedure [dbo].[spAddArticle]    Script Date: 4/30/2021 10:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spAddArticle]     
(        
	@ArticleId            varchar(100),
	@ArticleCategory	  varchar(100),
	@AuthorId			  varchar(100),
	@DateCreated		  datetime,
	@DateUpdated		  datetime,
	@DatePublished		  datetime,
	@PageTitle			  text,
	@PageContent		  text,
	@IsPublished		  varchar(100),
	@Description		  varchar(100)
  
)        
as         
Begin         
    Insert into Articles (ArticleId     ,
						ArticleCategory	,
						AuthorId		,
						DateCreated		,
						DateUpdated		,
						DatePublished	,
						PageTitle		,
						PageContent		,
						IsPublished		,
						Description		
)
 Values(@ArticleId       ,
		@ArticleCategory ,
		@AuthorId		 ,
		getdate()	 ,
		getdate()	 ,
		getdate()	 ,
		@PageTitle		 ,
		@PageContent	 ,
		@IsPublished	 ,
		@Description	 
)         
End 
GO
/****** Object:  StoredProcedure [dbo].[spDeleteArticle]    Script Date: 4/30/2021 10:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spDeleteArticle]     
(    
	@Id					  int,    
	@ArticleId            varchar(100)
)        
as         
Begin         
    delete from Articles
	where ArticleId=  @ArticleId and Id=@Id
End 
GO
/****** Object:  StoredProcedure [dbo].[spGetArticle]    Script Date: 4/30/2021 10:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetArticle]     
(    
	@Id					  int=null
)        
as         
Begin         
    select * from Articles where Id=@Id or @Id is null
End 
GO
/****** Object:  StoredProcedure [dbo].[spUpdateArticle]    Script Date: 4/30/2021 10:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spUpdateArticle]     
(        
	@ArticleId            varchar(100),
	@ArticleCategory	  varchar(100),
	@AuthorId			  varchar(100),
	@DateCreated		  datetime,
	@DateUpdated		  datetime,
	@DatePublished		  datetime,
	@PageTitle			  text,
	@PageContent		  text,
	@IsPublished		  varchar(100),
	@Description		  varchar(100)
  
)        
as         
Begin         
    update Articles set 
						ArticleCategory = @ArticleCategory	,
						AuthorId = @AuthorId		,
						DateCreated	= getdate()	,
						DateUpdated = getdate()		,
						DatePublished = getdate()		,
						PageTitle = @PageTitle		,
						PageContent	= @PageContent	,
						IsPublished	= @IsPublished	,
						Description	=@Description	  
	where ArticleId=  @ArticleId
End 
GO
USE [master]
GO
ALTER DATABASE [article] SET  READ_WRITE 
GO
