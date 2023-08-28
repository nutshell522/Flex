/****** Object:  Table [dbo].[Activities]    Script Date: 2023/8/26 上午 11:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[ActivityId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityName] [nvarchar](50) NOT NULL,
	[fk_ActivityCategoryId] [int] NOT NULL,
	[ActivityDate] [datetime] NOT NULL,
	[fk_SpeakerId] [int] NOT NULL,
	[ActivityPlace] [nvarchar](100) NOT NULL,
	[ActivityBookStartTime] [datetime] NOT NULL,
	[ActivityBookEndTime] [datetime] NOT NULL,
	[ActivityAge] [tinyint] NOT NULL,
	[ActivitySalePrice] [int] NOT NULL,
	[ActivityOriginalPrice] [int] NOT NULL,
	[ActivityDescription] [nvarchar](300) NULL,
	[fk_ActivityStatusId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityCategories]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityCategories](
	[ActivityCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityCategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 2023/8/27 下午 10:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[PublishTime] [datetime] NULL,
	[Author] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityImg]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityImg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[fk_ActivityId] [int] NOT NULL,
	[ImgPath] [nvarchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityStatuses]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityStatuses](
	[ActivityStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityStatusDescription] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlternateAddresses]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlternateAddresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AlternateAddress1] [nvarchar](300) NULL,
	[AlternateAddress2] [nvarchar](300) NULL,
	[fk_MemberId] [int] NULL,
 CONSTRAINT [PK__Alternat__091C2AFBD3B2ED1E] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlackLists]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlackLists](
	[BlackListId] [int] IDENTITY(1,1) NOT NULL,
	[Behavior] [nvarchar](30) NOT NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK__BlackLis__B54E3C740D440FFD] PRIMARY KEY CLUSTERED 
(
	[BlackListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[BranchId] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [nvarchar](50) NOT NULL,
	[BranchAddress] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemId] [int] IDENTITY(1,1) NOT NULL,
	[fk_CardId] [int] NOT NULL,
	[fk_ProductId] [int] NOT NULL,
	[Description] [nvarchar](700) NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[CartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ColorCategories]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColorCategories](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ColorCategory] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouponCategories]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponCategories](
	[CouponCategoryId] [int] NOT NULL,
	[CouponCategoryName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_coupon_category] PRIMARY KEY CLUSTERED 
(
	[CouponCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[CouponId] [int] IDENTITY(1,1) NOT NULL,
	[fk_CouponCategoryId] [int] NOT NULL,
	[CouponName] [nvarchar](50) NOT NULL,
	[CouponDescription] [nvarchar](100) NULL,
	[CouponCode] [nvarchar](50) NULL,
	[MinimumPurchaseAmount] [int] NOT NULL,
	[DiscountType] [int] NOT NULL,
	[DiscountValue] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndType] [bit] NULL,
	[EndDays] [int] NULL,
	[EndDate] [datetime] NULL,
	[PersonMaxUsage] [int] NULL,
	[RequirementType] [int] NULL,
	[Requirement] [int] NULL,
	[fk_RequiredProjectTagID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouponSendings]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponSendings](
	[SendingId] [int] IDENTITY(1,1) NOT NULL,
	[fk_CouponId] [int] NOT NULL,
	[fk_MemberId] [int] NULL,
	[SentDate] [datetime] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[RedemptionStatus] [bit] NOT NULL,
	[RedeemedDate] [datetime] NULL,
 CONSTRAINT [PK_CouponSending] PRIMARY KEY CLUSTERED 
(
	[SendingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customized_materials]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customized_materials](
	[Shoesmaterial_Id] [int] IDENTITY(1,1) NOT NULL,
	[material_Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Shoesmaterial_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomizedOrders]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomizedOrders](
	[Customized_Id] [int] IDENTITY(1,1) NOT NULL,
	[Customized_number] [varchar](6000) NOT NULL,
	[Customized_Shoes_Id] [int] NULL,
	[Fk_ForMemberCustomized_Id] [int] NULL,
	[Customized_Eyelet] [int] NULL,
	[Customized_EdgeProtection] [int] NULL,
	[Customized_Rear] [int] NULL,
	[Customized_Tongue] [int] NULL,
	[Customized_Toe] [int] NULL,
	[Remark] [nvarchar](254) NULL,
	[OrderCreateTime] [datetime] NULL,
	[OrderEditTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Customized_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomizedShoesPo]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomizedShoesPo](
	[ShoesProductId] [int] IDENTITY(1,1) NOT NULL,
	[ShoesName] [nvarchar](254) NOT NULL,
	[ShoesDescription] [nvarchar](254) NULL,
	[ShoesOrigin] [nvarchar](50) NULL,
	[ShoesUnitPrice] [int] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[fk_ShoesCategoryId] [int] NULL,
	[fk_ShoesColorId] [int] NULL,
	[DataCreateTime] [datetime] NOT NULL,
	[DataEditTime] [datetime] NOT NULL,
 CONSTRAINT [PK__Customiz__D7D2FD91792B994F] PRIMARY KEY CLUSTERED 
(
	[ShoesProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
 CONSTRAINT [PK__Departme__B2079BED023F95C3] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountName] [nvarchar](20) NOT NULL,
	[DiscountDescription] [nvarchar](100) NULL,
	[fk_ProjectTagId] [int] NULL,
	[DiscountType] [int] NOT NULL,
	[DiscountValue] [int] NOT NULL,
	[ConditionType] [int] NOT NULL,
	[ConditionValue] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[OrderBy] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EcpayOrders]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EcpayOrders](
	[MerchantTradeNo] [nvarchar](50) NOT NULL,
	[MemberID] [int] NOT NULL,
	[RtnCode] [int] NULL,
	[RtnMsg] [nvarchar](50) NULL,
	[TradeNo] [nvarchar](50) NULL,
	[TradeAmt] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentType] [nvarchar](50) NULL,
	[PaymentTypeChargeFee] [nvarchar](50) NULL,
	[TradeDate] [nvarchar](50) NULL,
	[SimulatePaid] [int] NULL,
	[TradeDesc] [nvarchar](300) NULL,
	[ItemId] [int] NULL,
	[fk_typeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MerchantTradeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[fk_productId] [varchar](254) NOT NULL,
	[fk_memberId] [int] NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitles]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitles](
	[TitleId] [int] IDENTITY(1,1) NOT NULL,
	[TitleName] [nvarchar](50) NULL,
	[fk_StaffPermissions] [int] NULL,
 CONSTRAINT [PK__JobTitle__75758986DFA010AD] PRIMARY KEY CLUSTERED 
(
	[TitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logistics_companies]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logistics_companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[tel] [varchar](12) NULL,
	[logistics_description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberImg]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberImg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[fk_memberId] [int] NOT NULL,
	[ImgPath] [nvarchar](254) NOT NULL,
 CONSTRAINT [PK_MemberImg] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberPoints]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPoints](
	[MemberPointsId] [int] IDENTITY(1,1) NOT NULL,
	[PointSubtotal] [int] NOT NULL,
	[fk_MemberId] [int] NOT NULL,
 CONSTRAINT [PK__MemberPo__8D672C97D8EFE351] PRIMARY KEY CLUSTERED 
(
	[MemberPointsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Age] [tinyint] NULL,
	[Gender] [bit] NULL,
	[Mobile] [varchar](10) NOT NULL,
	[Email] [nvarchar](300) NOT NULL,
	[Birthday] [date] NULL,
	[CommonAddress] [nvarchar](100) NULL,
	[Account] [varchar](30) NOT NULL,
	[EncryptedPassword] [varchar](70) NOT NULL,
	[Registration] [datetime] NULL,
	[IsConfirmed] [bit] NULL,
	[ConfirmCode] [varchar](50) NULL,
	[IsSubscribeNews] [bit] NULL,
	[fk_LevelId] [int] NOT NULL,
	[fk_BlackListId] [int] NULL,
 CONSTRAINT [PK__Members__0CF04B18BDECE389] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembershipLevelPrivileges]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipLevelPrivileges](
	[fk_LevelId] [int] NOT NULL,
	[fk_PrivilegeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fk_LevelId] ASC,
	[fk_PrivilegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembershipLevels]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipLevels](
	[LevelId] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](10) NOT NULL,
	[MinSpending] [varchar](30) NOT NULL,
	[Discount] [int] NULL,
	[Description] [nvarchar](300) NULL,
 CONSTRAINT [PK__Membersh__09F03C26F7CA5148] PRIMARY KEY CLUSTERED 
(
	[LevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OneToOneReservations]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OneToOneReservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[fk_BookerId] [int] NOT NULL,
	[ReservationStartTime] [datetime] NOT NULL,
	[ReservationEndTime] [datetime] NOT NULL,
	[fk_BranchId] [int] NOT NULL,
	[fk_ReservationSpeakerId] [int] NOT NULL,
	[fk_ReservationStatusId] [int] NOT NULL,
	[ReservationCreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_statuses]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[order_status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderItems]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[order_Id] [int] NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[per_price] [int] NULL,
	[quantity] [int] NULL,
	[discount_name] [nvarchar](50) NULL,
	[subtotal] [int] NULL,
	[discount_subtotal] [int] NULL,
	[Items_description] [nvarchar](50) NULL,
	[fk_typeId] [int] NULL,
	[productcommit] [int] NULL,
	[comment] [bit] NULL,
 CONSTRAINT [PK__orderIte__3214EC0749CD6A99] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ordertime] [datetime] NOT NULL,
	[fk_member_Id] [int] NOT NULL,
	[total_quantity] [int] NOT NULL,
	[logistics_company_Id] [int] NULL,
	[order_status_Id] [int] NOT NULL,
	[pay_method_Id] [int] NOT NULL,
	[pay_status_Id] [int] NOT NULL,
	[coupon_name] [nvarchar](50) NULL,
	[coupon_discount] [int] NULL,
	[freight] [int] NULL,
	[cellphone] [varchar](12) NOT NULL,
	[receipt] [varchar](50) NULL,
	[receiver] [nvarchar](50) NULL,
	[recipient_address] [nvarchar](50) NULL,
	[order_description] [nvarchar](50) NULL,
	[total_price] [int] NOT NULL,
	[close] [bit] NULL,
	[close_time] [datetime] NULL,
	[fk_typeId] [int] NULL,
	[orderCode] [nvarchar](50) NULL,
	[biller] [nvarchar](50) NULL,
	[bill_address] [nvarchar](50) NULL,
	[bill_cellphone] [varchar](50) NULL,
	[agreement] [bit] NULL,
 CONSTRAINT [PK__orders__3214EC0762A71CC1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pay_methods]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pay_methods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[pay_method] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pay_statuses]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pay_statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[pay_status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointHistories]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointHistories](
	[PointHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[GetOrDeduct] [bit] NOT NULL,
	[UsageAmount] [int] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[fk_MemberId] [int] NULL,
	[fk_OrderId] [int] NULL,
	[fk_TypeId] [int] NULL,
	[fk_MemberPointsId] [int] NULL,
 CONSTRAINT [PK__PointHis__DBE13F178E6B8343] PRIMARY KEY CLUSTERED 
(
	[PointHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointManage]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointManage](
	[PointManageId] [int] IDENTITY(1,1) NOT NULL,
	[GetOrDeduct] [bit] NOT NULL,
	[Amount] [int] NOT NULL,
	[fk_TypeId] [int] NOT NULL,
	[TypeProductId] [int] NULL,
	[PointExpirationDate] [datetime] NULL,
 CONSTRAINT [PK_PointManage] PRIMARY KEY CLUSTERED 
(
	[PointManageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointTradeIn]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointTradeIn](
	[PointTradeInId] [int] IDENTITY(1,1) NOT NULL,
	[fk_MemberId] [int] NOT NULL,
	[fk_OrderId] [int] NULL,
	[GiftThreshold] [nvarchar](30) NOT NULL,
	[GetPoints] [varchar](30) NULL,
	[MaxGetPoints] [varchar](30) NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PointTradeIn] PRIMARY KEY CLUSTERED 
(
	[PointTradeInId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Privileges]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privileges](
	[PrivilegeId] [int] IDENTITY(1,1) NOT NULL,
	[PrivilegeName] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](300) NULL,
 CONSTRAINT [PK__Privileg__B3E77E5C75DCF9CC] PRIMARY KEY CLUSTERED 
(
	[PrivilegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ProductCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryName] [nvarchar](50) NOT NULL,
	[fk_SalesCategoryId] [int] NOT NULL,
	[CategoryPath] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductComment]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[fk_MemberId] [int] NOT NULL,
	[fk_ProductGroupId] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Score] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductGroups]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroups](
	[ProductGroupId] [int] IDENTITY(1,1) NOT NULL,
	[fk_ProductId] [varchar](254) NOT NULL,
	[fk_ColorId] [int] NOT NULL,
	[fk_SizeId] [int] NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_ProductGroups] PRIMARY KEY CLUSTERED 
(
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImgs]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImgs](
	[ProductImgId] [int] IDENTITY(1,1) NOT NULL,
	[fk_ProductId] [varchar](254) NOT NULL,
	[fk_ColorId] [int] NULL,
	[ImgPath] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductImg] PRIMARY KEY CLUSTERED 
(
	[ProductImgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [varchar](254) NOT NULL,
	[ProductName] [nvarchar](254) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductMaterial] [nvarchar](50) NULL,
	[ProductOrigin] [nvarchar](50) NOT NULL,
	[UnitPrice] [int] NULL,
	[SalesPrice] [int] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[LogOut] [bit] NOT NULL,
	[Tag] [nvarchar](100) NULL,
	[fk_ProductSubCategoryId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[EditTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSubCategories]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSubCategories](
	[ProductSubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubCategoryName] [nvarchar](50) NOT NULL,
	[fk_ProductCategoryId] [int] NOT NULL,
	[SubCategoryPath] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ProductSubCategory] PRIMARY KEY CLUSTERED 
(
	[ProductSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectTagItems]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTagItems](
	[fk_ProjectTagId] [int] NOT NULL,
	[fk_ProductId] [varchar](254) NOT NULL,
 CONSTRAINT [PK_discount_group_item] PRIMARY KEY CLUSTERED 
(
	[fk_ProjectTagId] ASC,
	[fk_ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectTags]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTags](
	[ProjectTagId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTagName] [nvarchar](30) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_discount_group] PRIMARY KEY CLUSTERED 
(
	[ProjectTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationImg]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationImg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImgPath] [nvarchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationReviews]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationReviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_speakerId] [int] NOT NULL,
	[fk_memberId] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[creationTime] [datetime] NOT NULL,
	[rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationStatuses]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationStatuses](
	[ReservationId] [int] NOT NULL,
	[ReservationStatusDescription] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReturnResons]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnResons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[退貨理由] [nchar](20) NULL,
 CONSTRAINT [PK_ReturnResons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Returns]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Returns](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[退貨日期] [datetime] NULL,
	[fk訂單] [int] NULL,
	[退貨轉帳帳號] [nvarchar](50) NULL,
	[退款狀態] [bit] NULL,
	[退貨理由] [int] NULL,
 CONSTRAINT [PK_Returns] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesCategories]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesCategories](
	[SalesCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SalesCategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SalesCategory] PRIMARY KEY CLUSTERED 
(
	[SalesCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoesCategories]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoesCategories](
	[ShoesCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ShoesCategoryName] [nvarchar](254) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShoesCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoesChooses]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoesChooses](
	[OptionId] [int] IDENTITY(1,1) NOT NULL,
	[OptinName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ShoesChooses] PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoesColorCategories]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoesColorCategories](
	[ShoesColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
	[ColorCode] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShoesColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoesGroups]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoesGroups](
	[ShoesGroupId] [int] IDENTITY(1,1) NOT NULL,
	[fk_ShoesMainId] [int] NOT NULL,
	[fk_OptionId] [int] NOT NULL,
	[fk_MaterialId] [int] NOT NULL,
	[fk_ShoesColorId] [int] NOT NULL,
	[fk_CustomerOrderId] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_ShoesGroups] PRIMARY KEY CLUSTERED 
(
	[ShoesGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoesOrders]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoesOrders](
	[ShoesOrderId] [nvarchar](40) NOT NULL,
	[Qty] [int] NOT NULL,
	[fk_ShoesSizeId] [int] NOT NULL,
	[Remark] [nvarchar](300) NULL,
 CONSTRAINT [PK__ShoesOrd__D62D11F5D1F564A0] PRIMARY KEY CLUSTERED 
(
	[ShoesOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoesPictures]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoesPictures](
	[ShoesPicture_Id] [int] IDENTITY(1,1) NOT NULL,
	[ShoesPictureUrl] [nvarchar](4000) NULL,
	[fk_ShoesPictureProduct_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShoesPicture_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoesSizes]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoesSizes](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[fk_MemberID] [int] NOT NULL,
	[CartItemsId] [varchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SizeCategories]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SizeCategories](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SizeCategories] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpeakerFields]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpeakerFields](
	[FieldId] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speakers]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speakers](
	[SpeakerId] [int] IDENTITY(1,1) NOT NULL,
	[SpeakerName] [nvarchar](50) NOT NULL,
	[SpeakerPhone] [varchar](10) NULL,
	[fk_SpeakerFieldId] [int] NOT NULL,
	[SpeakerImg] [varchar](300) NULL,
	[fk_SpeakerBranchId] [int] NULL,
	[SpeakerDescription] [nvarchar](500) NULL,
	[SpeakerVisible] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SpeakerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffPermissions]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffPermissions](
	[PermissionsId] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](30) NULL,
 CONSTRAINT [PK__StaffPer__1EDAF9A81349059A] PRIMARY KEY CLUSTERED 
(
	[PermissionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Age] [tinyint] NULL,
	[Gender] [bit] NULL,
	[Mobile] [varchar](10) NULL,
	[Email] [nvarchar](300) NOT NULL,
	[Birthday] [date] NULL,
	[Account] [varchar](30) NOT NULL,
	[Password] [varchar](70) NOT NULL,
	[DueDate] [date] NULL,
	[fk_PermissionsId] [int] NOT NULL,
	[fk_TitleId] [int] NOT NULL,
	[fk_DepartmentId] [int] NOT NULL,
	[ConfirmCode] [varchar](255) NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierCompanyName] [nvarchar](50) NOT NULL,
	[HasCertificate] [bit] NULL,
	[Supply_Material] [nvarchar](50) NULL,
	[SupplierCompanyPhone] [int] NULL,
	[SupplierCompanyEmail] [nvarchar](250) NULL,
	[SupplierCompanyAddress] [nvarchar](250) NULL,
	[SupplierCompanyNumber] [int] NULL,
	[SupplierStartDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 2023/8/26 上午 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ReturnResons] ON 
GO
INSERT [dbo].[ReturnResons] ([ID], [退貨理由]) VALUES (1, N'1                   ')
GO
INSERT [dbo].[ReturnResons] ([ID], [退貨理由]) VALUES (2, N'2                   ')
GO
INSERT [dbo].[ReturnResons] ([ID], [退貨理由]) VALUES (3, N'3                   ')
GO
SET IDENTITY_INSERT [dbo].[ReturnResons] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Activity__732635ECC3234AE3]    Script Date: 2023/8/26 上午 11:55:49 ******/
ALTER TABLE [dbo].[ActivityStatuses] ADD UNIQUE NONCLUSTERED 
(
	[ActivityStatusDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Alternat__3B54230C0458ABB6]    Script Date: 2023/8/26 上午 11:55:49 ******/
ALTER TABLE [dbo].[AlternateAddresses] ADD  CONSTRAINT [UQ__Alternat__3B54230C0458ABB6] UNIQUE NONCLUSTERED 
(
	[fk_MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Branches__3903DB039F33E464]    Script Date: 2023/8/26 上午 11:55:49 ******/
ALTER TABLE [dbo].[Branches] ADD UNIQUE NONCLUSTERED 
(
	[BranchName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Branches__F50DE17ADA6CEAE5]    Script Date: 2023/8/26 上午 11:55:49 ******/
ALTER TABLE [dbo].[Branches] ADD UNIQUE NONCLUSTERED 
(
	[BranchAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__JobTitle__252BE89C516695E0]    Script Date: 2023/8/26 上午 11:55:49 ******/
ALTER TABLE [dbo].[JobTitles] ADD  CONSTRAINT [UQ__JobTitle__252BE89C516695E0] UNIQUE NONCLUSTERED 
(
	[TitleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__MemberPo__3B54230C8C81DA21]    Script Date: 2023/8/26 上午 11:55:49 ******/
ALTER TABLE [dbo].[MemberPoints] ADD  CONSTRAINT [UQ__MemberPo__3B54230C8C81DA21] UNIQUE NONCLUSTERED 
(
	[fk_MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Members__6FAE0782E1A56EB7]    Script Date: 2023/8/26 上午 11:55:49 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [UQ__Members__6FAE0782E1A56EB7] UNIQUE NONCLUSTERED 
(
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Members__A9D1053442354E1D]    Script Date: 2023/8/26 上午 11:55:49 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [UQ__Members__A9D1053442354E1D] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Members__B0C3AC46ED2152FF]    Script Date: 2023/8/26 上午 11:55:49 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [UQ__Members__B0C3AC46ED2152FF] UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Reservat__ADF40EA69A43DA4D]    Script Date: 2023/8/26 上午 11:55:49 ******/
ALTER TABLE [dbo].[ReservationStatuses] ADD UNIQUE NONCLUSTERED 
(
	[ReservationStatusDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__StaffPer__9EF3BE7B6829F02D]    Script Date: 2023/8/26 上午 11:55:49 ******/
ALTER TABLE [dbo].[StaffPermissions] ADD  CONSTRAINT [UQ__StaffPer__9EF3BE7B6829F02D] UNIQUE NONCLUSTERED 
(
	[LevelName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Supplier__AE8E9B41AC4E0B89]    Script Date: 2023/8/26 上午 11:55:49 ******/
ALTER TABLE [dbo].[Suppliers] ADD UNIQUE NONCLUSTERED 
(
	[SupplierCompanyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activities] ADD  CONSTRAINT [DF_Activities_fk_ActivityStatusId]  DEFAULT ((1)) FOR [fk_ActivityStatusId]
GO
ALTER TABLE [dbo].[BlackLists] ADD  CONSTRAINT [DF__BlackList__Creat__403A8C7D]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupon_EndDays]  DEFAULT (NULL) FOR [EndDays]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupon_EndDate]  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupon_PersonMaxUsage]  DEFAULT (NULL) FOR [PersonMaxUsage]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupon_RequirementType]  DEFAULT (NULL) FOR [RequirementType]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupon_Requirement]  DEFAULT (NULL) FOR [Requirement]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupon_fk_RequiredGroupID]  DEFAULT (NULL) FOR [fk_RequiredProjectTagID]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupons_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CustomizedShoesPo] ADD  CONSTRAINT [DF_Customized_Shoes_Status]  DEFAULT ('false') FOR [Status]
GO
ALTER TABLE [dbo].[CustomizedShoesPo] ADD  CONSTRAINT [DF_CustomizedShoesPo_DataCreateTime]  DEFAULT (getdate()) FOR [DataCreateTime]
GO
ALTER TABLE [dbo].[CustomizedShoesPo] ADD  CONSTRAINT [DF_CustomizedShoesPo_DataEditTime]  DEFAULT (getdate()) FOR [DataEditTime]
GO
ALTER TABLE [dbo].[Discounts] ADD  CONSTRAINT [DF_Discounts_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF__Members__Registr__32AB8735]  DEFAULT (getdate()) FOR [Registration]
GO
ALTER TABLE [dbo].[OneToOneReservations] ADD  DEFAULT (getdate()) FOR [ReservationCreatedDate]
GO
ALTER TABLE [dbo].[PointHistories] ADD  CONSTRAINT [DF__PointHist__Effec__3493CFA7]  DEFAULT (getdate()) FOR [EffectiveDate]
GO
ALTER TABLE [dbo].[PointTradeIn] ADD  CONSTRAINT [DF_PointTradeIn_EffectiveDate]  DEFAULT (getdate()) FOR [EffectiveDate]
GO
ALTER TABLE [dbo].[ProductComment] ADD  CONSTRAINT [DF_ProductComment_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductComment] ADD  CONSTRAINT [DF_ProductComment_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_ProductId]  DEFAULT ('unique') FOR [ProductId]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Status]  DEFAULT ('false') FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_EditTime]  DEFAULT (getdate()) FOR [EditTime]
GO
ALTER TABLE [dbo].[ProjectTags] ADD  CONSTRAINT [DF_ProjectTags_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ReservationReviews] ADD  DEFAULT (getdate()) FOR [creationTime]
GO
ALTER TABLE [dbo].[Staffs] ADD  CONSTRAINT [DF__Staffs__dueDate__395884C4]  DEFAULT (getdate()) FOR [DueDate]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK__Activitie__fk_Ac__3D2915A8] FOREIGN KEY([fk_ActivityCategoryId])
REFERENCES [dbo].[ActivityCategories] ([ActivityCategoryId])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK__Activitie__fk_Ac__3D2915A8]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK__Activitie__fk_Ac__3E1D39E1] FOREIGN KEY([fk_ActivityStatusId])
REFERENCES [dbo].[ActivityStatuses] ([ActivityStatusId])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK__Activitie__fk_Ac__3E1D39E1]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK__Activitie__fk_Sp__3F115E1A] FOREIGN KEY([fk_SpeakerId])
REFERENCES [dbo].[Speakers] ([SpeakerId])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK__Activitie__fk_Sp__3F115E1A]
GO
ALTER TABLE [dbo].[ActivityImg]  WITH CHECK ADD FOREIGN KEY([fk_ActivityId])
REFERENCES [dbo].[Activities] ([ActivityId])
GO
ALTER TABLE [dbo].[AlternateAddresses]  WITH CHECK ADD  CONSTRAINT [FK__Alternate__fk_Me__3D2915A8] FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[AlternateAddresses] CHECK CONSTRAINT [FK__Alternate__fk_Me__3D2915A8]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_CartItem] FOREIGN KEY([fk_CardId])
REFERENCES [dbo].[ShoppingCarts] ([CartId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItem_CartItem]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_ProductGroups] FOREIGN KEY([fk_ProductId])
REFERENCES [dbo].[ProductGroups] ([ProductGroupId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_ProductGroups]
GO
ALTER TABLE [dbo].[Coupons]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_CouponCategory] FOREIGN KEY([fk_CouponCategoryId])
REFERENCES [dbo].[CouponCategories] ([CouponCategoryId])
GO
ALTER TABLE [dbo].[Coupons] CHECK CONSTRAINT [FK_Coupon_CouponCategory]
GO
ALTER TABLE [dbo].[Coupons]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_ProjectTag] FOREIGN KEY([fk_RequiredProjectTagID])
REFERENCES [dbo].[ProjectTags] ([ProjectTagId])
GO
ALTER TABLE [dbo].[Coupons] CHECK CONSTRAINT [FK_Coupon_ProjectTag]
GO
ALTER TABLE [dbo].[CouponSendings]  WITH CHECK ADD  CONSTRAINT [FK_CouponSending_Coupon] FOREIGN KEY([fk_CouponId])
REFERENCES [dbo].[Coupons] ([CouponId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CouponSendings] CHECK CONSTRAINT [FK_CouponSending_Coupon]
GO
ALTER TABLE [dbo].[CouponSendings]  WITH CHECK ADD  CONSTRAINT [FK_CouponSendings_Members] FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[CouponSendings] CHECK CONSTRAINT [FK_CouponSendings_Members]
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD  CONSTRAINT [FK__Customize__Custo__46B27FE2] FOREIGN KEY([Customized_Shoes_Id])
REFERENCES [dbo].[CustomizedShoesPo] ([ShoesProductId])
GO
ALTER TABLE [dbo].[CustomizedOrders] CHECK CONSTRAINT [FK__Customize__Custo__46B27FE2]
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD FOREIGN KEY([Customized_Eyelet])
REFERENCES [dbo].[Customized_materials] ([Shoesmaterial_Id])
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD FOREIGN KEY([Customized_EdgeProtection])
REFERENCES [dbo].[Customized_materials] ([Shoesmaterial_Id])
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD FOREIGN KEY([Customized_Rear])
REFERENCES [dbo].[Customized_materials] ([Shoesmaterial_Id])
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD FOREIGN KEY([Customized_Tongue])
REFERENCES [dbo].[Customized_materials] ([Shoesmaterial_Id])
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD FOREIGN KEY([Customized_Toe])
REFERENCES [dbo].[Customized_materials] ([Shoesmaterial_Id])
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD  CONSTRAINT [FK_CustomizedOrders_Members] FOREIGN KEY([Fk_ForMemberCustomized_Id])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[CustomizedOrders] CHECK CONSTRAINT [FK_CustomizedOrders_Members]
GO
ALTER TABLE [dbo].[CustomizedShoesPo]  WITH CHECK ADD  CONSTRAINT [FK__Customize__fk_Sh__44CA3770] FOREIGN KEY([fk_ShoesCategoryId])
REFERENCES [dbo].[ShoesCategories] ([ShoesCategoryId])
GO
ALTER TABLE [dbo].[CustomizedShoesPo] CHECK CONSTRAINT [FK__Customize__fk_Sh__44CA3770]
GO
ALTER TABLE [dbo].[CustomizedShoesPo]  WITH CHECK ADD  CONSTRAINT [FK__Customize__fk_Sh__45BE5BA9] FOREIGN KEY([fk_ShoesColorId])
REFERENCES [dbo].[ShoesColorCategories] ([ShoesColorId])
GO
ALTER TABLE [dbo].[CustomizedShoesPo] CHECK CONSTRAINT [FK__Customize__fk_Sh__45BE5BA9]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discount_DiscountGroup] FOREIGN KEY([fk_ProjectTagId])
REFERENCES [dbo].[ProjectTags] ([ProjectTagId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discount_DiscountGroup]
GO
ALTER TABLE [dbo].[EcpayOrders]  WITH CHECK ADD  CONSTRAINT [FK_EcpayOrders_Type] FOREIGN KEY([fk_typeId])
REFERENCES [dbo].[Type] ([TypeId])
GO
ALTER TABLE [dbo].[EcpayOrders] CHECK CONSTRAINT [FK_EcpayOrders_Type]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Members] FOREIGN KEY([fk_memberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Members]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Products] FOREIGN KEY([fk_productId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Products]
GO
ALTER TABLE [dbo].[MemberImg]  WITH CHECK ADD  CONSTRAINT [FK_MemberImg_Members] FOREIGN KEY([fk_memberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[MemberImg] CHECK CONSTRAINT [FK_MemberImg_Members]
GO
ALTER TABLE [dbo].[MemberPoints]  WITH CHECK ADD  CONSTRAINT [FK__MemberPoi__fk_Me__4E53A1AA] FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[MemberPoints] CHECK CONSTRAINT [FK__MemberPoi__fk_Me__4E53A1AA]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK__Members__fk_Blac__503BEA1C] FOREIGN KEY([fk_BlackListId])
REFERENCES [dbo].[BlackLists] ([BlackListId])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK__Members__fk_Blac__503BEA1C]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK__Members__fk_Leve__00DF2177] FOREIGN KEY([fk_LevelId])
REFERENCES [dbo].[MembershipLevels] ([LevelId])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK__Members__fk_Leve__00DF2177]
GO
ALTER TABLE [dbo].[MembershipLevelPrivileges]  WITH CHECK ADD  CONSTRAINT [FK__Membershi__fk_Le__01D345B0] FOREIGN KEY([fk_LevelId])
REFERENCES [dbo].[MembershipLevels] ([LevelId])
GO
ALTER TABLE [dbo].[MembershipLevelPrivileges] CHECK CONSTRAINT [FK__Membershi__fk_Le__01D345B0]
GO
ALTER TABLE [dbo].[MembershipLevelPrivileges]  WITH CHECK ADD  CONSTRAINT [FK__Membershi__fk_Pr__531856C7] FOREIGN KEY([fk_PrivilegeId])
REFERENCES [dbo].[Privileges] ([PrivilegeId])
GO
ALTER TABLE [dbo].[MembershipLevelPrivileges] CHECK CONSTRAINT [FK__Membershi__fk_Pr__531856C7]
GO
ALTER TABLE [dbo].[OneToOneReservations]  WITH CHECK ADD FOREIGN KEY([fk_BranchId])
REFERENCES [dbo].[Branches] ([BranchId])
GO
ALTER TABLE [dbo].[OneToOneReservations]  WITH CHECK ADD FOREIGN KEY([fk_ReservationSpeakerId])
REFERENCES [dbo].[Speakers] ([SpeakerId])
GO
ALTER TABLE [dbo].[OneToOneReservations]  WITH CHECK ADD FOREIGN KEY([fk_ReservationStatusId])
REFERENCES [dbo].[ReservationStatuses] ([ReservationId])
GO
ALTER TABLE [dbo].[OneToOneReservations]  WITH CHECK ADD  CONSTRAINT [FK_OneToOneReservations_Members] FOREIGN KEY([fk_BookerId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[OneToOneReservations] CHECK CONSTRAINT [FK_OneToOneReservations_Members]
GO
ALTER TABLE [dbo].[orderItems]  WITH CHECK ADD  CONSTRAINT [FK__orderItem__order__1B9317B3] FOREIGN KEY([order_Id])
REFERENCES [dbo].[orders] ([Id])
GO
ALTER TABLE [dbo].[orderItems] CHECK CONSTRAINT [FK__orderItem__order__1B9317B3]
GO
ALTER TABLE [dbo].[orderItems]  WITH CHECK ADD  CONSTRAINT [FK_orderItems_Type] FOREIGN KEY([fk_typeId])
REFERENCES [dbo].[Type] ([TypeId])
GO
ALTER TABLE [dbo].[orderItems] CHECK CONSTRAINT [FK_orderItems_Type]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__fk_membe__5BAD9CC8] FOREIGN KEY([fk_member_Id])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__fk_membe__5BAD9CC8]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__logistic__5BAD9CC8] FOREIGN KEY([logistics_company_Id])
REFERENCES [dbo].[logistics_companies] ([Id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__logistic__5BAD9CC8]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__order_st__5CA1C101] FOREIGN KEY([order_status_Id])
REFERENCES [dbo].[order_statuses] ([Id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__order_st__5CA1C101]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__pay_meth__5D95E53A] FOREIGN KEY([pay_method_Id])
REFERENCES [dbo].[pay_methods] ([Id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__pay_meth__5D95E53A]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__pay_stat__5E8A0973] FOREIGN KEY([pay_status_Id])
REFERENCES [dbo].[pay_statuses] ([Id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__pay_stat__5E8A0973]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_Members] FOREIGN KEY([fk_member_Id])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_Members]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_Type] FOREIGN KEY([fk_typeId])
REFERENCES [dbo].[Type] ([TypeId])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_Type]
GO
ALTER TABLE [dbo].[PointHistories]  WITH CHECK ADD  CONSTRAINT [FK__PointHist__fk_Me__03BB8E22] FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[PointHistories] CHECK CONSTRAINT [FK__PointHist__fk_Me__03BB8E22]
GO
ALTER TABLE [dbo].[PointHistories]  WITH CHECK ADD  CONSTRAINT [FK_PointHistories_MemberPoints] FOREIGN KEY([fk_MemberPointsId])
REFERENCES [dbo].[MemberPoints] ([MemberPointsId])
GO
ALTER TABLE [dbo].[PointHistories] CHECK CONSTRAINT [FK_PointHistories_MemberPoints]
GO
ALTER TABLE [dbo].[PointHistories]  WITH CHECK ADD  CONSTRAINT [FK_PointHistories_orders] FOREIGN KEY([fk_OrderId])
REFERENCES [dbo].[orders] ([Id])
GO
ALTER TABLE [dbo].[PointHistories] CHECK CONSTRAINT [FK_PointHistories_orders]
GO
ALTER TABLE [dbo].[PointHistories]  WITH CHECK ADD  CONSTRAINT [FK_PointHistories_Type] FOREIGN KEY([fk_TypeId])
REFERENCES [dbo].[Type] ([TypeId])
GO
ALTER TABLE [dbo].[PointHistories] CHECK CONSTRAINT [FK_PointHistories_Type]
GO
ALTER TABLE [dbo].[PointManage]  WITH CHECK ADD  CONSTRAINT [FK_PointManage_PointManage] FOREIGN KEY([PointManageId])
REFERENCES [dbo].[PointManage] ([PointManageId])
GO
ALTER TABLE [dbo].[PointManage] CHECK CONSTRAINT [FK_PointManage_PointManage]
GO
ALTER TABLE [dbo].[PointManage]  WITH CHECK ADD  CONSTRAINT [FK_PointManage_Type] FOREIGN KEY([fk_TypeId])
REFERENCES [dbo].[Type] ([TypeId])
GO
ALTER TABLE [dbo].[PointManage] CHECK CONSTRAINT [FK_PointManage_Type]
GO
ALTER TABLE [dbo].[PointTradeIn]  WITH CHECK ADD  CONSTRAINT [FK_PointTradeIn_Members] FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[PointTradeIn] CHECK CONSTRAINT [FK_PointTradeIn_Members]
GO
ALTER TABLE [dbo].[PointTradeIn]  WITH CHECK ADD  CONSTRAINT [FK_PointTradeIn_orders] FOREIGN KEY([fk_OrderId])
REFERENCES [dbo].[orders] ([Id])
GO
ALTER TABLE [dbo].[PointTradeIn] CHECK CONSTRAINT [FK_PointTradeIn_orders]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_SalesCategories] FOREIGN KEY([fk_SalesCategoryId])
REFERENCES [dbo].[SalesCategories] ([SalesCategoryId])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_SalesCategories]
GO
ALTER TABLE [dbo].[ProductComment]  WITH CHECK ADD  CONSTRAINT [FK_ProductComment_Members] FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_Members]
GO
ALTER TABLE [dbo].[ProductComment]  WITH CHECK ADD  CONSTRAINT [FK_ProductComment_ProductGroups] FOREIGN KEY([fk_ProductGroupId])
REFERENCES [dbo].[ProductGroups] ([ProductGroupId])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_ProductGroups]
GO
ALTER TABLE [dbo].[ProductGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroups_ColorCategories] FOREIGN KEY([fk_ColorId])
REFERENCES [dbo].[ColorCategories] ([ColorId])
GO
ALTER TABLE [dbo].[ProductGroups] CHECK CONSTRAINT [FK_ProductGroups_ColorCategories]
GO
ALTER TABLE [dbo].[ProductGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroups_Products] FOREIGN KEY([fk_ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ProductGroups] CHECK CONSTRAINT [FK_ProductGroups_Products]
GO
ALTER TABLE [dbo].[ProductGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroups_SizeCategories] FOREIGN KEY([fk_SizeId])
REFERENCES [dbo].[SizeCategories] ([SizeId])
GO
ALTER TABLE [dbo].[ProductGroups] CHECK CONSTRAINT [FK_ProductGroups_SizeCategories]
GO
ALTER TABLE [dbo].[ProductImgs]  WITH CHECK ADD  CONSTRAINT [FK_ProductImgs_ColorCategories] FOREIGN KEY([fk_ColorId])
REFERENCES [dbo].[ColorCategories] ([ColorId])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ProductImgs] CHECK CONSTRAINT [FK_ProductImgs_ColorCategories]
GO
ALTER TABLE [dbo].[ProductImgs]  WITH CHECK ADD  CONSTRAINT [FK_ProductImgs_Products] FOREIGN KEY([fk_ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImgs] CHECK CONSTRAINT [FK_ProductImgs_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductSubCategory] FOREIGN KEY([fk_ProductSubCategoryId])
REFERENCES [dbo].[ProductSubCategories] ([ProductSubCategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_ProductSubCategory]
GO
ALTER TABLE [dbo].[ProductSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubCategories_ProductCategories] FOREIGN KEY([fk_ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([ProductCategoryId])
GO
ALTER TABLE [dbo].[ProductSubCategories] CHECK CONSTRAINT [FK_ProductSubCategories_ProductCategories]
GO
ALTER TABLE [dbo].[ProjectTagItems]  WITH CHECK ADD  CONSTRAINT [FK_discount_group_item_discount_group] FOREIGN KEY([fk_ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProjectTagItems] CHECK CONSTRAINT [FK_discount_group_item_discount_group]
GO
ALTER TABLE [dbo].[ProjectTagItems]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTagItems_ProjectTagItems] FOREIGN KEY([fk_ProjectTagId], [fk_ProductId])
REFERENCES [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId])
GO
ALTER TABLE [dbo].[ProjectTagItems] CHECK CONSTRAINT [FK_ProjectTagItems_ProjectTagItems]
GO
ALTER TABLE [dbo].[ProjectTags]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTags_ProjectTags] FOREIGN KEY([ProjectTagId])
REFERENCES [dbo].[ProjectTags] ([ProjectTagId])
GO
ALTER TABLE [dbo].[ProjectTags] CHECK CONSTRAINT [FK_ProjectTags_ProjectTags]
GO
ALTER TABLE [dbo].[ReservationReviews]  WITH CHECK ADD FOREIGN KEY([fk_memberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[ReservationReviews]  WITH CHECK ADD FOREIGN KEY([fk_speakerId])
REFERENCES [dbo].[Speakers] ([SpeakerId])
GO
ALTER TABLE [dbo].[Returns]  WITH CHECK ADD  CONSTRAINT [FK_Returns_orders] FOREIGN KEY([fk訂單])
REFERENCES [dbo].[orders] ([Id])
GO
ALTER TABLE [dbo].[Returns] CHECK CONSTRAINT [FK_Returns_orders]
GO
ALTER TABLE [dbo].[Returns]  WITH CHECK ADD  CONSTRAINT [FK_Returns_ReturnResons] FOREIGN KEY([退貨理由])
REFERENCES [dbo].[ReturnResons] ([ID])
GO
ALTER TABLE [dbo].[Returns] CHECK CONSTRAINT [FK_Returns_ReturnResons]
GO
ALTER TABLE [dbo].[ShoesGroups]  WITH CHECK ADD  CONSTRAINT [FK_ShoesGroups_Customized_materials] FOREIGN KEY([fk_MaterialId])
REFERENCES [dbo].[Customized_materials] ([Shoesmaterial_Id])
GO
ALTER TABLE [dbo].[ShoesGroups] CHECK CONSTRAINT [FK_ShoesGroups_Customized_materials]
GO
ALTER TABLE [dbo].[ShoesGroups]  WITH CHECK ADD  CONSTRAINT [FK_ShoesGroups_CustomizedShoesPo] FOREIGN KEY([fk_ShoesMainId])
REFERENCES [dbo].[CustomizedShoesPo] ([ShoesProductId])
GO
ALTER TABLE [dbo].[ShoesGroups] CHECK CONSTRAINT [FK_ShoesGroups_CustomizedShoesPo]
GO
ALTER TABLE [dbo].[ShoesGroups]  WITH CHECK ADD  CONSTRAINT [FK_ShoesGroups_ShoesChooses] FOREIGN KEY([fk_OptionId])
REFERENCES [dbo].[ShoesChooses] ([OptionId])
GO
ALTER TABLE [dbo].[ShoesGroups] CHECK CONSTRAINT [FK_ShoesGroups_ShoesChooses]
GO
ALTER TABLE [dbo].[ShoesGroups]  WITH CHECK ADD  CONSTRAINT [FK_ShoesGroups_ShoesColorCategories] FOREIGN KEY([fk_ShoesColorId])
REFERENCES [dbo].[ShoesColorCategories] ([ShoesColorId])
GO
ALTER TABLE [dbo].[ShoesGroups] CHECK CONSTRAINT [FK_ShoesGroups_ShoesColorCategories]
GO
ALTER TABLE [dbo].[ShoesGroups]  WITH CHECK ADD  CONSTRAINT [FK_ShoesGroups_ShoesOrders] FOREIGN KEY([fk_CustomerOrderId])
REFERENCES [dbo].[ShoesOrders] ([ShoesOrderId])
GO
ALTER TABLE [dbo].[ShoesGroups] CHECK CONSTRAINT [FK_ShoesGroups_ShoesOrders]
GO
ALTER TABLE [dbo].[ShoesOrders]  WITH CHECK ADD  CONSTRAINT [FK__ShoesOrde__Remar__12FDD1B2] FOREIGN KEY([fk_ShoesSizeId])
REFERENCES [dbo].[ShoesSizes] ([SizeId])
GO
ALTER TABLE [dbo].[ShoesOrders] CHECK CONSTRAINT [FK__ShoesOrde__Remar__12FDD1B2]
GO
ALTER TABLE [dbo].[ShoesPictures]  WITH CHECK ADD  CONSTRAINT [FK__ShoesPict__fk_Sh__70A8B9AE] FOREIGN KEY([fk_ShoesPictureProduct_Id])
REFERENCES [dbo].[CustomizedShoesPo] ([ShoesProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoesPictures] CHECK CONSTRAINT [FK__ShoesPict__fk_Sh__70A8B9AE]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Members] FOREIGN KEY([fk_MemberID])
REFERENCES [dbo].[Members] ([MemberId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Members]
GO
ALTER TABLE [dbo].[Speakers]  WITH CHECK ADD FOREIGN KEY([fk_SpeakerBranchId])
REFERENCES [dbo].[Branches] ([BranchId])
GO
ALTER TABLE [dbo].[Speakers]  WITH CHECK ADD FOREIGN KEY([fk_SpeakerFieldId])
REFERENCES [dbo].[SpeakerFields] ([FieldId])
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK__Staffs__fk_Depar__74794A92] FOREIGN KEY([fk_DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK__Staffs__fk_Depar__74794A92]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK__Staffs__fk_Permi__756D6ECB] FOREIGN KEY([fk_PermissionsId])
REFERENCES [dbo].[StaffPermissions] ([PermissionsId])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK__Staffs__fk_Permi__756D6ECB]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK__Staffs__fk_Title__76619304] FOREIGN KEY([fk_TitleId])
REFERENCES [dbo].[JobTitles] ([TitleId])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK__Staffs__fk_Title__76619304]
GO



--建倫***************************************************************--
INSERT INTO ColorCategories (ColorName)
VALUES
    ('黑'),
    ('白'),
    ('灰'),
    ('紅'),
    ('藍'),
    ('黃'),
	('粉'),
	('綠');

INSERT INTO SizeCategories ( SizeName)
VALUES ('S'),
       ('M'),
       ('L'),
	   ('XL'),
	   ('XXL'),
	   ('XXXL'),
	   ('XXXXL'),
	   ('16'),
	   ('16.5'),
	   ('17'),
	   ('17.5'),
	   ('18'),
	   ('18.5'),
	   ('19'),
	   ('19.5'),
	   ('20'),
	   ('20.5'),
	   ('21'),
	   ('21.5'),
	   ('22'),
	   ('22.5'),
	   ('23'),
	   ('23.5'),
	   ('24'),
	   ('24.5'),
	   ('25'),
	   ('25.5'),
	   ('26'),
	   ('26.5'),
	   ('27'),
	   ('27.5'),
	   ('28'),
	   ('單一規格');


INSERT INTO SalesCategories (SalesCategoryName)
VALUES ('男裝'),
       ('女裝'),
       ('童裝');


INSERT INTO ProductCategories( ProductCategoryName,fk_SalesCategoryId,CategoryPath)
VALUES ('上衣',1,'男裝/上衣'),
	   ('上衣',2,'女裝/上衣'),
	   ('上衣',3,'童裝/上衣'),
       ('褲子',1,'男裝/褲子'),
	   ('褲子',2,'女裝/褲子'),
	   ('褲子',3,'童裝/褲子'),
       ('鞋子',1,'男裝/鞋子'),
	   ('鞋子',2,'女裝/鞋子'),
	   ('鞋子',3,'童裝/鞋子'),
       ('配件',1,'男裝/配件'),
	   ('配件',2,'女裝/配件'),
	   ('配件',3,'童裝/配件');


INSERT INTO ProductSubCategories( ProductSubCategoryName,fk_ProductCategoryId,SubCategoryPath)
VALUES 
('短袖',1,'男裝/上衣/短袖'),
('短袖',2,'女裝/上衣/短袖'),
('短袖',3,'童裝/上衣/短袖'),
('長袖',1,'男裝/上衣/長袖'),
('長袖',2,'女裝/上衣/長袖'),
('長袖',3,'童裝/上衣/長袖'),
('短褲',4,'男裝/褲子/短褲'),
('短褲',5,'女裝/褲子/短褲'),
('短褲',6,'童裝/褲子/短褲'),
('長褲',4,'男裝/褲子/長褲'),
('長褲',5,'女裝/褲子/長褲'),
('長褲',6,'童裝/褲子/長褲'),
('休閒鞋',7,'男裝/鞋子/休閒鞋'),
('休閒鞋',8,'女裝/鞋子/休閒鞋'),
('休閒鞋',9,'童裝/鞋子/休閒鞋'),
('運動鞋',7,'男裝/鞋子/運動鞋'),
('運動鞋',8,'女裝/鞋子/運動鞋'),
('運動鞋',9,'童裝/鞋子/運動鞋'),
('包包',10,'男裝/配件/包包'),
('包包',11,'女裝/配件/包包'),
('包包',12,'童裝/配件/包包'),
('帽子',10,'男裝/配件/帽子'),
('帽子',11,'女裝/配件/帽子'),
('帽子',12,'童裝/配件/帽子');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,Status,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_ST_0001','男款純棉短袖上衣','簡單實用的基本款 T 恤，無論作為運動服或日常穿著都非常合適。物超所值，絕對讓你愛不釋手一款採用圓領、短袖、柔軟的純棉材質打造，物超所值的 T 恤。','98% 棉, 2% 彈性纖維','台灣',499,399,'false','false',null,1);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_ST_0001',1,1,3),
('M_CL_ST_0001',1,2,3),
('M_CL_ST_0001',2,3,3),
('M_CL_ST_0001',2,4,3);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_ST_0001',2,'3147b9be0fbb42da88a60c7ca32fee87.jpg'),
('M_CL_ST_0001',1,'8f890d9ac11e4578891e78e13923d419.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_ST_0002','男款快乾透氣短袖上衣','對環境友善的吸濕排汗 T 恤，適合偶爾登山健行時穿著。','90% 的再生聚酯纖維（Polyester）和 10% 的 Lyocell 製成','台灣',600,500,'false','限量',1);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_ST_0002',3,1,3),
('M_CL_ST_0002',3,2,3),
('M_CL_ST_0002',4,3,3),
('M_CL_ST_0002',4,4,3);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_ST_0002',3,'e16c292e3591485d9e87cfa2ef4ffe4e.jpg'),
('M_CL_ST_0002',4,'1de9aa248d494f2b9d36f7610060c532.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_ST_0003','男款登山健行快乾棉質短袖上衣','我們的登山健行設計師採用環保概念打造出這款 T 恤 NH100，適合經常在溫和天氣下於平地、森林或海岸健行時穿著。','90% 的再生聚酯纖維（Polyester）和 10% 的 Lyocell 製成','台灣',600,499,'false','新品',1);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_ST_0003',2,1,220),
('M_CL_ST_0003',2,2,100),
('M_CL_ST_0003',2,3,0),
('M_CL_ST_0003',7,2,150),
('M_CL_ST_0003',7,3,200),
('M_CL_ST_0003',7,4,150),
('M_CL_ST_0003',7,5,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_ST_0003',2,'男款登山健行快乾棉質短袖上衣1.jpg'),
('M_CL_ST_0003',null,'男款登山健行快乾棉質短袖上衣2.jpg'),
('M_CL_ST_0003',null,'男款登山健行快乾棉質短袖上衣3.jpg'),
('M_CL_ST_0003',7,'男款登山健行快乾棉質短袖上衣4.jpg'),
('M_CL_ST_0003',null,'男款登山健行快乾棉質短袖上衣5.jpg'),
('M_CL_ST_0003',null,'男款登山健行快乾棉質短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_ST_0004','男款透氣跑步短袖上衣','我們充滿熱忱的團隊開發這款超透氣的男款跑步 T 恤，為你在夏日跑步時保持涼爽！極為通風的 T 恤。微孔布料搭配背部通風設計，讓空氣能在這款男款跑步 T 恤流通。排汗布料。','90% 的再生聚酯纖維（Polyester）和 10% 的 Lyocell 製成','台灣',600,499,'false','新品',1);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_ST_0004',5,1,220),
('M_CL_ST_0004',5,2,100),
('M_CL_ST_0004',5,3,100),
('M_CL_ST_0004',5,4,0),
('M_CL_ST_0004',8,1,150),
('M_CL_ST_0004',8,3,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_ST_0004',5,'男款透氣跑步短袖上衣1.jpg'),
('M_CL_ST_0004',null,'男款透氣跑步短袖上衣2.jpg'),
('M_CL_ST_0004',null,'男款透氣跑步短袖上衣3.jpg'),
('M_CL_ST_0004',8,'男款透氣跑步短袖上衣4.jpg'),
('M_CL_ST_0004',null,'男款透氣跑步短袖上衣5.jpg'),
('M_CL_ST_0004',null,'男款透氣跑步短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_ST_0005','男款網球排汗運動POLO衫','我們的設計團隊專為在運動中追求舒適感的球員開發了這款Polo衫。特殊、透氣的網球Polo衫！專為網球設計的經典Polo衫。輕量透氣的布料能在運動時提供最大舒適度，讓你愛不釋手！','90% 的再生聚酯纖維（Polyester）和 10% 的 Lyocell 製成','台灣',700,599,'false','新品',1);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_ST_0005',2,1,220),
('M_CL_ST_0005',2,2,100),
('M_CL_ST_0005',2,3,0),
('M_CL_ST_0005',5,1,150),
('M_CL_ST_0005',5,3,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_ST_0005',2,'男款網球排汗運動POLO衫1.jpg'),
('M_CL_ST_0005',null,'男款網球排汗運動POLO衫2.jpg'),
('M_CL_ST_0005',null,'男款網球排汗運動POLO衫3.jpg'),
('M_CL_ST_0005',5,'男款網球排汗運動POLO衫4.jpg'),
('M_CL_ST_0005',null,'男款網球排汗運動POLO衫5.jpg'),
('M_CL_ST_0005',null,'男款網球排汗運動POLO衫6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_ST_0006','防曬釣魚短袖上衣 (UPF 50+)','我們的概念設計團隊研發出這款適合釣魚時穿著的T恤UPF 50+我們的概念設計團隊研發出這款適合釣魚時穿著的T恤!','90% 的再生聚酯纖維（Polyester）和 10% 的 Lyocell 製成','台灣',700,599,'false','新品',1);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_ST_0006',1,1,220),
('M_CL_ST_0006',1,2,100),
('M_CL_ST_0006',1,3,0),
('M_CL_ST_0006',1,4,100),
('M_CL_ST_0006',2,2,220),
('M_CL_ST_0006',2,3,100),
('M_CL_ST_0006',2,4,0),
('M_CL_ST_0006',2,5,100),
('M_CL_ST_0006',5,3,150),
('M_CL_ST_0006',5,4,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_ST_0006',1,'防曬釣魚短袖上衣1.jpg'),
('M_CL_ST_0006',null,'防曬釣魚短袖上衣2.jpg'),
('M_CL_ST_0006',2,'防曬釣魚短袖上衣3.jpg'),
('M_CL_ST_0006',null,'防曬釣魚短袖上衣4.jpg'),
('M_CL_ST_0006',5,'防曬釣魚短袖上衣5.jpg'),
('M_CL_ST_0006',null,'防曬釣魚短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_ST_0007','男款登山健行快乾透氣短袖上衣','我們熱愛登山健行的團隊在白朗峰山腳下設計出這款適合經常登山健行的輕量透氣 T 恤。透氣接片能提供絕佳的透氣性健行者一定會愛上它的舒適感與吸濕排汗特性！','90% 的再生聚酯纖維（Polyester）和 10% 的 Lyocell 製成','台灣',null,599,'false','新品',1);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_ST_0007',3,2,220),
('M_CL_ST_0007',3,3,220),
('M_CL_ST_0007',3,4,0),
('M_CL_ST_0007',5,1,220),
('M_CL_ST_0007',5,2,0),
('M_CL_ST_0007',5,3,200),
('M_CL_ST_0007',6,2,150),
('M_CL_ST_0007',6,3,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_ST_0007',3,'男款登山健行快乾透氣短袖上衣1.jpg'),
('M_CL_ST_0007',null,'男款登山健行快乾透氣短袖上衣2.jpg'),
('M_CL_ST_0007',5,'男款登山健行快乾透氣短袖上衣3.jpg'),
('M_CL_ST_0007',null,'男款登山健行快乾透氣短袖上衣4.jpg'),
('M_CL_ST_0007',6,'男款登山健行快乾透氣短袖上衣5.jpg'),
('M_CL_ST_0007',null,'男款登山健行快乾透氣短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_ST_0008','男款透氣排汗短袖上衣','我們的 Kalenji 團隊設計了這款觸感自然且舒適透氣的 T 恤，適合全年慢跑穿著。柔軟透氣獨特的柔軟觸感將讓這款 T 恤很快成為你跑步與日常生活的必備單品。','90% 的再生聚酯纖維（Polyester）和 10% 的 Lyocell 製成','台灣',null,500,'false','新品',1);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_ST_0008',3,3,300),
('M_CL_ST_0008',3,4,3),
('M_CL_ST_0008',3,5,0),
('M_CL_ST_0008',6,1,220),
('M_CL_ST_0008',6,2,3),
('M_CL_ST_0008',6,3,3),
('M_CL_ST_0008',8,4,150),
('M_CL_ST_0008',8,5,3);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_ST_0008',3,'男款透氣排汗短袖上衣1.jpg'),
('M_CL_ST_0008',null,'男款透氣排汗短袖上衣2.jpg'),
('M_CL_ST_0008',6,'男款透氣排汗短袖上衣3.jpg'),
('M_CL_ST_0008',null,'男款透氣排汗短袖上衣4.jpg'),
('M_CL_ST_0008',8,'男款透氣排汗短袖上衣5.jpg'),
('M_CL_ST_0008',null,'男款透氣排汗短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_ST_0001','女款透氣跑步短袖上衣','讓你在夏日跑步時保持涼爽！輕盈透氣微孔布料搭配背部通風設計，讓空氣能在這款女款跑步 T 恤流通。','90% 的再生聚酯纖維（Polyester）和 10% 的 Lyocell 製成','台灣',null,399,'false',null,2);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_ST_0001',2,1,220),
('F_CL_ST_0001',2,2,220),
('F_CL_ST_0001',2,3,220),
('F_CL_ST_0001',6,4,50),
('F_CL_ST_0001',6,5,30);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_ST_0001',2,'847b9a864c8b4a2fa2293fb4dce230e4.jpg'),
('F_CL_ST_0001',6,'a78b0647a40c4bb9bb12ad1b35a7bb22.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_ST_0002','女款透氣排汗跑步短袖上衣','輕盈透氣這款透氣、舒適又柔美的 T 恤，是你夏天跑步時的必備衣物。','主要布料 100% 聚酯纖維','台灣',null,499,'false',null,2);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_ST_0002',1,1,220),
('F_CL_ST_0002',1,2,220),
('F_CL_ST_0002',2,2,100),
('F_CL_ST_0002',2,3,100),
('F_CL_ST_0002',5,4,200),
('F_CL_ST_0002',5,5,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_ST_0002',2,'0df1eb14096b4399a531b1efb0836b00.jpg'),
('F_CL_ST_0002',1,'54221a9d589a4ef5992c8a135fd354d7.jpg'),
('F_CL_ST_0002',5,'05017ebe8dfa49bbb9d632cf655e7f2e.jpg');




INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_ST_0003','女款網球短袖上衣','我們採用環保設計打造這款適合訓練和比賽的網球 T 恤。不管溫度幾度，一年四季均可穿著。背面採用輕量、透氣的布料在球場上享受這款 T 恤的舒適感，背面採用柔軟觸感和透氣布料。你也會愛上這樣好穿的優美剪裁。','80% 以再生聚酯纖維（Polyester）製成。','台灣',600,499,'false',null,2);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_ST_0003',2,1,220),
('F_CL_ST_0003',2,2,220),
('F_CL_ST_0003',2,3,0),
('F_CL_ST_0003',8,2,200),
('F_CL_ST_0003',8,3,0),
('F_CL_ST_0003',8,4,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_ST_0003',2,'女款網球短袖上衣1.jpg'),
('F_CL_ST_0003',null,'女款網球短袖上衣2.jpg'),
('F_CL_ST_0003',null,'女款網球短袖上衣3.jpg'),
('F_CL_ST_0003',8,'女款網球短袖上衣4.jpg'),
('F_CL_ST_0003',null,'女款網球短袖上衣5.jpg'),
('F_CL_ST_0003',null,'女款網球短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_ST_0004','女款經典優雅高爾夫短袖上衣 (POLO衫)','我們的高爾夫設計團隊開發了這款短袖 Polo 衫，適合在體感溫度 20°C 以上的溫暖天候打高爾夫球穿著。女款 Polo 衫 WW500 專為高爾夫球員打造，結合經典優雅剪裁與難以超越的聚酯纖維 (polyester) 技術規格，很適合暖天穿著。','84% 再生聚酯纖維 (polyester) 與 16% 彈性纖維 (elastane)','台灣',600,499,'false',null,2);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_ST_0004',1,1,220),
('F_CL_ST_0004',1,2,220),
('F_CL_ST_0004',2,2,220),
('F_CL_ST_0004',2,3,220),
('F_CL_ST_0004',8,3,200),
('F_CL_ST_0004',8,4,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_ST_0004',1,'女款經典優雅高爾夫短袖上衣1.jpg'),
('F_CL_ST_0004',null,'女款經典優雅高爾夫短袖上衣2.jpg'),
('F_CL_ST_0004',2,'女款經典優雅高爾夫短袖上衣3.jpg'),
('F_CL_ST_0004',null,'女款經典優雅高爾夫短袖上衣4.jpg'),
('F_CL_ST_0004',8,'女款經典優雅高爾夫短袖上衣5.jpg'),
('F_CL_ST_0004',null,'女款經典優雅高爾夫短袖上衣6.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_ST_0005','女款舒適優雅高爾夫短袖上衣 (POLO衫)','我們開發了這款短袖 Polo 衫，適合在 10°C 到 20°C 的溫和天氣中打高爾夫球時穿著。女款 Polo 衫 MW500 專為女性高爾夫球手打造，風格優雅雋永，確保舒適揮桿。',' 60% BCI 棉與 40% 回收自塑膠瓶的再生聚酯纖維 (polyester) 製成','台灣',null,450,'false',null,2);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_ST_0005',1,1,220),
('F_CL_ST_0005',1,2,220),
('F_CL_ST_0005',2,2,220),
('F_CL_ST_0005',2,3,220),
('F_CL_ST_0005',7,3,200),
('F_CL_ST_0005',7,4,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_ST_0005',1,'女款舒適優雅高爾夫短袖上衣1.jpg'),
('F_CL_ST_0005',null,'女款舒適優雅高爾夫短袖上衣2.jpg'),
('F_CL_ST_0005',2,'女款舒適優雅高爾夫短袖上衣3.jpg'),
('F_CL_ST_0005',null,'女款舒適優雅高爾夫短袖上衣4.jpg'),
('F_CL_ST_0005',7,'女款舒適優雅高爾夫短袖上衣5.jpg'),
('F_CL_ST_0005',null,'女款舒適優雅高爾夫短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_ST_0006','女款100%純棉短袖上衣','我們的設計師為溫和健身與皮拉提斯運動開發這款T恤。適合低強度訓練時穿著。無時無刻的自由與舒適！最簡約舒適的純棉T恤。寬鬆剪裁與柔軟的棉質布料讓你活動自如。','主要布料 100% 棉','台灣',null,450,'false',null,2);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_ST_0006',2,1,220),
('F_CL_ST_0006',2,2,3),
('F_CL_ST_0006',2,3,0),
('F_CL_ST_0006',7,4,200),
('F_CL_ST_0006',7,5,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_ST_0006',2,'女款100%純棉短袖上衣1.jpg'),
('F_CL_ST_0006',null,'女款100%純棉短袖上衣2.jpg'),
('F_CL_ST_0006',null,'女款100%純棉短袖上衣3.jpg'),
('F_CL_ST_0006',7,'女款100%純棉短袖上衣4.jpg'),
('F_CL_ST_0006',null,'女款100%純棉短袖上衣5.jpg'),
('F_CL_ST_0006',null,'女款100%純棉短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_ST_0007','女款中階半開式拉鍊健身運動上衣','無袖運動上衣！正在尋找一款適合在一開始運動時或訓練結束後增加保暖度的無袖運動上衣？這款健身運動上衣就是最佳選擇！採用半開式拉鍊領口設計，既方便又時髦。','31% 再生棉與 45% 再生聚酯纖維（polyester）製成','台灣',null,600,'false',null,2);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_ST_0007',1,1,220),
('F_CL_ST_0007',1,2,3),
('F_CL_ST_0007',1,3,3),
('F_CL_ST_0007',2,3,3),
('F_CL_ST_0007',2,4,200),
('F_CL_ST_0007',2,5,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_ST_0007',2,'女款中階半開式拉鍊健身運動上衣1.jpg'),
('F_CL_ST_0007',null,'女款中階半開式拉鍊健身運動上衣2.jpg'),
('F_CL_ST_0007',null,'女款中階半開式拉鍊健身運動上衣3.jpg'),
('F_CL_ST_0007',1,'女款中階半開式拉鍊健身運動上衣4.jpg'),
('F_CL_ST_0007',null,'女款中階半開式拉鍊健身運動上衣5.jpg'),
('F_CL_ST_0007',null,'女款中階半開式拉鍊健身運動上衣6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_ST_0008','女款瑜珈中間短袖上衣 (貼膚柔軟)','正在尋找時尚的短版短袖 T 恤？好消息！我們的設計師為你設計了這款上衣。你一定會愛上這款產品的 超時尚風格。一整個星期都顯得休閒率性。採用觸感貼合肌膚的絲滑柔軟布料製成，你會想要一穿再穿。','主要布料 87% 莫代爾, 7% 蠶絲, 6% 彈性纖維','台灣',null,599,'false',null,2);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_ST_0008',1,1,220),
('F_CL_ST_0008',1,2,220),
('F_CL_ST_0008',1,3,220),
('F_CL_ST_0008',2,3,200),
('F_CL_ST_0008',2,4,200),
('F_CL_ST_0008',2,5,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_ST_0008',2,'女款瑜珈中間短袖上衣1.jpg'),
('F_CL_ST_0008',null,'女款瑜珈中間短袖上衣2.jpg'),
('F_CL_ST_0008',null,'女款瑜珈中間短袖上衣3.jpg'),
('F_CL_ST_0008',1,'女款瑜珈中間短袖上衣4.jpg'),
('F_CL_ST_0008',null,'女款瑜珈中間短袖上衣5.jpg'),
('F_CL_ST_0008',null,'女款瑜珈中間短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_ST_0001','兒童款高爾夫排汗短袖上衣','適合兒童在 10°C 以上的天候中打高爾夫時穿著。透氣且輕量。這款採用柔軟輕量布料製成的高爾夫 Polo 衫，能有效排汗並保持乾爽，適合打高爾夫時穿著。','主要布料 100% 聚酯纖維','台灣',500,400,'false',null,3);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_ST_0001',1,1,220),
('C_CL_ST_0001',1,2,3),
('C_CL_ST_0001',1,3,0),
('C_CL_ST_0001',2,3,150),
('C_CL_ST_0001',2,4,3);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_ST_0001',2,'75d6e809412e452a94ce51cf15dac53d.jpg'),
('C_CL_ST_0001',1,'be40fc127cce4e4a8d6eca64e43323be.jpg'),
('C_CL_ST_0001',null,'f9a3aa6666c24dccb8e0adbac0a8f6fe.jpg'),
('C_CL_ST_0001',null,'4e996c6713f24d969444f3460c404e65.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_ST_0002','兒童款純棉圓領T恤','色彩活潑、適合每日穿著的 T 恤。孩子的心情變化就像他們換 T 恤的次數一樣頻繁，所以我們打造了具有多種色彩的 100% 純棉系列。','棉 100%','台灣',550,450,'false',null,3);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_ST_0002',1,1,220),
('C_CL_ST_0002',1,3,220),
('C_CL_ST_0002',1,4,0),
('C_CL_ST_0002',3,2,300),
('C_CL_ST_0002',3,3,220),
('C_CL_ST_0002',3,4,50);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_ST_0002',3,'a065d92c606c4f2e90da19af26eead3c.jpg'),
('C_CL_ST_0002',1,'475db1a3df504d129e80162753f62b81.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_ST_0003','兒童款舒適棉質運動短袖上衣','T恤專為不易流汗的溫和運動設計柔軟的基本款短袖棉質T恤我們最基本舒適的T恤。 簡約修身剪裁，純棉 保證不會褪色或變形 領口柔軟，易於穿脫!','棉 100%','台灣',550,450,'false',null,3);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_ST_0003',2,1,220),
('C_CL_ST_0003',2,3,0),
('C_CL_ST_0003',2,4,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_ST_0003',2,'兒童款舒適棉質運動短袖上衣1.jpg'),
('C_CL_ST_0003',null,'兒童款舒適棉質運動短袖上衣2.jpg'),
('C_CL_ST_0003',null,'兒童款舒適棉質運動短袖上衣3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_ST_0004','兒童款短袖上衣','適合在家及學校操場進行各種活動時穿著。時尚剪裁與不可思議的觸感！柔軟又飄逸，並帶著斑駁色彩，舒適與風格兼具。提供多種顏色選擇，飾以小花細節，經典的設計可輕鬆搭配各種服裝。','主要布料 34% 聚酯纖維, 31.5% 棉, 31.5% 萊賽爾纖維, 3% 彈性纖維','台灣',550,400,'false',null,3);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_ST_0004',7,1,220),
('C_CL_ST_0004',7,2,0),
('C_CL_ST_0004',7,3,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_ST_0004',7,'兒童款短袖上衣1.jpg'),
('C_CL_ST_0004',null,'兒童款短袖上衣2.jpg'),
('C_CL_ST_0004',null,'兒童款短袖上衣3.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_ST_0005','女童款網球吸濕排汗短袖上衣','我們的設計人員開發了這款 T 恤，適合年幼的網球員在炎熱的天候下打網球穿著。也適合其他球拍類運動。剪裁設計讓運動者擁有絕佳的活動自由性。是一件非常輕便透氣的 T 恤。','主要布料 100% 聚酯纖維','台灣',null,399,'false',null,3);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_ST_0005',7,1,220),
('C_CL_ST_0005',7,2,3),
('C_CL_ST_0005',7,3,3),
('C_CL_ST_0005',8,3,220),
('C_CL_ST_0005',8,4,0),
('C_CL_ST_0005',8,5,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_ST_0005',7,'女童款網球吸濕排汗短袖上衣1.jpg'),
('C_CL_ST_0005',null,'女童款網球吸濕排汗短袖上衣2.jpg'),
('C_CL_ST_0005',null,'女童款網球吸濕排汗短袖上衣3.jpg'),
('C_CL_ST_0005',8,'女童款網球吸濕排汗短袖上衣4.jpg'),
('C_CL_ST_0005',null,'女童款網球吸濕排汗短袖上衣5.jpg'),
('C_CL_ST_0005',null,'女童款網球吸濕排汗短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_ST_0006','兒童中階純棉短袖上衣','適合兒童日常活動（學校等等）穿著的經典純棉 T 恤。展現時尚日常風格的棉質 T 恤。這款 T 恤主要採用棉質設計，柔軟又舒適。結合時尚與運動服裝風格，適合所有兒童活動。','主要布料 63% 棉, 34% 聚酯纖維, 3% 彈性纖維','越南',null,399,'false',null,3);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_ST_0006',5,1,220),
('C_CL_ST_0006',5,2,0),
('C_CL_ST_0006',5,3,220),
('C_CL_ST_0006',6,3,220),
('C_CL_ST_0006',6,4,3),
('C_CL_ST_0006',6,5,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_ST_0006',5,'兒童中階純棉短袖上衣1.jpg'),
('C_CL_ST_0006',null,'兒童中階純棉短袖上衣2.jpg'),
('C_CL_ST_0006',null,'兒童中階純棉短袖上衣3.jpg'),
('C_CL_ST_0006',6,'兒童中階純棉短袖上衣4.jpg'),
('C_CL_ST_0006',null,'兒童中階純棉短袖上衣5.jpg'),
('C_CL_ST_0006',null,'兒童中階純棉短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_ST_0007','兒童款透氣無縫田徑短袖上衣','側邊無接縫設計加上輕盈布料，提升舒適程度這款 T 恤的極輕盈布料和無縫設計，將成為孩子們在炎熱天氣下受訓的最佳盟友，即使進行高強度練習也能保持乾爽。','主要布料 72% 聚酯纖維, 28% 聚醯胺纖維','越南',null,499,'false',null,3);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_ST_0007',5,1,220),
('C_CL_ST_0007',5,2,0),
('C_CL_ST_0007',5,3,220),
('C_CL_ST_0007',2,3,220),
('C_CL_ST_0007',2,4,220),
('C_CL_ST_0007',2,5,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_ST_0007',5,'兒童款透氣無縫田徑短袖上衣1.jpg'),
('C_CL_ST_0007',null,'兒童款透氣無縫田徑短袖上衣2.jpg'),
('C_CL_ST_0007',null,'兒童款透氣無縫田徑短袖上衣3.jpg'),
('C_CL_ST_0007',2,'兒童款透氣無縫田徑短袖上衣4.jpg'),
('C_CL_ST_0007',null,'兒童款透氣無縫田徑短袖上衣5.jpg'),
('C_CL_ST_0007',null,'兒童款透氣無縫田徑短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_ST_0008','兒童款登山健行快乾短袖上衣','適合在各種天氣下挑戰有難度的登山健行路線時穿著。全系列最輕量也最透氣的產品。這款極致輕量、透氣的 T 恤是孩子從事登山健行活動的最佳夥伴。','100% 聚酯纖維','柬埔寨',null,499,'false',null,3);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_ST_0008',5,1,220),
('C_CL_ST_0008',5,2,220),
('C_CL_ST_0008',5,3,0),
('C_CL_ST_0008',8,3,220),
('C_CL_ST_0008',8,4,0),
('C_CL_ST_0008',8,5,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_ST_0008',5,'兒童款登山健行快乾短袖上衣1.jpg'),
('C_CL_ST_0008',null,'兒童款登山健行快乾短袖上衣2.jpg'),
('C_CL_ST_0008',null,'兒童款登山健行快乾短袖上衣3.jpg'),
('C_CL_ST_0008',8,'兒童款登山健行快乾短袖上衣4.jpg'),
('C_CL_ST_0008',null,'兒童款登山健行快乾短袖上衣5.jpg'),
('C_CL_ST_0008',null,'兒童款登山健行快乾短袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_LG_0001','男款高爾夫修身長袖上衣 (圓領針織衫)','適合在 10°C 到 20°C 的溫和氣候中打高爾夫球時穿著 。柔軟的100%棉質圓領針織衫柔軟的100%棉質圓領針織衫！','主要布料 100% 棉','台灣',499,399,'false',null,4);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_LG_0001',3,1,220),
('M_CL_LG_0001',3,2,150),
('M_CL_LG_0001',6,3,180),
('M_CL_LG_0001',6,4,150);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_LG_0001',6,'cdbe0166563b407da8f9eb93bd8c224b.jpg'),
('M_CL_LG_0001',null,'620f98175f14483684fc9559c9b7f232.jpg'),
('M_CL_LG_0001',3,'7e21a40b6f684b96a168ad183af2e053.jpg'),
('M_CL_LG_0001',null,'09c674f4711d4864963f7b1b7c92de7c.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,Status,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_LG_0002','上衣008','這是長袖上衣002','88% 聚酯纖維/12% 彈性纖維','台灣',null,1350,'true','true',null,4);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_LG_0002',4,1,0),
('M_CL_LG_0002',4,2,0),
('M_CL_LG_0002',5,4,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_LG_0002',null,'Product_0081.jpg'),
('M_CL_LG_0002',null,'Product_0082.jpg'),
('M_CL_LG_0002',null,'Product_0083.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_LG_0003','男款登山健行保暖刷毛長袖上衣','我們由健行者組成的團隊在白朗峰山腳下採用環保概念設計出這款保暖、透氣並且價格實惠的刷毛上衣，適合偶爾登山健行時穿著。再生材質或環保染料。','主要布料 100% 聚酯纖維','台灣',800,699,'false',null,4);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_LG_0003',3,1,220),
('M_CL_LG_0003',3,2,200),
('M_CL_LG_0003',3,3,0),
('M_CL_LG_0003',8,3,180),
('M_CL_LG_0003',8,4,3);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_LG_0003',3,'男款登山健行保暖刷毛長袖上衣1.jpg'),
('M_CL_LG_0003',null,'男款登山健行保暖刷毛長袖上衣2.jpg'),
('M_CL_LG_0003',null,'男款登山健行保暖刷毛長袖上衣3.jpg'),
('M_CL_LG_0003',8,'男款登山健行保暖刷毛長袖上衣4.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_LG_0004','男款保暖網球長袖上衣','舒適地在寒冷氣溫中遊玩！天氣變冷時，這款網球 T 恤可讓你保持溫暖。富彈性的布料和無縫結構可確保活動自由且舒適。','主要布料 71% 聚酯纖維, 26% 聚醯胺纖維, 3% 彈性纖維','台灣',800,699,'false',null,4);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_LG_0004',1,1,220),
('M_CL_LG_0004',1,2,3),
('M_CL_LG_0004',1,3,3),
('M_CL_LG_0004',5,3,180),
('M_CL_LG_0004',5,4,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_LG_0004',1,'男款保暖網球長袖上衣1.jpg'),
('M_CL_LG_0004',null,'男款保暖網球長袖上衣2.jpg'),
('M_CL_LG_0004',null,'男款保暖網球長袖上衣3.jpg'),
('M_CL_LG_0004',5,'男款保暖網球長袖上衣4.jpg'),
('M_CL_LG_0004',null,'男款保暖網球長袖上衣5.jpg'),
('M_CL_LG_0004',null,'男款保暖網球長袖上衣6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_LG_0005','男款高爾夫修身長袖上衣','我們的高爾夫設計師開發了這款長袖Polo衫，適合在10°C到20°C的溫和天候中打高爾夫球時穿著。溫和天候中打高爾夫球的最佳選擇。溫和天候中打高爾夫球的最佳選擇。','主要布料 65% 棉, 35% 聚酯纖維','台灣',null,699,'false','新品',4);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_LG_0005',4,1,220),
('M_CL_LG_0005',4,2,200),
('M_CL_LG_0005',4,3,0),
('M_CL_LG_0005',5,3,180),
('M_CL_LG_0005',5,4,3);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_LG_0005',4,'男款高爾夫修身長袖上衣1.jpg'),
('M_CL_LG_0005',5,'男款高爾夫修身長袖上衣4.jpg'),
('M_CL_LG_0005',null,'男款高爾夫修身長袖上衣5.jpg'),
('M_CL_LG_0005',null,'男款高爾夫修身長袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_LG_0006','男款刷毛保暖跑步長袖上衣 RUN WARM','保暖這款長袖 T 恤的布料柔軟又保暖，讓你可以在寒冷的天氣裡跑步，同時將汗水排出。可以當成內衣，或穿在 T 恤外面。','主要布料 91% 聚酯纖維, 9% 彈性纖維','台灣',null,799,'false',null,4);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_LG_0006',1,1,220),
('M_CL_LG_0006',1,2,200),
('M_CL_LG_0006',1,3,0),
('M_CL_LG_0006',3,2,200),
('M_CL_LG_0006',3,3,200),
('M_CL_LG_0006',5,3,180),
('M_CL_LG_0006',5,4,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_LG_0006',1,'男款刷毛保暖跑步長袖上衣1.jpg'),
('M_CL_LG_0006',null,'男款刷毛保暖跑步長袖上衣2.jpg'),
('M_CL_LG_0006',3,'男款刷毛保暖跑步長袖上衣3.jpg'),
('M_CL_LG_0006',null,'男款刷毛保暖跑步長袖上衣4.jpg'),
('M_CL_LG_0006',5,'男款刷毛保暖跑步長袖上衣5.jpg'),
('M_CL_LG_0006',null,'男款刷毛保暖跑步長袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_LG_0007','男款保暖網球長袖上衣 RUN WARM','這件上衣讓你在保持透氣的同時也保持身體溫暖，非常適合穿著在寒冷的天氣裡打網球。運動強度增加時，半拉鍊設計可讓你隨著體溫改變調整拉鍊位置。','主要布料 91% 聚酯纖維 9% 彈性纖維','台灣',null,599,'false',null,4);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_LG_0007',5,1,220),
('M_CL_LG_0007',5,2,200),
('M_CL_LG_0007',5,3,0),
('M_CL_LG_0007',3,2,200),
('M_CL_LG_0007',3,3,3),
('M_CL_LG_0007',2,1,180),
('M_CL_LG_0007',2,2,3);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_LG_0007',5,'男款保暖網球長袖上衣11.jpg'),
('M_CL_LG_0007',null,'男款保暖網球長袖上衣12.jpg'),
('M_CL_LG_0007',2,'男款保暖網球長袖上衣13.jpg'),
('M_CL_LG_0007',null,'男款保暖網球長袖上衣14.jpg'),
('M_CL_LG_0007',3,'男款保暖網球長袖上衣15.jpg'),
('M_CL_LG_0007',null,'男款保暖網球長袖上衣16.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_LG_0008','男款保暖跑步長袖 T 恤 Warm 500','保暖又透氣無論是當作第一層或是第二層衣物穿著，這款長袖 T 恤的機能材質都能提供良好的保暖效果及更佳的透氣性。','主要布料 92% 聚酯纖維, 8% 彈性纖維','台灣',null,600,'false',null,4);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_LG_0008',1,3,220),
('M_CL_LG_0008',1,4,200),
('M_CL_LG_0008',1,5,200),
('M_CL_LG_0008',2,1,200),
('M_CL_LG_0008',2,2,200),
('M_CL_LG_0008',2,3,180),
('M_CL_LG_0008',2,4,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_CL_LG_0008',1,'男款保暖跑步長袖11.jpg'),
('M_CL_LG_0008',null,'男款保暖跑步長袖12.jpg'),
('M_CL_LG_0008',null,'男款保暖跑步長袖13.jpg'),
('M_CL_LG_0008',2,'男款保暖跑步長袖14.jpg'),
('M_CL_LG_0008',null,'男款保暖跑步長袖15.jpg'),
('M_CL_LG_0008',null,'男款保暖跑步長袖16.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,Status,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_LG_0001','女款 長袖連帽保暖排汗衣','能迅速把汗水吸到衣服表面，然後快速蒸發掉，才不會在吹到風的時候感冒，同時，也能在涼涼的天氣中，幫你維持體溫確保溫。','採用DAO™抗臭處理及FC0紗線的Phasic™AR II面料','台灣',null,2500,'true','false','限量',5);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_LG_0001',1,1,220),
('F_CL_LG_0001',1,2,200),
('F_CL_LG_0001',1,3,3),
('F_CL_LG_0001',5,3,180),
('F_CL_LG_0001',5,4,150);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_LG_0001',5,'4aa9971fac1d46aaaf1ad98ac4547b9b.jpg'),
('F_CL_LG_0001',null,'0cac753e1aae4728a93d94044326304e.jpg'),
('F_CL_LG_0001',1,'c392821690d34aed938ad499f74f5fb7.jpg'),
('F_CL_LG_0001',null,'8b82eb19391043a0aabf4d669e773d6c.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_LG_0002','女款街舞短版長袖上衣','採用立體布料打造這款短版運動衫。抽繩設計讓你輕鬆調整。正在尋找舒適又有型的街舞運動衫？運動衫兩側搭配刺繡加強服裝立體感，讓你時尚熱舞！','主要布料 54% 聚酯纖維, 46% 棉 羅紋布料 96% 棉, 4% 彈性纖維','台灣',null,699,'false',null,5);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_LG_0002',1,1,120),
('F_CL_LG_0002',1,3,0),
('F_CL_LG_0002',1,4,320),
('F_CL_LG_0002',2,1,150),
('F_CL_LG_0002',2,2,3),
('F_CL_LG_0002',2,3,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_LG_0002',2,'de3b4acd3fc74a55945a947f9e7a3f65.jpg'),
('F_CL_LG_0002',null,'6f7eec7ee1bd42b482a8cd1d5c2ca4db.jpg'),
('F_CL_LG_0002',1,'6889e0a89cff463288bbfa9970c46f14.jpg'),
('F_CL_LG_0002',null,'afbc7af143614b889f5dbf3693d27d2b.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_LG_0003','女款防曬 UPF50+ 跑步長袖上衣','我們為希望在溫暖或溫和的春秋季節中跑步時獲得防曬保護的女性跑者開發這款 T 恤。紫外線防護採用柔軟的抗紫外線布料，可為你於跑步時提供防曬保護的長袖跑步 T 恤！','主要布料 100% 聚酯纖維','台灣',700,599,'false',null,5);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_LG_0003',1,1,120),
('F_CL_LG_0003',1,3,3),
('F_CL_LG_0003',1,5,3),
('F_CL_LG_0003',2,1,150),
('F_CL_LG_0003',2,2,3),
('F_CL_LG_0003',2,3,3),
('F_CL_LG_0003',7,1,150),
('F_CL_LG_0003',7,2,0),
('F_CL_LG_0003',7,3,150);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_LG_0003',1,'女款防曬 UPF50+ 跑步長袖上衣1.jpg'),
('F_CL_LG_0003',null,'女款防曬 UPF50+ 跑步長袖上衣2.jpg'),
('F_CL_LG_0003',2,'女款防曬 UPF50+ 跑步長袖上衣3.jpg'),
('F_CL_LG_0003',null,'女款防曬 UPF50+ 跑步長袖上衣4.jpg'),
('F_CL_LG_0003',7,'女款防曬 UPF50+ 跑步長袖上衣5.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_LG_0004','女款防曬衝浪長袖水母衣','我們為了各種程度的女性衝浪者設計出這款抗UV T恤，適合中階衝浪者在小於1 m的海浪中衝浪時穿著。抽繩設計可確保衣服在浪中的穩定性。','主要布料 82% 聚酯纖維, 18% 彈性纖維','台灣',800,699,'false',null,5);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_LG_0004',1,1,120),
('F_CL_LG_0004',1,3,0),
('F_CL_LG_0004',1,4,3),
('F_CL_LG_0004',2,1,150),
('F_CL_LG_0004',2,2,3),
('F_CL_LG_0004',2,3,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_LG_0004',1,'女款防曬衝浪長袖水母衣1.jpg'),
('F_CL_LG_0004',null,'女款防曬衝浪長袖水母衣2.jpg'),
('F_CL_LG_0004',null,'女款防曬衝浪長袖水母衣3.jpg'),
('F_CL_LG_0004',2,'女款防曬衝浪長袖水母衣4.jpg'),
('F_CL_LG_0004',null,'女款防曬衝浪長袖水母衣5.jpg'),
('F_CL_LG_0004',null,'女款防曬衝浪長袖水母衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_LG_0005','女款透氣柔軟跑步長袖上衣 (半拉鍊式)','透氣並具有良好的包覆性。長袖運動衫採用透氣半拉鍊設計，擁有良好包覆性，全年跑步皆適合穿著！','主要布料 83% 聚酯纖維, 17%','台灣',800,699,'false','新品',5);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_LG_0005',1,1,120),
('F_CL_LG_0005',1,3,0),
('F_CL_LG_0005',1,4,320),
('F_CL_LG_0005',4,1,150),
('F_CL_LG_0005',4,2,0),
('F_CL_LG_0005',4,3,150),
('F_CL_LG_0005',7,1,120),
('F_CL_LG_0005',7,3,220),
('F_CL_LG_0005',7,4,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_LG_0005',1,'女款透氣柔軟跑步長袖上衣半拉鍊式1.jpg'),
('F_CL_LG_0005',null,'女款透氣柔軟跑步長袖上衣半拉鍊式2.jpg'),
('F_CL_LG_0005',4,'女款透氣柔軟跑步長袖上衣半拉鍊式3.jpg'),
('F_CL_LG_0005',null,'女款透氣柔軟跑步長袖上衣半拉鍊式4.jpg'),
('F_CL_LG_0005',7,'女款透氣柔軟跑步長袖上衣半拉鍊式5.jpg'),
('F_CL_LG_0005',null,'女款透氣柔軟跑步長袖上衣半拉鍊式6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_LG_0006','女款保暖跑步套頭衫','這款舒適運動衫/衛衣的高領半拉鏈設計可以讓你在運動時或日常活動中保持暖和。','主要布料 83% 聚酯纖維, 17%','台灣',null,699,'false','新品',5);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_LG_0006',1,1,120),
('F_CL_LG_0006',1,3,220),
('F_CL_LG_0006',1,4,320),
('F_CL_LG_0006',7,1,150),
('F_CL_LG_0006',7,2,150),
('F_CL_LG_0006',7,3,150);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_LG_0006',1,'女款保暖跑步套頭衫1.jpg'),
('F_CL_LG_0006',null,'女款保暖跑步套頭衫2.jpg'),
('F_CL_LG_0006',null,'女款保暖跑步套頭衫3.jpg'),
('F_CL_LG_0006',7,'女款保暖跑步套頭衫4.jpg'),
('F_CL_LG_0006',null,'女款保暖跑步套頭衫5.jpg'),
('F_CL_LG_0006',null,'女款保暖跑步套頭衫6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_LG_0007','女款高爾夫保暖長袖上衣(針織衫)','適合在 10°C 到 20°C 的溫和氣候中打高爾夫球時穿著。柔軟的100 %棉質針織衫柔軟的100 %棉質針織衫！','主要布料 100% 棉','越南',null,699,'false','新品',5);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_LG_0007',2,1,120),
('F_CL_LG_0007',2,3,220),
('F_CL_LG_0007',2,4,320),
('F_CL_LG_0007',6,1,150),
('F_CL_LG_0007',6,2,150),
('F_CL_LG_0007',6,3,150);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_LG_0007',2,'女款高爾夫保暖長袖上衣針織衫1.jpg'),
('F_CL_LG_0007',null,'女款高爾夫保暖長袖上衣針織衫2.jpg'),
('F_CL_LG_0007',null,'女款高爾夫保暖長袖上衣針織衫3.jpg'),
('F_CL_LG_0007',6,'女款高爾夫保暖長袖上衣針織衫4.jpg'),
('F_CL_LG_0007',null,'女款高爾夫保暖長袖上衣針織衫5.jpg'),
('F_CL_LG_0007',null,'女款高爾夫保暖長袖上衣針織衫6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_LG_0008','女款健身運動長袖上衣 (寬鬆剪裁)','我們的服裝設計師為讓你在健身房與其他地方看起來都時尚有型，打造了這款寬鬆剪裁運動衫。','主要布料 50% 棉, 47% 聚酯纖維, 3% 彈性纖維','越南',null,699,'false','新品',5);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_LG_0008',5,1,120),
('F_CL_LG_0008',5,3,220),
('F_CL_LG_0008',5,4,320),
('F_CL_LG_0008',6,1,150),
('F_CL_LG_0008',6,2,150),
('F_CL_LG_0008',6,3,150);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_CL_LG_0008',5,'女款健身運動長袖上衣寬鬆剪裁1.jpg'),
('F_CL_LG_0008',null,'女款健身運動長袖上衣寬鬆剪裁2.jpg'),
('F_CL_LG_0008',null,'女款健身運動長袖上衣寬鬆剪裁3.jpg'),
('F_CL_LG_0008',6,'女款健身運動長袖上衣寬鬆剪裁4.jpg'),
('F_CL_LG_0008',null,'女款健身運動長袖上衣寬鬆剪裁5.jpg'),
('F_CL_LG_0008',null,'女款健身運動長袖上衣寬鬆剪裁6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_LG_0001','兒童款登山健行保暖刷毛長袖上衣','我們由小小健行者的父母所組成的團隊設計了這款刷毛上衣，保護孩子進行各種戶外活動時免受寒冷。保暖刷毛、半開式拉鍊及再生紗線！保暖、輕量又舒適的刷毛外套，方便孩子隨身攜帶。採用回收瓶罐製成，符合我們環保設計的宗旨。','主要布料 100% 聚酯纖維','台灣',null,399,'false',null,6);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_LG_0001',6,1,220),
('C_CL_LG_0001',6,2,100),
('C_CL_LG_0001',6,5,30);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_LG_0001',6,'872ff985c72e4eadaa65b9ea3a0fdd16.jpg'),
('C_CL_LG_0001',null,'61c28b8e1cbc4f96b5d1100c1be300c3.jpg'),
('C_CL_LG_0001',null,'29a8dbd4b6d04d32ac85a36748e09216.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_LG_0002','兒童款高爾夫長袖上衣 (拉鍊針織衫)','適合兒童在寒冷多風的天候中打高爾夫時穿著。內建防風薄膜的彈性立領針織衫。孩子因為覺得寒冷而不想打高爾夫嗎？這款立領針織衫採用的材質具有絕佳的舒適性及保暖性，適合孩子下場打球時穿著。','主要布料 100% 棉 內襯 100% 聚酯纖維','台灣',null,500,'false',null,6);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_LG_0002',1,1,220),
('C_CL_LG_0002',1,2,100),
('C_CL_LG_0002',7,2,100),
('C_CL_LG_0002',7,3,80);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_LG_0002',7,'e9e88d1e793f417ea54ecb55f6587fef.jpg'),
('C_CL_LG_0002',null,'f313c0da729645a496b81157ef5a12d1.jpg'),
('C_CL_LG_0002',null,'a1ef172e35d747fe9bc73359fbd8d2c9.jpg'),
('C_CL_LG_0002',1,'63277657ebb94c648bfcda28f78a8e4f.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_LG_0003','兒童款網球舒適保暖長袖上衣','適合所有球拍運動，立領拉鍊設計讓你保持溫暖！此運動衣使用隔熱材質，專門為在冬天裡打網球和其他球拍運動而設計。','主要布料 91% 聚酯纖維, 9% 彈性纖維','台灣',600,500,'false',null,6);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_LG_0003',1,1,220),
('C_CL_LG_0003',1,2,200),
('C_CL_LG_0003',1,3,200),
('C_CL_LG_0003',2,2,200),
('C_CL_LG_0003',2,3,200),
('C_CL_LG_0003',2,4,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_LG_0003',1,'兒童款網球舒適保暖長袖上衣1.jpg'),
('C_CL_LG_0003',null,'兒童款網球舒適保暖長袖上衣2.jpg'),
('C_CL_LG_0003',null,'兒童款網球舒適保暖長袖上衣3.jpg'),
('C_CL_LG_0003',2,'兒童款網球舒適保暖長袖上衣4.jpg'),
('C_CL_LG_0003',null,'兒童款網球舒適保暖長袖上衣5.jpg'),
('C_CL_LG_0003',null,'兒童款網球舒適保暖長袖上衣6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_LG_0004','兒童滑雪打底上衣','專為在寒冷天氣滑雪並希望在保暖與透氣之間具有良好平衡的小小滑雪玩家設計。搭配背部網眼布料，溫暖透氣。','主要布料 91% 聚酯纖維, 9%','台灣',600,499,'false',null,6);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_LG_0004',8,1,220),
('C_CL_LG_0004',8,2,200),
('C_CL_LG_0004',8,3,200),
('C_CL_LG_0004',2,2,200),
('C_CL_LG_0004',2,3,200),
('C_CL_LG_0004',2,4,180);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_LG_0004',2,'兒童滑雪打底上衣1.jpg'),
('C_CL_LG_0004',null,'兒童滑雪打底上衣2.jpg'),
('C_CL_LG_0004',null,'兒童滑雪打底上衣3.jpg'),
('C_CL_LG_0004',8,'兒童滑雪打底上衣4.jpg'),
('C_CL_LG_0004',null,'兒童滑雪打底上衣5.jpg'),
('C_CL_LG_0004',null,'兒童滑雪打底上衣6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_LG_0005','兒童運動長袖上衣','自然有彈性且非常柔軟。無連帽設計。羅紋袖口、下擺及領口。','主要布料 58% 聚酯纖維, 42% 棉','台灣',null,599,'false',null,6);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_LG_0005',3,1,220),
('C_CL_LG_0005',3,2,200),
('C_CL_LG_0005',3,3,200),
('C_CL_LG_0005',5,2,200),
('C_CL_LG_0005',5,3,200),
('C_CL_LG_0005',5,4,180);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_LG_0005',3,'兒童運動長袖上衣1.jpg'),
('C_CL_LG_0005',null,'兒童運動長袖上衣2.jpg'),
('C_CL_LG_0005',null,'兒童運動長袖上衣3.jpg'),
('C_CL_LG_0005',5,'兒童運動長袖上衣4.jpg'),
('C_CL_LG_0005',null,'兒童運動長袖上衣5.jpg'),
('C_CL_LG_0005',null,'兒童運動長袖上衣6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_LG_0006','兒童刷毛連帽長袖上衣','專為兒童日常使用而設計的刷毛針織連帽運動衫，適合在家和在運動場上進行各種活動時穿著。','主要布料 58% 聚酯纖維, 42% 棉','台灣',null,599,'false',null,6);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_LG_0006',6,1,220),
('C_CL_LG_0006',6,2,200),
('C_CL_LG_0006',6,3,200),
('C_CL_LG_0006',8,2,200),
('C_CL_LG_0006',8,3,200),
('C_CL_LG_0006',8,4,180);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_LG_0006',6,'兒童刷毛連帽長袖上衣1.jpg'),
('C_CL_LG_0006',null,'兒童刷毛連帽長袖上衣2.jpg'),
('C_CL_LG_0006',null,'兒童刷毛連帽長袖上衣3.jpg'),
('C_CL_LG_0006',8,'兒童刷毛連帽長袖上衣4.jpg'),
('C_CL_LG_0006',null,'兒童刷毛連帽長袖上衣5.jpg'),
('C_CL_LG_0006',null,'兒童刷毛連帽長袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_LG_0007','兒童基礎健身長袖上衣','適合日常活動（學校等等）的簡單、實用兒童棉質圓領運動衫。柔軟的基本款換季圓領運動衫。','主要布料 57% 棉, 38% 聚酯纖維','台灣',600,450,'false','新品',6);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_LG_0007',3,1,220),
('C_CL_LG_0007',3,2,0),
('C_CL_LG_0007',3,3,200),
('C_CL_LG_0007',7,2,200),
('C_CL_LG_0007',7,3,200),
('C_CL_LG_0007',7,4,180);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_LG_0007',3,'兒童基礎健身長袖上衣1.jpg'),
('C_CL_LG_0007',null,'兒童基礎健身長袖上衣2.jpg'),
('C_CL_LG_0007',null,'兒童基礎健身長袖上衣3.jpg'),
('C_CL_LG_0007',7,'兒童基礎健身長袖上衣4.jpg'),
('C_CL_LG_0007',null,'兒童基礎健身長袖上衣5.jpg'),
('C_CL_LG_0007',null,'兒童基礎健身長袖上衣6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_LG_0008','兒童中階保暖連帽外套','經典連帽外套：採用運動前中後都能保暖的布料、 自然有彈性且非常柔軟、 2 個口袋、 袖口與下襬有鬆緊帶。','主要布料 58% 聚酯纖維, 42% 棉','台灣',600,500,'false','新品',6);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_LG_0008',2,1,220),
('C_CL_LG_0008',2,2,200),
('C_CL_LG_0008',2,3,200),
('C_CL_LG_0008',7,2,200),
('C_CL_LG_0008',7,3,200),
('C_CL_LG_0008',7,4,180);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_CL_LG_0008',2,'兒童中階保暖連帽外套1.jpg'),
('C_CL_LG_0008',null,'兒童中階保暖連帽外套2.jpg'),
('C_CL_LG_0008',null,'兒童中階保暖連帽外套3.jpg'),
('C_CL_LG_0008',7,'兒童中階保暖連帽外套4.jpg'),
('C_CL_LG_0008',null,'兒童中階保暖連帽外套5.jpg'),
('C_CL_LG_0008',null,'兒童中階保暖連帽外套6.jpg');



-------------------------------------------------

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_ST_0001','素色鬆緊綁帶短褲','素色鬆緊綁帶短褲','50%棉、50%聚酯纖維','柬埔寨',399,299,'false',null,7);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_ST_0001',8,1,100),
('M_PA_ST_0001',8,2,200),
('M_PA_ST_0001',3,3,280),
('M_PA_ST_0001',3,4,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_ST_0001',3,'6534c5a24b5845d9857a6de57ca10cb3.jpg'),
('M_PA_ST_0001',8,'550af4ee0a2047d69bf578c0bbe63fa7.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_ST_0002','無襯裡多功能短褲','短褲專為跑步、訓練和瑜伽運動而設計，讓你輕鬆應對、自在暢動。','75% 的再生聚酯纖維','台灣',499,399,'false','限量',7);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_ST_0002',1,1,220),
('M_PA_ST_0002',1,2,100),
('M_PA_ST_0002',1,3,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_ST_0002',1,'4475b05bc8bc4dcfb0c84e1abeb6bf1f.jpg'),
('M_PA_ST_0002',null,'308f86d35819435ab4e545e36f80b284.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_ST_0003','男款初階健身短褲 (拉鍊口袋)','附拉鍊口袋的環保彈性短褲健身時，你需要能應付任何訓練的短褲！','主要布料 100% 聚酯纖維','台灣',null,499,'false','新品',7);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_ST_0003',1,1,220),
('M_PA_ST_0003',1,2,200),
('M_PA_ST_0003',1,3,3),
('M_PA_ST_0003',3,1,220),
('M_PA_ST_0003',3,2,200),
('M_PA_ST_0003',8,2,220),
('M_PA_ST_0003',8,3,3),
('M_PA_ST_0003',8,4,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_ST_0003',1,'男款初階健身短褲拉鍊口袋1.jpg'),
('M_PA_ST_0003',null,'男款初階健身短褲拉鍊口袋2.jpg'),
('M_PA_ST_0003',3,'男款初階健身短褲拉鍊口袋3.jpg'),
('M_PA_ST_0003',null,'男款初階健身短褲拉鍊口袋4.jpg'),
('M_PA_ST_0003',8,'男款初階健身短褲拉鍊口袋5.jpg'),
('M_PA_ST_0003',null,'男款初階健身短褲拉鍊口袋6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_ST_0004','成人超輕量排汗籃球褲 B300','能有效排汗並讓你保持乾爽！這系列透氣的運動短褲是你入門打籃球的最佳選擇。','主要布料 100% 聚酯纖維','台灣',null,499,'false','新品',7);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_ST_0004',1,1,220),
('M_PA_ST_0004',1,2,200),
('M_PA_ST_0004',1,3,0),
('M_PA_ST_0004',5,2,220),
('M_PA_ST_0004',5,3,0),
('M_PA_ST_0004',5,4,180);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_ST_0004',1,'成人超輕量排汗籃球褲1.jpg'),
('M_PA_ST_0004',null,'成人超輕量排汗籃球褲2.jpg'),
('M_PA_ST_0004',null,'成人超輕量排汗籃球褲3.jpg'),
('M_PA_ST_0004',5,'成人超輕量排汗籃球褲4.jpg'),
('M_PA_ST_0004',null,'成人超輕量排汗籃球褲5.jpg'),
('M_PA_ST_0004',null,'成人超輕量排汗籃球褲6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_ST_0005','男款初階健身短褲','環境友善設計這款棉質短褲外型簡約，可在你進行各種運動及日常生活中提供全然的活動自由。','主要布料 60% 棉, 40% 聚酯纖維','台灣',700,599,'false','新品',7);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_ST_0005',1,1,220),
('M_PA_ST_0005',1,2,200),
('M_PA_ST_0005',1,3,3),
('M_PA_ST_0005',3,2,220),
('M_PA_ST_0005',3,3,200),
('M_PA_ST_0005',3,4,3);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_ST_0005',1,'男款初階健身短褲1.jpg'),
('M_PA_ST_0005',null,'男款初階健身短褲2.jpg'),
('M_PA_ST_0005',null,'男款初階健身短褲3.jpg'),
('M_PA_ST_0005',3,'男款初階健身短褲4.jpg'),
('M_PA_ST_0005',null,'男款初階健身短褲5.jpg'),
('M_PA_ST_0005',null,'男款初階健身短褲6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_ST_0006','成人款足球短褲 F100','適合讓你每週進行2次以下的訓練或比賽時穿著。','主要布料 100% 聚酯纖維','台灣',null,599,'false','新品',7);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_ST_0006',1,1,220),
('M_PA_ST_0006',1,2,200),
('M_PA_ST_0006',1,3,0),
('M_PA_ST_0006',2,2,220),
('M_PA_ST_0006',2,3,200),
('M_PA_ST_0006',2,4,180);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_ST_0006',1,'成人款足球短褲1.jpg'),
('M_PA_ST_0006',null,'成人款足球短褲2.jpg'),
('M_PA_ST_0006',null,'成人款足球短褲3.jpg'),
('M_PA_ST_0006',2,'成人款足球短褲4.jpg'),
('M_PA_ST_0006',null,'成人款足球短褲5.jpg'),
('M_PA_ST_0006',null,'成人款足球短褲6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_ST_0007','男款登山健行多口袋透氣短褲','我們的設計師設計了這款短褲，讓你能夠安心地環遊世界，不受環境所限。','主要布料 65% 棉, 35% 聚酯纖維','台灣',null,599,'false','新品',7);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_ST_0007',1,1,220),
('M_PA_ST_0007',1,2,200),
('M_PA_ST_0007',1,3,180);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_ST_0007',1,'男款登山健行多口袋透氣短褲1.jpg'),
('M_PA_ST_0007',null,'男款登山健行多口袋透氣短褲2.jpg'),
('M_PA_ST_0007',null,'男款登山健行多口袋透氣短褲3.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_ST_0008','男款網球輕量排汗速乾短褲','適合想學球拍類運動又不想感到悶熱的球員穿著。輕量；口袋可容納3顆網球！','主要布料 100% 聚酯纖維','台灣',null,499,'false','新品',7);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_ST_0008',2,1,220),
('M_PA_ST_0008',2,2,200),
('M_PA_ST_0008',2,3,180),
('M_PA_ST_0008',5,2,220),
('M_PA_ST_0008',5,3,0),
('M_PA_ST_0008',5,4,180);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_ST_0008',2,'男款網球輕量排汗速乾短褲1.jpg'),
('M_PA_ST_0008',null,'男款網球輕量排汗速乾短褲2.jpg'),
('M_PA_ST_0008',null,'男款網球輕量排汗速乾短褲3.jpg'),
('M_PA_ST_0008',5,'男款網球輕量排汗速乾短褲4.jpg'),
('M_PA_ST_0008',null,'男款網球輕量排汗速乾短褲5.jpg'),
('M_PA_ST_0008',null,'男款網球輕量排汗速乾短褲6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_ST_0009','男款舒適短車褲','我們專為協助你順利展開公路車騎行設計的自行車短褲。試試這款短褲，告別惱人的疼痛刺激！','主要布料 85% 聚酯纖維, 15% 彈性纖維','台灣',null,499,'false','新品',7);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_ST_0009',1,1,220),
('M_PA_ST_0009',1,2,200),
('M_PA_ST_0009',1,3,180);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_ST_0009',1,'男款舒適短車褲1.jpg'),
('M_PA_ST_0009',null,'男款舒適短車褲2.jpg'),
('M_PA_ST_0009',null,'男款舒適短車褲3.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,Status,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_ST_0001','女款及膝自行車短褲','這款及膝自行車短褲結合外在的俐落褲頭設計與內藏式鬆緊帶，讓摯愛內搭褲彈性十足又穩固不移位。','63% 人造纖維/32% 尼龍/5% 彈性纖維','斯里蘭卡',null,1580,'true','false',null,8);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_ST_0001',1,1,220),
('F_PA_ST_0001',1,2,100),
('F_PA_ST_0001',1,4,50);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_ST_0001',1,'5f4c620b20db48f3bd3e9a7b256a7aaa.jpg'),
('F_PA_ST_0001',null,'526cae16a55948c8a158551870a6996a.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_ST_0002','女款高爾夫短褲','短褲滑順有彈性，是衣櫥百搭單品。採用腰部魔鬼氈扣合設計等量身訂製細節，打造經典造型，並搭配多個網布內裡口袋，提供多元實用性。','89% 聚酯纖維/11% 彈性纖維','印尼',null,1500,'false',null,8);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_ST_0002',1,1,220),
('F_PA_ST_0002',1,2,100),
('F_PA_ST_0002',2,3,80),
('F_PA_ST_0002',2,5,30);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_ST_0002',2,'48f61c9653804b2fbee6c083f7b4011d.jpg'),
('F_PA_ST_0002',null,'eec893cdd40e41cfa4e075e0f6bd2ec3.jpg'),
('F_PA_ST_0002',1,'73ce9584969445f6bf4c4f00a7f03f4a.jpg'),
('F_PA_ST_0002',null,'2f897bed2e6647628562163f97130075.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_ST_0003','女款高階健身短褲 (二合一)','讓你運動時保持舒適的動感、柔美二合一健身短褲。會讓你愛上的柔美二合一剪裁。','主要布料 86% 聚酯纖維, 14% 彈性纖維','印尼',700,499,'false','新品',8);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_ST_0003',5,1,220),
('F_PA_ST_0003',5,2,200),
('F_PA_ST_0003',5,3,0),
('F_PA_ST_0003',8,3,180),
('F_PA_ST_0003',8,4,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_ST_0003',5,'女款高階健身短褲二合一1.jpg'),
('F_PA_ST_0003',null,'女款高階健身短褲二合一2.jpg'),
('F_PA_ST_0003',null,'女款高階健身短褲二合一3.jpg'),
('F_PA_ST_0003',8,'女款高階健身短褲二合一4.jpg'),
('F_PA_ST_0003',null,'女款高階健身短褲二合一5.jpg'),
('F_PA_ST_0003',null,'女款高階健身短褲二合一6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_ST_0004','女款初階健身短褲','寬鬆剪裁的基本款短褲，運動時可單穿或穿在緊身褲外面。你一定會喜歡的舒適寬鬆剪裁。','主要布料 100% 聚酯纖維 ','印尼',600,499,'false','新品',8);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_ST_0004',5,1,220),
('F_PA_ST_0004',5,2,200),
('F_PA_ST_0004',5,3,200),
('F_PA_ST_0004',1,3,180),
('F_PA_ST_0004',1,4,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_ST_0004',5,'女款初階健身短褲1.jpg'),
('F_PA_ST_0004',null,'女款初階健身短褲2.jpg'),
('F_PA_ST_0004',null,'女款初階健身短褲3.jpg'),
('F_PA_ST_0004',1,'女款初階健身短褲4.jpg'),
('F_PA_ST_0004',null,'女款初階健身短褲5.jpg'),
('F_PA_ST_0004',null,'女款初階健身短褲6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_ST_0005','女款登山健行透氣短裙 (褲裙)','適合經常在平原、森林或海岸健行時穿著。兼具短褲的舒適度與短裙的外型！','主要布料 79% 棉, 19% 聚酯纖維, 2% 彈性纖維 ','印尼',null,499,'false','新品',8);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_ST_0005',2,1,220),
('F_PA_ST_0005',2,2,200),
('F_PA_ST_0005',2,3,200),
('F_PA_ST_0005',6,2,230),
('F_PA_ST_0005',6,3,0),
('F_PA_ST_0005',6,4,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_ST_0005',2,'女款登山健行透氣短裙褲裙1.jpg'),
('F_PA_ST_0005',null,'女款登山健行透氣短裙褲裙2.jpg'),
('F_PA_ST_0005',null,'女款登山健行透氣短裙褲裙3.jpg'),
('F_PA_ST_0005',6,'女款登山健行透氣短裙褲裙4.jpg'),
('F_PA_ST_0005',null,'女款登山健行透氣短裙褲裙5.jpg'),
('F_PA_ST_0005',null,'女款登山健行透氣短裙褲裙6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_ST_0006','女款快乾網球短褲','簡約優雅的款式搭配大口袋這款輕量、簡潔又優雅的短褲讓你來回擊球，贏得分數！特別設計的口袋，方便攜帶網球。','主要布料 100% 聚酯纖維','印尼',null,450,'false','新品',8);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_ST_0006',1,1,220),
('F_PA_ST_0006',1,2,200),
('F_PA_ST_0006',1,3,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_ST_0006',1,'女款快乾網球短褲1.jpg'),
('F_PA_ST_0006',null,'女款快乾網球短褲2.jpg'),
('F_PA_ST_0006',null,'女款快乾網球短褲3.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_ST_0007','女款高爾夫挺版彈性短褲','適合在 10°C 到 20°C 的溫和天候下打高爾夫球時穿著。','主要布料 98% 棉, 2% 彈性纖維','台灣',null,499,'false','新品',8);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_ST_0007',2,1,220),
('F_PA_ST_0007',2,2,200),
('F_PA_ST_0007',2,3,200),
('F_PA_ST_0007',1,2,230),
('F_PA_ST_0007',1,3,180),
('F_PA_ST_0007',1,4,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_ST_0007',2,'女款高爾夫挺版彈性短褲1.jpg'),
('F_PA_ST_0007',null,'女款高爾夫挺版彈性短褲2.jpg'),
('F_PA_ST_0007',null,'女款高爾夫挺版彈性短褲3.jpg'),
('F_PA_ST_0007',1,'女款高爾夫挺版彈性短褲4.jpg'),
('F_PA_ST_0007',null,'女款高爾夫挺版彈性短褲5.jpg'),
('F_PA_ST_0007',null,'女款高爾夫挺版彈性短褲6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_ST_0008','女款高棉質健身短褲','我們的設計師打造出這款非常適合夏天的短褲，無論是運動、逛街、在海灘或在家放鬆都能穿著！','主要布料 57% 棉, 38% 聚酯纖維, 5% 彈性纖維','台灣',500,399,'false','新品',8);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_ST_0008',4,1,220),
('F_PA_ST_0008',4,2,200),
('F_PA_ST_0008',4,3,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_ST_0008',4,'女款高棉質健身短褲1.jpg'),
('F_PA_ST_0008',null,'女款高棉質健身短褲2.jpg'),
('F_PA_ST_0008',null,'女款高棉質健身短褲3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_ST_0001','快適動能運動短褲','快適動能運動短褲','100%聚酯纖維','越南製',null,390,'false',null,9);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_ST_0001',1,1,220),
('C_PA_ST_0001',1,2,150),
('C_PA_ST_0001',1,3,180),
('C_PA_ST_0001',5,4,150),
('C_PA_ST_0001',5,5,130);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_ST_0001',1,'44673e00a099451ba228c9489b36973e.jpg'),
('C_PA_ST_0001',5,'6e1bec66a1da45c195f67fd3bf452239.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_ST_0002','兒童款足球輕量短褲','這款運動短褲由我們的團隊特別設計，適合一週內進行一或兩次足球訓練或比賽的年幼足球選手。','100% 聚酯纖維','台灣',null,450,'false',null,9);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_ST_0002',1,1,220),
('C_PA_ST_0002',4,2,200),
('C_PA_ST_0002',5,3,180);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_ST_0002',1,'9aee784fb1d645d7ace5629ad6375f76.jpg'),
('C_PA_ST_0002',5,'efd28ca87fb64a7da74ee3d05150c9d8.jpg'),
('C_PA_ST_0002',4,'950f8885022444498e834c576bcec158.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_ST_0003','兒童款羽球短褲','這款機能短褲適合中階球員於日常訓練及比賽中穿著。','主要布料 86% 聚酯纖維, 14% 彈性纖維','台灣',600,450,'false','新品',9);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_ST_0003',5,1,220),
('C_PA_ST_0003',5,2,300),
('C_PA_ST_0003',5,3,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_ST_0003',5,'兒童款羽球短褲1.jpg'),
('C_PA_ST_0003',null,'兒童款羽球短褲2.jpg'),
('C_PA_ST_0003',null,'兒童款羽球短褲3.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_ST_0004','女童棉質運動短褲','適合孩子日常活動（學校等等）穿著的棉質短褲。時尚又運動感的短褲。','主要布料 59% 棉, 37% 聚酯纖維, 4% 彈性纖維','台灣',600,450,'false','新品',9);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_ST_0004',2,1,220),
('C_PA_ST_0004',2,2,200),
('C_PA_ST_0004',2,3,220),
('C_PA_ST_0004',7,2,200),
('C_PA_ST_0004',7,3,220),
('C_PA_ST_0004',7,4,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_ST_0004',2,'女童棉質運動短褲1.jpg'),
('C_PA_ST_0004',null,'女童棉質運動短褲2.jpg'),
('C_PA_ST_0004',null,'女童棉質運動短褲3.jpg'),
('C_PA_ST_0004',7,'女童棉質運動短褲4.jpg'),
('C_PA_ST_0004',null,'女童棉質運動短褲5.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_ST_0005','女童透氣運動褲(二合一)','極為柔軟且輕盈的 2 合 1 短褲與緊身褲提供包覆性佳又不笨重的短褲內搭緊身褲──感受完美的舒適感與支撐性。','主要布料 57% 聚酯纖維, 37% 萊賽爾纖維, 6% 彈性纖維','台灣',600,499,'false','新品',9);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_ST_0005',5,1,220),
('C_PA_ST_0005',5,2,200),
('C_PA_ST_0005',5,3,220),
('C_PA_ST_0005',7,2,200),
('C_PA_ST_0005',7,3,220),
('C_PA_ST_0005',7,4,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_ST_0005',5,'女童透氣運動褲二合一1.jpg'),
('C_PA_ST_0005',null,'女童透氣運動褲二合一2.jpg'),
('C_PA_ST_0005',null,'女童透氣運動褲二合一3.jpg'),
('C_PA_ST_0005',7,'女童透氣運動褲二合一4.jpg'),
('C_PA_ST_0005',null,'女童透氣運動褲二合一5.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_ST_0006','男童運動短褲(拉鍊口袋)','這款男童透氣短褲專為孩子從事容易流汗、強度較高的運動設計。彈性棉質短褲附拉鍊口袋2個拉鍊口袋，讓你不用擔心物品掉落。','主要布料 96% 棉, 4% 彈性纖維','台灣',null,499,'false','新品',9);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_ST_0006',3,1,220),
('C_PA_ST_0006',3,2,200),
('C_PA_ST_0006',3,3,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_ST_0006',3,'男童運動短褲拉鍊口袋1.jpg'),
('C_PA_ST_0006',null,'男童運動短褲拉鍊口袋2.jpg'),
('C_PA_ST_0006',null,'男童運動短褲拉鍊口袋3.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_ST_0007','女童雙層彈性運動短褲','透過我們的專業研發設計出這款女孩運動必備的柔美二合一短褲。動感、超輕短褲，搭配內搭短褲。','主要布料 86% 聚酯纖維, 14% 彈性纖維','台灣',null,349,'false','新品',9);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_ST_0007',5,1,220),
('C_PA_ST_0007',5,2,200),
('C_PA_ST_0007',5,3,220),
('C_PA_ST_0007',7,1,220),
('C_PA_ST_0007',7,2,200),
('C_PA_ST_0007',7,3,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_ST_0007',5,'女童雙層彈性運動短褲1.jpg'),
('C_PA_ST_0007',null,'女童雙層彈性運動短褲2.jpg'),
('C_PA_ST_0007',null,'女童雙層彈性運動短褲3.jpg'),
('C_PA_ST_0007',7,'女童雙層彈性運動短褲4.jpg'),
('C_PA_ST_0007',null,'女童雙層彈性運動短褲5.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_ST_0008','兒童款籃球短褲','適合年輕的中階籃球員穿著。柔軟又透氣這款球褲專為籃球運動而設計。','主要布料 100% 聚酯纖維','台灣',null,400,'false','新品',9);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_ST_0008',1,1,220),
('C_PA_ST_0008',1,2,200),
('C_PA_ST_0008',1,3,220),
('C_PA_ST_0008',4,1,220),
('C_PA_ST_0008',4,2,200),
('C_PA_ST_0008',4,3,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_ST_0008',1,'兒童款籃球短褲1.jpg'),
('C_PA_ST_0008',null,'兒童款籃球短褲2.jpg'),
('C_PA_ST_0008',null,'兒童款籃球短褲3.jpg'),
('C_PA_ST_0008',4,'兒童款籃球短褲4.jpg'),
('C_PA_ST_0008',null,'兒童款籃球短褲5.jpg'),
('C_PA_ST_0008',null,'兒童款籃球短褲6.jpg');

--------------------------------------------------------------

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_LG_0001','男 貼身保暖透氣長褲','高海拔美麗諾羊毛，擁有卓越的溫濕控功能、透氣排汗、親膚舒適，美麗諾羊毛特殊結構，能鎖住氣味，有效降低異味感','100% 美麗諾羊毛','台灣',3000,2800,'false',null,10);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES

('M_PA_LG_0001',1,1,220),
('M_PA_LG_0001',1,2,0),
('M_PA_LG_0001',1,3,220),
('M_PA_LG_0001',1,4,250);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_LG_0001',1,'8cfc8812ec7a4a10aa2974d338ad489f.jpg'),
('M_PA_LG_0001',null,'885a5fe3b427457c9188b0bde628a143.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_LG_0002','快適動能標準型束口褲','快適動能標準型束口褲','100%聚酯纖維','越南製',null,499,'false','限量',10);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_LG_0002',1,1,220),
('M_PA_LG_0002',1,2,200),
('M_PA_LG_0002',3,3,180),
('M_PA_LG_0002',3,4,130);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_LG_0002',null,'7cafa98d99394b2aa62b5ff53d363692.jpg'),
('M_PA_LG_0002',3,'4c3fddd2efda4b69862232797a324c0e.jpg'),
('M_PA_LG_0002',1,'8b106b671eda4354983f8b76aed43625.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_LG_0003','男款登山健行透氣長褲','透氣輕盈，適合登山健行穿著。這款長褲是登山新手的最佳選擇，你一定會喜歡它的輕量設計。','100%聚酯纖維','越南製',null,1200,'false','限量',10);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_LG_0003',1,1,220),
('M_PA_LG_0003',1,2,300),
('M_PA_LG_0003',1,3,300),
('M_PA_LG_0003',5,3,280),
('M_PA_LG_0003',5,4,0),
('M_PA_LG_0003',5,5,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_LG_0003',1,'男款登山健行透氣長褲1.jpg'),
('M_PA_LG_0003',null,'男款登山健行透氣長褲2.jpg'),
('M_PA_LG_0003',null,'男款登山健行透氣長褲3.jpg'),
('M_PA_LG_0003',5,'男款登山健行透氣長褲4.jpg'),
('M_PA_LG_0003',null,'男款登山健行透氣長褲5.jpg'),
('M_PA_LG_0003',null,'男款登山健行透氣長褲6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_LG_0004','男款透氣排汗跑步縮口褲','輕盈的長褲搭配後方拉鍊大口袋後方拉鍊口袋可防止手機跳出。','主要布料 89% 聚酯纖維, 11% 彈性纖維','越南製',null,1100,'false','限量',10);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_LG_0004',8,1,220),
('M_PA_LG_0004',8,2,300),
('M_PA_LG_0004',8,3,300),
('M_PA_LG_0004',5,3,280),
('M_PA_LG_0004',5,4,280),
('M_PA_LG_0004',5,5,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_LG_0004',8,'男款透氣排汗跑步縮口褲1.jpg'),
('M_PA_LG_0004',null,'男款透氣排汗跑步縮口褲2.jpg'),
('M_PA_LG_0004',null,'男款透氣排汗跑步縮口褲3.jpg'),
('M_PA_LG_0004',5,'男款透氣排汗跑步縮口褲4.jpg'),
('M_PA_LG_0004',null,'男款透氣排汗跑步縮口褲5.jpg'),
('M_PA_LG_0004',null,'男款透氣排汗跑步縮口褲6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_LG_0005','男款排汗彈性高爾夫長褲','高爾夫長褲採用輕量材質，能有效排汗並讓你保持乾爽，適合在 20°C 以上的體感溫度中打球時穿著。','主要布料 91% 聚酯纖維, 9% 彈性纖維','越南製',null,1100,'false','新品',10);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_LG_0005',3,1,220),
('M_PA_LG_0005',3,2,300),
('M_PA_LG_0005',3,3,300),
('M_PA_LG_0005',6,3,280),
('M_PA_LG_0005',6,4,280),
('M_PA_LG_0005',6,5,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_LG_0005',3,'男款排汗彈性高爾夫長褲1.jpg'),
('M_PA_LG_0005',null,'男款排汗彈性高爾夫長褲2.jpg'),
('M_PA_LG_0005',null,'男款排汗彈性高爾夫長褲3.jpg'),
('M_PA_LG_0005',6,'男款排汗彈性高爾夫長褲4.jpg'),
('M_PA_LG_0005',null,'男款排汗彈性高爾夫長褲5.jpg'),
('M_PA_LG_0005',null,'男款排汗彈性高爾夫長褲6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_LG_0006','男款挺版彈性高爾夫長褲','適合在 10°C 到 20°C 的溫和天候下打高爾夫球時穿著。','主要布料 98% 棉, 2% 彈性纖維','柬埔寨',1500,1200,'false','新品',10);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_LG_0006',1,1,220),
('M_PA_LG_0006',1,2,300),
('M_PA_LG_0006',2,3,300),
('M_PA_LG_0006',2,4,280),
('M_PA_LG_0006',6,4,280),
('M_PA_LG_0006',6,5,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_LG_0006',1,'男款挺版彈性高爾夫長褲1.jpg'),
('M_PA_LG_0006',null,'男款挺版彈性高爾夫長褲2.jpg'),
('M_PA_LG_0006',2,'男款挺版彈性高爾夫長褲3.jpg'),
('M_PA_LG_0006',null,'男款挺版彈性高爾夫長褲4.jpg'),
('M_PA_LG_0006',6,'男款挺版彈性高爾夫長褲5.jpg'),
('M_PA_LG_0006',null,'男款挺版彈性高爾夫長褲6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_LG_0007','男款登山健行快乾彈性直筒長褲','適合偶爾在低地、森林或海岸健行時穿著。柔軟的棉質 | 彈性 | 4 個口袋結合彈性布料與舒適剪裁的環保設計長褲。','主要布料 79% 棉, 19% 聚酯纖維, 2% 彈性纖維','柬埔寨',null,1200,'false','新品',10);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_LG_0007',3,1,220),
('M_PA_LG_0007',3,2,300),
('M_PA_LG_0007',3,3,300),
('M_PA_LG_0007',6,3,280),
('M_PA_LG_0007',6,4,280),
('M_PA_LG_0007',6,5,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_LG_0007',3,'男款登山健行快乾彈性直筒長褲1.jpg'),
('M_PA_LG_0007',null,'男款登山健行快乾彈性直筒長褲2.jpg'),
('M_PA_LG_0007',null,'男款登山健行快乾彈性直筒長褲3.jpg'),
('M_PA_LG_0007',6,'男款登山健行快乾彈性直筒長褲4.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_LG_0008','男款登山健行快乾兩截式長褲','適合偶爾登山健行時穿著。二合一長褲。可變成短褲。','主要布料 100% 聚酯纖維','台灣',null,1200,'false','新品',10);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_LG_0008',5,1,220),
('M_PA_LG_0008',5,2,300),
('M_PA_LG_0008',5,3,300),
('M_PA_LG_0008',3,3,280),
('M_PA_LG_0008',3,4,280),
('M_PA_LG_0008',3,5,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_PA_LG_0008',5,'男款登山健行快乾兩截式長褲1.jpg'),
('M_PA_LG_0008',null,'男款登山健行快乾兩截式長褲2.jpg'),
('M_PA_LG_0008',null,'男款登山健行快乾兩截式長褲3.jpg'),
('M_PA_LG_0008',3,'男款登山健行快乾兩截式長褲4.jpg'),
('M_PA_LG_0008',null,'男款登山健行快乾兩截式長褲5.jpg'),
('M_PA_LG_0008',null,'男款登山健行快乾兩截式長褲6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,Status,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_LG_0001','女款初階健身長褲','讓我們能輕鬆運動地時尚現代設計慢跑褲。你一定會愛上這款產品：上寬下窄的設計上寬下窄的剪裁，腰帶抽繩設計，口袋和彈性面料讓你愛不釋手！','主要布料 88% 聚酯纖維, 12%','台灣',null,899,'true','false',null,11);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_LG_0001',1,1,220),
('F_PA_LG_0001',1,2,300),
('F_PA_LG_0001',6,4,250),
('F_PA_LG_0001',6,5,330);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_LG_0001',1,'090cdadbb0914a3a9ed0854703161844.jpg'),
('F_PA_LG_0001',null,'d0c5e4f10ede47afb0ab34e7f4ecdc27.jpg'),
('F_PA_LG_0001',6,'d6ff1198d8934705ad13a76c6b327ed4.jpg'),
('F_PA_LG_0001',null,'5148e1858d6740e8b00d26a85b7a9766.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_LG_0002','女款假兩件式跑步緊身長褲','適合戶外活動。搭配短褲的緊身褲。搭配短褲的緊身褲結合緊身褲的支撐效果並可隱藏臀部，兼具輕盈與遮蔽性。強調身型的緊身褲。','87% 聚酯纖維, 13% 彈性纖維 ','台灣',null,799,'false',null,11);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_LG_0002',1,1,220),
('F_PA_LG_0002',1,2,200),
('F_PA_LG_0002',1,3,280);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_LG_0002',1,'2778a60e7c334990a8cd11b2455fc2b0.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_LG_0003','女款登山健行快乾彈性寬版長褲','這款登山健行長褲兼具舒適與實用。採用彈性布料製成並具有寬腰帶，讓你在長途健行時倍感舒適。有一個小口袋可放手機或貴重物品。','主要布料 100% 聚酯纖維 ','台灣',null,899,'false',null,11);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_LG_0003',1,1,220),
('F_PA_LG_0003',1,2,300),
('F_PA_LG_0003',1,3,280),
('F_PA_LG_0003',8,2,220),
('F_PA_LG_0003',8,3,0),
('F_PA_LG_0003',8,4,280);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_LG_0003',1,'女款登山健行快乾彈性寬版長褲1.jpg'),
('F_PA_LG_0003',null,'女款登山健行快乾彈性寬版長褲2.jpg'),
('F_PA_LG_0003',null,'女款登山健行快乾彈性寬版長褲3.jpg'),
('F_PA_LG_0003',8,'女款登山健行快乾彈性寬版長褲4.jpg'),
('F_PA_LG_0003',null,'女款登山健行快乾彈性寬版長褲5.jpg'),
('F_PA_LG_0003',null,'女款登山健行快乾彈性寬版長褲6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_LG_0004','女款假兩件式跑步緊身長褲','適合戶外活動。搭配短褲的緊身褲。搭配短褲的緊身褲結合緊身褲的支撐效果並可隱藏臀部，兼具輕盈與遮蔽性。強調身型的緊身褲。','主要布料 87% 聚酯纖維, 13% 彈性纖維','台灣',1000,899,'false','新品',11);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_LG_0004',1,1,220),
('F_PA_LG_0004',1,2,300),
('F_PA_LG_0004',1,3,280),
('F_PA_LG_0004',5,2,220),
('F_PA_LG_0004',5,3,300),
('F_PA_LG_0004',5,4,280);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_LG_0004',1,'女款假兩件式跑步緊身長褲1.jpg'),
('F_PA_LG_0004',null,'女款假兩件式跑步緊身長褲2.jpg'),
('F_PA_LG_0004',null,'女款假兩件式跑步緊身長褲3.jpg'),
('F_PA_LG_0004',5,'女款假兩件式跑步緊身長褲4.jpg'),
('F_PA_LG_0004',null,'女款假兩件式跑步緊身長褲5.jpg'),
('F_PA_LG_0004',null,'女款假兩件式跑步緊身長褲6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_LG_0005','女款透氣健身緊身褲','可讓你方便活動的緊身褲。你一定會愛上這款產品的高腰設計了解運動的力量以及如何動起來可以讓你的身心愉悅。','主要布料 70% 聚醯胺纖維, 30% 彈性纖維','台灣',1000,899,'false','新品',11);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_LG_0005',1,1,220),
('F_PA_LG_0005',1,2,300),
('F_PA_LG_0005',1,3,0),
('F_PA_LG_0005',8,2,220),
('F_PA_LG_0005',8,3,300),
('F_PA_LG_0005',8,4,280);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_LG_0005',1,'女款透氣健身緊身褲1.jpg'),
('F_PA_LG_0005',null,'女款透氣健身緊身褲2.jpg'),
('F_PA_LG_0005',null,'女款透氣健身緊身褲3.jpg'),
('F_PA_LG_0005',8,'女款透氣健身緊身褲4.jpg'),
('F_PA_LG_0005',null,'女款透氣健身緊身褲5.jpg'),
('F_PA_LG_0005',null,'女款透氣健身緊身褲6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_LG_0006','女款保暖舒適跑步緊身長褲 Run Warm','我們設計這款可為你於外出慢跑時保暖防寒的緊身褲。經測試，在-5°C到0°C的環境穿著最為舒適。後方拉鍊口袋！溫暖舒適並價格實惠的跑步緊身褲！','主要布料 91% 聚酯纖維, 9% 彈性纖維','台灣',null,699,'false','新品',11);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_LG_0006',1,1,220),
('F_PA_LG_0006',1,2,300),
('F_PA_LG_0006',1,3,280);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_LG_0006',1,'女款保暖舒適跑步緊身長褲 Run Warm1.jpg'),
('F_PA_LG_0006',null,'女款保暖舒適跑步緊身長褲 Run Warm2.jpg'),
('F_PA_LG_0006',null,'女款保暖舒適跑步緊身長褲 Run Warm3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_LG_0007','女款棉質運動長褲','觸感柔滑，穿起來更合身！在你不確定要穿什麼，或是很清楚自己想穿什時麼時，這款直筒長褲都是必備的單品！附有抽繩和兩個口袋，並採用環保設計。','主要布料 50% 棉, 47% 聚酯纖維, 3% 彈性纖維','台灣',1000,749,'false','新品',11);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_LG_0007',1,1,220),
('F_PA_LG_0007',1,2,300),
('F_PA_LG_0007',1,3,280),
('F_PA_LG_0007',3,2,220),
('F_PA_LG_0007',3,3,300),
('F_PA_LG_0007',3,4,0);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_LG_0007',1,'女款棉質運動長褲1.jpg'),
('F_PA_LG_0007',null,'女款棉質運動長褲2.jpg'),
('F_PA_LG_0007',null,'女款棉質運動長褲3.jpg'),
('F_PA_LG_0007',3,'女款棉質運動長褲4.jpg'),
('F_PA_LG_0007',null,'女款棉質運動長褲5.jpg'),
('F_PA_LG_0007',null,'女款棉質運動長褲6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_LG_0008','女款挺版彈性高爾夫長褲','我們的高爾夫設計師開發了這款長褲，適合在10°C到20°C的溫和天候下打高爾夫球時穿。','主要布料 98% 棉, 2% 彈性纖維','台灣',1000,849,'false','新品',11);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_LG_0008',2,1,220),
('F_PA_LG_0008',2,2,300),
('F_PA_LG_0008',2,3,280),
('F_PA_LG_0008',5,2,220),
('F_PA_LG_0008',5,3,300),
('F_PA_LG_0008',5,4,280);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_PA_LG_0008',2,'女款挺版彈性高爾夫長褲1.jpg'),
('F_PA_LG_0008',null,'女款挺版彈性高爾夫長褲2.jpg'),
('F_PA_LG_0008',null,'女款挺版彈性高爾夫長褲3.jpg'),
('F_PA_LG_0008',5,'女款挺版彈性高爾夫長褲4.jpg'),
('F_PA_LG_0008',null,'女款挺版彈性高爾夫長褲5.jpg'),
('F_PA_LG_0008',null,'女款挺版彈性高爾夫長褲6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_LG_0001','兒童款止滑馬術長褲','適合在各種氣候中穿著。舒適及愉悅的穿著感受。這款馬褲採用彈性布料製成，騎乘時更舒適，也能活動自如。加強部分及縫線可減少摩擦。',' 97% 棉, 3% 彈性纖維','台灣',700,600,'false',null,12);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_LG_0001',1,1,220),
('C_PA_LG_0001',1,2,300);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_LG_0001',null,'755486e74614499d8c9d0428665fd28c.jpg'),
('C_PA_LG_0001',null,'c37bf27933e049a2ae97847761340615.jpg'),
('C_PA_LG_0001',1,'006ca4ce4f934b31a0159c95f2c2bb52.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_LG_0002','兒童款登山健行快乾彈性長褲','適合在溫暖天候下進行整日健行或平時穿著這款長褲兼具技術性、透氣性及輕量性，可依照天候狀況及步道難易度穿著。孩子會對這種舒適感愛不釋手。','100% 聚酯纖維','越南',750,499,'false',null,12);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_LG_0002',1,1,220),
('C_PA_LG_0002',1,2,200),
('C_PA_LG_0002',2,3,220),
('C_PA_LG_0002',2,4,250);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_LG_0002',2,'733eef49bebf46e39c589039abbc4d5c.jpg'),
('C_PA_LG_0002',1,'c9e1a0df1d9d4f14bee803a219143b84.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_LG_0003','兒童中階透氣長褲','腰部可調式系統。因為每個孩子都不一樣，我們設計出一系列採用彈性腰帶的褲子，能夠調整鬆緊，讓褲子更舒適貼合。','主要布料 50% 棉, 47% 聚酯纖維, 3% 彈性纖維','越南',null,599,'false',null,12);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_LG_0003',3,1,220),
('C_PA_LG_0003',3,2,200),
('C_PA_LG_0003',3,3,200),
('C_PA_LG_0003',2,3,220),
('C_PA_LG_0003',2,4,250),
('C_PA_LG_0003',2,5,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_LG_0003',2,'兒童中階透氣長褲1.jpg'),
('C_PA_LG_0003',null,'兒童中階透氣長褲2.jpg'),
('C_PA_LG_0003',3,'兒童中階透氣長褲4.jpg'),
('C_PA_LG_0003',null,'兒童中階透氣長褲5.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_LG_0004','兒童款雪地登山保暖刷毛長褲','我們由兒童健行者的父母所組成的團隊研發了這款刷毛長褲，能提供兒童在戶外活動時所需的保暖性保暖且透氣－適合在寒冷天候下穿著。','主要布料 100% 聚酯纖維','台灣',800,699,'false',null,12);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_LG_0004',5,1,220),
('C_PA_LG_0004',5,2,200),
('C_PA_LG_0004',5,3,200),
('C_PA_LG_0004',7,3,220),
('C_PA_LG_0004',7,4,250),
('C_PA_LG_0004',7,5,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_LG_0004',5,'兒童款雪地登山保暖刷毛長褲1.jpg'),
('C_PA_LG_0004',null,'兒童款雪地登山保暖刷毛長褲2.jpg'),
('C_PA_LG_0004',null,'兒童款雪地登山保暖刷毛長褲3.jpg'),
('C_PA_LG_0004',7,'兒童款雪地登山保暖刷毛長褲4.jpg'),
('C_PA_LG_0004',null,'兒童款雪地登山保暖刷毛長褲5.jpg'),
('C_PA_LG_0004',null,'兒童款雪地登山保暖刷毛長褲6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_LG_0005','兒童款登山健行快乾兩截式長褲','適合在各種天候下的技術型步道中進行整日健行時穿著。這款模組褲同時兼具技術性、透氣性和輕量性，可依照天候狀況及步道難易度調整成長褲或短褲。','主要布料 100% 聚酯纖維','台灣',800,699,'false',null,12);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_LG_0005',5,1,220),
('C_PA_LG_0005',5,2,200),
('C_PA_LG_0005',5,3,200),
('C_PA_LG_0005',6,3,220),
('C_PA_LG_0005',6,4,250),
('C_PA_LG_0005',6,5,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_LG_0005',5,'兒童款登山健行快乾兩截式長褲1.jpg'),
('C_PA_LG_0005',null,'兒童款登山健行快乾兩截式長褲2.jpg'),
('C_PA_LG_0005',null,'兒童款登山健行快乾兩截式長褲3.jpg'),
('C_PA_LG_0005',6,'兒童款登山健行快乾兩截式長褲4.jpg'),
('C_PA_LG_0005',null,'兒童款登山健行快乾兩截式長褲5.jpg'),
('C_PA_LG_0005',null,'兒童款登山健行快乾兩截式長褲6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_LG_0006','兒童透氣馬術長褲','我們的馬術設計師研發這款馬褲，適合像你一樣年輕的中階騎師穿著！適合在炎熱天氣中穿著。非常輕量，還有透氣區域','主要布料 90% 聚酯纖維, 10% 彈性纖維','台灣',null,1200,'false','新品',12);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_LG_0006',5,1,220),
('C_PA_LG_0006',5,2,200),
('C_PA_LG_0006',5,3,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_LG_0006',5,'兒童透氣馬術長褲1.jpg'),
('C_PA_LG_0006',null,'兒童透氣馬術長褲2.jpg'),
('C_PA_LG_0006',null,'兒童透氣馬術長褲3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_LG_0007','兒童登山健行防潑水保暖長褲','保暖及防潑水這款保暖防潑水長褲的設計能減少對環境的影響，確保孩子在寒冷天氣健行時舒適又保暖 。','主要布料 100% 聚酯纖維','台灣',800,699,'false',null,12);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_LG_0007',1,1,220),
('C_PA_LG_0007',1,2,200),
('C_PA_LG_0007',1,3,200),
('C_PA_LG_0007',8,3,220),
('C_PA_LG_0007',8,4,250),
('C_PA_LG_0007',8,5,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_LG_0007',1,'兒童登山健行防潑水保暖長褲1.jpg'),
('C_PA_LG_0007',null,'兒童登山健行防潑水保暖長褲2.jpg'),
('C_PA_LG_0007',null,'兒童登山健行防潑水保暖長褲3.jpg'),
('C_PA_LG_0007',8,'兒童登山健行防潑水保暖長褲4.jpg'),
('C_PA_LG_0007',null,'兒童登山健行防潑水保暖長褲5.jpg'),
('C_PA_LG_0007',null,'兒童登山健行防潑水保暖長褲6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_LG_0008','兒童款網球保暖長褲','適合在寒冷冬天打網球的長褲。亦適用於打羽毛球及板網球。將球塞進溫暖的口袋，立刻出門打球！這款長褲不會降低你在球場上活動的運動速度。','主要布料 58% 聚酯纖維, 42% 棉 ','台灣',1200,899,'false','新品',12);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_LG_0008',1,1,220),
('C_PA_LG_0008',1,2,200),
('C_PA_LG_0008',1,3,200);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_PA_LG_0008',1,'兒童款網球保暖長褲1.jpg'),
('C_PA_LG_0008',null,'兒童款網球保暖長褲2.jpg'),
('C_PA_LG_0008',null,'兒童款網球保暖長褲3.jpg');


---------------------------------------------------------

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_CL_0001','男款經典休閒帆布鞋','穿起來非常舒服，穿脫方便！',null,'中國製',null,1600,'false',null,13);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_CL_0001',2,28,200),
('M_SH_CL_0001',2,29,200),
('M_SH_CL_0001',3,28,380),
('M_SH_CL_0001',3,29,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_CL_0001',2,'11f93804a670412e8d995a7d878bb837.jpg'),
('M_SH_CL_0001',null,'f6ba4d2bd96546c480c4a66e946dec9e.jpg'),
('M_SH_CL_0001',3,'bd9bc306ab4a46d29340da5908e7287a.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_CL_0002','前包式拖鞋','採用獨創的橡膠杯底，具有高抓地力、防滑功能和耐用性。',null,'台灣',null,399,'false','限量',13);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_CL_0002',1,28,220),
('M_SH_CL_0002',1,29,300),
('M_SH_CL_0002',1,30,180),
('M_SH_CL_0002',6,31,250);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_CL_0002',6,'b6cc09b2ee204ace8e83cdc0f3342bc3.jpg'),
('M_SH_CL_0002',null,'fd8dd6e92e0841e5ae5fc3a5761496b8.jpg'),
('M_SH_CL_0002',1,'e18073014f984b5f87171efc02a5d140.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_CL_0003','男士輕盈抓地狩獵雨靴','適合在下雨天進行任何戶外活動時穿著。輕量且易於清潔。輕量的雨靴易於穿脫。防滑鞋底配有鞋釘，在泥地有良好的抓地力，內外皆可清洗。 這雙靴子也能快速恢復乾燥。',null,'台灣',null,2000,'false','新品,限量',13);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_CL_0003',1,28,220),
('M_SH_CL_0003',1,29,200),
('M_SH_CL_0003',1,30,280),
('M_SH_CL_0003',1,31,180);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_CL_0003',1,'男士輕盈抓地狩獵雨靴1.jpg'),
('M_SH_CL_0003',null,'男士輕盈抓地狩獵雨靴2.jpg'),
('M_SH_CL_0003',null,'男士輕盈抓地狩獵雨靴3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_CL_0004','男款緩震健走涼鞋','適合進行每週2到3次30分鐘的健行時穿著柔軟的EVA泡棉中底具有絕佳的透氣性適合炎熱天候穿著的透氣健行鞋。',null,'台灣',1500,1200,'false','新品,限量',13);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_CL_0004',1,28,220),
('M_SH_CL_0004',1,29,200),
('M_SH_CL_0004',1,30,280),
('M_SH_CL_0004',1,31,180),
('M_SH_CL_0004',8,28,220),
('M_SH_CL_0004',8,29,200),
('M_SH_CL_0004',8,30,280);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_CL_0004',1,'男款緩震健走涼鞋1.jpg'),
('M_SH_CL_0004',null,'男款緩震健走涼鞋2.jpg'),
('M_SH_CL_0004',null,'男款緩震健走涼鞋3.jpg'),
('M_SH_CL_0004',8,'男款緩震健走涼鞋4.jpg'),
('M_SH_CL_0004',null,'男款緩震健走涼鞋5.jpg'),
('M_SH_CL_0004',null,'男款緩震健走涼鞋6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_CL_0005','男款緩震抓地健行涼鞋','適合偶爾在炎熱晴朗的天氣下於野外小徑健行時穿著。三帶式 | 抓地力 | 可抗淡水無論是沿著鄉間小路散步。',null,'台灣',1500,1200,'false','新品,限量',13);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_CL_0005',1,28,220),
('M_SH_CL_0005',1,29,200),
('M_SH_CL_0005',1,30,280),
('M_SH_CL_0005',8,28,220),
('M_SH_CL_0005',8,29,200),
('M_SH_CL_0005',8,30,280);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_CL_0005',1,'男款緩震抓地健行涼鞋1.jpg'),
('M_SH_CL_0005',null,'男款緩震抓地健行涼鞋2.jpg'),
('M_SH_CL_0005',null,'男款緩震抓地健行涼鞋3.jpg'),
('M_SH_CL_0005',8,'男款緩震抓地健行涼鞋4.jpg'),
('M_SH_CL_0005',null,'男款緩震抓地健行涼鞋5.jpg'),
('M_SH_CL_0005',null,'男款緩震抓地健行涼鞋6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_CL_0006','男款拼接綁帶厚底休閒鞋','適合偶爾在炎熱晴朗的天氣下於野外小徑健行時穿著。三帶式 | 抓地力 | 可抗淡水無論是沿著鄉間小路散步。',null,'台灣',2200,2000,'false','新品,限量',13);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_CL_0006',2,28,220),
('M_SH_CL_0006',2,29,200),
('M_SH_CL_0006',2,30,280),
('M_SH_CL_0006',2,31,280);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_CL_0006',2,'男款拼接綁帶厚底休閒鞋1.jpg'),
('M_SH_CL_0006',null,'男款拼接綁帶厚底休閒鞋2.jpg'),
('M_SH_CL_0006',null,'男款拼接綁帶厚底休閒鞋3.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_CL_0007','男款素棉麻帆布休閒鞋','可以不需綁帶，輕鬆穿脫，也可以繫上鞋帶，強化造型，其加厚的乳膠發泡鞋墊與殊設計的楦頭，既修飾腳型更提升其雙腳於穿著時的舒適度。',null,'台灣',null,1250,'false','新品,限量',13);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_CL_0007',6,28,220),
('M_SH_CL_0007',6,29,200),
('M_SH_CL_0007',6,30,280),
('M_SH_CL_0007',6,31,280),
('M_SH_CL_0007',2,28,220),
('M_SH_CL_0007',2,29,200),
('M_SH_CL_0007',2,30,280);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_CL_0007',2,'男款素棉麻帆布休閒鞋1.jpg'),
('M_SH_CL_0007',null,'男款素棉麻帆布休閒鞋2.jpg'),
('M_SH_CL_0007',null,'男款素棉麻帆布休閒鞋3.jpg'),
('M_SH_CL_0007',6,'男款素棉麻帆布休閒鞋4.jpg'),
('M_SH_CL_0007',null,'男款素棉麻帆布休閒鞋5.jpg'),
('M_SH_CL_0007',null,'男款素棉麻帆布休閒鞋6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_CL_0008','男款麻底鞋','可以不需綁帶，輕鬆穿脫，加厚棉質帆布鞋墊，加固鞋跟搭配橫飾設計。',null,'台灣',null,2050,'false','新品,限量',13);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_CL_0008',1,28,220),
('M_SH_CL_0008',1,29,200),
('M_SH_CL_0008',1,30,280),
('M_SH_CL_0008',5,28,220),
('M_SH_CL_0008',5,29,200),
('M_SH_CL_0008',5,30,280);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_CL_0008',1,'男款麻底鞋1.jpg'),
('M_SH_CL_0008',null,'男款麻底鞋2.jpg'),
('M_SH_CL_0008',5,'男款麻底鞋4.jpg'),
('M_SH_CL_0008',null,'男款麻底鞋5.jpg'),
('M_SH_CL_0008',null,'男款麻底鞋6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_CL_0001','基本休閒帆布鞋','穿起來非常舒服，穿脫方便！',null,'中國製',null,1600,'false',null,14);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_CL_0001',1,20,220),
('F_SH_CL_0001',1,21,100),
('F_SH_CL_0001',2,23,50),
('F_SH_CL_0001',2,24,30);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_SH_CL_0001',1,'938271a113f244c996aec3ae939a143a.jpg'),
('F_SH_CL_0001',2,'9cf100bb0185468b937051136bd04142.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_CL_0002','一體成型壓紋勃肯鞋','穿起來非常舒服，穿脫方便！',null,'中國製',null,399,'false',null,14);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_CL_0002',2,20,220),
('F_SH_CL_0002',2,21,100),
('F_SH_CL_0002',4,23,50),
('F_SH_CL_0002',8,24,30);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_SH_CL_0002',8,'19d5c3e6ebb948d784f351a9433cc1b2.jpg'),
('F_SH_CL_0002',2,'5e6ad0c29b5e4a54913a702c5d08b707.jpg'),
('F_SH_CL_0002',4,'5d6765844ed04a6b92d2413513a74c8c.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_CL_0003','成人款防水止滑馬術短靴','方便穿脫，可於所有季節穿上這款短馬靴。方便穿脫，可對抗壞天氣！',null,'中國製',null,1500,'false',null,14);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_CL_0003',1,20,220),
('F_SH_CL_0003',1,21,200),
('F_SH_CL_0003',1,22,250),
('F_SH_CL_0003',1,23,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_SH_CL_0003',1,'成人款防水止滑馬術短靴1.jpg'),
('F_SH_CL_0003',null,'成人款防水止滑馬術短靴2.jpg'),
('F_SH_CL_0003',null,'成人款防水止滑馬術短靴3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_CL_0004','女款可機洗網面透氣海灘鞋','適合水上活動愛好者在“活動前後”穿著。適合所有人穿著！感覺就像赤腳走路一樣！非常輕量通風的鞋子，讓你感覺就像赤腳走路一樣。','鞋面 62% 聚酯纖維,26% 陽離子聚酯纖維,12% 聚氨酯纖維','台灣',1600,1300,'false',null,14);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_CL_0004',2,20,220),
('F_SH_CL_0004',2,21,200),
('F_SH_CL_0004',2,22,250),
('F_SH_CL_0004',2,23,230),
('F_SH_CL_0004',5,21,200),
('F_SH_CL_0004',5,22,250),
('F_SH_CL_0004',5,23,230),
('F_SH_CL_0004',7,20,220),
('F_SH_CL_0004',7,21,200),
('F_SH_CL_0004',7,22,250),
('F_SH_CL_0004',7,23,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_SH_CL_0004',2,'女款可機洗網面透氣海灘鞋1.jpg'),
('F_SH_CL_0004',null,'女款可機洗網面透氣海灘鞋2.jpg'),
('F_SH_CL_0004',5,'女款可機洗網面透氣海灘鞋3.jpg'),
('F_SH_CL_0004',null,'女款可機洗網面透氣海灘鞋4.jpg'),
('F_SH_CL_0004',7,'女款可機洗網面透氣海灘鞋5.jpg'),
('F_SH_CL_0004',null,'女款可機洗網面透氣海灘鞋6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_CL_0005','女款緩震健走涼鞋','適合進行每週2到3次30分鐘的健行時穿著柔軟的EVA泡棉中底具有絕佳的透氣性適合炎熱天候穿著的透氣健行鞋。','鞋底 50% 乙烯醋酸乙烯共聚物50% 天然橡膠','台灣',null,1399,'false','新品,限量',14);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_CL_0005',1,20,220),
('F_SH_CL_0005',1,21,200),
('F_SH_CL_0005',1,22,250),
('F_SH_CL_0005',1,23,230),
('F_SH_CL_0005',7,21,200),
('F_SH_CL_0005',7,22,250),
('F_SH_CL_0005',7,23,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_SH_CL_0005',1,'女款緩震健走涼鞋1.jpg'),
('F_SH_CL_0005',null,'女款緩震健走涼鞋2.jpg'),
('F_SH_CL_0005',null,'女款緩震健走涼鞋3.jpg'),
('F_SH_CL_0005',7,'女款緩震健走涼鞋4.jpg'),
('F_SH_CL_0005',null,'女款緩震健走涼鞋5.jpg'),
('F_SH_CL_0005',null,'女款緩震健走涼鞋6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_CL_0006','女款輕量緩震包覆性登山健行涼鞋','適合新手健行者在溫暖天候下在自然或鄉間步道健行時穿著。柔軟舒適 | 透氣性提供一款舒適的健行鞋，同時附有兼具防護及抓地力的鞋底。','鞋底60%橡膠,40%乙烯醋酸乙烯共聚物','台灣',null,1399,'false','新品,限量',14);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_CL_0006',8,20,220),
('F_SH_CL_0006',8,21,200),
('F_SH_CL_0006',8,22,250),
('F_SH_CL_0006',8,23,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_SH_CL_0006',8,'女款輕量緩震包覆性登山健行涼鞋1.jpg'),
('F_SH_CL_0006',null,'女款輕量緩震包覆性登山健行涼鞋2.jpg'),
('F_SH_CL_0006',null,'女款輕量緩震包覆性登山健行涼鞋3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_CL_0007','女款素色快乾海灘夾腳拖鞋','適合水上活動愛好者在運動前後穿著。適合所有人穿著！附有足弓支撐的堅固鞋底！','鞋底 100% 乙烯醋酸乙烯共聚物','台灣',null,699,'false','新品,限量',14);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_CL_0007',1,20,220),
('F_SH_CL_0007',1,21,200),
('F_SH_CL_0007',1,22,250),
('F_SH_CL_0007',1,23,230),
('F_SH_CL_0007',2,21,200),
('F_SH_CL_0007',2,22,250),
('F_SH_CL_0007',2,23,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_SH_CL_0007',1,'女款素色快乾海灘夾腳拖鞋1.jpg'),
('F_SH_CL_0007',null,'女款素色快乾海灘夾腳拖鞋2.jpg'),
('F_SH_CL_0007',null,'女款素色快乾海灘夾腳拖鞋3.jpg'),
('F_SH_CL_0007',2,'女款素色快乾海灘夾腳拖鞋4.jpg'),
('F_SH_CL_0007',null,'女款素色快乾海灘夾腳拖鞋5.jpg'),
('F_SH_CL_0007',null,'女款素色快乾海灘夾腳拖鞋6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_CL_0008','女款素面牛皮免綁帶厚底','嚴選真牛皮皮革打造，柔軟腳墊，呵護腳部肌膚，免綁帶設計，穿脫方便！',null,'台灣',null,1600,'false','新品,限量',14);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_CL_0008',2,21,200),
('F_SH_CL_0008',2,22,250),
('F_SH_CL_0008',2,23,230);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_SH_CL_0008',2,'女款素面牛皮免綁帶厚底1.jpg'),
('F_SH_CL_0008',null,'女款素面牛皮免綁帶厚底2.jpg'),
('F_SH_CL_0008',null,'女款素面牛皮免綁帶厚底3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_CL_0001','童素色休閒鞋','抗菌除臭效果高，透氣性好。',null,'台灣',null,1500,'false',null,15);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_CL_0001',1,8,220),
('C_SH_CL_0001',1,9,100),
('C_SH_CL_0001',1,10,80),
('C_SH_CL_0001',6,8,190),
('C_SH_CL_0001',6,9,300);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_SH_CL_0001',1,'童素色休閒鞋2.jpg'),
('C_SH_CL_0001',6,'童素色休閒鞋1.jpg'),
('C_SH_CL_0001',null,'童素色休閒鞋.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_CL_0002','兒童衝浪輕量海灘鞋','適合年幼的水上活動愛好者在“活動前後”穿著。適合所有人穿著！感覺就像赤腳走路一樣！','鞋面 100% 聚酯纖維 鞋底 100% 乙烯醋酸乙烯共聚物','台灣',2000,1300,'false','新品',15);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_CL_0002',5,8,220),
('C_SH_CL_0002',5,9,220),
('C_SH_CL_0002',5,10,220),
('C_SH_CL_0002',8,8,190),
('C_SH_CL_0002',8,9,300),
('C_SH_CL_0002',8,10,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_SH_CL_0002',5,'兒童衝浪輕量海灘鞋1.jpg'),
('C_SH_CL_0002',null,'兒童衝浪輕量海灘鞋2.jpg'),
('C_SH_CL_0002',null,'兒童衝浪輕量海灘鞋3.jpg'),
('C_SH_CL_0002',8,'兒童衝浪輕量海灘鞋4.jpg'),
('C_SH_CL_0002',null,'兒童衝浪輕量海灘鞋5.jpg'),
('C_SH_CL_0002',null,'兒童衝浪輕量海灘鞋6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_CL_0003','兒童款健行登山涼鞋','我們由小小健行者的父母所組成的團隊採用環保概念設計出這款兒童涼鞋 MH120，適合在晴朗天氣下玩樂、跑步及跳躍時穿著。','鞋底 55% 橡膠,45% 乙烯醋酸乙烯共聚物','台灣',null,1200,'false','新品',15);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_CL_0003',5,8,220),
('C_SH_CL_0003',5,9,220),
('C_SH_CL_0003',5,10,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_SH_CL_0003',5,'兒童款健行登山涼鞋1.jpg'),
('C_SH_CL_0003',null,'兒童款健行登山涼鞋2.jpg'),
('C_SH_CL_0003',null,'兒童款健行登山涼鞋3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_CL_0004','兒童款輕量健行涼鞋','適合在陽光明媚的日子裡玩耍、跑步及躍時穿著。多功能耐用，適合整個夏天。','鞋底 60% 橡膠 - 順丁橡膠（BR ）, 40% 乙烯醋酸乙烯共聚物（EVA）','台灣',1500,1000,'false','新品',15);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_CL_0004',1,8,220),
('C_SH_CL_0004',1,9,220),
('C_SH_CL_0004',1,10,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_SH_CL_0004',1,'兒童款輕量健行涼鞋1.jpg'),
('C_SH_CL_0004',null,'兒童款輕量健行涼鞋2.jpg'),
('C_SH_CL_0004',null,'兒童款輕量健行涼鞋3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_CL_0005','兒童款游泳防滑拖鞋','非常適合想要保護雙腳並經常游泳的人使用。橡膠材質的鏤空鞋底！','鞋底 90% 乙烯醋酸乙烯共聚物,10%天然橡膠','台灣',null,600,'false','新品',15);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_CL_0005',5,8,220),
('C_SH_CL_0005',5,9,220),
('C_SH_CL_0005',5,10,220),
('C_SH_CL_0005',8,9,190),
('C_SH_CL_0005',8,10,300),
('C_SH_CL_0005',8,11,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_SH_CL_0005',5,'兒童款游泳防滑拖鞋1.jpg'),
('C_SH_CL_0005',null,'兒童款游泳防滑拖鞋2.jpg'),
('C_SH_CL_0005',null,'兒童款游泳防滑拖鞋3.jpg'),
('C_SH_CL_0005',8,'兒童款游泳防滑拖鞋4.jpg'),
('C_SH_CL_0005',null,'兒童款游泳防滑拖鞋5.jpg'),
('C_SH_CL_0005',null,'兒童款游泳防滑拖鞋6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_CL_0006','兒童款長筒雨靴','我們的設計師研發出這款防水靴，能讓你在划船、雨中活動或沿著海岸行走時保持雙腳乾爽。防水、防滑、彈性又輕量！','鞋面 100% PVC塑膠,鞋底 100% PVC塑膠','台灣',null,1250,'false','新品',15);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_CL_0006',4,8,220),
('C_SH_CL_0006',4,9,220),
('C_SH_CL_0006',4,10,220),
('C_SH_CL_0006',6,9,300),
('C_SH_CL_0006',6,10,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_SH_CL_0006',4,'兒童款長筒雨靴1.jpg'),
('C_SH_CL_0006',null,'兒童款長筒雨靴2.jpg'),
('C_SH_CL_0006',null,'兒童款長筒雨靴3.jpg'),
('C_SH_CL_0006',6,'兒童款長筒雨靴4.jpg'),
('C_SH_CL_0006',null,'兒童款長筒雨靴5.jpg'),
('C_SH_CL_0006',null,'兒童款長筒雨靴6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_CL_0007','兒童款初階防水止滑馬術長靴','我們的馬術設計師設計這款多功能合成皮馬靴供初階騎師使用。防水、易清洗的馬靴。','鞋面 100% PVC塑膠','台灣',1680,1299,'false','新品',15);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_CL_0007',1,8,220),
('C_SH_CL_0007',1,9,220),
('C_SH_CL_0007',1,10,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_SH_CL_0007',1,'兒童款初階防水止滑馬術長靴1.jpg'),
('C_SH_CL_0007',null,'兒童款初階防水止滑馬術長靴2.jpg'),
('C_SH_CL_0007',null,'兒童款初階防水止滑馬術長靴3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_CL_0008','兒童款初階柔軟牛皮馬術短靴','適合跟你一樣的年輕初階騎師穿著！ 這款皮靴具備多項功能，且適合在所有氣候中穿著。','鞋面 100% 牛皮二榔皮','台灣',1680,1400,'false','新品',15);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_CL_0008',1,8,220),
('C_SH_CL_0008',1,9,220),
('C_SH_CL_0008',1,10,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_SH_CL_0008',1,'兒童款初階柔軟牛皮馬術短靴1.jpg'),
('C_SH_CL_0008',null,'兒童款初階柔軟牛皮馬術短靴2.jpg'),
('C_SH_CL_0008',null,'兒童款初階柔軟牛皮馬術短靴3.jpg');


----------------------------------------------------------------


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_SP_0001','男款中階穩定緩震羽毛球鞋 BS560 Lite','這款球鞋避震且輕巧，適合中階羽球員穿著！輕量又避震！本球鞋鞋體輕巧，足跟附有避震墊，方便中階球員快速移動；鞋面和鞋側具有通風系統，保持鞋內狀況良好。',null,'台灣',null,3600,'false',null,16);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_SP_0001',4,28,100),
('M_SH_SP_0001',4,29,200),
('M_SH_SP_0001',8,29,100),
('M_SH_SP_0001',8,30,50);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_SP_0001',4,'男款中階穩定緩震羽毛球鞋3.jpg'),
('M_SH_SP_0001',null,'男款中階穩定緩震羽毛球鞋4.jpg'),
('M_SH_SP_0001',8,'男款中階穩定緩震羽毛球鞋2.jpg'),
('M_SH_SP_0001',null,'男款中階穩定緩震羽毛球鞋1.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_SP_0002','男款中階舒適羽球鞋 BS 530','適合尋找具有透氣鞋面和絕佳緩震鞋款的中階球員，可讓他們在多種場合中穿著緩震又透氣！這款球鞋既避震又透氣，適合想要更上一層樓的中階羽球員穿著。',null,'台灣',2500,2000,'false','限量',16);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_SP_0002',2,28,220),
('M_SH_SP_0002',2,29,100),
('M_SH_SP_0002',6,28,190),
('M_SH_SP_0002',6,29,300);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_SP_0002',2,'Product_00311.jpg'),
('M_SH_SP_0002',null,'Product_00312.jpg'),
('M_SH_SP_0002',6,'Product_00313.jpg'),
('M_SH_SP_0002',null,'Product_00314.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_SP_0003','男款中階多場地網球鞋','我們設計出這款網球鞋，讓你更輕鬆面對連續對打的初體驗。穿上舒適鞋款，開始打網球。網球專用鞋底，讓你以可入手的價格，自在踏上網球學習之路。',null,'台灣',2500,2000,'false','限量',16);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_SP_0003',2,28,220),
('M_SH_SP_0003',2,29,100);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_SP_0003',2,'Product_003111.jpg'),
('M_SH_SP_0003',null,'Product_003121.jpg'),
('M_SH_SP_0003',null,'Product_003131.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_SP_0004','男款初階輕量止滑羽毛球鞋 BS190','我們設計出這款網球鞋，讓你更輕鬆面對連續對打的初體驗。穿上舒適鞋款，開始打網球。網球專用鞋底，讓你以可入手的價格，自在踏上網球學習之路。',null,'台灣',2600,2200,'false','限量',16);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_SP_0004',1,28,220),
('M_SH_SP_0004',1,29,100),
('M_SH_SP_0004',1,30,100);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_SP_0004',1,'男款初階輕量止滑羽毛球鞋1.jpg'),
('M_SH_SP_0004',null,'男款初階輕量止滑羽毛球鞋2.jpg'),
('M_SH_SP_0004',null,'男款初階輕量止滑羽毛球鞋3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_SP_0005','男款厚底緩震訓練網球鞋 (多場地適用)','我們設計團隊研發的這款網球鞋，讓你能安全地學習打網球！穩定、避震及良好支撐！這款TS160有較厚的鞋底、側面加強和避震效果，非常適合學習打網球或想重回網球場的人穿著！',null,'台灣',2500,2300,'false','限量',16);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_SP_0005',2,28,220),
('M_SH_SP_0005',2,31,100),
('M_SH_SP_0005',2,32,100);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_SP_0005',2,'男款厚底緩震訓練網球鞋1.jpg'),
('M_SH_SP_0005',null,'男款厚底緩震訓練網球鞋2.jpg'),
('M_SH_SP_0005',null,'男款厚底緩震訓練網球鞋3.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_SP_0006','男款透氣舒適高爾夫球鞋','這款輕便透氣的高爾夫球鞋由我們團隊開發，很適合在溫暖的天氣（體感溫度 > 20 °C）打高爾夫球採用 3D 網眼讓產品超透氣新鞋底結合兩種材料，讓你穿鞋舒適，產品超防滑。',null,'台灣',2500,2300,'false','限量',16);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_SP_0006',1,30,220),
('M_SH_SP_0006',1,31,100),
('M_SH_SP_0006',1,32,100),
('M_SH_SP_0006',2,30,220),
('M_SH_SP_0006',2,31,100),
('M_SH_SP_0006',2,32,100);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_SP_0006',1,'男款透氣舒適高爾夫球鞋1.jpg'),
('M_SH_SP_0006',null,'男款透氣舒適高爾夫球鞋2.jpg'),
('M_SH_SP_0006',null,'男款透氣舒適高爾夫球鞋3.jpg'),
('M_SH_SP_0006',2,'男款透氣舒適高爾夫球鞋4.jpg'),
('M_SH_SP_0006',null,'男款透氣舒適高爾夫球鞋5.jpg'),
('M_SH_SP_0006',null,'男款透氣舒適高爾夫球鞋6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_SP_0007','中階室內桌球鞋 TTS560','專為中階玩家設計！專為在室內場地穿著而設計。抓地力和避震性兼具正在尋找比賽與訓練兩用的桌球鞋嗎？這款鞋具有避震性和抓地力，所以可以在比賽時提供舒適度。',null,'台灣',2800,2250,'false','限量',16);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_SP_0007',4,29,220),
('M_SH_SP_0007',4,30,100),
('M_SH_SP_0007',4,31,100),
('M_SH_SP_0007',5,30,220),
('M_SH_SP_0007',5,31,100),
('M_SH_SP_0007',5,32,100);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_SP_0007',4,'中階室內桌球鞋1.jpg'),
('M_SH_SP_0007',null,'中階室內桌球鞋2.jpg'),
('M_SH_SP_0007',null,'中階室內桌球鞋3.jpg'),
('M_SH_SP_0007',5,'中階室內桌球鞋4.jpg'),
('M_SH_SP_0007',null,'中階室內桌球鞋5.jpg'),
('M_SH_SP_0007',null,'中階室內桌球鞋6.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_SP_0008','男款中階舒適緩震羽球鞋 BS590','這款羽球鞋避震功能良好，可有效減少衝擊力，適合中階羽球員穿著！極致舒適又避震DIAPAD避震系統減少足跟衝擊，達到最大避震效果。前腳的鞋墊系統強化了跳躍力。',null,'台灣',null,2000,'false','限量',16);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_SP_0008',1,29,220),
('M_SH_SP_0008',1,30,100),
('M_SH_SP_0008',1,31,100),
('M_SH_SP_0008',5,30,220),
('M_SH_SP_0008',5,31,100),
('M_SH_SP_0008',5,32,100);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('M_SH_SP_0008',1,'男款中階舒適緩震羽球鞋1.jpg'),
('M_SH_SP_0008',null,'男款中階舒適緩震羽球鞋2.jpg'),
('M_SH_SP_0008',null,'男款中階舒適緩震羽球鞋3.jpg'),
('M_SH_SP_0008',5,'男款中階舒適緩震羽球鞋4.jpg'),
('M_SH_SP_0008',null,'男款中階舒適緩震羽球鞋5.jpg'),
('M_SH_SP_0008',null,'男款中階舒適緩震羽球鞋6.jpg');




INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_SP_0001','女款Jogflow系列輕量緩震跑鞋','我們設計這款可在長達 10 公里的跑步中避免受傷並提供最大舒適度的跑鞋。舒適到讓你捨不得脫下。',null,'台灣',2300,1890,'false','限量',17);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_SP_0001',1,20,220),
('F_SH_SP_0001',1,21,200),
('F_SH_SP_0001',1,22,250),
('F_SH_SP_0001',2,21,200),
('F_SH_SP_0001',2,22,250),
('F_SH_SP_0001',2,23,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_SH_SP_0001',1,'女款Jogflow系列輕量緩震跑鞋1.jpg'),
('F_SH_SP_0001',null,'女款Jogflow系列輕量緩震跑鞋2.jpg'),
('F_SH_SP_0001',null,'女款Jogflow系列輕量緩震跑鞋3.jpg'),
('F_SH_SP_0001',2,'女款Jogflow系列輕量緩震跑鞋4.jpg'),
('F_SH_SP_0001',null,'女款Jogflow系列輕量緩震跑鞋5.jpg'),
('F_SH_SP_0001',null,'女款Jogflow系列輕量緩震跑鞋6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_SP_0002','女款系列輕量緩震跑鞋','這款跑鞋專為讓你在長達 10 公里的跑步中避免受傷並獲得最大的舒適度精心設計。輕到像沒穿鞋一樣。感受自由，釋放力量。',null,'台灣',2300,1890,'false','限量',17);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_SP_0002',7,20,220),
('F_SH_SP_0002',7,21,200),
('F_SH_SP_0002',7,22,250),
('F_SH_SP_0002',2,21,200),
('F_SH_SP_0002',2,22,250),
('F_SH_SP_0002',2,23,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_SH_SP_0002',7,'女款系列輕量緩震跑鞋1.jpg'),
('F_SH_SP_0002',null,'女款系列輕量緩震跑鞋2.jpg'),
('F_SH_SP_0002',null,'女款系列輕量緩震跑鞋3.jpg'),
('F_SH_SP_0002',2,'女款系列輕量緩震跑鞋4.jpg'),
('F_SH_SP_0002',null,'女款系列輕量緩震跑鞋5.jpg'),
('F_SH_SP_0002',null,'女款系列輕量緩震跑鞋6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_SP_0003','女款初階多場地網球鞋','我們的設計團隊所研發的女款網球鞋，適合初次在網球場上活動時穿著。搭配一款舒適的球鞋，開始你的網球體驗。',null,'台灣',2300,1890,'false','限量',17);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_SP_0003',2,21,200),
('F_SH_SP_0003',2,22,250),
('F_SH_SP_0003',2,23,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_SH_SP_0003',2,'女款初階多場地網球鞋1.jpg'),
('F_SH_SP_0003',null,'女款初階多場地網球鞋2.jpg'),
('F_SH_SP_0003',null,'女款初階多場地網球鞋3.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_SP_0004','女款初階透氣輕量羽毛球鞋 BS190 W','適合羽球初學者穿著！抓地又透氣！這款鞋子非常適合初學者穿著。',null,'台灣',2300,1890,'false','限量',17);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_SP_0004',1,20,220),
('F_SH_SP_0004',1,21,200),
('F_SH_SP_0004',1,22,250),
('F_SH_SP_0004',7,21,200),
('F_SH_SP_0004',7,22,250),
('F_SH_SP_0004',7,23,220);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('F_SH_SP_0004',1,'女款初階透氣輕量羽毛球鞋 BS190 W1.jpg'),
('F_SH_SP_0004',null,'女款初階透氣輕量羽毛球鞋 BS190 W2.jpg'),
('F_SH_SP_0004',null,'女款初階透氣輕量羽毛球鞋 BS190 W3.jpg'),
('F_SH_SP_0004',7,'女款初階透氣輕量羽毛球鞋 BS190 W4.jpg'),
('F_SH_SP_0004',null,'女款初階透氣輕量羽毛球鞋 BS190 W5.jpg'),
('F_SH_SP_0004',null,'女款初階透氣輕量羽毛球鞋 BS190 W6.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,Status,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_SP_0001','運動鞋005','這是運動鞋005',null,'台灣',null,1500,'true','false',null,18);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_SP_0001',1,8,220),
('C_SH_SP_0001',2,11,50),
('C_SH_SP_0001',2,12,30);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_SH_SP_0001',null,'Product_00341.jpg'),
('C_SH_SP_0001',null,'Product_00342.jpg'),
('C_SH_SP_0001',null,'Product_00343.jpg'),
('C_SH_SP_0001',null,'Product_00344.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_SP_0002','運動鞋006','這是運動鞋006',null,'台灣',2000,1650,'true',null,18);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_SP_0002',1,8,220),
('C_SH_SP_0002',1,9,100),
('C_SH_SP_0002',3,8,190),
('C_SH_SP_0002',3,9,300);

INSERT INTO ProductImgs(fk_ProductId,fk_ColorId,ImgPath)
VALUES 
('C_SH_SP_0002',null,'Product_00351.jpg'),
('C_SH_SP_0002',null,'Product_00352.jpg'),
('C_SH_SP_0002',null,'Product_00353.jpg');

--濱董********************************************************************************--

insert into Suppliers (SupplierCompanyName, HasCertificate, Supply_Material,
SupplierCompanyPhone,SupplierCompanyEmail,SupplierCompanyAddress,SupplierCompanyNumber,SupplierStartDate)
values
('政斌紡織有限公司',1,'帆布',033817499,'Valcloth@gmail.com','桃園市大園區中正路1段1號',77778888,GETDATE()),
('易暖織布有限公司',1,'皮革',045217898,'a_pants@gmail.com','新竹市東區中央路200號',87871234,GETDATE()),
('建綸紡織廠',1,'牛皮',034725656,'Rowscloses@gmail.com','桃園市中壢區金陵路100號',12345678,GETDATE()),
('祥豪製布',1,'緞紋皮革',065107777,'ShowHowCloth@gmail.com','台南市北安路300號',85857878,GETDATE());


insert into ShoesCategories (ShoesCategoryName)
values
('運動生活'),
('跑步'),
('籃球'),
('英式足球'),
('訓練與健身'),
('田徑');


insert into ShoesColorCategories (ColorName,ColorCode)
values
('黑色','#000000'),
('白色','#FFFFFF'),
('番茄紅','#FF6347'),
('淺灰色','#D3D3D3'),
('灰土色','#CCB38C'),
('淺綠','#90EE90'),
('綠松石綠','#4DE680'),
('天藍','#87CEEB'),
('韋奇伍德瓷藍','#5686BF'),
('李紫','#DDA0DD');


insert into ShoesSizes(SizeName)
values
('CM-24(US6)'),
('CM-24.5'),
('CM-25'),
('CM-25.5'),
('CM-26'),
('CM-26.5'),
('CM-27'),
('CM-27.5'),
('CM-28'),
('CM-28.5'),
('CM-29'),
('CM-29.5'),
('CM-30'),
('CM-30.5'),
('CM-31'),
('CM-32'),
('CM-33'),
('CM-34'),
('CM-35'),
('CM-36')



insert into Customized_materials (material_Name)
values
('帆布'),
('皮革'),
('緞紋皮革'),
('牛皮'),
('絲絨');

insert into ShoesChooses(OptinName)
values
('鞋面'),
('鞋尖'),
('護邊'),
('鞋領'),
('孔眼片');


insert into CustomizedShoesPo (ShoesName,ShoesDescription,ShoesOrigin,ShoesUnitPrice,StartTime,EndTime,fk_ShoesCategoryId,fk_ShoesColorId,DataCreateTime,DataEditTime)
values
('BS00101','專為您訂製最舒適的籃球鞋，於籃球場上揮灑您的青春汗水。','台灣',5000,GETDATE(),null,3,1,GETDATE(),GETDATE()),
('BS00102','隨時展開冒險。 採用天候防護皮革與耐久設計，不只好看，更為你的創作增添質感和實用性。','台灣',5000,GETDATE(),null,3,2,GETDATE(),GETDATE()),
('BS00103','你今天擁抱你的雙腳了嗎？ 別停下腳步。 為這雙舒適非凡的經典鞋款添加個性色彩，帶動全世界的好心情。','台灣',5000,GETDATE(),null,3,8,GETDATE(),GETDATE()),
('LF00101','適用於多種場合，為您訂製屬於自己的都市風格。','台灣',4000,GETDATE(),null,1,1,GETDATE(),GETDATE()),
('LF00102','隨時展開冒險。 採用天候防護皮革與耐久設計，不只好看，更為你的創作增添質感和實用性。','台灣',4000,GETDATE(),null,1,2,GETDATE(),GETDATE()),
('LF00103','你今天擁抱你的雙腳了嗎？ 別停下腳步。 為這雙舒適非凡的經典鞋款添加個性色彩，帶動全世界的好心情。','台灣',4000,GETDATE(),null,1,5,GETDATE(),GETDATE()),
('RN00101','訂製專屬於您的跑步鞋，用力奔跑，繼續於前進的道路上發揚夢想。','台灣',4500,GETDATE(),null,2,1,GETDATE(),GETDATE()),
('RN00102','隨時展開冒險。 採用天候防護皮革與耐久設計，不只好看，更為你的創作增添質感和實用性。','台灣',4500,GETDATE(),null,2,2,GETDATE(),GETDATE()),
('RN00103','你今天擁抱你的雙腳了嗎？ 別停下腳步。 為這雙舒適非凡的經典鞋款添加個性色彩，帶動全世界的好心情。','台灣',4500,GETDATE(),null,2,8,GETDATE(),GETDATE()),
('SK00101','在球場盡情奔馳，隨時展現你的厲害球技。','台灣',6000,GETDATE(),null,4,1,GETDATE(),GETDATE()),
('SK00102','隨時展開冒險。 採用天候防護皮革與耐久設計，不只好看，更為你的創作增添質感和實用性。','台灣',6000,GETDATE(),null,4,2,GETDATE(),GETDATE()),
('SK00103','你今天擁抱你的雙腳了嗎？ 別停下腳步。 為這雙舒適非凡的經典鞋款添加個性色彩，帶動全世界的好心情。','台灣',6000,GETDATE(),null,4,8,GETDATE(),GETDATE()),
('TR00101','在訓練的途中，隨時保護您的足部，避免訓練的挫傷。','台灣',5500,GETDATE(),null,5,1,GETDATE(),GETDATE()),
('TR00102','隨時展開冒險。 採用天候防護皮革與耐久設計，不只好看，更為你的創作增添質感和實用性。','台灣',5500,GETDATE(),null,5,2,GETDATE(),GETDATE()),
('TR00103','你今天擁抱你的雙腳了嗎？ 別停下腳步。 為這雙舒適非凡的經典鞋款添加個性色彩，帶動全世界的好心情。','台灣',5500,GETDATE(),null,5,8,GETDATE(),GETDATE()),
('TF00101','超強的耐久設計，讓您於各項賽事無往不利！','台灣',4500,GETDATE(),null,6,1,GETDATE(),GETDATE()),
('TF00102','隨時展開冒險。 採用天候防護皮革與耐久設計，不只好看，更為你的創作增添質感和實用性。','台灣',4500,GETDATE(),null,6,2,GETDATE(),GETDATE()),
('TF00103','你今天擁抱你的雙腳了嗎？ 別停下腳步。 為這雙舒適非凡的經典鞋款添加個性色彩，帶動全世界的好心情。','台灣',4500,GETDATE(),null,6,8,GETDATE(),GETDATE())



insert into ShoesPictures(fk_ShoesPictureProduct_Id,ShoesPictureUrl)
values
(1,'SH_11GM235109.jpg'),
(1,'SH_11GM235114.jpg'),
(2,'SH_11GT220129.jpg'),
(2,'SH_11GT221029.jpg'),
(3,'SH_61GA234014.jpg'),
(3,'SH_61GA234062.jpg'),
(4,'SH_71GA231325.jpg'),
(4,'SH_71GA231322.jpg'),
(5,'SH_71GA234006.jpg'),
(5,'SH_71GA234002.jpg'),
(6,'SH_J1GC223453.jpg'),
(6,'SH_J1GC227852.jpg'),
(7,'SH_J1GC230951.jpg'),
(7,'SH_J1GC230953.jpg'),
(8,'SH_J1GC231102.jpg'),
(8,'SH_J1GC231101.jpg'),
(9,'SH_K1GA220311.jpg'),
(9,'SH_K1GA220343.jpg'),
(10,'SH_U1GA204052.jpg'),
(10,'SH_U1GA213002.jpg'),
(11,'SH_U1GA213002.jpg'),
(11,'SH_U1GA204052.jpg'),
(12,'SH_U1GA232404.jpg'),
(12,'SH_U1GA233002.jpg'),
(13,'SH_Q1GA230373.jpg'),
(13,'SH_Q1GA230381.jpg'),
(14,'SH_Q1GA230381.jpg'),
(14,'SH_Q1GA230373.jpg'),
(15,'SH_P1GG222600.jpg'),
(15,'SH_P1GG236509.jpg'),
(16,'SH_P1GA232550.jpg'),
(16,'SH_P1GA232504.jpg'),
(17,'SH_P1GA232504.jpg'),
(17,'SH_P1GA232550.jpg'),
(18,'SH_P1GA236501.jpg'),
(18,'SH_P1GA236509.jpg')
--品瑩**************************************************************************--


--1.黑名單
INSERT INTO BlackLists 
(Behavior) 
VALUES 
('詐欺行為'),('未經授權的行為'),('違反使用條款'),('頻繁退貨'),('不當行為'),('違反隱私權政策'),('其他');

--------------------------------------------------
--2.特權
INSERT INTO Privileges 
(PrivilegeName,[Description]) 
VALUES 
('生日優惠','根據會員的生日提供獨家優惠和禮物'),
('專屬活動','邀請特定等級的會員參加線上或線下的活動'),
('訪問新品','新品推出優先讓VVIP會員購買'),
('限量商品','限量商品僅限VVIP會員購買');

--------------------------------------------------
--3.等級
INSERT INTO MembershipLevels 
(LevelName,MinSpending,Discount,[Description]) 
VALUES 
('一般會員',0,0,'新註冊的會員自動成為基本級別會員'),
('VIP',8888,88,'消費門檻達8,888即可升級'),
('VVIP',12000,85,'消費門檻達12,000即可升級');

--------------------------------------------------
--4.會員等級與特權中介資料表
INSERT INTO MembershipLevelPrivileges (fk_LevelId, fk_PrivilegeId)
VALUES
  (1, 1), -- 一般會員的生日優惠
  (2, 1), -- VIP會員的生日優惠
  (2, 2), -- VIP會員的專屬活動優惠
  (3, 1), -- VVIP會員的生日優惠
  (3, 2), -- VVIP會員的專屬活動優惠
  (3, 3), -- VVIP會員的訪問新品優惠
  (3, 4); -- VVIP會員的限量商品優惠

--------------------------------------------------
--5.會員
SET IDENTITY_INSERT [dbo].[Members] ON 
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (1, N'David Wu', 28, 0, N'0912378511', N'davidwu@gmail.com', CAST(N'1991-08-16' AS Date), N'台北市信義區忠孝東路五段22號', N'a123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', 1, 1, 1)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (2, N'Tina Lin', 41, 1, N'0923456719', N'kevinchen@example.com', CAST(N'1982-04-28' AS Date), N'台中市南區建國北路123號', N'b123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', 1, 2, 2)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (3, N'Tony Chen', 48, 0, N'0911654321', N'lisawang@example.com', CAST(N'1975-10-17' AS Date), N'台北市中山區中正路789號', N'c23', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', 0, 3, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (4, N'Ryan Liu', 20, 0, N'0911456111', N'ryanliu@example.com', CAST(N'1989-08-16' AS Date), N'新竹市東區光復路456號', N'ryanliu123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', 1, 2, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (5, N'Sophia Huang', 33, 0, N'0933777244', N'sophiahuang@example.com', CAST(N'1990-08-12' AS Date), N'桃園市中壢區環中東路111號', N'sophiahuang123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (6, N'Chris Lee', 30, 1, N'0955753666', N'chrislee@example.com', CAST(N'1993-11-05' AS Date), N'台南市北區成功路222號', N'chrislee123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Pending', NULL, 1, 3)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (7, N'Olivia Lin', 35, 0, N'0922245633', N'olivialin@example.com', CAST(N'1988-12-29' AS Date), N'彰化縣員林市中山路333號', N'olivialin123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 2, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (8, N'Daniel Yang', 45, 1, N'096685277', N'danielyang@example.com', CAST(N'1978-07-17' AS Date), N'新北市三峽區民生路456號', N'danielyang123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (9, N'Ava Tsai', 22, 0, N'0912345678', N'avatsai@example.com', CAST(N'2001-03-02' AS Date), N'基隆市中山區中正路567號', N'avatsai123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 2, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (10, N'Jason Huang', 38, 1, N'0923556789', N'jasonhuang@example.com', CAST(N'1985-08-28' AS Date), N'桃園市桃園區中正路789號', N'jasonhuang123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 3, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (11, N'Ella Wang', 29, 0, N'0987654321', N'ellawang@example.com', CAST(N'1994-11-14' AS Date), N'高雄市鳳山區鳳松路123號', N'ellawang123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (12, N'Eric Chen', 25, 1, N'0911896233', N'ericchen@example.com', CAST(N'1998-04-18' AS Date), N'新竹市北區光復路456號', N'ericchen123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 3, 4)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (13, N'Mia Liu', 42, 0, N'0933312444', N'mialiu@example.com', CAST(N'1981-01-09' AS Date), N'台南市南區成功路222號', N'mialiu123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 2, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (14, N'William Chang', 32, 1, N'0955578966', N'williamchang@example.com', CAST(N'1991-09-24' AS Date), N'彰化縣彰化市中山路333號', N'williamchang123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (15, N'Grace Lin', 27, 0, N'0922224563', N'gracelin@example.com', CAST(N'1996-06-10' AS Date), N'新北市板橋區民生路456號', N'gracelin123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (16, N'Alex Wu', 37, 1, N'0966825777', N'alexwu@example.com', CAST(N'1986-09-02' AS Date), N'基隆市仁愛區中正路567號', N'alexwu123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Pending', NULL, 2, 1)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (17, N'Chloe Huang', 23, 0, N'0912348888', N'chloehuang@example.com', CAST(N'2000-02-15' AS Date), N'新竹市東區民生路456號', N'chloehuang123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 1, 6)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (18, N'Andrew Liu', 44, 1, N'0923456789', N'andrewliu@example.com', CAST(N'1979-05-27' AS Date), N'桃園市中壢區中正路789號', N'andrewliu123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 2, 4)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (19, N'Lily Chen', 30, 0, N'0981114321', N'lilychen@example.com', CAST(N'1993-08-21' AS Date), N'高雄市前鎮區忠孝東路123號', N'lilychen123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (20, N'Henry Wang', 26, 1, N'0910562562', N'henrywang@example.com', CAST(N'1997-07-12' AS Date), N'台南市北區成功路222號', N'henrywang123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 2, 5)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (21, N'John Doe', 25, 1, N'0934567890', N'johndoe@example.com', CAST(N'1997-05-10' AS Date), N'新北市土城區學府路一段6號', N'johndoe123', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (22, N'Jane Smith', 30, 0, N'0976543210', N'janesmith@example.com', CAST(N'1992-08-15' AS Date), N'新北市新莊區南雅路354號', N'janesmith456', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 2, 1)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (23, N'Michael Johnson', 35, 1, N'0958889999', N'michaeljohnson@example.com', CAST(N'1987-03-20' AS Date), N'台中市太平區中正路一段111號', N'mjohnson789', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Pending', NULL, 2, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (24, N'Emily Davis', 28, 0, N'0972221111', N'emilydavis@example.com', CAST(N'1993-11-05' AS Date), N'新北市鶯歌區鶯桃路三段7號', N'emilyd321', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (25, N'David Wilson', 32, 1, N'0947778888', N'davidwilson@example.com', CAST(N'1989-07-12' AS Date), N'台東縣東河鄉濱海路33號', N'dwilson567', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-07T22:05:28.250' AS DateTime), 1, N'Confirmed', NULL, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (26, N'test', NULL, NULL, N'0988752221', N'test@gmail.com', CAST(N'2000-08-17' AS Date), N'台中市太平區中正路一段111號', N'test', N'$2a$10$XuDw9j1X5sJ9ngPxtUyZ9un1NARS7B0E4Y6DfSQcx57PXnAKdasWW', CAST(N'2023-08-24T22:47:00.810' AS DateTime), NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (27, N'1', NULL, NULL, N'0988888888', N'j790830@yahoo.com.tw', CAST(N'2023-08-10' AS Date), N'1', N'1', N'$2a$10$NobNHChibiDuwK7qLPkhPe8KLb6eQm/K5PNaRiEt1Vdxd.oqLNOl2', CAST(N'2023-08-25T12:00:59.253' AS DateTime), NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (28, N'test2', NULL, NULL, N'0977854121', N'test2@gmail.com', CAST(N'2023-08-02' AS Date), N'test2', N'test2', N'$2a$10$xbW/XJIvLhlQC4ptqVsUSuHcxBhVEL2Kipm95Mo/eIGST1QluZ7oG', CAST(N'2023-08-25T14:26:12.067' AS DateTime), NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (29, N'Omari Schinner', NULL, NULL, N'0915206275', N'Pierre25@gmail.com', CAST(N'1991-08-29' AS Date), N'0757 McLaughlin Ports, Orionshire, Cyprus', N'456', N'$2a$10$7K3Acj1GCyK.BTHOn0iTN.bOR.coMNH1AURw6GS4oA15iI3SgOjDK', CAST(N'2023-08-25T20:12:00.710' AS DateTime), NULL, NULL, NULL, 1, 5)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (30, N'Ayana Schroeder', NULL, NULL, N'0952723667', N'Mayra.Kovacek@hotmail.com', CAST(N'1980-03-12' AS Date), N'06742 Lehner Parkway, Katelynnshire, Chad', N'PYPY', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-27T09:50:52.680' AS DateTime), NULL, N'd4f465347acb4c82a4f4401e6649756b', NULL, 1, 5)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (31, N'Cindy', NULL, NULL, N'0915136140', N'fuen28flex2@gmail.com', CAST(N'1986-01-30' AS Date), N'6540 Lorenzo Pass, Kuvalisfurt, Aruba', N'Cindy', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-27T10:05:02.217' AS DateTime), NULL, N'Confirmed', 1, 1, NULL)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (32, N'Cierra Tina', NULL, 1, N'0903177825', N'fuen28flex3@gmail.com', CAST(N'1989-01-07' AS Date), N'013 Kris Place, East Katharina, Mauritius', N'Tina', N'B3A8E0E1F9AB1BFE3A36F231F676F78BB30A519D2B21E6C530C0EEE8EBB4A5D0', CAST(N'2023-08-27T13:50:15.520' AS DateTime), NULL, N'Confirmed', 1, 1, 3)
GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (33, N'Thora Sanford', NULL, 1, N'0908041274', N'fuen28flex@gmail.com', CAST(N'1987-01-30' AS Date), N'7635 Mustafa Row, Vandervortfurt, Guyana', N'ppp', N'0A84C513D4E8C40803B28E0E45578E5587C6A2B41EFE4952D0E68276593C729B', CAST(N'2023-08-27T20:13:09.723' AS DateTime), NULL, N'Confirmed', 1, 1, NULL)
GO
--INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (42, N'11', NULL, 0, N'0912371122', N'11@gmail.com', NULL, N'台北市信義區忠孝西路一段22號', N'11', N'11', CAST(N'2023-08-10T18:18:53.707' AS DateTime), NULL, NULL, 1, 1, NULL)
--GO
--INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (44, N'111', NULL, NULL, N'0912123111', N'111@gmail.com', CAST(N'1996-08-10' AS Date), NULL, N'111', N'111', CAST(N'2023-08-10T18:29:28.707' AS DateTime), NULL, NULL, NULL, 1, NULL)
--GO
--INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (46, N'22', NULL, NULL, N'0922222222', N'22@yahoo.com.tw', CAST(N'1996-04-12' AS Date), NULL, N'22', N'22', CAST(N'2023-08-10T18:59:03.380' AS DateTime), NULL, NULL, NULL, 1, NULL)
--GO
--INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (47, N'88', NULL, NULL, N'0928888888', N'88@yahoo.com.tw', CAST(N'1995-02-01' AS Date), NULL, N'88', N'88', CAST(N'2023-08-10T19:18:39.760' AS DateTime), NULL, NULL, NULL, 1, NULL)
--GO
--INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (48, N'66', NULL, 1, N'string', N'string', CAST(N'2023-08-14' AS Date), N'string', N'66', N'66', CAST(N'2023-08-10T19:23:50.923' AS DateTime), NULL, NULL, 1, 1, NULL)
--GO
--INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (49, N'777', NULL, 0, N'0988755555', N'777@gmail.com', NULL, N'台中市大里區鼎泰豐小籠包', N'777', N'777', CAST(N'2023-08-10T20:24:36.917' AS DateTime), NULL, NULL, 1, 1, NULL)
--GO
--INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (51, N'33', NULL, 1, N'0955555888', N'33@gmail.com.tw', NULL, N'台中市大里區三民路45號7樓', N'33', N'33', CAST(N'2023-08-11T10:29:20.957' AS DateTime), NULL, NULL, 1, 1, NULL)
--GO
--INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (53, N'殷桑', NULL, NULL, N'0987878787', N'555@yahoo.com.tw', CAST(N'1995-08-08' AS Date), NULL, N'555', N'555', CAST(N'2023-08-15T10:30:35.837' AS DateTime), NULL, NULL, NULL, 1, NULL)
--GO
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [ConfirmCode], [IsSubscribeNews], [fk_LevelId], [fk_BlackListId]) VALUES (54, N'黃技術長大大', NULL, 0, N'0978787874', N'999@yahoo.com.tw', CAST(N'2023-08-10' AS Date), N'66677778888', N'999', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', CAST(N'2023-08-15T10:31:41.543' AS DateTime), NULL, N'Confirmed', 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Members] OFF
GO


--------------------------------------------------
--6.備用地址
INSERT INTO AlternateAddresses (AlternateAddress1, AlternateAddress2, fk_MemberId)
VALUES
  ('新北市新莊區南雅路354號',null ,1),
  (NULL, NULL,2),
  ('新北市板橋區府中路一段6號', null,3),
  ('桃園市中壢區聖德路三段7號', NULL,5),
  ('台南市白河鎮白河路354號', '新北市土城區學士路一段36號',4);

--9.類型
INSERT INTO [Type] (TypeName)
VALUES
('商品'),
('活動'),
('課程'),
('客製化商品');

--------------------------------------------------
--7.歷史積分,需要與訂單建立關聯
INSERT INTO PointHistories (GetOrDeduct, UsageAmount,fk_MemberId,fk_TypeId)
VALUES
  (1,100,1,1),
  (0,50,2,2),
  (0,200,3,3),
  (0,30,4,4),
  (1,0,5,1),
  (1,100,6,1),
  (0,50,7,2),
  (0,200,8,3),
  (0,30,8,4),
  (1,0,10,1),
  (1,100,12,1),
  (0,50,25,2),
  (0,200,13,3),
  (0,30,13,4),
  (1,0,5,1),
  (1,100,13,1),
  (0,50,2,2),
  (0,200,3,3),
  (0,30,11,4),
  (1,0,8,1),
  (1,100,1,1),
  (0,50,10,2),
  (0,200,3,3),
  (0,30,4,4),
  (1,0,5,1);

--------------------------------------------------
--8.會員積分
INSERT INTO MemberPoints (PointSubtotal, fk_MemberId)
VALUES 
 (110,1),(60,2),(420,3),(21,4),(70,5), 
 (110,6),(21,9),(70,10),(110,11),(60,12),    
 (420,13),(21,14),(70,15),(110,16),(0,17),
 (0,18),(0,19),(420,20),(21,21),(70,22), 
 (0,23),(0,24),(0,25),(420,7),(21,8);

--------------------------------------------------
--10.積分管理
INSERT INTO PointManage (GetOrDeduct,Amount,fk_TypeId,PointExpirationDate)
VALUES
(0, 100, 4, '2023-06-25'),(1, 200, 1, '2023-06-27'),(1, 200, 3, '2023-06-25'),(0, 100, 4, '2023-06-25'),(0, 100, 4, '2023-06-25'),
(1, 200, 4, '2023-06-27'),(0, 100, 2, '2023-06-25'),(0, 100, 3, '2023-06-27'),(1, 200, 4, '2023-06-25'),(1, 200, 4, '2023-06-27'),
(0, 100, 1, '2023-06-27'),(1, 200, 2, '2023-06-27'),(1, 200, 3, '2023-06-25'),(0, 100, 2, '2023-06-25'),(0, 100, 1, '2023-06-25'),
(0, 100, 3, '2023-06-27'),(1, 200, 2, '2023-06-25'),(1, 200, 1, '2023-06-25'),(0, 100, 2, '2023-06-27'),(0, 100, 1, '2023-06-27'),
(1, 200, 4, '2023-06-25'),(1, 200, 3, '2023-06-27'),(0, 100, 1, '2023-06-25'),(1, 200, 4, '2023-06-27'),(1, 200, 2, '2023-06-27');

--------------------------------------------------
--11.積分折抵
INSERT INTO PointTradeIn (GiftThreshold,GetPoints,MaxGetPoints,EffectiveDate,ExpirationDate,fk_MemberId)
VALUES
(100,1,1000,'2023-6-27','2024-6-27',1),
(200, 3, 900, '2023-06-05', '2024-06-05', 18),
(120, 1, 700, '2023-07-10', '2024-07-10', 5),
(180, 2, 600, '2023-08-15', '2024-08-15', 24),
(100, 1, 800, '2023-09-20', '2024-09-20', 7),
(250, 3, 900, '2023-10-25', '2024-10-25', 16),
(160, 2, 700, '2023-11-30', '2024-11-30', 23),
(140, 1, 1000, '2023-12-05', '2024-12-05', 9),
(200, 2, 800, '2024-01-10', '2025-01-10', 3),
(180, 2, 700, '2024-02-15', '2025-02-15', 21),
(130, 1, 600, '2024-03-20', '2025-03-20', 14),
(150, 2, 800, '2024-04-25', '2025-04-25', 10),
(170, 2, 900, '2024-05-30', '2025-05-30', 19),
(120, 1, 700, '2024-06-05', '2025-06-05', 6),
(190, 3, 1000, '2024-07-10', '2025-07-10', 25),
(160, 2, 800, '2024-08-15', '2025-08-15', 2),
(140, 1, 700, '2024-09-20', '2025-09-20', 17),
(210, 2, 800, '2024-10-25', '2025-10-25', 8),
(130, 1, 600, '2024-11-30', '2025-11-30', 22),
(150, 2, 800, '2024-12-05', '2025-12-05', 11),
(190, 3, 900, '2025-01-10', '2026-01-10', 15),
(170, 2, 700, '2025-02-15', '2026-02-15', 20),
(140, 1, 1000, '2025-03-20', '2026-03-20', 13),
(160, 2, 800, '2025-04-25', '2026-04-25', 4),
(180, 2, 900, '2025-05-30', '2026-05-30', 1);

--------------------------------------------------
--------------------------------------------------
--員工權限
INSERT INTO StaffPermissions (LevelName)
VALUES
  ('一般權限'),
  ('中級權限'),
  ('高級權限');

--------------------------------------------------
--員工職稱
INSERT INTO JobTitles (TitleName,fk_StaffPermissions)
VALUES ('助理',1),
       ('專員',2),
       ('主管',3),
       ('經理',3);

--------------------------------------------------
--部門
INSERT INTO Departments (DepartmentName)
VALUES ('行銷部門'),
       ('技術部門'),
       ('銷售部門'),
       ('商品部門'),
       ('客服部門');

--------------------------------------------------
--員工名單
INSERT INTO Staffs ([Name], Age, Gender, Mobile, Email, Birthday, Account, [Password], fk_PermissionsId,fk_TitleId,fk_DepartmentId,[DueDate])
VALUES
('吳依頒', 29, 0, '0912345601', 'amy.johnson@example.com', '1994-10-01', '123', '123', 1, 1, 5,'2021-01-01'),
('王盅集', 37, 1, '0987654302', 'kevin.chen@example.com', '1986-05-20', '456', '123', 2, 2, 4,'2000-01-03'),
('陳高吉', 42, 0, '0922334035', 'lisa.wang@example.com', '1981-03-15', '789', '123', 3, 4, 1,'2011-11-01'),
('Ryan Liu', 24, 1, '0933445046', 'ryan.liu@example.com', '1999-08-10', 'ryanliu', '123', 1, 1, 2,'2021-01-01'),
('Nana Su', 24, 1, '0933445777', 'nana@example.com', '1999-08-10', 'nana', '123', 1, 1, 2,'2023-06-08'),
('Sophia Huang', 26, 0, '0977880459', 'sophia.huang@example.com', '1997-07-22', 'sophiahuang', '123', 2, 4, 5,'2022-01-01'),
('Chris Lee', 38, 1, '0911223084', 'chris.lee@example.com', '1985-01-18', 'chrislee', '123', 1, 1, 3,'2000-01-11'),
('Olivia Lin', 33, 0, '0922112053', 'olivia.lin@example.com', '1990-06-05', 'olivialin', '123', 1, 2, 3,'2022-01-21'),
('Daniel Yang', 45, 1, '0933223094', 'daniel.yang@example.com', '1978-02-20', 'danielyang', '123', 3, 1, 1,'2022-01-01'),
('Ava Tsai', 22, 0, '0911122134', 'ava.tsai@example.com', '2001-11-05', 'avatsai', '123', 1, 1, 4,'2021-01-01'),
('Jason Huang', 32, 1, '0977882299', 'jason.huang@example.com', '1989-04-15', 'jasonhuang', '123', 1, 2, 1,'2021-01-01'),
('Ella Wang', 29, 0, '0922112563', 'ella.wang@example.com', '1994-07-30', 'ellawang', '123', 1, 4, 3,'2008-07-01'),
('Eric Chen', 25, 1, '0911227544', 'eric.chen@example.com', '1998-10-24', 'ericchen', '123', 1, 2, 5,'2010-01-15'),
('Mia Liu', 42, 0, '0933223584', 'mia.liu@example.com', '1981-01-10', 'mialiu', '123', 1, 1, 4,'2023-01-01'),
('William Chang', 30, 1, '0911562334', 'william.chang@example.com', '1993-06-25', 'williamchang', '123', 2, 1, 1,'2020-05-01'),
('Grace Lin', 27, 0, '0977689555', 'grace.lin@example.com', '1996-02-08', 'gracelin', '123', 3, 4, 2,'2021-01-01'),
('Alex Wu', 37, 1, '0913311556', 'alex.wu@example.com', '1986-09-30', 'alexwu', '123', 1, 2, 3,'2021-01-01'),
('Chloe Huang', 23, 0, '0933256344', 'chloe.huang@example.com', '2000-07-17', 'chloehuang', '123', 1, 1, 5,'2021-01-01'),
('Andrew Liu', 44, 1, '0911223854', 'andrew.liu@example.com', '1979-12-20', 'andrewliu', '123', 2, 1, 4,'2021-01-01'),
('Lily Chen', 30, 0, '0922112543', 'lily.chen@example.com', '1993-09-05', 'lilychen', '123', 1, 1, 1,'2021-01-01'),
('Henry Wang', 26, 1, '0911127734', 'henry.wang@example.com', '1997-04-22', 'henrywang', '123', 3, 2, 2,'2021-01-01'),
('Zoe Lin', 47, 0, '0977666605', 'zoe.lin@example.com', '1976-11-25', 'zoelin', '123', 1, 1, 3,'2021-01-01'),
('Sophia Chen', 29, 0, '0913347896', 'sophia.chen@example.com', '1994-03-11', 'sophiachen', '123', 1, 3, 4,'2021-01-01'),
('Chris Wang', 31, 1, '0933221114', 'chris.wang@example.com', '1992-12-28', 'chriswang', '123', 1, 2, 5,'2021-01-01'),
('Emily Liu', 36, 0, '0911223224', 'emily.liu@example.com', '1987-09-15', 'emilyliu', '123', 1, 1, 1,'2021-01-01'),
('Jason Chen', 24, 1, '0922112783', 'jason.chen@example.com', '1999-05-30', 'jasonchen', '123', 1, 1, 3,'2021-01-01'),
('Olivia Wu', 27, 0, '0977889639', 'olivia.wu@example.com', '1996-08-20', 'oliviawu', '123', 3, 1, 4,'2009-01-21'),
('Henry Lee', 34, 1, '0913341156', 'henry.lee@example.com', '1989-11-03', 'henrylee', '123', 1, 3, 5,'2021-01-01'),
('Sophie Wang', 41, 0, '0933275344', 'sophie.wang@example.com', '1982-10-18', 'sophiewang', '123', 3, 3, 1,'2021-01-01'),
('Benjamin Liu', 25, 1, '0911223621', 'benjamin.liu@example.com', '1998-05-12', 'benjaminliu', '123', 1, 1, 2,'2021-01-01'),
('John Doe', 25, 1, '0912345678', 'john.doe@example.com', '1998-05-15', 'johndoe', '123', 1,1,1,'2021-01-01'),
('Jane Smith', 30, 0, '0987654321', 'jane.smith@example.com', '1991-09-20', 'janesmith', '456', 1,4,2,'2021-01-01'),
('David Lee', 35, 1, '0922334455', 'david.lee@example.com', '1988-12-10', 'davidlee', '789', 2,1,2,'2021-01-01'),
('Sarah Wang', 28, 0, '0933445566', 'sarah.wang@example.com', '1993-06-25', 'sarahwang', 'abc', 3,4,4,'2000-12-31'),
('Michael Chen', 32, 1, '0977888999', 'michael.chen@example.com', '1989-04-05', 'michaelchen', 'xyz', 1,4,3,'2021-01-01');


----------------------------------------------------------------------------------------------------------
--最愛
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (1, N'C_PA_LG_0006', 1)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (2, N'F_CL_LG_0006', 1)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (3, N'F_PA_ST_0004', 1)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (4, N'F_PA_ST_0004', 2)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (5, N'F_CL_LG_0004', 2)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (6, N'F_PA_ST_0005', 3)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (7, N'M_PA_LG_0002', 6)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (8, N'M_CL_ST_0002', 8)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (9, N'M_CL_ST_0002', 5)
--GO
--INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (10, N'M_CL_ST_0002', 51)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (11, N'M_CL_LG_0003', 54)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (17, N'M_PA_ST_0001', 4)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (18, N'F_PA_ST_0008', 4)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (19, N'F_CL_ST_0005', 4)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (20, N'M_PA_ST_0001', 1)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (21, N'M_PA_LG_0002', 1)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (22, N'M_PA_LG_0002', 1)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (23, N'M_PA_LG_0004', 1)
GO
INSERT [dbo].[Favorites] ([Id], [fk_productId], [fk_memberId]) VALUES (24, N'M_PA_ST_0002', 1)
GO
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO

--------------------------------------------------------------------------------
--照片
GO
SET IDENTITY_INSERT [dbo].[MemberImg] ON 
GO
INSERT [dbo].[MemberImg] ([Id], [ImgPath], [fk_memberId]) VALUES (1, N'Tony.jpg', 1)
GO
INSERT [dbo].[MemberImg] ([Id], [ImgPath], [fk_memberId]) VALUES (2, N'Eve.jpg', 2)
GO
INSERT [dbo].[MemberImg] ([Id], [ImgPath], [fk_memberId]) VALUES (3, N'Cindy.jpeg', 3)
GO
INSERT [dbo].[MemberImg] ([Id], [ImgPath], [fk_memberId]) VALUES (4, N'Tina.jpg', 4)
GO
INSERT [dbo].[MemberImg] ([Id], [ImgPath], [fk_memberId]) VALUES (5, N'Tina.jpg', 54)
GO
SET IDENTITY_INSERT [dbo].[MemberImg] OFF
GO


--婉馨******************************************************************************--


SET IDENTITY_INSERT [dbo].[Branches] ON 
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (1, N'新北永和店', N'234新北市永和區文化路7號')
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (2, N'新北板橋店', N'220新北市板橋區文化路一段135號')
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (3, N'桃園中壢店', N'桃園縣中壢市中正路89號1樓')
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (4, N'新竹站前店', N'300新竹市東區中華路二段458號')
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (5, N'新竹竹北店', N'302新竹縣竹北市莊敬北路130號')
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (6, N'台中逢甲店', N'407台中市西屯區西屯路二段272-3號1樓')
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (7, N'台北市府店', N'110台北市信義區松高路11號B2樓')
GO
SET IDENTITY_INSERT [dbo].[Branches] OFF
GO
SET IDENTITY_INSERT [dbo].[SpeakerFields] ON 
GO
INSERT [dbo].[SpeakerFields] ([FieldId], [FieldName]) VALUES (1, N'跑步')
GO
INSERT [dbo].[SpeakerFields] ([FieldId], [FieldName]) VALUES (2, N'健行')
GO
INSERT [dbo].[SpeakerFields] ([FieldId], [FieldName]) VALUES (3, N'登山')
GO
INSERT [dbo].[SpeakerFields] ([FieldId], [FieldName]) VALUES (4, N'自行車')
GO
INSERT [dbo].[SpeakerFields] ([FieldId], [FieldName]) VALUES (5, N'健身訓練')
GO
SET IDENTITY_INSERT [dbo].[SpeakerFields] OFF
GO
SET IDENTITY_INSERT [dbo].[Speakers] ON 
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription], [SpeakerVisible]) VALUES (1, N'Allen', N'0935264777', 1, N'624c8b7fed954efe90faf112d6dd9d7e.jpg', 1, N'跑步專家Allen，擅長帶領跑者進行訓練和技巧分享。', 1)
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription], [SpeakerVisible]) VALUES (2, N'Gary', N'0975641223', 2, N'79f37b044ece43bab417a52f79fa77e9.jpg', 2, N'健行導師Gary，喜歡帶領大家探索自然，並分享健行的益處和技巧。', 1)
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription], [SpeakerVisible]) VALUES (3, N'Betty', N'0986523512', 3, N'2b966759625a4a258e9e71787d00d4b7.jpg', 3, N'登山教練Betty，對於登山路線和技巧有豐富的經驗，喜歡與登山愛好者分享知識。', 1)
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription], [SpeakerVisible]) VALUES (4, N'Vivi', N'0953214147', 4, N'bbf4b1d2db7f467e8a237728416d6801.jpg', 4, N'自行車專家Vivi，熱衷於自行車運動，擅長技術指導和騎行安全注意事項的講解。', 1)
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription], [SpeakerVisible]) VALUES (5, N'Katty', N'0933685421', 5, N'094e2cb2770f484e8d1c7fd204a651d0.jpg', 5, N'健身訓練教練Katty，擁有多年的健身訓練經驗，善於制定個人化的訓練計劃和建議飲食指導。', 1)
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription], [SpeakerVisible]) VALUES (6, N'Steve', N'0937996501', 1, N'a2e52e0f998f41059d28931c7d45ee5f.jpg', 1, N'跑步專家Steve，對於長跑和競賽技巧有豐富的知識，喜歡鼓勵跑者挑戰自己的極限。', 1)
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription], [SpeakerVisible]) VALUES (7, N'Jack', N'0985226553', 2, N'd4e44b59ced346d9940ea82d49b9c6ca.jpg', 2, N'健行導師Jack，經常帶領團隊進行山岳健行和探險活動，並分享山地生態知識。', 1)
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription], [SpeakerVisible]) VALUES (8, N'Sam', N'0988166355', 3, N'bdc7aae41a454fa2aef759e7ca3cd629.jpeg', 3, N'登山教練Sam，擅長攀登技巧和高海拔環境適應，經驗豐富的山岳遠征者。', 1)
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription], [SpeakerVisible]) VALUES (9, N'Teddy', N'0957446325', 4, N'f32d64bb07cc447fb3c99229170ca9b8.jpg', 4, N'自行車專家Teddy，喜歡挑戰極限，對自行車的相關裝備和規則都有豐富的知識。', 1)
GO
SET IDENTITY_INSERT [dbo].[Speakers] OFF
GO
SET IDENTITY_INSERT [dbo].[ActivityCategories] ON 
GO
INSERT [dbo].[ActivityCategories] ([ActivityCategoryId], [ActivityCategoryName]) VALUES (1, N'路跑')
GO
INSERT [dbo].[ActivityCategories] ([ActivityCategoryId], [ActivityCategoryName]) VALUES (2, N'鐵人三項')
GO
INSERT [dbo].[ActivityCategories] ([ActivityCategoryId], [ActivityCategoryName]) VALUES (3, N'自行車')
GO
INSERT [dbo].[ActivityCategories] ([ActivityCategoryId], [ActivityCategoryName]) VALUES (4, N'健行')
GO
INSERT [dbo].[ActivityCategories] ([ActivityCategoryId], [ActivityCategoryName]) VALUES (5, N'登山')
GO
INSERT [dbo].[ActivityCategories] ([ActivityCategoryId], [ActivityCategoryName]) VALUES (6, N'瑜珈')
GO
SET IDENTITY_INSERT [dbo].[ActivityCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[ActivityStatuses] ON 
GO
INSERT [dbo].[ActivityStatuses] ([ActivityStatusId], [ActivityStatusDescription]) VALUES (3, N'已下架')
GO
INSERT [dbo].[ActivityStatuses] ([ActivityStatusId], [ActivityStatusDescription]) VALUES (2, N'已上架')
GO
INSERT [dbo].[ActivityStatuses] ([ActivityStatusId], [ActivityStatusDescription]) VALUES (1, N'待上架')
GO
SET IDENTITY_INSERT [dbo].[ActivityStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Activities] ON 
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (1, N'2023台北歡慶雙十節路跑', 1, CAST(N'2023-10-10T07:00:00.000' AS DateTime), 1, N'臺北市政府市民廣場', CAST(N'2023-08-10T00:00:00.000' AS DateTime), CAST(N'2023-10-10T23:59:59.000' AS DateTime), 7, 600, 700, N'一起在清晨享受健康的路跑活動慶祝台灣的生日吧！', 1)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (2, N'2023新竹馬拉松', 1, CAST(N'2024-02-25T09:30:00.000' AS DateTime), 3, N'竹南寮十七公里海岸線', CAST(N'2023-03-25T00:00:00.000' AS DateTime), CAST(N'2023-11-25T23:59:59.000' AS DateTime), 7, 600, 700, N'邀請您，一起來感受新竹南寮十七公里海岸線的無敵海景。', 3)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (3, N'2023太平山自行車挑戰賽', 3, CAST(N'2023-07-30T08:00:00.000' AS DateTime), 4, N'宜蘭太平山國家森林遊樂區', CAST(N'2023-04-30T10:00:00.000' AS DateTime), CAST(N'2023-06-30T23:59:59.000' AS DateTime), 16, 850, 1000, N'一起騎著自行車遊覽台灣的美景吧！', 3)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (4, N'2023登峰造極之嘉明湖登山體驗', 5, CAST(N'2023-11-19T06:30:00.000' AS DateTime), 7, N'台東向陽森林遊樂區登山口', CAST(N'2023-05-19T00:00:00.000' AS DateTime), CAST(N'2023-09-19T23:59:59.000' AS DateTime), 18, 3300, 3500, N'一睹「?高山藍寶石」、「天使的眼淚」嘉明湖', 2)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (5, N'2023第6屆桃園健行嘉年華', 4, CAST(N'2023-12-10T10:00:00.000' AS DateTime), 9, N'聖德基督教學院', CAST(N'2023-08-10T00:00:00.000' AS DateTime), CAST(N'2023-10-10T00:00:00.000' AS DateTime), 7, 699, 799, N'加入我們，一同參加2023第6屆桃園健行嘉年華！這是一個充滿活力和健康的盛會，旨在鼓勵人們關注身心健康，享受戶外運動的樂趣。在這次活動中，您將有機會體驗桃園美麗的自然風光和豐富的運動活動。', 1)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (6, N'2023Flex第3屆公益路跑活動', 1, CAST(N'2023-10-28T07:00:00.000' AS DateTime), 6, N'台北大稻埕碼頭', CAST(N'2023-07-28T00:00:00.000' AS DateTime), CAST(N'2023-09-17T00:00:00.000' AS DateTime), 10, 500, 600, N'秋天的季節，一起來路跑感受一下碼頭邊的美景，還可以一起參與公益活動喔!!!', 1)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (7, N'2023Flex第2屆公益路跑活動', 1, CAST(N'2023-10-07T08:00:00.000' AS DateTime), 4, N'新竹南寮漁港', CAST(N'2023-05-07T00:00:00.000' AS DateTime), CAST(N'2023-09-30T00:00:00.000' AS DateTime), 10, 600, 700, N'一起來參加我們的夏季路跑吧!!', 3)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (8, N'2023Flex第1屆公益路跑活動', 1, CAST(N'2023-11-17T08:00:00.000' AS DateTime), 7, N'聖德基督學院', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-10-01T00:00:00.000' AS DateTime), 10, 500, 600, N'在冷冷的冬天，一起來路跑熱身，並寒冬送暖給公益團體吧!!', 3)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (9, N'2023太平山秋季自行車挑戰賽', 3, CAST(N'2023-10-01T08:00:00.000' AS DateTime), 8, N'太平山', CAST(N'2023-07-15T00:00:00.000' AS DateTime), CAST(N'2023-09-15T00:00:00.000' AS DateTime), 15, 999, 1100, N'一起來參加我們秋季的太平山自行車挑戰吧!!!', 1)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (10, N'2023太平山冬季自行車挑戰賽', 3, CAST(N'2023-11-27T08:00:00.000' AS DateTime), 9, N'太平山', CAST(N'2023-09-27T00:00:00.000' AS DateTime), CAST(N'2023-11-07T00:00:00.000' AS DateTime), 15, 700, 800, N'冬天就是要和大家一起騎車，熱身熱起來~~', 1)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (11, N'2023太平山夏季自行車挑戰賽', 3, CAST(N'2023-06-20T08:00:00.000' AS DateTime), 3, N'太平山', CAST(N'2023-04-20T00:00:00.000' AS DateTime), CAST(N'2023-06-10T00:00:00.000' AS DateTime), 15, 700, 800, N'一起來趟太平山的自行車挑戰之旅吧!', 3)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (12, N'2023第3屆桃園健行嘉年華', 4, CAST(N'2023-03-19T10:00:00.000' AS DateTime), 5, N'聖德基督學院', CAST(N'2023-01-19T00:00:00.000' AS DateTime), CAST(N'2023-03-10T00:00:00.000' AS DateTime), 7, 500, 600, N'2023年第3屆桃園健行嘉年華隆重登場！旨在促進健康生活和運動文化。我們誠摯邀請您加入我們，一同享受運動的樂趣和社交互動的機會。這個活動將在桃園市舉行，屆時將有各種令人興奮的活動和娛樂節目等待著您。', 3)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (13, N'2023第4屆桃園健行嘉年華', 4, CAST(N'2023-04-23T07:00:00.000' AS DateTime), 7, N'聖德基督學院', CAST(N'2023-02-23T00:00:00.000' AS DateTime), CAST(N'2023-04-13T00:00:00.000' AS DateTime), 7, 399, 500, N'2023年第3屆桃園健行嘉年華即將震撼登場！這是一個非常特別的活動!無論您是運動愛好者、家庭或朋友團體，我們都歡迎您加入我們，一同享受健康運動的樂趣。這個嘉年華將提供各種精彩的活動和表演，讓您度過難忘的時光。', 3)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (14, N'2023第7屆桃園健行嘉年華', 4, CAST(N'2023-12-30T11:00:00.000' AS DateTime), 2, N'聖德基督學院', CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(N'2023-12-10T00:00:00.000' AS DateTime), 10, 500, 600, N'第7屆桃園健行嘉年華即將開幕，為您帶來一場前所未有的健康饗宴！這是一個集合了各種健身運動、休閒娛樂和文化表演的盛大活動。我們邀請您和您的親朋好友一同參與，一起享受動感十足的氛圍和豐富多彩的活動內容。這將是一個讓您身心愉悅的五天，不容錯過！', 1)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (15, N'2023第5屆桃園健行嘉年華', 4, CAST(N'2023-05-27T10:00:00.000' AS DateTime), 1, N'聖德基督學院', CAST(N'2023-03-27T00:00:00.000' AS DateTime), CAST(N'2023-05-20T00:00:00.000' AS DateTime), 10, 399, 500, N'2023年第5屆桃園健行嘉年華即將開幕！這是一個讓您盡情揮灑汗水的活動，旨在鼓勵大眾遵循健康生活方式並享受運動的樂趣。我們誠摯邀請您和您的家人一同參與，感受健康生活的魅力。活動期間將有許多有趣的活動和遊戲等待著您，無論您是健身愛好者還是新手，都能找到適合自己的活動。', 3)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (16, N'2023一日單攻玉山挑戰', 5, CAST(N'2023-10-15T03:00:00.000' AS DateTime), 6, N'玉山登山口', CAST(N'2023-08-15T00:00:00.000' AS DateTime), CAST(N'2023-10-01T00:00:00.000' AS DateTime), 18, 1300, 1500, N'在2023年，我們誠摯邀請您參加一個令人振奮的活動 - 一日單攻玉山挑戰活動！這將是一個難得的機會，讓您有機會攀登台灣最高峰 - 玉山。這個活動將提供您一個刺激和令人難忘的登山經驗，讓您挑戰自我，突破極限。', 1)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (17, N'2023秋季悠遊自行車之旅', 3, CAST(N'2023-10-03T09:00:00.000' AS DateTime), 3, N'台北市自行車步道', CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-09-10T00:00:00.000' AS DateTime), 12, 300, 350, N'2023夏日悠遊自行車之旅歡迎您的加入！這將是一場輕鬆自在的自行車活動，適合所有年齡層的參加者。我們將在台北市的自行車步道上進行一次美麗的自行車之旅，沿途欣賞城市風景和自然美景。不論您是自行車愛好者還是初學者，都能找到適合您的路線。活動期間還將提供美味的午餐和精彩的抽獎活動，讓您度過一個愉快的夏日。歡迎點擊[這裡](https://www.example.com/bikeevent)報名參加！', 2)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (18, N'2023冒險登山挑戰賽', 5, CAST(N'2023-09-20T06:30:00.000' AS DateTime), 4, N'南投合歡山', CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-09-10T00:00:00.000' AS DateTime), 20, 800, 900, N'尋找挑戰和冒險的機會？來參加2023年的冒險登山挑戰賽！這是一場極具挑戰性的登山活動，將帶您登上台灣最美麗的山峰之一 - 合歡山。我們將在清晨出發，攀登陡峭的山徑，挑戰自己的體力極限。活動期間我們將提供專業的登山指導和裝備，確保您的安全。報名參加冒險登山挑戰賽，挑戰自我，征服高山！點擊[這裡](https://www.example.com/mountainchallenge)報名參加！', 1)
GO
SET IDENTITY_INSERT [dbo].[Activities] OFF

SET IDENTITY_INSERT [dbo].[Articles] ON 
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (1, N'路跑', N'<p>	這次的路跑活動對我來說，不僅僅是一次鍛煉身體的機會，更是一次深刻的生活體驗。這項活動不僅讓我挑戰了自己的體能極限，也讓我學到了許多關於堅持、毅力和團隊合作的重要教訓。</p><p>	首先，這場路跑活動對我的身體提出了嚴峻的挑戰起初，我感到有些不知所措，因為這是我第一次參加如此長距離的賽事。但隨著比賽的進行，我漸漸找到了節奏，並且靠著不斷地堅持和努力，成功地完成了整場賽事。這讓我深刻體會到，只要擁有堅定的決心，我們可以戰勝許多看似不可能的事情。</p><p> <img src="https://localhost:7183/Public/Img/run.jpg"></p><p><br></p><p><br></p><p>	其次，路跑活動也教會了我毅力的重要性。在比賽的過程中，有很多時候我感到筋疲力盡，幾乎要放棄。然而，每次當我快要放棄的時候，我都會想起自己參加這場比賽的初衷，以及許多人在賽道旁為我們加油的情景。這樣的思維激勵著我繼續前進，最終克服了疲憊，到達了終點。這次的經驗讓我明白，毅力是克服困難的關鍵，不論在什麼場合都不能輕易放棄。</p><p>	最後，這場路跑活動也讓我更深刻地體會到了團隊合作的力量。儘管路跑是個個人比賽，但在比賽當中，我們彼此支持、互相鼓勵。與其他選手一起奮鬥的感覺是無價的，我們互相激勵著，幫助彼此克服困難。這讓我認識到，團隊合作不僅適用於團隊運動，它在生活的方方面面都具有重要的價值。</p><p>	總的來說，參加這場路跑活動是一次難忘的經歷。它讓我學到了堅持、毅力和團隊合作的重要性，同時也讓我更加珍惜健康和生命。我相信，這次的經驗將對我的未來生活產生積極的影響，我將繼續保持運動的習慣，追求更高的目標。感謝這次的路跑活動，讓我變得更堅強和堅定。</p>', N'突破極限，體驗毅力與團隊合作的路跑之旅', CAST(N'2023-08-26T18:19:55.743' AS DateTime), N'訪客')
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (2, N'瑜珈', N'<p>參加瑜珈活動是一次美妙的心靈之旅，它不僅改變了我的身體，還深刻地觸動了我的內心。我想分享一下我參加瑜珈活動後的心得體會。</p><p><img src="https://localhost:7183/Public/Img/yoga.png"></p><p>首先，瑜珈讓我重新認識了自己的身體。在每一節課中，我們學習如何聆聽自己的身體，注意呼吸，並培養身體的靈敏度。這種專注和覺察幫助我更好地理解身體的需求，並學會緊張的部位如何釋放。這不僅有助於改善我的體姿和柔軟度，還有助於減輕壓力和疼痛。</p><p>其次，瑜珈讓我找到了內心的平靜。每當我踏上瑜珈墊，我感到緊張和煩惱都漸漸消散，被一種平靜和內在的寧靜所包圍。瑜珈不僅是一種身體的鍛煉，更是一種冥想和心靈的修行。這種冥想幫助我放下焦慮，提高自我意識，並增強心靈的平衡。</p><p>另外，瑜珈也教會了我接受自己。在瑜珈課程中，沒有競爭，沒有評判，只有自愛和尊重。我學會了不要強迫自己達到完美，而是要接受自己的局限性，這種接受使我更加自信和快樂。瑜珈教導我們關愛自己，這是我們經常在生活中忽略的事情。</p><p>最重要的是，瑜珈讓我感受到連接與共鳴。在一個瑜珈課堂中，我們彼此共鳴，共同在冥想和呼吸的共振中建立了一種特殊的聯繫。這種聯繫超越了言語和身體，讓我感受到了一種共同的存在感，一種連接自己與宇宙的感覺。</p><p>總的來說，參加瑜珈活動是一次深刻的心靈之旅。它幫助我找到身體和心靈的平衡，提高了自我意識，並教導了我更多愛和接受。我深信，瑜珈對我的生活產生了深遠的影響，它已經成為我每天都期待的一部分，帶來了內在的平靜和啟發。我鼓勵每個人都嘗試一下瑜珈，體驗這個美麗的旅程。</p>', N'瑜珈之旅：身體、心靈和靈魂的啟發', CAST(N'2023-08-21T10:51:49.733' AS DateTime), N'訪客')
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (3, N'健行', N'<p>健走是一種簡單而容易實行的運動方式，它無需特殊的器材或場地，只需一雙合適的運動鞋，你就可以開始享受它的好處。以下是一些有關健走的好處以及如何將它納入日常生活的建議。</p><p><span style="color: var(--tw-prose-bold);">身體健康的好處：</span></p><ol><li><span style="color: var(--tw-prose-bold);">促進心臟健康：</span> 健走是有氧運動的一種，有助於提高心臟功能和血液循環。這有助於降低心臟病和高血壓的風險。</li><li><span style="color: var(--tw-prose-bold);">控制體重：</span> 健走可以幫助你燃燒卡路里，有助於控制體重，減少體脂，以及塑造身材。</li><li><span style="color: var(--tw-prose-bold);">改善關節健康：</span> 健走是一種低衝擊的運動，對關節的負擔較小，有助於減少風險，尤其是對於膝蓋和髖關節的損傷。</li><li><span style="color: var(--tw-prose-bold);">提高新陳代謝：</span> 健走可以提高代謝率，促進身體更有效地消耗能量，有助於保持健康的體重。</li></ol><p><span style="color: var(--tw-prose-bold);">心理健康的好處：</span></p><ol><li><span style="color: var(--tw-prose-bold);">減壓和焦慮：</span> 散步在自然環境中，如公園或森林中，可以幫助紓解壓力，減少焦慮感，提高情緒穩定性。</li><li><span style="color: var(--tw-prose-bold);">改善睡眠質量：</span> 健走有助於提高睡眠質量，讓你更容易入睡並保持深度睡眠。</li><li><span style="color: var(--tw-prose-bold);">增強心理清晰度：</span> 散步提供了一個思考和冥想的機會，有助於解決問題，提高創造力，並增強心智清晰度。</li></ol><p><span style="color: var(--tw-prose-bold);">如何納入日常生活：</span></p><ol><li><span style="color: var(--tw-prose-bold);">設定目標：</span> 設定每天步行的目標，逐漸增加步行的時間和距離。</li><li><span style="color: var(--tw-prose-bold);">尋找伴侶：</span> 與朋友或家人一起散步，這不僅可以增加樂趣，還能提供互相激勵。</li><li><span style="color: var(--tw-prose-bold);">利用工作時間：</span> 如果可能，嘗試在工作休息時間或午休時散步，這能提高精力和工作效率。</li><li><span style="color: var(--tw-prose-bold);">享受大自然：</span> 選擇在公園、海灘或山區散步，讓自然的美景充實你的健走體驗。</li></ol><p><img src="https://localhost:7183/Public/Img/walking.jpg"></p><p>總的來說，健走是一種容易實行且充滿好處的運動方式。它不僅有助於保持身體健康，還有助於改善心理健康，是一種可以輕鬆融入忙碌日常生活的選擇。無論是在早晨迎接新的一天，還是在傍晚放鬆心情，健走都是一個值得嘗試的健康習慣。</p>', N'健走：輕鬆愉悅的運動', CAST(N'2023-08-23T12:01:00.127' AS DateTime), N'訪客')
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (4, N'登山', N'<p>登山是一種古老的活動，隨著現代社會的壓力不斷增加，它已經變得越來越受歡迎。除了提供令人驚嘆的自然景色，登山還有許多身心健康的好處。在這篇文章中，我們將探討登山所帶來的幾個關鍵好處。</p><p><span style="color: var(--tw-prose-bold);">1. 強化身體</span></p><p>登山是一種全身性的運動，它需要你使用腿部、核心、手臂和肺部，以應對不同地形的挑戰。這種全身性的活動可以增強肌肉、提高心臟健康，並增強體力。長時間的登山也有助於提高耐力，讓你在日常生活中更有精力。</p><p><span style="color: var(--tw-prose-bold);">2. 減壓和心理健康</span></p><p>登山帶你遠離城市的喧囂，讓你沉浸在大自然的寧靜中。這種環境可以幫助減輕壓力、焦慮和抑郁。研究表明，大自然中的時間可以提高情緒穩定性，改善注意力和心理健康。</p><p><span style="color: var(--tw-prose-bold);">3. 培養專注力</span></p><p>登山需要專注力，因為你必須在不斷變化的地形中保持警覺，以確保安全。這種專注力的培養有助於提高問題解決能力和決策能力，這些技能在生活的其他領域也同樣重要。</p><p><span style="color: var(--tw-prose-bold);">4. 社交機會</span></p><p>登山通常是一項團隊活動，你可以和朋友、家人或新認識的人一起參加。這提供了一個良好的社交機會，可以建立深厚的關係，共同克服困難，並分享美麗的經歷。</p><p><span style="color: var(--tw-prose-bold);">5. 探索未知</span></p><p>每次登山都是一次探險，你不知道會遇到什麼。這種不確定性可以增加刺激感，激發好奇心，激勵你去探索新的地方和挑戰。</p><p><span style="color: var(--tw-prose-bold);">6. 環境意識</span></p><p>登山者通常對環境保護充滿意識。他們體驗到大自然的美麗，也見證了環境問題的現實。這使他們更加關心環境，並可能促使他們採取更環保的生活方式。</p><p>總之，登山是一種有益身心的活動，提供了身體鍛煉、心理健康、社交互動和大自然之美的完美結合。無論是初學者還是有經驗的登山者，都可以在登山中找到滿足感和幸福感。所以，如果你想要優雅地融入大自然，同時提升自己的身體和心靈，不妨嘗試一下登山這個令人著迷的活動。</p>', N'登山：自然與健康的完美結合', CAST(N'2023-09-27T15:53:55.750' AS DateTime), N'David Wu')
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (21, N'自行車', N'<p>自行車活動一直以來都是我生活中的一大樂趣，它不僅讓我享受到健康的運動，還讓我有機會探索自然之美，與友人建立深厚的友誼。在這篇文章中，我將分享我參加自行車活動的體驗心得，並推薦這個令人愉悅的活動。</p><p>自行車活動的樂趣不僅僅體現在運動的過程中，還包括了籌備的過程。我們通常會在活動前幾天檢查我們的自行車，確保它處於最佳狀態，以應對各種路況。這個過程讓我們更加了解自己的自行車，也增加了對活動的期待。</p><p>參加自行車活動的最大魅力之一就是可以欣賞到大自然的美景。無論是穿越郊野小徑還是在山區公路上騎行，都可以讓你感受到大自然的壯麗和寧靜。我曾參加過一次山地自行車活動，沿途可以看到壯麗的山脈、清澈的湖泊和茂密的樹林。這樣的美景讓我感到讚嘆不已，也讓我更加熱愛自行車活動。</p><p>此外，自行車活動也是建立友誼的絕佳機會。在活動中，你會遇到來自不同地方的自行車愛好者，大家共同享受著運動的樂趣，往往會建立深厚的友誼。我曾經和一群自行車愛好者參加了一個長途騎行活動，我們相互支持，一起克服了許多挑戰，最終成功完成了活動。這段經歷不僅讓我認識了新朋友，還增強了我們之間的情誼。</p><p>自行車活動也是一個激勵人心的挑戰。無論你是初學者還是資深自行車手，都可以找到合適自己的活動。挑戰自己體力極限的長途騎行、賽車比賽，或者是輕鬆自在的家庭自行車遊，都是不同難度和目標的活動，讓你可以不斷提高自己的技能和體力。</p><p><img src="https://localhost:7183/Public/Img/09bcc53b-7603-4137-b81d-b52896b9dc5d_電動輔助自行車法規.jpg"></p><p>總之，參加自行車活動是一種令人愉悅的體驗，它結合了運動、大自然的美景、友誼和挑戰。無論你是新手還是老手，都可以找到適合自己的活動。我強烈推薦大家嘗試參加自行車活動，體驗一下風馳電掣的樂趣，相信你也會愛上這個活動，享受到無盡的樂趣和滿足感。</p>', N'風馳電掣，自行車活動的無限樂趣', CAST(N'2023-08-27T21:24:03.027' AS DateTime), N'David Wu')
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (22, N'路跑', N'<p><img src="https://localhost:7183/Public/Img/4aab12f3-4179-413e-8934-9a22394bff21_下載.jpg"></p><p><br></p><p>路跑，對於許多人來說，不僅僅是一種運動，更是一種生活方式，一種超越自己極限的挑戰，以及一種享受大自然和城市景觀的方式。在這篇文章中，我將分享我的路跑體驗心得，並推薦這個充滿樂趣和挑戰的運動。</p><p>首先，路跑讓我體驗到了運動的愉悅。每當我穿上<strong style="color: rgb(0, 138, 0);">在Flex購買的運動鞋</strong>，踏上運動場地，我就感到一種無比的自由和活力。在路上奔跑的時候，我可以忘記一切煩惱，專注於腳步聲和呼吸的節奏，這種感覺讓我倍感愉悅。而且，路跑可以隨時隨地進行，無需特殊場地或設備，這使它成為一種非常方便的運動方式。</p><p>其次，路跑讓我有機會探索城市和大自然的美景。無論是沿著城市街道奔跑，還是穿越鄉間小徑，路跑都讓我有機會欣賞到不同地方的風景。我曾經在早晨的陽光下沿著海灘跑步，也曾在山區的森林中感受大自然的寧靜。每個路跑路線都帶來不同的視覺和心靈享受，這是其他運動難以比擬的。</p><p>此外，路跑也是一種挑戰，是對自己極限的不斷探索。我們可以設定不同的目標，如提高速度、增加距離，或參加馬拉松比賽等。這些挑戰不僅鍛煉身體，還磨練意志力。我曾參加過一次半程馬拉松比賽，那種跑到快筋疲力盡的感覺，然後突破極限的成就感，是無與倫比的。路跑教會了我堅持不懈，無論是在運動中還是生活中。</p><p>總之，路跑是一種充滿樂趣、挑戰和自由的運動方式。它讓我們能夠享受運動的快樂，欣賞大自然和城市景觀，並挑戰自己的極限。如果你正在尋找一種新的運動方式，或者只是想享受跑步的樂趣，我強烈推薦嘗試一下路跑。<em style="background-color: rgb(250, 204, 204);">它將帶給你無盡的滿足感和健康的生活方式。</em></p><p>                                                             <img src="https://localhost:7183/Public/Img/9c6f7cd5-0241-49ac-8f3d-d7b2ba347988_5-2.jpg"></p>', N'奔向無盡的路跑之樂', CAST(N'2023-07-25T21:27:04.960' AS DateTime), N'David Wu')
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (23, N'健行', N'<h3>健行，是一種深入大自然的方式，它讓我們遠離城市的喧囂，沉浸在山林湖水之中，享受大自然的寧靜和美麗。在這篇文章中，我將分享我的健行體驗心得，並推薦這個讓身心得到平靜的活動。</h3><p><br></p><p><img src="https://localhost:7183/Public/Img/4320cf92-24e4-453e-aea6-27af36dbea53_w_1110904a1-2.jpg"></p><p>首先，健行讓我們有機會重拾對大自然的熱愛。生活在現代城市中，我們往往被高樓大廈、交通噪音和日常瑣事所包圍，容易忘記了自然界的美麗。然而，當我們走進山林、草原或湖泊的領域時，我們可以感受到大自然的魔力。清新的空氣、鳥兒的歌唱、湖水的倒影，都讓我們重新與自然相連，這種感覺無價。</p><p>其次，健行是一種身心健康的活動。走在山徑或登上高山，不僅可以鍛煉我們的身體，還可以清空我們的心靈。與跑步等高強度運動不同，健行是一種較緩慢的運動，讓我們可以更好地感受四季更替、風吹草動。這種放鬆的活動可以幫助我們紓解壓力，提高幸福感。</p><p>此外，健行也是一個社交的機會。許多人熱愛與家人、朋友或健行團隊一起健行。這種團隊活動不僅可以增進人際關係，還可以共同探索未知的地方。我曾和一群朋友一起在山區健行，我們互相扶持，分享食物，度過了一個難忘的週末。這樣的經歷為我們建立了深厚的友誼。</p><p>總之，健行是一種帶來平靜和愉悅的活動。它讓我們回歸自然，保持身心健康，並與他人建立更深的聯繫。如果你渴望一個能夠讓你遠離城市繁囂，深入大自然，並充電身心的方式，那麼健行絕對值得一試。走出門，迎接大自然，你會發現這是一場美麗的冒險，每一步都是一種幸福。</p><p><br></p><p><span style="color: rgb(153, 51, 255);">我就是參加了FLEX舉辦的健行活動覺得特別讚，推薦給大家</span>：<a href="https://localhost:8080/activityInfo/14" rel="noopener noreferrer" target="_blank">https://localhost:8080/activityInfo/14</a></p>', N'大自然的寧靜之旅——健行的美妙體驗', CAST(N'2023-08-27T21:29:51.430' AS DateTime), N'David Wu')
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (24, N'瑜珈', N'<p>瑜珈，是一門千年的學問，它不僅可以幫助我們保持身體的柔軟和力量，還可以平靜我們的心靈，引導我們走向身心靈的和諧。在這篇文章中，我將分享我的瑜珈體驗心得，並強烈推薦這個讓身心靈得到平衡的寶貴活動。</p><p>首先，瑜珈是一個全面的身體運動。它包括了各種體式（瑜珈演練）和呼吸練習，可以幫助我們增強肌肉、改善體姿，提高柔軟度。瑜珈練習不需要特殊的器械，只需要一塊瑜珈墊和專注的心靈。不論你是初學者還是有瑜珈經驗者，都可以找到適合自己的練習。</p><p>其次，瑜珈有助於減輕壓力，提高心理健康。在現代社會，壓力和焦慮是常見的問題。瑜珈的深呼吸和冥想練習可以幫助我們冷靜下來，集中注意力，擺脫內心的紛擾。我曾經在一個瑜珈課上體驗到深度的冥想，那一刻我感到內心平靜，所有的擔憂都消失了。這種平靜感在日常生活中也能體驗到，讓我處事更加冷靜和自信。</p><p>此外，瑜珈也是一個自我探索的過程。透過持續的練習，我們可以更深入地了解自己的身體和心靈。我們可以發現自己的身體不僅是一個物理實體，還承載著情感和思想。這種自我認識有助於我們更好地應對生活中的挑戰，並找到內在的平衡。</p><p>總之，瑜珈是一門令人沉浸其中且難以估量價值的活動。它結合了身體的力量和柔軟度，心靈的寧靜和自我探索的奇妙之旅。如果你渴望找到一個可以改善身體健康、減輕壓力並提高內在平靜的方式，那麼瑜珈是絕對值得一試的。它不僅是一個運動，更是一種生活方式，一個讓你實現身心靈和諧的旅程。</p><p><img src="https://localhost:7183/Public/Img/55d8e03f-4a48-4e5a-b271-e79555ea0ebb_5ac72b158eb88.jpg"></p>', N'身心靈的和諧之旅——瑜珈的靈感體驗', CAST(N'2023-08-09T21:31:20.043' AS DateTime), N'David Wu')
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (25, N'登山', N'<p><img src="https://localhost:7183/Public/Img/86bc989c-6907-4fb3-b36b-d4ef087426bf_11193-2.jpeg"></p><p>登山，是一種極具挑戰性的戶外活動，也是一種讓人與自然相連、超越極限的冒險之旅。在這篇文章中，我將分享我的登山體驗心得，並強烈推薦這個能夠帶給你挑戰和驚喜的活動。</p><p>首先，登山讓我們走出舒適區，挑戰自己的極限。登山並非輕鬆的活動，它需要身體的力量、耐力和技巧。當你攀爬陡峭的山坡，跨越冰川或穿越茂密的森林時，你會不斷地克服自己的不安和疲憊。然而，當你站在山頂，俯瞰著壯觀的風景，你會深刻體驗到挑戰的價值，以及自己克服困難的能力。</p><p>其次，登山讓我們與大自然建立更深的聯繫。當我們穿越山區、過河和越過峽谷時，我們身臨其境地體驗著大自然的壯觀和神秘。登山的過程中，我們學會了尊重自然，領悟到人類和自然界之間的聯繫。這種聯繫讓我們更珍惜地球，更關心環保議題。</p><p>此外，登山也是一種社交的機會。許多登山者都喜歡與朋友或登山隊伍一起登山。在攀爬的過程中，我們分享著困難和喜悅，建立了深厚的友誼。我曾和一群志同道合的登山者攀登一座高峰，那段經歷不僅讓我們成為朋友，還加深了我們的信任和合作。</p><p>總之，登山是一種富有挑戰性、奇妙且充滿驚喜的活動。它讓我們挑戰自己、與自然相連，並建立深厚的友誼。如果你渴望一個能夠帶給你成就感、自然體驗和社交互動的戶外活動，那麼登山絕對值得一試。它不僅是一個探索未知的旅程，還是一個讓你成為更好版本的自己的機會。</p>', N'攀登巔峰——登山的挑戰與奇妙', CAST(N'2023-08-07T21:34:10.120' AS DateTime), N'Tony Chen')
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (26, N'自行車', N'<p>自行車，一直以來都是我熱愛的運動之一，而參加了<span style="color: rgb(255, 153, 0);">Flex舉辦的自行車活動</span>後，我深深體會到了這項運動的魅力。在這篇文章中，我將分享我的參加Flex自行車活動的心得體驗，並熱烈推薦這個充滿活力和樂趣的體驗。</p><p><br></p><p><img src="https://localhost:7183/Public/Img/72695aed-2f43-47c7-9254-a161a68620d4_1024x768.jpg"></p><p>Flex自行車活動不僅僅是一場自行車賽事，更是一個融合運動、社交和娛樂的盛大節日。參加者們來自不同地方，擁有不同程度的自行車技巧，但我們都有一個共同的目標——享受騎行的樂趣。活動現場充滿了歡笑、交流和友誼，讓我感到自行車運動的大家庭是如此溫馨和包容。</p><p>一個特別吸引我的地方是Flex提供的專業支援和設施。他們為參加者提供了完善的安全保障，包括醫療隊伍、緊急救援措施以及清涼站點。這種關懷讓我們可以專注於自行車騎行，不用擔心安全問題。此外，活動還提供了各種不同難度的賽道，從初學者到資深騎士都能找到適合自己的挑戰。</p><p>自行車活動的亮點之一是沿途的風景和路線設計。Flex精心挑選的路線環繞著美麗的自然風景和迷人的城市景觀。我曾經參加過一次Flex自行車活動，沿著海岸線騎行，可以欣賞到無敵海景，感受到海風的撫慰，這是一種難以忘懷的體驗。不僅如此，Flex活動還為參加者提供了機會參觀當地的文化和風土人情，讓我們更深入地了解所在地的特色。</p><p>最重要的是，Flex自行車活動讓我們與品牌建立更深的聯繫。他們不僅提供了高品質的運動裝備，還為運動愛好者提供了一個互動和交流的平台。參加這個活動，我不僅可以騎行，還可以穿著他們最新最炫的自行車服裝和鞋子，這是一個了解他們產品的絕佳機會。</p><p>想要購買的人可以參考這裡，剛好最近還有特價~他們的服飾真的超棒!：<a href="https://localhost:8080/onSale" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 102, 204);">Flex服飾</a></p><p>總之，參加Flex自行車活動是一個令人興奮的體驗，它將自行車運動、社交互動和風景探索結合在一起。無論你是自行車愛好者還是初學者，這個活動都將帶給你難忘的回憶和滿足感。我強烈推薦每個喜歡自行車的人都參加一次Flex自行車活動，享受這個充滿活力的自行車之旅。</p><p>最近也有報名中的自行車活動~推推大家<a href="https://localhost:8080/activityInfo/10" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 102, 204);">Flex自行車活動</a></p>', N'自行車極速之旅——Flex活動的精彩體驗', CAST(N'2023-07-17T21:38:47.310' AS DateTime), N'Tony Chen')
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (27, N'路跑', N'<p>Flex，作為一個以運動裝備聞名的品牌，不僅為運動愛好者提供高品質的裝備，還舉辦了令人期待的路跑活動，為我們提供了一個挑戰極限、展現自我的機會。在這篇文章中，我將分享我參加Flex路跑活動的體驗，並強烈推薦這個充滿激情和動力的活動。</p><p>附上當天參加的精彩照片~</p><p><img src="https://localhost:7183/Public/Img/2d4e43fb-f3bb-4532-ac00-8e59e71df414_4318155_1.jpg"></p><p><strong style="background-color: rgb(235, 214, 255);">Flex路跑活動</strong>不僅僅是一場比賽，更是一個運動愛好者的盛會。參加者來自不同地方，年齡層次各異，但我們都有一個共同的目標——完成賽程，展現自己的實力。活動現場充滿了興奮和挑戰，讓我感到自己是一個屬於這個大家庭的一部分。</p><p>一個令人印象深刻的地方是Flex提供的專業支援和裝備。他們不僅提供高性能的運動服飾，還設有裝備試穿區，讓參加者可以在活動前嘗試最新的跑鞋和運動衣。我記得在一次活動中，我試穿了Flex的特製跑鞋，它們輕巧且舒適，讓我在比賽中表現出色。你可以點擊<a href="https://localhost:8080/men?categoryName=%E9%9E%8B%E5%AD%90&amp;subCategoryName=%E9%81%8B%E5%8B%95%E9%9E%8B" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 138, 0);">連結</a>了解更多Flex的運動鞋款。</p><p>此外，Flex路跑活動的路線設計也是一大亮點。他們選擇了風景優美的路線，讓我們可以在比賽中欣賞到壯觀的風景。我參加的一次活動穿越了森林、河流和山丘，這些景色讓我完全忘記了疲憊，全身心投入到比賽中。</p><p>最重要的是，Flex提供了方便的活動報名，你可以點擊<a href="https://localhost:8080/ActivityIndex" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 138, 0);">連結</a>報名參加即將舉辦的活動。不僅可以參與一場挑戰，還有機會展示Flex最新的運動裝備。這個報名連結將帶領你進入一個令人興奮的運動世界。</p><p>總之，參加Flex路跑活動是一個令人難以忘懷的體驗，它結合了挑戰、自我超越和高品質的運動裝備。如果你是一個運動愛好者，或者想要挑戰自己極限的人，我強烈推薦參加Flex路跑活動。這將是一個充滿動力和激情的旅程，讓你展現最好的自己。</p>', N'挑戰極限，展現自我——參加Flex路跑活動', CAST(N'2023-07-13T21:43:19.867' AS DateTime), N'Tony Chen')
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (28, N'路跑', N'<p>Flex，作為一個運動裝備的知名品牌，不僅關心運動者的需求，還舉辦了多場刺激又有趣的路跑活動，這為運動愛好者提供了一個獨一無二的機會，可以挑戰極速、感受風的速度。在這篇文章中，我將分享我參加Flex路跑活動的心得，以及對Flex服飾的推薦。</p><p>Flex路跑活動不僅是一場比賽，更是一場極速之旅。參加者們都追求速度和挑戰自己的極限。無論你是初學者還是賽道老手，這個活動都有不同難度的賽程，讓你可以根據自己的實力選擇挑戰。參加活動的人來自不同背景，但大家都有一個共同的目標——在賽道上追風逐浪。</p><p>一個令我印象深刻的地方是Flex提供的運動服飾。他們的運動衣、褲子和鞋子不僅時尚，還具有出色的性能。在我參加的一次活動中，我穿著Flex的特製跑鞋，它們輕巧舒適，提供了極佳的支撐和抓地力。這讓我在比賽中感到更加自信，並取得了出色的成績。超推薦大家來去客製化一雙的~<a href="https://localhost:8080/CustomeShoes" rel="noopener noreferrer" target="_blank" style="color: rgb(230, 0, 0);">https://localhost:8080/CustomeShoes</a></p><p><span style="color: rgb(230, 0, 0);"><span class="ql-cursor">﻿</span></span><img src="https://localhost:7183/Public/Img/1b4073dc-35a2-4a7a-a1fc-9df30a4fc56b_5987ff433ee9a.jpg"></p>', N'追風逐浪——Flex路跑活動中的極速體驗', CAST(N'2023-08-15T21:45:25.767' AS DateTime), N'訪客')
GO
INSERT [dbo].[Articles] ([Id], [Category], [Content], [Title], [PublishTime], [Author]) VALUES (29, N'自行車', N'<p><strong style="color: rgb(153, 51, 255);">Flex，作為一個以運動電商品牌而聞名的網站</strong>，不僅提供高品質的運動裝備，還舉辦了引人入勝的電動自行車活動，這讓我們有機會體驗自行車運動的全新潮流。在這篇文章中，我將分享我參加Flex電動自行車活動的體驗，並推薦這個充滿科技和刺激的運動。</p><p><br></p><p>Flex電動自行車活動不僅僅是一場比賽，更是一個展示高科技自行車魅力的機會。參加者們都擁有各式各樣的電動自行車，從山地車到城市車，樣樣俱全。這個活動充分體現了電動自行車的多樣性和便利性，無論你是想要挑戰山區道路還是在城市環境中穿梭，都可以找到適合自己的賽程。</p><p>一個特別吸引我的地方是Flex提供的專業支援和裝備。他們為參加者提供了完善的安全保障，包括醫療隊伍、緊急救援措施以及清涼站點。這種關懷讓我們可以專注於自行車騎行，不用擔心安全問題。另外，Flex的運動服飾也是一大亮點，它們不僅時尚，還具有高度的透氣性和舒適性。你可以從<a href="https://localhost:8080/men" rel="noopener noreferrer" target="_blank" style="color: rgb(230, 0, 0);">Flex服飾</a>了解更多Flex的運動服飾。</p><p>活動的路線設計也是令人驚豔的。Flex挑選了風景優美的路線，穿越山林、湖泊和城市景觀，讓我們可以在比賽中欣賞到多樣的風景。我參加的一次活動讓我體驗到電動自行車的優勢，輕鬆應對陡峭的山路和長途的穿越，同時享受著大自然的美景。</p><p>最重要的是，Flex提供了方便的活動報名，你可以從這裡-<a href="https://localhost:8080/activityInfo/10" rel="noopener noreferrer" target="_blank" style="color: rgb(230, 0, 0);">Flex活動</a>報名參加即將舉辦的電動自行車活動。無論你是電動自行車的愛好者還是新手，這個活動都將帶給你一個充滿科技和刺激的運動體驗。</p><p><img src="https://localhost:7183/Public/Img/fc4627ac-5ad5-408d-9f0c-7cdb2e42b92f_1100530c5.jpg"></p><p>總之，參加Flex電動自行車活動是一個令人興奮的體驗，它結合了科技、刺激和高品質的運動裝備。如果你渴望體驗電動自行車的新潮流，我強烈推薦參加Flex電動自行車活動。這將是一個充滿動力和科技感的自行車之旅，讓你感受到未來運動的魅力。</p>', N'自行車新潮——參加Flex電動自行車活動的體驗', CAST(N'2023-07-31T21:55:19.107' AS DateTime), N'Mia Liu')
GO
SET IDENTITY_INSERT [dbo].[Articles] OFF

GO
SET IDENTITY_INSERT [dbo].[ActivityImg] ON 
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (1, 2, N'2023新竹馬拉松.png')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (2, 3, N'2023太平山自行車挑戰賽.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (3, 4, N'2023登峰造極之嘉明湖登山體驗.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (4, 5, N'2023第6屆桃園健行嘉年華.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (5, 6, N'2023Flex第3屆公益路跑活動.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (6, 7, N'2023Flex第2屆公益路跑活動.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (7, 8, N'2023Flex第1屆公益路跑活動.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (8, 9, N'2023太平山秋季自行車挑戰賽.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (9, 10, N'2023太平山冬季自行車挑戰賽.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (10, 11, N'2023太平山夏季自行車挑戰賽jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (11, 12, N'2023第3屆桃園健行嘉年華.png')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (12, 13, N'2023第4屆桃園健行嘉年華.png')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (13, 14, N'2023第7屆桃園健行嘉年華.png')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (14, 15, N'2023第5屆桃園健行嘉年華.png')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (15, 16, N'2023一日單攻玉山挑戰.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (16, 2, N'D:\期中專題 Flex\FLEX活動照片\活動照片\2023新竹馬拉松.png')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (17, 3, N'D:\期中專題 Flex\FLEX活動照片\活動照片\2023太平山自行車挑戰賽.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (18, 4, N'D:\期中專題 Flex\FLEX活動照片\活動照片\2023登峰造極之嘉明湖登山體驗.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (19, 5, N'D:\期中專題 Flex\FLEX活動照片\活動照片\2023第6屆桃園健行嘉年華.png')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (20, 6, N'51b361a98e2e427eafbf8b055d16c6ab.png')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (21, 7, N'de2bb592a3554e10a43a3282e962a2c8.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (22, 8, N'702da3f2703e4f88995d3898069b7dc9.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (23, 9, N'8d3af39a91854ec190537ffa32ae4629.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (24, 10, N'2023太平山冬季自行車挑戰賽2.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (25, 11, N'2023太平山夏季自行車挑戰賽2.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (26, 12, N'2023第3屆桃園健行嘉年華2.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (27, 13, N'34bd7c8fcfbb4249bb297310762bfe6f.png')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (28, 14, N'ac51784414c6488fbcac01003caaac81.png')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (29, 15, N'85549ba52279478b81e71e66aa2e0ce3.png')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (30, 16, N'b44059ab21584d1e88ca49261687aebe.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (31, 17, N'2023秋季悠遊自行車之旅.jpg')
GO
INSERT [dbo].[ActivityImg] ([Id], [fk_ActivityId], [ImgPath]) VALUES (32, 18, N'2023冒險登山挑戰賽.jpg')
GO
SET IDENTITY_INSERT [dbo].[ActivityImg] OFF
GO
INSERT [dbo].[ReservationStatuses] ([ReservationId], [ReservationStatusDescription]) VALUES (1, N'已完成')
GO
INSERT [dbo].[ReservationStatuses] ([ReservationId], [ReservationStatusDescription]) VALUES (0, N'未完成')
GO
SET IDENTITY_INSERT [dbo].[OneToOneReservations] ON 
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (1, 1, CAST(N'2023-06-21T09:00:00.000' AS DateTime), CAST(N'2023-06-21T11:00:00.000' AS DateTime), 1, 1, 0, CAST(N'2023-07-08T14:22:22.490' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (2, 2, CAST(N'2023-06-22T14:00:00.000' AS DateTime), CAST(N'2023-06-22T16:00:00.000' AS DateTime), 3, 3, 1, CAST(N'2023-07-08T14:22:22.490' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (3, 3, CAST(N'2023-06-23T11:00:00.000' AS DateTime), CAST(N'2023-06-23T13:00:00.000' AS DateTime), 2, 2, 1, CAST(N'2023-07-08T14:22:22.490' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (4, 4, CAST(N'2023-06-24T16:00:00.000' AS DateTime), CAST(N'2023-06-24T18:00:00.000' AS DateTime), 5, 5, 0, CAST(N'2023-07-08T14:22:22.490' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (5, 5, CAST(N'2023-06-25T13:00:00.000' AS DateTime), CAST(N'2023-06-25T14:00:00.000' AS DateTime), 4, 4, 0, CAST(N'2023-07-08T14:22:22.490' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (6, 3, CAST(N'2023-06-26T10:00:00.000' AS DateTime), CAST(N'2023-06-26T12:00:00.000' AS DateTime), 1, 6, 1, CAST(N'2023-07-08T14:22:22.490' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (7, 2, CAST(N'2023-06-27T15:00:00.000' AS DateTime), CAST(N'2023-06-27T17:00:00.000' AS DateTime), 1, 1, 0, CAST(N'2023-07-08T14:22:22.490' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (8, 1, CAST(N'2023-06-28T13:00:00.000' AS DateTime), CAST(N'2023-06-28T15:00:00.000' AS DateTime), 3, 3, 1, CAST(N'2023-07-08T14:22:22.490' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (9, 5, CAST(N'2023-06-29T12:00:00.000' AS DateTime), CAST(N'2023-06-29T14:00:00.000' AS DateTime), 2, 2, 1, CAST(N'2023-07-08T14:22:22.490' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (10, 4, CAST(N'2023-06-30T17:00:00.000' AS DateTime), CAST(N'2023-06-30T19:00:00.000' AS DateTime), 2, 7, 0, CAST(N'2023-07-08T14:22:22.490' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (11, 3, CAST(N'2023-08-31T13:00:00.000' AS DateTime), CAST(N'2023-08-31T15:00:00.000' AS DateTime), 1, 1, 0, CAST(N'2023-08-26T02:06:39.350' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (12, 3, CAST(N'2023-09-05T11:00:00.000' AS DateTime), CAST(N'2023-09-05T13:00:00.000' AS DateTime), 1, 1, 0, CAST(N'2023-08-26T16:20:49.547' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (13, 13, CAST(N'2023-09-02T17:00:00.000' AS DateTime), CAST(N'2023-09-02T19:00:00.000' AS DateTime), 2, 2, 0, CAST(N'2023-08-27T22:42:21.920' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (14, 13, CAST(N'2023-09-08T13:00:00.000' AS DateTime), CAST(N'2023-09-08T15:00:00.000' AS DateTime), 1, 1, 0, CAST(N'2023-08-27T22:45:41.867' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (15, 13, CAST(N'2023-09-13T11:00:00.000' AS DateTime), CAST(N'2023-09-13T13:00:00.000' AS DateTime), 3, 3, 0, CAST(N'2023-08-27T22:45:58.627' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (16, 13, CAST(N'2023-09-07T12:00:00.000' AS DateTime), CAST(N'2023-09-07T14:00:00.000' AS DateTime), 2, 7, 0, CAST(N'2023-08-27T22:47:27.347' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (17, 3, CAST(N'2023-09-03T15:00:00.000' AS DateTime), CAST(N'2023-09-03T17:00:00.000' AS DateTime), 1, 1, 0, CAST(N'2023-08-27T22:47:56.070' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (18, 3, CAST(N'2023-09-15T11:00:00.000' AS DateTime), CAST(N'2023-09-15T13:00:00.000' AS DateTime), 2, 2, 0, CAST(N'2023-08-27T22:48:03.410' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (19, 3, CAST(N'2023-09-11T19:00:00.000' AS DateTime), CAST(N'2023-09-11T21:00:00.000' AS DateTime), 5, 5, 0, CAST(N'2023-08-27T22:48:59.253' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (20, 3, CAST(N'2023-09-12T15:00:00.000' AS DateTime), CAST(N'2023-09-12T17:00:00.000' AS DateTime), 3, 3, 0, CAST(N'2023-08-27T22:49:27.797' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (21, 1, CAST(N'2023-09-09T17:00:00.000' AS DateTime), CAST(N'2023-09-09T19:00:00.000' AS DateTime), 1, 1, 0, CAST(N'2023-08-27T22:50:08.417' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[OneToOneReservations] OFF
GO
SET IDENTITY_INSERT [dbo].[ReservationImg] ON 
GO
INSERT [dbo].[ReservationImg] ([Id], [ImgPath]) VALUES (1, N'C:\TEST Core MVC\Flex_TEST\預約照片\Reservation01.jpg')
GO
INSERT [dbo].[ReservationImg] ([Id], [ImgPath]) VALUES (2, N'C:\TEST Core MVC\Flex_TEST\預約照片\Reservation02.jpg')
GO
INSERT [dbo].[ReservationImg] ([Id], [ImgPath]) VALUES (3, N'C:\TEST Core MVC\Flex_TEST\預約照片\Reservation03.jpg')
GO
INSERT [dbo].[ReservationImg] ([Id], [ImgPath]) VALUES (4, N'C:\TEST Core MVC\Flex_TEST\預約照片\Reservation04.jpg')
GO
INSERT [dbo].[ReservationImg] ([Id], [ImgPath]) VALUES (5, N'C:\TEST Core MVC\Flex_TEST\預約照片\Reservation05.jpg')
GO
SET IDENTITY_INSERT [dbo].[ReservationImg] OFF
GO







--組長****************************************************************************--




INSERT [dbo].[CouponCategories] ([CouponCategoryId], [CouponCategoryName]) VALUES (1, N'優惠券')
INSERT [dbo].[CouponCategories] ([CouponCategoryId], [CouponCategoryName]) VALUES (2, N'註冊券')
INSERT [dbo].[CouponCategories] ([CouponCategoryId], [CouponCategoryName]) VALUES (3, N'生日券')
INSERT [dbo].[CouponCategories] ([CouponCategoryId], [CouponCategoryName]) VALUES (4, N'購物獎勵券')
INSERT [dbo].[CouponCategories] ([CouponCategoryId], [CouponCategoryName]) VALUES (5, N'會員等級券')
GO
SET IDENTITY_INSERT [dbo].[ProjectTags] ON 

INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (1, N'2022夏季特賣', CAST(N'2023-07-07T19:28:10.370' AS DateTime), CAST(N'2023-07-07T19:41:45.750' AS DateTime), 0)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (2, N'2022冬季特賣', CAST(N'2023-07-07T19:28:22.450' AS DateTime), CAST(N'2023-07-07T19:40:45.103' AS DateTime), 0)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (3, N'2022母親節特惠', CAST(N'2023-07-07T19:28:30.323' AS DateTime), CAST(N'2023-07-07T19:40:45.103' AS DateTime), 0)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (4, N'2022 618月中特賣', CAST(N'2023-07-07T19:28:44.657' AS DateTime), CAST(N'2023-07-07T19:40:45.103' AS DateTime), 0)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (5, N'2022開學特前特賣', CAST(N'2023-07-07T19:29:07.153' AS DateTime), CAST(N'2023-07-07T19:40:45.103' AS DateTime), 0)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (6, N'2022春換季特賣', CAST(N'2023-07-07T19:29:47.880' AS DateTime), CAST(N'2023-07-07T19:40:33.250' AS DateTime), 0)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (7, N'2022年終特賣', CAST(N'2023-07-07T19:29:54.377' AS DateTime), CAST(N'2023-07-07T19:40:33.250' AS DateTime), 0)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (8, N'2022會員積分兩倍專案', CAST(N'2023-07-07T19:30:40.290' AS DateTime), CAST(N'2023-07-07T19:40:33.250' AS DateTime), 0)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (9, N'2022聖誕特賣', CAST(N'2023-07-07T19:30:51.043' AS DateTime), CAST(N'2023-07-07T19:40:33.247' AS DateTime), 0)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (10, N'開學專區', CAST(N'2023-07-07T19:31:25.553' AS DateTime), CAST(N'2023-07-07T19:37:32.710' AS DateTime), 1)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (11, N'2023母親節特賣', CAST(N'2023-07-07T19:32:00.740' AS DateTime), CAST(N'2023-07-07T19:37:32.710' AS DateTime), 1)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (12, N'2023暑期特賣', CAST(N'2023-07-07T19:32:13.583' AS DateTime), CAST(N'2023-07-07T19:37:32.710' AS DateTime), 1)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (13, N'夏秋特賣', CAST(N'2023-07-07T19:32:30.153' AS DateTime), CAST(N'2023-07-07T19:37:32.710' AS DateTime), 1)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (14, N'2023夏日涼涼特賣', CAST(N'2023-07-07T19:32:56.827' AS DateTime), CAST(N'2023-07-07T19:37:32.710' AS DateTime), 1)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (15, N'2023夏秋短褲特賣', CAST(N'2023-07-07T19:33:22.217' AS DateTime), CAST(N'2023-07-07T19:37:32.710' AS DateTime), 1)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (16, N'9折專區', CAST(N'2023-07-07T21:02:04.070' AS DateTime), CAST(N'2023-07-07T21:02:04.070' AS DateTime), 1)
INSERT [dbo].[ProjectTags] ([ProjectTagId], [ProjectTagName], [CreateAt], [ModifiedAt], [Status]) VALUES (17, N'2件專區', CAST(N'2023-07-07T21:02:31.470' AS DateTime), CAST(N'2023-07-07T21:02:31.470' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ProjectTags] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupons] ON 

INSERT [dbo].[Coupons] ([CouponId], [fk_CouponCategoryId], [CouponName], [CouponCode], [MinimumPurchaseAmount], [DiscountType], [DiscountValue], [StartDate], [EndType], [EndDays], [EndDate], [PersonMaxUsage], [RequirementType], [Requirement], [fk_RequiredProjectTagID]) VALUES (1, 2, N'註冊禮券', NULL, 500, 0, 50, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, 30, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Coupons] ([CouponId], [fk_CouponCategoryId], [CouponName], [CouponCode], [MinimumPurchaseAmount], [DiscountType], [DiscountValue], [StartDate], [EndType], [EndDays], [EndDate], [PersonMaxUsage], [RequirementType], [Requirement], [fk_RequiredProjectTagID]) VALUES (2, 3, N'生日禮券', NULL, 200, 1, 15, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 1, 30, NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Coupons] ([CouponId], [fk_CouponCategoryId], [CouponName], [CouponCode], [MinimumPurchaseAmount], [DiscountType], [DiscountValue], [StartDate], [EndType], [EndDays], [EndDate], [PersonMaxUsage], [RequirementType], [Requirement], [fk_RequiredProjectTagID]) VALUES (3, 1, N'618活動券', NULL, 150, 1, 10, CAST(N'2023-06-18T00:00:00.000' AS DateTime), 0, NULL, CAST(N'2023-06-30T00:00:00.000' AS DateTime), 1, 0, NULL, NULL)
INSERT [dbo].[Coupons] ([CouponId], [fk_CouponCategoryId], [CouponName], [CouponCode], [MinimumPurchaseAmount], [DiscountType], [DiscountValue], [StartDate], [EndType], [EndDays], [EndDate], [PersonMaxUsage], [RequirementType], [Requirement], [fk_RequiredProjectTagID]) VALUES (4, 1, N'周年慶', NULL, 250, 0, 20, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 0, 15, CAST(N'2023-04-30T00:00:00.000' AS DateTime), 1, 0, NULL, NULL)
INSERT [dbo].[Coupons] ([CouponId], [fk_CouponCategoryId], [CouponName], [CouponCode], [MinimumPurchaseAmount], [DiscountType], [DiscountValue], [StartDate], [EndType], [EndDays], [EndDate], [PersonMaxUsage], [RequirementType], [Requirement], [fk_RequiredProjectTagID]) VALUES (5, 1, N'情人節禮券', NULL, 300, 0, 20, CAST(N'2022-02-07T00:00:00.000' AS DateTime), 0, NULL, CAST(N'2023-02-17T00:00:00.000' AS DateTime), 2, 0, NULL, NULL)
INSERT [dbo].[Coupons] ([CouponId], [fk_CouponCategoryId], [CouponName], [CouponCode], [MinimumPurchaseAmount], [DiscountType], [DiscountValue], [StartDate], [EndType], [EndDays], [EndDate], [PersonMaxUsage], [RequirementType], [Requirement], [fk_RequiredProjectTagID]) VALUES (6, 1, N'月中免運券', NULL, 180, 2, 0, CAST(N'2023-06-15T00:00:00.000' AS DateTime), 0, NULL, CAST(N'2023-06-15T00:00:00.000' AS DateTime), 5, 1, 5, NULL)
INSERT [dbo].[Coupons] ([CouponId], [fk_CouponCategoryId], [CouponName], [CouponCode], [MinimumPurchaseAmount], [DiscountType], [DiscountValue], [StartDate], [EndType], [EndDays], [EndDate], [PersonMaxUsage], [RequirementType], [Requirement], [fk_RequiredProjectTagID]) VALUES (7, 4, N'好禮贈', NULL, 500, 1, 20, CAST(N'2023-07-01T00:00:00.000' AS DateTime), 0, NULL, NULL, 3, 0, 1000, 13)
INSERT [dbo].[Coupons] ([CouponId], [fk_CouponCategoryId], [CouponName], [CouponCode], [MinimumPurchaseAmount], [DiscountType], [DiscountValue], [StartDate], [EndType], [EndDays], [EndDate], [PersonMaxUsage], [RequirementType], [Requirement], [fk_RequiredProjectTagID]) VALUES (8, 1, N'暑假大FUN送', NULL, 280, 0, 90, CAST(N'2023-08-01T00:00:00.000' AS DateTime), 0, NULL, CAST(N'2023-08-15T00:00:00.000' AS DateTime), 2, 0, NULL, NULL)
INSERT [dbo].[Coupons] ([CouponId], [fk_CouponCategoryId], [CouponName], [CouponCode], [MinimumPurchaseAmount], [DiscountType], [DiscountValue], [StartDate], [EndType], [EndDays], [EndDate], [PersonMaxUsage], [RequirementType], [Requirement], [fk_RequiredProjectTagID]) VALUES (9, 1, N'Criteria聯名券', NULL, 190, 0, 80, CAST(N'2023-09-01T00:00:00.000' AS DateTime), 0, NULL, CAST(N'2023-09-30T00:00:00.000' AS DateTime), 1, 0, NULL, NULL)
INSERT [dbo].[Coupons] ([CouponId], [fk_CouponCategoryId], [CouponName], [CouponCode], [MinimumPurchaseAmount], [DiscountType], [DiscountValue], [StartDate], [EndType], [EndDays], [EndDate], [PersonMaxUsage], [RequirementType], [Requirement], [fk_RequiredProjectTagID]) VALUES (10, 1, N'月中免運券', NULL, 350, 1, 20, CAST(N'2023-10-15T00:00:00.000' AS DateTime), 0, NULL, CAST(N'2023-10-15T00:00:00.000' AS DateTime), 2, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Coupons] OFF
GO
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'C_CL_LG_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'C_CL_LG_0002')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'C_CL_LG_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'C_CL_LG_0004')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'C_CL_LG_0005')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'C_CL_LG_0006')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'F_CL_LG_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'F_CL_LG_0002')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'F_CL_LG_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'F_CL_LG_0004')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'F_CL_LG_0005')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'F_CL_LG_0006')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'F_CL_LG_0007')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'M_CL_LG_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'M_CL_LG_0002')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'M_CL_LG_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'M_CL_LG_0004')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'M_CL_LG_0005')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'M_CL_LG_0006')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'M_CL_LG_0007')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'F_PA_ST_0005')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'F_PA_ST_0006')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'F_PA_ST_0007')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'F_PA_ST_0008')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'F_SH_CL_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'M_PA_ST_0008')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'M_PA_ST_0009')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'M_SH_CL_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'M_SH_CL_0002')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'M_SH_CL_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'C_PA_ST_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'C_PA_ST_0002')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'C_PA_ST_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'C_PA_ST_0004')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (16, N'C_PA_ST_0005')

INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'C_CL_LG_0007')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'C_CL_LG_0008')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'C_CL_ST_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'C_CL_ST_0002')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'C_CL_ST_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'C_CL_ST_0004')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'C_CL_ST_0005')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'F_CL_LG_0008')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'F_CL_ST_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'F_CL_ST_0002')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'F_CL_ST_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'F_CL_ST_0004')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'F_CL_ST_0005')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'F_CL_ST_0006')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'F_CL_ST_0007')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'F_CL_ST_0008')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'M_CL_LG_0008')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'M_CL_ST_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'M_CL_ST_0002')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'M_CL_ST_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'M_CL_ST_0004')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'M_CL_ST_0005')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'M_CL_ST_0006')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'M_CL_ST_0007')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'M_CL_ST_0008')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'M_PA_LG_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (17, N'M_PA_LG_0002')

INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'C_CL_ST_0006')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'C_CL_ST_0007')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'C_CL_ST_0008')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'C_PA_LG_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'C_PA_LG_0002')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'F_PA_LG_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'F_PA_LG_0002')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'F_PA_LG_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'F_PA_LG_0004')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'F_PA_LG_0005')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'M_PA_LG_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'M_PA_LG_0004')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'M_PA_LG_0005')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'M_PA_LG_0006')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (10, N'M_PA_LG_0007')

INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'C_PA_LG_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'C_PA_LG_0004')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'C_PA_LG_0005')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'C_PA_LG_0006')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'C_PA_LG_0007')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'C_PA_LG_0008')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'F_PA_LG_0006')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'F_PA_LG_0007')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'F_PA_LG_0008')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'F_PA_ST_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'F_PA_ST_0002')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'F_PA_ST_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'F_PA_ST_0004')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'M_PA_LG_0008')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'M_PA_ST_0001')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'M_PA_ST_0002')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'M_PA_ST_0003')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'M_PA_ST_0004')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'M_PA_ST_0005')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'M_PA_ST_0006')
INSERT [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId]) VALUES (13, N'M_PA_ST_0007')
GO
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (1, N'2022新年優惠', N'新年優惠', NULL, 0, 5, 0, 100, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (2, N'2022農曆春節特惠', N'春節特惠', NULL, 1, 15, 1, 3, CAST(N'2022-02-15T00:00:00.000' AS DateTime), CAST(N'2022-03-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (3, N'2022春季換季', N'春節換季', NULL, 0, 2, 1, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), CAST(N'2022-05-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (4, N'2022暑假特惠', N'暑期特惠', NULL, 1, 30, 0, 100, CAST(N'2022-06-01T00:00:00.000' AS DateTime), CAST(N'2022-07-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (5, N'2022開學特惠', N'開學特會', NULL, 1, 18, 0, 70, CAST(N'2022-08-01T00:00:00.000' AS DateTime), CAST(N'2022-09-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (6, N'2022秋冬大特賣', N'秋冬大特賣', NULL, 1, 25, 1, 4, CAST(N'2022-10-01T00:00:00.000' AS DateTime), CAST(N'2022-12-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (7, N'2023新年優惠', N'新年優惠', NULL, 1, 20, 0, 50, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-01-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (8, N'2023春節特惠', N'農曆春節拍賣', NULL, 0, 10, 0, 30, CAST(N'2023-02-01T00:00:00.000' AS DateTime), CAST(N'2023-02-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (9, N'95折專區', N'單件購買即享95折', 16, 1, 5, 1, 1, CAST(N'2023-03-01T00:00:00.000' AS DateTime), NULL, 500)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (10, N'3件8折', N'3件以上，每件享8折優惠', 17, 1, 20, 1, 3, CAST(N'2023-04-10T00:00:00.000' AS DateTime), NULL, 400)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (11, N'2023春夏換季特惠', N'換季特惠', NULL, 0, 4, 0, 40, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (12, N'2023暑期特惠', N'暑期特惠', 12, 1, 10, 1, 5, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (13, N'開學特惠', N'開學前買一波!此專區單次消費購買兩件以上，折40元。', 10, 0, 40, 1, 2, CAST(N'2023-08-01T00:00:00.000' AS DateTime), CAST(N'2023-09-06T23:59:59.000' AS DateTime), 7)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (14, N'入秋特惠', N'夏秋換季特惠，此專區商品滿700元，享50元折扣，', 13, 0, 50, 0, 700, CAST(N'2023-08-20T00:00:00.000' AS DateTime), CAST(N'2023-09-20T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Discounts] ([DiscountId], [DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], [ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy]) VALUES (15, N'2023冬季特賣', N'冬季特賣', NULL, 0, 7, 1, 3, CAST(N'2023-10-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 100)
SET IDENTITY_INSERT [dbo].[Discounts] OFF
GO

INSERT INTO ShoppingCarts(fk_MemberID)
VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25);

GO

INSERT INTO CartItems(fk_CardId,fk_ProductId,Description,Qty)
VALUES (1,1,'',2),
(1,6,'',1),
(1,663,'',3),
(1,670,'',2),
(3,6,'',1);

go

insert INTO CouponSendings(fk_CouponId,fk_MemberId,SentDate,StartDate,EndDate ,RedemptionStatus,RedeemedDate)
values
(1,1,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,2,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,3,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,4,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,5,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,6,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,7,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,8,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,9,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,10,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,11,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,12,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,13,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,14,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,15,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,16,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,17,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,18,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,19,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,20,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,21,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,22,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,23,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,24,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,25,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(6,1,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,2,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,3,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,4,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,5,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,6,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,7,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,8,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,9,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,10,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,11,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,12,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,13,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,14,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,15,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,16,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,17,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,18,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,19,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,20,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,21,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,22,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,23,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,24,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,25,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(7,1,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,2,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,3,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,4,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,5,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,6,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,7,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,8,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,9,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,10,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,11,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,12,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,13,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,14,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,15,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,16,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,17,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,18,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,19,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,20,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,21,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,22,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,23,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,24,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,25,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null);

GO

--祥豪************************************************************************************************************--

---1付款狀態
insert into pay_statuses(pay_status)
values('等待中'),('失敗'),('成功')
---2付款方法
insert into pay_methods(pay_method)
values('現金'),('信用卡'),('Paypal')
---3訂單狀態
insert into order_statuses(order_status)
values('已成立'),('備貨中'),('已出貨'),('運送中'),('待領貨'),('已完成'),('已取消'),('已退貨')
---4物流公司
insert into logistics_companies(name,tel,logistics_description)
values
('無','無','課程或活動'),
('黑貓宅急便','(02)412-8689','服務時間：週一 ~ 週五 08:00~16:00'),
('新竹物流','(02)412-8866','服務時間：週一 ~ 週六 08:00~16:00')
---5訂單
insert into orders([ordertime],fk_member_Id,logistics_company_Id,order_status_Id,
pay_method_Id,pay_status_Id,coupon_name,coupon_discount,freight,cellphone
,receipt,receiver,recipient_address,order_description,[close],total_quantity,total_price)
values
('2023-06-28 17:24:36.123',1,2,6,1,3,'暑假大FUN送',90,60,'0912378555','98421673','David Wu','台北市信義區忠孝東路五段55號','商品',0,1,3600),
('2023-07-03 08:57:21.456',3,3,1,1,1,'無',0,60,'0911654321','50287415','Tony Chen','台北市中山區中正路789號','商品',0,1,1300),
('2023-06-29 12:34:45.789',5,2,6,2,3,'Criteria聯名券',80,60,'0933777244','70695328','Sophia Huang','桃園市中壢區環中東路111號','商品',0,1,1300),
('2023-07-01 21:42:53.321',7,2,1,1,1,'好禮贈',20,60,'0922245633','15923748','Olivia Lin','彰化縣員林市中山路333號','商品',0,1,1300),
('2023-06-30 18:23:12.654',8,2,5,3,3,'暑假大FUN送',90,60,'096685277','82763591','Daniel Yang','新北市三峽區民生路456號','商品',0,1,1000),
('2023-06-28 20:16:28.987',6,2,7,2,2,'無',0,60,'0955753666','43019567','Chris Lee','台南市北區成功路222號','商品',0,1,1000),
('2023-07-06 09:45:32.123',5,1,1,1,1,'無',0,0,'0933777244','67148203','Sophia Huang','桃園市中壢區環中東路111號','活動',0,1,500),
('2023-06-29 07:36:59.456',4,1,6,1,3,'無',0,0,'0911456222','31578942','Ryan Liu','新竹市東區光復路','課程',0,1,0),
('2023-07-02 15:28:41.789',9,2,2,1,3,'好禮贈',0,60,'0912345678','76820413','Ava Tsai','基隆市中山區中正路567號','客製化',0,1,2000),
('2023-07-04 13:19:54.321',8,1,6,2,3,'無',0,0,'096685277','59137628','Daniel Yang','新北市三峽區民生路456號','活動',0,1,500),
('2023-07-07 22:37:18.654',7,2,4,1,3,'暑假大FUN送',90,60,'0922245633','82401957','Olivia Lin','彰化縣員林市中山路333號','商品',0,1,800),
('2023-06-28 19:58:23.987',6,2,6,2,3,'無',0,60,'0955753666','13769582','rChris Lee','台南市北區成功路222號','商品',0,1,800),
('2023-07-01 11:14:29.123',5,1,1,1,3,'無',0,0,'0933777244','49681237','Sophia Huang','桃園市中壢區環中東路111號','課程',0,1,0),
('2023-07-05 10:05:14.456',9,2,1,2,2,'暑假大FUN送',90,60,'0912345678','35289761','Ava Tsai','基隆市中山區中正路567號','客製化',0,1,2000),
('2023-06-30 23:09:48.789',10,1,7,1,3,'無',0,0,'0923556789','91826734','Jason Huang','桃園市桃園區中正路789號','課程',0,1,0),
('2023-07-08 04:31:36.321',16,2,1,3,1,'無',0,60,'0966825777','91836734','Alex Wu','基隆市仁愛區中正路567號','商品',0,1,1300)
---6訂單明細
insert into orderItems(order_Id,product_name,[fk_typeId],per_price,quantity,discount_name
,subtotal,discount_subtotal,Items_description)
values
(1,'運動鞋',1,3600,1,'無',3600,3600,'男裝/鞋子/運動鞋'),
(2,'包包',1,1300,1,'無',1300,1300,'女裝/配件/包包'),
(3,'帽子',1,1300,1,'無',1300,1300,'男裝/配件/帽子'),
(4,'長褲',1,1300,1,'無',1300,1300,'女裝/上衣/短袖'),
(5,'短褲',1,1000,1,'無',1000,1000,'男裝/褲子/短褲'),
(6,'短袖',1,1000,1,'無',1000,1000,'男裝/上衣/短袖'),
(7,'2023Flex第3屆公益路跑活動',2,500,1,'無',500,500,'台北大稻埕碼頭'),
(8,'跑步',3,0,1,'無',0,0,'跑步專家Allen'),
(9,'運動鞋',4,2000,1,'無',2000,2000,'跑步 番茄紅 帆布'),
(10,'2023第3屆桃園健行嘉年華',2,500,1,'無',500,500,'聖德基督學院'),
(11,'短褲',1,800,1,'無',800,800,'童裝/褲子/短褲'),
(12,'短褲',1,800,1,'無',800,800,'童裝/褲子/短褲'),
(13,'自行車',3,0,1,'無',0,0,'自行車專家Teddy'),
(14,'運動鞋',4,2000,1,'無',2000,2000,'運動生活 綠松石綠 絲絨'),
(15,'健行',3,0,1,'無',0,0,'健行導師Jack'),
(16,'長袖',1,1300,1,'無',1300,1300,'男裝/上衣/短袖')



-----留言----------------------------------------------------------------

insert ProductComment(fk_MemberId,fk_ProductGroupId,Description,Score)
values
(1,1,'舒適好穿',4),(1,2,'舒適好穿',5),(1,3,'舒適好穿',5),(1,4,'舒適好穿',4),(1,5,'舒適好穿',5),
(1,6,'舒適好穿',4),(1,7,'舒適好穿',5),(1,8,'舒適好穿',5),(1,9,'舒適好穿',4),(1,10,'舒適好穿',5),
(1,11,'舒適好穿',4),(1,12,'舒適好穿',5),(1,13,'舒適好穿',5),(1,14,'舒適好穿',4),(1,15,'舒適好穿',5),
(1,16,'舒適好穿',4),(1,17,'舒適好穿',5),(1,18,'舒適好穿',5),(1,19,'舒適好穿',4),(1,20,'舒適好穿',5),
(1,21,'舒適好穿',4),(1,22,'舒適好穿',5),(1,23,'舒適好穿',5),(1,24,'舒適好穿',4),(1,25,'舒適好穿',5),
(1,26,'舒適好穿',4),(1,27,'舒適好穿',5),(1,28,'舒適好穿',5),(1,29,'舒適好穿',4),(1,30,'舒適好穿',5),
(1,31,'舒適好穿',4),(1,32,'舒適好穿',5),(1,33,'舒適好穿',5),(1,34,'舒適好穿',4),(1,35,'舒適好穿',5),
(1,36,'舒適好穿',4),(1,37,'舒適好穿',5),(1,38,'舒適好穿',5),(1,39,'舒適好穿',4),(1,40,'舒適好穿',5),
(1,41,'舒適好穿',4),(1,42,'舒適好穿',5),(1,43,'舒適好穿',5),(1,44,'舒適好穿',4),(1,45,'舒適好穿',5),
(1,46,'舒適好穿',4),(1,47,'舒適好穿',5),(1,48,'舒適好穿',5),(1,49,'舒適好穿',4),(1,50,'舒適好穿',5),
(1,51,'舒適好穿',4),(1,52,'舒適好穿',5),(1,53,'舒適好穿',5),(1,54,'舒適好穿',4),(1,55,'舒適好穿',5),
(1,56,'舒適好穿',4),(1,57,'舒適好穿',5),(1,58,'舒適好穿',5),(1,59,'舒適好穿',4),(1,60,'舒適好穿',5),
(1,61,'舒適好穿',4),(1,62,'舒適好穿',5),(1,63,'舒適好穿',5),(1,64,'舒適好穿',4),(1,65,'舒適好穿',5),
(1,66,'舒適好穿',4),(1,67,'舒適好穿',5),(1,68,'舒適好穿',5),(1,69,'舒適好穿',4),(1,70,'舒適好穿',5),
(1,71,'舒適好穿',4),(1,72,'舒適好穿',5),(1,73,'舒適好穿',5),(1,74,'舒適好穿',4),(1,75,'舒適好穿',5),
(1,76,'舒適好穿',4),(1,77,'舒適好穿',5),(1,78,'舒適好穿',5),(1,79,'舒適好穿',4),(1,80,'舒適好穿',5),
(1,81,'舒適好穿',4),(1,82,'舒適好穿',5),(1,83,'舒適好穿',5),(1,84,'舒適好穿',5),(1,85,'舒適好穿',5),
(1,86,'舒適好穿',4),(1,87,'舒適好穿',5),(1,88,'舒適好穿',5),(1,89,'舒適好穿',4),(1,90,'舒適好穿',5),
(1,91,'舒適好穿',4),(1,92,'舒適好穿',5),(1,93,'舒適好穿',5),(1,94,'舒適好穿',4),(1,95,'舒適好穿',5),
(1,96,'舒適好穿',4),(1,97,'舒適好穿',5),(1,98,'舒適好穿',5),(1,99,'舒適好穿',4),(2,1,'CP值很高',5),
(2,2,'CP值很高',4),(2,3,'CP值很高',5),(2,4,'CP值很高',5),(2,5,'CP值很高',5),(2,6,'CP值很高',5),
(2,7,'CP值很高',4),(2,8,'CP值很高',5),(2,9,'CP值很高',5),(2,10,'CP值很高',5),(2,11,'CP值很高',5),
(2,12,'CP值很高',4),(2,13,'CP值很高',5),(2,14,'CP值很高',5),(2,15,'CP值很高',5),(2,16,'CP值很高',5),
(2,17,'CP值很高',4),(2,18,'CP值很高',5),(2,19,'CP值很高',5),(2,20,'CP值很高',5),(2,21,'CP值很高',5),
(2,22,'CP值很高',4),(2,23,'CP值很高',5),(2,24,'CP值很高',5),(2,25,'CP值很高',5),(2,26,'CP值很高',5),
(2,27,'CP值很高',4),(2,28,'CP值很高',5),(2,29,'CP值很高',5),(2,30,'CP值很高',5),(2,31,'CP值很高',5),
(2,32,'CP值很高',4),(2,33,'CP值很高',5),(2,34,'CP值很高',4),(2,35,'CP值很高',5),(2,36,'CP值很高',5),
(2,37,'CP值很高',4),(2,38,'CP值很高',5),(2,39,'CP值很高',4),(2,40,'CP值很高',5),(2,41,'CP值很高',5),
(2,42,'CP值很高',4),(2,43,'CP值很高',5),(2,44,'CP值很高',5),(2,45,'CP值很高',5),(2,46,'CP值很高',5),
(2,47,'CP值很高',4),(2,48,'CP值很高',5),(2,49,'CP值很高',4),(2,50,'CP值很高',5),(2,51,'CP值很高',5),
(2,52,'CP值很高',4),(2,53,'CP值很高',5),(2,54,'CP值很高',4),(2,55,'CP值很高',5),(2,56,'CP值很高',5),
(2,57,'CP值很高',4),(2,58,'CP值很高',5),(2,59,'CP值很高',5),(2,60,'CP值很高',5),(2,61,'CP值很高',5),
(2,62,'CP值很高',4),(2,63,'CP值很高',5),(2,64,'CP值很高',4),(2,65,'CP值很高',5),(2,66,'CP值很高',5),
(2,67,'CP值很高',4),(2,68,'CP值很高',5),(2,69,'CP值很高',5),(2,70,'CP值很高',5),(2,71,'CP值很高',5),
(2,72,'CP值很高',4),(2,73,'CP值很高',5),(2,74,'CP值很高',4),(2,75,'CP值很高',5),(2,76,'CP值很高',5),
(2,77,'CP值很高',4),(2,78,'CP值很高',5),(2,79,'CP值很高',4),(2,80,'CP值很高',5),(2,81,'CP值很高',5),
(2,82,'CP值很高',4),(3,83,'CP值很高',5),(3,84,'CP值很高',4),(3,85,'CP值很高',5),(3,86,'CP值很高',5),
(3,87,'CP值很高',4),(3,88,'CP值很高',5),(3,89,'CP值很高',5),(3,90,'CP值很高',5),(3,91,'CP值很高',5),
(3,92,'CP值很高',4),(3,93,'CP值很高',5),(3,94,'CP值很高',4),(3,95,'CP值很高',5),(3,96,'CP值很高',5),
(3,97,'CP值很高',4),(3,98,'CP值很高',5),(3,99,'CP值很高',5),(4,1,'CP值很高',5),(4,2,'CP值很高',5),
(4,3,'CP值很高',5),(4,4,'CP值很高',5),(4,5,'CP值很高',5),(4,6,'CP值很高',5),(4,7,'CP值很高',5),
(4,8,'CP值很高',5),(4,9,'CP值很高',5),(4,10,'CP值很高',5),(4,11,'CP值很高',5),(4,12,'CP值很高',5),
(4,13,'CP值很高',5),(4,14,'CP值很高',5),(4,15,'CP值很高',5),(4,16,'CP值很高',5),(4,17,'CP值很高',5),
(4,18,'CP值很高',5),(4,19,'CP值很高',5),(4,20,'CP值很高',5),(4,21,'CP值很高',5),(4,22,'CP值很高',5),
(4,23,'CP值很高',5),(4,24,'CP值很高',5),(4,25,'CP值很高',5),(4,26,'CP值很高',5),(4,27,'CP值很高',5),
(4,28,'CP值很高',5),(4,29,'CP值很高',5),(4,30,'CP值很高',5),(4,31,'CP值很高',5),(4,32,'CP值很高',5),
(4,33,'CP值很高',5),(4,34,'CP值很高',5),(4,35,'CP值很高',5),(4,36,'CP值很高',5),(4,37,'CP值很高',5),
(4,38,'CP值很高',5),(4,39,'CP值很高',5),(4,40,'CP值很高',5),(4,41,'CP值很高',5),(4,42,'CP值很高',5),
(4,43,'CP值很高',5),(4,44,'CP值很高',5),(4,45,'CP值很高',5),(4,46,'CP值很高',5),(4,47,'CP值很高',5),
(4,48,'CP值很高',5),(4,49,'CP值很高',5),(4,50,'CP值很高',5),(4,51,'CP值很高',5),(4,52,'CP值很高',5),
(4,53,'CP值很高',5),(5,54,'服務品質一流',5),(5,55,'服務品質一流',5),(5,56,'服務品質一流',4),(5,57,'服務品質一流',5),
(5,58,'服務品質一流',5),(5,59,'服務品質一流',5),(5,60,'服務品質一流',5),(5,61,'服務品質一流',4),(5,62,'服務品質一流',5),
(5,63,'服務品質一流',4),(5,64,'服務品質一流',4),(5,65,'服務品質一流',5),(5,66,'服務品質一流',5),(5,67,'服務品質一流',5),
(5,68,'服務品質一流',4),(5,69,'服務品質一流',5),(5,70,'服務品質一流',5),(5,71,'服務品質一流',4),(5,72,'服務品質一流',5),
(5,73,'服務品質一流',5),(5,74,'服務品質一流',4),(5,75,'服務品質一流',5),(5,76,'服務品質一流',5),(5,77,'服務品質一流',5),
(5,78,'服務品質一流',5),(5,79,'服務品質一流',5),(5,80,'服務品質一流',5),(5,81,'服務品質一流',4),(5,82,'服務品質一流',5),
(5,83,'服務品質一流',4),(5,84,'服務品質一流',4),(5,85,'服務品質一流',5),(5,86,'服務品質一流',5),(5,87,'服務品質一流',5),
(5,88,'服務品質一流',4),(5,89,'服務品質一流',5),(5,90,'服務品質一流',5),(5,91,'服務品質一流',4),(5,92,'服務品質一流',5),
(5,93,'服務品質一流',5),(5,94,'服務品質一流',4),(5,95,'服務品質一流',5),(5,96,'服務品質一流',5),(5,97,'服務品質一流',5),
(5,98,'服務品質一流',4),(5,99,'服務品質一流',5),(6,100,'好穿',5),(7,101,'此設計符合需求',5),(8,102,'讚讚',4),
(9,103,'質感很好',5),(10,104,'透氣',4),(11,105,'穿起來很舒適',5),(12,106,'符合期待',5),(13,107,'good',5),
(14,108,'耐穿又好看',4),(15,109,'CP很高',4),(16,110,'好穿',5),(17,111,'此設計符合需求',4),(18,112,'讚讚',5),
(19,113,'質感很好',5),(20,114,'透氣',5),(21,115,'穿起來很舒適',5),(22,116,'符合期待',4),(23,117,'good',5),
(24,118,'耐穿又好看',4),(25,119,'CP很高',5),(1,120,'好穿',5),(2,121,'此設計符合需求',5),(3,122,'讚讚',4),
(4,123,'質感很好',4),(5,124,'透氣',5),(6,125,'穿起來很舒適',5),(7,126,'符合期待',5),(8,127,'good',5),
(9,128,'耐穿又好看',4),(10,129,'CP很高',5),(11,130,'好穿',4),(12,131,'此設計符合需求',5),(13,132,'讚讚',4),
(14,133,'質感很好',5),(15,134,'透氣',5),(16,135,'穿起來很舒適',5),(17,136,'符合期待',4),(18,137,'good',4),
(19,138,'耐穿又好看',5),(20,139,'CP很高',5),(21,140,'好穿',5),(22,141,'此設計符合需求',5),(23,142,'讚讚',5),
(24,143,'質感很好',5),(25,144,'透氣',4),(1,145,'穿起來很舒適',5),(2,146,'符合期待',4),(3,147,'good',5),
(4,148,'耐穿又好看',5),(5,149,'CP很高',5),(6,150,'好穿',4),(7,151,'此設計符合需求',4),(8,152,'讚讚',5),
(9,153,'質感很好',5),(10,154,'透氣',5),(11,155,'穿起來很舒適',5),(12,156,'符合期待',5),(13,157,'good',5),
(14,158,'耐穿又好看',4),(15,159,'CP很高',5),(16,160,'好穿',4),(17,161,'此設計符合需求',5),(18,162,'讚讚',5),
(19,163,'質感很好',5),(20,164,'透氣',4),(21,165,'穿起來很舒適',4),(22,166,'符合期待',5),(23,167,'good',4),
(24,168,'耐穿又好看',5),(25,169,'CP很高',4),(1,170,'好穿',5),(2,171,'此設計符合需求',5),(3,172,'讚讚',4),
(4,173,'質感很好',5),(5,174,'透氣',4),(6,175,'穿起來很舒適',5),(7,176,'符合期待',5),(8,177,'good',5),
(9,178,'耐穿又好看',4),(10,179,'CP很高',4),(11,180,'好穿',5),(12,181,'此設計符合需求',5),(13,182,'讚讚',5),
(14,183,'質感很好',5),(15,184,'透氣',5),(16,185,'穿起來很舒適',5),(17,186,'符合期待',4),(18,187,'good',5),
(19,188,'耐穿又好看',4),(20,189,'CP很高',5),(21,190,'好穿',5),(22,191,'此設計符合需求',5),(23,192,'讚讚',4),
(24,193,'質感很好',4),(25,194,'透氣',5),(1,195,'穿起來很舒適',5),(2,196,'符合期待',5),(3,197,'good',5),
(4,198,'耐穿又好看',5),(5,199,'CP很高',5),(6,200,'好穿',4),(7,201,'此設計符合需求',5),(8,202,'讚讚',4),
(9,203,'質感很好',5),(10,204,'透氣',5),(11,205,'穿起來很舒適',5),(12,206,'符合期待',4),(13,207,'good',4),
(14,208,'耐穿又好看',5),(15,209,'CP很高',4),(16,210,'好穿',5),(17,211,'此設計符合需求',5),(18,212,'讚讚',5),
(19,213,'質感很好',5),(20,214,'透氣',4),(21,215,'穿起來很舒適',5),(22,216,'符合期待',4),(23,217,'good',5),
(24,218,'耐穿又好看',5),(25,219,'CP很高',5),(1,220,'好穿',4),(2,221,'此設計符合需求',4),(3,222,'讚讚',5),
(4,223,'質感很好',5),(5,224,'透氣',5),(6,225,'穿起來很舒適',4),(7,226,'符合期待',5),(8,227,'good',5),
(9,228,'耐穿又好看',4),(10,229,'CP很高',5),(11,230,'好穿',4),(12,231,'此設計符合需求',5),(13,232,'讚讚',5),
(14,233,'質感很好',5),(15,234,'透氣',4),(16,235,'穿起來很舒適',4),(17,236,'符合期待',5),(18,237,'good',5),
(19,238,'耐穿又好看',5),(20,239,'CP很高',5),(21,240,'好穿',4),(22,241,'此設計符合需求',5),(23,242,'讚讚',4),
(24,243,'質感很好',5),(25,244,'透氣',4),(1,245,'穿起來很舒適',5),(2,246,'符合期待',5),(3,247,'good',5),
(4,248,'耐穿又好看',4),(5,249,'CP很高',4),(6,250,'好穿',5),(7,251,'此設計符合需求',5),(8,252,'讚讚',5),
(9,253,'質感很好',4),(10,254,'透氣',5),(11,255,'穿起來很舒適',5),(12,256,'符合期待',4),(13,257,'good',5),
(14,258,'耐穿又好看',4),(15,259,'CP很高',5),(16,260,'好穿',5),(17,261,'此設計符合需求',5),(18,262,'讚讚',4),
(19,263,'質感很好',4),(20,264,'透氣',5),(21,265,'穿起來很舒適',5),(22,266,'符合期待',4),(23,267,'good',5),
(24,268,'耐穿又好看',5),(25,269,'CP很高',5),(1,270,'好穿',4),(2,271,'此設計符合需求',5),(3,272,'讚讚',4),
(4,273,'質感很好',5),(5,274,'透氣',5),(6,275,'穿起來很舒適',5),(7,276,'符合期待',4),(8,277,'good',4),
(9,278,'耐穿又好看',5),(10,279,'CP很高',5),(11,280,'好穿',5),(12,281,'此設計符合需求',5),(13,282,'讚讚',5),
(14,283,'質感很好',5),(15,284,'透氣',4),(16,285,'穿起來很舒適',5),(17,286,'符合期待',4),(18,287,'good',5),
(19,288,'耐穿又好看',5),(20,289,'CP很高',5),(21,290,'好穿',4),(22,291,'此設計符合需求',4),(23,292,'讚讚',5),
(24,293,'質感很好',5),(25,294,'透氣',4),(1,295,'穿起來很舒適',5),(2,296,'符合期待',5),(3,297,'good',5),
(4,298,'耐穿又好看',4),(5,299,'CP很高',5),(6,300,'好穿',4),(7,301,'此設計符合需求',5),(8,302,'讚讚',5),
(9,303,'質感很好',5),(10,304,'透氣',4),(11,305,'穿起來很舒適',4),(12,306,'符合期待',5),(13,307,'good',5),
(14,308,'耐穿又好看',5),(15,309,'CP很高',5),(16,310,'好穿',5),(17,311,'此設計符合需求',5),(18,312,'讚讚',4),
(19,313,'質感很好',5),(20,314,'透氣',4),(21,315,'穿起來很舒適',5),(22,316,'符合期待',5),(23,317,'good',5),
(24,318,'耐穿又好看',4),(25,319,'CP很高',4),(1,320,'好穿',5),(2,321,'此設計符合需求',4),(3,322,'讚讚',5),
(4,323,'質感很好',5),(5,324,'透氣',5),(6,325,'穿起來很舒適',5),(7,326,'符合期待',4),(8,327,'good',5),
(9,328,'耐穿又好看',4),(10,329,'CP很高',5),(11,330,'好穿',5),(12,331,'此設計符合需求',5),(13,332,'讚讚',4),
(14,333,'質感很好',4),(15,334,'透氣',5),(16,335,'穿起來很舒適',5),(17,336,'符合期待',5),(18,337,'good',5),
(19,338,'耐穿又好看',4),(20,339,'CP很高',5),(21,340,'好穿',4),(22,341,'此設計符合需求',5),(23,342,'讚讚',4),
(24,343,'質感很好',5),(25,344,'透氣',5),(1,345,'穿起來很舒適',5),(2,346,'符合期待',4),(3,347,'good',4),
(4,348,'耐穿又好看',5),(5,349,'CP很高',5),(6,350,'好穿',5),(7,351,'此設計符合需求',5),(8,352,'讚讚',4),
(9,353,'質感很好',5),(10,354,'透氣',4),(11,355,'穿起來很舒適',5),(12,356,'符合期待',4),(13,357,'good',5),
(14,358,'耐穿又好看',5),(15,359,'CP很高',5),(16,360,'好穿',4),(17,361,'此設計符合需求',4),(18,362,'讚讚',5),
(19,363,'質感很好',5),(20,364,'透氣',5),(21,365,'穿起來很舒適',5),(22,366,'符合期待',5),(23,367,'good',5),
(24,368,'耐穿又好看',4),(25,369,'CP很高',5),(1,370,'好穿',4),(2,371,'此設計符合需求',5),(3,372,'讚讚',5),
(4,373,'質感很好',5),(5,374,'透氣',4),(6,375,'穿起來很舒適',4),(7,376,'符合期待',5),(8,377,'good',5),
(9,378,'耐穿又好看',4),(10,379,'CP很高',5),(11,380,'好穿',5),(12,381,'此設計符合需求',5),(13,382,'讚讚',4),
(14,383,'質感很好',5),(15,384,'透氣',4),(16,385,'穿起來很舒適',5),(17,386,'符合期待',5),(18,387,'good',5),
(19,388,'耐穿又好看',4),(20,389,'CP很高',4),(21,390,'好穿',5),(22,391,'此設計符合需求',5),(23,392,'讚讚',5),
(24,393,'質感很好',5),(25,394,'透氣',5),(1,395,'穿起來很舒適',5),(2,396,'符合期待',4),(3,397,'good',5),
(4,398,'耐穿又好看',4),(5,399,'CP很高',5),(6,400,'好穿',5),(7,401,'此設計符合需求',5),(8,402,'讚讚',4),
(9,403,'質感很好',4),(10,404,'透氣',5),(11,405,'穿起來很舒適',4),(12,406,'符合期待',5),(13,407,'good',5),
(14,408,'耐穿又好看',5),(15,409,'CP很高',5),(16,410,'好穿',4),(17,411,'此設計符合需求',5),(18,412,'讚讚',4),
(19,413,'質感很好',5),(20,414,'透氣',5),(21,415,'穿起來很舒適',5),(22,416,'符合期待',4),(23,417,'good',4),
(24,418,'耐穿又好看',5),(25,419,'CP很高',5),(1,420,'好穿',5),(2,421,'此設計符合需求',4),(3,422,'讚讚',5),
(4,423,'質感很好',5),(5,424,'透氣',4),(6,425,'穿起來很舒適',5),(7,426,'符合期待',4),(8,427,'good',5),
(9,428,'耐穿又好看',5),(10,429,'CP很高',5),(11,430,'好穿',4),(12,431,'此設計符合需求',4),(13,432,'讚讚',5),
(14,433,'質感很好',5),(15,434,'透氣',5),(16,435,'穿起來很舒適',5),(17,436,'符合期待',5),(18,437,'good',5),
(19,438,'耐穿又好看',4),(20,439,'CP很高',5),(21,440,'好穿',4),(22,441,'此設計符合需求',5),(23,442,'讚讚',5),
(24,443,'質感很好',5),(25,444,'透氣',4),(1,445,'穿起來很舒適',4),(2,446,'符合期待',5),(3,447,'good',5),
(4,448,'耐穿又好看',5),(5,449,'CP很高',4),(6,450,'好穿',5),(7,451,'此設計符合需求',5),(8,452,'讚讚',4),
(9,453,'質感很好',5),(10,454,'透氣',4),(11,455,'穿起來很舒適',5),(12,456,'符合期待',5),(13,457,'good',5),
(14,458,'耐穿又好看',4),(15,459,'CP很高',4),(16,460,'好穿',5),(17,461,'此設計符合需求',5),(18,462,'讚讚',5),
(19,463,'質感很好',5),(20,464,'透氣',5),(21,465,'穿起來很舒適',5),(22,466,'符合期待',4),(23,467,'good',5),
(24,468,'耐穿又好看',4),(25,469,'CP很高',5),(1,470,'好穿',5),(2,471,'此設計符合需求',5),(3,472,'讚讚',4),
(4,473,'質感很好',4),(5,474,'透氣',5),(6,475,'穿起來很舒適',5),(7,476,'符合期待',5),(8,477,'good',5),
(9,478,'耐穿又好看',5),(10,479,'CP很高',5),(11,480,'好穿',4),(12,481,'此設計符合需求',5),(13,482,'讚讚',4),
(14,483,'質感很好',5),(15,484,'透氣',5),(16,485,'穿起來很舒適',5),(17,486,'符合期待',4),(18,487,'good',4),
(19,488,'耐穿又好看',5),(20,489,'CP很高',5),(21,490,'好穿',5),(22,491,'此設計符合需求',5),(23,492,'讚讚',4),
(24,493,'質感很好',5),(25,494,'透氣',4),(1,495,'穿起來很舒適',5),(2,496,'符合期待',4),(3,497,'good',5),
(4,498,'耐穿又好看',5),(5,499,'CP很高',5),(6,500,'好穿',4),(7,501,'此設計符合需求',4),(8,502,'讚讚',5),
(9,503,'質感很好',5),(10,504,'透氣',5),(11,505,'穿起來很舒適',5),(12,506,'符合期待',5),(13,507,'good',5),
(16,510,'好穿',4),(17,511,'此設計符合需求',5),(18,512,'讚讚',5),(19,513,'質感很好',5),(20,514,'透氣',4),
(21,515,'穿起來很舒適',4),(22,516,'符合期待',5),(23,517,'good',5),(24,518,'耐穿又好看',5),(25,519,'CP很高',5),
(1,520,'好穿',5),(2,521,'此設計符合需求',5),(3,522,'讚讚',4),(4,523,'質感很好',5),(5,524,'透氣',4),
(6,525,'穿起來很舒適',5),(7,526,'符合期待',5),(8,527,'good',5),(9,528,'耐穿又好看',4),(10,529,'CP很高',4),
(11,530,'好穿',5),(12,531,'此設計符合需求',4),(13,532,'讚讚',5),(14,533,'質感很好',5),(15,534,'透氣',5),
(16,535,'穿起來很舒適',5),(17,536,'符合期待',4),(18,537,'good',5),(19,538,'耐穿又好看',4),(20,539,'CP很高',5),
(21,540,'好穿',5),(22,541,'此設計符合需求',5),(23,542,'讚讚',4),(24,543,'質感很好',4),(25,544,'透氣',5),
(1,545,'穿起來很舒適',5),(2,546,'符合期待',5),(3,547,'good',4),(4,548,'耐穿又好看',5),(5,549,'CP很高',4),
(6,550,'好穿',5),(7,551,'此設計符合需求',5),(8,552,'讚讚',5),(9,553,'質感很好',4),(10,554,'透氣',4),
(11,555,'穿起來很舒適',5),(12,556,'符合期待',4),(13,557,'good',5),(14,558,'耐穿又好看',4),(15,559,'CP很高',5),
(16,560,'好穿',5),(17,561,'此設計符合需求',4),(18,562,'讚讚',5),(19,563,'質感很好',4),(20,564,'透氣',5),
(21,565,'穿起來很舒適',5),(22,566,'符合期待',5),(23,567,'good',4),(24,568,'耐穿又好看',4),(25,569,'CP很高',5),
(1,570,'好穿',4),(2,571,'此設計符合需求',5),(3,572,'讚讚',5),(4,573,'質感很好',5),(5,574,'透氣',5),
(6,575,'穿起來很舒適',4),(7,576,'符合期待',5),(8,577,'good',4),(9,578,'耐穿又好看',5),(10,579,'CP很高',5),
(11,580,'好穿',5),(12,581,'此設計符合需求',4),(13,582,'讚讚',4),(14,583,'質感很好',5),(15,584,'透氣',5),
(16,585,'穿起來很舒適',5),(17,586,'符合期待',5),(18,587,'good',5),(19,588,'耐穿又好看',5),(1,589,'好看又好穿',5),
(2,590,'讚讚',5),(3,591,'good',4),(4,592,'絕佳CP值',5),(5,593,'物超所值',5),(6,594,'超讚的喇',4),
(7,595,'舒服 好穿',5),(8,596,'超美',5),(9,597,'好看又好穿',5),(10,598,'讚讚',5),(11,599,'good',4),
(12,600,'絕佳CP值',5),(13,601,'物超所值',5),(14,602,'超讚的喇',4),(15,603,'舒服 好穿',5),(16,604,'超美',5),
(17,605,'好看又好穿',5),(18,606,'讚讚',5),(19,607,'good',4),(20,608,'絕佳CP值',5),(21,609,'物超所值',5),
(22,610,'超讚的喇',4),(23,611,'舒服 好穿',5),(24,612,'超美',5),(25,613,'好看又好穿',5),(1,614,'讚讚',5),
(2,615,'good',4),(3,616,'絕佳CP值',5),(4,617,'物超所值',5),(5,618,'超讚的喇',4),(6,619,'舒服 好穿',5),
(7,620,'超美',5),(8,621,'好看又好穿',5),(9,622,'讚讚',5),(10,623,'good',4),(11,624,'絕佳CP值',5),
(12,625,'物超所值',5),(13,626,'超讚的喇',4),(14,627,'舒服 好穿',5),(15,628,'超美',5),(16,629,'好看又好穿',5),
(17,630,'讚讚',5),(18,631,'good',4),(19,632,'絕佳CP值',5),(20,633,'物超所值',5),(21,634,'超讚的喇',4),
(22,635,'舒服 好穿',5),(23,636,'超美',5),(24,637,'好看又好穿',5),(25,638,'讚讚',5),(1,639,'good',4),
(2,640,'絕佳CP值',5),(3,641,'物超所值',5),(4,642,'超讚的喇',4),(5,643,'舒服 好穿',5),(6,644,'超美',5),
(7,645,'好看又好穿',5),(8,646,'讚讚',5),(9,647,'good',4),(10,648,'絕佳CP值',5),(11,649,'物超所值',5),
(12,650,'超讚的喇',4),(13,651,'舒服 好穿',5),(14,652,'超美',5),(15,653,'好看又好穿',5),(16,654,'讚讚',5),
(17,655,'good',4),(18,656,'絕佳CP值',5),(19,657,'物超所值',5),(20,658,'超讚的喇',4),(21,659,'舒服 好穿',5),
(22,660,'超美',5),(23,661,'好看又好穿',5),(24,662,'讚讚',5),(25,663,'good',4),(1,664,'絕佳CP值',5),
(2,665,'物超所值',5),(3,666,'超讚的喇',4),(4,667,'舒服 好穿',5),(5,668,'超美',5),(6,669,'好看又好穿',5),
(7,670,'讚讚',5),(8,671,'good',4),(9,672,'絕佳CP值',5),(10,673,'物超所值',5),(11,674,'超讚的喇',4),
(12,675,'舒服 好穿',5),(13,676,'超美',5),(14,677,'好看又好穿',5),(15,678,'讚讚',5),(16,679,'good',4),
(17,680,'絕佳CP值',5),(18,681,'物超所值',5),(19,682,'超讚的喇',4),(20,683,'舒服 好穿',5),(21,684,'超美',5),
(22,685,'好看又好穿',5),(23,686,'讚讚',5),(24,687,'good',4),(25,688,'絕佳CP值',5),(1,689,'物超所值',5),
(2,690,'超讚的喇',4),(3,691,'舒服 好穿',5),(4,692,'超美',5),(5,693,'好看又好穿',5),(6,694,'讚讚',5),
(7,695,'good',4),(8,696,'絕佳CP值',5),(9,697,'物超所值',5),(10,698,'超讚的喇',4)


