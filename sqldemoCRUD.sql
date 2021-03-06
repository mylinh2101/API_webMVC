USE [master]
GO
/****** Object:  Database [demo_CRUD]    Script Date: 3/22/2021 1:23:07 PM ******/
CREATE DATABASE [demo_CRUD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'demo_CRUD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\demo_CRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'demo_CRUD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\demo_CRUD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [demo_CRUD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [demo_CRUD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [demo_CRUD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [demo_CRUD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [demo_CRUD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [demo_CRUD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [demo_CRUD] SET ARITHABORT OFF 
GO
ALTER DATABASE [demo_CRUD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [demo_CRUD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [demo_CRUD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [demo_CRUD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [demo_CRUD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [demo_CRUD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [demo_CRUD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [demo_CRUD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [demo_CRUD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [demo_CRUD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [demo_CRUD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [demo_CRUD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [demo_CRUD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [demo_CRUD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [demo_CRUD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [demo_CRUD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [demo_CRUD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [demo_CRUD] SET RECOVERY FULL 
GO
ALTER DATABASE [demo_CRUD] SET  MULTI_USER 
GO
ALTER DATABASE [demo_CRUD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [demo_CRUD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [demo_CRUD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [demo_CRUD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [demo_CRUD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [demo_CRUD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'demo_CRUD', N'ON'
GO
ALTER DATABASE [demo_CRUD] SET QUERY_STORE = OFF
GO
USE [demo_CRUD]
GO
/****** Object:  Table [dbo].[tbl_employee]    Script Date: 3/22/2021 1:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_employee](
	[Sr_no] [int] IDENTITY(1,1) NOT NULL,
	[Emp_name] [nvarchar](500) NOT NULL,
	[City] [nvarchar](500) NULL,
	[STATE] [nvarchar](500) NULL,
	[Country] [nvarchar](500) NULL,
	[Department] [nvarchar](500) NULL,
	[flag] [nchar](10) NULL,
 CONSTRAINT [PK_tbl_employee] PRIMARY KEY CLUSTERED 
(
	[Sr_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Employee]    Script Date: 3/22/2021 1:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_Employee]
@Sr_no int, @Emp_name nvarchar(500), @City nvarchar(500), @STATE nvarchar(500), 
@Country nvarchar(500), @Department nvarchar(500), @flag nvarchar(50)
	as
	begin
	if(@flag = 'insert')
	begin
		insert into tbl_employee(Emp_name, City, STATE, Country, Department) values
					(@Emp_name, @City, @STATE, @Country, @Department)
	end
	else if(@flag = 'update')
	begin
		update tbl_employee set Emp_name = @Emp_name, City = @City, STATE = @STATE, Country = @Country, Department = @Department
		where Sr_no = @Sr_no

	end
	else if(@flag = 'delete')
	begin
		delete from tbl_employee where Sr_no = @Sr_no
	end
	else if(@flag = 'getid')
	begin
		select * from tbl_employee where Sr_no = @Sr_no
	end
	else if(@flag = 'get')
	begin
		select * from tbl_employee
	end
	end
GO
USE [master]
GO
ALTER DATABASE [demo_CRUD] SET  READ_WRITE 
GO
