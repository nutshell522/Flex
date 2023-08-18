using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace FlexCoreService.Models
{
    public partial class AppDbContext : DbContext
    {
        public AppDbContext()
        {
        }

        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Activity> Activities { get; set; } = null!;
        public virtual DbSet<ActivityCategory> ActivityCategories { get; set; } = null!;
        public virtual DbSet<ActivityImg> ActivityImgs { get; set; } = null!;
        public virtual DbSet<ActivityStatus> ActivityStatuses { get; set; } = null!;
        public virtual DbSet<AlternateAddress> AlternateAddresses { get; set; } = null!;
        public virtual DbSet<BlackList> BlackLists { get; set; } = null!;
        public virtual DbSet<Branch> Branches { get; set; } = null!;
        public virtual DbSet<CartItem> CartItems { get; set; } = null!;
        public virtual DbSet<ColorCategory> ColorCategories { get; set; } = null!;
        public virtual DbSet<Coupon> Coupons { get; set; } = null!;
        public virtual DbSet<CouponCategory> CouponCategories { get; set; } = null!;
        public virtual DbSet<CouponSending> CouponSendings { get; set; } = null!;
        public virtual DbSet<CustomizedMaterial> CustomizedMaterials { get; set; } = null!;
        public virtual DbSet<CustomizedOrder> CustomizedOrders { get; set; } = null!;
        public virtual DbSet<CustomizedShoesPo> CustomizedShoesPos { get; set; } = null!;
        public virtual DbSet<Department> Departments { get; set; } = null!;
        public virtual DbSet<Discount> Discounts { get; set; } = null!;
        public virtual DbSet<Favorite> Favorites { get; set; } = null!;
        public virtual DbSet<JobTitle> JobTitles { get; set; } = null!;
        public virtual DbSet<LogisticsCompany> LogisticsCompanies { get; set; } = null!;
        public virtual DbSet<Member> Members { get; set; } = null!;
        public virtual DbSet<MemberPoint> MemberPoints { get; set; } = null!;
        public virtual DbSet<MembershipLevel> MembershipLevels { get; set; } = null!;
        public virtual DbSet<OneToOneReservation> OneToOneReservations { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderItem> OrderItems { get; set; } = null!;
        public virtual DbSet<OrderStatus> OrderStatuses { get; set; } = null!;
        public virtual DbSet<PayMethod> PayMethods { get; set; } = null!;
        public virtual DbSet<PayStatus> PayStatuses { get; set; } = null!;
        public virtual DbSet<PointHistory> PointHistories { get; set; } = null!;
        public virtual DbSet<PointManage> PointManages { get; set; } = null!;
        public virtual DbSet<PointTradeIn> PointTradeIns { get; set; } = null!;
        public virtual DbSet<Privilege> Privileges { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<ProductCategory> ProductCategories { get; set; } = null!;
        public virtual DbSet<ProductComment> ProductComments { get; set; } = null!;
        public virtual DbSet<ProductGroup> ProductGroups { get; set; } = null!;
        public virtual DbSet<ProductImg> ProductImgs { get; set; } = null!;
        public virtual DbSet<ProductSubCategory> ProductSubCategories { get; set; } = null!;
        public virtual DbSet<ProjectTag> ProjectTags { get; set; } = null!;
        public virtual DbSet<ProjectTagItem> ProjectTagItems { get; set; } = null!;
        public virtual DbSet<ReservationImg> ReservationImgs { get; set; } = null!;
        public virtual DbSet<ReservationStatus> ReservationStatuses { get; set; } = null!;
        public virtual DbSet<Return> Returns { get; set; } = null!;
        public virtual DbSet<ReturnReson> ReturnResons { get; set; } = null!;
        public virtual DbSet<SalesCategory> SalesCategories { get; set; } = null!;
        public virtual DbSet<ShoesCategory> ShoesCategories { get; set; } = null!;
        public virtual DbSet<ShoesChoose> ShoesChooses { get; set; } = null!;
        public virtual DbSet<ShoesColorCategory> ShoesColorCategories { get; set; } = null!;
        public virtual DbSet<ShoesGroup> ShoesGroups { get; set; } = null!;
        public virtual DbSet<ShoesOrder> ShoesOrders { get; set; } = null!;
        public virtual DbSet<ShoesPicture> ShoesPictures { get; set; } = null!;
        public virtual DbSet<ShoesSize> ShoesSizes { get; set; } = null!;
        public virtual DbSet<ShoppingCart> ShoppingCarts { get; set; } = null!;
        public virtual DbSet<SizeCategory> SizeCategories { get; set; } = null!;
        public virtual DbSet<Speaker> Speakers { get; set; } = null!;
        public virtual DbSet<SpeakerField> SpeakerFields { get; set; } = null!;
        public virtual DbSet<Staff> Staffs { get; set; } = null!;
        public virtual DbSet<StaffPermission> StaffPermissions { get; set; } = null!;
        public virtual DbSet<Supplier> Suppliers { get; set; } = null!;
        public virtual DbSet<Type> Types { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=.;Database=Flex;Trusted_Connection=True;MultipleActiveResultSets=true;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Activity>(entity =>
            {
                entity.Property(e => e.ActivityBookEndTime).HasColumnType("datetime");

                entity.Property(e => e.ActivityBookStartTime).HasColumnType("datetime");

                entity.Property(e => e.ActivityDate).HasColumnType("datetime");

                entity.Property(e => e.ActivityDescription).HasMaxLength(300);

                entity.Property(e => e.ActivityName).HasMaxLength(50);

                entity.Property(e => e.ActivityPlace).HasMaxLength(100);

                entity.Property(e => e.FkActivityCategoryId).HasColumnName("fk_ActivityCategoryId");

                entity.Property(e => e.FkActivityStatusId)
                    .HasColumnName("fk_ActivityStatusId")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.FkSpeakerId).HasColumnName("fk_SpeakerId");

                entity.HasOne(d => d.FkActivityCategory)
                    .WithMany(p => p.Activities)
                    .HasForeignKey(d => d.FkActivityCategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Activitie__fk_Ac__3D2915A8");

                entity.HasOne(d => d.FkActivityStatus)
                    .WithMany(p => p.Activities)
                    .HasForeignKey(d => d.FkActivityStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Activitie__fk_Ac__3E1D39E1");

                entity.HasOne(d => d.FkSpeaker)
                    .WithMany(p => p.Activities)
                    .HasForeignKey(d => d.FkSpeakerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Activitie__fk_Sp__3F115E1A");
            });

            modelBuilder.Entity<ActivityCategory>(entity =>
            {
                entity.Property(e => e.ActivityCategoryName).HasMaxLength(50);
            });

            modelBuilder.Entity<ActivityImg>(entity =>
            {
                entity.ToTable("ActivityImg");

                entity.Property(e => e.FkActivityId).HasColumnName("fk_ActivityId");

                entity.Property(e => e.ImgPath).HasMaxLength(300);

                entity.HasOne(d => d.FkActivity)
                    .WithMany(p => p.ActivityImgs)
                    .HasForeignKey(d => d.FkActivityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ActivityI__fk_Ac__4F47C5E3");
            });

            modelBuilder.Entity<ActivityStatus>(entity =>
            {
                entity.HasIndex(e => e.ActivityStatusDescription, "UQ__Activity__732635EC97629346")
                    .IsUnique();

                entity.Property(e => e.ActivityStatusDescription).HasMaxLength(50);
            });

            modelBuilder.Entity<AlternateAddress>(entity =>
            {
                entity.HasKey(e => e.AddressId)
                    .HasName("PK__Alternat__091C2AFBD3B2ED1E");

                entity.HasIndex(e => e.FkMemberId, "UQ__Alternat__3B54230C0458ABB6")
                    .IsUnique();

                entity.Property(e => e.AlternateAddress1).HasMaxLength(300);

                entity.Property(e => e.AlternateAddress2).HasMaxLength(300);

                entity.Property(e => e.FkMemberId).HasColumnName("fk_MemberId");

                entity.HasOne(d => d.FkMember)
                    .WithOne(p => p.AlternateAddress)
                    .HasForeignKey<AlternateAddress>(d => d.FkMemberId)
                    .HasConstraintName("FK__Alternate__fk_Me__3D2915A8");
            });

            modelBuilder.Entity<BlackList>(entity =>
            {
                entity.Property(e => e.Behavior).HasMaxLength(30);

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Branch>(entity =>
            {
                entity.HasIndex(e => e.BranchName, "UQ__Branches__3903DB03CA52B5AB")
                    .IsUnique();

                entity.HasIndex(e => e.BranchAddress, "UQ__Branches__F50DE17A48BB97A7")
                    .IsUnique();

                entity.Property(e => e.BranchAddress).HasMaxLength(100);

                entity.Property(e => e.BranchName).HasMaxLength(50);
            });

            modelBuilder.Entity<CartItem>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(700);

                entity.Property(e => e.FkCardId).HasColumnName("fk_CardId");

                entity.Property(e => e.FkProductId).HasColumnName("fk_ProductId");

                entity.HasOne(d => d.FkCard)
                    .WithMany(p => p.CartItems)
                    .HasForeignKey(d => d.FkCardId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CartItem_CartItem");

                entity.HasOne(d => d.FkProduct)
                    .WithMany(p => p.CartItems)
                    .HasForeignKey(d => d.FkProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CartItems_ProductGroups");
            });

            modelBuilder.Entity<ColorCategory>(entity =>
            {
                entity.HasKey(e => e.ColorId)
                    .HasName("PK_ColorCategory");

                entity.Property(e => e.ColorName).HasMaxLength(50);
            });

            modelBuilder.Entity<Coupon>(entity =>
            {
                entity.Property(e => e.CouponCode).HasMaxLength(50);

                entity.Property(e => e.CouponDescription).HasMaxLength(100);

                entity.Property(e => e.CouponName).HasMaxLength(50);

                entity.Property(e => e.EndDate).HasColumnType("datetime");

                entity.Property(e => e.FkCouponCategoryId).HasColumnName("fk_CouponCategoryId");

                entity.Property(e => e.FkRequiredProjectTagId).HasColumnName("fk_RequiredProjectTagID");

                entity.Property(e => e.StartDate).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((1))");

                entity.HasOne(d => d.FkCouponCategory)
                    .WithMany(p => p.Coupons)
                    .HasForeignKey(d => d.FkCouponCategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Coupon_CouponCategory");

                entity.HasOne(d => d.FkRequiredProjectTag)
                    .WithMany(p => p.Coupons)
                    .HasForeignKey(d => d.FkRequiredProjectTagId)
                    .HasConstraintName("FK_Coupon_ProjectTag");
            });

            modelBuilder.Entity<CouponCategory>(entity =>
            {
                entity.Property(e => e.CouponCategoryId).ValueGeneratedNever();

                entity.Property(e => e.CouponCategoryName).HasMaxLength(20);
            });

            modelBuilder.Entity<CouponSending>(entity =>
            {
                entity.HasKey(e => e.SendingId)
                    .HasName("PK_CouponSending");

                entity.Property(e => e.EndDate).HasColumnType("datetime");

                entity.Property(e => e.FkCouponId).HasColumnName("fk_CouponId");

                entity.Property(e => e.FkMemberId).HasColumnName("fk_MemberId");

                entity.Property(e => e.RedeemedDate).HasColumnType("datetime");

                entity.Property(e => e.SentDate).HasColumnType("datetime");

                entity.Property(e => e.StartDate).HasColumnType("datetime");

                entity.HasOne(d => d.FkCoupon)
                    .WithMany(p => p.CouponSendings)
                    .HasForeignKey(d => d.FkCouponId)
                    .HasConstraintName("FK_CouponSending_Coupon");

                entity.HasOne(d => d.FkMember)
                    .WithMany(p => p.CouponSendings)
                    .HasForeignKey(d => d.FkMemberId)
                    .HasConstraintName("FK_CouponSendings_Members");
            });

            modelBuilder.Entity<CustomizedMaterial>(entity =>
            {
                entity.HasKey(e => e.ShoesmaterialId)
                    .HasName("PK__Customiz__06EFE12DFA7467D4");

                entity.ToTable("Customized_materials");

                entity.Property(e => e.ShoesmaterialId).HasColumnName("Shoesmaterial_Id");

                entity.Property(e => e.MaterialName)
                    .HasMaxLength(50)
                    .HasColumnName("material_Name");
            });

            modelBuilder.Entity<CustomizedOrder>(entity =>
            {
                entity.HasKey(e => e.CustomizedId)
                    .HasName("PK__Customiz__AFADABDDFA087043");

                entity.Property(e => e.CustomizedId).HasColumnName("Customized_Id");

                entity.Property(e => e.CustomizedEdgeProtection).HasColumnName("Customized_EdgeProtection");

                entity.Property(e => e.CustomizedEyelet).HasColumnName("Customized_Eyelet");

                entity.Property(e => e.CustomizedNumber)
                    .HasMaxLength(6000)
                    .IsUnicode(false)
                    .HasColumnName("Customized_number");

                entity.Property(e => e.CustomizedRear).HasColumnName("Customized_Rear");

                entity.Property(e => e.CustomizedShoesId).HasColumnName("Customized_Shoes_Id");

                entity.Property(e => e.CustomizedToe).HasColumnName("Customized_Toe");

                entity.Property(e => e.CustomizedTongue).HasColumnName("Customized_Tongue");

                entity.Property(e => e.FkForMemberCustomizedId).HasColumnName("Fk_ForMemberCustomized_Id");

                entity.Property(e => e.OrderCreateTime).HasColumnType("datetime");

                entity.Property(e => e.OrderEditTime).HasColumnType("datetime");

                entity.Property(e => e.Remark).HasMaxLength(254);

                entity.HasOne(d => d.CustomizedEdgeProtectionNavigation)
                    .WithMany(p => p.CustomizedOrderCustomizedEdgeProtectionNavigations)
                    .HasForeignKey(d => d.CustomizedEdgeProtection)
                    .HasConstraintName("FK__Customize__Custo__58D1301D");

                entity.HasOne(d => d.CustomizedEyeletNavigation)
                    .WithMany(p => p.CustomizedOrderCustomizedEyeletNavigations)
                    .HasForeignKey(d => d.CustomizedEyelet)
                    .HasConstraintName("FK__Customize__Custo__57DD0BE4");

                entity.HasOne(d => d.CustomizedRearNavigation)
                    .WithMany(p => p.CustomizedOrderCustomizedRearNavigations)
                    .HasForeignKey(d => d.CustomizedRear)
                    .HasConstraintName("FK__Customize__Custo__59C55456");

                entity.HasOne(d => d.CustomizedShoes)
                    .WithMany(p => p.CustomizedOrders)
                    .HasForeignKey(d => d.CustomizedShoesId)
                    .HasConstraintName("FK__Customize__Custo__46B27FE2");

                entity.HasOne(d => d.CustomizedToeNavigation)
                    .WithMany(p => p.CustomizedOrderCustomizedToeNavigations)
                    .HasForeignKey(d => d.CustomizedToe)
                    .HasConstraintName("FK__Customize__Custo__5BAD9CC8");

                entity.HasOne(d => d.CustomizedTongueNavigation)
                    .WithMany(p => p.CustomizedOrderCustomizedTongueNavigations)
                    .HasForeignKey(d => d.CustomizedTongue)
                    .HasConstraintName("FK__Customize__Custo__5AB9788F");

                entity.HasOne(d => d.FkForMemberCustomized)
                    .WithMany(p => p.CustomizedOrders)
                    .HasForeignKey(d => d.FkForMemberCustomizedId)
                    .HasConstraintName("FK_CustomizedOrders_Members");
            });

            modelBuilder.Entity<CustomizedShoesPo>(entity =>
            {
                entity.HasKey(e => e.ShoesProductId)
                    .HasName("PK__Customiz__D7D2FD91792B994F");

                entity.ToTable("CustomizedShoesPo");

                entity.Property(e => e.DataCreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DataEditTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.EndTime).HasColumnType("datetime");

                entity.Property(e => e.FkShoesCategoryId).HasColumnName("fk_ShoesCategoryId");

                entity.Property(e => e.FkShoesColorId).HasColumnName("fk_ShoesColorId");

                entity.Property(e => e.ShoesDescription).HasMaxLength(254);

                entity.Property(e => e.ShoesName).HasMaxLength(254);

                entity.Property(e => e.ShoesOrigin).HasMaxLength(50);

                entity.Property(e => e.StartTime).HasColumnType("datetime");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasDefaultValueSql("('false')");

                entity.HasOne(d => d.FkShoesCategory)
                    .WithMany(p => p.CustomizedShoesPos)
                    .HasForeignKey(d => d.FkShoesCategoryId)
                    .HasConstraintName("FK__Customize__fk_Sh__44CA3770");

                entity.HasOne(d => d.FkShoesColor)
                    .WithMany(p => p.CustomizedShoesPos)
                    .HasForeignKey(d => d.FkShoesColorId)
                    .HasConstraintName("FK__Customize__fk_Sh__45BE5BA9");
            });

            modelBuilder.Entity<Department>(entity =>
            {
                entity.Property(e => e.DepartmentName).HasMaxLength(50);
            });

            modelBuilder.Entity<Discount>(entity =>
            {
                entity.Property(e => e.DiscountDescription).HasMaxLength(100);

                entity.Property(e => e.DiscountName).HasMaxLength(20);

                entity.Property(e => e.EndDate).HasColumnType("datetime");

                entity.Property(e => e.FkProjectTagId).HasColumnName("fk_ProjectTagId");

                entity.Property(e => e.StartDate).HasColumnType("datetime");

                entity.Property(e => e.Status).HasDefaultValueSql("((1))");

                entity.HasOne(d => d.FkProjectTag)
                    .WithMany(p => p.Discounts)
                    .HasForeignKey(d => d.FkProjectTagId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK_Discount_DiscountGroup");
            });

            modelBuilder.Entity<Favorite>(entity =>
            {
                entity.Property(e => e.FkMemberId).HasColumnName("fk_memberId");

                entity.Property(e => e.FkProductId)
                    .HasMaxLength(254)
                    .IsUnicode(false)
                    .HasColumnName("fk_productId");

                entity.HasOne(d => d.FkMember)
                    .WithMany(p => p.Favorites)
                    .HasForeignKey(d => d.FkMemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Favorites_Members");

                entity.HasOne(d => d.FkProduct)
                    .WithMany(p => p.Favorites)
                    .HasForeignKey(d => d.FkProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Favorites_Favorites");
            });

            modelBuilder.Entity<JobTitle>(entity =>
            {
                entity.HasKey(e => e.TitleId)
                    .HasName("PK__JobTitle__75758986DFA010AD");

                entity.HasIndex(e => e.TitleName, "UQ__JobTitle__252BE89C516695E0")
                    .IsUnique();

                entity.Property(e => e.FkStaffPermissions).HasColumnName("fk_StaffPermissions");

                entity.Property(e => e.TitleName).HasMaxLength(50);
            });

            modelBuilder.Entity<LogisticsCompany>(entity =>
            {
                entity.ToTable("logistics_companies");

                entity.Property(e => e.LogisticsDescription)
                    .HasMaxLength(50)
                    .HasColumnName("logistics_description");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasColumnName("name");

                entity.Property(e => e.Tel)
                    .HasMaxLength(12)
                    .IsUnicode(false)
                    .HasColumnName("tel");
            });

            modelBuilder.Entity<Member>(entity =>
            {
                entity.HasIndex(e => e.Mobile, "UQ__Members__6FAE0782E1A56EB7")
                    .IsUnique();

                entity.HasIndex(e => e.Email, "UQ__Members__A9D1053442354E1D")
                    .IsUnique();

                entity.HasIndex(e => e.Account, "UQ__Members__B0C3AC46ED2152FF")
                    .IsUnique();

                entity.Property(e => e.Account)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Birthday).HasColumnType("date");

                entity.Property(e => e.CommonAddress).HasMaxLength(100);

                entity.Property(e => e.ConfirmCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Email).HasMaxLength(300);

                entity.Property(e => e.EncryptedPassword)
                    .HasMaxLength(70)
                    .IsUnicode(false);

                entity.Property(e => e.FkBlackListId).HasColumnName("fk_BlackListId");

                entity.Property(e => e.FkLevelId).HasColumnName("fk_LevelId");

                entity.Property(e => e.Mobile)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Name).HasMaxLength(30);

                entity.Property(e => e.Registration)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.FkBlackList)
                    .WithMany(p => p.Members)
                    .HasForeignKey(d => d.FkBlackListId)
                    .HasConstraintName("FK__Members__fk_Blac__503BEA1C");

                entity.HasOne(d => d.FkLevel)
                    .WithMany(p => p.Members)
                    .HasForeignKey(d => d.FkLevelId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Members__fk_Leve__00DF2177");
            });

            modelBuilder.Entity<MemberPoint>(entity =>
            {
                entity.HasKey(e => e.MemberPointsId)
                    .HasName("PK__MemberPo__8D672C97D8EFE351");

                entity.HasIndex(e => e.FkMemberId, "UQ__MemberPo__3B54230C8C81DA21")
                    .IsUnique();

                entity.Property(e => e.FkMemberId).HasColumnName("fk_MemberId");

                entity.HasOne(d => d.FkMember)
                    .WithOne(p => p.MemberPoint)
                    .HasForeignKey<MemberPoint>(d => d.FkMemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__MemberPoi__fk_Me__4E53A1AA");
            });

            modelBuilder.Entity<MembershipLevel>(entity =>
            {
                entity.HasKey(e => e.LevelId)
                    .HasName("PK__Membersh__09F03C26F7CA5148");

                entity.Property(e => e.Description).HasMaxLength(300);

                entity.Property(e => e.LevelName).HasMaxLength(10);

                entity.Property(e => e.MinSpending)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.HasMany(d => d.FkPrivileges)
                    .WithMany(p => p.FkLevels)
                    .UsingEntity<Dictionary<string, object>>(
                        "MembershipLevelPrivilege",
                        l => l.HasOne<Privilege>().WithMany().HasForeignKey("FkPrivilegeId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Membershi__fk_Pr__531856C7"),
                        r => r.HasOne<MembershipLevel>().WithMany().HasForeignKey("FkLevelId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Membershi__fk_Le__01D345B0"),
                        j =>
                        {
                            j.HasKey("FkLevelId", "FkPrivilegeId").HasName("PK__Membersh__580C8EAAB5A3BCD1");

                            j.ToTable("MembershipLevelPrivileges");

                            j.IndexerProperty<int>("FkLevelId").HasColumnName("fk_LevelId");

                            j.IndexerProperty<int>("FkPrivilegeId").HasColumnName("fk_PrivilegeId");
                        });
            });

            modelBuilder.Entity<OneToOneReservation>(entity =>
            {
                entity.HasKey(e => e.ReservationId)
                    .HasName("PK__OneToOne__B7EE5F2402441AB0");

                entity.Property(e => e.FkBookerId).HasColumnName("fk_BookerId");

                entity.Property(e => e.FkBranchId).HasColumnName("fk_BranchId");

                entity.Property(e => e.FkReservationSpeakerId).HasColumnName("fk_ReservationSpeakerId");

                entity.Property(e => e.FkReservationStatusId).HasColumnName("fk_ReservationStatusId");

                entity.Property(e => e.ReservationCreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ReservationEndTime).HasColumnType("datetime");

                entity.Property(e => e.ReservationStartTime).HasColumnType("datetime");

                entity.HasOne(d => d.FkBooker)
                    .WithMany(p => p.OneToOneReservations)
                    .HasForeignKey(d => d.FkBookerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OneToOneReservations_Members");

                entity.HasOne(d => d.FkBranch)
                    .WithMany(p => p.OneToOneReservations)
                    .HasForeignKey(d => d.FkBranchId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OneToOneR__fk_Br__65370702");

                entity.HasOne(d => d.FkReservationSpeaker)
                    .WithMany(p => p.OneToOneReservations)
                    .HasForeignKey(d => d.FkReservationSpeakerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OneToOneR__fk_Re__662B2B3B");

                entity.HasOne(d => d.FkReservationStatus)
                    .WithMany(p => p.OneToOneReservations)
                    .HasForeignKey(d => d.FkReservationStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OneToOneR__fk_Re__671F4F74");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.ToTable("orders");

                entity.Property(e => e.Cellphone)
                    .HasMaxLength(12)
                    .IsUnicode(false)
                    .HasColumnName("cellphone");

                entity.Property(e => e.Close).HasColumnName("close");

                entity.Property(e => e.CloseTime)
                    .HasColumnType("datetime")
                    .HasColumnName("close_time");

                entity.Property(e => e.CouponDiscount).HasColumnName("coupon_discount");

                entity.Property(e => e.CouponName)
                    .HasMaxLength(50)
                    .HasColumnName("coupon_name");

                entity.Property(e => e.FkMemberId).HasColumnName("fk_member_Id");

                entity.Property(e => e.FkTypeId).HasColumnName("fk_typeId");

                entity.Property(e => e.Freight).HasColumnName("freight");

                entity.Property(e => e.LogisticsCompanyId).HasColumnName("logistics_company_Id");

                entity.Property(e => e.OrderDescription)
                    .HasMaxLength(50)
                    .HasColumnName("order_description");

                entity.Property(e => e.OrderStatusId).HasColumnName("order_status_Id");

                entity.Property(e => e.Ordertime)
                    .HasColumnType("datetime")
                    .HasColumnName("ordertime");

                entity.Property(e => e.PayMethodId).HasColumnName("pay_method_Id");

                entity.Property(e => e.PayStatusId).HasColumnName("pay_status_Id");

                entity.Property(e => e.Receipt)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("receipt");

                entity.Property(e => e.Receiver)
                    .HasMaxLength(50)
                    .HasColumnName("receiver");

                entity.Property(e => e.RecipientAddress)
                    .HasMaxLength(50)
                    .HasColumnName("recipient_address");

                entity.Property(e => e.TotalPrice).HasColumnName("total_price");

                entity.Property(e => e.TotalQuantity).HasColumnName("total_quantity");

                entity.HasOne(d => d.FkMember)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.FkMemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__orders__fk_membe__5BAD9CC8");

                entity.HasOne(d => d.FkType)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.FkTypeId)
                    .HasConstraintName("FK_orders_Type");

                entity.HasOne(d => d.LogisticsCompany)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.LogisticsCompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__orders__logistic__5BAD9CC8");

                entity.HasOne(d => d.OrderStatus)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.OrderStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__orders__order_st__5CA1C101");

                entity.HasOne(d => d.PayMethod)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.PayMethodId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__orders__pay_meth__5D95E53A");

                entity.HasOne(d => d.PayStatus)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.PayStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__orders__pay_stat__5E8A0973");
            });

            modelBuilder.Entity<OrderItem>(entity =>
            {
                entity.ToTable("orderItems");

                entity.Property(e => e.DiscountName)
                    .HasMaxLength(50)
                    .HasColumnName("discount_name");

                entity.Property(e => e.DiscountSubtotal).HasColumnName("discount_subtotal");

                entity.Property(e => e.FkTypeId).HasColumnName("fk_typeId");

                entity.Property(e => e.ItemsDescription)
                    .HasMaxLength(50)
                    .HasColumnName("Items_description");

                entity.Property(e => e.OrderId).HasColumnName("order_Id");

                entity.Property(e => e.PerPrice).HasColumnName("per_price");

                entity.Property(e => e.ProductName)
                    .HasMaxLength(50)
                    .HasColumnName("product_name");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.Property(e => e.Subtotal).HasColumnName("subtotal");

                entity.HasOne(d => d.FkType)
                    .WithMany(p => p.OrderItems)
                    .HasForeignKey(d => d.FkTypeId)
                    .HasConstraintName("FK_orderItems_Type");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderItems)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__orderItem__order__1B9317B3");
            });

            modelBuilder.Entity<OrderStatus>(entity =>
            {
                entity.ToTable("order_statuses");

                entity.Property(e => e.OrderStatus1)
                    .HasMaxLength(50)
                    .HasColumnName("order_status");
            });

            modelBuilder.Entity<PayMethod>(entity =>
            {
                entity.ToTable("pay_methods");

                entity.Property(e => e.PayMethod1)
                    .HasMaxLength(50)
                    .HasColumnName("pay_method");
            });

            modelBuilder.Entity<PayStatus>(entity =>
            {
                entity.ToTable("pay_statuses");

                entity.Property(e => e.PayStatus1)
                    .HasMaxLength(50)
                    .HasColumnName("pay_status");
            });

            modelBuilder.Entity<PointHistory>(entity =>
            {
                entity.Property(e => e.EffectiveDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.FkMemberId).HasColumnName("fk_MemberId");

                entity.Property(e => e.FkMemberPointsId).HasColumnName("fk_MemberPointsId");

                entity.Property(e => e.FkOrderId).HasColumnName("fk_OrderId");

                entity.Property(e => e.FkTypeId).HasColumnName("fk_TypeId");

                entity.HasOne(d => d.FkMember)
                    .WithMany(p => p.PointHistories)
                    .HasForeignKey(d => d.FkMemberId)
                    .HasConstraintName("FK__PointHist__fk_Me__03BB8E22");

                entity.HasOne(d => d.FkMemberPoints)
                    .WithMany(p => p.PointHistories)
                    .HasForeignKey(d => d.FkMemberPointsId)
                    .HasConstraintName("FK_PointHistories_MemberPoints");

                entity.HasOne(d => d.FkOrder)
                    .WithMany(p => p.PointHistories)
                    .HasForeignKey(d => d.FkOrderId)
                    .HasConstraintName("FK_PointHistories_orders");

                entity.HasOne(d => d.FkType)
                    .WithMany(p => p.PointHistories)
                    .HasForeignKey(d => d.FkTypeId)
                    .HasConstraintName("FK_PointHistories_Type");
            });

            modelBuilder.Entity<PointManage>(entity =>
            {
                entity.ToTable("PointManage");

                entity.Property(e => e.FkTypeId).HasColumnName("fk_TypeId");

                entity.Property(e => e.PointExpirationDate).HasColumnType("datetime");

                entity.HasOne(d => d.FkType)
                    .WithMany(p => p.PointManages)
                    .HasForeignKey(d => d.FkTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PointManage_Type");
            });

            modelBuilder.Entity<PointTradeIn>(entity =>
            {
                entity.ToTable("PointTradeIn");

                entity.Property(e => e.EffectiveDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ExpirationDate).HasColumnType("datetime");

                entity.Property(e => e.FkMemberId).HasColumnName("fk_MemberId");

                entity.Property(e => e.FkOrderId).HasColumnName("fk_OrderId");

                entity.Property(e => e.GetPoints)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.GiftThreshold).HasMaxLength(30);

                entity.Property(e => e.MaxGetPoints)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.HasOne(d => d.FkMember)
                    .WithMany(p => p.PointTradeIns)
                    .HasForeignKey(d => d.FkMemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PointTradeIn_Members");

                entity.HasOne(d => d.FkOrder)
                    .WithMany(p => p.PointTradeIns)
                    .HasForeignKey(d => d.FkOrderId)
                    .HasConstraintName("FK_PointTradeIn_orders");
            });

            modelBuilder.Entity<Privilege>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(300);

                entity.Property(e => e.PrivilegeName).HasMaxLength(30);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.ProductId)
                    .HasMaxLength(254)
                    .IsUnicode(false)
                    .HasDefaultValueSql("('unique')");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.EditTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.EndTime).HasColumnType("datetime");

                entity.Property(e => e.FkProductSubCategoryId).HasColumnName("fk_ProductSubCategoryId");

                entity.Property(e => e.ProductMaterial).HasMaxLength(50);

                entity.Property(e => e.ProductName).HasMaxLength(254);

                entity.Property(e => e.ProductOrigin).HasMaxLength(50);

                entity.Property(e => e.StartTime).HasColumnType("datetime");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasDefaultValueSql("('false')");

                entity.Property(e => e.Tag).HasMaxLength(100);

                entity.HasOne(d => d.FkProductSubCategory)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.FkProductSubCategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_ProductSubCategory");
            });

            modelBuilder.Entity<ProductCategory>(entity =>
            {
                entity.Property(e => e.CategoryPath).HasMaxLength(100);

                entity.Property(e => e.FkSalesCategoryId).HasColumnName("fk_SalesCategoryId");

                entity.Property(e => e.ProductCategoryName).HasMaxLength(50);

                entity.HasOne(d => d.FkSalesCategory)
                    .WithMany(p => p.ProductCategories)
                    .HasForeignKey(d => d.FkSalesCategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductCategories_SalesCategories");
            });

            modelBuilder.Entity<ProductComment>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("ProductComment");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Description).HasMaxLength(1000);

                entity.Property(e => e.FkMemberId).HasColumnName("fk_MemberId");

                entity.Property(e => e.FkProductGroupId).HasColumnName("fk_ProductGroupId");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.HasOne(d => d.FkMember)
                    .WithMany()
                    .HasForeignKey(d => d.FkMemberId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductComment_Members");

                entity.HasOne(d => d.FkProductGroup)
                    .WithMany()
                    .HasForeignKey(d => d.FkProductGroupId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductComment_ProductGroups");
            });

            modelBuilder.Entity<ProductGroup>(entity =>
            {
                entity.Property(e => e.FkColorId).HasColumnName("fk_ColorId");

                entity.Property(e => e.FkProductId)
                    .HasMaxLength(254)
                    .IsUnicode(false)
                    .HasColumnName("fk_ProductId");

                entity.Property(e => e.FkSizeId).HasColumnName("fk_SizeId");

                entity.HasOne(d => d.FkColor)
                    .WithMany(p => p.ProductGroups)
                    .HasForeignKey(d => d.FkColorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductGroups_ColorCategories");

                entity.HasOne(d => d.FkProduct)
                    .WithMany(p => p.ProductGroups)
                    .HasForeignKey(d => d.FkProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductGroups_Products");

                entity.HasOne(d => d.FkSize)
                    .WithMany(p => p.ProductGroups)
                    .HasForeignKey(d => d.FkSizeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductGroups_SizeCategories");
            });

            modelBuilder.Entity<ProductImg>(entity =>
            {
                entity.Property(e => e.FkColorId).HasColumnName("fk_ColorId");

                entity.Property(e => e.FkProductId)
                    .HasMaxLength(254)
                    .IsUnicode(false)
                    .HasColumnName("fk_ProductId");

                entity.Property(e => e.ImgPath).HasMaxLength(100);

                entity.HasOne(d => d.FkColor)
                    .WithMany(p => p.ProductImgs)
                    .HasForeignKey(d => d.FkColorId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK_ProductImgs_ColorCategories");

                entity.HasOne(d => d.FkProduct)
                    .WithMany(p => p.ProductImgs)
                    .HasForeignKey(d => d.FkProductId)
                    .HasConstraintName("FK_ProductImgs_Products");
            });

            modelBuilder.Entity<ProductSubCategory>(entity =>
            {
                entity.Property(e => e.FkProductCategoryId).HasColumnName("fk_ProductCategoryId");

                entity.Property(e => e.ProductSubCategoryName).HasMaxLength(50);

                entity.Property(e => e.SubCategoryPath).HasMaxLength(150);

                entity.HasOne(d => d.FkProductCategory)
                    .WithMany(p => p.ProductSubCategories)
                    .HasForeignKey(d => d.FkProductCategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductSubCategories_ProductCategories");
            });

            modelBuilder.Entity<ProjectTag>(entity =>
            {
                entity.Property(e => e.CreateAt).HasColumnType("datetime");

                entity.Property(e => e.ModifiedAt).HasColumnType("datetime");

                entity.Property(e => e.ProjectTagName).HasMaxLength(30);

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<ProjectTagItem>(entity =>
            {
                entity.HasKey(e => new { e.FkProjectTagId, e.FkProductId })
                    .HasName("PK_discount_group_item");

                entity.Property(e => e.FkProjectTagId).HasColumnName("fk_ProjectTagId");

                entity.Property(e => e.FkProductId)
                    .HasMaxLength(254)
                    .IsUnicode(false)
                    .HasColumnName("fk_ProductId");

                entity.HasOne(d => d.FkProduct)
                    .WithMany(p => p.ProjectTagItems)
                    .HasForeignKey(d => d.FkProductId)
                    .HasConstraintName("FK_discount_group_item_discount_group");
            });

            modelBuilder.Entity<ReservationImg>(entity =>
            {
                entity.ToTable("ReservationImg");

                entity.Property(e => e.ImgPath).HasMaxLength(300);
            });

            modelBuilder.Entity<ReservationStatus>(entity =>
            {
                entity.HasKey(e => e.ReservationId)
                    .HasName("PK__Reservat__B7EE5F244B993FEA");

                entity.HasIndex(e => e.ReservationStatusDescription, "UQ__Reservat__ADF40EA66F20EDD9")
                    .IsUnique();

                entity.Property(e => e.ReservationId).ValueGeneratedNever();

                entity.Property(e => e.ReservationStatusDescription).HasMaxLength(10);
            });

            modelBuilder.Entity<Return>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.Fk訂單).HasColumnName("fk訂單");

                entity.Property(e => e.退貨日期).HasColumnType("datetime");

                entity.HasOne(d => d.Fk訂單Navigation)
                    .WithMany(p => p.Returns)
                    .HasForeignKey(d => d.Fk訂單)
                    .HasConstraintName("FK_Returns_orders");

                entity.HasOne(d => d.退貨理由Navigation)
                    .WithMany(p => p.Returns)
                    .HasForeignKey(d => d.退貨理由)
                    .HasConstraintName("FK_Returns_ReturnResons");
            });

            modelBuilder.Entity<ReturnReson>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.退貨理由)
                    .HasMaxLength(20)
                    .IsFixedLength();
            });

            modelBuilder.Entity<SalesCategory>(entity =>
            {
                entity.Property(e => e.SalesCategoryName).HasMaxLength(50);
            });

            modelBuilder.Entity<ShoesCategory>(entity =>
            {
                entity.Property(e => e.ShoesCategoryName).HasMaxLength(254);
            });

            modelBuilder.Entity<ShoesChoose>(entity =>
            {
                entity.HasKey(e => e.OptionId);

                entity.Property(e => e.OptinName).HasMaxLength(50);
            });

            modelBuilder.Entity<ShoesColorCategory>(entity =>
            {
                entity.HasKey(e => e.ShoesColorId)
                    .HasName("PK__ShoesCol__BB1469D460B507F2");

                entity.Property(e => e.ColorCode).HasMaxLength(100);

                entity.Property(e => e.ColorName).HasMaxLength(50);
            });

            modelBuilder.Entity<ShoesGroup>(entity =>
            {
                entity.Property(e => e.FkCustomerOrderId).HasColumnName("fk_CustomerOrderId");

                entity.Property(e => e.FkMaterialId).HasColumnName("fk_MaterialId");

                entity.Property(e => e.FkOptionId).HasColumnName("fk_OptionId");

                entity.Property(e => e.FkShoesColorId).HasColumnName("fk_ShoesColorId");

                entity.Property(e => e.FkShoesMainId).HasColumnName("fk_ShoesMainId");

                entity.HasOne(d => d.FkCustomerOrder)
                    .WithMany(p => p.ShoesGroups)
                    .HasForeignKey(d => d.FkCustomerOrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ShoesGroups_ShoesOrders");

                entity.HasOne(d => d.FkMaterial)
                    .WithMany(p => p.ShoesGroups)
                    .HasForeignKey(d => d.FkMaterialId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ShoesGroups_Customized_materials");

                entity.HasOne(d => d.FkOption)
                    .WithMany(p => p.ShoesGroups)
                    .HasForeignKey(d => d.FkOptionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ShoesGroups_ShoesChooses");

                entity.HasOne(d => d.FkShoesColor)
                    .WithMany(p => p.ShoesGroups)
                    .HasForeignKey(d => d.FkShoesColorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ShoesGroups_ShoesColorCategories");

                entity.HasOne(d => d.FkShoesMain)
                    .WithMany(p => p.ShoesGroups)
                    .HasForeignKey(d => d.FkShoesMainId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ShoesGroups_CustomizedShoesPo");
            });

            modelBuilder.Entity<ShoesOrder>(entity =>
            {
                entity.Property(e => e.FkShoesSizeId).HasColumnName("fk_ShoesSizeId");

                entity.Property(e => e.Remark).HasMaxLength(300);

                entity.HasOne(d => d.FkShoesSize)
                    .WithMany(p => p.ShoesOrders)
                    .HasForeignKey(d => d.FkShoesSizeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ShoesOrde__fk_Sh__0C50D423");
            });

            modelBuilder.Entity<ShoesPicture>(entity =>
            {
                entity.Property(e => e.ShoesPictureId).HasColumnName("ShoesPicture_Id");

                entity.Property(e => e.FkShoesPictureProductId).HasColumnName("fk_ShoesPictureProduct_Id");

                entity.Property(e => e.ShoesPictureUrl).HasMaxLength(4000);

                entity.HasOne(d => d.FkShoesPictureProduct)
                    .WithMany(p => p.ShoesPictures)
                    .HasForeignKey(d => d.FkShoesPictureProductId)
                    .HasConstraintName("FK__ShoesPict__fk_Sh__70A8B9AE");
            });

            modelBuilder.Entity<ShoesSize>(entity =>
            {
                entity.HasKey(e => e.SizeId)
                    .HasName("PK__ShoesSiz__83BD097ADE4B0F44");

                entity.Property(e => e.SizeName).HasMaxLength(50);
            });

            modelBuilder.Entity<ShoppingCart>(entity =>
            {
                entity.HasKey(e => e.CartId)
                    .HasName("PK_ShoppingCart");

                entity.Property(e => e.FkMemberId).HasColumnName("fk_MemberID");

                entity.HasOne(d => d.FkMember)
                    .WithMany(p => p.ShoppingCarts)
                    .HasForeignKey(d => d.FkMemberId)
                    .HasConstraintName("FK_ShoppingCarts_Members");
            });

            modelBuilder.Entity<SizeCategory>(entity =>
            {
                entity.HasKey(e => e.SizeId);

                entity.Property(e => e.SizeName).HasMaxLength(50);
            });

            modelBuilder.Entity<Speaker>(entity =>
            {
                entity.Property(e => e.FkSpeakerBranchId).HasColumnName("fk_SpeakerBranchId");

                entity.Property(e => e.FkSpeakerFieldId).HasColumnName("fk_SpeakerFieldId");

                entity.Property(e => e.SpeakerDescription).HasMaxLength(500);

                entity.Property(e => e.SpeakerImg)
                    .HasMaxLength(300)
                    .IsUnicode(false);

                entity.Property(e => e.SpeakerName).HasMaxLength(50);

                entity.Property(e => e.SpeakerPhone)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.HasOne(d => d.FkSpeakerBranch)
                    .WithMany(p => p.Speakers)
                    .HasForeignKey(d => d.FkSpeakerBranchId)
                    .HasConstraintName("FK__Speakers__fk_Spe__0F2D40CE");

                entity.HasOne(d => d.FkSpeakerField)
                    .WithMany(p => p.Speakers)
                    .HasForeignKey(d => d.FkSpeakerFieldId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Speakers__fk_Spe__10216507");
            });

            modelBuilder.Entity<SpeakerField>(entity =>
            {
                entity.HasKey(e => e.FieldId)
                    .HasName("PK__SpeakerF__C8B6FF0760FFA445");

                entity.Property(e => e.FieldName).HasMaxLength(50);
            });

            modelBuilder.Entity<Staff>(entity =>
            {
                entity.Property(e => e.Account)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Birthday).HasColumnType("date");

                entity.Property(e => e.ConfirmCode)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.DueDate)
                    .HasColumnType("date")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Email).HasMaxLength(300);

                entity.Property(e => e.FkDepartmentId).HasColumnName("fk_DepartmentId");

                entity.Property(e => e.FkPermissionsId).HasColumnName("fk_PermissionsId");

                entity.Property(e => e.FkTitleId).HasColumnName("fk_TitleId");

                entity.Property(e => e.Mobile)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Name).HasMaxLength(30);

                entity.Property(e => e.Password)
                    .HasMaxLength(70)
                    .IsUnicode(false);

                entity.HasOne(d => d.FkDepartment)
                    .WithMany(p => p.Staff)
                    .HasForeignKey(d => d.FkDepartmentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Staffs__fk_Depar__74794A92");

                entity.HasOne(d => d.FkPermissions)
                    .WithMany(p => p.Staff)
                    .HasForeignKey(d => d.FkPermissionsId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Staffs__fk_Permi__756D6ECB");

                entity.HasOne(d => d.FkTitle)
                    .WithMany(p => p.Staff)
                    .HasForeignKey(d => d.FkTitleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Staffs__fk_Title__76619304");
            });

            modelBuilder.Entity<StaffPermission>(entity =>
            {
                entity.HasKey(e => e.PermissionsId)
                    .HasName("PK__StaffPer__1EDAF9A81349059A");

                entity.HasIndex(e => e.LevelName, "UQ__StaffPer__9EF3BE7B6829F02D")
                    .IsUnique();

                entity.Property(e => e.LevelName).HasMaxLength(30);
            });

            modelBuilder.Entity<Supplier>(entity =>
            {
                entity.HasIndex(e => e.SupplierCompanyNumber, "UQ__Supplier__AE8E9B419ACC6BEC")
                    .IsUnique();

                entity.Property(e => e.SupplierCompanyAddress).HasMaxLength(250);

                entity.Property(e => e.SupplierCompanyEmail).HasMaxLength(250);

                entity.Property(e => e.SupplierCompanyName).HasMaxLength(50);

                entity.Property(e => e.SupplierStartDate).HasColumnType("datetime");

                entity.Property(e => e.SupplyMaterial)
                    .HasMaxLength(50)
                    .HasColumnName("Supply_Material");
            });

            modelBuilder.Entity<Type>(entity =>
            {
                entity.ToTable("Type");

                entity.Property(e => e.TypeName).HasMaxLength(20);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
