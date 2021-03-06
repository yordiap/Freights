USE [FreightsDB]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[dni] [varchar](50) NOT NULL,
	[address] [varchar](80) NOT NULL,
	[logincode] [varchar](50) NOT NULL,
	[licensenumber] [varchar](50) NOT NULL,
	[licensecategory] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incidence]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incidence](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[latitude] [varchar](250) NOT NULL,
	[longitude] [varchar](250) NOT NULL,
	[message] [varchar](300) NOT NULL,
	[orderId] [int] NOT NULL,
 CONSTRAINT [PK_Incidence] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_add_driver]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_add_driver]
(
	
   @name varchar(250),
   @surname varchar(250),
   @dni varchar(250),
   @address varchar(300),   
   @loginCode varchar(300),
   @licenseNumber varchar(300),   
   @licenseCategory varchar(300),
   @status varchar(300),

   @driverId int OUTPUT
)
as
begin
Insert into Driver
([name],surname,dni,[address],logincode,licenseNumber, licenseCategory, [status])
values
(@name,@surname,@dni,@address,@loginCode,@licenseNumber,@licenseCategory,@status)
set @driverId=SCOPE_IDENTITY()
RETURN @driverId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_add_incidence]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_add_incidence]
(
	@date date,
	@latitude varchar(250),
	@longitude varchar(250),
	@message varchar(300),
	@orderId int,
	@incidenceId int OUTPUT
)
as
begin
Insert into Incidence
([date],[latitude],[longitude],[message],[orderId])
values
(@date,@latitude,@longitude,@message,@orderId)
set @incidenceId=SCOPE_IDENTITY()
RETURN @incidenceId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_all_drivers]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_all_drivers]
AS
BEGIN
SELECT id, [name], surname,dni, [address], logincode, licensenumber, licenseCategory, [status]
  FROM Driver
END
GO
/****** Object:  StoredProcedure [dbo].[sp_all_incidences]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_all_incidences]
AS
BEGIN
SELECT id, [date], latitude, longitude, [message], orderId
  FROM Incidence
  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_driver]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_delete_driver]
(
   @driverId int
)
as
begin
 DELETE Driver
 WHERE id=@driverId

end
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_incidence]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_delete_incidence]
(
   @incidenceId int
)
as
begin
 DELETE Incidence
 WHERE id=@incidenceId

end
GO
/****** Object:  StoredProcedure [dbo].[sp_find_driver_id]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_find_driver_id]
(
	@driverId int
)
AS
BEGIN
SELECT id, [name], surname,dni, [address], logincode, licensenumber, licensecategory, [status]
  FROM Driver
  WHERE id = @driverId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_find_incidence_id]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_find_incidence_id]
(
	@incidenceId int
)
AS
BEGIN
SELECT id, [date], latitude, longitude, [message], orderId
  FROM Incidence
  WHERE id = @incidenceId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_find_incidences_order]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_find_incidences_order]
(
	@orderId int
)
AS
BEGIN
SELECT id, [date], latitude, longitude, [message], orderId
  FROM Incidence
  WHERE orderId = @orderId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_login_driver]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_login_driver]
(
	@loginCode int
)
AS
BEGIN
SELECT id, [name], surname,dni, [address], logincode, licensenumber, licensecategory, [status]
  FROM Driver
  WHERE logincode = @loginCode
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_driver]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update_driver]
(
   @driverId int,
   @name varchar(250),
   @surname varchar(250),
   @dni varchar(250),
   @address varchar(300),   
   @loginCode varchar(300),
   @licenseNumber varchar(300),   
   @licenseCategory varchar(300),
   @status varchar(300)
)
as
begin
 UPDATE Driver
   SET [name] = @name
      ,surname =@surname
	  ,dni = @dni
	  ,[address] = @address
	  ,logincode = @loginCode
	  ,licensenumber = @licenseNumber
	  ,licensecategory = @licenseCategory
	  ,[status]  = @status
 WHERE id=@driverId

end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_incidence]    Script Date: 12/7/2017 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update_incidence]
(
   @incidenceId int,
   @date date,
   @latitude varchar(250),
   @longitude varchar(250),
   @message varchar(300),
   @orderId int
)
as
begin
 UPDATE Incidence
   SET [date] = @date
      ,latitude =@latitude
      ,longitude = @longitude
      ,[message] = @message
      ,[orderId] = @orderId
 WHERE id=@incidenceId

end
GO
