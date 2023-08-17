using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Member
    {
        public Member()
        {
            CouponSendings = new HashSet<CouponSending>();
            CustomizedOrders = new HashSet<CustomizedOrder>();
            Favorites = new HashSet<Favorite>();
            OneToOneReservations = new HashSet<OneToOneReservation>();
            Orders = new HashSet<Order>();
            PointHistories = new HashSet<PointHistory>();
            PointTradeIns = new HashSet<PointTradeIn>();
            ShoppingCarts = new HashSet<ShoppingCart>();
        }

        public int MemberId { get; set; }
        public string Name { get; set; } = null!;
        public byte? Age { get; set; }
        public bool? Gender { get; set; }
        public string Mobile { get; set; } = null!;
        public string Email { get; set; } = null!;
        public DateTime? Birthday { get; set; }
        public string? CommonAddress { get; set; }
        public string Account { get; set; } = null!;
        public string EncryptedPassword { get; set; } = null!;
        public DateTime? Registration { get; set; }
        public bool? IsConfirmed { get; set; }
        public string? ConfirmCode { get; set; }
        public bool? IsSubscribeNews { get; set; }
        public int FkLevelId { get; set; }
        public int? FkBlackListId { get; set; }

        public virtual BlackList? FkBlackList { get; set; }
        public virtual MembershipLevel FkLevel { get; set; } = null!;
        public virtual AlternateAddress? AlternateAddress { get; set; }
        public virtual MemberPoint? MemberPoint { get; set; }
        public virtual ICollection<CouponSending> CouponSendings { get; set; }
        public virtual ICollection<CustomizedOrder> CustomizedOrders { get; set; }
        public virtual ICollection<Favorite> Favorites { get; set; }
        public virtual ICollection<OneToOneReservation> OneToOneReservations { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<PointHistory> PointHistories { get; set; }
        public virtual ICollection<PointTradeIn> PointTradeIns { get; set; }
        public virtual ICollection<ShoppingCart> ShoppingCarts { get; set; }
    }
}
