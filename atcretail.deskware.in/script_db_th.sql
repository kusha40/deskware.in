
/****** Object:  StoredProcedure [dbo].[user_mstr]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[user_mstr]
@user_id nvarchar(max),@name nvarchar(max),@contact_no nvarchar(max), @email_id nvarchar(max) ,@password nvarchar(max),@type nvarchar(max),@status nvarchar(max), @created_by nvarchar(max),@operation nvarchar(max),@action char(1)
AS
BEGIN
DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;set @date=(SELECT (@d + CAST(@t AS datetime))) 
--  If Insert
if(@action='I')
	begin	
	if not exists (select * from user_master where user_id =@user_id  )
	begin

 	insert into user_master(user_id,name,contact_no,email_id,password,type,status,date,created_by,operation) values(@user_id,@name,@contact_no,@email_id,@password,@type,@status,@date,@created_by,@operation)
	  return 1
	end 

	else

	begin
	return 2

	end
	end 

--  Else Update 
	else if(@action='U')
	begin
	update user_master set name=@name,contact_no=@contact_no,email_id=@email_id,password=@password,type=@type,status=@status,date=@date,operation=@operation where user_id=@user_id
	end 

--  Else Delete
	else if(@action='D')
	begin
	delete user_master where user_id=@user_id
	end 
--  Else status
else if(@action='S')
	begin
	update user_master set status='Inactive'  where user_id=@user_id
	end 
END


















GO
/****** Object:  Table [dbo].[tbl_cash_ledger_master]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cash_ledger_master](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[dealer_name] [nvarchar](max) NULL,
	[dealer_id] [bigint] NULL,
	[debit] [money] NULL,
	[credit] [money] NULL,
	[date] [datetime] NULL,
	[challan_no] [bigint] NULL,
	[remarks] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_challan_details_master]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_challan_details_master](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[challan_no] [bigint] NULL,
	[date] [datetime] NULL,
	[dealer_name] [nvarchar](max) NULL,
	[dealer_id] [bigint] NULL,
	[dealer_area] [nvarchar](max) NULL,
	[qty] [float] NULL,
	[unit] [nvarchar](max) NULL,
	[size] [nvarchar](max) NULL,
	[c_name] [nvarchar](max) NULL,
	[p_code] [nvarchar](max) NULL,
	[mrp] [money] NULL,
	[amount] [money] NULL,
	[totlamount] [money] NULL,
	[fraight] [money] NULL,
	[netamount] [money] NULL,
	[inwords] [nvarchar](max) NULL,
	[created_by] [nvarchar](max) NULL,
	[p_grade] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[type] [nvarchar](max) NULL,
	[labour] [money] NULL,
	[paid] [money] NULL,
	[balance] [money] NULL,
	[address] [nvarchar](max) NULL,
	[mob] [nvarchar](max) NULL,
	[remarks] [nvarchar](max) NULL,
	[mchk] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_checking_expense_head]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_checking_expense_head](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_comp_product_pricing]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_comp_product_pricing](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](max) NULL,
	[size] [nvarchar](max) NULL,
	[price] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_comp_return_challan_details]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_comp_return_challan_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[challan_no] [bigint] NULL,
	[cname] [nvarchar](max) NULL,
	[size] [nvarchar](max) NULL,
	[qty] [bigint] NULL,
	[pcode] [nvarchar](max) NULL,
	[unit] [nvarchar](max) NULL,
	[rate] [money] NULL,
	[amount] [money] NULL,
	[totalamount] [money] NULL,
	[date] [datetime] NULL,
	[created_by] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_comp_return_challan_details_other]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_comp_return_challan_details_other](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[challan_no] [bigint] NULL,
	[cname] [nvarchar](max) NULL,
	[size] [nvarchar](max) NULL,
	[qty] [bigint] NULL,
	[pcode] [nvarchar](max) NULL,
	[unit] [nvarchar](max) NULL,
	[rate] [money] NULL,
	[amount] [money] NULL,
	[totalamount] [money] NULL,
	[date] [datetime] NULL,
	[created_by] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_company_ledger_master]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_company_ledger_master](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[c_name] [nvarchar](max) NULL,
	[debit] [money] NULL,
	[credit] [money] NULL,
	[date] [datetime] NULL,
	[stock_id] [bigint] NULL,
	[remarks] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_company_ledger_master_other]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_company_ledger_master_other](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[c_name] [nvarchar](max) NULL,
	[debit] [money] NULL,
	[credit] [money] NULL,
	[date] [datetime] NULL,
	[stock_id] [bigint] NULL,
	[remarks] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_company_master]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_company_master](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[mob_no] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[remarks] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dealer_ledger_master]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dealer_ledger_master](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[dealer_name] [nvarchar](max) NULL,
	[dealer_id] [bigint] NULL,
	[debit] [money] NULL,
	[credit] [money] NULL,
	[date] [datetime] NULL,
	[challan_no] [bigint] NULL,
	[remarks] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dealer_Master]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dealer_Master](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[mob_no] [nvarchar](max) NULL,
	[area] [nvarchar](max) NULL,
	[week] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dealer_product_pricing]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dealer_product_pricing](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[dealer_id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[size] [nvarchar](max) NULL,
	[c_name] [nvarchar](max) NULL,
	[p_type] [nvarchar](max) NULL,
	[price] [money] NULL,
	[unit] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dealer_salesman_minimum_pricing]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dealer_salesman_minimum_pricing](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[dealer_name] [nvarchar](max) NULL,
	[dealer_id] [bigint] NULL,
	[size] [nvarchar](max) NULL,
	[c_name] [nvarchar](max) NULL,
	[d_price] [money] NULL,
	[s_price] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_expense_head]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_expense_head](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_other_item_master]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_other_item_master](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[code] [nvarchar](max) NULL,
	[cname] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_permission_expense_head]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_permission_expense_head](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_product_master]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product_master](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[size] [nvarchar](max) NULL,
	[c_name] [nvarchar](max) NULL,
	[p_type] [nvarchar](max) NULL,
	[p_code] [nvarchar](max) NULL,
	[unit] [nvarchar](max) NULL,
	[min_stock] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_size_master]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_size_master](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[size] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_stock_master]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_stock_master](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[size] [nvarchar](max) NULL,
	[c_name] [nvarchar](max) NULL,
	[p_type] [nvarchar](max) NULL,
	[qty] [float] NULL,
	[p_code] [nvarchar](max) NULL,
	[date] [datetime] NULL,
	[remarks] [nvarchar](max) NULL,
	[unit] [nvarchar](max) NULL,
	[stock_id] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_stock_master_other]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_stock_master_other](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[size] [nvarchar](max) NULL,
	[c_name] [nvarchar](max) NULL,
	[p_type] [nvarchar](max) NULL,
	[qty] [float] NULL,
	[p_code] [nvarchar](max) NULL,
	[date] [datetime] NULL,
	[remarks] [nvarchar](max) NULL,
	[unit] [nvarchar](max) NULL,
	[stock_id] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_stock_qty_master]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_stock_qty_master](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[size] [nvarchar](max) NULL,
	[c_name] [nvarchar](max) NULL,
	[p_code] [nvarchar](max) NULL,
	[qty] [float] NULL,
	[p_grade] [nvarchar](max) NULL,
	[unit] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_stock_qty_master_other]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_stock_qty_master_other](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[size] [nvarchar](max) NULL,
	[c_name] [nvarchar](max) NULL,
	[p_code] [nvarchar](max) NULL,
	[qty] [float] NULL,
	[p_grade] [nvarchar](max) NULL,
	[unit] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_master]    Script Date: 06/22/2017 1:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_master](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[contact_no] [nvarchar](max) NULL,
	[email_id] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[type] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[date] [datetime] NULL,
	[created_by] [nvarchar](max) NULL,
	[operation] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_cash_ledger_master] ON 

GO
INSERT [dbo].[tbl_cash_ledger_master] ([id], [dealer_name], [dealer_id], [debit], [credit], [date], [challan_no], [remarks]) VALUES (3, N'naveen bansal', 2, 0.0000, 9975.0000, CAST(0x0000A72E00000000 AS DateTime), 3, N'Cash')
GO
INSERT [dbo].[tbl_cash_ledger_master] ([id], [dealer_name], [dealer_id], [debit], [credit], [date], [challan_no], [remarks]) VALUES (2, N'naveen bansal', 2, 0.0000, 1100.0000, CAST(0x0000A72600000000 AS DateTime), 2, N'Cash')
GO
INSERT [dbo].[tbl_cash_ledger_master] ([id], [dealer_name], [dealer_id], [debit], [credit], [date], [challan_no], [remarks]) VALUES (4, N'naveen bansal', 2, 0.0000, 730.0000, CAST(0x0000A72E00000000 AS DateTime), 4, N'Cash')
GO
INSERT [dbo].[tbl_cash_ledger_master] ([id], [dealer_name], [dealer_id], [debit], [credit], [date], [challan_no], [remarks]) VALUES (5, N'naveen bansal', 2, 0.0000, 0.0000, CAST(0x0000A72E00000000 AS DateTime), 4, N'Cash')
GO
INSERT [dbo].[tbl_cash_ledger_master] ([id], [dealer_name], [dealer_id], [debit], [credit], [date], [challan_no], [remarks]) VALUES (6, N'naveen bansal', 2, 0.0000, 0.0000, CAST(0x0000A72E00000000 AS DateTime), 4, N'Balance Given')
GO
INSERT [dbo].[tbl_cash_ledger_master] ([id], [dealer_name], [dealer_id], [debit], [credit], [date], [challan_no], [remarks]) VALUES (7, N'Cash', 99999, 0.0000, 2000.0000, CAST(0x0000A73000000000 AS DateTime), 5, N'Cash')
GO
INSERT [dbo].[tbl_cash_ledger_master] ([id], [dealer_name], [dealer_id], [debit], [credit], [date], [challan_no], [remarks]) VALUES (8, N'Cash', 99999, 0.0000, 750.0000, CAST(0x0000A73000000000 AS DateTime), 5, N'Cash')
GO
INSERT [dbo].[tbl_cash_ledger_master] ([id], [dealer_name], [dealer_id], [debit], [credit], [date], [challan_no], [remarks]) VALUES (9, N'Cash', 99999, 0.0000, 15000.0000, CAST(0x0000A73000000000 AS DateTime), 6, N'Cash')
GO
INSERT [dbo].[tbl_cash_ledger_master] ([id], [dealer_name], [dealer_id], [debit], [credit], [date], [challan_no], [remarks]) VALUES (10, N'Cash', 99999, 0.0000, 750.0000, CAST(0x0000A73000000000 AS DateTime), 6, N'Cash')
GO
INSERT [dbo].[tbl_cash_ledger_master] ([id], [dealer_name], [dealer_id], [debit], [credit], [date], [challan_no], [remarks]) VALUES (11, N'Cash', 99999, 0.0000, 5000.0000, CAST(0x0000A73000000000 AS DateTime), 6, N'Cash')
GO
SET IDENTITY_INSERT [dbo].[tbl_cash_ledger_master] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_challan_details_master] ON 

GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (1, 1, CAST(0x0000A72400000000 AS DateTime), N'Tilehub', 1, N'', 15, N'Box', N'12x18', N'Allient', N'P101', 160.0000, 2400.0000, 2400.0000, 400.0000, 2900.0000, N'Indian Rupees Two Thousand Nine Hundred  Only', N'admin', N'Premium', N'', N'FI', 100.0000, 2900.0000, 0.0000, N'', N'', N'', N'1')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (2, 2, CAST(0x0000A72600000000 AS DateTime), N'naveen bansal', 2, N'', 4, N'Box', N'12*18', N'gng', N'18102-l', 210.0000, 840.0000, 6030.0000, 50.0000, 6100.0000, N'Indian Rupees Six Thousand One Hundred  Only', N'admin', N'Premium', N'', N'FI', 20.0000, 1100.0000, 5000.0000, N'', N'', N'', N'0')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (3, 2, CAST(0x0000A72600000000 AS DateTime), N'naveen bansal', 2, N'', 8, N'Box', N'12*18', N'gng', N'18102-d', 210.0000, 1680.0000, 6030.0000, 50.0000, 6100.0000, N'Indian Rupees Six Thousand One Hundred  Only', N'admin', N'Premium', N'', N'FI', 20.0000, 1100.0000, 5000.0000, N'', N'', N'', N'1')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (4, 2, CAST(0x0000A72600000000 AS DateTime), N'naveen bansal', 2, N'', 8, N'Box', N'12*18', N'tilehub', N'1002-l', 195.0000, 1560.0000, 6030.0000, 50.0000, 6100.0000, N'Indian Rupees Six Thousand One Hundred  Only', N'admin', N'Premium', N'', N'FI', 20.0000, 1100.0000, 5000.0000, N'', N'', N'', N'1')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (5, 2, CAST(0x0000A72600000000 AS DateTime), N'naveen bansal', 2, N'', 10, N'Box', N'12*18', N'tilehub', N'1002-d', 195.0000, 1950.0000, 6030.0000, 50.0000, 6100.0000, N'Indian Rupees Six Thousand One Hundred  Only', N'admin', N'Premium', N'', N'FI', 20.0000, 1100.0000, 5000.0000, N'', N'', N'', N'0')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (6, 3, CAST(0x0000A72E00000000 AS DateTime), N'naveen bansal', 2, N'', 50, N'Box', N'12*18', N'gng', N'1002-d', 210.0000, 10500.0000, 19275.0000, 500.0000, 19975.0000, N'Indian Rupees Nineteen Thousand Nine Hundred and Seventy Five  Only', N'admin', N'Premium', N'', N'FI', 200.0000, 9975.0000, 10000.0000, N'', N'', N'', N'0')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (7, 3, CAST(0x0000A72E00000000 AS DateTime), N'naveen bansal', 2, N'', 20, N'Box', N'12*18', N'tilehub', N'18102-l', 195.0000, 3900.0000, 19275.0000, 500.0000, 19975.0000, N'Indian Rupees Nineteen Thousand Nine Hundred and Seventy Five  Only', N'admin', N'Premium', N'', N'FI', 200.0000, 9975.0000, 10000.0000, N'', N'', N'', N'1')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (8, 3, CAST(0x0000A72E00000000 AS DateTime), N'naveen bansal', 2, N'', 25, N'Box', N'12*18', N'tilehub', N'18102-d', 195.0000, 4875.0000, 19275.0000, 500.0000, 19975.0000, N'Indian Rupees Nineteen Thousand Nine Hundred and Seventy Five  Only', N'admin', N'Premium', N'', N'FI', 200.0000, 9975.0000, 10000.0000, N'', N'', N'', N'1')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (9, 4, CAST(0x0000A72E00000000 AS DateTime), N'naveen bansal', 2, N'', 15, N'Box', N'12*18', N'gng', N'1002-l', 210.0000, 3150.0000, 3150.0000, 0.0000, 3150.0000, N'Indian Rupees Three Thousand One Hundred and Fifty  Only', N'admin', N'Premium', N'', N'FI', 0.0000, 730.0000, 2420.0000, N'', N'', N'', N'1')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (13, 6, CAST(0x0000A73000000000 AS DateTime), N'Cash', 99999, N'Cash', 20, N'Box', N'12*18', N'gng', N'1002-d', 250.0000, 5000.0000, 20000.0000, 800.0000, 20950.0000, N'Indian Rupees Twenty Thousand Nine Hundred and Fifty  Only', N'admin', N'Premium', N'', N'FI', 150.0000, 20750.0000, 200.0000, N'', N'', N'', N'1')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (12, 5, CAST(0x0000A73000000000 AS DateTime), N'Cash', 99999, N'Cash', 10, N'Box', N'12*18', N'gng', N'18102-l', 250.0000, 2500.0000, 2500.0000, 200.0000, 2750.0000, N'Indian Rupees Two Thousand Seven Hundred and Fifty  Only', N'admin', N'Premium', N'', N'FI', 50.0000, 2750.0000, 0.0000, N'', N'', N'', N'1')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (14, 6, CAST(0x0000A73000000000 AS DateTime), N'Cash', 99999, N'Cash', 50, N'Box', N'12*18', N'gng', N'18102-l', 300.0000, 15000.0000, 20000.0000, 800.0000, 20950.0000, N'Indian Rupees Twenty Thousand Nine Hundred and Fifty  Only', N'admin', N'Premium', N'', N'FI', 150.0000, 20750.0000, 200.0000, N'', N'', N'', N'1')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (16, 7, CAST(0x0000A75700000000 AS DateTime), N'Cash', 99999, N'Cash', 7, N'Box', N'12*18', N'MTH', N'1717 A', 300.0000, 2100.0000, 8350.0000, 0.0000, 8350.0000, N'Indian Rupees Eight Thousand Three Hundred and Fifty  Only', N'admin', N'Premium', N'', N'FI', 0.0000, 0.0000, 0.0000, N'', N'9899400978', N'9810300354', N'0')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (17, 7, CAST(0x0000A75700000000 AS DateTime), N'Cash', 99999, N'Cash', 16, N'Box', N'12*18', N'MTH', N'1517', 300.0000, 4800.0000, 8350.0000, 0.0000, 8350.0000, N'Indian Rupees Eight Thousand Three Hundred and Fifty  Only', N'admin', N'Premium', N'', N'FI', 0.0000, 0.0000, 0.0000, N'', N'9899400978', N'9810300354', N'0')
GO
INSERT [dbo].[tbl_challan_details_master] ([id], [challan_no], [date], [dealer_name], [dealer_id], [dealer_area], [qty], [unit], [size], [c_name], [p_code], [mrp], [amount], [totlamount], [fraight], [netamount], [inwords], [created_by], [p_grade], [status], [type], [labour], [paid], [balance], [address], [mob], [remarks], [mchk]) VALUES (18, 7, CAST(0x0000A75700000000 AS DateTime), N'Cash', 99999, N'Cash', 5, N'Box', N'16*16', N'ATC', N'PLAIN IVORY', 290.0000, 1450.0000, 8350.0000, 0.0000, 8350.0000, N'Indian Rupees Eight Thousand Three Hundred and Fifty  Only', N'admin', N'Premium', N'', N'FI', 0.0000, 0.0000, 0.0000, N'', N'9899400978', N'9810300354', N'0')
GO
SET IDENTITY_INSERT [dbo].[tbl_challan_details_master] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_comp_product_pricing] ON 

GO
INSERT [dbo].[tbl_comp_product_pricing] ([id], [cname], [size], [price]) VALUES (1, N'Allient', N'12x18', 70.0000)
GO
INSERT [dbo].[tbl_comp_product_pricing] ([id], [cname], [size], [price]) VALUES (2, N'gng', N'12*18', 180.0000)
GO
INSERT [dbo].[tbl_comp_product_pricing] ([id], [cname], [size], [price]) VALUES (3, N'tilehub', N'12*18', 185.0000)
GO
SET IDENTITY_INSERT [dbo].[tbl_comp_product_pricing] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_company_ledger_master] ON 

GO
INSERT [dbo].[tbl_company_ledger_master] ([id], [c_name], [debit], [credit], [date], [stock_id], [remarks]) VALUES (1, N'Allient', 1050.0000, 0.0000, CAST(0x0000A724010466F5 AS DateTime), 1, N'')
GO
INSERT [dbo].[tbl_company_ledger_master] ([id], [c_name], [debit], [credit], [date], [stock_id], [remarks]) VALUES (2, N'gng', 1440.0000, 0.0000, CAST(0x0000A72600C379E2 AS DateTime), 2, N'')
GO
INSERT [dbo].[tbl_company_ledger_master] ([id], [c_name], [debit], [credit], [date], [stock_id], [remarks]) VALUES (3, N'tilehub', 1480.0000, 0.0000, CAST(0x0000A72600C379E6 AS DateTime), 2, N'')
GO
INSERT [dbo].[tbl_company_ledger_master] ([id], [c_name], [debit], [credit], [date], [stock_id], [remarks]) VALUES (4, N'tilehub', 3700.0000, 0.0000, CAST(0x0000A72E00B9A93F AS DateTime), 3, N'')
GO
INSERT [dbo].[tbl_company_ledger_master] ([id], [c_name], [debit], [credit], [date], [stock_id], [remarks]) VALUES (5, N'tilehub', 4625.0000, 0.0000, CAST(0x0000A72E00B9A942 AS DateTime), 3, N'')
GO
INSERT [dbo].[tbl_company_ledger_master] ([id], [c_name], [debit], [credit], [date], [stock_id], [remarks]) VALUES (6, N'gng', 2700.0000, 0.0000, CAST(0x0000A72E014BC694 AS DateTime), 4, N'')
GO
INSERT [dbo].[tbl_company_ledger_master] ([id], [c_name], [debit], [credit], [date], [stock_id], [remarks]) VALUES (7, N'gng', 1800.0000, 0.0000, CAST(0x0000A730013AD31D AS DateTime), 5, N'')
GO
INSERT [dbo].[tbl_company_ledger_master] ([id], [c_name], [debit], [credit], [date], [stock_id], [remarks]) VALUES (8, N'gng', 3600.0000, 0.0000, CAST(0x0000A730013E607C AS DateTime), 6, N'')
GO
INSERT [dbo].[tbl_company_ledger_master] ([id], [c_name], [debit], [credit], [date], [stock_id], [remarks]) VALUES (9, N'gng', 9000.0000, 0.0000, CAST(0x0000A730013E607D AS DateTime), 6, N'')
GO
SET IDENTITY_INSERT [dbo].[tbl_company_ledger_master] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_company_master] ON 

GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (4, N'ATH', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (5, N'MTH', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (6, N'PTH', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (7, N'ATC', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (17, N'ATH DC', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (18, N'ATC GVT', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (19, N'ATC DC', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (20, N'ATC NANO', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (21, N'ATH NANO', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (22, N'ATC PD', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (23, N'ATH GVT', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (8, N'TK', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (9, N'sunshine', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (10, N'MKS', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (11, N'GNG', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (12, N'FIGO', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (13, N'GALAXY', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (14, N'RBMS', N'', N'', N'')
GO
INSERT [dbo].[tbl_company_master] ([id], [name], [mob_no], [address], [remarks]) VALUES (15, N'SGT', N'', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[tbl_company_master] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_dealer_ledger_master] ON 

GO
INSERT [dbo].[tbl_dealer_ledger_master] ([id], [dealer_name], [dealer_id], [debit], [credit], [date], [challan_no], [remarks]) VALUES (1, N'naveen bansal', 2, 2420.0000, 0.0000, CAST(0x0000A72E00000000 AS DateTime), 4, N'')
GO
SET IDENTITY_INSERT [dbo].[tbl_dealer_ledger_master] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_dealer_Master] ON 

GO
INSERT [dbo].[tbl_dealer_Master] ([id], [name], [mob_no], [area], [week]) VALUES (2, N'naveen bansal', N'', N'', N'Monday')
GO
SET IDENTITY_INSERT [dbo].[tbl_dealer_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_dealer_product_pricing] ON 

GO
INSERT [dbo].[tbl_dealer_product_pricing] ([id], [dealer_id], [name], [size], [c_name], [p_type], [price], [unit]) VALUES (4, 2, N'naveen bansal', N'12*18', N'gng', N'Premium', 210.0000, N'Box')
GO
INSERT [dbo].[tbl_dealer_product_pricing] ([id], [dealer_id], [name], [size], [c_name], [p_type], [price], [unit]) VALUES (5, 2, N'naveen bansal', N'12*18', N'tilehub', N'Premium', 195.0000, N'Box')
GO
SET IDENTITY_INSERT [dbo].[tbl_dealer_product_pricing] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_dealer_salesman_minimum_pricing] ON 

GO
INSERT [dbo].[tbl_dealer_salesman_minimum_pricing] ([id], [dealer_name], [dealer_id], [size], [c_name], [d_price], [s_price]) VALUES (1, N'', 0, N'12x18', N'Allient', 150.0000, 0.0000)
GO
SET IDENTITY_INSERT [dbo].[tbl_dealer_salesman_minimum_pricing] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_product_master] ON 

GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (8, N'12*18', N'ATH', N'Premium', N'1002 B1', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (9, N'12*18', N'ATH', N'Premium', N'1002 B', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (10, N'12*18', N'ATH', N'Premium', N'1002 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (11, N'12*18', N'ATH', N'Premium', N'1002 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (12, N'12*18', N'ATH', N'Premium', N'1003 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (13, N'12*18', N'ATH', N'Premium', N'1005 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (14, N'12*18', N'ATH', N'Premium', N'1005 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (15, N'12*18', N'ATH', N'Premium', N'1005 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (16, N'12*18', N'ATH', N'Premium', N'1007D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (17, N'12*18', N'ATH', N'Premium', N'1007 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (18, N'12*18', N'ATH', N'Premium', N'1015 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (19, N'12*18', N'ATH', N'Premium', N'1016 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (20, N'12*18', N'ATH', N'Premium', N'1103 HL 2 B', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (21, N'12*18', N'ATH', N'Premium', N'1103 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (22, N'12*18', N'ATH', N'Premium', N'1113 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (23, N'12*18', N'ATH', N'Premium', N'1113 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (24, N'12*18', N'ATH', N'Premium', N'1113 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (25, N'12*18', N'ATH', N'Premium', N'1138 KA HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (26, N'12*18', N'ATH', N'Premium', N'1138 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (27, N'12*18', N'ATH', N'Premium', N'1158 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (28, N'12*18', N'ATH', N'Premium', N'1158 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (29, N'12*18', N'ATH', N'Premium', N'1166 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (30, N'12*18', N'ATH', N'Premium', N'1166 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (31, N'12*18', N'ATH', N'Premium', N'1197 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (32, N'12*18', N'ATH', N'Premium', N'1197 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (33, N'12*18', N'ATH', N'Premium', N'1197 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (34, N'12*18', N'ATH', N'Premium', N'1198 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (35, N'12*18', N'ATH', N'Premium', N'1198 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (36, N'12*18', N'ATH', N'Premium', N'1208 K', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (37, N'12*18', N'ATH', N'Premium', N'11208 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (38, N'12*18', N'ATH', N'Premium', N'1212 K', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (39, N'12*18', N'ATH', N'Premium', N'1212 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (40, N'12*18', N'ATH', N'Premium', N'1215 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (41, N'12*18', N'ATH', N'Premium', N'1215 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (42, N'12*18', N'ATH', N'Premium', N'1216 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (43, N'12*18', N'ATH', N'Premium', N'1216 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (44, N'12*18', N'ATH', N'Premium', N'1216 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (45, N'12*18', N'ATH', N'Premium', N'1219 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (46, N'12*18', N'ATH', N'Premium', N'1219 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (47, N'12*18', N'ATH', N'Premium', N'1219 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (48, N'12*18', N'ATH', N'Premium', N'1236 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (49, N'12*18', N'ATH', N'Premium', N'1236 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (50, N'12*18', N'ATH', N'Premium', N'1236 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (51, N'12*18', N'ATH', N'Premium', N'1239 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (52, N'12*18', N'ATH', N'Premium', N'1239 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (53, N'12*18', N'ATH', N'Premium', N'1239 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (54, N'12*18', N'ATH', N'Premium', N'1240 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (55, N'12*18', N'ATH', N'Premium', N'1240 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (56, N'12*18', N'ATH', N'Premium', N'1240 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (57, N'12*18', N'ATH', N'Premium', N'1252 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (58, N'12*18', N'ATH', N'Premium', N'1252 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (59, N'12*18', N'ATH', N'Premium', N'1252 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (60, N'12*18', N'ATH', N'Premium', N'1255 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (61, N'12*18', N'ATH', N'Premium', N'1255 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (62, N'12*18', N'ATH', N'Premium', N'1255 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (63, N'12*18', N'ATH', N'Premium', N'1256 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (64, N'12*18', N'ATH', N'Premium', N'1256 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (65, N'12*18', N'ATH', N'Premium', N'1256 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (66, N'12*18', N'ATH', N'Premium', N'1258 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (67, N'12*18', N'ATH', N'Premium', N'1258 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (68, N'12*18', N'ATH', N'Premium', N'1259 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (69, N'12*18', N'ATH', N'Premium', N'1259 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (70, N'12*18', N'ATH', N'Premium', N'1259 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (71, N'12*18', N'ATH', N'Premium', N'1262 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (72, N'12*18', N'ATH', N'Premium', N'1262 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (73, N'12*18', N'ATH', N'Premium', N'1262 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (74, N'12*18', N'ATH', N'Premium', N'1264 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (75, N'12*18', N'ATH', N'Premium', N'1264 HL A', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (76, N'12*18', N'ATH', N'Premium', N'1264 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (77, N'12*18', N'ATH', N'Premium', N'1266 KB', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (78, N'12*18', N'ATH', N'Premium', N'1266 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (79, N'12*18', N'ATH', N'Premium', N'1274 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (80, N'12*18', N'ATH', N'Premium', N'1274 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (81, N'12*18', N'ATH', N'Premium', N'1274 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (82, N'12*18', N'ATH', N'Premium', N'1275 KA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (83, N'12*18', N'ATH', N'Premium', N'1275 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (84, N'12*18', N'ATH', N'Premium', N'20031 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (85, N'12*18', N'ATH', N'Premium', N'20031 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (86, N'12*18', N'ATH', N'Premium', N'20031 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (87, N'12*18', N'ATH', N'Premium', N'2009 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (88, N'12*18', N'ATH', N'Premium', N'2009 HL 4', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (89, N'12*18', N'ATH', N'Premium', N'2009 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (90, N'12*18', N'ATH', N'Premium', N'2015 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (91, N'12*18', N'ATH', N'Premium', N'2020 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (92, N'12*18', N'ATH', N'Premium', N'2020 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (93, N'12*18', N'ATH', N'Premium', N'2020 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (94, N'12*18', N'ATH', N'Premium', N'2022 KA HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (95, N'12*18', N'ATH', N'Premium', N'2022 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (96, N'12*18', N'ATH', N'Premium', N'2033 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (97, N'12*18', N'ATH', N'Premium', N'2033 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (98, N'12*18', N'ATH', N'Premium', N'2033 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (99, N'12*18', N'ATH', N'Premium', N'2035 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (100, N'12*18', N'ATH', N'Premium', N'2035 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (101, N'12*18', N'ATH', N'Premium', N'2037 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (102, N'12*18', N'ATH', N'Premium', N'2037 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (103, N'12*18', N'ATH', N'Premium', N'2037 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (104, N'12*18', N'ATH', N'Premium', N'2042 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (105, N'12*18', N'ATH', N'Premium', N'2042 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (106, N'12*18', N'ATH', N'Premium', N'2045 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (107, N'12*18', N'ATH', N'Premium', N'2045 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (108, N'12*18', N'ATH', N'Premium', N'2049 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (109, N'12*18', N'ATH', N'Premium', N'2049 HL A', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (110, N'12*18', N'ATH', N'Premium', N'2049 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (111, N'12*18', N'ATH', N'Premium', N'2050 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (112, N'12*18', N'ATH', N'Premium', N'2051 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (113, N'12*18', N'ATH', N'Premium', N'2052 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (114, N'12*18', N'ATH', N'Premium', N'2053 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (115, N'12*18', N'ATH', N'Premium', N'2053 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (116, N'12*18', N'ATH', N'Premium', N'2054 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (117, N'12*18', N'ATH', N'Premium', N'2055 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (118, N'12*18', N'ATH', N'Premium', N'2056 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (119, N'12*18', N'ATH', N'Premium', N'2056 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (120, N'12*18', N'ATH', N'Premium', N'2063 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (121, N'12*18', N'ATH', N'Premium', N'2063 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (122, N'12*18', N'ATH', N'Premium', N'30006 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (123, N'12*18', N'ATH', N'Premium', N'30006 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (124, N'12*18', N'ATH', N'Premium', N'30006 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (125, N'12*18', N'ATH', N'Premium', N'3032 E', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (126, N'12*18', N'ATH', N'Premium', N'3528 E', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (127, N'12*18', N'ATH', N'Premium', N'3531 E', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (128, N'12*18', N'ATH', N'Premium', N'3546', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (129, N'12*18', N'ATH', N'Premium', N'3548', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (130, N'12*18', N'ATH', N'Premium', N'3555', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (131, N'12*18', N'ATH', N'Premium', N'45 MATT WHITE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (132, N'12*18', N'ATH', N'Premium', N'EL 713', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (133, N'12*18', N'ATH', N'Premium', N'MATT WHITE PLAIN', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (134, N'12*18', N'ATH', N'Premium', N'MATT WHITE 1 ( ALLIENT ) 2015', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (135, N'12*18', N'ATH', N'Premium', N'MEDONA  HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (136, N'12*18', N'ATH', N'Premium', N'MEDONA   L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (137, N'12*18', N'ATH', N'Premium', N'1109 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (138, N'12*18', N'ATH', N'Premium', N'1109 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (139, N'12*18', N'ATH', N'Premium', N'1109 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (140, N'12*18', N'ATH', N'Premium', N'1158 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (141, N'12*18', N'ATH', N'Premium', N'1063 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (142, N'12*18', N'ATH', N'Premium', N'3559', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (143, N'12*18', N'ATH', N'Premium', N'2055 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (144, N'12*18', N'ATH', N'Premium', N'2608 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (145, N'12*18', N'ATH', N'Premium', N'GLOSSY WHITE PLAIN', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (146, N'12*18', N'ATH', N'Premium', N'2051 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (147, N'12*18', N'ATH', N'Premium', N'437 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (148, N'12*18', N'ATH', N'Premium', N'437 HL 1', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (149, N'12*18', N'ATH', N'Premium', N'437 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (150, N'12*18', N'ATH', N'Premium', N'448 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (151, N'12*18', N'ATH', N'Premium', N'448 HL 1', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (152, N'12*18', N'ATH', N'Premium', N'448 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (153, N'12*18', N'ATH', N'Premium', N'453 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (154, N'12*18', N'ATH', N'Premium', N'453 HL 2', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (155, N'12*18', N'ATH', N'Premium', N'453 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (156, N'12*18', N'ATH', N'Premium', N'744 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (157, N'12*18', N'ATH', N'Premium', N'745 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (158, N'12*18', N'ATH', N'Premium', N'378 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (159, N'12*18', N'ATH', N'Premium', N'378 HL 2', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (160, N'12*18', N'ATH', N'Premium', N'378 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (162, N'12*18', N'ATH', N'Premium', N'385 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (163, N'12*18', N'ATH', N'Premium', N'385 HL 3', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (164, N'12*18', N'ATH', N'Premium', N'385 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (165, N'12*18', N'ATH', N'Premium', N'391 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (166, N'12*18', N'ATH', N'Premium', N'391 HL 3', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (167, N'12*18', N'ATH', N'Premium', N'391 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (168, N'12*18', N'ATH', N'Premium', N'392 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (169, N'12*18', N'ATH', N'Premium', N'392 HL 1', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (170, N'12*18', N'ATH', N'Premium', N'392 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (171, N'12*18', N'ATH', N'Premium', N'743 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (172, N'12*18', N'MTH', N'Premium', N'1517', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (173, N'12*18', N'MTH', N'Premium', N'1533', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (174, N'12*18', N'MTH', N'Premium', N'1534', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (175, N'12*18', N'MTH', N'Premium', N'1544', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (176, N'12*18', N'MTH', N'Premium', N'1633', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (177, N'12*18', N'MTH', N'Premium', N'1644', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (178, N'12*18', N'MTH', N'Premium', N'1717 A', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (179, N'12*18', N'MTH', N'Premium', N'1733 B', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (180, N'12*18', N'MTH', N'Premium', N'1734 C', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (181, N'12*18', N'MTH', N'Premium', N'1744 B', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (182, N'12*18', N'MTH', N'Premium', N'4520', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (183, N'12*18', N'MTH', N'Premium', N'4620', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (184, N'12*18', N'MTH', N'Premium', N'4720', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (185, N'12*18', N'PTH', N'Premium', N'2001 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (186, N'12*18', N'PTH', N'Premium', N'2002 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (187, N'12*18', N'PTH', N'Premium', N'2003 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (407, N'12*18', N'ATC', N'Premium', N'8024 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (191, N'12*24', N'MTH', N'Premium', N'15055', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (190, N'12*24', N'MTH', N'Premium', N'2549', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (192, N'12*24', N'MTH', N'Premium', N'2566', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (193, N'12*24', N'MTH', N'Premium', N'2579', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (194, N'12*24', N'MTH', N'Premium', N'2580', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (195, N'12*24', N'MTH', N'Premium', N'2581', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (196, N'12*24', N'MTH', N'Premium', N'2584', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (197, N'12*24', N'MTH', N'Premium', N'2585', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (198, N'12*24', N'MTH', N'Premium', N'2649', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (199, N'12*24', N'MTH', N'Premium', N'2666', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (200, N'12*24', N'MTH', N'Premium', N'2679', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (201, N'12*24', N'MTH', N'Premium', N'2749 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (202, N'12*24', N'MTH', N'Premium', N'2766 B', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (203, N'12*24', N'MTH', N'Premium', N'2779 A', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (204, N'12*24', N'MTH', N'Premium', N'2780 A', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (205, N'12*24', N'MTH', N'Premium', N'2781 A', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (206, N'12*24', N'MTH', N'Premium', N'2784 B', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (207, N'12*24', N'MTH', N'Premium', N'2785 B', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (208, N'12*24', N'MTH', N'Premium', N'3151', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (209, N'12*24', N'MTH', N'Premium', N'3351 A', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (210, N'12*24', N'MTH', N'Premium', N'3354 A', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (211, N'12*24', N'MTH', N'Premium', N'3356 A', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (212, N'12*24', N'MTH', N'Premium', N'3357 A', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (213, N'12*24', N'MTH', N'Premium', N'3358 A', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (214, N'12*24', N'MTH', N'Premium', N'519 G', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (215, N'12*24', N'MTH', N'Premium', N'538 G', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (216, N'12*24', N'MTH', N'Premium', N'544', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (217, N'12*24', N'MTH', N'Premium', N'553 - 26 MATT', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (218, N'12*24', N'MTH', N'Premium', N'553 M', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (219, N'12*24', N'MTH', N'Premium', N'2694', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (220, N'12*24', N'MTH', N'Premium', N'3333 B', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (221, N'12*24', N'MTH', N'Premium', N'601 G', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (222, N'12*24', N'MTH', N'Premium', N'604 G', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (223, N'12*24', N'MTH', N'Premium', N'3507', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (224, N'12*24', N'MTH', N'Premium', N'3509', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (225, N'12*24', N'MTH', N'Premium', N'3607', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (226, N'12*24', N'MTH', N'Premium', N'3609', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (227, N'12*24', N'MTH', N'Premium', N'3707 A', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (228, N'12*24', N'MTH', N'Premium', N'3709 A', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (229, N'12*24', N'PTH', N'Premium', N'2612 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (230, N'12*24', N'PTH', N'Premium', N'2597 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (231, N'12*24', N'PTH', N'Premium', N'2598 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (232, N'12*24', N'PTH', N'Premium', N'2598 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (233, N'12*24', N'PTH', N'Premium', N'2599 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (234, N'12*24', N'PTH', N'Premium', N'2599 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (235, N'12*24', N'PTH', N'Premium', N'2600 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (236, N'12*24', N'PTH', N'Premium', N'2601 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (237, N'12*24', N'PTH', N'Premium', N'2601 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (238, N'12*24', N'PTH', N'Premium', N'2602 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (239, N'12*24', N'PTH', N'Premium', N'2603 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (240, N'12*24', N'PTH', N'Premium', N'2603 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (241, N'12*24', N'PTH', N'Premium', N'26 WHITE GLOSSY', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (242, N'12*24', N'PTH', N'Premium', N'2609 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (243, N'12*24', N'PTH', N'Premium', N'2609 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (244, N'12*24', N'PTH', N'Premium', N'2609 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (245, N'12*24', N'PTH', N'Premium', N'2611 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (246, N'12*24', N'PTH', N'Premium', N'3546 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (247, N'12*24', N'PTH', N'Premium', N'3546 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (248, N'12*24', N'PTH', N'Premium', N'3577 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (249, N'12*24', N'PTH', N'Premium', N'3577 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (250, N'12*24', N'PTH', N'Premium', N'2608 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (251, N'12*24', N'PTH', N'Premium', N'2608 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (252, N'12*24', N'PTH', N'Premium', N'2608 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (253, N'12*24', N'PTH', N'Premium', N'2610 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (254, N'12*24', N'PTH', N'Premium', N'2610 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (255, N'12*24', N'PTH', N'Premium', N'2610 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (256, N'12*24', N'PTH', N'Premium', N'2610 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (257, N'12*24', N'PTH', N'Premium', N'3578 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (258, N'12*24', N'PTH', N'Premium', N'3578 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (259, N'12*24', N'PTH', N'Premium', N'3579 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (260, N'12*24', N'PTH', N'Premium', N'3579 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (261, N'12*24', N'PTH', N'Premium', N'3579 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (262, N'12*24', N'PTH', N'Premium', N'2613 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (263, N'12*24', N'PTH', N'Premium', N'2612 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (264, N'12*24', N'PTH', N'Premium', N'2613 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (265, N'12*24', N'PTH', N'Premium', N'2613 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (266, N'12*24', N'PTH', N'Premium', N'2612 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (267, N'12*24', N'PTH', N'Premium', N'WHITE PLAIN', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (394, N'12*18', N'ATC', N'Premium', N'18106 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (395, N'12*18', N'ATC', N'Premium', N'18106 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (396, N'12*18', N'ATC', N'Premium', N'18106 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (397, N'12*18', N'ATC', N'Premium', N'2008 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (398, N'12*18', N'ATC', N'Premium', N'2008 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (399, N'12*18', N'ATC', N'Premium', N'2008 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (400, N'12*18', N'ATC', N'Premium', N'1104 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (401, N'10*15', N'ATC', N'Premium', N'1104 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (402, N'12*18', N'ATC', N'Premium', N'1104 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (403, N'12*18', N'ATC', N'Premium', N'2032 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (404, N'12*18', N'ATC', N'Premium', N'2032 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (405, N'12*18', N'ATC', N'Premium', N'2032 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (406, N'12*18', N'ATC', N'Premium', N'8024 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (269, N'10*15', N'ATC', N'Premium', N'308 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (270, N'10*15', N'ATC', N'Premium', N'308 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (271, N'10*15', N'ATC', N'Premium', N'308 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (272, N'10*15', N'ATC', N'Premium', N'8043 E', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (273, N'10*15', N'ATC', N'Premium', N'8014 E', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (274, N'10*15', N'ATC', N'Premium', N'1507 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (275, N'10*15', N'ATC', N'Premium', N'1507 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (276, N'10*15', N'ATC', N'Premium', N'319 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (277, N'10*15', N'ATC', N'Premium', N'319 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (278, N'10*15', N'ATC', N'Premium', N'319 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (279, N'10*15', N'ATC', N'Premium', N'4054 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (280, N'10*15', N'ATC', N'Premium', N'4054 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (281, N'10*15', N'ATC', N'Premium', N'4054 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (282, N'10*15', N'ATC', N'Premium', N'5014 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (283, N'10*15', N'ATC', N'Premium', N'5014 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (284, N'10*15', N'ATC', N'Premium', N'5014 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (285, N'10*15', N'ATC', N'Premium', N'4007 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (286, N'10*15', N'ATC', N'Premium', N'4007 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (287, N'10*15', N'ATC', N'Premium', N'4007 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (288, N'10*15', N'ATC', N'Premium', N'7005 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (289, N'10*15', N'ATC', N'Premium', N'7005 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (290, N'10*15', N'ATC', N'Premium', N'7005 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (291, N'10*15', N'ATC', N'Premium', N'4026 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (292, N'10*15', N'ATC', N'Premium', N'4026 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (293, N'10*15', N'ATC', N'Premium', N'4026 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (294, N'10*15', N'ATC', N'Premium', N'7013 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (295, N'10*15', N'ATC', N'Premium', N'7013 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (296, N'10*15', N'ATC', N'Premium', N'7013 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (297, N'10*15', N'ATC', N'Premium', N'4021 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (298, N'10*15', N'ATC', N'Premium', N'4021 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (299, N'10*15', N'ATC', N'Premium', N'4021 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (306, N'10*15', N'ATC', N'Premium', N'ELV 18', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (307, N'10*15', N'ATC', N'Premium', N'ELV 28', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (302, N'10*15', N'ATC', N'Premium', N'8042 E', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (303, N'10*15', N'ATC', N'Premium', N'8010 E', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (304, N'10*15', N'ATC', N'Premium', N'6512 E', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (305, N'10*15', N'ATC', N'Premium', N'ELV 28', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (308, N'10*15', N'ATC', N'Premium', N'8004 E', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (309, N'10*15', N'ATC', N'Premium', N'4058 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (310, N'10*15', N'ATC', N'Premium', N'4058 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (311, N'10*15', N'ATC', N'Premium', N'4058 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (312, N'10*15', N'ATC', N'Premium', N'7009 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (313, N'10*15', N'ATC', N'Premium', N'7009 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (314, N'10*15', N'ATC', N'Premium', N'7009 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (315, N'10*15', N'ATC', N'Premium', N'7002 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (316, N'10*15', N'ATC', N'Premium', N'7002 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (317, N'10*15', N'ATC', N'Premium', N'7002 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (318, N'10*15', N'ATC', N'Premium', N'4052 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (319, N'10*15', N'ATC', N'Premium', N'4052 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (320, N'10*15', N'ATC', N'Premium', N'4052 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (321, N'10*15', N'ATC', N'Premium', N'4103 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (322, N'10*15', N'ATC', N'Premium', N'4103 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (323, N'10*15', N'ATC', N'Premium', N'4103 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (324, N'10*15', N'ATC', N'Premium', N'5001 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (325, N'10*15', N'ATC', N'Premium', N'5001 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (326, N'10*15', N'ATC', N'Premium', N'5001 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (327, N'10*15', N'ATC', N'Premium', N'4080 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (328, N'10*15', N'ATC', N'Premium', N'4080 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (329, N'10*15', N'ATC', N'Premium', N'4080 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (330, N'10*15', N'ATC', N'Premium', N'7010 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (331, N'10*15', N'ATC', N'Premium', N'7010 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (332, N'10*15', N'ATC', N'Premium', N'7010 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (333, N'10*15', N'ATC', N'Premium', N'4068 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (334, N'10*15', N'ATC', N'Premium', N'4068 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (335, N'10*15', N'ATC', N'Premium', N'4068 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (336, N'10*15', N'ATC', N'Premium', N'5002 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (337, N'10*15', N'ATC', N'Premium', N'5002 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (338, N'10*15', N'ATC', N'Premium', N'5002 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (339, N'10*15', N'ATC', N'Premium', N'6551 E', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (340, N'10*15', N'ATC', N'Premium', N'5105 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (341, N'10*15', N'ATC', N'Premium', N'5105 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (342, N'10*15', N'ATC', N'Premium', N'5105 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (343, N'12*18', N'ATC', N'Premium', N'11043 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (344, N'12*18', N'ATC', N'Premium', N'11043 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (345, N'12*18', N'ATC', N'Premium', N'11043 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (346, N'12*18', N'ATC', N'Premium', N'3061 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (347, N'12*18', N'ATC', N'Premium', N'3061 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (348, N'12*18', N'ATC', N'Premium', N'3061 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (349, N'12*18', N'ATC', N'Premium', N'233 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (350, N'12*18', N'ATC', N'Premium', N'233 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (351, N'12*18', N'ATC', N'Premium', N'233 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (352, N'12*18', N'ATC', N'Premium', N'1091 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (353, N'12*18', N'ATC', N'Premium', N'1091 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (354, N'12*18', N'ATC', N'Premium', N'1091 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (355, N'12*18', N'ATC', N'Premium', N'1170 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (356, N'12*18', N'ATC', N'Premium', N'1170 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (357, N'12*18', N'ATC', N'Premium', N'1170 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (358, N'12*18', N'ATC', N'Premium', N'234 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (359, N'12*18', N'ATC', N'Premium', N'234 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (360, N'12*18', N'ATC', N'Premium', N'234 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (361, N'12*18', N'ATC', N'Premium', N'3062 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (362, N'12*18', N'ATC', N'Premium', N'3062 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (363, N'12*18', N'ATC', N'Premium', N'3062 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (364, N'12*18', N'ATC', N'Premium', N'1092 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (365, N'12*18', N'ATC', N'Premium', N'1092 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (366, N'12*18', N'ATC', N'Premium', N'1092 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (367, N'12*18', N'ATC', N'Premium', N'117 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (368, N'12*18', N'ATC', N'Premium', N'117 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (369, N'12*18', N'ATC', N'Premium', N'117 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (370, N'12*18', N'ATC', N'Premium', N'3020 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (371, N'12*18', N'ATC', N'Premium', N'3020 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (372, N'12*18', N'ATC', N'Premium', N'3020 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (373, N'12*18', N'ATC', N'Premium', N'1064 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (374, N'12*18', N'ATC', N'Premium', N'1064 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (375, N'12*18', N'ATC', N'Premium', N'1064 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (376, N'12*18', N'ATC', N'Premium', N'301 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (377, N'10*15', N'ATC', N'Premium', N'301 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (378, N'10*15', N'ATC', N'Premium', N'301 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (379, N'12*18', N'ATC', N'Premium', N'11034 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (380, N'12*18', N'ATC', N'Premium', N'11034 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (381, N'12*18', N'ATC', N'Premium', N'11034 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (382, N'12*18', N'ATC', N'Premium', N'1130 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (383, N'12*18', N'ATC', N'Premium', N'1130 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (384, N'12*18', N'ATC', N'Premium', N'1130 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (385, N'12*18', N'ATC', N'Premium', N'11017 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (386, N'12*18', N'ATC', N'Premium', N'11017 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (387, N'12*18', N'ATC', N'Premium', N'11017 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (388, N'12*18', N'ATC', N'Premium', N'340 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (389, N'12*18', N'ATC', N'Premium', N'340 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (390, N'12*18', N'ATC', N'Premium', N'340 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (391, N'12*18', N'ATC', N'Premium', N'350 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (392, N'10*15', N'ATC', N'Premium', N'350 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (393, N'10*15', N'ATC', N'Premium', N'350 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (408, N'12*18', N'ATC', N'Premium', N'8024 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (409, N'12*18', N'ATC', N'Premium', N'1051 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (410, N'12*18', N'ATC', N'Premium', N'1032 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (411, N'12*18', N'ATC', N'Premium', N'1032 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (412, N'12*18', N'ATC', N'Premium', N'4002 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (413, N'12*18', N'ATC', N'Premium', N'4002 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (414, N'12*18', N'ATC', N'Premium', N'2003 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (415, N'12*18', N'ATC', N'Premium', N'2003 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (416, N'12*18', N'ATC', N'Premium', N'348 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (417, N'12*18', N'ATC', N'Premium', N'348 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (418, N'12*18', N'ATC', N'Premium', N'348 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (419, N'12*18', N'ATC', N'Premium', N'1019 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (420, N'12*18', N'ATC', N'Premium', N'1019 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (421, N'12*18', N'ATC', N'Premium', N'1018 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (422, N'12*18', N'ATC', N'Premium', N'1018 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (423, N'12*18', N'ATC', N'Premium', N'EL 08', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (424, N'12*18', N'ATC', N'Premium', N'EL 0254', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (425, N'12*18', N'ATC', N'Premium', N'EL 3552', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (426, N'12*18', N'ATC', N'Premium', N'EL 3012', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (427, N'12*18', N'ATC', N'Premium', N'EL 8015', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (428, N'10*15', N'TK', N'Premium', N'1201 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (429, N'10*15', N'TK', N'Premium', N'1201 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (434, N'10*15', N'TK', N'Premium', N'1030 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (431, N'10*15', N'TK', N'Premium', N'1417 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (432, N'10*15', N'TK', N'Premium', N'1417 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (433, N'10*15', N'TK', N'Premium', N'1417 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (435, N'10*15', N'TK', N'Premium', N'1030 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (436, N'10*15', N'TK', N'Premium', N'1030 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (437, N'10*15', N'TK', N'Premium', N'78 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (438, N'10*15', N'TK', N'Premium', N'48 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (439, N'10*15', N'sunshine', N'Premium', N'5168 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (440, N'10*15', N'TK', N'Premium', N'60 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (441, N'10*15', N'sunshine', N'Premium', N'5168 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (442, N'10*15', N'TK', N'Premium', N'68 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (443, N'10*15', N'sunshine', N'Premium', N'5168 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (444, N'10*15', N'sunshine', N'Premium', N'EL 118', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (445, N'10*15', N'sunshine', N'Premium', N'139 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (446, N'10*15', N'TK', N'Premium', N'1204 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (447, N'10*15', N'sunshine', N'Premium', N'139 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (448, N'10*15', N'TK', N'Premium', N'1204 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (449, N'10*15', N'sunshine', N'Premium', N'139 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (450, N'10*15', N'TK', N'Premium', N'1204 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (451, N'10*15', N'TK', N'Premium', N'1300 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (452, N'10*15', N'sunshine', N'Premium', N'1004 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (453, N'10*15', N'TK', N'Premium', N'1300 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (454, N'10*15', N'sunshine', N'Premium', N'1004 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (455, N'10*15', N'TK', N'Premium', N'1300 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (456, N'10*15', N'sunshine', N'Premium', N'5044 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (457, N'10*15', N'ATC', N'Premium', N'5044 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (458, N'10*15', N'TK', N'Premium', N'1353 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (459, N'10*15', N'TK', N'Premium', N'1353 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (460, N'10*15', N'sunshine', N'Premium', N'5044 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (461, N'10*15', N'TK', N'Premium', N'1552 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (462, N'10*15', N'sunshine', N'Premium', N'5171 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (463, N'10*15', N'TK', N'Premium', N'1552 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (464, N'10*15', N'sunshine', N'Premium', N'5171 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (465, N'10*15', N'TK', N'Premium', N'1552 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (466, N'10*15', N'sunshine', N'Premium', N'5171 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (467, N'10*15', N'TK', N'Premium', N'1272 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (468, N'10*15', N'TK', N'Premium', N'1272 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (469, N'10*15', N'TK', N'Premium', N'1272 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (470, N'10*15', N'TK', N'Premium', N'67 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (471, N'10*15', N'TK', N'Premium', N'1257 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (472, N'10*15', N'TK', N'Premium', N'1257 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (473, N'10*15', N'TK', N'Premium', N'1257 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (474, N'10*15', N'TK', N'Premium', N'1553 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (475, N'10*15', N'TK', N'Premium', N'1553 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (476, N'10*15', N'TK', N'Premium', N'63 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (477, N'10*15', N'TK', N'Premium', N'1287 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (478, N'10*15', N'TK', N'Premium', N'1287 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (479, N'10*15', N'TK', N'Premium', N'1287 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (480, N'10*15', N'TK', N'Premium', N'1312 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (481, N'10*15', N'TK', N'Premium', N'1312 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (482, N'10*15', N'TK', N'Premium', N'1312 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (483, N'10*15', N'TK', N'Premium', N'1442 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (484, N'10*15', N'sunshine', N'Premium', N'5135 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (485, N'10*15', N'TK', N'Premium', N'1442 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (486, N'10*15', N'TK', N'Premium', N'1442 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (487, N'10*15', N'sunshine', N'Premium', N'5135 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (488, N'10*15', N'sunshine', N'Premium', N'5135 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (489, N'10*15', N'sunshine', N'Premium', N'5176 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (490, N'10*15', N'ATC', N'Premium', N'5176 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (491, N'10*15', N'sunshine', N'Premium', N'5176 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (492, N'10*15', N'sunshine', N'Premium', N'5086 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (493, N'12*18', N'TK', N'Premium', N'5021 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (494, N'10*15', N'sunshine', N'Premium', N'5086 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (495, N'12*18', N'TK', N'Premium', N'5021 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (496, N'10*15', N'sunshine', N'Premium', N'5086 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (497, N'12*18', N'TK', N'Premium', N'5021 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (498, N'10*15', N'sunshine', N'Premium', N'5169 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (499, N'12*18', N'TK', N'Premium', N'1866 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (500, N'10*15', N'sunshine', N'Premium', N'5169 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (501, N'12*18', N'TK', N'Premium', N'1866 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (502, N'10*15', N'sunshine', N'Premium', N'5169 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (503, N'12*18', N'TK', N'Premium', N'1866 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (504, N'10*15', N'sunshine', N'Premium', N'5025 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (505, N'10*15', N'sunshine', N'Premium', N'5025 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (506, N'10*15', N'sunshine', N'Premium', N'5025 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (507, N'10*15', N'sunshine', N'Premium', N'EL 135', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (508, N'12*18', N'TK', N'Premium', N'18157 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (509, N'10*15', N'sunshine', N'Premium', N'5167 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (510, N'12*18', N'TK', N'Premium', N'18157 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (511, N'10*15', N'sunshine', N'Premium', N'5167 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (512, N'10*15', N'sunshine', N'Premium', N'5167 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (513, N'12*18', N'TK', N'Premium', N'18157 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (514, N'10*15', N'sunshine', N'Premium', N'EL 145', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (515, N'10*15', N'sunshine', N'Premium', N'146 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (516, N'12*18', N'TK', N'Premium', N'18114 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (517, N'10*15', N'ATC', N'Premium', N'146 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (518, N'10*15', N'sunshine', N'Premium', N'146 hl', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (519, N'12*18', N'TK', N'Premium', N'18114 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (520, N'10*15', N'sunshine', N'Premium', N'5175 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (521, N'10*15', N'sunshine', N'Premium', N'5175 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (522, N'12*18', N'TK', N'Premium', N'18114 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (523, N'10*15', N'sunshine', N'Premium', N'5175 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (524, N'10*15', N'sunshine', N'Premium', N'5170 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (525, N'12*18', N'TK', N'Premium', N'18428 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (526, N'10*15', N'sunshine', N'Premium', N'5170 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (527, N'10*15', N'sunshine', N'Premium', N'51710 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (528, N'12*18', N'TK', N'Premium', N'18428 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (529, N'10*15', N'ATC', N'Premium', N'5167 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (530, N'10*15', N'ATC', N'Premium', N'5167 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (531, N'12*18', N'TK', N'Premium', N'18428 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (532, N'10*15', N'ATC', N'Premium', N'5167 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (533, N'12*18', N'TK', N'Premium', N'18212 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (534, N'10*15', N'sunshine', N'Premium', N'5137 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (535, N'12*18', N'TK', N'Premium', N'18212 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (536, N'12*18', N'TK', N'Premium', N'18212 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (537, N'10*15', N'ATC', N'Premium', N'5137 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (538, N'10*15', N'ATC', N'Premium', N'5137 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (539, N'10*15', N'sunshine', N'Premium', N'502 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (540, N'12*18', N'TK', N'Premium', N'15004 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (541, N'12*18', N'TK', N'Premium', N'15004 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (542, N'10*15', N'sunshine', N'Premium', N'502 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (543, N'10*15', N'sunshine', N'Premium', N'502 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (544, N'12*18', N'TK', N'Premium', N'15004 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (545, N'10*15', N'sunshine', N'Premium', N'503', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (546, N'10*15', N'sunshine', N'Premium', N'503 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (547, N'12*18', N'TK', N'Premium', N'15005 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (548, N'10*15', N'sunshine', N'Premium', N'503 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (549, N'12*18', N'TK', N'Premium', N'15005 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (550, N'10*15', N'sunshine', N'Premium', N'503 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (551, N'12*18', N'TK', N'Premium', N'15005 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (552, N'12*18', N'TK', N'Premium', N'15024 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (553, N'10*15', N'sunshine', N'Premium', N'5069 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (554, N'12*18', N'TK', N'Premium', N'15024 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (555, N'10*15', N'sunshine', N'Premium', N'5069 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (556, N'12*18', N'TK', N'Premium', N'15024 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (557, N'10*15', N'sunshine', N'Premium', N'5069 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (558, N'10*15', N'sunshine', N'Premium', N'5098 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (559, N'10*15', N'MKS', N'Premium', N'517 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (560, N'10*15', N'ATC', N'Premium', N'5098 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (561, N'10*15', N'MKS', N'Premium', N'506 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (562, N'10*15', N'MKS', N'Premium', N'166 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (563, N'10*15', N'sunshine', N'Premium', N'5098 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (564, N'10*15', N'MKS', N'Premium', N'107 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (565, N'10*15', N'MKS', N'Premium', N'302 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (566, N'10*15', N'MKS', N'Premium', N'297 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (571, N'10*15', N'sunshine', N'Premium', N'116 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (568, N'10*15', N'MKS', N'Premium', N'128 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (569, N'10*15', N'MKS', N'Premium', N'230 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (570, N'10*15', N'MKS', N'Premium', N'144 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (629, N'12*18', N'RBMS', N'Premium', N'4003 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (573, N'10*15', N'sunshine', N'Premium', N'5046 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (633, N'12*12', N'SGT', N'Premium', N'1013', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (575, N'10*15', N'sunshine', N'Premium', N'5046 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (634, N'12*12', N'SGT', N'Premium', N'1020', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (577, N'10*15', N'sunshine', N'Premium', N'5046 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (635, N'12*12', N'SGT', N'Premium', N'1026', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (579, N'10*15', N'sunshine', N'Premium', N'5103 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (636, N'12*12', N'SGT', N'Premium', N'1037', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (638, N'12*12', N'SGT', N'Premium', N'1090', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (582, N'10*15', N'sunshine', N'Premium', N'5103 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (628, N'12*18', N'RBMS', N'Premium', N'1027 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (584, N'10*15', N'sunshine', N'Premium', N'5103 HL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (630, N'12*18', N'RBMS', N'Premium', N'1113 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (637, N'12*12', N'SGT', N'Premium', N'1088', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (587, N'10*15', N'sunshine', N'Premium', N'5086 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (639, N'12*12', N'SGT', N'Premium', N'1089', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (640, N'10*15', N'GNG', N'Premium', N'1021 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (641, N'12*12', N'SGT', N'Premium', N'1071', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (591, N'12*18', N'FIGO', N'Premium', N'3019 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (642, N'10*15', N'GNG', N'Premium', N'DOLPHIN L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (593, N'12*18', N'FIGO', N'Premium', N'30025 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (594, N'12*18', N'FIGO', N'Premium', N'10074 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (595, N'12*18', N'FIGO', N'Premium', N'3015 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (596, N'12*18', N'FIGO', N'Premium', N'70001 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (597, N'12*18', N'FIGO', N'Premium', N'BLACK GRANITE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (598, N'12*18', N'FIGO', N'Premium', N'RED GRANITE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (599, N'12*18', N'FIGO', N'Premium', N'PLAIN BLACK', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (600, N'12*18', N'FIGO', N'Premium', N'9082 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (601, N'12*18', N'FIGO', N'Premium', N'9093 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (602, N'12*18', N'FIGO', N'Premium', N'8068 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (603, N'12*18', N'FIGO', N'Premium', N'5002 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (604, N'12*18', N'sunshine', N'Premium', N'5011 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (605, N'12*18', N'FIGO', N'Premium', N'5004 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (606, N'12*18', N'FIGO', N'Premium', N'8030 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (607, N'12*18', N'GALAXY', N'Premium', N'11029 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (608, N'12*18', N'GALAXY', N'Premium', N'1055 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (609, N'12*18', N'sunshine', N'Premium', N'11001 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (610, N'12*18', N'sunshine', N'Premium', N'11013 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (611, N'12*18', N'GALAXY', N'Premium', N'10036 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (612, N'12*18', N'GALAXY', N'Premium', N'11015 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (613, N'12*18', N'GALAXY', N'Premium', N'11002 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (614, N'12*18', N'GALAXY', N'Premium', N'5097 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (615, N'12*18', N'GALAXY', N'Premium', N'F02 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (616, N'12*18', N'GALAXY', N'Premium', N'F03 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (617, N'10*15', N'GALAXY', N'Premium', N'18809 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (618, N'12*18', N'GALAXY', N'Premium', N'18811 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (619, N'12*18', N'GALAXY', N'Premium', N'18810 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (620, N'12*18', N'GALAXY', N'Premium', N'18813 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (621, N'12*18', N'GALAXY', N'Premium', N'18812 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (622, N'12*18', N'GALAXY', N'Premium', N'3069 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (623, N'12*18', N'GALAXY', N'Premium', N'849 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (624, N'12*18', N'GALAXY', N'Premium', N'18808 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (625, N'12*18', N'GALAXY', N'Premium', N'C7 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (626, N'12*18', N'GALAXY', N'Premium', N'851 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (627, N'12*18', N'GALAXY', N'Premium', N'18807 EL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (631, N'12*18', N'RBMS', N'Premium', N'1156 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (643, N'12*12', N'SGT', N'Premium', N'1086', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (644, N'10*15', N'GNG', N'Premium', N'1126 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (645, N'12*12', N'SGT', N'Premium', N'1050', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (646, N'10*15', N'GNG', N'Premium', N'1120 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (647, N'12*12', N'SGT', N'Premium', N'1002', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (648, N'10*15', N'GNG', N'Premium', N'1119 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (649, N'10*15', N'GNG', N'Premium', N'1022 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (650, N'12*12', N'SGT', N'Premium', N'1081', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (651, N'10*15', N'GNG', N'Premium', N'1031 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (652, N'10*15', N'GNG', N'Premium', N'1074 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (653, N'12*12', N'SGT', N'Premium', N'1011', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (654, N'12*12', N'SGT', N'Premium', N'1078', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (655, N'10*15', N'GNG', N'Premium', N'1082 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (656, N'12*12', N'SGT', N'Premium', N'1006', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (657, N'10*15', N'GNG', N'Premium', N'1138 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (658, N'10*15', N'GNG', N'Premium', N'1001 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (659, N'10*15', N'GNG', N'Premium', N'1125 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (660, N'10*15', N'GNG', N'Premium', N'1122 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (661, N'10*15', N'GNG', N'Premium', N'1132 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (662, N'12*12', N'SGT', N'Premium', N'1028', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (663, N'10*15', N'GNG', N'Premium', N'1028 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (664, N'12*12', N'SGT', N'Premium', N'1070', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (665, N'12*12', N'SGT', N'Premium', N'1004', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (666, N'12*18', N'GNG', N'Premium', N'11005 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (667, N'12*12', N'SGT', N'Premium', N'1021', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (668, N'12*18', N'GNG', N'Premium', N'8005 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (669, N'12*12', N'SGT', N'Premium', N'1005', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (670, N'12*18', N'GNG', N'Premium', N'3502 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (671, N'12*18', N'GNG', N'Premium', N'21009 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (672, N'12*18', N'GNG', N'Premium', N'8015 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (673, N'12*18', N'GNG', N'Premium', N'11004 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (674, N'12*18', N'GNG', N'Premium', N'8205 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (675, N'12*18', N'GNG', N'Premium', N'20024 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (676, N'12*18', N'GNG', N'Premium', N'8012 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (677, N'12*18', N'GNG', N'Premium', N'15028 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (678, N'12*18', N'GNG', N'Premium', N'1225 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (679, N'12*18', N'GNG', N'Premium', N'11043 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (680, N'12*18', N'GNG', N'Premium', N'18102 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (681, N'12*18', N'GNG', N'Premium', N'18061 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (682, N'12*18', N'GNG', N'Premium', N'1196 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (683, N'12*18', N'GNG', N'Premium', N'1195 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (684, N'12*18', N'GNG', N'Premium', N'5018 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (685, N'12*18', N'GNG', N'Premium', N'13026 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (686, N'12*18', N'GNG', N'Premium', N'18099 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (687, N'12*18', N'GNG', N'Premium', N'513 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (688, N'12*18', N'GNG', N'Premium', N'12046 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (689, N'12*18', N'GNG', N'Premium', N'1240 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (690, N'12*18', N'GNG', N'Premium', N'14012 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (691, N'12*18', N'GNG', N'Premium', N'12147 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (692, N'12*18', N'GNG', N'Premium', N'14006 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (693, N'12*18', N'GNG', N'Premium', N'14002 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (694, N'12*18', N'GNG', N'Premium', N'270 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (695, N'12*24', N'ATH', N'Premium', N'1003 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (696, N'12*24', N'ATH', N'Premium', N'1003 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (697, N'12*24', N'ATH', N'Premium', N'1003 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (698, N'12*24', N'ATH', N'Premium', N'1022 HL 2', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (699, N'12*24', N'ATH', N'Premium', N'1022 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (700, N'12*24', N'ATH', N'Premium', N'1025 HL2', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (701, N'12*24', N'ATH', N'Premium', N'1025 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (702, N'12*24', N'ATH', N'Premium', N'1106 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (703, N'12*24', N'ATH', N'Premium', N'1106 HL A', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (704, N'12*24', N'ATH', N'Premium', N'1106 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (705, N'12*24', N'ATH', N'Premium', N'1109 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (706, N'12*24', N'ATH', N'Premium', N'1109 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (707, N'12*24', N'ATH', N'Premium', N'1109 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (708, N'12*24', N'ATH', N'Premium', N'1129 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (709, N'12*24', N'ATH', N'Premium', N'1129 HL 1', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (710, N'12*24', N'ATH', N'Premium', N'1129 HL 3 NEW', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (711, N'12*24', N'ATH', N'Premium', N'1129 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (712, N'12*24', N'ATH', N'Premium', N'1142 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (713, N'12*24', N'ATH', N'Premium', N'1160 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (714, N'12*24', N'ATH', N'Premium', N'1160 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (715, N'12*24', N'ATH', N'Premium', N'1160 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (716, N'12*24', N'ATH', N'Premium', N'1166 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (717, N'12*24', N'ATH', N'Premium', N'1166 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (718, N'12*24', N'ATH', N'Premium', N'1171 HL 3', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (719, N'12*24', N'ATH', N'Premium', N'1173 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (720, N'12*24', N'ATH', N'Premium', N'1173 HL 2', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (721, N'12*24', N'ATH', N'Premium', N'1173 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (722, N'12*24', N'ATH', N'Premium', N'1179 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (723, N'12*24', N'ATH', N'Premium', N'1179 HL 1', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (724, N'12*24', N'ATH', N'Premium', N'1179 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (725, N'12*24', N'ATH', N'Premium', N'2527 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (726, N'12*24', N'ATH', N'Premium', N'2527 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (727, N'12*24', N'ATH', N'Premium', N'2527 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (728, N'12*24', N'ATH', N'Premium', N'2536 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (729, N'12*24', N'ATH', N'Premium', N'2566 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (730, N'12*24', N'ATH', N'Premium', N'2568 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (731, N'12*24', N'ATH', N'Premium', N'2570 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (732, N'12*24', N'ATH', N'Premium', N'2570 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (733, N'12*24', N'ATH', N'Premium', N'2575 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (734, N'12*24', N'ATH', N'Premium', N'2575 HL 1', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (735, N'12*24', N'ATH', N'Premium', N'2575 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (736, N'12*24', N'ATH', N'Premium', N'2608 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (737, N'12*24', N'ATH', N'Premium', N'2608 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (738, N'12*24', N'ATH', N'Premium', N'2608 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (739, N'12*24', N'ATH', N'Premium', N'2644 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (740, N'12*24', N'ATH', N'Premium', N'2644 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (742, N'12*24', N'ATH', N'Premium', N'506 HL 2', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (743, N'12*24', N'ATH', N'Premium', N'506 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (744, N'12*24', N'ATH', N'Premium', N'COBBAIT BLUE HL 1', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (745, N'12*24', N'ATH', N'Premium', N'COBBAIT BLUE HL 2', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (746, N'12*24', N'ATH', N'Premium', N'COBBAIT BLUE  L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (747, N'12*24', N'ATH', N'Premium', N'MADERA AMRILO HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (748, N'12*24', N'ATH', N'Premium', N'MADERA AMRILO L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (749, N'12*24', N'ATH', N'Premium', N'OLIVE WOOD  D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (750, N'12*24', N'ATH', N'Premium', N'OLIVE WOOD HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (751, N'12*24', N'ATH', N'Premium', N'OLIVE WOOD L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (752, N'12*24', N'ATH', N'Premium', N'1051 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (753, N'12*24', N'ATH', N'Premium', N'1051 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (754, N'12*24', N'ATH', N'Premium', N'1051 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (755, N'12*24', N'ATH', N'Premium', N'1078 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (756, N'12*24', N'ATH', N'Premium', N'1078 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (757, N'12*24', N'ATH', N'Premium', N'1107 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (758, N'12*24', N'ATH', N'Premium', N'1107 HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (759, N'12*24', N'ATH', N'Premium', N'1107 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (760, N'12*24', N'ATH', N'Premium', N'1108 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (761, N'12*24', N'ATH', N'Premium', N'1110 D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (762, N'12*24', N'ATH', N'Premium', N'2536 L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (763, N'12*24', N'ATH', N'Premium', N'1142 HL 3', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1027, N'2*4', N'ATH GVT', N'Premium', N'Burma Bronze Wood', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1028, N'2*4', N'ATH GVT', N'Premium', N'Onyx Beige', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1029, N'2*4', N'ATH GVT', N'Premium', N'Botticino Crema', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1030, N'2*4', N'ATH GVT', N'Premium', N'Pisceis Beige', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1031, N'2*4', N'ATH GVT', N'Premium', N'New Travel Tino Beige Punch', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1032, N'2*4', N'ATH GVT', N'Premium', N'New Travel Tino Brown Punch', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1033, N'2*4', N'ATH GVT', N'Premium', N'Burma rose Wood', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1034, N'2*4', N'ATH GVT', N'Premium', N'Country Wood', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1054, N'16*16', N'ATC', N'Premium', N'2801', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1055, N'16*16', N'ATC', N'Premium', N'104', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1056, N'16*16', N'ATC', N'Premium', N'2014', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (764, N'12*24', N'MTH', N'Premium', N'ANGEL BRISK - HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (765, N'12*24', N'MTH', N'Premium', N'ANGEL BRISK -L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (766, N'12*24', N'MTH', N'Premium', N'APPLE BLACK', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (767, N'12*24', N'MTH', N'Premium', N'APPLE EDGE -L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (768, N'12*24', N'MTH', N'Premium', N'APPLE ROYAL LIST - HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (769, N'12*24', N'MTH', N'Premium', N'ARAAVALI TBL -D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (770, N'12*24', N'MTH', N'Premium', N'ARAAVALI TBL - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (771, N'12*24', N'MTH', N'Premium', N'ASTRAL EDGE -L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (772, N'12*24', N'MTH', N'Premium', N'ASTRAL  FLOWER -HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (773, N'12*24', N'MTH', N'Premium', N'BLACK MATT STEP', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (774, N'12*24', N'MTH', N'Premium', N'BROWN MATT STEP', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (775, N'12*24', N'MTH', N'Premium', N'BRUNO -D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (776, N'12*24', N'MTH', N'Premium', N'BRUNO - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (777, N'12*24', N'MTH', N'Premium', N'BRUNO ROYAL -HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (778, N'12*24', N'MTH', N'Premium', N'CREMONA ARCH - HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (779, N'12*24', N'MTH', N'Premium', N'CREMONA TBL - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (780, N'12*24', N'MTH', N'Premium', N'EVA EDGE - D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (781, N'12*24', N'MTH', N'Premium', N'EVA EDGE - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (782, N'12*24', N'MTH', N'Premium', N'EVA FLOWER - HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (783, N'12*24', N'MTH', N'Premium', N'FABIO TB LINE - D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (784, N'12*24', N'MTH', N'Premium', N'FABIO - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (785, N'12*24', N'MTH', N'Premium', N'IVORY MATT STEP', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (786, N'12*24', N'MTH', N'Premium', N'KATHAK -D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (787, N'12*24', N'MTH', N'Premium', N'KATHAK -L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (788, N'12*24', N'MTH', N'Premium', N'KATHAK - HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (789, N'12*24', N'MTH', N'Premium', N'LUSAN -D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (790, N'12*24', N'MTH', N'Premium', N'LUSAN - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (791, N'12*12', N'FIGO', N'Premium', N'1045', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (792, N'12*24', N'MTH', N'Premium', N'MARIMO EDGE', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (793, N'12*12', N'FIGO', N'Premium', N'12028', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (794, N'12*12', N'FIGO', N'Premium', N'1015', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (795, N'12*24', N'MTH', N'Premium', N'PEARL MARFIL -D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (796, N'12*12', N'FIGO', N'Premium', N'1096 L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (797, N'12*24', N'MTH', N'Premium', N'PEARL MARFIL -L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (798, N'12*12', N'FIGO', N'Premium', N'1096 D', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (799, N'12*24', N'MTH', N'Premium', N'ROYAL WOOD STEP - D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (800, N'12*12', N'FIGO', N'Premium', N'12014', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (801, N'12*12', N'FIGO', N'Premium', N'1075', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (802, N'12*24', N'MTH', N'Premium', N'ROYAL WOOD STEP - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (803, N'12*12', N'FIGO', N'Premium', N'12072', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (804, N'12*24', N'MTH', N'Premium', N'SARENA - D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (805, N'12*12', N'FIGO', N'Premium', N'12074', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (806, N'12*12', N'FIGO', N'Premium', N'PLAIN WHITE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (807, N'12*24', N'MTH', N'Premium', N'SARENA  - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (808, N'12*12', N'FIGO', N'Premium', N'PLAIN IVORY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (809, N'12*24', N'MTH', N'Premium', N'TRAVENTINO CRECK MATT', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (810, N'12*24', N'MTH', N'Premium', N'TRAVIA EDGE - D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (811, N'12*12', N'ATC', N'Premium', N'20003', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (812, N'12*12', N'ATC', N'Premium', N'2402', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (813, N'12*12', N'ATC', N'Premium', N'1021', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (814, N'12*24', N'MTH', N'Premium', N'TRAVIA EDGE - HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (815, N'12*12', N'ATC', N'Premium', N'2203', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (816, N'12*12', N'ATC', N'Premium', N'1106', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (817, N'12*12', N'ATC', N'Premium', N'1015', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (818, N'12*24', N'MTH', N'Premium', N'TRISTA TBL -D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (819, N'12*12', N'ATC', N'Premium', N'2004', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (820, N'12*12', N'ATC', N'Premium', N'1024', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (821, N'12*24', N'MTH', N'Premium', N'TRISTA TBL -L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (822, N'12*12', N'ATC', N'Premium', N'3301', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (823, N'12*24', N'MTH', N'Premium', N'UBANA TB LINE - D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (824, N'12*12', N'ATC', N'Premium', N'1302', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (825, N'12*24', N'MTH', N'Premium', N'UBANA TB LINE - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (826, N'12*12', N'ATC', N'Premium', N'2402', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (827, N'12*12', N'ATC', N'Premium', N'1901', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (828, N'12*24', N'MTH', N'Premium', N'VICTORIA - HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (829, N'12*24', N'MTH', N'Premium', N'VICTORIA - L', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (830, N'12*24', N'MTH', N'Premium', N'WHITE CRECK MATT', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (831, N'12*24', N'MTH', N'Premium', N'White  Matt STEP', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (832, N'12*24', N'MTH', N'Premium', N'WHITE TB LINE MATT', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (833, N'12*24', N'MTH', N'Premium', N'LUSAN - HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (834, N'12*24', N'MTH', N'Premium', N'ROCK WOOD', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (835, N'12*24', N'MTH', N'Premium', N'TURKEY WOOD', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (836, N'12*12', N'ATC', N'Premium', N'WHITE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (837, N'12*24', N'MTH', N'Premium', N'TURKEY WOOD WHITE', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (838, N'12*12', N'ATC', N'Premium', N'AS WHITE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (839, N'12*12', N'ATC', N'Premium', N'IVORY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (840, N'12*24', N'MTH', N'Premium', N'CREMONA TBL - D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (841, N'12*12', N'ATC', N'Premium', N'AS IVORY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (842, N'12*12', N'ATC', N'Premium', N'GREY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (843, N'12*24', N'MTH', N'Premium', N'KAABIL TRACK -D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (844, N'12*12', N'ATC', N'Premium', N'AS GREY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (845, N'12*24', N'MTH', N'Premium', N'KAABIL TRACK -L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (846, N'12*12', N'ATC', N'Premium', N'PINK', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (847, N'12*12', N'ATC', N'Premium', N'AS PINK', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (848, N'12*12', N'ATC', N'Premium', N'BLACK', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (849, N'12*24', N'MTH', N'Premium', N'NEXUS JUTE -HL 4', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (850, N'12*12', N'ATC', N'Premium', N'AS BLACK', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (851, N'12*12', N'ATC', N'Premium', N'COPPER CLOUDY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (852, N'12*24', N'MTH', N'Premium', N'NEXUS JUTE -L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (853, N'12*12', N'ATC', N'Premium', N'AS COPPER CLOUDY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (854, N'12*12', N'ATC', N'Premium', N'MAGENTA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (855, N'12*24', N'MTH', N'Premium', N'Lime Guesto -D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (856, N'12*12', N'ATC', N'Premium', N'AS MAGENTA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (857, N'12*12', N'ATC', N'Premium', N'GREEN', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (858, N'12*12', N'ATC', N'Premium', N'AS GREEN', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (859, N'12*12', N'ATC', N'Premium', N'SKY BLUE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (860, N'12*12', N'ATC', N'Premium', N'AS SKY BLUE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (861, N'12*24', N'MTH', N'Premium', N'Lime Track - HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (862, N'12*12', N'ATC', N'Premium', N'ALP BLUE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (863, N'12*12', N'ATC', N'Premium', N'AS ALPINE BLUE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (864, N'12*24', N'MTH', N'Premium', N'Redon Guesto -D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (865, N'12*24', N'MTH', N'Premium', N'Redon Guesto -L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (866, N'12*12', N'ATC', N'Premium', N'STEP IVORY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (867, N'12*24', N'MTH', N'Premium', N'Redon Track - HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (868, N'12*12', N'ATC', N'Premium', N'STEP TERRACOTA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (869, N'12*12', N'ATC', N'Premium', N'WAVE IVORY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (870, N'12*24', N'MTH', N'Premium', N'Sandle Guesto -L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (871, N'12*12', N'ATC', N'Premium', N'WAVE TERACOTTA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (872, N'12*24', N'MTH', N'Premium', N'Sandle Guesto -HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (873, N'12*12', N'ATC', N'Premium', N'STONE IVORY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (874, N'12*12', N'ATC', N'Premium', N'STONE TERRACOTTA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (875, N'12*24', N'MTH', N'Premium', N'FLOREY - D', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (876, N'12*12', N'ATC', N'Premium', N'COIN IVORY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (877, N'12*24', N'MTH', N'Premium', N'FLOREY - HL 1', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (878, N'12*12', N'ATC', N'Premium', N'COIN TERRACOTTA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (879, N'12*24', N'MTH', N'Premium', N'FLOREY - HL 2', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (880, N'12*12', N'ATC', N'Premium', N'CHEKER IVORY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (881, N'12*12', N'ATC', N'Premium', N'CHEKKER TERRA COTA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (882, N'12*12', N'ATC', N'Premium', N'REVLON', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (888, N'12*24', N'MTH', N'Premium', N'FLOREY - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (884, N'12*12', N'ATC', N'Premium', N'REVLON TERRACOTTA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (885, N'16*16', N'ATC', N'Premium', N'WHITE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (886, N'16*16', N'ATC', N'Premium', N'IVORY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (887, N'16*16', N'ATC', N'Premium', N'COPPER CLOUDY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (889, N'12*24', N'MTH', N'Premium', N'COL - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (890, N'12*24', N'MTH', N'Premium', N'COL LINE -HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (891, N'12*24', N'MTH', N'Premium', N'HUGO - HL1', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (892, N'12*24', N'MTH', N'Premium', N'HUGO - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (893, N'12*24', N'MTH', N'Premium', N'Plazma Guesto -L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (894, N'12*24', N'MTH', N'Premium', N'Plazma Track - HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (895, N'12*24', N'MTH', N'Premium', N'Twin Guesto - L', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (896, N'12*24', N'MTH', N'Premium', N'Twin Track - HL', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (897, N'12*24', N'MTH', N'Premium', N'White Guesto Matt', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (898, N'12*24', N'MTH', N'Premium', N'White Track Matt', N'PCS', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (899, N'2*2', N'ATC GVT', N'Premium', N'TURKEY SNOW', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (900, N'10*15', N'ATC GVT', N'Premium', N'HD 124', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (901, N'2*2', N'ATC GVT', N'Premium', N'HD 124', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (902, N'2*2', N'ATC GVT', N'Premium', N'HD 02', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (903, N'2*2', N'ATH DC', N'Premium', N'P . ALICE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (904, N'2*2', N'ATC GVT', N'Premium', N'HD 198', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (905, N'2*2', N'ATC GVT', N'Premium', N'HD 112', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (906, N'2*2', N'ATC GVT', N'Premium', N'HD 06', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (907, N'2*2', N'ATC GVT', N'Premium', N'HD 90', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (908, N'2*2', N'ATC GVT', N'Premium', N'HD 225', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (909, N'2*2', N'ATC GVT', N'Premium', N'HD 42', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (910, N'2*2', N'ATC GVT', N'Premium', N'HD 24', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (911, N'2*2', N'ATC GVT', N'Premium', N'UBANA BEIGE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (912, N'2*2', N'ATC GVT', N'Premium', N'SLINE MAPPLE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (913, N'2*2', N'ATC GVT', N'Premium', N'YAMINI CREMA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (914, N'2*2', N'ATC GVT', N'Premium', N'STARK BEIGE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (915, N'2*2', N'ATC GVT', N'Premium', N'STARK BRISK', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (916, N'2*2', N'ATC DC', N'Premium', N'LINEAR YELLOW', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (917, N'2*2', N'ATC DC', N'Premium', N'CLASIC LIVA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (918, N'2*2', N'ATC DC', N'Premium', N'LINEAR WHITE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (919, N'2*2', N'ATH DC', N'Premium', N'P . ALICE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (920, N'2*2', N'ATC DC', N'Premium', N'LINEAR CREMA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (921, N'2*2', N'ATC DC', N'Premium', N'LINEAR PINK', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (922, N'2*2', N'ATH DC', N'Premium', N'P. WHITE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (923, N'2*2', N'ATC DC', N'Premium', N'LINEAR BLACK', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (924, N'2*2', N'ATC DC', N'Premium', N'LINEAR BROWN', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (925, N'2*2', N'ATH DC', N'Premium', N'PEARL BEIEGE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (926, N'2*2', N'ATC NANO', N'Premium', N'IVORY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (927, N'2*2', N'ATH NANO', N'Premium', N'1300', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (939, N'2*2', N'ATC NANO', N'Premium', N'PLAIN WOOD', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (940, N'2*2', N'ATC NANO', N'Premium', N'1031', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (930, N'2*2', N'ATC NANO', N'Premium', N'PICASSO', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (931, N'2*2', N'ATC NANO', N'Premium', N'SIGOVIA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (932, N'2*2', N'ATC NANO', N'Premium', N'1078', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (933, N'2*2', N'ATC NANO', N'Premium', N'1015', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (934, N'2*2', N'ATC NANO', N'Premium', N'PARADISE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (935, N'2*2', N'ATC NANO', N'Premium', N'1021', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (936, N'2*2', N'ATC NANO', N'Premium', N'1021', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (937, N'2*2', N'ATC NANO', N'Premium', N'1078', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (938, N'2*2', N'ATC NANO', N'Premium', N'1016', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (941, N'2*2', N'ATC GVT', N'Premium', N'1073', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (942, N'2*2', N'ATC NANO', N'Premium', N'1073', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (943, N'2*2', N'ATC NANO', N'Premium', N'1024', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (944, N'2*2', N'ATC NANO', N'Premium', N'PARRY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (945, N'2*2', N'ATC NANO', N'Premium', N'1012', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (946, N'10*15', N'ATC NANO', N'Premium', N'1031', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (947, N'2*2', N'ATC NANO', N'Premium', N'1031', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (948, N'2*2', N'ATC NANO', N'Premium', N'PUMA', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (949, N'2*2', N'ATC PD', N'Premium', N'1073', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (950, N'2*2', N'ATH NANO', N'Premium', N'1301', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (951, N'2*2', N'ATC PD', N'Premium', N'171', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (952, N'2*2', N'ATH NANO', N'Premium', N'1303', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (953, N'2*2', N'ATC PD', N'Premium', N'129', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (954, N'2*2', N'ATH NANO', N'Premium', N'1307', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (955, N'2*2', N'ATC PD', N'Premium', N'1056', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (956, N'2*2', N'ATH NANO', N'Premium', N'1309', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (957, N'2*2', N'ATC PD', N'Premium', N'148', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (958, N'2*2', N'ATH NANO', N'Premium', N'PEARL IVORY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (959, N'2*2', N'ATH NANO', N'Premium', N'340 PRIME', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (960, N'2*2', N'ATH NANO', N'Premium', N'341 PRIME', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (961, N'2*2', N'ATC PD', N'Premium', N'1002', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (962, N'2*2', N'ATH GVT', N'Premium', N'HD 108', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (963, N'2*2', N'ATH GVT', N'Premium', N'HD 110', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (964, N'2*2', N'ATH GVT', N'Premium', N'HD 122', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (965, N'2*2', N'ATH GVT', N'Premium', N'HD 142', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (966, N'2*2', N'ATH GVT', N'Premium', N'HD 142', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (967, N'2*2', N'ATH GVT', N'Premium', N'HD 173', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (968, N'2*2', N'ATH GVT', N'Premium', N'HD 175', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (969, N'2*2', N'ATH GVT', N'Premium', N'HD 240', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (970, N'2*2', N'ATH GVT', N'Premium', N'HD 252', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (971, N'2*2', N'ATH GVT', N'Premium', N'HD 135', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (972, N'2*2', N'ATH GVT', N'Premium', N'HD 187', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (973, N'2*2', N'ATC PD', N'Premium', N'1056', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (974, N'2*2', N'ATH GVT', N'Premium', N'HD 188', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (975, N'2*2', N'ATC PD', N'Premium', N'1081', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (976, N'2*2', N'ATH GVT', N'Premium', N'HD 189', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (977, N'2*2', N'ATC PD', N'Premium', N'727', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (978, N'2*2', N'ATH GVT', N'Premium', N'HD 190', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (979, N'2*2', N'ATH GVT', N'Premium', N'HD 191', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (980, N'2*2', N'ATC PD', N'Premium', N'1070', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (981, N'2*2', N'ATH GVT', N'Premium', N'HD 39', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (982, N'2*2', N'ATC PD', N'Premium', N'791', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (983, N'2*2', N'ATH GVT', N'Premium', N'Metro onyx', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (984, N'2*2', N'ATC PD', N'Premium', N'11005', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (985, N'2*2', N'ATH GVT', N'Premium', N'Pine Brown', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (986, N'2*2', N'ATC PD', N'Premium', N'1104', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (987, N'2*2', N'ATH GVT', N'Premium', N'HD 185', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (988, N'2*2', N'ATC PD', N'Premium', N'11007', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (989, N'2*2', N'ATH GVT', N'Premium', N'Adagio Bianco', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (990, N'12*12', N'ATC PD', N'Premium', N'10001', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (991, N'2*2', N'ATC PD', N'Premium', N'140', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (992, N'2*2', N'ATC PD', N'Premium', N'10002', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (993, N'2*2', N'ATH DC', N'Premium', N'PEARL CHOCO', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (994, N'2*2', N'ATH DC', N'Premium', N'PEARL BLACK', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (995, N'32*32', N'ATH GVT', N'Premium', N'OMAXE IVORY', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (996, N'32*32', N'ATH GVT', N'Premium', N'OPERA BEIGE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (997, N'32*32', N'ATH GVT', N'Premium', N'SOUT VENTINO', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (998, N'32*32', N'ATH GVT', N'Premium', N'TRAVENTINO NATURAL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (999, N'32*32', N'ATH GVT', N'Premium', N'BENITO BEIGE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1000, N'32*32', N'ATH GVT', N'Premium', N'ITALICO TRANI', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1001, N'32*32', N'ATH GVT', N'Premium', N'DIANA BEIGE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1002, N'32*32', N'ATH GVT', N'Premium', N'GRANI TRAVENTINE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1003, N'32*32', N'ATH GVT', N'Premium', N'VANICIA MARFIL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1004, N'32*32', N'ATH DC', N'Premium', N'Pearl beige', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1005, N'32*32', N'ATH DC', N'Premium', N'PEARL CHOCO', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1006, N'32*32', N'ATH DC', N'Premium', N'Pearl Brown', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1007, N'32*32', N'ATH DC', N'Premium', N'Pearl White -32*32', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1008, N'2*4', N'ATH GVT', N'Premium', N'BRISK BOTTOCHINO', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1009, N'2*4', N'ATH GVT', N'Premium', N'DIANA BROWN', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1010, N'2*4', N'ATH GVT', N'Premium', N'HD 240', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1011, N'2*4', N'ATH GVT', N'Premium', N'ELEGANCE LIGHT', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1012, N'2*4', N'ATH GVT', N'Premium', N'EMPRA DOR BROWN', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1013, N'2*4', N'ATH GVT', N'Premium', N'GOLDEN EDGE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1014, N'2*4', N'ATH GVT', N'Premium', N'MARFIL BEIGE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1015, N'2*4', N'ATH GVT', N'Premium', N'MORACCO  WHITE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1016, N'2*4', N'ATH GVT', N'Premium', N'MARVEL BEIGE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1017, N'2*4', N'ATH GVT', N'Premium', N'SPANISH TRAVETINO', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1018, N'2*4', N'ATH GVT', N'Premium', N'TOUCH WOOD', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1019, N'2*4', N'ATH GVT', N'Premium', N'TRAVEN TINO', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1020, N'2*4', N'ATH GVT', N'Premium', N'WHITE  2*4', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1021, N'2*4', N'ATH GVT', N'Premium', N'ZEBRANO BROWN', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1022, N'2*4', N'ATH GVT', N'Premium', N'ZENITH BEIGE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1023, N'2*4', N'ATH GVT', N'Premium', N'CRISTA VADE', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1024, N'2*4', N'ATH GVT', N'Premium', N'SICILIYA MARVEL', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1025, N'2*4', N'ATH GVT', N'Premium', N'MURBO ONYX', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1026, N'2*4', N'ATH GVT', N'Premium', N'TRAVENTINO GOLD', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1035, N'16*16', N'ATC', N'Premium', N'2813', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1036, N'16*16', N'ATC', N'Premium', N'225', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1037, N'16*16', N'ATC', N'Premium', N'2372', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1038, N'16*16', N'ATC', N'Premium', N'202', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1039, N'16*16', N'ATC', N'Premium', N'2331', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1041, N'16*16', N'ATC', N'Premium', N'2303', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1042, N'16*16', N'ATC', N'Premium', N'2373', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1043, N'16*16', N'ATC', N'Premium', N'2036 A', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1044, N'16*16', N'ATC', N'Premium', N'2323', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1045, N'16*16', N'ATC', N'Premium', N'2374', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1046, N'16*16', N'ATC', N'Premium', N'2036 B', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1047, N'16*16', N'ATC', N'Premium', N'2371', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1048, N'16*16', N'ATC', N'Premium', N'2360', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1049, N'16*16', N'ATC', N'Premium', N'2352', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1050, N'16*16', N'ATC', N'Premium', N'7000', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1051, N'16*16', N'ATC', N'Premium', N'1001', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1052, N'16*16', N'ATC', N'Premium', N'2815', N'Box', 0)
GO
INSERT [dbo].[tbl_product_master] ([id], [size], [c_name], [p_type], [p_code], [unit], [min_stock]) VALUES (1053, N'16*16', N'ATC', N'Premium', N'2801', N'Box', 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_product_master] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_size_master] ON 

GO
INSERT [dbo].[tbl_size_master] ([id], [size]) VALUES (3, N'12*18')
GO
INSERT [dbo].[tbl_size_master] ([id], [size]) VALUES (4, N'12*24')
GO
INSERT [dbo].[tbl_size_master] ([id], [size]) VALUES (5, N'2*2')
GO
INSERT [dbo].[tbl_size_master] ([id], [size]) VALUES (6, N'32*32')
GO
INSERT [dbo].[tbl_size_master] ([id], [size]) VALUES (7, N'2*4')
GO
INSERT [dbo].[tbl_size_master] ([id], [size]) VALUES (8, N'16*16')
GO
INSERT [dbo].[tbl_size_master] ([id], [size]) VALUES (9, N'10*15')
GO
INSERT [dbo].[tbl_size_master] ([id], [size]) VALUES (10, N'12*12')
GO
SET IDENTITY_INSERT [dbo].[tbl_size_master] OFF
GO
SET IDENTITY_INSERT [dbo].[user_master] ON 

GO
INSERT [dbo].[user_master] ([id], [user_id], [name], [contact_no], [email_id], [password], [type], [status], [date], [created_by], [operation]) VALUES (1, N'admin', N'admin', N'', N'', N'123', N'Administrator', N'Active', NULL, NULL, N'')
GO
SET IDENTITY_INSERT [dbo].[user_master] OFF
GO

