

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
SET IDENTITY_INSERT [dbo].ShoppingCarts ON 
INSERT INTO ShoppingCarts(fk_MemberID)
VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25);
SET IDENTITY_INSERT [dbo].[ShoppingCarts] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 
INSERT INTO CartItems(fk_CardId,fk_ProductId,Description,Qty)
VALUES (1,1,'',2),
(1,6,'',1),
(1,663,'',3),
(1,670,'',2),
(3,6,'',1);
SET IDENTITY_INSERT [dbo].[CartItems] OFF
go
SET IDENTITY_INSERT [dbo].[CouponSendings] ON 
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

SET IDENTITY_INSERT [dbo].[CouponSendings] off 
GO