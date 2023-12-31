﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace EFModels.Models
{
    public partial class Member
    {
        public Member()
        {
            CouponSendings = new HashSet<CouponSending>();
            CustomizedOrders = new HashSet<CustomizedOrder>();
            Favorites = new HashSet<Favorite>();
            MemberImgs = new HashSet<MemberImg>();
            OneToOneReservations = new HashSet<OneToOneReservation>();
            PointHistories = new HashSet<PointHistory>();
            PointTradeIns = new HashSet<PointTradeIn>();
            ProductComments = new HashSet<ProductComment>();
            ReservationReviews = new HashSet<ReservationReview>();
            ShoppingCarts = new HashSet<ShoppingCart>();
            orders = new HashSet<order>();
        }

        public int MemberId { get; set; }
        public string Name { get; set; }
        public byte? Age { get; set; }
        public bool? Gender { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public DateTime? Birthday { get; set; }
        public string CommonAddress { get; set; }
        public string Account { get; set; }
        public string EncryptedPassword { get; set; }
        public DateTime? Registration { get; set; }
        public bool? IsConfirmed { get; set; }
        public string ConfirmCode { get; set; }
        public bool? IsSubscribeNews { get; set; }
        public int fk_LevelId { get; set; }
        public int? fk_BlackListId { get; set; }

        public virtual BlackList fk_BlackList { get; set; }
        public virtual MembershipLevel fk_Level { get; set; }
        public virtual AlternateAddress AlternateAddress { get; set; }
        public virtual MemberPoint MemberPoint { get; set; }
        public virtual ICollection<CouponSending> CouponSendings { get; set; }
        public virtual ICollection<CustomizedOrder> CustomizedOrders { get; set; }
        public virtual ICollection<Favorite> Favorites { get; set; }
        public virtual ICollection<MemberImg> MemberImgs { get; set; }
        public virtual ICollection<OneToOneReservation> OneToOneReservations { get; set; }
        public virtual ICollection<PointHistory> PointHistories { get; set; }
        public virtual ICollection<PointTradeIn> PointTradeIns { get; set; }
        public virtual ICollection<ProductComment> ProductComments { get; set; }
        public virtual ICollection<ReservationReview> ReservationReviews { get; set; }
        public virtual ICollection<ShoppingCart> ShoppingCarts { get; set; }
        public virtual ICollection<order> orders { get; set; }
    }
}